/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.auth.BaseRoleController;
import dal.AttandanceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Attendance;
import model.Session;
import model.Student;
import model.TimeSlot;
import utility.DateTimeManipulate;


/**
 *
 * @author Acer
 */
public class WeeklyTimtableController extends BaseRoleController {

    

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        int stdid = Integer.parseInt(request.getParameter("stdid"));
        request.setAttribute("stdid", stdid);
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if(raw_from ==null || raw_from.length() ==0)
        {
            Date today = new Date();
            int todayOfWeek = DateTimeManipulate.getDayofWeek(today);
            Date e_from = DateTimeManipulate.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeManipulate.addDays(today, 8-todayOfWeek);
            from = DateTimeManipulate.toDateSql(e_from);
            to = DateTimeManipulate.toDateSql(e_to);
        }
        else
        {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }
        
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("dates", DateTimeManipulate.getDateList(from, to));
        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        request.setAttribute("slots", slots);
        
        AttandanceDBContext attDB = new AttandanceDBContext();
        ArrayList<Attendance> atts = attDB.getStatusAttendWeeklyTimtable(stdid);
        request.setAttribute("atts", atts);
        
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.filterStudentWeeklyTimtablebyDate(stdid, from, to);
        request.setAttribute("sessions", sessions);
        
        StudentDBContext stuDB = new StudentDBContext();
        Student student = stuDB.get(stdid);
        request.setAttribute("student", student);
        
       
        
            
            
            
        request.getRequestDispatcher("../view/student/weeklytimtable.jsp").forward(request, response);
    
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        String username = request.getParameter("username");
        StudentDBContext sDB = new StudentDBContext();
        int stdid = sDB.getStudentIDByUsername(username) ;
        request.setAttribute("stdid", stdid );
        
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if(raw_from ==null || raw_from.length() ==0)
        {
            Date today = new Date();
            int todayOfWeek = DateTimeManipulate.getDayofWeek(today);
            Date e_from = DateTimeManipulate.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeManipulate.addDays(today, 8-todayOfWeek);
            from = DateTimeManipulate.toDateSql(e_from);
            to = DateTimeManipulate.toDateSql(e_to);
        }
        else
        {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }
        
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("dates", DateTimeManipulate.getDateList(from, to));
        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        request.setAttribute("slots", slots);
        
        AttandanceDBContext attDB = new AttandanceDBContext();
        ArrayList<Attendance> atts = attDB.getStatusAttendWeeklyTimtable(stdid);
        request.setAttribute("atts", atts);
        
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.filterStudentWeeklyTimtablebyDate(stdid, from, to);
        request.setAttribute("sessions", sessions);
        
        StudentDBContext stuDB = new StudentDBContext();
        Student student = stuDB.get(stdid);
        request.setAttribute("student", student);
        
       
        
            
            
            
        request.getRequestDispatcher("../view/student/weeklytimtable.jsp").forward(request, response);
    
    }

   

}
