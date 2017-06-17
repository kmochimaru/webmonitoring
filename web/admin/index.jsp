<%@page import="entities.Teacher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="daoImp.TeacherDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ผู้ดูแลระบบ</title>
        <jsp:include page="../static/head_tag.jsp"/>
    </head>
    <body style="background-color: #FFF;">
        <jsp:include page="nav_bar.jsp"/>
        <div class="container">
            <center>
                <div class="adminpag">
                    <h1 >จัดการบัญชีผู้ใช้</h1>
                    <table class="table">
                        <tr class="success">
                            <th><center>ลำดับ</center></th>
                        <th><center>ชื่อ - นามสกุล</center></th>
                        <th><center>แก้ไขผู้ใช้งาน</center></th>
                        <th><center>ลบผู้ใช้งาน</center></th>
                        </tr>
                        <%
                            int i = 1;
                            List<Teacher> list = new ArrayList();
                            TeacherDaoImp dao = new TeacherDaoImp();
                            list = dao.getAllTeacher();
                            if (list.size() > 0) {
                                for (Teacher bean : list) {
                        %>
                        <tr>
                            <td align="center">
                                <%= i++%>
                            </td>
                            <td align="center"> 
                                <%= bean.getName()%> &nbsp; <%= bean.getSurname()%>
                            </td>
                            <td align="center">
                                <button data-toggle="modal" data-target="#editModal<%= bean.getTeacherId()%>" type="button" class="btn btn-warning">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </button>
                                <!-- edit popup -->
                                <div id="editModal<%= bean.getTeacherId()%>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">แก้ไขบัญชีผู้ใช้</h4>
                                            </div>
                                            <form action="${pageContext.request.contextPath}/TeacherController?action=update" method="POST">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label style="text-align: left" for="teacherId">รหัส :</label>
                                                        <input type="number" id="teacherId" name="teacherId" value="<%= bean.getTeacherId()%>" class="form-control" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nameTitle">คำขึ้นต้น :</label>
                                                        <input type="text" id="nameTitle" name="nameTitle" value="<%= bean.getNameTitle()%>" class="form-control" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="name">ชื่อ :</label>
                                                        <input type="text" id="name" name="name" value="<%= bean.getName()%>" class="form-control" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="surname">นามสกุล :</label>
                                                        <input type="text" id="surname" name="surname" value="<%= bean.getSurname()%>" class="form-control" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="username">บัญชีผู้ใช้ :</label>
                                                        <input type="text" id="username" name="username" value="<%= bean.getUsername()%>" class="form-control" required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="password">รหัสผ่าน :</label>
                                                        <input type="text" id="password" name="password" value="<%= bean.getPassword()%>" class="form-control" required="required">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                                                    <input id="btnEdit" type="submit" class="btn btn-success" value="แก้ไข">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td align="center">
                                <a href="${pageContext.request.contextPath}/TeacherController?action=del&teacherId=<%= bean.getTeacherId()%>">
                                    <button type="button" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
            </center>
            <br><br>
            <center>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;เพิ่มรายชื่ออาจารย์
                </button>
            </center>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <form action="${pageContext.request.contextPath}/TeacherController?action=add" method="POST" class="form-group">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">เพิ่มผู้ใช้งาน</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label style="text-align: left" for="teacherId">รหัส :</label>
                                <input type="number" id="teacherId" name="teacherId" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label for="nameTitle">คำขึ้นต้น :</label>
                                <input type="text" id="nameTitle" name="nameTitle" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label for="name">ชื่อ :</label>
                                <input type="text" id="name" name="name" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label for="surname">นามสกุล :</label>
                                <input type="text" id="surname" name="surname" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label for="username">บัญชีผู้ใช้ :</label>
                                <input type="text" id="username" name="username" class="form-control" required="required">
                            </div>
                            <div class="form-group">
                                <label for="password">รหัสผ่าน :</label>
                                <input type="text" id="password" name="password" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                            <input type="Submit" value="ตกลง" id="submit" class=" btn btn-success">
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
