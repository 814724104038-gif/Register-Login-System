package com.registration.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/auth")
@MultipartConfig
public class AuthServlet extends HttpServlet {
    private Connection connection;
    
    @Override
    public void init() throws ServletException {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create connection
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/user_auth_db", 
                "root", 
                "root"  // CHANGE THIS!
            );
            System.out.println("✅ Database connected successfully!");
        } catch (Exception e) {
            System.out.println("❌ Database connection failed: " + e.getMessage());
            throw new ServletException("Database connection failed", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            if ("register".equals(action)) {
                handleRegistration(request, response);
            } else if ("login".equals(action)) {
                handleLogin(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
        }
    }
    
    private void handleRegistration(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            
            int rows = ps.executeUpdate();
            if (rows > 0) {
                // Redirect to login with success message
                response.sendRedirect("login.html?message=Registration+successful!+Please+login.");
            }
        }
    }
    
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                
                // Redirect to welcome page
                response.sendRedirect("welcome.jsp");
            } else {
                // Invalid credentials
                response.sendRedirect("login.html?error=Invalid+credentials");
            }
        }
    }
    
    @Override
    public void destroy() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("✅ Database connection closed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}