/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import controller.auth.BaseRoleController;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import model.Account;
import model.Session;

/**
 *
 * @author Acer
 */
public class ViewListSessionController extends BaseRoleController{
     private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int gid = Integer.parseInt(req.getParameter("gid"));
        
         SessionDBContext sesDB = new SessionDBContext();
         ArrayList<Session> sessions = sesDB.getSessionbyGroupID(gid);
         
         req.setAttribute("sessions", sessions);
         
         req.getRequestDispatcher("../view/lecturer/viewListSessionGroup.jsp").forward(req, resp);
    }
    
    
    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
            processRequest(req,resp);

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
            processRequest(req,resp);

    }

   
    
}
