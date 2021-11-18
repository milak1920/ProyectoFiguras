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

                    <option value="circulo" <c:if test="${pintarFigura.tipoFigura == 'circulo'}">selected="selected"</c:if>>Circulo</option>
                    <option value="cuadrado" <c:if test="${pintarFigura.tipoFigura == 'cuadrado'}">selected="selected"</c:if>>Cuadrado</option>
                    <option value="triangulo" <c:if test="${pintarFigura.tipoFigura == 'triangulo'}">selected="selected"</c:if>>Triangulo</option>
                    <option value="pentagono" <c:if test="${pintarFigura.tipoFigura == 'pentagono'}">selected="selected"</c:if>>Pentagon</option>
                    <option value="estrella" <c:if test="${pintarFigura.tipoFigura == 'estrella'}">selected="selected"</c:if>>Estrella</option>
                </select>
                <div class="mb-3">
     			    <label>Nombre Figura:</label>
                    <input class="form-control" type="text" name="nombreFigura" id="nombreFigura" value="${pintarFigura.nombreFigura}">
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
     			    <input class="form-control" type="text" name="grandor" id="grandor" value="${pintarFigura.grandor}">
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
     			    <input class="form-control" type="text" name="coordX" id="coordX" value="${pintarFigura.coordX}">
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
     			    <input class="form-control" type="text" name="coordY" id="coordY" value="${pintarFigura.coordY}"  >
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
     			    <input class="form-control" type="color" name="colorFondo" id="colorFondo" value="${pintarFigura.colorFondo}">
                </div>
                <div class="mb-3">
     			    <label>Color Borde:</label>
     			    <input class="form-control" type="color" name="colorBorde" id="colorBorde"  value="${pintarFigura.colorBorde}">
                </div>
               <input type="submit" value="guardar"  class="btn btn-primary">
               <input type="submit" value="Visualizar"  formaction="/inside/home" formmethod="get"   class="btn btn-primary">
             </form>
            <c:if test="${not empty mensaje}">
                <div>
                    <div class="alert alert-dark mt-2" role="alert">
                                ${mensaje}
                    </div>
                </div>
            </c:if>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js"></script>

<script>

   const canvas = document.getElementById("canvas");
   let ctx = canvas.getContext("2d");


        let nombreFigura = "${pintarFigura.nombreFigura}";
        let tipoFigura = "${pintarFigura.tipoFigura}";
        let grandor = Number("${pintarFigura.grandor}");
        let coordX = Number("${pintarFigura.coordX}");
        let coordY = Number("${pintarFigura.coordY}");
        let colorFondo = "${pintarFigura.colorFondo}"
        let colorBorde = "${pintarFigura.colorBorde}";



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