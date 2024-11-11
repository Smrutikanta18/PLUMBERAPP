package model;

import db.Database;
import entities.Banner;
import entities.Technician;
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

@WebServlet("/index")
public class UserIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Banner> banners = new ArrayList<>();
        List<Work> works = new ArrayList<>();
        List<Technician> technicians = new ArrayList<>();

        try {
            Connection con = Database.getCon();

            String adminsql="select * from admin";
            PreparedStatement ps=con.prepareStatement(adminsql);
            ResultSet rs5=ps.executeQuery();

            if(rs5.next()){
                request.setAttribute("phone",rs5.getString("phone"));
                request.setAttribute("email",rs5.getString("email"));
            }

            String banner = "select * from banner";
            PreparedStatement bannerps = con.prepareStatement(banner);
            ResultSet rss = bannerps.executeQuery();

            while(rss.next()){
            Banner banner1 = new Banner();
            banner1.setId(rss.getInt("id"));
            banner1.setImage(rss.getString("image"));
            banner1.setTitle(rss.getString("title"));
            banner1.setDesc(rss.getString("description"));
            banners.add(banner1);
            }

            String work = "select * from work";
            PreparedStatement workps = con.prepareStatement(work);
            ResultSet rs1 = workps.executeQuery();

            while(rs1.next()){
                Work work1 = new Work();
                work1.setId(rs1.getInt("id"));
                work1.setImage(rs1.getString("image"));
                work1.setDetail(rs1.getString("detail"));
                works.add(work1);
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

            String tech = "SELECT * FROM technician ORDER BY experience desc LIMIT 4";
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
        request.setAttribute("banners",banners);
        request.setAttribute("works",works);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
