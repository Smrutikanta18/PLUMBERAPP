package model;

import db.Database;
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

@WebServlet("/phone")
public class PhoneServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone").trim();
        System.out.println(phone + " is yur phone ");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (phone.length() != 10 || !phone.matches("\\d{10}")) {
            out.write("{\"status\": \"error\", \"message\": \"Phone number must be 10 digits.\"}");
            return;
        }

        try (Connection con = Database.getCon()) {
            String sql = "INSERT INTO contact (contact, created_at) VALUES (?, ?)";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, phone);
                ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));

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
