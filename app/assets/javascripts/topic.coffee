$ ->
    $(".article-link").click ->
        host = location.host
        id = $(@).find(".article-id").html()
        url = "article/" + id
        window.location = url
