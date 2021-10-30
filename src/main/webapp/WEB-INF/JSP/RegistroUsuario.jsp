<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>RegistroUsuario</h1>

    <form action="/registroUsuario" method="post">
         <p>nombre: <input type="text" name="nombre"  ></p>
         <p>password: <input type="text" name="password"  ></p>
         <input type="submit" value="Enviar">
    </form>

<c:choose>
    <c:when test="${empty mensaje}">
        <p>El usuario no existe, se registro correctamente!!<p>
    </c:when>
    <c:otherwise>
            <p>${mensaje}<p>
    </c:otherwise>
</c:choose>
</body>
</html>