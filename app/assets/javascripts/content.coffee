$ ->
    $(".twitter-button").click ->
        id = $(".meta").attr("gist_id")
        title = $(".meta").attr("title")
        title = "【" + title + "】 from yuklog."
        url = "https://twitter.com/share?" +
        "&url=" + "http://blog.yukpiz.me/article/" + id +
        "&text=" + title
        window.open(url, null, "width=500, height=300")
