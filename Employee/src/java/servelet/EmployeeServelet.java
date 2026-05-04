/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servelet;

import dao.EmployeeDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import model.Employee;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EmployeeServelet", urlPatterns = {"/employee"})
public class EmployeeServelet extends HttpServlet {

    EmployeeDao dao = new EmployeeDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteData(id);
            response.sendRedirect("/pages/index.jsp");

        } else if ("edit".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Employee emp = dao.findById(id);
            request.setAttribute("employee", emp);
            request.getRequestDispatcher("/pages/edit.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            Employee e = new Employee(request.getParameter("name"),
                    request.getParameter("designation"),
                    Double.parseDouble(request.getParameter("salary")),
                    Date.valueOf(request.getParameter("joiningDate")));
            dao.saveData(e);
            response.sendRedirect("/pages/index.jsp");

        } else if ("update".equalsIgnoreCase(action)) {
            Employee e = new Employee(Integer.parseInt(request.getParameter("id")),
                    request.getParameter("name"),
                    request.getParameter("designation"),
                    Double.parseDouble(request.getParameter("salary")),
                    Date.valueOf(request.getParameter("joiningDate")));
            dao.updateData(e);
           

            response.sendRedirect("/pages/index.jsp");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
