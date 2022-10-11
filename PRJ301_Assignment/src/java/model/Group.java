/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Acer
 */
public class Group {
    private int group_id;
    private String group_name;
    private Session session;
    private Lecturer lecturer;
    private Subject subject;
    private ArrayList<StudentGroup> studentgroup = new ArrayList<>();

    public Group() {
    }

    public ArrayList<StudentGroup> getStudentgroup() {
        return studentgroup;
    }

    public void setStudentgroup(ArrayList<StudentGroup> studentgroup) {
        this.studentgroup = studentgroup;
    }

    public Group(int group_id, String group_name, Session session, Lecturer lecturer, Subject subject) {
        this.group_id = group_id;
        this.group_name = group_name;
        this.session = session;
        this.lecturer = lecturer;
        this.subject = subject;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public Lecturer getLecturer() {
        return lecturer;
    }

    public void setLecturer(Lecturer lecturer) {
        this.lecturer = lecturer;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    
    
    
    
   
}
