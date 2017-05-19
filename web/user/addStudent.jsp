<%@page import="daoImp.ListinClassDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entities.Ljoin2S"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>เพิ่มรายชื่อนักศึกษา</title>
    <jsp:include page="../static/head_tag.jsp" />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
    <link rel="stylesheet" type="text/css"  href="../css/loader.css" >
</head>

<body style="background-color: #ffffff" onload="myLoading()">
    <jsp:include page="../static/nav_bar.jsp" />    
    <div class="container" ng-app="sortApp" ng-controller="mainController">
        <center><h1>จัดการรายชื่อ</h1></center>
        <center><h2>วิชา <%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %></h2></center>
    <% 
        
        List<Ljoin2S> list = new ArrayList();
        ListinClassDaoImp dao = new ListinClassDaoImp();
        list = dao.getListInClass(new String(request.getParameter("subjectId").getBytes("iso-8859-1"), "UTF-8"));
        request.getSession().setAttribute("subjectId", new String(request.getParameter("subjectId").getBytes("iso-8859-1"), "UTF-8"));
        request.getSession().setAttribute("ListInClass", list);
        request.getSession().setAttribute("sizeListInClass", list.size());
    %>
    <div id="loader"></div>
    <div style="display:none;" id="myDiv" class="animate-bottom">
    <table class="table table-bordered table-striped">
        <thead>
        <style>
            th{
                text-align: center;
            }
        </style>
            <th>รหัสนักศึกษา</th>
            <th>ชื่อ-นามสกุล</th>
            <th>หลักสูตร</th>
            <th>ระดับชั้น</th>
            <th>ลบ</th>
        </thead>
        <tbody>
        <c:forEach var="std" items="${ListInClass}">
            <tr>
                <td>${std.studentId}</td>
                <td>${std.studentName}&nbsp;${std.studentSurname}</td>
                <td>${std.major}</td>
                <td>${std.level}</td>
                <td><a href="${pageContext.request.contextPath}/ListInClassController?action=delete&id=${std.id}"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></a></td>
            </tr>
        </c:forEach>
        <c:if test="${sizeListInClass<=0}">
            <tr style="height: 300px"><td colspan="5"><center><h3 style="color: red; padding-top: 100px">ยังไม่มีรายชื่อนักศึกษาในชั้นเรียน</h3></center></td></tr>
        </c:if>
        </tbody>
    </table>
     
        
    <div align="left"><button data-toggle="modal" data-target="#addList" class="btn btn-default"><span class='glyphicon glyphicon-plus-sign'></span></button></div>
    <!-------- popup addList --------->
    <div id="addList" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">เพิ่มรายชื่อ</h4>
            </div>
            <form>
                <div class="modal-body">
                    <jsp:include page="../static/filterStudent.jsp" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                    <input id="btnAddList" type="submit" class="btn btn-success" value="เพิ่ม" ng-click="addList()" />
                </div>
            </form>
        </div>
      </div>
    </div>
    <!---------- popup addList -------> 
    </div>  
    </div> <!-- container -->
    <script src="${pageContext.request.contextPath}/js/loader.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular-route.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/addStudent.js"></script>
</body>
</html>
