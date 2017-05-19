<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Student</title>
        <%@include file="head_tag.jsp"%>
    </head>
     <body>
        
         <script type="text/javascript">
          $(document).ready(function() {
            var show = true
            $("#print").click(function() {
                show = false
                check()
                window.print()
                show = true
                check()
            });
            
            function check(){
                if(show)
                    $('#ShowPrint').show()
                else
                    $('#ShowPrint').hide()
            }
            
          });
        </script>
        
        <div class="container">
            <%  String[] name = {"นักศึกษา คนที่ 1","นักศึกษา คนที่ 2","นักศึกษา คนที่ 3","นักศึกษา คนที่ 4"};
              String[] note = {"ขาด","ลากิจ","ลาป่วย","สาย"};
              int[] number = new int[6]  ;
              int sum=0;
              String[][] data = new String[2][7];
                   Random ran = new Random();
                   for(int i = 0;i<number.length;i++){
                       number[i]= ran.nextInt(18)+1;
                       
                   }
                     data[0][0]="ระบบฐานข้อมูล";
                     data[0][1]=""+number[0];
                     data[0][2]=""+number[1];
                     data[0][3]=""+number[2];
                     data[0][4]=""+number[3];
                     data[0][5]=""+number[4];
                     data[0][6]=""+number[5];
                     
                     data[1][0]="การรับรู้และการประมวลผลภาพ";
                     data[1][1]=""+number[5];
                     data[1][2]=""+number[4];
                     data[1][3]=""+number[3];
                     data[1][4]=""+number[2];
                     data[1][5]=""+number[1];
                     data[1][6]=""+number[0];

              boolean isDataIncome = "POST".equals(request.getMethod());
              String nameStudent = request.getParameter("namestudent");
              if(isDataIncome){
                  %>
                  <br><br>
                  <page size="A4">
                      <div style="text-align: center;">
                     <br>
                     <table style="width:80%;"  align="center"> 
                         <tr>
                             <td align="Left"><img src="../../img/logo_rmutl.png" style="width: 80px;"></td>
                             <td><br><br><center>
                                             <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                             <h5>รายงาน การเข้าเรียน <%=nameStudent%></h5>
                                             <h5> ออกรายงานโดย &nbsp;<%= request.getSession().getAttribute("username") %></h5>
                                       </center>
                             </td>
                         </tr>
                     
                     </table>                      
                         
                 </div>
                 
                  <table class="table table-bordered"  align="center" style="margin-top: 30px; width: 90%">
                        <tr>
                            <th><center>ลำดับ</center></th>
                            <th><center>ชื่อรายวิชา</center></th>
                            <th><center>เข้าเรียน</center></th>
                            <th><center>เข้าสาย</center></th>
                            <th><center>ขาดเรียน</center></th>
                            <th><center>ลากิจ</center></th>
                            <th><center>ลาป่วย</center></th>
                            <th><center>รวม</center></th>
                        </tr>
                         <%for(int i=0;i<2;i++){
                              %>
                              <tr>
                              <td align="center"><%=i+1%></td>
                              <td align="center"><%=data[i][0]%></td>
                              <td align="center"><%=data[i][1]%></td>
                              <td align="center"><%=data[i][2]%></td>
                              <td align="center"><%=data[i][3]%></td>
                              <td align="center"><%=data[i][4]%></td>
                              <td align="center"><%=data[i][5]%></td>
                              <td align="center"<%=data[i][6]%></td>
                              </tr>
                              <%
                           }%>
                    </table>
                   
                         <div id="ShowPrint" style="margin-left: 80px;">
                        <Button id="print" type="button" class="btn btn-default btn-sm" style="margin-left: 10px;">
                        <span class="glyphicon glyphicon-print"></span>
                        </Button>
                       
                      </div>
                  </page>
            <%}else{
                    
            %>
            <script>
                  $(document).ready(function(){
                  $(".contentTecher").fadeIn();
                  $("#myModal").modal('show');
                  });
            </script>
            <%
           }%>
            
        </div>
          <!-------- pop up --------->
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Select Subject</h4>
                        </div>
                          <form method="POST">
                            <div class="modal-body">
                               <p><div class="form-group">
                               <label for="sel1">เลือกชื่อนักศึกษา</label>
                                   <select class="form-control" id="sel1" name="nameStudent">
                                        
                                        <%for(int i =0;i<name.length;i++){
                                         %>
                                        <option value="<%=name[i]%>"><%=name[i]%></option>
                                         <%   }  %>
                                    </select>
                                    </div>
                                </p>
                           </div>
                           <div class="modal-footer">
                             
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-success" value="Submit">
                           </div>
                        </form>
                </div>
              </div>
            </div>
    <!---------- popup -------> 
     </body>
</html>
