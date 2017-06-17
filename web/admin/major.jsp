<%@page import="entities.Major"%>
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
        <title>จัดการหลักสูตร</title>
        <jsp:include page="../static/head_tag.jsp"/>
    </head>
    <body style="background-color: #FFF;">
        <jsp:include page="nav_bar.jsp"/>
        <div class="container">
            <h1 class="text-center">จัดการหลักสูตร</h1>
            <table class="table">
                <tr class="success">
                    <th><center>ลำดับที่</center></th>
                <th><center>ชื่อหลักสูตร</center></th>
                <th><center>รหัสหลักสูตร</center></th>
                <th><center>แก้ไขหลักสูตร</center></th>
                <th><center>ลบหลักสูตร</center></th>
                </tr>
                <%
                    int i = 1;
                    MajorDaoImp dao = new MajorDaoImp();
                    List<Major> list = new ArrayList();
                    list = dao.getAllMajor();
                    if (list.size() > 0) {
                        for (Major bean : list) {
                %>
                <tr>
                    <td align="center">
                        <%= i++%>
                    </td>
                    <td align="center"> 
                        <%= bean.getMajorName()%>
                    </td>
                    <td align="center"> 
                        <%= bean.getMajorYear()%>
                    </td>
                    <td align="center">
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#editModal<%= bean.getMajorId() %>">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                        <div class="modal fade" id="editModal<%= bean.getMajorId() %>" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="${pageContext.request.contextPath}/MajorController?action=update&majorId=<%= bean.getMajorId() %>" method="POST" class="form-group">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                                            <h4 class="modal-title">เพิ่มหลักสูตร</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>
                                                <label>
                                                    สาขาวิชา
                                                </label>
                                            </p>

                                            <p> 
                                                <input type="text" class="form-control"  id="majorName" name="majorName" value="<%= bean.getMajorName() %>" placeholder="ชื่อหลักสูตร" required>
                                            </p>
                                            <br>
                                            <p>
                                                <label>
                                                    หลักสูตร
                                                </label>
                                            </p>
                                            <p> 
                                                <input type="number" class="form-control"  id="majorYear" name="majorYear" value="<%= bean.getMajorYear() %>" placeholder="หลักสูตร" required>
                                            </p>

                                        </div>
                                        <div class="modal-footer">
                                            <input type="Submit" value="ตกลง" id="submit" class=" btn btn-success">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td align="center">
                        <a href="${pageContext.request.contextPath}/MajorController?action=del&majorId=<%= bean.getMajorId() %>">
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
            <br><br>
            <center>

                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal">
                    <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;เพิ่มหลักสูตร
                </button>
            </center>
        </div>
        <div class="modal fade" id="addModal" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <form action="${pageContext.request.contextPath}/MajorController?action=add" method="POST" class="form-group">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">เพิ่มหลักสูตร</h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                <label>
                                    สาขาวิชา
                                </label>
                            </p>

                            <p> 
                                <input type="text" class="form-control"  id="majorName" name="majorName" placeholder="ชื่อหลักสูตร" required>
                            </p>
                            <br>
                            <p>
                                <label>
                                    หลักสูตร
                                </label>
                            </p>
                            <p> 
                                <input type="number" class="form-control"  id="majorYear" name="majorYear" placeholder="หลักสูตร" required>
                            </p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                            <input type="Submit" value="ตกลง" id="submit" class=" btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
