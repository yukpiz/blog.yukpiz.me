xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"

host = request.host_with_port

xml.rss(
    "version" => "2.0",
    "xmlns:dc" => "http://purl.org/dc/elements/1.1"
) do
    xml.channel do
        xml.title @feed_title
        xml.link(request.protocol + request.host_with_port)
        xml.language "ja-ja"
        xml.pubDate(Time.now.strftime("%a, %d %b %Y %H:%M:%S %Z"))

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
                xml.pubDate(article.created_at)
                xml.author "yukpiz@gmail.com"
            end
        end
    end
end

