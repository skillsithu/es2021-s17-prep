<?php

add_action('login_head', 'login_style');

function login_style() {
    ?>
    <style>
        .login h1 a {
            background-image: url("http://localhost/ws2017_day1/wp-content/uploads/2021/08/GFE_Logo.png") !important;
            width: 320px !important;
            background-size: contain !important;
        }
    </style>
    <?php
}

add_shortcode('countdown_c', 'countdown_c');

function countdown_c() {
    ob_start();
    ?>
    <div id="countdown_c"></div>
    <script>
        if (!window.__alma__) {
            window.__alma__ = true;
            var final = new Date("<?php the_field('start_date') ?>");
            var most = new Date();
            var left = new Date();
            left.setTime(final.getTime() - most.getTime());

            function print_date() {
                var asdasd = document.querySelector("#countdown_c");
                asdasd.innerHTML = `
                    <span>${left.getMonth() + 1} months</span>
                    <span>${left.getDay()} days</span>
                    <span>${left.getHours()} hours</span>
                    <span>${left.getMinutes()} minutes</span>
                    <span>${left.getSeconds()} seconds</span>`;
                left.setTime(left.getTime() - 1000);

                setTimeout(function () {
                    print_date();
                }, 1000);
            }

            print_date();
        }
    </script>
    <?php
    return ob_get_clean();
}
