<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Figuras</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>
<div class="p-5 text-white text-center" style="background-color:#33AD86;">
  <h1>DIBUJA TUS FIGURAS</h1>
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="/AccesoUsuarios">Iniciar sesión</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/home">Crear Figura</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/historialFigura">Tu historial</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/historialOtros">Otras Figuras</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/registroUsuario">Registrate</a>
      </li>
    </ul>
  </div>
</nav>
</header>

<main>
<div class="container-fluid mt-5">
  <div class="row">
    <div class="col-sm-3">
        <h3>Información configuración</h3>
      	<div style="background-color:#33AD86; color:#fff;">
       	   <ul class="list-group">
  			<li class="list-group-item active" style="background-color:#33AD86; color:#fff;border:2px solid #33AD86;">${tipoFigura}</li>
 		    <li class="list-group-item">Tamaño: ${grandor} </li>
  			<li class="list-group-item">Coordenada X: ${coordX}</li>
  			<li class="list-group-item">Coordenada Y: ${coordY} </li>
  			<li class="list-group-item">Color Fondo: ${colorFondo} </li>
  			<li class="list-group-item">Color Borde: ${colorBorde}</li>
			</ul>
        </div>
    </div>
    <div class="col-sm-9">
      <h2>Nombre: ${nombreFigura} </h2>
      <h5>Fecha: ${fechaCreacion}</h5>
      <canvas width="1024" height="768" style="border:2px solid #33AD86;" id="canvas"></canvas>
    </div>
  </div>
</div>
</main>
<footer>
	<div class=" p-4 bg-dark text-white text-center">
 	 <p>Copyright © 2020. All rights reserved. @milagrosKarimChoqueCondori</p>
	</div>
</footer>
 <script>
         const canvas = document.getElementById("canvas");
         var ctx = canvas.getContext("2d");

         let tipoFigura = '${tipoFigura}';
         let grandor= '${grandor}';
         let coordX= '${coordX}';
         let coordY= '${coordY}';
         let colorFondo = '${colorFondo}';
         let colorBorde = '${colorBorde}';




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
 }
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
}

function pentagono(coordX, coordY, grandor, rotation,colorBorde,colorFondo){
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
}

function estrella(context,n,grandor,R,x,y,lwid,colorBorde,colorFondo) {
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
}

  switch(tipoFigura) {
     case "circulo":
          circulo(colorBorde, colorFondo,coordX,coordY,grandor);
       break;
     case "cuadrado":
         cuadrado(colorBorde, colorFondo,coordX,coordY,grandor);
       break;
     case "triangulo":
         triangulo(colorBorde,colorFondo,coordX,coordY,grandor);
         break;
     case "pentagono":
         pentagono(coordX,coordY,grandor,-Math.PI / 2,colorBorde,colorFondo);
         break;
     case "estrella":
         estrella(ctx,7,grandor,grandor / 2,coordX,coordY,10,colorBorde,colorFondo);
         break;
     default:
         console.log("no has seleccionado nada");
   }

  </script>


</body>
</html>