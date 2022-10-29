/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

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
public class ViewAttendReportController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
