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
        <a class="nav-link" href="/inside/home">Crear Figura</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/inside/historialFigura">Tu historial</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/inside/historialOtros">Otras Figuras</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/registroUsuario">Registrate</a>
      </li>
    </ul>
  </div>
</nav>
</header>
<main>
  <div class="container-fluid">
    <div class="row">
       <div class="col-sm-3" style="background-color:#33AD86; color:#fff;">
    	    <h2 style="color:#fff;" class="text-center">Formulario</h2>
            <form action="/inside/home" method="post" id="form">
             <label>Tipo de figura:</label>
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="tipoFigura" id="tipoFigura">
                    <option value="circulo">Circulo</option>
                    <option value="cuadrado">Cuadrado</option>
                    <option value="triangulo">Triangulo</option>
                    <option value="pentagono">Pentagon</option>
                    <option value="estrella">Estrella</option>
                </select>
                <div class="mb-3">
     			    <label>Nombre Figura:</label>
                    <input class="form-control" type="text" name="nombreFigura" id="nombreFigura">
                    <c:if test="${not empty errorNombreFigura}">
                        <div>
                            <div class="alert alert-danger" role="alert">
                                ${errorNombreFigura}
                            </div>
                        </div>
                    </c:if>
                    <div id="nombreFigura-error" role="alert"></div>
                </div>
                <div class="mb-3">
     			    <label>Tamaño Figura:</label>
     			    <input class="form-control" type="text" name="grandor" id="grandor">
                    <c:if test="${not empty errorGrandor}">
                        <div>
                            <div class="alert alert-danger" role="alert">
                                ${errorGrandor}
                            </div>
                        </div>
                    </c:if>
     			     <div id="grandor-error" role="alert"></div>
                </div>
                <div class="mb-3">
     			    <label>Coordenada X:</label>
     			    <input class="form-control" type="text" name="coordX" id="coordX">
                    <c:if test="${not empty errorCoordX}">
                        <div>
                            <div class="alert alert-danger" role="alert">
                                ${errorCoordX}
                            </div>
                        </div>
                    </c:if>
                    <div id="coordX-error" role="alert"></div>
                </div>
                <div class="mb-3">
     			    <label>Coordenada Y:</label>
     			    <input class="form-control" type="text" name="coordY" id="coordY">
                    <c:if test="${not empty errorCoordY}">
                        <div>
                            <div class="alert alert-danger" role="alert">
                                ${errorCoordY}
                            </div>
                        </div>
                    </c:if>
                     <div id="coordY-error" role="alert"></div>
                </div>
                <div class="mb-3">
     			    <label>Color Fondo:</label>
     			    <input class="form-control" type="color" name="colorFondo" id="colorFondo">
                </div>
                <div class="mb-3">
     			    <label>Color Borde:</label>
     			    <input class="form-control" type="color" name="colorBorde" id="colorBorde">
                </div>
                <input type="submit" value="guardar" class="btn btn-primary">
                <input class="btn btn-light" type="button" value="Verificar" onclick="validate()"/>
             </form>
            <c:if test="${not empty mensaje}">
                <div>
                    <div class="alert alert-dark mt-2" role="alert">
                                ${mensaje}
                    </div>
                </div>
            </c:if>
            <form action="/home" method="get">
                 <input class="btn btn-dark" type="submit" value="borrar" name="borrar">
            </form>

  	   </div>
       <div class="col-sm-9">
         <h2>Lienzo</h2>
         <canvas width="1024" height="768" style="border:2px solid #33AD86;" id="canvas"></canvas>
       <div>
    </div>
  </div>
</main>

<footer>
	<div class=" p-4 bg-dark text-white text-center">
 	 <p>Copyright © 2020. All rights reserved. @milagrosKarimChoqueCondori</p>
	</div>
</footer>



<script>

 let borrar = '${limpiar}';
 if (borrar === ""){
    console.log("borrar");
 }

function validate() {
   const canvas = document.getElementById("canvas");
   var ctx = canvas.getContext("2d");
   let tipoFigura = document.getElementById("tipoFigura").value;
   let nombreFigura = document.getElementById("nombreFigura").value;
   let grandor = document.getElementById("grandor").value;
   let coordX = document.getElementById("coordX").value;
   let coordY = document.getElementById("coordY").value;
   let colorFondo = document.getElementById("colorFondo").value;
   let colorBorde = document.getElementById("colorBorde").value;


   if (nombreFigura === ""){
         document.getElementById('nombreFigura-error').className = 'alert alert-primary mt-2';
         document.getElementById("nombreFigura-error").innerHTML = "** Se genera un nombre aleatorio";
   }
   valorGrandor = parseInt(grandor)
   if (grandor === "" || isNaN(valorGrandor)){
        document.getElementById('grandor-error').className = 'alert alert-danger mt-2';
        document.getElementById("grandor-error").innerHTML = "** El valor esta vacio o no es númerico";
   }
   valorcoordX = parseInt(coordX)
   if (coordX === "" || isNaN(valorcoordX)){
        document.getElementById('coordX-error').className = 'alert alert-danger mt-2';
        document.getElementById("coordX-error").innerHTML = "** El valor esta vacio o no es númerico";
   }
   valorcoordY = parseInt(coordY)
   if (coordY === "" || isNaN(valorcoordY)){
        document.getElementById('coordY-error').className = 'alert alert-danger mt-2';
        document.getElementById("coordY-error").innerHTML = "** El valor esta vacio o no es númerico";
   }


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



}

</script>
</body>
</html>