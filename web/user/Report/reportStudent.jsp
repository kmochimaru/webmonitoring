<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="jdk.nashorn.internal.parser.JSONParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="entities.ReportAttendance"%>
<%@page import="daoImp.ReportAttendaceDaoImp"%>
<%@page import="entities.ReportAttendanceCount"%>
<%@page import="entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="daoImp.StudentDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
        <%@include file="head_tag.jsp"%>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function () {
                var show = true
                $("#print").click(function () {
                    show = false
                    check()
                    window.print()
                    show = true
                    check()
                });

                function check() {
                    if (show)
                        $('#ShowPrint').show()
                    else
                        $('#ShowPrint').hide()
                }

            });
        </script>

        <div class="container">
            <br><page size="A4">  
                <div style="text-align: center;">
                    <br>
                    <table style="width:80%;"  align="center"> 
                        <tr>
                            <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png" style="width: 80px;"></td>
                            <td><br><br>
                                <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                <h5>
                                    รายงาน การเข้าเรียน วิชา <%=new String(request.getParameter("subjectName").getBytes("ISO-8859-1"), "UTF-8")%>
                                    (<%=new String(request.getParameter("subjectId").getBytes("ISO-8859-1"), "UTF-8")%>)
                                </h5>
                                <h5> ออกรายงานโดย &nbsp; ${username}</h5>
                            </td>
                        </tr>      
                    </table>        
                </div>

                <table class="table-bordered" align="center" style="margin-top: 30px; width: 90%"> 
                    <tr>
                        <th><center>รหัสนักศึกษา</center></th>
                    <th><center>ชื่อ-นามสกุล</center></th>
                    <th><center>เข้าเรียน</center></th>
                    <th><center>เข้าสาย</center></th>
                    <th><center>ขาดเรียน</center></th>
                    <th><center>ลากิจ</center></th>
                    <th><center>ลาป่วย</center></th>
                    <th><center>รวม</center></th>
                    </tr>

                    <tr>
                        <td align="center"> <%= request.getParameter("studentName")%></td>
                        <td align="center">
                            <% 
                                StudentDaoImp dao = new StudentDaoImp();
                                List<Student> list = new ArrayList();
                                list = dao.getStudentById(request.getParameter("studentName"));
                                out.print(list.get(0).getName());
                                out.print("&nbsp");
                                out.print(list.get(0).getSurname());
                                
                                ReportAttendaceDaoImp countDao = new ReportAttendaceDaoImp();
                                List<ReportAttendanceCount> count = new ArrayList();
                                count = countDao.getCount(request.getParameter("subjectId"), request.getParameter("studentName"));
                            %>
                        </td>
                        <td align="center"><%= count.get(0).getAttend() %></td>
                        <td align="center"><%= count.get(0).getLate() %></td>
                        <td align="center"><%= count.get(0).getAbsent() %></td>
                        <td align="center"><%= count.get(0).getPbl() %></td>
                        <td align="center"><%= count.get(0).getSl() %></td>
                        <td align="center">---</td>
                    </tr>

                </table>
                <br><br>
                <div id="ShowPrint" style="margin-left: 80px;">
                    <Button id="print" type="button" class="btn btn-default btn-sm" style="margin-left: 10px;">
                        <span class="glyphicon glyphicon-print"></span>
                    </Button>

                </div>
            </page>  

        </div>


        <!-------- pop up --------->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Select Subject</h4>
                    </div>
                    <form method="POST">
                        <div class="modal-body">
                            <p><div class="form-group">
                                <label for="sel1">เลือกวิชา:</label>
                                <select class="form-control" id="sel1" name="subject">
                                    <option value="วิชาที่ 1">วิชาที่ 1</option>
                                    <option value="วิชาที่ 2">วิชาที่ 2</option>
                                    <option value="วิชาที่ 3">วิชาที่ 3</option>          
                                </select>
                            </div>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="typeData" value="subject"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-success" value="Submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!---------- popup -------> 
        <!-- jQuery -->
        <script src="//code.jquery.com/jquery.js"></script>
        <!-- Bootstrap JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">

        </script>
    </body>
</html>
