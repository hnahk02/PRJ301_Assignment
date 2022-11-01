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
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author Acer
 */
public class AccountDBContext extends DBContext<Account> {

    public Account get(String username, String password) {
        try {
            String sql = "select a.username,a.displayname, a.classify_account\n"
                    + " ,r.role_id,r.role_name\n"
                    + ",f.fe_id,f.fename,f.url\n"
                    + " from Account a \n"
                    + "  left join Role_Account ra on a.username = ra.username\n"
                    + "  left join [Role] r on r.role_id = ra.role_id\n"
                    + "  left join Role_Feature rf on rf.role_id = r.role_id\n"
                    + "  left join Feature f on f.fe_id = rf.fe_id\n"
                    + "   where a.username = ? and a.[password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account acc = null;
            Role currentRole = new Role();
            currentRole.setRole_id(-1);
            while(rs.next()){
                if(acc==null){
                    acc = new Account();
                    acc.setUsername(rs.getString("username"));
                    acc.setDisplayname(rs.getString("displayname"));
                    acc.setClassify_account(rs.getString("classify_account"));
                }
                int role_id = rs.getInt("role_id");
                if(role_id!=0){
                    if(role_id!= currentRole.getRole_id()){
                        currentRole = new Role();
                        currentRole.setRole_id(rs.getInt("role_id"));
                        currentRole.setRole_name(rs.getString("role_name"));
                        acc.getRoles().add(currentRole);
                    }
                    
                }
                int fe_id = rs.getInt("fe_id");
                if(fe_id!=0){
                    Feature f = new Feature();
                    f.setFe_id(rs.getInt("fe_id"));
                    f.setFe_name(rs.getString("fename"));
                    f.setUrl(rs.getString("url"));
                    currentRole.getFeartures().add(f);
                }
            }
            return acc;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
