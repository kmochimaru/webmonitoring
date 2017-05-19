/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daoImp.TeacherDaoImp;
import entities.Teacher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "CommonServlet", urlPatterns = {"/CommonServlet"})
public class CommonServlet extends HttpServlet {

RequestDispatcher dispatcher;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean chk = false;
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        TeacherDaoImp dao = new TeacherDaoImp();
        List<Teacher> list = new ArrayList();
        String username = request.getParameter("username");                     
        String password = request.getParameter("password");                    
        chk = dao.isValidLogin(username, password);                             
        if(chk == true){
            list = dao.getTeacherById(Integer.parseInt(username));
            session.setAttribute("valid_id", list.get(0).getTeacherId());
            session.setAttribute("username_id", username);
            session.setAttribute("username", list.get(0).getNameTitle()+" "+list.get(0).getName()+" "+list.get(0).getSurname());
            response.sendRedirect("user/index.jsp");
        }else{
            session.setAttribute("username", null);
            response.sendRedirect("user/index.jsp");
        }
    }

}
