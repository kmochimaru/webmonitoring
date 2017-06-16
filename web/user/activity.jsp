<%@page import="daoImp.ReportActivityDaoImp"%>
<%@page import="entities.ReportActivity"%>
<%@page import="entities.AjointS"%>
<%@page import="java.util.List"%>
<%@page import="daoImp.ActivityDaoImp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html leng="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>จัดการกิจกรรม</title>
        <jsp:include page="../static/head_tag.jsp" />
    </head>
    <body style="background-color: #ffffff">
        <div class="container">
            <jsp:include page="../static/nav_bar.jsp" />
            <% 
                ActivityDaoImp dao = new ActivityDaoImp();
                List<AjointS> listActivity = new ArrayList();
                listActivity = dao.getAllActivityJoin();
                int i = 1;
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
               <% 
               for(AjointS act : listActivity){
               %>
                <tr>
                    <td>
                        <center>
                            <%= i++ %>
                        </center>
                    </td>
                    <td>
                        <center>
                            <%= act.getActivityName() %>
                        </center>
                    </td>
                    <td>
                        <center>
                            <%= act.getPoint() %>
                        </center>
                    </td>
                    <td>
                        <center>
                            <%= act.getSubjectName() %>
                        </center>
                    </td>
                    <td>
                        <% 
                            List<ReportActivity> chkReport = new ArrayList();
                            ReportActivityDaoImp chkReportDao = new ReportActivityDaoImp();
                            chkReport = chkReportDao.getReportByActivityId(act.getId());
                            if(chkReport.size() == 0){
                        %>
                        <center>
                            <a href="${pageContext.request.contextPath}/user/checkActivity.jsp?activityId=<%= act.getId() %>&subjectId=<%= act.getSubjectId() %>&subjectName=<%= act.getSubjectName()%>&activityName=<%= act.getActivityName()%>&point=<%= act.getPoint()%>">
                               <button type="submit" class="btn btn-success"><span class='glyphicon glyphicon-plus'></span></button>
                            </a>
                        </center>
                        <%
                            }else{
                        %>
                        <center>
                            <a href="${pageContext.request.contextPath}/user/editCheckActivity.jsp?activityId=<%= act.getId()%>&subjectId=<%= act.getSubjectId()%>&subjectName=<%= act.getSubjectName()%>&activityName=<%= act.getActivityName()%>&point=<%= act.getPoint()%>">
                               <button type="submit" class="btn btn-success"><span class='glyphicon glyphicon-book'></span></button>
                            </a> 
                        </center>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <center>
                            <button  data-toggle="modal" data-target="#editModal<%= act.getId()%>" class="btn btn-info"><span class='glyphicon glyphicon-edit'></span></button>
                        </center>    
                            <!-------- popup edit --------->
                            <div id="editModal<%= act.getId()%>" class="modal fade" role="dialog">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขกิจกรรม</h4>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/ActivityController?action=update" method="POST">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" name="edit_activity_id" value="<%= act.getId()%>" />
                                                <label for="sel1">ชื่อกิจกรรม:</label>
                                                <input type="text" name="edit_activity_name" class="form-control" value="<%= act.getActivityName()%>" required="required"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="sel1">คำอธิบาย:</label>
                                                <input type="text" name="edit_activity_description" class="form-control" value="<%= act.getDescription()%>" required="required"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="sel1">คำแนน:</label>
                                                <input type="number" name="edit_activity_point" class="form-control" value="<%= act.getPoint()%>" required="required"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="sel1">รายวิชา : </label>
                                                <input type="hidden" name="edit_activity_subject" value="<%= act.getSubjectId()%>" />
                                                <input type="text" name="" class="form-control" value="<%= act.getSubjectName()%>" disabled/>
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
                            <form action="${pageContext.request.contextPath}/ActivityController?action=delete&activity_id=<%= act.getId()%>" method="POST">
                               <button type="submit" class="btn btn-danger"><span class='glyphicon glyphicon-remove'></span></button>
                            </form>
                        </center>
                    </td>
                </tr>
                <% 
                }
                %>
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
