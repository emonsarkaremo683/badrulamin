
package util;

import dao.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Student;


/**
 *
 * @author Admin
 */
@WebServlet(name = "ServeletJsp", urlPatterns = {"/student"})
public class ServeletJsp extends HttpServlet {
    StudentDao dao = new StudentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String action = request.getParameter("action");
       if("delete".equalsIgnoreCase(action)){
           int id = Integer.parseInt(request.getParameter("id"));
           dao.deleteData(id);
           response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
       
       } else if("edit".equalsIgnoreCase(action)){
           int id = Integer.parseInt(request.getParameter("id"));
           Student s = dao.findById(id);
           request.setAttribute("student", s);
           request.getRequestDispatcher("pages/edit.jsp").forward(request, response);
       
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if("add".equalsIgnoreCase(action)){
            Student s = new Student(request.getParameter("name"),
                    request.getParameter("email"),
                    Double.parseDouble(request.getParameter("fee")));
            
            dao.saveData(s);
            response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
            
        } else if("update".equalsIgnoreCase(action)){
            
            Student s = new Student(Integer.parseInt(request.getParameter("id")),
                    request.getParameter("name"),
                    request.getParameter("email"),
                    Double.parseDouble(request.getParameter("fee")));
            
            dao.updateData(s);
           response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
        
        }

    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
