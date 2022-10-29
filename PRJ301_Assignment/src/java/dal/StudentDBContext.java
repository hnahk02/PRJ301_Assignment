/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;
import model.Student;

/**
 *
 * @author Acer
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Student> getListStudentbyLecturerIDandGroupIDandTermID(int lid, int gid, int term_id) {
        ArrayList<Student> stds = new ArrayList<>();
        try {
            String sql = "select DISTINCT s.stdid , s.stdname , g.gname from Student s \n"
                    + "inner join Student_Group sg on sg.stdid = s.stdid\n"
                    + "inner join [Group] g on g.gid = sg.gid\n"
                    + "inner join [Session] se on se.gid = g.gid\n"
                    + "inner join Lecturer l on l.lid = se.lid\n"
                    + "inner join Term t on t.term_id = g.term_id\n"
                    + "where l.lid = ? and g.gid = ? and t.term_id= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setInt(2, gid);
            stm.setInt(3, term_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                Group g = new Group();

                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));

                stds.add(s);

            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stds;
    }

    public Student get(int id) {
        try {
            String sql = "Select stdid, stdname from Student where stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
