
<%@page import="entities.Student"%>
<%@page import="daoImp.StudentDaoImp"%>
<%@page import="entities.Major"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="daoImp.MajorDaoImp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>จัดการ ข้อมูลนักศึกษา</title>
        <jsp:include page="../static/head_tag.jsp" />
    </head>
    <body style="background-color: #ffffff">
        <%
            //List Major
            MajorDaoImp majorDao = new MajorDaoImp();
            List<Major> majorList = new ArrayList();
            majorList = majorDao.getAllMajor();
            //List Student
            StudentDaoImp dao = new StudentDaoImp();
            List<Student> list = new ArrayList();
            list = dao.getAllStudent();
        %>
        <div class="container">
            <jsp:include page="../static/nav_bar.jsp" />    
            <center><h1>จัดการ ข้อมูลนักศึกษา</h1></center><br>
            <table class="table">
                <tr class="info">
                    <th><center>ลำดับที่</center></th>
                <th><center>รหัสนักศึกษา</center></th>
                <th><center>ชื่อ-นามสกุล</center></th>
                <th><center>หลักสูตร</center></th>
                <th><center>ชั้นปี</center></th>
                <th><center>แก้ไข</center></th>
                <th><center>ลบ</center></th>
                </tr>
                <%
                    int i = 1;
                    for (Student bean : list) {
                %>
                <tr>    
                    <td align="center"><%= i++%></td>
                    <td align="center"><%= bean.getStudentId()%></td>
                    <td align="center"><%= bean.getName()%> &nbsp; <%= bean.getSurname()%></td>
                    <td align="center"><%= bean.getMajor()%></td>
                    <td align="center"><%= bean.getLevel()%></td>
                    <td>
                <center>
                    <button  data-toggle="modal" data-target="#editModal<%= bean.getStudentId()%>" class="btn btn-warning"><span class='glyphicon glyphicon-edit'></span></button>
                </center>   
                <!-------- popup edit --------->
                <div id="editModal<%= bean.getStudentId()%>" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขรายวิชา</h4>
                            </div>
                            <form action="${pageContext.request.contextPath}/StudentController?action=update" method="POST">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input type="hidden" name="edit_student_id" value="<%= bean.getStudentId()%>"/>
                                        <label for="sel1">รหัสนักศึกษา:</label>
                                        <input type="text" name="" class="form-control" value="<%= bean.getStudentId()%>" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label for="sel1">ชื่อ:</label>
                                        <input type="text" name="edit_student_name" class="form-control" value="<%= bean.getName()%>" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="sel1">นามสกุล:</label>
                                        <input type="text" name="edit_student_surname" class="form-control" value="<%= bean.getSurname()%>" required="required"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="sel1">สาขาวิชา:</label>
                                        <select class="form-control" name="edit_student_major" required="required">
                                        <%
                                            for (Major major : majorList) {
                                        %>
                                        <option value="<%= major.getMajorName()%>" <% out.println(major.getMajorName().equals(bean.getMajor())==true?"selected":""); %> >
                                            <%= major.getMajorName()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="sel1">ระดับชั้น: </label>
                                        <input type="text" name="edit_student_level" class="form-control" value="<%= bean.getLevel() %>" required="required"/>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                                    <input type="submit" class="btn btn-success" value="แก้ไข">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!---------- popup edit -------> 

                </td>
                <td>
                <center>
                    <form action="${pageContext.request.contextPath}/StudentController?action=delete&student_id=<%= bean.getStudentId()%>" method="POST">
                        <button type="submit" class="btn btn-danger"><span class='glyphicon glyphicon-remove'></span></button>
                    </form>
                </center>
                </td>
                </tr> 
                <%
                    }
                %>
            </table>
            <div align="center">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addStudent">
                    <span class="glyphicon glyphicon-plus"></span> &nbsp;เพิ่มนักศึกษา
                </button>
            </div> 
            <div style="margin-top: 50px"></div>
            <!-------- pop up --------->
            <div id="addStudent" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">เพิ่มรายชื่อนักศึกษา</h4>
                        </div>
                        <form action="${pageContext.request.contextPath}/StudentController?action=add" method="POST">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="sel1">รหัสนักศึกษา:</label>
                                    <input type="text" name="add_student_id" class="form-control" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="sel1">ชื่อ:</label>
                                    <input type="text" name="add_student_name" class="form-control" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="sel1">นามสกุล:</label>
                                    <input type="text" name="add_student_surname" class="form-control" required="required"/>
                                </div>

                                <div class="form-group">
                                    <label for="sel1">สาขาวิชา:</label>
                                    <!--input type="text" name="add_student_major" class="form-control" required="required"/-->
                                    <select class="form-control" name="add_student_major" required="required">
                                        <%
                                            for (Major major : majorList) {
                                        %>
                                        <option value="<%= major.getMajorName()%>"><%= major.getMajorName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="sel1">ระดับชั้น: </label>
                                    <input type="number" min="1" max="4" name="add_student_level" class="form-control" required="required"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                                <input type="submit" class="btn btn-success" value="เพิ่มรายชื่อ">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!---------- popup -------> 

    </body>
</html>
