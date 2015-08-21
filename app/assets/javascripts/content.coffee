$ ->
    $(".twitter-button").click ->
        id = $(".meta").attr("gist_id")
        title = $(".meta").attr("title")
        title = "【" + title + "】 from yuklog."
        url = "https://twitter.com/share?" +
        "&url=" + "http://blog.yukpiz.me/article/" + id +
        "&text=" + title
        window.open(url, null, "width=500, height=400")

    $(".facebook-button").click ->
        id = $(".meta").attr("gist_id")
        url = "https://www.facebook.com/sharer/sharer.php?" +
        "u=http://blog.yukpiz.me/article/" + id
        window.open(url, null, "width=500, height=400")

    $(".gplus-button").click ->
        id = $(".meta").attr("gist_id")
        url = "https://plus.google.com/share?" +
        "url=http://blog.yukpiz.me/article/" + id
        window.open(url, null, "width=500, height=400")
