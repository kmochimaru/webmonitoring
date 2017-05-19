<%@page import="daoImp.ListinClassDaoImp"%>
<%@page import="entities.Ljoin2S"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Student</title>
        <jsp:include page="../static/head_tag.jsp" />
        <link rel="stylesheet" type="text/css"  href="../css/style.css" >
        <link rel="stylesheet" type="text/css"  href="../css/loader.css" >
    </head>
    <body style="background-color: #FFFFFF;" onload="myLoading()">
        <div class="container" ng-app="stateApp" ng-controller="mainController">
            <jsp:include page="../static/nav_bar.jsp" />
                <center><h1>เช็คชื่อการเข้าเรียน</h1></center>
                <center><h2>วิชา <%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %></h2></center>
                <% 
                    HttpSession sesstion = request.getSession();
                    sesstion.setAttribute("subjectId", new String(request.getParameter("subjectId").getBytes("iso-8859-1"), "UTF-8"));
                %>
                    <div id="loader"></div>
                    <div style="display:none;" id="myDiv" class="animate-bottom">
                        <form>
                            <table class="table" >
                                <thead>
                                    <tr class="info" >
                                        <th>ลำดับที่</th>
                                        <th>ชื่อ - นามสกุล</th>
                                        <th>รหัสนักศึกษา</th>
                                        <th>หลักสูตร</th>
                                        <th><center>สถานะ</center></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="(key, std) in listStudent">
                                        <td>{{key+1}}</td>
                                        <td>{{std.studentName}}&nbsp;{{std.studentSurname}}</td>
                                        <td>{{std.studentId}}</td>
                                        <td>{{std.major}}</td>
                                        <td><center>
                                                <input type="radio" id="radio1{{std.studentId}}" name="group{{key+1}}" value="attend"
                                                        ng-model="state"
                                                        ng-click="toggleSelection(std.studentId, state)" 
                                                        ng-true-value="'attend'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio1{{std.studentId}}">มาเรียน</label>
                                                
                                                <input type="radio" id="radio2{{std.studentId}}" name="group{{key+1}}" value="late"
                                                        ng-model="state"
                                                        ng-click="toggleSelection(std.studentId, state)" 
                                                        ng-true-value="'late'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio2{{std.studentId}}">สาย</label>
                                                
                                                <input type="radio" id="radio3{{std.studentId}}" name="group{{key+1}}" value="absent"
                                                        ng-model="state"
                                                        ng-click="toggleSelection(std.studentId, state)" 
                                                        ng-true-value="'absent'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio3{{std.studentId}}">ขาด</label>
                                                
                                                <input type="radio" id="radio4{{std.studentId}}" name="group{{key+1}}" value="pbl"
                                                        ng-model="state"
                                                        ng-click="toggleSelection(std.studentId, state)" 
                                                        ng-true-value="'pbl'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio4{{std.studentId}}">ลากิจ</label>
                                                
                                                <input type="radio" id="radio5{{std.studentId}}" name="group{{key+1}}" value="sl"
                                                       ng-model="state"
                                                        ng-click="toggleSelection(std.studentId, state)" 
                                                        ng-true-value="'sl'" 
                                                        ng-false-value="'-'" 
                                                >
                                                <label for="radio5{{std.studentId}}">ลาป่วย</label>
                                           </center>
                                        </td>
                                    </tr>
                                    <tr ng-if="sizeStudent <= 0"  style="height: 300px"><td colspan="5"><center><h3 style="color: red; padding-top: 100px">ยังไม่มีรายชื่อนักศึกษาในชั้นเรียน</h3></center></td></tr>
                                </tbody>
                            </table>
                        <center>
                            <input type="submit" class="btn btn-success" name="submit" value="ส่งข้อมูล" ng-click="addList()" ng-disabled="sizeStudent <= 0" >
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        </center>
                        </form>
                    </div>
           
    </div><!------container------>
    <script src="${pageContext.request.contextPath}/js/loader.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
    <script src="${pageContext.request.contextPath}/js/checkStudent.js"></script>
    </body>
</html>
