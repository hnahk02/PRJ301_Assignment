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
   
    public double calAttendPercent(boolean present, Session session){
        int countPresent = 0;
        int countSlot = 0;
        if(this.present==false ){
            countPresent ++;
        }
        if(session.isAttanded()==true || session.isAttanded()==false){
            countSlot++ ;
        }
        return (countPresent/countSlot)*100.0;
    
    }
   
   
    
}
