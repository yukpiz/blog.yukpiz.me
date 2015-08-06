$ ->
    sub_click = false
    $(".article-tag").click ->
        sub_click = true
        window.location = "/"

    $(".article-posted").click ->
        sub_click = true
        window.location = "/"

    $(".article-link").click ->
        return if sub_click
        host = location.host
        id = $(@).find(".article-id").html()
        url = "http://" + host + "/article/" + id
        window.location = url

    $(".link-page").click ->
        host = location.host
        page = $(@).attr("tag")
        window.location = page
