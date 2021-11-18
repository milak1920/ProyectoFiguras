 const circulo = function (colorBorde, colorFondo,coordX,coordY, grandor){
     var X = coordX/2;
     var Y = coordY/2;
     var r = grandor;
     ctx.strokeStyle = colorBorde;
     ctx.fillStyle = colorFondo;
     ctx.lineWidth = 5;
     ctx.arc(X,Y,r,0,2*Math.PI);
     ctx.fill();
     ctx.stroke();
 };
 const cuadrado = function(colorBorde, colorFondo,coordX,coordY,grandor){
     ctx.lineWidth = 5;
     ctx.strokeStyle = colorBorde;
     ctx.fillStyle = colorFondo;
     ctx.rect(coordX, coordY, grandor, grandor);
     ctx.stroke();
     ctx.fill();
 };


function drawTriangle(cx, cy, size, color){
    let c = Math.sqrt(Math.pow(size, 2) - Math.pow(size/2, 2));
    ctx.beginPath();
    ctx.moveTo(cx,cy - (c/2));
    ctx.lineTo(cx + (size/2),cy - (c/2) + c);
    ctx.lineTo(cx + (size/2) -size, cy - (c/2) + c);
    ctx.fillStyle = color;
    ctx.fill();
}

const pentagono = function(coordX, coordY, grandor, rotation,colorBorde,colorFondo){
    ctx.beginPath();
    ctx.strokeStyle = colorBorde;
    ctx.fillStyle = colorFondo;
    ctx.lineWidth = 5;
    for(var i = 0; i < 6; i ++){
        const ang = (i / 5) * Math.PI * 2 + rotation;
        ctx.lineTo(
            Math.cos(ang) * grandor + coordX,
            Math.sin(ang) * grandor + coordY
        );
     }
     ctx.fill();
     ctx.stroke();
     ctx.closePath();
};

const estrella = function(context,n,grandor,R,x,y,lwid,colorBorde,colorFondo) {
    ctx.save();
    ctx.lineWidth=lwid;
    ctx.beginPath();
    ctx.strokeStyle = colorBorde;
    ctx.fillStyle = colorFondo;
    ctx.lineWidth = 5;
    ctx.translate(x,y);
    for(var i=0;i<n;i++){
        ctx.lineTo(Math.cos(((1/4 + i)*2*Math.PI/n))*R,-Math.sin(((1/4 + i)*2*Math.PI/n))*R);
        ctx.lineTo(Math.cos(((3/4 + i)*2*Math.PI/n))*grandor,-Math.sin(((3/4 + i)*2*Math.PI/n))*grandor);
    }
    ctx.fill();
    ctx.stroke();
    ctx.closePath();
    ctx.stroke();
    ctx.restore();
};

