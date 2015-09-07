xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"

host = request.host_with_port

xml.rss(
    "version" => "2.0",
) do
    xml.channel do
        xml.title @feed_title
        xml.link(request.protocol + request.host_with_port)
        xml.language "ja-ja"
        xml.description @feed_description

        @articles.each do |article|
            xml.item do
                xml.title(article.title)
                xml.link(request.protocol +
                         request.host_with_port +
                         "/article/" + article.gist_id)
                xml.guid(request.protocol +
                         request.host_with_port +
                         "/article/" + article.gist_id)
                xml.description("Contents of article.")
                xml.pubDate(article.created_at.to_s(:rfc822))
                xml.author "yukpiz@gmail.com (Yuuki Zayasu)"
            end
        end
    end
end

