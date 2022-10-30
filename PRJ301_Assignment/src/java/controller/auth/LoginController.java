/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Acer
 */
public class LoginController extends HttpServlet {

     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         Cookie c[] = req.getCookies();
         
         if(c!=null){
             for(Cookie o : c){
             if(o.getName().equals("user")){
                 req.setAttribute("username", o.getValue());
             }
             if(o.getName().equals("pass")){
                 req.setAttribute("password", o.getValue());
             }
         }
         }
         
         req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
    }
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        AccountDBContext accDB = new AccountDBContext();
        Account account = accDB.get(username, password);
        if(account == null){     
            req.setAttribute("alert", "Access denied");
            req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
        }
        else{
        
            HttpSession session = req.getSession();
            session.setAttribute("account", account);
            
            Cookie user= new Cookie("username", username);
            Cookie pass = new Cookie("password", password);
            
            user.setMaxAge(2592000);
            if(remember != null){
                 pass.setMaxAge(2592000);
            }else{
                 pass.setMaxAge(0);
            }
          
           
            resp.addCookie(user);
            resp.addCookie(pass);
            
             resp.sendRedirect("home.jsp");
            
        }
    }
    
       
    }

    
   
