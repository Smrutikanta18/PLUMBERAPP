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

@WebServlet("/updateExperienceData")
public class updateExperienceDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String experience = request.getParameter("experience");
        String technicians = request.getParameter("technicians");
        String clients = request.getParameter("clients");
        String projects = request.getParameter("projects");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (Connection con = Database.getCon(); PrintWriter out = response.getWriter()) {
            System.out.println("hello");
            String sql = "UPDATE data SET experience = ?, technicians = ?, clients = ?, projects = ? WHERE id = 1";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(experience));
                ps.setInt(2, Integer.parseInt(technicians));
                ps.setInt(3, Integer.parseInt(clients));
                ps.setInt(4, Integer.parseInt(projects));

                int result = ps.executeUpdate();
                if (result > 0) {
                    out.write("{\"success\": true, \"message\": \"Data updated successfully!\"}");
                } else {
                    out.write("{\"success\": false, \"message\": \"Failed to update data!\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            try (PrintWriter out = response.getWriter()) {
                out.write("{\"success\": false, \"message\": \"An error occurred. Please try again later.\"}");
            }
        }
    }
}
