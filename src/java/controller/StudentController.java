/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.StudentDaoImp;
import entities.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PEEPO
 */
@WebServlet(name = "StudentController", urlPatterns = {"/StudentController"})
public class StudentController extends HttpServlet {
    Student bean;
    StudentDaoImp dao;
    List<Student> list;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action")==null?"":request.getParameter("action");
        bean = new Student();
        dao  = new StudentDaoImp();
        list = new ArrayList();
        String json = "";
        Gson gson = new Gson();
        
        if(action.equals("read")){
            List<Student> listStudent = new ArrayList();
            listStudent = dao.getAllStudent();
            response.setContentType("application/json");
            json = gson.toJson(listStudent);
            response.getWriter().write(json);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action")==null?"":request.getParameter("action");
        bean = new Student();
        dao  = new StudentDaoImp();
        list = new ArrayList();
        
        if(action.equals("add")){
            bean.setStudentId(request.getParameter("add_student_id"));
            bean.setName(request.getParameter("add_student_name"));
            bean.setSurname(request.getParameter("add_student_surname"));
            bean.setMajor(request.getParameter("add_student_major"));
            bean.setLevel(request.getParameter("add_student_level"));
            dao.addStudent(bean);
            response.sendRedirect("user/allStudent.jsp");
        }else if(action.equals("update")){
            bean.setStudentId(request.getParameter("edit_student_id"));
            bean.setName(request.getParameter("edit_student_name"));
            bean.setSurname(request.getParameter("edit_student_surname"));
            bean.setMajor(request.getParameter("edit_student_major"));
            bean.setLevel(request.getParameter("edit_student_level"));
            dao.updateStudent(bean);
            response.sendRedirect("user/allStudent.jsp");
        }else if(action.equals("delete")){
            bean.setStudentId(request.getParameter("student_id"));
            dao.deleteStudent(bean);
            response.sendRedirect("user/allStudent.jsp");
        }
        
        //Get Student and save session value
        List<Student> listStudent = new ArrayList();
        listStudent = dao.getAllStudent();
        request.getSession().setAttribute("listStudent", listStudent);
    }

}
