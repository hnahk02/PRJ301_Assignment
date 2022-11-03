/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.auth.BaseRoleController;
import dal.AttandanceDBContext;
import dal.GroupDBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TermDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Account;
import model.Attendance;
import model.Group;
import model.Lecturer;
import model.Session;
import model.Student;
import model.Term;


/**
 *
 * @author Acer
 */
public class ViewAttendReportController extends BaseRoleController {

   
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        request.setAttribute("lid", lid);
        
        int term_id = Integer.parseInt(request.getParameter("term_id"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        
        TermDBContext teDB = new TermDBContext();
        ArrayList<Term> term_list = teDB.list();
        request.setAttribute("term", term_list);
        
        TermDBContext t = new TermDBContext();
        Term term = t.get(term_id);
        request.setAttribute("t", term);

        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.getGroupByLecturerIDandTermID(lid,term_id);
        request.setAttribute("groups", groups);
       
        
        GroupDBContext g = new GroupDBContext();
        Group group = g.get(gid);
        request.setAttribute("g", group);
        
       StudentDBContext stdDB = new StudentDBContext();
       ArrayList<Student> stds = stdDB.getListStudentbyLecturerIDandGroupIDandTermID(lid, gid, term_id);
       request.setAttribute("stds", stds);
       
        LecturerDBContext lecDB = new LecturerDBContext();
        Lecturer lecturer = lecDB.get(lid);
        request.setAttribute("lecturer", lecturer);
        
        
        
        request.getRequestDispatcher("../view/lecturer/viewattendreport.jsp").forward(request, response);
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        String username = request.getParameter("username");
        LecturerDBContext lDB = new LecturerDBContext();
        int lid = lDB.getLecturerIdByUsername(username);
        request.setAttribute("lid", lid);
        
        int term_id = Integer.parseInt(request.getParameter("term_id"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        
        TermDBContext teDB = new TermDBContext();
        ArrayList<Term> term_list = teDB.list();
        request.setAttribute("term", term_list);
        
        TermDBContext t = new TermDBContext();
        Term term = t.get(term_id);
        request.setAttribute("t", term);

        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.getGroupByLecturerIDandTermID(lid,term_id);
        request.setAttribute("groups", groups);
       
        
        GroupDBContext g = new GroupDBContext();
        Group group = g.get(gid);
        request.setAttribute("g", group);
        
       StudentDBContext stdDB = new StudentDBContext();
       ArrayList<Student> stds = stdDB.getListStudentbyLecturerIDandGroupIDandTermID(lid, gid, term_id);
       request.setAttribute("stds", stds);
       
        LecturerDBContext lecDB = new LecturerDBContext();
        Lecturer lecturer = lecDB.get(lid);
        request.setAttribute("lecturer", lecturer);
        
        
        
        request.getRequestDispatcher("../view/lecturer/viewattendreport.jsp").forward(request, response);
    }

}
