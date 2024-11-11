package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@MultipartConfig
@WebServlet("/userEditProfile")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userid"));
        String firstName = request.getParameter("firstname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");


        try (Connection conn = Database.getCon()) {


            String sql = "UPDATE users SET username=?, email=?, phone=?  WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, id);

            int rowsUpdated = ps.executeUpdate();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": " + (rowsUpdated > 0) + "}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false}");
        }
    }
}
