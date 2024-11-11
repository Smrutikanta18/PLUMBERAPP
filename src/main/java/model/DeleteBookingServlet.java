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
import java.sql.SQLException;

@WebServlet("/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try{
            Connection con = Database.getCon();
            String sql = "delete from message where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ps.executeUpdate();

            response.sendRedirect("adminBookings");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
