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

@WebServlet("/adminIndex")
public class AdminIndexServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ContactUs> contactUses = new ArrayList<>();

        try {
            Connection con = Database.getCon();

            String userSql = "SELECT COUNT(*) AS total_users FROM users";
            PreparedStatement userStmt = con.prepareStatement(userSql);
            ResultSet userRs = userStmt.executeQuery();

            if (userRs.next()) {
                int totalUsers = userRs.getInt("total_users");
                request.setAttribute("totalUsers", totalUsers);
            }

            String messageSql = "SELECT COUNT(*) AS total_massages FROM message";
            PreparedStatement messageStmt = con.prepareStatement(messageSql);
            ResultSet messageRs = messageStmt.executeQuery();

            if (messageRs.next()) {
                int total_massages = messageRs.getInt("total_massages");
                request.setAttribute("totalMessage", total_massages);
            }

            String contactSql = "SELECT COUNT(*) AS totalContact FROM contact_us";
            PreparedStatement contactStmt = con.prepareStatement(contactSql);
            ResultSet contactRs = contactStmt.executeQuery();

            if (contactRs.next()) {
                int totalContact = contactRs.getInt("totalContact");
                request.setAttribute("totalContact", totalContact);
            }

            String conSql = "SELECT COUNT(*) AS totalQuery FROM contact";
            PreparedStatement conStmt = con.prepareStatement(conSql);
            ResultSet conRs = conStmt.executeQuery();

            if (conRs.next()) {
                int totalQuery = conRs.getInt("totalQuery");
                request.setAttribute("totalQuery", totalQuery);
            }

            String contactUs = "select * from contact_us order by created_time desc limit 4";
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

            request.getRequestDispatcher("adminIndex.jsp").forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
