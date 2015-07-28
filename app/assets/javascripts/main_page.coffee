$ ->
    $(".topic-accordion .topic-toggle").click ->
        $(this).next("ul").slideToggle(400)
        $(this).toggleClass("open")
