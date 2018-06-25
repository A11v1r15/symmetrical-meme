<%-- 
    Document   : index
    Created on : 02/04/2018, 21:19:06
    Author     : Álvaro
--%>

<nav class="top-bar" data-topbar role="navigation">
    <ul class="title-area">
        <li class="name"><h1><a href="/Symmetrical-meme">Symmetrical Meme</a></h1></li>
        <li class="toggle-topbar menu-icon"><a href="/"><span></span></a></li>
    </ul>
    <section class="top-bar-section">
        <ul class="left">
            <li class="active"><a href="ListarUsuarioServlet">Ver Ranking</a></li>
        </ul>
        <% if (session.getAttribute("login") != null) {%>
        <ul class="left">
            <li class="active"><a href="TheGame">O Jogo</a></li>
        </ul>
        <%}%>
        <ul class="right">
            <jsp:include page = "loginButton.jsp"/>
        </ul>
        <ul class="right">
            <jsp:include page = "siginButton.jsp"/>
        </ul>
    </section>
</nav>