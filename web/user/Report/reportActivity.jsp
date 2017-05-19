<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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
        
        <div class="n">
          <%  String[] activity = {"เข้าแถว","ทำความดี","บวชภาคฤดูร้อน","ช่วยเหลือสังคม"};
              String[] note = {"ขาด","ลากิจ","ลาป่วย","สาย"};
              int[] number = new int[6]  ;
              int sum=0;
              String[][] data = new String[2][3];
                  
                     data[0][0]="นายประยุทธ จันเป็ง";
                     data[0][1]="5";
                     data[0][2]="เข้าร่วม";
                     data[1][0]="นาย ";
                     data[1][1]="2";
                     data[1][2]="เข้าร่วม";

              boolean isDataIncome = "POST".equals(request.getMethod());
              String Activity = request.getParameter("activity");
              if(isDataIncome){
                   
                  %>
                  <br><page size="A4">
                 <div style="text-align: center;">
                     <br>
                     <table style="width:80%;"  align="center"> 
                         <tr>
                             <td align="Left"><img src="../../img/logo_rmutl.png" style="width: 80px;"></td>
                             <td><br><br>
                                  <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                  <h5>รายงานกิจกรรม <%=Activity%></h5>
                                   <h5> ออกรายงานโดย &nbsp;<%= request.getSession().getAttribute("username") %></h5>
                             </td>
                         </tr>
                     
                     </table>
                     <br>
                 </div>
                  
                                 
                   <table class="table table-bordered"  align="center" style="margin-top: 30px; width: 90%"> 
                      <tr>
                          <th><center>ลำดับ</center></th>
                            <th><center>ชื่อ-นามสกุล</center></th>
                            <th><center>คะแนน</center></th>
                            <th><center>สถานะ</center></th>
  
                        </tr>
                       
                           <%for(int i=0;i<2;i++){
                              %>
                              <tr>
                              <td align="center"><%=i+1%></td>
                              <td align="center"><%=data[i][0]%></td>
                              <td align="center"><%=data[i][1]%></td>
                              <td align="center"><%=data[i][2]%></td>
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
                  
                 <%
              }else{
              %>
          
              <%
              
              }
     
          %>

       </div>
            
            
         <!-------- pop up --------->
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Select Activity</h4>
                        </div>
                          <form method="POST">
                            <div class="modal-body">
                               <p><div class="form-group">
                               <label for="sel1">เลือกกิจกรรม</label>
                                   <select class="form-control" id="sel1" name="Activity">
                                        
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
