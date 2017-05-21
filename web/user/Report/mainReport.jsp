<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="entities.Ljoin2S"%>
<%@page import="daoImp.ListinClassDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Index</title>
        <jsp:include page="../../head_tag.jsp" />
    </head>
    <body style="background-color: #FFFFFF;">
        <% 
            ListinClassDaoImp dao = new ListinClassDaoImp();
            List<Ljoin2S> list_student = new ArrayList();
            list_student = dao.getListInClass(request.getParameter("subjectId"));
            request.getSession().setAttribute("listStudent", list_student);
        %>
        <div class="container">
            <br>
            <br>
            <center>
                <h1>รายงาน วิชา <%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %></h1><br>
                <form action="reportSubject.jsp" method="POST">
                    <input type="hidden" name="subjectName" value="<%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %>"/>
                    <input type="hidden" name="subjectId" value="<%= new String(request.getParameter("subjectId").getBytes("iso-8859-1"), "UTF-8") %>" />
                    <input type="submit" class="btn btn-success btn-lg" value="รายงานการเข้าชั้นเรียน">
                </form><br>
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">
                    รายงานนักศึกษารายคน
                </button><br><br>
                <form action="reportActivity.jsp" method="POST">
                    <input type="hidden" name="subjectName" value="<%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %>"/>
                    <input type="hidden" name="subjectId" value="<%= new String(request.getParameter("subjectId").getBytes("iso-8859-1"), "UTF-8") %>" />
                    <input type="submit" class="btn btn-warning btn-lg" value="รายงานการเข้ากิจกรรม">
                </form><br>
            </center>
            <br><br>
        </div>


        <!-------- pop up รายคน  --------->
        <div id="myModal1" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">กรุณาเลือก</h4>
                    </div>
                    <form  action="reportStudent.jsp" method="POST">
                        <div class="modal-body">
                            <p><div class="form-group">
                                <input type="hidden" name="subjectName" value="<%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %>"/>
                                <input type="hidden" name="subjectId" value="<%= new String(request.getParameter("subjectId").getBytes("iso-8859-1"), "UTF-8") %>" />
                                <label for="sel1">ชื่อนักศึกษา:</label>
                                <select class="form-control" id="sel1" name="studentName">
                                    <c:forEach items="${listStudent}" var="std">
                                        <option value="${std.studentId}">${std.studentName}&nbsp;${std.studentSurname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="typeData" value="subject"/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                            <input type="submit" class="btn btn-success" value="ตกลง">
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <!---------- popup รายคน-------> 

    </body>
</html>
