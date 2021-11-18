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
<div class="container-fluid mt-5">
  <div class="row">
    <div class="col-sm-3">
        <h3>Información configuración</h3>
      	<div style="background-color:#33AD86; color:#fff;">
       	   <ul class="list-group">
  			<li id="tipoFigura" class="list-group-item active" style="background-color:#33AD86; color:#fff;border:2px solid #33AD86;">${tipoFigura} </li>
 		    <li class="list-group-item">${grandor} </li>
  			<li class="list-group-item">${coorX} </li>
  			<li class="list-group-item">${coorY}  </li>
  			<li class="list-group-item">${colorFondo}  </li>
  			<li class="list-group-item">${colorBorde} </li>
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
 	 <p>Copyright © 2020. All rights reserved. @MilagrosKarimChoqueCondori</p>
	</div>
</footer>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js"></script>
<script>


   const canvas = document.getElementById("canvas");
   let ctx = canvas.getContext("2d");

        let tipoFigura = "${tipoFigura}";
        let grandor = Number("${grandor}");
        let coordX = Number("${coorX}");
        let coordY = Number("${coorY}");
        let colorFondo = "${colorFondo}"
        let colorBorde = "${colorBorde}";


         switch(tipoFigura) {
          case "circulo":
               circulo(colorBorde, colorFondo,coordX,coordY,grandor);
               break;
          case "cuadrado":
               cuadrado(colorBorde, colorFondo,coordX,coordX,grandor);
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