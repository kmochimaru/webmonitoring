<%@page import="entities.Student"%>
<%@page import="daoImp.StudentDaoImp"%>
<%@page import="entities.ReportAttendance"%>
<%@page import="daoImp.ReportAttendaceDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>รายงานนักศึกษา</title>
        <%@include file="head_tag.jsp"%>
    </head>
    <body>
       <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <div class="container">
            <%
                int i = 0;
                ReportAttendaceDaoImp dao = new ReportAttendaceDaoImp();
                List<String> list_date = new ArrayList<String>();
                list_date = dao.getReportBySubject(request.getParameter("subjectId"));
                if (list_date.size() > 0) {
                    for (i = 0; i < list_date.size(); i++) {
            %>
            <br><br>
            <div class="page">
                <page size="A4">
                    <div style="text-align: center;">
                        <br>
                        <table style="width:80%;"  align="center"> 
                            <tr>
                                <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png" width="100" height="100"></td>
                                <td><br><br>
                            <center>
                                <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                <h5>
                                    รายงาน การเข้าเรียน  วิชา <%=new String(request.getParameter("subjectName").getBytes("ISO-8859-1"), "UTF-8")%>
                                    (<%=new String(request.getParameter("subjectId").getBytes("ISO-8859-1"), "UTF-8")%>)
                                </h5>
                                <h5>
                                    ประจำวันที่ <%= list_date.get(i)%>
                                </h5>
                                <h5>
                                    ภาคเรียนที่ ${term} ปีการศึกษา พ.ศ. ${academicYear}
                                </h5>
                                <h5> ออกรายงานโดย &nbsp; ${username}</h5>
                            </center>
                            </td>
                            </tr>

                        </table>                      

                    </div>

                    <table class="table table-bordered"  align="center" style="margin-top: 30px; width: 90%">
                        <tr>
                            <th><center>ลำดับ</center></th>
                        <th><center>รหัสนักศึกษา</center></th>
                        <th><center>ชื่อ-นามสกุล</center></th>
                        <th><center>สถานะการเข้าเรียน</center></th>
                        </tr>
                        <%
                            int j = 1;
                            List<ReportAttendance> list_student = new ArrayList<ReportAttendance>();
                            list_student = dao.getReportByDate(list_date.get(i), request.getParameter("subjectId"));
                            for (ReportAttendance bean : list_student) {
                        %>
                        <tr>
                            <td align="center"><%= j++%></td>
                            <td align="center"><%= bean.getStudentId()%></td>
                            <td align="center">
                                <%
                                    StudentDaoImp studentDao = new StudentDaoImp();
                                    List<Student> isStudent = new ArrayList();
                                    isStudent = studentDao.getStudentById(bean.getStudentId());
                                    out.print(isStudent.get(0).getName() + "  " + isStudent.get(0).getSurname());
                                %>
                            </td>
                            <td align="center">
                                <%
                                    if (bean.getState().equals("attend")) {
                                        out.print("เข้าเรียน");
                                    } else if (bean.getState().equals("late")) {
                                        out.print("มาสาย");
                                    } else if (bean.getState().equals("absent")) {
                                        out.print("ขาดเรียน");
                                    } else if (bean.getState().equals("sl")) {
                                        out.print("ลาป่วย");
                                    } else if (bean.getState().equals("pbl")) {
                                        out.print("ลากิจ");
                                    }
                                %>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>


                </page>
            </div>


            <%
                }//for
            %>
            <div id="ShowPrint" style="margin:1px 1px 1px 1px; align-content: rigth;">
                <p align = "right">
                    <Button id="print" type="button" class="btn btn-info btn-lg">
                        <span class="glyphicon glyphicon-print"></span>
                    </Button>
                </p>
            </div>
            <br>

            <%
            }//check no report
            else { // no report
%>
            <br><br>
            <div class="page">
                <page size="A4">
                    <div style="text-align: center;">
                        <br>
                        <table style="width:80%;"  align="center"> 
                            <tr>
                                <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png" width="100" height="100"></td>
                                <td><br><br>
                            <center>
                                <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                <h5>
                                    รายงาน การเข้าเรียน  วิชา <%=new String(request.getParameter("subjectName").getBytes("ISO-8859-1"), "UTF-8")%>
                                    (<%=new String(request.getParameter("subjectId").getBytes("ISO-8859-1"), "UTF-8")%>)
                                </h5>
                                <h5>
                                    ประจำวันที่ -
                                </h5>
                                <h5> ออกรายงานโดย &nbsp; ${username}</h5>
                            </center>
                            </td>
                            </tr>
                        </table>                 
                    </div>
                    <center><h1 style="color: red; padding-top: 20%">ยังไม่มีรายงานการเข้าชั้นเรียน</h1></center>
                </page>
            </div>
            <%
                }
            %>
        </div> <!-- container -->
        
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
    </body>
</html>
