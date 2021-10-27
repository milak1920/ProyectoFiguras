<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>Hola mundo</h1>

    <form action="/CrearFi" method="post">
         <p>Numero: <input type="text" name="nombre"  ></p>
         <p>Numero: <input type="text" name="apellido"  ></p>
         <input type="submit" value="Enviar">
    </form>


</body>
</html>