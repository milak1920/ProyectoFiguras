<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>Hola mundo</h1>

    <form action="/CrearFiguras" method="post">
         <p>Numero: <input type="text" name="nombre"  ></p>
         <p>Numero: <input type="text" name="apellido"  ></p>
         <input type="submit" value="Enviar">
    </form>
  <c:choose>
             <c:when test = "${not empty resultado}">
                <p>el resultado es : ${resultado}</p>
             </c:when>
             <c:otherwise>
                <p>no es correcto</p>
             </c:otherwise>
         </c:choose>
</body>
</html>