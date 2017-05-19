/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import daoImp.ReportAttendaceDaoImp;
import entities.ReportAttendance;
import controller.DateTime;
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
@WebServlet(name = "ReportAttendanceController", urlPatterns = {"/ReportAttendanceController"})
public class ReportAttendanceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ReportAttendaceDaoImp dao = new ReportAttendaceDaoImp();
        ReportAttendance bean = new ReportAttendance();
        List<ReportAttendance> list = new ArrayList();
        DateTime dtObj = new DateTime();
        String jsonStr = request.getParameter("INSERT")==null?"":request.getParameter("INSERT");
        
        if(jsonStr != ""){
            JsonArray result = (JsonArray) new JsonParser().parse(jsonStr);
            for (int i = 0; i < result.size(); i++) {
                JsonElement elem = result.get(i);
                JsonObject obj = elem.getAsJsonObject();
                bean.setStudentId(obj.get("id").getAsString());
                bean.setSubjectId(request.getSession().getAttribute("subjectId").toString());
                bean.setState(obj.get("state").getAsString());
                bean.setDate(dtObj.getDate());
                bean.setTime(dtObj.getTime());
                list.add(bean);
                bean = new ReportAttendance();
            }

            for(ReportAttendance data : list){
                dao.addReport(data);
            }
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
