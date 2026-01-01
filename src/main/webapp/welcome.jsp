<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome | Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .welcome-container {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 600px;
            width: 100%;
            animation: fadeIn 1s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
        
        .success-icon {
            font-size: 80px;
            color: #10b981;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
        
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 36px;
        }
        
        .username {
            color: #4f46e5;
            font-weight: bold;
        }
        
        p {
            color: #666;
            margin-bottom: 30px;
            font-size: 18px;
        }
        
        .btn-group {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 40px;
        }
        
        .btn {
            padding: 15px 30px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #f3f4f6;
            color: #4b5563;
        }
        
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .logout-btn {
            background: #fee2e2;
            color: #dc2626;
            margin-top: 30px;
        }
        
        .logout-btn:hover {
            background: #fecaca;
        }
        
        .stats {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #e5e7eb;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-size: 32px;
            font-weight: bold;
            color: #4f46e5;
            display: block;
        }
        
        .stat-label {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.html");
            return;
        }
    %>
    
    <div class="welcome-container">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        
        <h1>Welcome, <span class="username"><%= username %></span>! 🎉</h1>
        <p>You have successfully logged into your account.</p>
        
        <div class="btn-group">
            <a href="#" class="btn btn-primary">
                <i class="fas fa-tachometer-alt"></i> Go to Dashboard
            </a>
            <a href="#" class="btn btn-secondary">
                <i class="fas fa-cog"></i> Settings
            </a>
        </div>
        
        <div class="stats">
            <div class="stat-item">
                <span class="stat-number">0</span>
                <span class="stat-label">Tasks</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">100%</span>
                <span class="stat-label">Secure</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">24/7</span>
                <span class="stat-label">Support</span>
            </div>
        </div>
        
        <a href="logout.jsp" class="btn logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>