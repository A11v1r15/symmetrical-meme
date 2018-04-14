<%-- 
    Document   : index
    Created on : 02/04/2018, 21:19:06
    Author     : leoomoreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            window.onload = function () {
                if (document.getElementById("txtLogin").value.length > 0) {
                    document.getElementById("txtSenha").focus();
                }
            }
        </script>
    </head>
    <body>
        <%
            String login = "";
            Cookie[] cookies = request.getCookies();
            for (int i = 0; cookies != null && i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("smdapp.login")) {
                    login = c.getValue();
                    break;
                }
            }
        %>
        <div>Identificação com o usuário</div>
        <form action="LoginServlet" method="post">
            <div>Login:</div>
            <div><input type="text" id="txtLogin" name="login" value="<%= login%>" /></div>
            <div>Senha:</div>
            <div><input type="password" id="txtSenha" name="senha" /></div>
            <div><input type="submit" value="Login" /></div>
        </form>
        <%
            String mensagem = (String) request.getAttribute("msg");
            if (mensagem != null) {
        %>
        <h1><%= mensagem%></h1>
        <%
            }
        %>
    </body>
</html>
