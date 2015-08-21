$ ->
    sub_click = false
    $(".article-tag").click ->
        sub_click = true
        host = location.host
        tag = $(@).attr("tag")
        url = "http://" + host + "/tags/" + tag
        window.location = url

    $(".article-posted").click ->
        sub_click = true
        host = location.host
        posted = $(@).attr("posted")
        url = "http://" + host + "/date/" + posted
        window.location = url

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

    $(".link-enable").click ->
        host = location.host
        page = $(@).attr("tag")
        window.location = page
