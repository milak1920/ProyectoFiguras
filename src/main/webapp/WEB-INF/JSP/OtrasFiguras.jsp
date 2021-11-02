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
<div class="container mt-3">
  <h2>Otras Figuras!!</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Nombre</th>
        <th>Tipo Figura</th>
        <th>Fecha Creación</th>
      </tr>
    </thead>
    <tbody>
       <c:forEach var="figura" items="${listaFigura}">
            <tr>
                <td>  <c:out value="${figura.nombreFigura}" /></td>
                <td> <c:out value="${figura.tipoFigura}" /></td>
                <td> <c:out value="${figura.fechaCreacion}" /></td>
                <td> <a href="/visualizarFigura?nombreFigura=<c:out value="${figura.nombreFigura}"/>&tipoFigura=<c:out value="${figura.tipoFigura}"/>&grandor=<c:out value="${figura.grandor}"/>&coordX=<c:out value="${figura.coordX}"/>&coordY=<c:out value="${figura.coordY}"/>&colorFondo=<c:out value="${figura.colorFondo}"/>&colorBorde=<c:out value="${figura.colorBorde}"/>&fechaCreacion=<c:out value="${figura.fechaCreacion}"/>" target="_blank" class="btn btn-primary" role="button" aria-pressed="true">Visualizar</a></td>
            </tr>
        </c:forEach>
    </tbody>
  </table>
</div>
</main>
<footer>
	<div class=" p-4 bg-dark text-white text-center">
 	 <p>Copyright © 2020. All rights reserved. @milagrosKarimChoqueCondori</p>
	</div>
</footer>
</body>
</html>