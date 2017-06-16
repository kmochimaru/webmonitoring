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
        <title>แก้ไขรายงานเข้าชั้นเรียน</title>
        <jsp:include page="../static/head_tag.jsp" />
        <link rel="stylesheet" type="text/css"  href="../css/style.css" >
        <link rel="stylesheet" type="text/css"  href="../css/loader.css" >
    </head>
    <body style="background-color: #FFFFFF;" onload="myLoading()">
        <div class="container" ng-app="stateApp" ng-controller="updateController">
            <jsp:include page="../static/nav_bar.jsp" />
                <center><h1>แก้ไขใบรายชื่อ</h1></center>
                <center><h2>วิชา <%= new String(request.getParameter("subjectName").getBytes("iso-8859-1"), "UTF-8") %></h2></center>
                <div class="form-group row" align="center">
                    <label class="col-sm-2" for="selectDate"><h4>กรุณาเลือกวันที่ :</h4></label>
                    <div class="col-sm-3">
                        <select id="selectDate" name="selectDate" class="form-control" 
                                ng-change="loadReport(selected)" 
                                ng-model="selected" 
                                ng-options="item for item in date">
                        </select>
                    </div>
                </div>
                <br>
                    <div id="loader"></div>
                    <div ng-show="sizeStudent > 0" style="display:none;" id="myDiv" class="animate-bottom">
                        <form>
                            <table class="table" >
                                <thead>
                                    <tr class="info" >
                                        <th><center>ลำดับที่</center></th>
                                        <th><center>ชื่อ - นามสกุล</center></th>
                                        <th><center>รหัสนักศึกษา</center></th>
                                        <th><center>หลักสูตร</center></th>
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
                                                        ng-model="std.state"
                                                        ng-click="toggleSelection(std.id, std.state)" 
                                                        ng-true-value="'attend'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio1{{std.studentId}}">มาเรียน</label>
                                                
                                                <input type="radio" id="radio2{{std.studentId}}" name="group{{key+1}}" value="late"
                                                        ng-model="std.state"
                                                        ng-click="toggleSelection(std.id, std.state)" 
                                                        ng-true-value="'late'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio2{{std.studentId}}">สาย</label>
                                                
                                                <input type="radio" id="radio3{{std.studentId}}" name="group{{key+1}}" value="absent"
                                                        ng-model="std.state"
                                                        ng-click="toggleSelection(std.id, std.state)" 
                                                        ng-true-value="'absent'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio3{{std.studentId}}">ขาด</label>
                                                
                                                <input type="radio" id="radio4{{std.studentId}}" name="group{{key+1}}" value="pbl"
                                                        ng-model="std.state"
                                                        ng-click="toggleSelection(std.id, std.state)" 
                                                        ng-true-value="'pbl'" 
                                                        ng-false-value="'-'"
                                                >
                                                <label for="radio4{{std.studentId}}">ลากิจ</label>
                                                
                                                <input type="radio" id="radio5{{std.studentId}}" name="group{{key+1}}" value="sl"
                                                       ng-model="std.state"
                                                        ng-click="toggleSelection(std.id, std.state)" 
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
                            <input type="submit" class="btn btn-success" name="submit" value="ส่งข้อมูล" ng-click="editList()" ng-disabled="sizeStudent <= 0" >
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        </center>
                        </form>
                    </div>
           
    </div><!------container------>
    <script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/loader.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
    <script src="${pageContext.request.contextPath}/js/checkStudent.js"></script>
    </body>
</html>
