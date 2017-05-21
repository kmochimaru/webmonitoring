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
                  <br><page size="A4">
                 <div style="text-align: center;">
                     <br>
                     <table style="width:80%;"  align="center"> 
                         <tr>
                             <td align="Left"><img src="../../img/18601197_1536562789707551_1096304247_n.png.png" style="width: 80px;"></td>
                             <td><br><br>
                                  <h4>มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา ตาก</h4>
                                  <h5>รายงานกิจกรรม </h5>
                                   <h5> ออกรายงานโดย &nbsp;</h5>
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
                              <tr>
                              <td align="center">1</td>
                              <td align="center">ชื่อๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆ</td>
                              <td align="center">5</td>
                              <td align="center">เข้าร่วม</td>
                               </tr>
                      </table>
                     
                          <div id="ShowPrint" style="margin-left: 80px;">
                                <Button id="print" type="button" class="btn btn-default btn-sm" style="margin-left: 10px;">
                                <span class="glyphicon glyphicon-print"></span>
                                </Button>
                          </div>
                     
                  </page>  

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
                                      <option value="กิจกรรมที่ 1">กิจกรรมที่ 1</option>
                                        <option value="กิจกรรมที่ 2">กิจกรรมที่ 2</option>
                                        <option value="กิจกรรมที่ 3">กิจกรรมที่ 3</option>
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
