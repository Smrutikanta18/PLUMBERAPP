package model;

import db.Database;
import entities.ContactUs;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/showAllContactUs")
public class AdminAllContactUsServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ContactUs> contactUses = new ArrayList<>();
    try{
        Connection con = Database.getCon();
        String contactUs = "select * from contact_us order by created_time desc";
        PreparedStatement contactps = con.prepareStatement(contactUs);
        ResultSet contactrs = contactps.executeQuery();

        while(contactrs.next()){
            ContactUs contactUs1 = new ContactUs();
            contactUs1.setId(contactrs.getInt("id"));
            contactUs1.setUid(contactrs.getString("uid"));
            contactUs1.setName(contactrs.getString("name"));
            contactUs1.setPhone(contactrs.getString("phone"));
            contactUs1.setMessage(contactrs.getString("message"));
            contactUs1.setSubject(contactrs.getString("subject"));
            contactUs1.setCreated_at(contactrs.getTimestamp("created_time"));
            contactUses.add(contactUs1);
        }

        request.setAttribute("contactUses",contactUses);

        request.getRequestDispatcher("adminContactUs.jsp").forward(request, response);

    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    }
}
