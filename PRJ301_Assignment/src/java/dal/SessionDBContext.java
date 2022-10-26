/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
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
import model.Term;
import model.TimeSlot;

/**
 *
 * @author Acer
 */
public class SessionDBContext extends DBContext<Session> {
   
    
    public ArrayList<Session> filterStudentWeeklyTimtablebyDate(int stdid, Date from, Date to){
         ArrayList<Session> sessions = new ArrayList<>();
        try {
           
            String sql = "select \n" +
"                    ses.sesid, ses.[date], ses.[index], ses.attanded,\n" +
"                    l.lid, l.lname,\n" +
"                    s.stdid, s.stdname,\n" +
"					g.gid, g.gname,\n" +
"                    sub.subid, sub.subname,\n" +
"                    r.rid, r.rname,\n" +
"                    t.tid,t.[time_range]\n" +
"                    from [Session] ses\n" +
"                    inner join Lecturer l on l.lid = ses.lid\n" +
"                    inner join [Group] g on g.gid = ses.gid\n" +
"                    inner join Term te on g.term_id = te.term_id\n" +
"                    inner join [Subject] sub on sub.subid = g.subid\n" +
"                    inner join Room r on r.rid = ses.rid\n" +
"                    inner join TimeSlot t on t.tid = ses.tid\n" +
"                    inner join Attandance a on a.sesid = ses.sesid\n" +
"                    inner join Student s on s.stdid = a.stdid\n" +
"                    where s.stdid = ? and ses.[date] >= ? and ses.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                 Session session = new Session();
                Lecturer l = new Lecturer();
                Group g = new Group();
                Term te = new Term();
                Subject sub = new Subject();
                Room r = new Room();
                TimeSlot t = new TimeSlot();
                Attendance a = new Attendance();
                Student s = new Student();
                
                session.setSesid(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setAttanded(rs.getBoolean("attanded"));
                
                l.setLid(rs.getInt("lid"));
                l.setLname(rs.getString("lname"));
                session.setLecturer(l);
                
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                session.setGroup(g);
                
                sub.setSubid(rs.getInt("subid"));
                sub.setSubname(rs.getString("subname"));
                g.setSubject(sub);

                r.setRid(rs.getInt("rid"));
                r.setRname(rs.getString("rname"));
                session.setRoom(r);
                
                t.setTid(rs.getInt("tid"));
                t.setTime_range(rs.getString("time_range"));
                session.setTimeslot(t);
                
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                a.setStudent(s);
                
                sessions.add(session);
                
                        
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> AttendanceReport(int stdid, int term_id, int gid) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {

            String sql = "select "
                    + "ses.sesid, ses.[date], ses.[index], ses.attanded,\n"
                    + "l.lid, l.lname,\n"
                    + "s.stdid, s.stdname,\n"
                    + "g.gid, g.gname,\n"
                    + "sub.subid, sub.subname,\n"
                    + "r.rid, r.rname,\n"
                    + "t.tid,t.[time_range]\n"
                    + "from [Session] ses \n"
                    + "inner join Lecturer l on l.lid = ses.lid\n"
                    + "inner join [Group] g on g.gid = ses.gid\n"
                    + "inner join Term te on g.term_id = te.term_id\n"
                    + "inner join [Subject] sub on sub.subid = g.subid\n"
                    + "inner join Room r on r.rid = ses.rid\n"
                    + "inner join TimeSlot t on t.tid = ses.tid\n"
                    + "inner join Attandance a on a.sesid = ses.sesid\n"
                    + "inner join Student s on s.stdid = a.stdid\n"
                    + "where s.stdid = ? and te.term_id = ? and g.gid = ?";
                    
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            stm.setInt(2, term_id);
            stm.setInt(3, gid);
            
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Session session = new Session();
                Lecturer l = new Lecturer();
                Group g = new Group();
                Subject sub = new Subject();
                Room r = new Room();
                TimeSlot t = new TimeSlot();
                Attendance a = new Attendance();
                Student s = new Student();
                
                session.setSesid(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setAttanded(rs.getBoolean("attanded"));
                
                l.setLid(rs.getInt("lid"));
                l.setLname(rs.getString("lname"));
                session.setLecturer(l);
                
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                session.setGroup(g);
                
                sub.setSubid(rs.getInt("subid"));
                sub.setSubname(rs.getString("subname"));
                g.setSubject(sub);

                r.setRid(rs.getInt("rid"));
                r.setRname(rs.getString("rname"));
                session.setRoom(r);
                
                t.setTid(rs.getInt("tid"));
                t.setTime_range(rs.getString("time_range"));
                session.setTimeslot(t);
                
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                a.setStudent(s);
                
                sessions.add(session);
            
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> list() {

        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

   
    public Session get(int year) {
       
        return null;
       
    }

}
