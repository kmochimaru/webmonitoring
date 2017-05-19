<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Index</title>
        <jsp:include page="head_tag.jsp"/>
    </head>
    <body style="background-color: #FFFFFF;">
        <% 
            String[] studentName = {"นายธงชัย ใจดี","นายสุมาเตอะ คนไง","นางย้อมใจ เมาขำ","นางสาวจังไร จริงแท้"}; 
            String[] activity = {"เข้าแถว","ทำความดี","บวชภาคฤดูร้อน","ช่วยเหลือสังคม"};
            boolean getMethod = "POST".equals(request.getMethod());
               request.setCharacterEncoding("UTF-8");
               String subject = request.getParameter("subject");
        if(getMethod){
            %>
                <div class="container">
                     <br>
                     <br>
                     <center>
                         <h1>รายงาน วิชา <%=subject%></h1><br>
                         <form action="reportSubject.jsp" method="POST">
                             <input type="hidden" name="subject" value="<%=subject%>"/>
                                    <input type="submit" class="btn btn-success btn-lg" value="รายงานการเข้าชั้นเรียน">
                           
                         </form><br>
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">
                                รายงานนักศึกษารายคน
                            </button><br><br>
                            <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal2">
                                รายงานการเข้ากิจกรรม
                            </button><br><br>
                     </center>
                     <br><br>
                 </div>
            <%
        }else{
           %>
                <div class="container">
                     <br>
                     <br>
                     <center>
                         <h1>รายงาน วิชา <%=subject%></h1><br>
                         <form action="reportPersen.jsp" method="POST">
                             <input type="hidden" name="subject" value="<%=subject%>"/>
                                    <input type="submit" class="btn btn-success btn-lg" value="รายงานการเข้าชั้นเรียน">
                           
                         </form><br>
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">
                                รายงานนักศึกษารายคน
                            </button><br><br>
                            <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal2">
                                รายงานการเข้ากิจกรรม
                            </button><br><br>
                     </center>
                     <br><br>
                 </div>
                                   
           
           <%

         }
        %>
         
        <!-------- pop up รายคน  --------->
            <div id="myModal1" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">กรุณาเลือก</h4>
                        </div>
                          <form  action="reportStudent.jsp" method="POST">
                            <div class="modal-body">
                               <p><div class="form-group">
                               <label for="sel1">ชื่อนักศึกษา:</label>
                                   <select class="form-control" id="sel1" name="namestudent">
                                        
                                        <%for(int i =0;i<studentName.length;i++){
                                         %>
                                        <option value="<%=studentName[i]%>"><%=studentName[i]%></option>
                                         <%   }  %>
                                    </select>
                                    </div>
                                </p>
                           </div>
                         <div class="modal-footer">
                             <input type="hidden" name="typeData" value="subject"/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                            <input type="submit" class="btn btn-success" value="ตกลง">
                           </div>
                        </form>
                </div>

              </div>
            </div>
    <!---------- popup รายคน-------> 
    <!-------- pop up กิจกรรม  --------->
            <div id="myModal2" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">กรุณาเลือก</h4>
                        </div>
                          <form action="reportActivity.jsp" method="POST">
                            <div class="modal-body">
                               <p><div class="form-group">
                               <label for="sel1">ชื่อกิจกรรม:</label>
                                   <select class="form-control" id="sel1" name="activity">
                                        
                                        <%for(int i =0;i<activity.length;i++){
                                         %>
                                        <option value="<%=activity[i]%>"><%=activity[i]%></option>
                                         <%   }  %>
                                    </select>
                                    </div>
                                </p>
                           </div>
                         <div class="modal-footer">
                             <input type="hidden" name="typeData" value="subject"/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                            <input type="submit" class="btn btn-success" value="ตกลง">
                           </div>
                        </form>
                </div>

              </div>
            </div>
    <!---------- popup กิจกรรม------->
         
    </body>
</html>
