class Github::Gist
    def list
        require "net/http"
        require "uri"
        require "json"
        user_name = ENV["GITHUB_USER_NAME"]
        password = ENV["GITHUB_PASSWORD"]

        uri = URI.parse("https://api.github.com/users/yukpiz/gists")

        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)
        request.basic_auth(user_name, password)

        response = nil
        begin
            response = https.request(request)
            message = "#{response.code} #{response.body}"
            raise message if response.code != "200"
            return JSON.parse(response.body)
        rescue Exception => e
            puts e
        end
    end

    def import
        gists = self.list
        return if !gists

        Gisthead.all.delete

        gists.each do |row|
            files = row["files"]

            gistfiles = []
            files.each do |key, value|

                gistfile = Gistfile.new(
                    filename: value["filename"],
                    type: value["type"],
                    language: value["language"],
                    raw_url: value["raw_url"],
                    size: value["size"],
                )

                gistfiles.push(gistfile)
            end

            Gisthead.create!({
                gist_id: row["id"],
                url: row["url"],
                html_url: row["html_url"],
                description: row["description"],
                comment: row["comment"],
                public: row["public"],
                created: row["created_at"],
                updated: row["updated_at"],
                gistfiles: gistfiles,
            })
        end
    end

    def convert
        Article.all.delete

        Gisthead.all.each do |gisthead|
            gisthead[:gistfiles].each do |gistfile|
                #Not a markdown file
                next if gistfile[:language] != "Markdown"

                #<!--meta
                #  title: {BLOG TITLE}\n
                #  tags: {tag1},{tag2},{tag3}\n
                #  posted: {POST DATE}\n
                #  activate: {true or false}\n
                #-->
                markdown = download(gistfile[:raw_url])
                meta = parse2meta(markdown)
                next if !meta
                next if meta.has_key?("title")
                next if meta.has_key?("tags")
                next if meta.has_key?("posted")
                next if meta.has_key?("activate")

                html = md2html(markdown)

                Article.create!({
                    gist_id: gisthead[:gist_id],
                    title: meta[:title],
                    tags: meta[:tags],
                    posted: meta[:posted],
                    activate: meta[:activate],
                    source: gisthead[:url],
                    html: html,
                })
            end
        end
    end

    def download(raw_url)
        require "open-uri"
        contents = []
        open(raw_url) do |data|
            contents.push(data.read)
        end
        contents.join("\n")
    end

    def md2html(markdown)
        require "redcarpet"
        parse = Redcarpet::Markdown.new(
            Redcarpet::Render::HTML,
            autolink: true,
            tables: true,
            fenced_code_blocks: true,
            highlight: true,
        )

        parse.render(markdown)
    end

    def html2object(html)
        require "nokogiri"
        doc = Nokogiri::HTML.parse(html)
    end

    def parse2meta(markdown)
        matched = markdown.scan(/\<\!\-\-meta(?<target1>[\W\w]+)\-\-\>/)
        return nil if matched == []

        meta = {}

        matched[0][0].split("\n").each do |breaked|
            breaked.strip!
            next if breaked.empty?

            splited = breaked.split(":")
            next if splited.length != 2

            key = splited[0].strip
            case key
            when "title"
                meta[:title] = splited[1].strip
            when "tags"
                tags = []
                splited[1].split(",").each do |tag|
                    tag.strip!
                    next if tag.empty?
                    tags.push(tag)
                end
                meta[:tags] = tags
            when "posted"
                dates = splited[1].strip.split("-")
                next if dates.length != 3
                meta[:posted] = "%04d-%02d-%02d" % [
                    dates[0].to_i,
                    dates[1].to_i,
                    dates[2].to_i,
                ]
            when "activate"
                meta[:activate] = splited[1].strip.downcase == "true" ? true : false
            end
        end

        return meta
    end
end
