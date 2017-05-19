/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.SubjectDaoImp;
import entities.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PEEPO
 */
@WebServlet(name = "SubjectController", urlPatterns = {"/SubjectController"})
public class SubjectController extends HttpServlet {
    
    Subject bean;
    SubjectDaoImp dao;
    List<Subject> list;
    Gson gson = new Gson();
    String json;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("GET");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            String action = request.getParameter("action")==null?"":request.getParameter("action");
            bean = new Subject();
            dao  = new SubjectDaoImp();
            list = new ArrayList();
            
            //System.out.println("POST");
            
            if(action.equals("add")){
                bean.setSubjectId(request.getParameter("subject_code"));
                bean.setSubjectName(request.getParameter("subject_name"));
                bean.setTeacherId(session.getAttribute("username_id").toString());
                dao.addSubject(bean);
                response.sendRedirect("user/index.jsp");
            }else if(action.equals("update")){
                bean.setSubjectId(request.getParameter("edit_subject_code"));
                bean.setSubjectName(request.getParameter("edit_subject_name"));
                bean.setTeacherId(session.getAttribute("username_id").toString());
                dao.updateSubject(bean);
                response.sendRedirect("user/index.jsp");
            }if(action.equals("delete")){
                bean.setSubjectId(request.getParameter("subject_code"));
                dao.deleteSubject(bean);
                response.sendRedirect("user/index.jsp");
            }
    }

}
