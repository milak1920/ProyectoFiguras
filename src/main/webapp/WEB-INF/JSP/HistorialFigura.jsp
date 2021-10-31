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
             <th>Borrar</th>
        </tr>
    </thead>
        <tbody>
            <c:forEach var="figura" items="${listaFigura}">
             <tr>
                    <td>  <c:out value="${figura.nombreFigura}" /></td>
                    <td> <c:out value="${figura.tipoFigura}" /></td>
                    <td> <c:out value="${figura.fechaCreacion}" /></td>
                    <td><a href="/historialFigura?idFigura=<c:out value="${figura.figuraId}" />">delete</a></td>

              </tr>
        </c:forEach>
    </tbody>
  </table>


</body>
</html>






























