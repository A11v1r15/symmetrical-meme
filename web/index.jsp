<%-- 
    Document   : index
    Created on : 21/05/2018, 20:45:36
    Author     : Álvaro
--%>

<%@page import="java.util.List"%>
<%@page import="Model.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="pt-br"><![endif]-->
<html class="no-js" lang="pt-br">
    <head>
        <jsp:include page = "meta.jsp"/>
    </head>
    <body>
        <jsp:include page = "header.jsp"/>
        <% if (request.getAttribute("dados") != null) { %>
        <table role="grid" summary="Top 10 Simples com Posição, Nick e Quantidade de pontos"> 
            <caption>Top 10</caption>   
            <thead> 
                <tr> 
                    <th width="">Posição</th> 
                    <th width="">Nick</th> 
                    <th width="">Pontos</th> 
                </tr> 
            </thead> 
            <tfoot>
                <tr> 
                    <td colspan="3">Jogue você também e faça parte desse Ranking‼ 
                    </td></tr> 
            </tfoot>
            <tbody> 
                <%
                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("dados");
                    int count = 0;
                    for (Usuario u : usuarios) {
                        count++;
                %> 
                <tr> 
                    <td><%= count%>º</td> 
                    <td><%= u.getNick()%></td> 
                    <td><%= u.getPoints()%></td> 
                </tr> 
                <% }%>
            </tbody> 
        </table>
        <%
        } else {
        %>
        <h1>Marketing:</h1>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
        <%
            }
        %>
        <jsp:include page = "bodyend.jsp"/>
    </body>
</html>