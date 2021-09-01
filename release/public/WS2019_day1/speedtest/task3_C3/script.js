window.onload = function() {
    var canvas = document.getElementById('canvas');

    var draw = false;
    var lastEvent;
    var color = "green";

    window.setColor = function(_color) {
        color = _color;
        document.getElementById("color").innerHTML = _color;
    }

    canvas.addEventListener("mousedown", function(event) {
        draw = true;
    })
    canvas.addEventListener("mouseup", function(event) {
        draw = false;
    })
    canvas.addEventListener("mousemove", function(event) {
        if (draw && lastEvent && canvas.getContext) {
            var ctx = canvas.getContext('2d');
            ctx.fillStyle = 'rgb(200, 0, 0)';
            ctx.beginPath();
            ctx.moveTo(lastEvent.offsetX, lastEvent.offsetY);
            ctx.lineTo(event.offsetX + 1, event.offsetY + 1);
            ctx.strokeStyle = color;
            ctx.lineWidth = 2;
            ctx.stroke();
            ctx.closePath();
        }
        
        lastEvent = { offsetX: event.offsetX, offsetY: event.offsetY};
    })
}