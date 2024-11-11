package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/adminChangePass")
public class AdminChnagePassServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");

        response.setContentType("application/json");
        try (Connection con = Database.getCon()) {
            String selectSql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            try (PreparedStatement ps = con.prepareStatement(selectSql)) {
                ps.setString(1, email);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        String updatePasswordQuery = "UPDATE admin SET password = ? WHERE email = ?";
                        try (PreparedStatement updatePs = con.prepareStatement(updatePasswordQuery)) {
                            updatePs.setString(1, newPassword);
                            updatePs.setString(2, email);
                            int rowsUpdated = updatePs.executeUpdate();

                            if (rowsUpdated > 0) {
                                response.getWriter().write("{\"success\": true, \"message\": \"Password changed successfully.\"}");
                            } else {
                                response.getWriter().write("{\"success\": false, \"message\": \"Error updating password.\"}");
                            }
                        }
                    } else {
                        response.getWriter().write("{\"success\": false, \"message\": \"Invalid email or current password.\"}");
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().write("{\"success\": false, \"message\": \"An error occurred. Please try again later.\"}");
        }
    }
}
