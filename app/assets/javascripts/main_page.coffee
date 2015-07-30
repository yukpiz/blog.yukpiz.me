$ ->
    $(".topic-accordion .topic-toggle").click ->
        $(@).next("ul").slideToggle(400)
        $(@).toggleClass("open")
        if not $(@).hasClass("toggle-open")
            $(@).addClass("toggle-open")
        else
            $(@).removeClass("toggle-open")

