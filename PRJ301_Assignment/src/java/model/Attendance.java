/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Acer
 */
public class Attendance {
   private Student student;
   private Session session;
   private boolean present;
   private String description;
   private Date record_time;
   private int countAbsent;

    public int getCountAbsent() {
        return countAbsent;
    }

    public void setCountAbsent(int countAbsent) {
        this.countAbsent = countAbsent;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public boolean isPresent() {
        return present;
    }

    public void setPresent(boolean present) {
        this.present = present;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getRecord_time() {
        return record_time;
    }

    public void setRecord_time(Date record_time) {
        this.record_time = record_time;
    }
   
    public String getAttendanceStatus(boolean present, Session session){
        if(present== true && session.isAttanded()== true){
            return "present";
        }else if (present == false && session.isAttanded() == true){
            return "absent";
        }else 
            return "future";
    }
    
    public String getAttendanceStatusWeeklyTimtable(boolean present, Session session){
        if(present== true && session.isAttanded()== true){
            return "attended";
        }else if (present == false && session.isAttanded() == true){
            return "absent";
        }else 
            return "not yet";
    }
   
    
   
   
    
}
