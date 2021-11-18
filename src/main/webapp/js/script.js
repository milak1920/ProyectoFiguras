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



const triangulo = function(colorBorde,colorFondo,coordX,coordY,grandor){
    let sWidth = coordX;
    let sHeight = coordY;
    ctx.beginPath();
    ctx.lineWidth = 5;
    ctx.strokeStyle = colorBorde;
    ctx.fillStyle = colorFondo;
    ctx.moveTo((sWidth/2)+grandor,sHeight/2);
    ctx.lineTo((sWidth/2),(sHeight/2)-grandor);
    ctx.lineTo((sWidth/2)-grandor,sHeight/2);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
};