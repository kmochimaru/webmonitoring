<%@page import="entities.AjointS"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="daoImp.ActivityDaoImp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html leng="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Activity</title>
        <jsp:include page="../static/head_tag.jsp" />
    </head>
    <body style="background-color: #ffffff">
        <div class="container">
            <jsp:include page="../static/nav_bar.jsp" />
            <% 
                ActivityDaoImp dao = new ActivityDaoImp();
                List<AjointS> listActivity = new ArrayList();
                listActivity = dao.getAllActivityJoin();
                request.getSession().setAttribute("listActivity", listActivity);
            %>
           <center> <h1>จัดการ กิจกรรม</h1></center><br>
           <table class="table">
               <tr class="info">
                    <th><center>ลำดับ</center></th>
                    <th><center>ชื่อกิจกรรม</center></th>
                    <th><center>คะแนน</center></th>
                    <th><center>รายวิชา</center></th>
                    <th><center>เช็คชื่อกิจกรรม</center></th>
                    <th><center>แก้ไขกิจกรรม</center></th>
                    <th><center>ลบกิจกรรม</center></th>
               </tr>
               <c:forEach var="act" items="${listActivity}" varStatus="index">
                <tr>
                    <td>
                        <center>
                            ${index.count}
                        </center>
                    </td>
                    <td>
                        <center>
                            ${act.activityName}
                        </center>
                    </td>
                    <td>
                        <center>
                            ${act.point}
                        </center>
                    </td>
                    <td>
                        <center>
                            ${act.subjectName}
                        </center>
                    </td>
                    <td>
                        <center>
                            <a href="${pageContext.request.contextPath}/user/checkActivity.jsp?activityId=${act.id}&subjectId=${act.subjectId}&subjectName=${act.subjectName}&activityName=${act.activityName}&point=${act.point}">
                               <button type="submit" class="btn btn-success"><span class='glyphicon glyphicon-plus'></span></button>
                            </a>
                        </center>
                    </td>
                    <td>
                        <center>
                            <button  data-toggle="modal" data-target="#editModal${act.id}" class="btn btn-info"><span class='glyphicon glyphicon-edit'></span></button>
                        </center>    
                            <!-------- popup edit --------->
                            <div id="editModal${act.id}" class="modal fade" role="dialog">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขกิจกรรม</h4>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/ActivityController?action=update" method="POST">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" name="edit_activity_id" value="${act.id}" />
                                                <label for="sel1">ชื่อกิจกรรม:</label>
                                                <input type="text" name="edit_activity_name" class="form-control" value="${act.activityName}" required="required"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="sel1">คำอธิบาย:</label>
                                                <input type="text" name="edit_activity_description" class="form-control" value="${act.description}" required="required"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="sel1">คำแนน:</label>
                                                <input type="number" name="edit_activity_point" class="form-control" value="${act.point}" required="required"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="sel1">รายวิชา : </label>
                                                <input type="hidden" name="edit_activity_subject" value="${act.subjectId}" />
                                                <input type="text" name="" class="form-control" value="${act.subjectName}" disabled/>
                                            </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                                            <input type="submit" class="btn btn-success" value="แก้ไข" />
                                        </div>
                                    </form>
                                </div>
                              </div>
                            </div>
                            <!---------- popup edit -------> 
                        
                    </td>
                    <td>
                        <center>
                            <form action="${pageContext.request.contextPath}/ActivityController?action=delete&activity_id=${act.id}" method="POST">
                               <button type="submit" class="btn btn-danger"><span class='glyphicon glyphicon-remove'></span></button>
                            </form>
                        </center>
                    </td>
                </tr>
                </c:forEach>
           </table>
           <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal1">
                   <span class="glyphicon glyphicon-plus-sign"></span></button>
           
      </div>
           <!-------- pop up --------->
            <div id="myModal1" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">เพิ่มกิจกรรม</h4>
                        </div>
                          <form action="${pageContext.request.contextPath}/ActivityController?action=add" method="POST">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="sel1">ชื่อกิจกรรม:</label>
                                    <input type="text" name="add_activity_name" class="form-control" required="required"/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="sel1">คำอธิบาย:</label>
                                    <input type="text" name="add_activity_description" class="form-control" required="required"/>
                                </div>
                                
                                <div class="form-group">
                                    <label for="sel1">คำแนน:</label>
                                    <input type="number" name="add_activity_point" class="form-control" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="sel1">รายวิชา : </label>
                                    <select name="add_activity_subject" class="form-control">
                                        <c:forEach var="sub" items="${listSubject}">
                                        <option value="${sub.subjectId}">${sub.subjectName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                           </div>
                         <div class="modal-footer">
                             <input type="hidden" name="typeData" value="subject"/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                            <input type="submit" class="btn btn-success" value="เพิ่ม">
                           </div>
                        </form>
                </div>

              </div>
            </div>
    <!---------- popup -------> 
    </body>
</html>
