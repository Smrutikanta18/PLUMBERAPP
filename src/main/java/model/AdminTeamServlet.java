package model;

import db.Database;
import entities.Technician;
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

@WebServlet("/adminTeam")
public class AdminTeamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<Technician> technicians = new ArrayList<>();

        try{
            Connection con= Database.getCon();

            String tech = "SELECT * FROM technician";
            PreparedStatement techps = con.prepareStatement(tech);
            ResultSet rs3 = techps.executeQuery();

            while(rs3.next()){
                Technician technician =new Technician();
                technician.setId(rs3.getInt("id"));
                technician.setImage(rs3.getString("image"));
                technician.setName(rs3.getString("name"));
                technician.setExperience(rs3.getInt("experience"));
                technician.setFaceBook(rs3.getString("facebook"));
                technician.setInstagram(rs3.getString("instagram"));
                technicians.add(technician);
            }


        } catch (Exception e) {
            response.sendRedirect("404");
            e.printStackTrace();
        }
        request.setAttribute("technicians",technicians);
        request.getRequestDispatcher("adminTeam.jsp").forward(request, response);
    }
}

