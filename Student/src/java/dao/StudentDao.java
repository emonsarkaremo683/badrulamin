package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import util.DbUtil;

public class StudentDao {

    static String sql = "";
    static PreparedStatement ps;
    static ResultSet rs;
    static DbUtil dbCon = new DbUtil();

    public StudentDao() {
    }

    public void saveData(Student s) {
        sql = "insert into student(name, email, fee) "
                + "values(?,?,?)";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setDouble(3, s.getFee());
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Student> getAll() {
        List<Student> list = new ArrayList<>();
        sql = "select * from student";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Student e = new Student(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        Double.parseDouble(rs.getString("fee")));
                list.add(e);
            }
            ps.close();
            rs.close();

            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public void updateData(Student s){
    sql = "update student set name = ?, email = ?, fee = ? where id = ?";
    try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setDouble(3, s.getFee());
            ps.setInt(4, s.getId());
            
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void deleteData(int id){
        sql = "delete from student where id = ?";
        try {
            ps = dbCon.getCon().prepareStatement(sql);            
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public Student findById(int id) {
        Student e = null;
        sql = "select * from student where id = ?";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                 e = new Student(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        Double.parseDouble(rs.getString("fee")));
                
            }
            ps.close();
            rs.close();

            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return e;
    }

}
