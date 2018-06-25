/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Model.UsuarioDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

/**
 *
 * @author leoomoreira
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        UsuarioDAO dao = new UsuarioDAO();
        if (dao.checkLogin(login, senha)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("login", login);
            Cookie[] cookies = request.getCookies();
            Cookie cookie = null;
            for (int i = 0; cookies != null && i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("myapp.login")) {
                    cookie = c;
                    cookie.setValue(cookie.getValue().replace("@" + login, ""));
                    cookie.setValue(cookie.getValue().replace(login + "@", ""));
                    cookie.setValue(login + "@" + cookie.getValue());
                    break;
                }
            }
            if (cookie == null) {
                cookie = new Cookie("myapp.login", login);
            }
            cookie.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(cookie);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/TheGame.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msg", "<span class=\"alert label\">Login ou senha inválida</span>");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

}
