package dao;

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
        // FIX 1: was "values(?,?,?)" — missing 4th placeholder for department
        sql = "insert into student(name, subject, marks, department) values(?,?,?,?)";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getSubject());
            ps.setDouble(3, s.getMarks());
            ps.setString(4, s.getDepartment());
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
            // FIX 3: was [rs.next](http://rs.next)() — corrupted hyperlink syntax
            while (rs.next()) {
                Student e = new Student(
                        rs.getInt("roll"),
                        rs.getString("name"),
                        rs.getString("subject"),
                        rs.getString("department"),
                        rs.getDouble("marks")
                );
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

    public void updateData(Student s) {
        sql = "update student set name=?, subject=?, marks=?, department=? where roll=?";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getSubject());
            ps.setDouble(3, s.getMarks());
            ps.setString(4, s.getDepartment());
            // FIX 2: was setInt(4, ...) — duplicate index overwrote department
            ps.setInt(5, s.getRoll());
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteData(int roll) {
        sql = "delete from student where roll = ?";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setInt(1, roll);
            ps.executeUpdate();
            ps.close();
            dbCon.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Student findById(int roll) {
        Student e = null;
        sql = "select * from student where roll = ?";
        try {
            ps = dbCon.getCon().prepareStatement(sql);
            ps.setInt(1, roll);
            rs = ps.executeQuery();
            // FIX 3: was [rs.next](http://rs.next)() — corrupted hyperlink syntax
            while (rs.next()) {
                e = new Student(
                        rs.getInt("roll"),
                        rs.getString("name"),
                        rs.getString("subject"),
                        rs.getString("department"),
                        rs.getDouble("marks")
                );
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