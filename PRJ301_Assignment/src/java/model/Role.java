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
public class Role {
    private int role_id;
    private String role_name;
    private ArrayList<Account> accounts = new ArrayList<>();
    private ArrayList<Feature> feartures = new ArrayList<>();

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public ArrayList<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(ArrayList<Account> accounts) {
        this.accounts = accounts;
    }

    public ArrayList<Feature> getFeartures() {
        return feartures;
    }

    public void setFeartures(ArrayList<Feature> feartures) {
        this.feartures = feartures;
    }
    
    
    
}
