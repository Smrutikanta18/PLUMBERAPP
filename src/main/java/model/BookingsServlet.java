package model;

import db.Database;
import entities.Message;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/bookings")
public class BookingsServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Message> messages = new ArrayList<>();
        User user = (User) request.getSession().getAttribute("users");
        try {
            Connection con = Database.getCon();

            String adminsql="select * from admin";
            PreparedStatement ps1=con.prepareStatement(adminsql);
            ResultSet rs1=ps1.executeQuery();

            if(rs1.next()){
                request.setAttribute("phone",rs1.getString("phone"));
                request.setAttribute("email",rs1.getString("email"));
            }

            String sql = "select * from message where uid=? order by id desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,user.getId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setName(rs.getString("name"));
                message.setPhone(rs.getString("phone"));
                message.setRequest(rs.getString("request"));
                message.setService(rs.getString("service"));
                message.setUid(rs.getInt("uid"));
                message.setDate(rs.getDate("date"));
                messages.add(message);
            }
            request.setAttribute("message", messages);
        } catch (Exception e) {
            throw new RuntimeException("Error fetching bookings data", e);
        }
        request.getRequestDispatcher("userBookings.jsp").forward(request, response);
    }
}
