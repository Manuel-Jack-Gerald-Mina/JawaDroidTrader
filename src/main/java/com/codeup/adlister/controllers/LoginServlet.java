package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String attempt = request.getParameter("attempt");
    request.setAttribute("failed", attempt);
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        if (user == null || password == null) {
//
//            PrintWriter out =response.getWriter();
//            out.println("<script>");
//            out.println("alert('Please make sure to put username and password')");
//            out.println("</script>");


            response.sendRedirect("/login");
            return;
        }
//        System.out.println("original = " + user.getPassword());
//        System.out.println("password entered: " + password);

        boolean validAttempt = Password.check(password, user.getPassword() );

        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");

        } else {
//            PrintWriter out = response.getWriter();
//            out.println("<script>");
//            out.println("alert('Please put correct user name and password')");
//            out.println("</script>");

            response.sendRedirect("/login?attempt=1");
        }






    }

}
