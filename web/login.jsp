<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <jsp:include page="static/head_tag.jsp" />
        <style>
            body{
                background-color:  #cccfff;
            }  
        </style>
    </head>
    <body>
        <br><br><br><br>
    <center>
        <div class="container">
       <h1>ระบบตรวจสอบการทำกิจกรรมในชั้นเรียน</h1><br>
        <table>
            <tr>
                <td><center>
                    
                 <div class="login1">
                     <br><br>
                     <img src="${pageContext.request.contextPath}/img/icon.png" class="cicle" width="100px"><br>
                     <br><br>
                    <div class="login2">
                        
                        <form action="${pageContext.request.contextPath}/CommonServlet" method="POST">
                          <div class="form-group">
                             <div class="input-group">
                                 <input value="6001" type="text" class="form-control" name="username" placeholder="บัญชีผู้ใช้" autofocus="autofocus" required="required"/>
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-user"></i>
                                    </span>
                              </div>
                               </div>
                               <div class="form-group">
                                   <div class="input-group">
                                       <input value="1234" type="password" class="form-control" name="password" placeholder="รหัสผ่าน" required="required"/>
                                        <span class="input-group-addon">
                                            <i class="glyphicon glyphicon glyphicon-lock"></i>
                                        </span>
                                   </div>
                                </div>
                            <br>                              
                            
                            <button type="submit" class="btn btn-success">เข้าสู่ระบบ</button>
                            &nbsp;&nbsp;<button type="reset" class="btn btn-danger">ยกเลิก</button>
                        </form>
                        <br>
                        <br>
                        <br>
                    </div>
                  </div>
                </center>
                </td>
            </tr>    
        </table>
        </center>
</div>
    </body>
</html>
