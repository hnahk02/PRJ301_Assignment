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
             if(o.getName().equals("rem")){
                 req.setAttribute("remember", o.getValue());
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
            Cookie rem = new Cookie("remember", remember);
            
            if(remember != null){
                 user.setMaxAge(60*60*24*7);
                 pass.setMaxAge(60*60*24*7);
                 rem.setMaxAge(60*60*24*7);
                
            }else{
                  user.setMaxAge(0);
                 pass.setMaxAge(0);
                 rem.setMaxAge(0);
            }
          
           
            resp.addCookie(user);
            resp.addCookie(pass);
            resp.addCookie(rem);
            
             resp.sendRedirect("home.jsp");
            
        }
    }
    
       
    }

    
   
