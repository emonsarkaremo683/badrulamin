package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import util.DBConnection;

public class EmployeeDao {

    public EmployeeDao() {
    }

    static String sql = "";
    static PreparedStatement ps;
    static ResultSet rs;
    static DBConnection dbCon = new DBConnection();

    public void saveData(Employee e) {
        sql = "insert into employee(name, designation, salary, joiningDate) "
                + "values(?,?,?,?)";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getDesignation());
            ps.setDouble(3, e.getSalary());
            ps.setDate(4, e.getJoiningDate());
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<Employee> getAll() {
        List<Employee> list = new ArrayList<>();
        sql = "select * from employee";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Employee e = new Employee(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("designation"),
                        Double.parseDouble(rs.getString("salary")),
                        Date.valueOf(rs.getString("joiningDate")));
                list.add(e);
            }
            ps.close();
            rs.close();

            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public void updateData(Employee e) {
      
        sql = "update employee set name=?, designation=?, salary=?, joiningDate=? where id = ? ";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getDesignation());
            ps.setDouble(3, e.getSalary());
            ps.setDate(4, e.getJoiningDate());
            ps.setInt(5, e.getId());
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
            System.out.println("Updated");
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
   public void deleteData(int id) {
        sql = "delete from employee where id = ? ";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
   
   public Employee findById(int id) {
        Employee e = null;
        sql = "select * from employee where id = ?";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                 e = new Employee(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("designation"),
                        Double.parseDouble(rs.getString("salary")),
                        Date.valueOf(rs.getString("joiningDate")));
                
            }
            ps.close();
            rs.close();

            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return e;
    }

}
