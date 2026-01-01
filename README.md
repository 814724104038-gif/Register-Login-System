# 📖 **Registration & Login System - README**

## 🚀 **Project Overview**
A complete, modern, and animated user authentication system built with **Servlet 5.0 (Jakarta EE)** for Tomcat 10.1. Features stunning animations, gradient designs, and full CRUD operations with MySQL database.

![Preview](https://img.shields.io/badge/Preview-Animated_UI-blue)
![Servlet](https://img.shields.io/badge/Servlet-5.0-orange)
![Tomcat](https://img.shields.io/badge/Tomcat-10.1-red)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)

## ✨ **Features**

### 🎨 **Frontend**
- ✅ Modern gradient UI with floating animations
- ✅ Particle background effects
- ✅ Password strength indicator
- ✅ Form validation with shake effects
- ✅ Ripple button animations
- ✅ Responsive design (mobile-friendly)
- ✅ Success/error notifications
- ✅ Loading spinners
- ✅ Smooth page transitions

### 🔧 **Backend**
- ✅ Complete Servlet lifecycle implementation
- ✅ JDBC with PreparedStatement (SQL injection safe)
- ✅ Session management
- ✅ Database connection pooling in `init()`
- ✅ Proper resource cleanup in `destroy()`
- ✅ Separate DAO layer

### 🛡️ **Security**
- ✅ Password validation (minimum 6 characters)
- ✅ Session timeout protection
- ✅ SQL injection prevention
- ✅ Input sanitization

## 📁 **Project Structure**

```
RegistrationLoginSystem/
├── src/
│   └── com/registration/
│       ├── controller/AuthServlet.java    # Main servlet
│       └── dao/DatabaseConnection.java    # DB connection class
├── WebContent/
│   ├── screenshots
│   ├── register.html                      # Registration page
│   ├── login.html                         # Login page
│   ├── welcome.jsp                        # Welcome dashboard
│   ├── logout.jsp                         # Logout handler
│   └── WEB-INF/web.xml                    # Configuration
└── lib/mysql-connector-j-8.3.0.jar        # MySQL driver
```

## 🛠️ **Prerequisites**

### **Software Required:**
1. **Java JDK 11+**
2. **Eclipse IDE for Enterprise Java Developers**
3. **Apache Tomcat 10.1**
4. **MySQL 8.0+**
5. **MySQL Connector/J 8.3.0**

### **Browser Support:**
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

## 📦 **Setup Instructions**

### **Step 1: Database Setup**
```sql
-- Open MySQL Command Line or Workbench
CREATE DATABASE user_auth_db;

USE user_auth_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Verify table creation
DESCRIBE users;
```

### **Step 2: Eclipse Project Setup**
1. **Open Eclipse** → File → New → Dynamic Web Project
2. Project Name: `RegistrationLoginSystem`
3. Target Runtime: **Tomcat 10.1**
4. Dynamic web module version: **5.0**
5. Check "Generate web.xml deployment descriptor"
6. Click **Finish**

### **Step 3: Add MySQL Connector**
1. Download `mysql-connector-j-8.3.0.jar`
2. Create `lib` folder in project root
3. Right-click JAR → Build Path → Add to Build Path

### **Step 4: Configure Database Connection**
In `AuthServlet.java` and `DatabaseConnection.java`, update:
```java
// Change this line:
"root", "yourpassword"

// To your MySQL password:
"root", "your_actual_mysql_password"
```

## 🚀 **Running the Project**

### **Method 1: Eclipse Run**
1. Right-click project → **Run As → Run on Server**
2. Select **Tomcat 10.1**
3. Click **Finish**
4. Open browser: `http://localhost:8080/RegistrationLoginSystem/`

### **Method 2: Manual Deploy**
1. Right-click project → **Export → WAR file**
2. Copy WAR to Tomcat `webapps` folder
3. Start Tomcat: `catalina.bat run` (Windows) or `./catalina.sh run` (Linux/Mac)
4. Open: `http://localhost:8080/RegistrationLoginSystem/`

## 🌐 **Application Flow**

```
Home Page (register.html)
     ↓
User Registration → Store in MySQL
     ↓
Redirect to Login Page
     ↓
User Login → Validate credentials
     ↓
Welcome Page (welcome.jsp)
     ↓
Logout → Destroy session
```

## 📱 **Pages Description**

### **1. Register Page (`register.html`)**
- Gradient background with floating shapes
- Real-time password strength indicator
- Animated form validation
- Redirects to login after successful registration

### **2. Login Page (`login.html`)**
- Reverse layout design
- Animated input fields
- Error message display for invalid credentials
- Session creation on successful login

### **3. Welcome Page (`welcome.jsp`)**
- Personalized greeting with username
- Dashboard statistics
- Animated success icon
- Logout functionality

### **4. Logout Page (`logout.jsp`)**
- Session invalidation
- Redirect to login with success message

## 🔧 **Servlet Lifecycle Implementation**

### **`init()` Method**
```java
public void init() {
    // 1. Load MySQL driver
    // 2. Establish database connection
    // 3. Initialize resources
}
```

### **`service()`/`doPost()` Method**
```java
protected void doPost() {
    // Handle two actions:
    // 1. "register" - Insert new user
    // 2. "login" - Validate credentials
    // Use PreparedStatement to prevent SQL injection
}
```

### **`destroy()` Method**
```java
public void destroy() {
    // Close database connection
    // Release all resources
    // Log connection closure
}
```

## 🎯 **Key Code Features**

### **Password Strength Indicator**
```javascript
// Real-time password validation
if (password.length >= 8) strength++;
if (/[A-Z]/.test(password)) strength++;
if (/[0-9]/.test(password)) strength++;
```

### **Animated Form Validation**
```javascript
// Shake animation for invalid inputs
form.style.animation = 'shake 0.5s ease-in-out';
```

### **Particle Background**
```javascript
// Create floating particles
particle.style.animation = `float ${duration}s infinite linear`;
```

## ⚙️ **Configuration Files**

### **`web.xml`**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
         version="5.0">
    <welcome-file-list>
        <welcome-file>register.html</welcome-file>
        <welcome-file>login.html</welcome-file>
    </welcome-file-list>
</web-app>
```

### **Database Configuration**
```java
// DatabaseConnection.java
private static final String URL = "jdbc:mysql://localhost:3306/user_auth_db";
private static final String USERNAME = "root";
private static final String PASSWORD = "yourpassword";
```

## 🐛 **Troubleshooting**

### **Common Issues & Solutions:**

| Issue | Solution |
|-------|----------|
| **ClassNotFoundException: com.mysql.cj.jdbc.Driver** | Add JAR to build path |
| **Communications link failure** | Start MySQL service (`net start mysql`) |
| **Access denied for user** | Check MySQL password in code |
| **404 Not Found** | Check Tomcat deployment |
| **Session not working** | Ensure `jakarta.servlet` imports |
| **CSS/JS not loading** | Check path: `assets/css/style.css` |

### **MySQL Service Commands:**
```bash
# Windows
net start mysql
net stop mysql

# Linux/Mac
sudo systemctl start mysql
sudo systemctl stop mysql
```

## 📊 **Testing**

### **Manual Testing:**
1. **Registration Test:**
   - Navigate to `/register.html`
   - Enter username/password
   - Check database insertion

2. **Login Test:**
   - Use registered credentials
   - Verify welcome page loads
   - Check session creation

3. **Logout Test:**
   - Click logout
   - Verify session destruction
   - Check redirect to login

### **Database Verification:**
```sql
-- Check registered users
SELECT * FROM users;

-- Clear test data
TRUNCATE TABLE users;
```

## 🔄 **API Endpoints**

| Method | Endpoint | Parameters | Description |
|--------|----------|------------|-------------|
| POST | `/auth` | `action=register`<br>`username`<br>`password` | Register new user |
| POST | `/auth` | `action=login`<br>`username`<br>`password` | User login |
| GET | `/logout.jsp` | None | Destroy session |

## 🚨 **Security Notes**

### **Best Practices Implemented:**
1. ✅ **PreparedStatement** for SQL queries
2. ✅ **Session management** for authentication
3. ✅ **Input validation** on client and server
4. ✅ **Password length** enforcement
5. ✅ **Resource cleanup** in `destroy()`

### **To Enhance Security:**
1. Add password hashing (BCrypt)
2. Implement CSRF tokens
3. Add rate limiting
4. Enable HTTPS
5. Add password reset functionality

## 📈 **Performance Optimizations**

### **Implemented:**
1. Database connection pooling in `init()`
2. CSS/JS minification (recommended)
3. Image optimization
4. Cache control headers

### **Recommended:**
1. Use connection pool (HikariCP)
2. Implement gzip compression
3. Add CDN for static assets
4. Database indexing

## 📚 **Learning Outcomes**

### **Servlet Concepts:**
- Servlet lifecycle (init, service, destroy)
- Request/response handling
- Session management
- Servlet annotations (@WebServlet)

### **Web Development:**
- HTML5 forms with validation
- CSS3 animations and gradients
- JavaScript DOM manipulation
- AJAX form submission

### **Database:**
- JDBC connection management
- PreparedStatement usage
- ResultSet handling
- CRUD operations

## 🤝 **Contributing**

### **Want to improve this project?**
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

### **Suggested Improvements:**
- [ ] Add email verification
- [ ] Implement "Remember Me" feature
- [ ] Add password reset functionality
- [ ] Include CAPTCHA
- [ ] Add social login (Google, Facebook)
- [ ] Implement two-factor authentication

## 📄 **License**

This project is for **educational purposes**. Feel free to use, modify, and distribute.

## 👨‍💻 **Author**

**Your Name**  
Java Full Stack Developer  
Project for Servlet/JSP Learning

## 🙏 **Acknowledgements**

- Eclipse Foundation for IDE
- Apache Tomcat Team
- MySQL Development Team
- Font Awesome for icons
- Google Fonts for typography

## 🌟 **Star History**

If you find this project helpful, please give it a star! ⭐

### **Quick Fixes:**
```bash
# Reset everything
1. Stop Tomcat
2. Clean Tomcat workspace
3. Clean Eclipse project
4. Restart everything

**Happy Coding! 🚀**  
