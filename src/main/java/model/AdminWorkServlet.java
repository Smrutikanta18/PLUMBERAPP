package model;

import db.Database;
import entities.Work;
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

@WebServlet("/work")
public class AdminWorkServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Work> works = new ArrayList<>();
        try {
            String sql = "select * from work order by id desc";
            Connection con = Database.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Work work = new Work();
                work.setId(rs.getInt("id"));
                work.setDetail(rs.getString("detail"));
                work.setImage(rs.getString("image"));
                works.add(work);
            }

            request.setAttribute("works", works);
        } catch (Exception e) {
            throw new RuntimeException("Error fetching work data", e);
        }
        request.getRequestDispatcher("adminWork.jsp").forward(request, response);
    }
}
