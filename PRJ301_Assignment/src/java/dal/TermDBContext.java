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
import model.Term;

/**
 *
 * @author Acer
 */
public class TermDBContext extends DBContext<Term> {

    @Override
    public void insert(Term model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Term model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Term> list() {
         ArrayList<Term> terms = new ArrayList<>();
        String sql = "select term_id, tname from Term";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Term t = new Term();
                int term_id = rs.getInt("term_id");
                String tname = rs.getString("tname");
                 
                t.setTerm_id(term_id);
                t.setTname(tname);
                
                terms.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return terms;
    }
    
   
    @Override
    public Term get(int id) {
         
        try {
            String sql = "select term_id, tname from Term "
                    + "where term_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Term t = new Term();
                int term_id = rs.getInt("term_id");
                String tname = rs.getString("tname");
                 
                t.setTerm_id(term_id);
                t.setTname(tname);
                
               return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
