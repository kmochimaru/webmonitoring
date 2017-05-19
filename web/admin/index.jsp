<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      
      
    </head>
    <body>
        <br><br><br><br><br>
        
    <center>
        <div class="adminpag">
            <h1 style="background-color: #CFCFCF; width: 500px">จัดการบัญชีผู้ใช้</h1><br>
            <table class="table " style="width: 500px">
                <tr class="success">
                    <th><center>ลำดับ</center></th>
                    <th><center>ชื่อ - นามสกุล</center></th>
                    
                    <th><center>ลบ</center></th>
                    <th><center>แก้ไข</center></th>
                </tr>
                <tr>
                    <td>
                      <center>
                          1
                      </center>
                    </td>
                    <td> 
                       <center>
                            ชื่อ
                       </center>
                    </td>
                    
                    <td>
                         <center>
                             <button type="button" class="btn btn-danger">
                                 <span class="glyphicon glyphicon-trash"></span>
                             </button>
                         </center>
                    </td>
                    <td>
                         <center>
                             <button type="button" class="btn btn-warning">
                                 <span class="glyphicon glyphicon-edit"></span>
                             </button>
                         </center>
                    </td>
                </tr>
                
            </table>
        </div>
                </center>
    <br><br>
    <div class="adduser"><center>
        <div class="container">            
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                <span class="glyphicon glyphicon-plus-sign"></span>
            </button>
            <button type="button" class="btn btn-danger" onclick="window.location.href='../index.jsp'">
                <span class="glyphicon glyphicon-log-out"></span>
            </button>
        </center>
            <div class="modal fade" id="myModal" role="dialog">
              <div class="modal-dialog">

                <div class="modal-content">
                    <form method="POST" class="form-group">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    
                    <h4 class="modal-title">เพิ่มข้อมูล</h4>
                  </div>
                  <div class="modal-body">
                      <p><input type="text" class="form-control"  id="name" placeholder="ชื่อ" ></p>
                      <p><input type="text" class="form-control"  id="sername" placeholder="นามสกุล" ></p>
                      <p><input type="text" class="form-control"  id="sername" placeholder="สิทธิ์" ></p>
                  </div>
                  <div class="modal-footer">
                      <input type="Submit" value="ตกลง" id="submit" class=" btn btn-success">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">ปิด</button>
                  </div>
                    </form>
                </div>

              </div>
            </div>
          </div>
        
     </div>
    </body>
</html>
