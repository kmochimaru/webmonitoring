/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daoImp.ActivityDaoImp;
import entities.Activity;
import entities.AjointS;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "ActivityController", urlPatterns = {"/ActivityController"})
public class ActivityController extends HttpServlet {

    Activity bean;
    ActivityDaoImp dao;
    List<Activity> list;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            String action = request.getParameter("action")==null?"":request.getParameter("action");
            bean = new Activity();
            dao  = new ActivityDaoImp();
            list = new ArrayList();
            
            
            if(action.equals("add")){
                bean.setActivityName(request.getParameter("add_activity_name"));
                bean.setDescription(request.getParameter("add_activity_description"));
                bean.setPoint(Integer.parseInt(request.getParameter("add_activity_point")));
                bean.setSubjectId(request.getParameter("add_activity_subject"));
                dao.addActivity(bean);
                response.sendRedirect("user/activity.jsp");
            }else if(action.equals("update")){
                bean.setId(Integer.parseInt(request.getParameter("edit_activity_id")));
                bean.setActivityName(request.getParameter("edit_activity_name"));
                bean.setDescription(request.getParameter("edit_activity_description"));
                bean.setPoint(Integer.parseInt(request.getParameter("edit_activity_point")));
                bean.setSubjectId(request.getParameter("edit_activity_subject"));
                System.out.println(request.getParameter("edit_activity_id"));
                dao.updateActivity(bean);
                response.sendRedirect("user/activity.jsp");
            }else if(action.equals("delete")){
                bean.setId(Integer.parseInt(request.getParameter("activity_id")));
                dao.delActivity(bean);
                response.sendRedirect("user/activity.jsp");
            }
            
            List<AjointS> listActivity = new ArrayList();
            listActivity = dao.getAllActivityJoin();
            session.setAttribute("listActivity", listActivity);
    }
 
}
