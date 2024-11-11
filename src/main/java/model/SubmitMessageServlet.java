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
import java.sql.Date;
import java.sql.PreparedStatement;

@WebServlet("/submitMessage")
public class SubmitMessageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String service = request.getParameter("service");
        Date date = Date.valueOf(request.getParameter("date"));
        String requestMessage = request.getParameter("request");

        User user = (User) request.getSession().getAttribute("users");
        String userId = (user != null) ? String.valueOf(user.getId()) : "guest";

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Phone number validation
        if (phone.length() != 10 || !phone.matches("\\d{10}")) {
            out.write("{\"status\": \"error\", \"message\": \"Please enter a valid 10-digit phone number.\"}");
            return; // Stop further processing
        }

        try (Connection con = Database.getCon()) {
            String sql = "INSERT INTO message (name, phone, service, request, date,uid) VALUES (?, ?, ?, ?, ?,?)";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, service);
                ps.setString(4, requestMessage);
                ps.setDate(5, date);
                ps.setString(6,userId);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.write("{\"status\": \"success\"}");
                } else {
                    out.write("{\"status\": \"error\", \"message\": \"There was an error processing your request.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"status\": \"error\", \"message\": \"Database error occurred.\"}");
        }
    }
}
