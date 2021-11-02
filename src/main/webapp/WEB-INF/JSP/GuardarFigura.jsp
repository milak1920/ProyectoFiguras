<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
</head>
<body>
<h1>GuardarFigura</h1>


  <canvas width="1024" height="768" style="border:1px solid #000000;" id="canvas"></canvas>




    <form action="/home" method="post" id="form">
         <p>tipo: <input type="text" name="tipoFigura" id="tipoFigura"></p>
         <p>nombreFigura: <input type="text" name="nombreFigura" id="nombreFigura"></p>
            <c:if test="${not empty errorNombreFigura}">
                  <p>${errorNombreFigura}</p>
            </c:if>
              <div style="color:blue;" id="nombreFigura-error"></div>
         <p>grandor: <input type="text" name="grandor" id="grandor"></p>
                 <c:if test="${not empty errorGrandor}">
                       <p>${errorGrandor}</p>
                  </c:if>
                   <div style="color:red;" id="grandor-error"></div>
         <p>coordX: <input type="text" name="coordX" id="coordX"></p>
                 <c:if test="${not empty errorCoordX}">
                       <p>${errorCoordX}</p>
                  </c:if>
                  <div style="color:red;" id="coordX-error"></div>
         <p>coordY: <input type="text" name="coordY" id="coordY"></p>
          <c:if test="${not empty errorCoordY}">
                       <p>${errorCoordY}</p>
                  </c:if>
                  <div style="color:red;" id="coordY-error"></div>
         <p>colorFondo: <input type="color" name="colorFondo" id="colorFondo"></p>
         <p>colorBorde: <input type="color" name="colorBorde" id="colorBorde"></p>
         <input type="submit" value="guardar">
         <button id="submit">Visualizar</button>
     </form>
    <c:if test="${not empty mensaje}">
            <p>${mensaje}</p>
    </c:if>
    <form action="/home" method="get">
             <input type="submit" value="borrar" name="borrar">
    </form>

<script>

    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("form").addEventListener('submit', validarForm);
    });



    function validarForm(evento){
        evento.preventDefault();
        let  tipoFigura = document.getElementById("tipoFigura").value;
        let nombreFigura = document.getElementById("nombreFigura").value;
        let grandor = document.getElementById("grandor").value;
        let coordX = document.getElementById("coordX").value;
        let coordY = document.getElementById("coordY").value;
        let colorFondo = document.getElementById("colorFondo").value;
        let colorBorde = document.getElementById("colorBorde").value;
        let borrar = '${limpiar}';


        if (borrar === ""){
                console.log("borrar");
         }
         if (nombreFigura === ""){
             document.getElementById("nombreFigura-error").innerHTML = "*Se genera un nombre aleatorio";
         }
        valorGrandor = parseInt(grandor)
        if (grandor === "" || isNaN(valorGrandor)){
            document.getElementById("grandor-error").innerHTML = "*valor vacio o no es númerico";
        }
        valorCoordX = parseInt(coordX)
        if (coordX === "" || isNaN(valorCoordX)){
            document.getElementById("coordX-error").innerHTML = "*valor vacio o no es númerico";
        }
        valorCoordY = parseInt(coordY)
        if (coordY === "" || isNaN(valorCoordY)){
             document.getElementById("coordY-error").innerHTML = "*valor vacio o no es númerico";
        }

        console.log(grandor);

        //Parte de canvas
        const canvas = document.getElementById("canvas");
                 var ctx = canvas.getContext("2d");



         const circulo = function (colorBorde, colorFondo,coordX,coordY, grandor){
             var X = coordX/2;
             var Y = coordY/2;
             var r = grandor;
             ctx.strokeStyle = colorBorde;
             ctx.fillStyle = colorFondo;
             ctx.lineWidth = 5;
             ctx.arc(X,Y,r,0,2*Math.PI);
             ctx.fill();
             ctx.stroke();
         };
         const cuadrado = function(colorBorde, colorFondo,coordX,coordY,grandor){
             ctx.lineWidth = 5;
             ctx.strokeStyle = colorBorde;
             ctx.fillStyle = colorFondo;
             ctx.rect(coordX, coordY, grandor, grandor);
             ctx.stroke();
             ctx.fill();
         }
        const triangulo = function(colorBorde,colorFondo,coordX,coordY,grandor){
            let sWidth = coordX;
            let sHeight = coordY;
            ctx.beginPath();
            ctx.lineWidth = 5;
            ctx.strokeStyle = colorBorde;
            ctx.fillStyle = colorFondo;
            ctx.moveTo((sWidth/2)+grandor,sHeight/2);
            ctx.lineTo((sWidth/2),(sHeight/2)-grandor);
            ctx.lineTo((sWidth/2)-grandor,sHeight/2);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();
        }

        function pentagono(coordX, coordY, grandor, rotation,colorBorde,colorFondo){
            ctx.beginPath();
            ctx.strokeStyle = colorBorde;
            ctx.fillStyle = colorFondo;
            ctx.lineWidth = 5;
            for(var i = 0; i < 6; i ++){
                const ang = (i / 5) * Math.PI * 2 + rotation;
                ctx.lineTo(
                    Math.cos(ang) * grandor + coordX,
                    Math.sin(ang) * grandor + coordY
                );
             }
             ctx.fill();
             ctx.stroke();
             ctx.closePath();
        }

        function estrella(context,n,grandor,R,x,y,lwid,colorBorde,colorFondo) {
            ctx.save();
            ctx.lineWidth=lwid;
            ctx.beginPath();
            ctx.strokeStyle = colorBorde;
            ctx.fillStyle = colorFondo;
            ctx.lineWidth = 5;
            ctx.translate(x,y);
            for(var i=0;i<n;i++){
                ctx.lineTo(Math.cos(((1/4 + i)*2*Math.PI/n))*R,-Math.sin(((1/4 + i)*2*Math.PI/n))*R);
                ctx.lineTo(Math.cos(((3/4 + i)*2*Math.PI/n))*grandor,-Math.sin(((3/4 + i)*2*Math.PI/n))*grandor);
            }
            ctx.fill();
                 ctx.stroke();
        ctx.closePath();
        ctx.stroke();
        ctx.restore();
        }

          switch(tipoFigura) {
             case "circulo":
                  circulo(colorBorde, colorFondo,coordX,coordY,grandor);
               break;
             case "cuadrado":
                 cuadrado(colorBorde, colorFondo,coordX,coordY,grandor);
               break;
             case "triangulo":
                 triangulo(colorBorde,colorFondo,coordX,coordY,grandor);
                 break;
             case "pentagono":
                 pentagono(coordX,coordY,grandor,-Math.PI / 2,colorBorde,colorFondo);
                 break;
             case "estrella":
                 estrella(ctx,7,grandor,grandor / 2,coordX,coordY,10,colorBorde,colorFondo);
                 break;
             default:
                 console.log("no has seleccionado nada");
           }


     }


</script>
</body>
</html>