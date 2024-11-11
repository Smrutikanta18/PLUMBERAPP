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

@WebServlet("/service")
public class UserServiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        try{
            Connection con= Database.getCon();

            String adminsql="select * from admin";
            PreparedStatement ps=con.prepareStatement(adminsql);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("phone",rs.getString("phone"));
                request.setAttribute("email",rs.getString("email"));
            }

            String data = "select * from data";
            PreparedStatement dataps =  con.prepareStatement(data);
            ResultSet rs2 = dataps.executeQuery();

            if(rs2.next()){
                request.setAttribute("experience",rs2.getInt("experience"));
                request.setAttribute("tech",rs2.getInt("technicians"));
                request.setAttribute("clients",rs2.getInt("clients"));
                request.setAttribute("projects",rs2.getInt("projects"));
            }


        } catch (Exception e) {
            response.sendRedirect("404");
            e.printStackTrace();
        }
        request.getRequestDispatcher("service.jsp").forward(request, response);
    }
}
