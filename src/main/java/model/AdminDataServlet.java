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

@WebServlet("/data")
public class AdminDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection con = Database.getCon();

            String data = "select * from data";
            PreparedStatement dataps = con.prepareStatement(data);
            ResultSet datars = dataps.executeQuery();

            if(datars.next()){
                request.setAttribute("id",datars.getInt("id"));
                request.setAttribute("experience",datars.getString("experience"));
                request.setAttribute("technicians",datars.getString("technicians"));
                request.setAttribute("clients",datars.getString("clients"));
                request.setAttribute("projects",datars.getString("projects"));
            }

            request.getRequestDispatcher("data.jsp").forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
