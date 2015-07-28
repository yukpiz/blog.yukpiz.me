$ ->
    $(".topic-accordion .topic-toggle").click ->
        $(@).next("ul").slideToggle(400)
        $(@).toggleClass("open")
        if not $(@).hasClass("toggle-open")
            $(@).addClass("toggle-open")
        else
            $(@).removeClass("toggle-open")

    $(".back-picture").bgswitcher ({
        images: [
            "/assets/back00.jpg",
            "/assets/back01.jpg",
            "/assets/back02.jpg",
            "/assets/back03.jpg",
            "/assets/back04.jpg",
        ],
        interval: 6000,
        duration: 5000,
        loop: true

    })
