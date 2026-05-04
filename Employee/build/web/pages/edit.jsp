<%@page import="model.Employee" %>

<%
    Employee e = (Employee) request.getAttribute("employee");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
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
            Employee ID: <%= e.getId() %>
        </div>
        
        <div class="form-header">
            <h2><i class="bi bi-pencil-square"></i> Edit Employee</h2>
            <p>Update the employee information below</p>
        </div>
        
        <div class="warning-box">
            <i class="bi bi-exclamation-triangle"></i>
            <div class="warning-box-text">
                Make sure all information is correct before updating
            </div>
        </div>
        
        <form action="/employee" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="id" value="<%= e.getId() %>" />
            
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
                <label for="designation">
                    <i class="bi bi-briefcase"></i>
                    Designation <span class="required-indicator">*</span>
                </label>
                <input 
                    type="text" 
                    class="form-control" 
                    id="designation" 
                    name="designation" 
                    value="<%= e.getDesignation() %>"
                    placeholder="e.g., Manager, Developer, Analyst"
                    required
                    pattern="^[a-zA-Z\s]{2,}$"
                    title="Designation should contain only letters and spaces"
                />
            </div>
            
            <div class="form-group">
                <label for="salary">
                    <i class="bi bi-currency-dollar"></i>
                    Salary <span class="required-indicator">*</span>
                </label>
                <input 
                    type="number" 
                    class="form-control" 
                    id="salary" 
                    name="salary" 
                    value="<%= e.getSalary() %>"
                    placeholder="Enter salary amount"
                    step="0.01" 
                    min="0"
                    required 
                    title="Please enter a valid salary amount"
                />
            </div>
            
            <div class="form-group">
                <label for="joiningDate">
                    <i class="bi bi-calendar"></i>
                    Joining Date <span class="required-indicator">*</span>
                </label>
                <input 
                    type="date" 
                    class="form-control" 
                    id="joiningDate" 
                    name="joiningDate" 
                    value="<%= e.getJoiningDate() %>"
                    required 
                />
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn-update">
                    <i class="bi bi-check-circle"></i> Save Changes
                </button>
                <a href="/CRUDJspPrac/pages/index.jsp" class="btn-cancel">
                    <i class="bi bi-x-circle"></i> Cancel
                </a>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            const designation = document.getElementById('designation').value.trim();
            const salary = document.getElementById('salary').value.trim();
            const joiningDate = document.getElementById('joiningDate').value.trim();
            
            if (!name || !designation || !salary || !joiningDate) {
                alert('Please fill all required fields!');
                return false;
            }
            
            if (name.length < 3) {
                alert('Name should be at least 3 characters long!');
                return false;
            }
            
            if (salary <= 0) {
                alert('Salary must be greater than 0!');
                return false;
            }
            
            return confirm('Are you sure you want to update this employee record?');
        }
    </script>
</body>
</html>
