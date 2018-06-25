<%-- 
    Document   : TheGame
    Created on : 25/06/2018, 15:13:16
    Author     : Alvaro
--%>

<%@page import="java.util.List"%>
<%@page import="Model.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="pt-br"><![endif]-->
<html class="no-js" lang="pt-br">
    <head>
        <jsp:include page = "/meta.jsp"/>
    </head>
    <body>
        <jsp:include page = "/header.jsp"/>
        <script src="../style/js/processing.min.js" type="text/javascript"></script>
        <script type="application/processing" data-processing-target="TheGame">
            void doll(float x, float y) {
            strokeWeight(2);
            stroke(0);
            line(x + 5, y - 10, x + 18, y + 5);
            line(x - 5, y - 10, x - 18, y + 5);
            line(x + 5, y + 10, x + 5, y + 25);
            line(x - 5, y + 10, x - 5, y + 25);
            fill(255, 0, 0);
            triangle(x, y - 20, x - 15, y + 10, x + 15, y + 10);
            stroke(255, 100, 150);
            fill(255, 174, 201);
            ellipse(x, y - 30, 25, 25);
            stroke(255);
            fill(255);
            ellipse(x, y, 3, 3);
            }

            float MRU(float d, float v, float t) {
            d += v * t;
            return(d);
            }

            float MRUV(float d, float v, float a, float t) {
            d += v * t + a * t * t / 2;
            return d;
            }

            float dollX = 25;
            float dollY = 200;
            float t;
            void dollMovement() {
            if (keyPressed && !jump) {
            if (keyCode == RIGHT) {
            dollX += 5;
            } else if (keyCode == LEFT && dollX > 0) {
            dollX -= 5;
            } else if (keyCode == UP) {
            t = 0;
            jump = true;
            }
            }
            if (jump) {
            dollJump();
            }
            doll(dollX, dollY);
            if (dollX > 500) {
            t = 0;
            state = 1;
            }
            }
            boolean jump = false;
            void dollJump() {
            t++;
            dollX = MRU(dollX, 5, t);
            dollY = MRUV(dollY, - 25, 9.8, t);
            if (dollY > 200) {
            jump = false;
            dollY = 200;
            }
            }

            int caixaX = 550;
            void moveCaixa() {
            caixaX -= 3;
            if (caixaX < - 50) {
            caixaX = 550;
            }
            fill(185, 122, 87);
            stroke(127, 78, 52);
            if (int(frameCount / 60) % 2 == 0) {
            rect(caixaX - 35, 155, 70, 90);
            if (dollX > caixaX - 35 && dollX < caixaX + 35 && dollY > 155 && dollY < 245) {
            t = 0;
            state = 2;
            }
            } else {
            rect(caixaX - 45, 165, 90, 70);
            if (dollX > caixaX - 45 && dollX < caixaX + 45 && dollY > 165 && dollY < 235) {
            t = 0;
            state = 2;
            }
            }
            }
            void victoria() {
            rainbowRoad();
            fill(0);
            textSize(50);
            text("Venceu!", 150, 150);
            t++;
            if (t > 300) {
                $.get("GameHandler", function( data ){});
            reset();
            }
            }

            void derrota() {
            background(0);
            fill(255, 0, 0);
            textSize(50);
            text("Game Over", 120, 150);
            t++;
            if (t > 300) {
            reset();
            }
            }

            void reset() {
            jump = false;
            t = 0;
            dollX = 25;
            dollY = 200;
            caixaX = 550;
            state = 0;
            }

            void rainbowRoad() {
            colorMode(HSB, 2);
            strokeWeight(2);
            for (int i = 0; i <= height; i++) {
            stroke( - (sin(radians(frameCount + i)) - 1), 2, 2);
            line(0, i, width, i);
            }
            colorMode(RGB, 255);
            }
            void setup() {
            size(500, 300);
            frameRate(60);
            reset();
            }

            int state = 0;
            void draw() {
            background(0, 127, 255);
            stroke(34, 177, 76);
            fill(181, 230, 29);
            rect(0, 225, 500, 300);
            if (state == 0) {
            dollMovement();
            moveCaixa();
            } else if (state == 1) {
            victoria();
            } else if (state == 2) {
            derrota();
            }
            }
        </script>
        <canvas id="TheGame"></canvas>
        <img src="../game/img/House.png" alt=""/>
        <img src="../game/img/grass.png" alt=""/>
        <jsp:include page = "/bodyend.jsp"/>
    </body>
</html>