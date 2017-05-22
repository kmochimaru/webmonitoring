<%@page import="entities.ReportActivitySum"%>
<%@page import="entities.Student"%>
<%@page import="daoImp.StudentDaoImp"%>
<%@page import="entities.ReportActivity"%>
<%@page import="daoImp.ReportActivityDaoImp"%>
<%@page import="daoImp.ActivityDaoImp"%>
<%@page import="entities.Activity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
            <%
                //Student
                StudentDaoImp studentDao = new StudentDaoImp();
                List<Student> isStudent = new ArrayList();
                //Report Activity
                ReportActivityDaoImp reportDao = new ReportActivityDaoImp();
                List<ReportActivity> list_report = new ArrayList();
                //Activity
                ActivityDaoImp dao = new ActivityDaoImp();
                List<Activity> list_activity = new ArrayList();
                list_activity = dao.getActivityBySubjectId(request.getParameter("subjectId"));
                if (list_activity.size() > 0) {
                    for (Activity bean : list_activity) {
            %>
            <br><page size="A4">
                <div style="text-align: center;">
                    <br>
                    <table style="width:80%;"  align="center"> 
                        <tr>
                            <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png" style="width: 80px;"></td>
                            <td><br><br>
                                <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                <h5>รายงานกิจกรรม <%= bean.getActivityName()%> </h5>
                                <h5> ออกรายงานโดย &nbsp; ${username} </h5>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>


                <table class="table table-bordered"  align="center" style="margin-top: 30px; width: 90%"> 
                    <tr>
                        <th><center>ลำดับ</center></th>
                    <th><center>รหัสนักศึกษา</center></th>
                    <th><center>ชื่อ-นามสกุล</center></th>
                    <th><center>คะแนน</center></th>
                    <th><center>สถานะ</center></th>
                    </tr>
                    <%
                        int j = 1;
                        list_report = reportDao.getReportByActivityId(bean.getId());
                        for (ReportActivity std : list_report) {
                            isStudent = studentDao.getStudentById(std.getStudentId());
                    %>
                    <tr>
                        <td align="center"><%= j++ %></td>
                        <td align="center"><%= std.getStudentId()%></td>
                        <td align="center"><%= isStudent.get(0).getName()%>&nbsp;<%= isStudent.get(0).getSurname()%></td>
                        <td align="center"><%= std.getPoint()%>
                        </td>
                        <td align="center">
                        <%
                            if(std.getState().equals("attend"))
                                out.print("เข้าร่วม");
                            else if(std.getState().equals("absent"))
                                out.print("ไม่เข้าร่วม");
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
                }
            } else {
            %>
            <br><page size="A4">
                <div style="text-align: center;">
                    <br>
                    <table style="width:80%;"  align="center"> 
                        <tr>
                            <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png" style="width: 80px;"></td>
                            <td><br><br>
                                <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                <h5>รายงานกิจกรรม </h5>
                                <h5> ออกรายงานโดย &nbsp; ${username} </h5>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>
                <center><h1 style="color: red; padding-top: 20%">ยังไม่มีรายงานการเข้าร่วมกิจกรรม</h1></center>
            </page>  
            <%
                }
            %>
            
            <br><page size="A4">
                <div style="text-align: center;">
                    <br>
                    <table style="width:80%;"  align="center"> 
                        <tr>
                            <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png" style="width: 80px;"></td>
                            <td><br><br>
                                <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                <h5>คะแนนรวมรายงานกิจกรรม</h5>
                                <h5> ออกรายงานโดย &nbsp; ${username} </h5>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>


                <table class="table table-bordered"  align="center" style="margin-top: 30px; width: 90%"> 
                    <tr>
                        <th><center>ลำดับ</center></th>
                    <th><center>รหัสนักศึกษา</center></th>
                    <th><center>ชื่อ-นามสกุล</center></th>
                    <th><center>คะแนนรวม</center></th>
                    </tr>
                    <%
                        int j = 1;
                        List<ReportActivitySum> list_sum = new ArrayList();
                        list_sum = reportDao.getSumPointBySubjectId(request.getParameter("subjectId"));
                        for (ReportActivitySum std : list_sum) {
                            isStudent = studentDao.getStudentById(std.getStudent_id());
                    %>
                    <tr>
                        <td align="center"><%= j++ %></td>
                        <td align="center"><%= std.getStudent_id() %></td>
                        <td align="center"><%= isStudent.get(0).getName()%>&nbsp;<%= isStudent.get(0).getSurname()%></td>
                        <td align="center"><%= std.getTotal() %></td>
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
            
        </div>



    </body>
</html>
