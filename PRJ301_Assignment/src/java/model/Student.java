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
public class Student {
    private String code;
    private String member;
    private String surname;
    private String middle_name;
    private String given_name;
    private ArrayList<StudentGroup> studentgroup = new ArrayList<>();

    public ArrayList<StudentGroup> getStudentgroup() {
        return studentgroup;
    }

    public void setStudentgroup(ArrayList<StudentGroup> studentgroup) {
        this.studentgroup = studentgroup;
    }

   

    public Student() {
    }

    public Student(String code, String member, String surname, String middle_name, String given_name) {
        this.code = code;
        this.member = member;
        this.surname = surname;
        this.middle_name = middle_name;
        this.given_name = given_name;
    }

  
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }
    
    
    
    
}
