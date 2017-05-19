
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
                <c:forEach var="std" items="${listStudent}" varStatus="index">
                <tr>    
                <td align="center">${index.count}</td>
                <td align="center">${std.studentId}</td>
                <td align="center">${std.name} &nbsp; ${std.surname}</td>
                <td align="center">${std.major}</td>
                <td align="center">${std.level}</td>
                <td>
                <center>
                        <button  data-toggle="modal" data-target="#editModal${std.studentId}" class="btn btn-warning"><span class='glyphicon glyphicon-edit'></span></button>
                </center>   
                        <!-------- popup edit --------->
                            <div id="editModal${std.studentId}" class="modal fade" role="dialog">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขรายวิชา</h4>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/StudentController?action=update" method="POST">
                                        <div class="modal-body">
                                             <div class="form-group">
                                                <input type="hidden" name="edit_student_id" value="${std.studentId}"/>
                                                <label for="sel1">รหัสนักศึกษา:</label>
                                                <input type="text" name="" class="form-control" value="${std.studentId}" disabled/>
                                            </div>
                                            <div class="form-group">
                                                <label for="sel1">ชื่อ:</label>
                                                <input type="text" name="edit_student_name" class="form-control" value="${std.name}" required="required"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="sel1">นามสกุล:</label>
                                                <input type="text" name="edit_student_surname" class="form-control" value="${std.surname}" required="required"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="sel1">สาขาวิชา:</label>
                                                <input type="text" name="edit_student_major" class="form-control" value="${std.major}" required="required"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="sel1">ระดับชั้น: </label>
                                                <input type="text" name="edit_student_level" class="form-control" value="${std.level}" required="required"/>
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
                        <form action="${pageContext.request.contextPath}/StudentController?action=delete&student_id=${std.studentId}" method="POST">
                               <button type="submit" class="btn btn-danger"><span class='glyphicon glyphicon-remove'></span></button>
                        </form>
                    </center>
                </td>
                </tr> 
                </c:forEach>
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
                                    <input type="text" name="add_student_major" class="form-control" required="required"/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="sel1">ระดับชั้น: </label>
                                    <input type="text" name="add_student_level" class="form-control" required="required"/>
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
