/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.auth.BaseRoleController;
import dal.AccountDBContext;
import dal.AttandanceDBContext;
import dal.GroupDBContext;
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
import model.Session;
import model.Student;
import model.Term;


/**
 *
 * @author Acer
 */
public class AttandanceReportController extends BaseRoleController {

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        
        int stdid = Integer.parseInt(request.getParameter("stdid"));
        
        request.setAttribute("stdid", stdid);
        int term_id = Integer.parseInt(request.getParameter("term_id"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        
        TermDBContext teDB = new TermDBContext();
        ArrayList<Term> term_list = teDB.list();
        request.setAttribute("term", term_list);
        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.getGroupByStudentIDandTermID(stdid, term_id);
        request.setAttribute("groups", groups);
        
        GroupDBContext total = new GroupDBContext();
        int totalSession = total.getTotalSessionsofGroup(gid);
        request.setAttribute("totalSession", totalSession);
        
        
        
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.AttendanceReport(stdid, term_id, gid);
        request.setAttribute("sessions", sessions);
        
        AttandanceDBContext attDB = new AttandanceDBContext();
        ArrayList<Attendance> atts = attDB.getStatusAndDescription(stdid, term_id, gid);
        request.setAttribute("atts", atts);
        
        AttandanceDBContext count = new AttandanceDBContext();
        int countAbsent = count.getAbsentSession(gid, stdid);
        request.setAttribute("countAbsent", countAbsent);
        
        StudentDBContext stuDB = new StudentDBContext();
        Student student = stuDB.get(stdid);
        request.setAttribute("student", student);
        
        
        request.getRequestDispatcher("../view/student/attendreport.jsp").forward(request, response);
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        String username = request.getParameter("username");      
        StudentDBContext sDB = new StudentDBContext();
        int stdid = sDB.getStudentIDByUsername(username);
        
        request.setAttribute("stdid", stdid);
        int term_id = Integer.parseInt(request.getParameter("term_id"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        
        TermDBContext teDB = new TermDBContext();
        ArrayList<Term> term_list = teDB.list();
        request.setAttribute("term", term_list);
        
        GroupDBContext gDB = new GroupDBContext();
        ArrayList<Group> groups = gDB.getGroupByStudentIDandTermID(stdid, term_id);
        request.setAttribute("groups", groups);
        
        GroupDBContext total = new GroupDBContext();
        int totalSession = total.getTotalSessionsofGroup(gid);
        request.setAttribute("totalSession", totalSession);
        
        
        
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.AttendanceReport(stdid, term_id, gid);
        request.setAttribute("sessions", sessions);
        
        AttandanceDBContext attDB = new AttandanceDBContext();
        ArrayList<Attendance> atts = attDB.getStatusAndDescription(stdid, term_id, gid);
        request.setAttribute("atts", atts);
        
        AttandanceDBContext count = new AttandanceDBContext();
        int countAbsent = count.getAbsentSession(gid, stdid);
        request.setAttribute("countAbsent", countAbsent);
        
        StudentDBContext stuDB = new StudentDBContext();
        Student student = stuDB.get(stdid);
        request.setAttribute("student", student);
        
        
        request.getRequestDispatcher("../view/student/attendreport.jsp").forward(request, response);

}
    }
