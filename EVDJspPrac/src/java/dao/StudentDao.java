package dao;

import java.sql.Connection;
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

    private DbUtil dbCon = new DbUtil();

    public StudentDao() {
    }

    public void saveData(Student s) {
        String sql = "insert into student(name, email, fee) values(?,?,?)";
        try (Connection con = dbCon.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setDouble(3, s.getFee());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Student> getAll() {
        List<Student> list = new ArrayList<>();
        String sql = "select * from student";
        DbUtil dbUtil = new DbUtil();
        try (Connection con = dbUtil.getCon();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student e = new Student(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getDouble("fee"));
                list.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public void updateData(Student s){
        String sql = "update student set name = ?, email = ?, fee = ? where id = ?";
        try (Connection con = dbCon.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setDouble(3, s.getFee());
            ps.setInt(4, s.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void deleteData(int id){
        String sql = "delete from student where id = ?";
        try (Connection con = dbCon.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Student findById(int id) {
        Student e = null;
        String sql = "select * from student where id = ?";
        try (Connection con = dbCon.getCon();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    e = new Student(rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getDouble("fee"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return e;
    }

}
