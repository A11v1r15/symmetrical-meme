<script type="text/javascript">
    window.onload = function () {
        if (document.getElementById("txtLogin").value.length > 0) {
            document.getElementById("txtSenha").focus();
        }
    }
</script>
<%
    String login = "";
    Cookie[] cookies = request.getCookies();
    for (int i = 0; cookies != null && i < cookies.length; i++) {
        Cookie c = cookies[i];
        if (c.getName().equals("myapp.login")) {
            login = c.getValue();
            break;
        }
    }
%>
<ul class="right"> 
    <% if (session.getAttribute("login") == null) {%>
    <li class="has-dropdown not-click"><a href="#">Login</a>
        <ul class="dropdown" style="width:300px"><li class="title back js-generated"><h5><a href="javascript:void(0)">« Voltar</a></h5></li><li class="parent-link show-for-small"><a class="parent-link js-generated" href="#">Login</a></li>
            <form action="LoginServlet" method="post" class="login">
                <li><div class="row collapse">
                        <div class="small-3 medium-3 columns">
                            <span class="prefix">Login:</span>
                        </div>
                        <div class="small-9 medium-9 end columns">
                            <input type="text" id="txtLogin" name="login" value="<%= login.split("@")[0]%>" style="border:0px; padding:0px; top: 0px;"/>
                        </div>
                    </div> <!-- /.row --></li>
                <li><div class="row collapse">
                        <div class="small-3 medium-3 columns">
                            <span class="prefix">Senha:</span>
                        </div>
                        <div class="small-9 medium-9 end columns">
                            <input type="password" id="txtSenha" name="senha" style="border:0px; padding:0px; top: 0px;"/>
                        </div>
                    </div> <!-- /.row --></li>
                <li><input type="submit" value="Login" class="button small-12 medium-12"/></li>
            </form>
            <li>
                <%
                    String mensagem = (String) request.getAttribute("msg");
                    if (mensagem != null) {
                %>
                <%= mensagem%>
                <%
                    }
                %>
            </li>
        </ul>
    </li>
    <% } else {
        Cookie[] cookiesApp = request.getCookies();
        Cookie cookie = null;
        for (int i = 0; cookiesApp != null && i < cookiesApp.length; i++) {
            Cookie c = cookiesApp[i];
            if (c.getName().equals("myapp.login")) {
                cookie = c;
                break;
            }
        }%>
    <li class="has-dropdown not-click"><a href="#"><%= session.getAttribute("login")%></a>
        <ul class="dropdown" style="width:300px"><li class="title back js-generated"><h5><a href="javascript:void(0)">« Voltar</a></h5></li><li class="parent-link show-for-small"><a class="parent-link js-generated" href="#"><%= session.getAttribute("login")%></a></li>
            <li><% if (cookie != null && cookie.getValue().contains("@")) {
                    String[] hist = cookie.getValue().split("@");%>
                <a href="#">Veja outros que acessaram nessa máquina:</a></li>

            <% for (int i = 1; i < hist.length; i++) {%>
            <li><a href="#"><%= hist[i]%></a></li>
                <% }
                    }%>
            <li>
                <a href="LogoutServlet" class="button small-12 medium-12">Sair</a>
            </li>
        </ul>
    </li>
    <% }%>
</ul>