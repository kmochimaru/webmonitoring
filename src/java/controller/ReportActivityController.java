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
import daoImp.ReportActivityDaoImp;
import entities.ReportActivity;
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
@WebServlet(name = "ReportActivityController", urlPatterns = {"/ReportActivityController"})
public class ReportActivityController extends HttpServlet {

    String json = "";
    Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ReportActivityDaoImp dao = new ReportActivityDaoImp();
        ReportActivity bean = new ReportActivity();
        List<ReportActivity> list = new ArrayList();
        String jsonStr = request.getParameter("UPDATE") == null ? "" : request.getParameter("UPDATE");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        if (action.equals("editActivity")) {
            list = dao.getReportByActivityId(Integer.parseInt(request.getParameter("activityId")));
            json = gson.toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
        } else if (action.equals("updateReport")) {
            list = new ArrayList();
            if (jsonStr != "") {
                JsonArray result = (JsonArray) new JsonParser().parse(jsonStr);
                for (int i = 0; i < result.size(); i++) {
                    JsonElement elem = result.get(i);
                    JsonObject obj = elem.getAsJsonObject();
                    bean.setId(obj.get("id").getAsInt());
                    bean.setState(obj.get("state").getAsString());
                    bean.setPoint(obj.get("point").getAsInt());
                    list.add(bean);
                    bean = new ReportActivity();
                }
                for (ReportActivity report : list) {
                    dao.updateReportById(report.getId(), report.getState(), report.getPoint());
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ReportActivityDaoImp dao = new ReportActivityDaoImp();
        ReportActivity bean = new ReportActivity();
        List<ReportActivity> list = new ArrayList();
        DateTime dtObj = new DateTime();
        String jsonStr = request.getParameter("INSERT") == null ? "" : request.getParameter("INSERT");

        if (jsonStr != "") {
            JsonArray result = (JsonArray) new JsonParser().parse(jsonStr);
            for (int i = 0; i < result.size(); i++) {
                JsonElement elem = result.get(i);
                JsonObject obj = elem.getAsJsonObject();
                bean.setStudentId(obj.get("id").getAsString());
                bean.setSubjectId(request.getSession().getAttribute("subjectId").toString());
                bean.setActivityId(Integer.parseInt(request.getSession().getAttribute("activityId").toString()));
                if (obj.get("state").getAsString().equals("attend")) {
                    bean.setPoint(Integer.parseInt(request.getSession().getAttribute("point").toString()));
                } else {
                    bean.setPoint(0);
                }
                bean.setState(obj.get("state").getAsString());
                list.add(bean);
                bean = new ReportActivity();
            }

            for (ReportActivity data : list) {
                dao.addReport(data);
            }
        }
    }

}
