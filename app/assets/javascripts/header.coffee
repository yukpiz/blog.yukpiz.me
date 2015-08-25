$ ->
    $(document).ready ->
        weeks = ["Sun", "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat"]
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        timer1 = setInterval ->
            d = new Date()
            date_str =
                weeks[d.getDay()] + " " +
                months[d.getMonth()] + " " +
                d.getDate() + " " +
                d.getHours() + ":" +
                d.getMinutes() + ":" +
                ("0" + d.getSeconds()).slice(-2) + " JST " +
                d.getFullYear()
            $(".now-time").html(date_str)
        , 1000

        timer2 = setInterval ->
            if $(".prompt").css("display") == "inline"
                $(".prompt").css("display", "none")
            else
                $(".prompt").css("display", "inline")
        , 650

        rand = Math.floor(Math.random() * 101)
        $(".random-memory").html(rand)

        if rand >= 95
            rand = Math.floor(Math.random() * 51)
        else
            rand = 0
        $(".random-swap").html(rand)

    $(".home-title").click ->
        location.href = "/"

    $(".link-license").click ->
        location.href = "/article/15c8ea6c20e3eeca86bc"

    $(".link-gist").click ->
        location.href = "https://gist.github.com/yukpiz"

    $(".link-repos").click ->
        location.href = "https://github.com/yukpiz/blog.yukpiz.me"

    $(".link-twitter").click ->
        location.href = "https://twitter.com/yukpiz"
