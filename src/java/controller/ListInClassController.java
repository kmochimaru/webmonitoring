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
import daoImp.ListinClassDaoImp;
import entities.ListInClass;
import entities.Ljoin2S;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ListInClassController", urlPatterns = {"/ListInClassController"})
public class ListInClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ListinClassDaoImp dao = new ListinClassDaoImp();
        ListInClass bean = new ListInClass();
        List<ListInClass> list = new ArrayList();
        String json = "";
        Gson gson = new Gson();
        HttpSession session = request.getSession();
        String action = request.getParameter("action")==null?"":request.getParameter("action");
        
        if(action.equals("delete")){
            bean.setId(Integer.parseInt(request.getParameter("id")));
            dao.deleteListInClass(bean);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE HTML>");
            out.println("<html>");
            out.println(" <body>");
            out.println(" <script>window.location.replace(document.referrer)</script>");
            out.println(" </body>");
            out.println("</html>");
        }else if(action.equals("read")){
            List<Ljoin2S> listJoin = new ArrayList();
            listJoin = dao.getListInClass(session.getAttribute("subjectId").toString());
            response.setContentType("application/json");
            json = gson.toJson(listJoin);
            response.getWriter().write(json);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ListinClassDaoImp dao = new ListinClassDaoImp();
        ListInClass bean = new ListInClass();
        List<ListInClass> list = new ArrayList();
        String jsonStr = request.getParameter("INSERT")==null?"":request.getParameter("INSERT");
        
        if(jsonStr != ""){
            JsonArray result = (JsonArray) new JsonParser().parse(jsonStr);
            for (int i = 0; i < result.size(); i++) {
                JsonElement elem = result.get(i);
                JsonObject obj = elem.getAsJsonObject();
                bean.setStudentId(obj.get("id").getAsString());
                bean.setSubjectId(request.getSession().getAttribute("subjectId").toString());
                list.add(bean);
                bean = new ListInClass();
            }

            for(ListInClass data : list){
                dao.addListInClass(data);
            }
        }
    }

}
