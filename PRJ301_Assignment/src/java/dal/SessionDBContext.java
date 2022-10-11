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
import model.Session;

/**
 *
 * @author Acer
 */
public class SessionDBContext extends DBContext<Session> {

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
        ArrayList<Session> sessions = new ArrayList<>();
        String sql = "SELECT se.session_id ,se.[date], se.slot, r.room_name, a.[status], t.time_range\n"
                + "FROM [Session] se, Room r, Time_slot t, Attendance a\n"
                + "WHERE se.attendance_id = a.attendance_id and se.room_id = r.room_id\n"
                + "and se.time_id = t.time_id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session se = new Session();
                int session_id = rs.getInt("session_id");
                int slot = rs.getInt("slot");
                String room_name = rs.getString("room_name");
                Boolean status = rs.getBoolean("status");
                String time_range = rs.getString("time_range");
                
                se.setSession_id(session_id);
                se.setSlot(slot);
              
                

            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

}
