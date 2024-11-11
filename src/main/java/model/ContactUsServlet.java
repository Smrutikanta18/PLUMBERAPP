package model;

import db.Database;
import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

@WebServlet("/contactUs")
public class ContactUsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Get the user ID from the session if the user is logged in
        User user = (User) request.getSession().getAttribute("users");
        String userId = (user != null) ? String.valueOf(user.getId()) : "guest";

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Validate phone number
        if (phone.length() != 10 || !phone.matches("\\d{10}")) {
            out.write("{\"status\": \"error\", \"message\": \"Phone number must be 10 digits.\"}");
            return;
        }

        try (Connection con = Database.getCon()) {
            String sql = "INSERT INTO contact_us (name, phone, subject, message, created_time, uid) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, subject);
                ps.setString(4, message);
                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                ps.setString(6, userId);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.write("{\"status\": \"success\"}");
                } else {
                    out.write("{\"status\": \"error\", \"message\": \"Error processing your request.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"status\": \"error\", \"message\": \"Database error occurred.\"}");
        }
    }
}
