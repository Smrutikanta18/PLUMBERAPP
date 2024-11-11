package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/addTechnician")
@MultipartConfig
public class AddTeamServlet extends HttpServlet {

    private static final String IMAGE_UPLOAD_DIR = "/img";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String experience = request.getParameter("experience");
        String facebook = request.getParameter("facebook");
        String instagram = request.getParameter("instagram");
        Part imagePart = request.getPart("image");

        String image=null;

        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = imagePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("") + File.separator + IMAGE_UPLOAD_DIR;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + fileName;
            imagePart.write(filePath);

            image = fileName;
        }

        try (Connection connection = Database.getCon()) {
            String sql = "INSERT INTO technician (image, name, experience, facebook, instagram) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, image);
                statement.setString(2, name);
                statement.setString(3, experience);
                statement.setString(4, facebook);
                statement.setString(5, instagram);

                int rowsInserted = statement.executeUpdate();
                response.setContentType("application/json");
                if (rowsInserted > 0) {
                    response.getWriter().write("{\"success\": true, \"message\": \"Technician added successfully.\"}");
                } else {
                    response.getWriter().write("{\"success\": false, \"message\": \"Failed to add technician.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false, \"message\": \"An error occurred.\"}");
        }
    }
}
