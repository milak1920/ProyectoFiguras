<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>Historial Usuario</h1>
  <table border="1">
    <thead>
        <tr>
            <th>tipo figura</th>
            <th>Nombre</th>
            <th>Fecha creación</th>
                 <th>colorFondo</th>
             <th>Borrar</th>
             <th>visualizarFigura</th>
        </tr>
    </thead>
        <tbody>
            <c:forEach var="figura" items="${listaFigura}">
             <tr>
                    <td>  <c:out value="${figura.nombreFigura}" /></td>
                    <td> <c:out value="${figura.tipoFigura}" /></td>
                    <td> <c:out value="${figura.fechaCreacion}" /></td>
                    <td> <c:out value="${figura.colorFondo}" /></td>
                    <td><a href="/historialFigura?idFigura=<c:out value="${figura.figuraId}" />">delete</a></td>
                    <td><a href="/visualizarFigura?nombreFigura=<c:out value="${figura.nombreFigura}"/>&tipoFigura=<c:out value="${figura.tipoFigura}"/>&grandor=<c:out value="${figura.grandor}"/>&coordX=<c:out value="${figura.coordX}"/>&coordY=<c:out value="${figura.coordY}"/>&colorFondo=<c:out value="${figura.colorFondo}"/>&colorBorde=<c:out value="${figura.colorBorde}"/>" target="_blank" >Visualizar</a></td>
              </tr>
        </c:forEach>
    </tbody>
  </table>


</body>
</html>






























