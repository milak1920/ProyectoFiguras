<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>GuardarFigura</h1>

    <form action="/home" method="post">
         <p>tipo: <input type="text" name="tipoFigura"></p>
         <p>nombreFigura: <input type="text" name="nombreFigura"></p>
         <p>grandor: <input type="text" name="grandor"></p>
         <p>coordX: <input type="text" name="coordX"></p>
         <p>coordY: <input type="text" name="coordY"></p>
         <p>colorFondo: <input type="color" name="colorFondo"></p>
         <p>colorBorde: <input type="color" name="colorBorde"></p>
         <input type="submit" value="guardar">
    </form>

</body>
</html>