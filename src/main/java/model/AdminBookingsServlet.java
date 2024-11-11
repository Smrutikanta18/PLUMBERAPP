package model;

import db.Database;
import entities.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/adminBookings")
public class AdminBookingsServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Message> messages = new ArrayList<>();
        try {
            String sql = "select * from message order by id desc";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setName(rs.getString("name"));
                message.setPhone(rs.getString("phone"));
                message.setRequest(rs.getString("request"));
                message.setService(rs.getString("service"));

                // Handling potential non-numeric uid values (like "guest")
                String uidStr = rs.getString("uid");
                try {
                    message.setUid(Integer.parseInt(uidStr));  // Attempt to parse as integer
                } catch (NumberFormatException e) {
                    message.setUid(-1);  // If parsing fails, assign a default value (e.g., -1 or handle as needed)
                }

                message.setDate(rs.getDate("date"));
                messages.add(message);
            }

            request.setAttribute("message", messages);
        } catch (Exception e) {
            throw new RuntimeException("Error fetching bookings data", e);
        }
        request.getRequestDispatcher("adminBookings.jsp").forward(request, response);
    }
}
