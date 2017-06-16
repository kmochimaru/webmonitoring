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
        <title>รายงานรายบุคคล</title>
        <%@include file="head_tag.jsp"%>
    </head>
    <body>

        <div class="container">
            <!--            <br><page size="A4"> -->
            <div class="page" style="width: 210mm; height: 297mm;">
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
                                <h5>
                                    ภาคเรียนที่ ${term} ปีการศึกษา พ.ศ. ${academicYear}
                                </h5>
                                <h5> ออกรายงานโดย &nbsp; ${username}</h5>
                            </td>
                        </tr>      
                    </table>        
                </div>

                <table class="table-bordered" align="center" style="margin-top: 30px; width: 100%"> 
                    <tr>
                        <th  width="20%"><center>รหัสนักศึกษา</center></th>
                    <th  width="20%"><center>ชื่อ-นามสกุล</center></th>
                    <th width="10%"><center>เข้าเรียน</center></th>
                    <th width="10%"><center>เข้าสาย</center></th>
                    <th width="10%"><center>ขาดเรียน</center></th>
                    <th width="10%"><center>ลากิจ</center></th>
                    <th width="10%"><center>ลาป่วย</center></th>
                    <th width="10%"><center>รวม</center></th>
                    </tr>

                    <tr>
                        <td align="center"> <%= request.getParameter("studentName")%></td>
                        <td align="center">
                            <% int Count = 1;
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
                        <td align="center" ><%= count.get(0).getAttend()%></td>
                        <td align="center"><%= count.get(0).getLate()%></td>
                        <td align="center"><%= count.get(0).getAbsent()%></td>
                        <td align="center"><%= count.get(0).getPbl()%></td>
                        <td align="center"><%= count.get(0).getSl()%></td>
                        <td align="center">---</td>
                    </tr>

                </table>
                <br><br>

            </div>
        </page>  
        <div id="ShowPrint" style="margin:1px 1px 1px 1px; align-content: rigth;">
            <p align = "right">
                <Button id="print" type="button" class="btn btn-info btn-lg">
                    <span class="glyphicon glyphicon-print"></span>
                </Button>
            </p>
        </div>
        <br>

    </div>
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
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
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- jQuery -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">

    </script>
</body>
</html>
