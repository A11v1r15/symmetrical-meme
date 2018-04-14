<%-- 
    Document   : main
    Created on : 02/04/2018, 21:19:06
    Author     : leoomoreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Olá, <%= session.getAttribute("login") %>!</h1>
        <a href="LogoutServlet">Sair</a>        
    </body>
</html>
