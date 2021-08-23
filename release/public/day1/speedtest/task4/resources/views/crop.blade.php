@extends('app')

@section('content')
    <div style="position: relative">
        <img src="{{ $url }}" alt="crop" id="cropimg" style="width: 100%" />
        <canvas id="cropcanvas"></canvas>
        <div style="position: absolute; border: 2px dotted red; background: rgba(0,0,0,0.5); display: none" id="rectangle"></div>
    </div>
    <button id="submitbtn" style="font-size: 32px">Crop</button>

    <form method="post" action="" id="form">
        @csrf
        <input type="hidden" name="filen" id="filen" />
        <input type="hidden" name="params" id="params" />
    </form>

    <script>
        let from, to, params;
        jQuery("#cropimg").on("load", function () {
            jQuery("#cropcanvas").width(jQuery("#cropimg").width())
            jQuery("#cropcanvas").height(jQuery("#cropimg").height())

            const canvas = document.getElementById('cropcanvas');
            canvas.width = jQuery("#cropimg").width()
            canvas.height = jQuery("#cropimg").height()

            const ctx = canvas.getContext('2d');
            const image = document.getElementById("cropimg");
            image.width = jQuery("#cropimg").width()
            image.height = jQuery("#cropimg").height()

            ctx.drawImage(image, 0, 0);

            jQuery("#cropimg").css("display", "none");
        })
        jQuery("#cropcanvas").click(function(event) {
            if (!from || !!to) {
                from = {
                    x: event.offsetX,
                    y: event.offsetY
                }
                to = undefined;
                params = undefined;
                jQuery("#rectangle").css("display", "none");
            } else {
                to = {
                    x: event.offsetX,
                    y: event.offsetY
                }

                params = {
                    width: Math.abs(from.x - to.x),
                    height: Math.abs(from.y - to.y),
                    x: from.x < to.x ? from.x : to.x,
                    y: from.y < to.y ? from.y : to.y,
                };

                jQuery("#rectangle").css({
                    display: "block",
                    width: params.width,
                    height: params.height,
                    top: params.y,
                    left: params.x
                });
            }
        })
        jQuery("#submitbtn").click(function(event) {
            if (!!params) {
                jQuery("#params").val(JSON.stringify(params));

                const canvas = document.getElementById('cropcanvas');
                const ctx = canvas.getContext('2d');

                ctx.clearRect(0, 0, canvas.width, canvas.height)

                ctx.beginPath();
                // php oldalon nem megy a imagecrop függvény
                ctx.rect(params.x, params.y, params.width, params.height);
                ctx.clip();

                const image = document.getElementById("cropimg");
                ctx.drawImage(image, 0, 0);


                jQuery("#filen").val(canvas.toDataURL());

                jQuery("#form").submit();
            }
        })
    </script>
@endsection
