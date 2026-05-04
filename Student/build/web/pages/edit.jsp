<%@page import="model.Student" %>

<%
    Student e = (Student) request.getAttribute("student");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Student</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            :root {
                --primary-color: #4e73df;
                --secondary-color: #858796;
                --warning-color: #f6c23e;
                --info-color: #36b9cc;
                --danger-color: #e74c3c;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding: 20px;
            }

            .form-container {
                background: white;
                border-radius: 15px;
                box-shadow: 0 15px 50px rgba(0, 0, 0, 0.15);
                padding: 50px;
                max-width: 600px;
                width: 100%;
                animation: slideUp 0.4s ease;
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .employee-id-badge {
                background: linear-gradient(135deg, var(--info-color), #2e9db5);
                color: white;
                padding: 10px 20px;
                border-radius: 8px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 25px;
                font-weight: 600;
                font-size: 1.1rem;
            }

            .form-header {
                text-align: center;
                margin-bottom: 30px;
                border-bottom: 3px solid var(--warning-color);
                padding-bottom: 20px;
            }

            .form-header h2 {
                color: var(--primary-color);
                font-weight: 700;
                font-size: 2rem;
                margin-bottom: 10px;
            }

            .form-header p {
                color: var(--secondary-color);
                font-size: 1rem;
            }

            .form-group {
                margin-bottom: 25px;
            }

            .form-group label {
                font-weight: 600;
                color: #333;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 1.05rem;
            }

            .form-group label i {
                color: var(--primary-color);
                font-size: 1.2rem;
            }

            .form-control {
                border: 2px solid #e9ecef;
                border-radius: 8px;
                padding: 12px 15px;
                font-size: 1rem;
                transition: all 0.3s ease;
                background-color: #f8f9fa;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                background-color: white;
                box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
                outline: none;
            }

            .form-control::placeholder {
                color: #ccc;
            }

            .required-indicator {
                color: var(--danger-color);
                font-weight: bold;
            }

            .button-group {
                display: flex;
                gap: 12px;
                margin-top: 35px;
            }

            .btn-update,
            .btn-cancel {
                flex: 1;
                padding: 12px 20px;
                font-size: 1rem;
                font-weight: 600;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .btn-update {
                background: linear-gradient(135deg, var(--warning-color), #e6b800);
                color: white;
            }

            .btn-update:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 20px rgba(246, 194, 62, 0.4);
            }

            .btn-update:active {
                transform: translateY(0);
            }

            .btn-cancel {
                background-color: #e9ecef;
                color: #333;
                text-decoration: none;
            }

            .btn-cancel:hover {
                background-color: #dee2e6;
                transform: translateY(-2px);
                box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
                text-decoration: none;
                color: #333;
            }

            .warning-box {
                background-color: #fff3cd;
                border-left: 4px solid var(--warning-color);
                padding: 15px;
                border-radius: 6px;
                margin-bottom: 30px;
                display: flex;
                gap: 10px;
                align-items: flex-start;
            }

            .warning-box i {
                color: #ff9800;
                font-size: 1.3rem;
                flex-shrink: 0;
            }

            .warning-box-text {
                color: #856404;
                font-size: 0.95rem;
            }

            @media (max-width: 576px) {
                .form-container {
                    padding: 30px 20px;
                }

                .form-header h2 {
                    font-size: 1.5rem;
                }

                .button-group {
                    flex-direction: column;
                }

                .btn-update,
                .btn-cancel {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <div class="employee-id-badge">
                <i class="bi bi-person-check"></i>
                Student ID: <%= e.getId() %>
            </div>

            <div class="form-header">
                <h2><i class="bi bi-pencil-square"></i> Edit Student</h2>
                <p>Update the Student information below</p>
            </div>

            <div class="warning-box">
                <i class="bi bi-exclamation-triangle"></i>
                <div class="warning-box-text">
                    Make sure all information is correct before updating
                </div>
            </div>

            <form action="/student" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="id" value="<%= e.getRoll() %>" />

                <div class="form-group">
                    <label for="name">
                        <i class="bi bi-person"></i>
                        Full Name <span class="required-indicator">*</span>
                    </label>
                    <input 
                        type="text" 
                        class="form-control" 
                        id="name" 
                        name="name" 
                        value="<%= e.getName() %>"
                        placeholder="Enter employee name"
                        required 
                        pattern="^[a-zA-Z\s]{3,}$"
                        title="Name should contain only letters and spaces (minimum 3 characters)"
                        />
                </div>

                <div class="form-group">
                    <label for="email">
                        <i class="bi bi-envelope"></i>
                        Subject <span class="required-indicator">*</span>
                    </label>
                    <input 
                        type="text" 
                        class="form-control" 
                        id="subject" 
                        name="subject" 
                        value="<%= e.getSubject() %>"
                        
                        />
                </div>
                 <div class="form-group">
                    <label for="email">
                        <i class="bi bi-envelope"></i>
                        Department <span class="required-indicator">*</span>
                    </label>
                    <input 
                        type="text" 
                        class="form-control" 
                        id="subject" 
                        name="department" 
                        value="<%= e.getDepartment() %>"
                        
                        />
                </div>

                <div class="form-group">
                    <label for="fee">
                        <i class="bi bi-currency-dollar"></i>
                        Marks <span class="required-indicator">*</span>
                    </label>
                    <input 
                        type="number" 
                        class="form-control" 
                        id="marks" 
                        name="marks" 
                        value="<%= e.getMarks() %>"
                       
                        />
                </div>




                <div class="button-group">
                    <button type="submit" class="btn-update">
                        <i class="bi bi-check-circle"></i> Save Changes
                    </button>
                    <a href="/pages/index.jsp" class="btn-cancel">
                        <i class="bi bi-x-circle"></i> Cancel
                    </a>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                function validateForm() {
                    const name = document.getElementById('name').value.trim();
                    const email = document.getElementById('email').value.trim();
                    const fee = document.getElementById('fee').value.trim();

                    if (!name || !email || !fee) {
                        alert('Please fill all required fields!');
                        return false;
                    }

                    if (name.length < 3) {
                        alert('Name should be at least 3 characters long!');
                        return false;
                    }

                    if (fee <= 0) {
                        alert('Fee must be greater than 0!');
                        return false;
                    }

                    return confirm('Are you sure you want to update this student record?');
                }

        </script>
    </body>
</html>
