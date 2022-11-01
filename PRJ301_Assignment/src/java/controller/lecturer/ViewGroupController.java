/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import controller.auth.BaseRoleController;
import dal.GroupDBContext;
import dal.LecturerDBContext;
import dal.StudentDBContext;
import dal.TermDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Group;
import model.Lecturer;
import model.Student;
import model.Term;

/**
 *
 * @author Acer
 */
public class ViewGroupController extends BaseRoleController {

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
         
        int lid = Integer.parseInt(request.getParameter("lid"));
        request.setAttribute("lid", lid);
       
        
        
                

        
        TermDBContext teDB = new TermDBContext();
        ArrayList<Term> term_list = teDB.list();
        request.setAttribute("term", term_list);
        
       

        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.getGroupByLecturerID(lid);
        request.setAttribute("groups", groups);
       
     
        LecturerDBContext lecDB = new LecturerDBContext();
        Lecturer lecturer = lecDB.get(lid);
        request.setAttribute("lecturer", lecturer);
        
        
        
        
        
        request.getRequestDispatcher("../view/lecturer/viewgroup.jsp").forward(request, response);
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        String username = request.getParameter("username");
        
        LecturerDBContext lDB = new LecturerDBContext();
        int lid = lDB.getLecturerIdByUsername(username);
        request.setAttribute("lid", lid);
        
       
        
                

        
        TermDBContext teDB = new TermDBContext();
        ArrayList<Term> term_list = teDB.list();
        request.setAttribute("term", term_list);
        
      

        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.getGroupByLecturerID(lid);
        request.setAttribute("groups", groups);
       
        
        
        
     
       
        LecturerDBContext lecDB = new LecturerDBContext();
        Lecturer lecturer = lecDB.get(lid);
        request.setAttribute("lecturer", lecturer);
        
        
        
        
        
        request.getRequestDispatcher("../view/lecturer/viewgroup.jsp").forward(request, response);
    }
    
}
