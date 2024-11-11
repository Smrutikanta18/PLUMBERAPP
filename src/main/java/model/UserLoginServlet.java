package model;

import db.Database;
import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User();


        try {
            Connection con = Database.getCon();

            String sql = "select * from users WHERE email = ? AND password = ?";
            PreparedStatement psuser = con.prepareStatement(sql);
            psuser.setString(1, email);
            psuser.setString(2, password);
            ResultSet rsuser = psuser.executeQuery();

            if (rsuser.next()) {
                user.setId(rsuser.getInt("id"));
                user.setUserName(rsuser.getString("username"));
                user.setEmail(rsuser.getString("email"));
                user.setPassword(rsuser.getString("password"));
                user.setPhone(rsuser.getString("phone"));
            } else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            String adminsql = "select * from admin";
            PreparedStatement ps = con.prepareStatement(adminsql);
            ResultSet rs5 = ps.executeQuery();

            if (rs5.next()) {
                request.getSession().setAttribute("phone", rs5.getString("phone"));
                request.getSession().setAttribute("email", rs5.getString("email"));
            }

            request.getSession().setAttribute("users", user);
            response.sendRedirect("index");
        } catch (Exception e) {
            response.sendRedirect("404");
            e.printStackTrace();
        }
    }
}
