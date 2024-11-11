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

@WebServlet("/editbanner")
public class EditBannerServlet  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
        String id=request.getParameter("id");

        try{
            Connection con= Database.getCon();
            String sql="select * from banner where id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,id);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                request.setAttribute("id",rs.getInt("id"));
                request.setAttribute("image",rs.getString("image"));
                request.setAttribute("title",rs.getString("title"));
                request.setAttribute("description",rs.getString("description"));
            }

            request.getRequestDispatcher("editBanner.jsp").forward(request,res);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}

