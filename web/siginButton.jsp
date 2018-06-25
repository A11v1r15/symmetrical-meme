<% if (session.getAttribute("login") == null) {%>
<ul class="right"> 
    <li class="has-dropdown not-click"><a href="#">Sign In</a>
        <ul class="dropdown" style="width:300px"><li class="title back js-generated"><h5><a href="javascript:void(0)">« Voltar</a></h5></li><li class="parent-link show-for-small"><a class="parent-link js-generated" href="#">Sign In</a></li>
            <form action="SiginServlet" method="post" class="login">
                <li><div class="row collapse">
                        <div class="small-3 medium-3 columns">
                            <span class="prefix">Login:</span>
                        </div>
                        <div class="small-9 medium-9 end columns">
                            <input type="text" id="txtLogin" name="login" style="border:0px; padding:0px; top: 0px;"/>
                        </div>
                    </div> <!-- /.row --></li>
                <li><div class="row collapse">
                        <div class="small-3 medium-3 columns">
                            <span class="prefix">Nick:</span>
                        </div>
                        <div class="small-9 medium-9 end columns">
                            <input type="text" id="txtSenha" name="nick" style="border:0px; padding:0px; top: 0px;"/>
                        </div>
                    </div> <!-- /.row --></li>
                <li><div class="row collapse">
                        <div class="small-3 medium-3 columns">
                            <span class="prefix">E-mail:</span>
                        </div>
                        <div class="small-9 medium-9 end columns">
                            <input type="text" id="txtSenha" name="email" style="border:0px; padding:0px; top: 0px;"/>
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
                <li><div class="row collapse">
                        <div class="small-3 medium-3 columns">
                            <span class="prefix">Confirma:</span>
                        </div>
                        <div class="small-9 medium-9 end columns">
                            <input type="password" id="txtSenha" name="senhaC" style="border:0px; padding:0px; top: 0px;"/>
                        </div>
                    </div> <!-- /.row --></li>
                <li><input type="submit" value="Sign In" class="button small-12 medium-12"/></li>
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
</ul>
<% }%>