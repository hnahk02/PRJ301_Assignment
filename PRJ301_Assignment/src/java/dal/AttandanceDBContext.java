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
import model.Attendance;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Acer
 */
public class AttandanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getStatusAndDescription(int stdid, int term_id, int gid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {

            String sql = "select \n"
                    + "a.[description], a.present, ses.sesid, ses.attanded\n"
                    + "from [Session] ses \n"
                    + "inner join Lecturer l on l.lid = ses.lid\n"
                    + "inner join [Group] g on g.gid = ses.gid\n"
                    + "inner join Term te on g.term_id = te.term_id\n"
                    + "inner join [Subject] sub on sub.subid = g.subid\n"
                    + "inner join Room r on r.rid = ses.rid\n"
                    + "inner join TimeSlot t on t.tid = ses.tid\n"
                    + "inner join Attandance a on a.sesid = ses.sesid\n"
                    + "inner join Student s on s.stdid = a.stdid\n"
                    + "where s.stdid = ? and te.term_id = ? and g.gid = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            stm.setInt(2, term_id);
            stm.setInt(3, gid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Attendance a = new Attendance();
                Session s = new Session();
                a.setDescription(rs.getString("description"));
                a.setPresent(rs.getBoolean("present"));
                s.setSesid(rs.getInt("sesid"));
                s.setAttanded(rs.getBoolean("attanded"));
                a.setSession(s);

                atts.add(a);

            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public ArrayList<Attendance> getStatusAttendWeeklyTimtable(int stdid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {

            String sql = "select \n"
                    + "a.[description], a.present, ses.sesid, ses.attanded\n"
                    + "from [Session] ses \n"
                    + "inner join Lecturer l on l.lid = ses.lid\n"
                    + "inner join [Group] g on g.gid = ses.gid\n"
                    + "inner join Term te on g.term_id = te.term_id\n"
                    + "inner join [Subject] sub on sub.subid = g.subid\n"
                    + "inner join Room r on r.rid = ses.rid\n"
                    + "inner join TimeSlot t on t.tid = ses.tid\n"
                    + "inner join Attandance a on a.sesid = ses.sesid\n"
                    + "inner join Student s on s.stdid = a.stdid\n"
                    + "where s.stdid = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Attendance a = new Attendance();
                Session s = new Session();
                a.setDescription(rs.getString("description"));
                a.setPresent(rs.getBoolean("present"));
                s.setSesid(rs.getInt("sesid"));
                s.setAttanded(rs.getBoolean("attanded"));
                a.setSession(s);

                atts.add(a);

            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public Attendance getAbsent(int gid, int stdid) {
        
        try {

            String sql = "select count(a.present) as 'countAbsent' from Attandance a\n"
                    + "inner join [Session] se on se.sesid= a.sesid\n"
                    + "where se.gid= ?  and a.stdid = ? and a.present = 0\n"
                    + "group by a.present, a.stdid";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, stdid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                Attendance a = new Attendance();
                Session s = new Session();
                
                a.setCountAbsent(rs.getInt("countAbsent"));
                 return a;
               

            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
