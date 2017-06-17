/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import daoImp.MajorDaoImp;
import entities.Major;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "MajorController", urlPatterns = {"/MajorController"})
public class MajorController extends HttpServlet {

    MajorDaoImp dao;
    Major bean;
    List<Major> list;
    String json = "";
    Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if(action.equals("del")){
            dao = new MajorDaoImp();
            bean.setMajorId(Integer.parseInt(request.getParameter("majorId")));
            dao.delMajor(bean);
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
            bean = new Major();
            dao  = new MajorDaoImp();
            bean.setMajorName(request.getParameter("majorName"));
            bean.setMajorYear(request.getParameter("majorYear"));
            dao.addMajor(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }else if(action.equals("update")){
            bean = new Major();
            dao  = new MajorDaoImp();
            bean.setMajorId(Integer.parseInt(request.getParameter("majorId")));
            bean.setMajorName(request.getParameter("majorName"));
            bean.setMajorYear(request.getParameter("majorYear"));
            dao.updateMajor(bean);
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
