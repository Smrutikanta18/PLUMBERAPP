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

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {
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



        } catch (Exception e) {
            response.sendRedirect("404");
            e.printStackTrace();
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
