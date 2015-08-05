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
        url = "article/" + id
        window.location = url

    emoticons = [
        "icon-emo-happy",
        "icon-emo-wink",
        "icon-emo-wink2",
        "icon-emo-unhappy",
        "icon-emo-sleep",
        "icon-emo-thumbsup",
        "icon-emo-tongue",
        "icon-emo-coffee",
        "icon-emo-grin",
        "icon-emo-laugh",
    ]
    $(".random_emoticon").each ->
        random = Math.round(Math.random() * 9)
        $(@).addClass emoticons[random]

