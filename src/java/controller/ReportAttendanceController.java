/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
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
import org.hibernate.engine.spi.Status;

/**
 *
 * @author PEEPO
 */
@WebServlet(name = "ReportAttendanceController", urlPatterns = {"/ReportAttendanceController"})
public class ReportAttendanceController extends HttpServlet {
    
    String json = "";
    Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ReportAttendaceDaoImp dao = new ReportAttendaceDaoImp();
        ReportAttendance bean = new ReportAttendance();
        List<String> list = new ArrayList<String>();
        List<ReportAttendance> report = new ArrayList();
        String action = request.getParameter("action")==null?"":request.getParameter("action");
        String jsonStr = request.getParameter("UPDATE")==null?"":request.getParameter("UPDATE");
        
        if(action.equals("reportDate")){
            list = dao.getReportBySubject(request.getParameter("subjectId"));
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
        }else if(action.equals("reportByDate")){
            dao = new ReportAttendaceDaoImp();
            report = dao.getReportByDate(request.getParameter("date"), request.getParameter("subjectId"));
            json = gson.toJson(report);
            response.setContentType("application/json");
            response.getWriter().write(json);
        }else if(action.equals("updateReport")){
            if (jsonStr != "") {
                JsonArray result = (JsonArray) new JsonParser().parse(jsonStr);
                for (int i = 0; i < result.size(); i++) {
                    JsonElement elem = result.get(i);
                    JsonObject obj = elem.getAsJsonObject();
                    bean.setId(obj.get("id").getAsInt());
                    bean.setState(obj.get("state").getAsString());
                    report.add(bean);
                    bean = new ReportAttendance();
                }

                for (ReportAttendance data : report) {
                    dao.updateReportById(data.getId(), data.getState());
                }
            }
        }
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
