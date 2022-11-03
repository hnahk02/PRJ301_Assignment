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
import model.Term;

/**
 *
 * @author Acer
 */
public class GroupDBContext extends DBContext<Group> {

    public ArrayList<Group> getGroupByStudentIDandTermID(int stdid, int term_id) {

        ArrayList<Group> groups = new ArrayList();
        try {

            String sql = "select g.gid, g.gname from [Group] g\n"
                    + "inner join Student_Group sg on sg.gid = g.gid\n"
                    + "inner join Student s on s.stdid = sg.stdid\n"
                    + "inner join Term t on t.term_id = g.term_id\n"
                    + "where  s.stdid = ? and t.term_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            stm.setInt(2, term_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group group = new Group();

                group.setGid(rs.getInt("gid"));
                group.setGname(rs.getString("gname"));

                groups.add(group);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;

    }

    public ArrayList<Group> getGroupByLecturerIDandTermID(int stdid, int term_id) {

        ArrayList<Group> groups = new ArrayList();
        try {

            String sql = "select g.gid, g.gname from [Group] g \n"
                    + "inner join Lecturer l on l.lid = g.lid\n"
                    + "inner join Term t on t.term_id = g.term_id\n"
                    + "where l.lid = ? and t.term_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            stm.setInt(2, term_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group group = new Group();

                group.setGid(rs.getInt("gid"));
                group.setGname(rs.getString("gname"));

                groups.add(group);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;

    }
    
     public ArrayList<Group> getGroupByLecturerID(int stdid) {

        ArrayList<Group> groups = new ArrayList();
        try {

            String sql = "select g.gid, g.gname from [Group] g \n"
                    + "inner join Lecturer l on l.lid = g.lid\n"
                    + "inner join Term t on t.term_id = g.term_id\n"
                    + "where l.lid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group group = new Group();

                group.setGid(rs.getInt("gid"));
                group.setGname(rs.getString("gname"));

                groups.add(group);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;

    }
    
    
    public int getTotalSessionsofGroup(int gid){
        try {
            String sql = "select MAX(se.[index]) as 'totalSlot' from [Session] se where se.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Group g = new Group();
                
                return rs.getInt("totalSlot");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Group get(int id) {
        try {
            String sql = "Select gid, gname from [Group] where gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Group g = new Group();
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                return g;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
