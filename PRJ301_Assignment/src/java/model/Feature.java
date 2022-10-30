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
public class Feature {
    private int fe_id;
    private String fe_name;
    private String url;
    private ArrayList<Role> roles = new ArrayList<>();

    public int getFe_id() {
        return fe_id;
    }

    public void setFe_id(int fe_id) {
        this.fe_id = fe_id;
    }

    public String getFe_name() {
        return fe_name;
    }

    public void setFe_name(String fe_name) {
        this.fe_name = fe_name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }
    
    
}
