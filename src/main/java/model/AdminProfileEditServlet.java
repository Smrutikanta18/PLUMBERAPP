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

@WebServlet("/adminProfileEdit")
public class AdminProfileEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int adminId = Integer.parseInt(request.getParameter("id"));
    try{
        Connection con = Database.getCon();
        String sql="select * from admin where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,adminId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            request.setAttribute("id", rs.getInt("id"));
            request.setAttribute("email",rs.getString("email"));
            request.setAttribute("firstname" , rs.getString("firstname"));
            request.setAttribute("lastname" , rs.getString("lastname"));
            request.setAttribute("phone" , rs.getString("phone"));
            request.setAttribute("image", rs.getString("image"));
        }

        request.getRequestDispatcher("adminProfileedit.jsp").forward(request,response);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    }

}
