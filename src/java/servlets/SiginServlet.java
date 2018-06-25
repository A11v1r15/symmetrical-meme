/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Model.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alvaro
 */
public class SiginServlet extends HttpServlet {

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
        String nick = request.getParameter("nick");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String senhaC = request.getParameter("senhaC");
        UsuarioDAO dao = new UsuarioDAO();
        if (senha == null ? senhaC != null : !senha.equals(senhaC)) {
            request.setAttribute("msg", "<span class=\"alert label\">Senhas não coincidem</span>");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else if (dao.checkExist("login", login)) {
            request.setAttribute("msg", "<span class=\"alert label\">Login já existe</span>");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else if (dao.checkExist("nick", nick)) {
            request.setAttribute("msg", "<span class=\"alert label\">Nick já existe</span>");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else if (dao.checkExist("email", email)) {
            request.setAttribute("msg", "<span class=\"alert label\">E-mail cadastrado</span>");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else {
            dao.newUser(login, senha, email, nick);
            request.setAttribute("msg", "<span class=\"success label\">Cadastro concuído!</span>");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}
