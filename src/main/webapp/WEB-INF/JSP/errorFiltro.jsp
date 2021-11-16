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
 	<section>
 	  		<div class="container pt-5">
       			<div class="row">
        				 <div class="col-sm-6">
        		  			<img src="https://i.pinimg.com/564x/8a/f9/10/8af910f93406671e0b8d5a3c7d5413ab.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;"/>
         			 </div>
         			 <div class="col-sm-4">
                      	<h1>Error 403</h1>
                    		  <div class="alert alert-danger" role="alert">
        							<p>Sin permiso para acceder</p>
        							<p>Requiere iniciar sesión para ingresar</p>
     					  </div>
                           <a href="/AccesoUsuarios" type="button" class="btn btn-primary">Iniciar Sesión</a>
          			 </div>
                  </div>
     		</div>
	</section>
</main>
<footer>
	<div class=" p-4 bg-dark text-white text-center">
 	 <p>Copyright © 2020. All rights reserved. @milagrosKarimChoqueCondori</p>
	</div>
</footer>
 </body>
</html>