/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.TeacherDaoImp;
import entities.Teacher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static security.MD5Hashing.encodeMD5;

@WebServlet(name = "TeacherController", urlPatterns = {"/TeacherController"})
public class TeacherController extends HttpServlet {
    TeacherDaoImp dao;
    Teacher bean;
    List<Teacher> list;
    String json = "";
    Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if(action.equals("del")){
            dao = new TeacherDaoImp();
            bean.setTeacherId(Integer.parseInt(request.getParameter("teacherId")));
            dao.deleteTeacher(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if(action.equals("add")){
            bean = new Teacher();
            dao  = new TeacherDaoImp();
            bean.setName(request.getParameter("name"));
            bean.setSurname(request.getParameter("surname"));
            bean.setNameTitle(request.getParameter("nameTitle"));
            bean.setTeacherId(Integer.parseInt(request.getParameter("teacherId")));
            bean.setUsername(request.getParameter("username"));
            bean.setPassword(encodeMD5(request.getParameter("password")));
            dao.addTeacher(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }else if(action.equals("update")){
            bean = new Teacher();
            dao  = new TeacherDaoImp();
            bean.setName(request.getParameter("name"));
            bean.setSurname(request.getParameter("surname"));
            bean.setNameTitle(request.getParameter("nameTitle"));
            bean.setTeacherId(Integer.parseInt(request.getParameter("teacherId")));
            bean.setUsername(request.getParameter("username"));
            bean.setPassword(request.getParameter("password"));
            dao.updateTeacher(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }
    }

}
