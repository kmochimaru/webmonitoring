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
        <title>Report Student</title>
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
            <%
                int i = 0;
                ReportAttendaceDaoImp dao = new ReportAttendaceDaoImp();
                List<String> list_date = new ArrayList<String>();
                list_date = dao.getReportBySubject(request.getParameter("subjectId"));
                if (list_date.size() > 0) {
                    for (i = 0; i < list_date.size(); i++) {
            %>
            <br><br>
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

                <div id="ShowPrint" style="margin-left: 80px;">
                    <Button id="print" type="button" class="btn btn-default btn-sm" style="margin-left: 10px;">
                        <span class="glyphicon glyphicon-print"></span>
                    </Button>

                </div>
            </page>

            <%
                }//for
            }//check no report
            else { // no report
            %>
            <br><br>
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
            <%
                }
            %>
        </div> <!-- container -->
    </body>
</html>
