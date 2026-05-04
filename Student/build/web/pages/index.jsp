<%@page import="dao.StudentDao" %>
<%@page import="model.Student" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
    List<Student> list = StudentDao.getAll();
    request.setAttribute("list", list);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            :root {
                --primary-color: #4e73df;
                --secondary-color: #858796;
                --success-color: #1cc88a;
                --danger-color: #e74c3c;
                --warning-color: #f6c23e;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding: 20px 0;
            }

            .container-wrapper {
                background: white;
                border-radius: 15px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
                margin: 20px auto;
                padding: 40px;
                max-width: 1200px;
            }

            .header-section {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                border-bottom: 3px solid var(--primary-color);
                padding-bottom: 20px;
            }

            .header-section h1 {
                color: var(--primary-color);
                font-weight: 700;
                font-size: 2.5rem;
                margin: 0;
            }

            .header-section .btn {
                padding: 10px 25px;
                font-weight: 600;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .btn-add-employee {
                background-color: var(--success-color);
                color: white;
                border: none;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }

            .btn-add-employee:hover {
                background-color: #16a085;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(28, 200, 138, 0.4);
                color: white;
                text-decoration: none;
            }

            .table-wrapper {
                overflow-x: auto;
            }

            .table {
                margin-bottom: 0;
                border-collapse: collapse;
            }

            .table thead {
                background: linear-gradient(135deg, var(--primary-color), #224abe);
                color: white;
            }

            .table thead th {
                border: none;
                padding: 18px 15px;
                font-weight: 600;
                font-size: 15px;
                letter-spacing: 0.5px;
                vertical-align: middle;
            }

            .table tbody tr {
                border-bottom: 1px solid #e9ecef;
                transition: all 0.2s ease;
            }

            .table tbody tr:hover {
                background-color: #f8f9fa;
                box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.05);
            }

            .table tbody td {
                padding: 16px 15px;
                vertical-align: middle;
                color: #333;
            }

            .action-buttons {
                display: flex;
                gap: 8px;
            }

            .btn-action {
                padding: 7px 15px;
                font-size: 13px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 5px;
            }

            .btn-edit {
                background-color: var(--primary-color);
                color: white;
            }

            .btn-edit:hover {
                background-color: #3d5ac4;
                transform: translateY(-1px);
                box-shadow: 0 3px 10px rgba(78, 115, 223, 0.4);
                text-decoration: none;
                color: white;
            }

            .btn-delete {
                background-color: var(--danger-color);
                color: white;
            }

            .btn-delete:hover {
                background-color: #c0392b;
                transform: translateY(-1px);
                box-shadow: 0 3px 10px rgba(231, 76, 60, 0.4);
                text-decoration: none;
                color: white;
            }

            .empty-state {
                text-align: center;
                padding: 60px 20px;
                color: #999;
            }

            .empty-state i {
                font-size: 4rem;
                color: #ddd;
                margin-bottom: 20px;
            }

            .empty-state p {
                font-size: 1.2rem;
                margin-bottom: 20px;
            }

            .employee-count {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 15px 25px;
                border-radius: 8px;
                font-weight: 600;
                display: inline-block;
            }

            @media (max-width: 768px) {
                .container-wrapper {
                    padding: 20px;
                }

                .header-section {
                    flex-direction: column;
                    gap: 15px;
                    align-items: flex-start;
                }

                .header-section h1 {
                    font-size: 1.8rem;
                }

                .btn-add-employee {
                    width: 100%;
                    justify-content: center;
                }

                .table {
                    font-size: 14px;
                }

                .table thead th,
                .table tbody td {
                    padding: 12px 8px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-wrapper">
            <div class="header-section">
                <div>
                    <h1><i class="bi bi-people"></i> Student Management</h1>
                </div>
                <a href="pages/Add.jsp" class="btn-add-employee">
                    <i class="bi bi-plus-circle"></i> Add New Student
                </a>
            </div>

            <div style="margin-bottom: 20px;">
                <span class="employee-count">
                    <i class="bi bi-info-circle"></i> Total Students: ${list.size()}
                </span>
            </div>




            <c:choose>
                <c:when test="${not empty list}">
                    <div class="table-wrapper">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash"></i> ID</th>
                                    <th><i class="bi bi-person"></i> Name</th>
                                    <th><i class="bi bi-envelope"></i> Email</th>
                                    <th><i class="bi bi-currency-dollar"></i> Fee</th>                                
                                    <th><i class="bi bi-gear"></i> Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="emp">
                                    <tr>
                                        <td><strong>${emp.id}</strong></td>
                                        <td>${emp.name}</td>
                                        <td>${emp.email}</td>
                                        <td>${emp.fee}</td>
                                        <td>
                                            <div class="action-buttons">
                                                <a href="/student?action=edit&id=${emp.id}" class="btn-action btn-edit">
                                                    <i class="bi bi-pencil-square"></i> Edit
                                                </a>
                                                <a href="/student?action=delete&id=${emp.id}" class="btn-action btn-delete" 
                                                   onclick="return confirm('Are you sure you want to delete this student?');">
                                                    <i class="bi bi-trash"></i> Delete
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="bi bi-inbox"></i>
                        <p>No students found</p>
                        <a href="/pages/Add.jsp" class="btn-add-employee">
                            <i class="bi bi-plus-circle"></i> Add First Student
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>


        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
