<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>LOGIN</h1>
<c:if test="${not empty message}">
    <div>
            ${message}
    </div>
</c:if>

    <form action="/AccesoUsuarios" method="post">
         <p>nombre: <input type="text" name="nombre"  ></p>
         <p>password: <input type="text" name="password"  ></p>
         <input type="submit" value="Enviar">
    </form>
</body>
</html>