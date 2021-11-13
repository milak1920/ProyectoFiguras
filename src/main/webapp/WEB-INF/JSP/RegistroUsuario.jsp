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
  <main>
 	<section>
 		<div class="container pt-5">
  			<div class="row">
   				 <div class="col-sm-6">
   		  			<img src="https://cdn.dribbble.com/users/1322388/screenshots/5315523/media/8c3ec49124ab76cca60d831bb0a59085.jpg?compress=1&resize=1200x900" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;"/>
    			 </div>
    			 <div class="col-sm-4">
    			 	<div class="col-sm-12 d-flex justify-content-center">
                    	<h1 class="text-center">Registrarse </h1>
         			</div>
        			<div class="col-sm-12   justify-content-center">
     					 <form action="/registroUsuario" method="post">
    						<div class="mb-3 mt-3">
      							<label for="email">Nombre:</label>
      								<input type="text" class="form-control" placeholder="Ingresa nombre" name="nombre">
    						</div>
    						<div class="mb-3">
      							<label for="pwd">Password:</label>
      								<input type="password" class="form-control" placeholder="Ingresa password" name="password">
    							</div>
    						<button type="submit" class="btn btn-primary">Enviar</button>
                            <a href="/AccesoUsuarios" class="btn btn-dark" role="button" aria-pressed="true">Iniciar Sesión</a>
 						 </form>
 						 <c:if test="${not empty error}">
                                 <div>
                                     <div class="alert alert-danger mt-2" role="alert">
                                        ${error}
                                     </div>
                                </div>
                         </c:if>
                         <c:if test="${not empty crear}">
                                 <div>
                                     <div class="alert alert-success mt-2" role="alert">
                                        ${crear}
                                     </div>
                                </div>
                         </c:if>

  					</div>
     			 </div>
             </div>
		</div>
	</section>
</main>
</main>
<footer>
	<div class=" p-4 bg-dark text-white text-center">
 	 <p>Copyright © 2020. All rights reserved. @milagrosKarimChoqueCondori</p>
	</div>
</footer>
</body>
</html>