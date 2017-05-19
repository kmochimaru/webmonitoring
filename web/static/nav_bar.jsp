<%@page pageEncoding="UTF-8" session="false" %>
<br><br><br><br>
<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/user/index.jsp"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
              <li class=""><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
              <li><a href="${pageContext.request.contextPath}/user/activity.jsp">จัดการกิจกรรม</a></li>
              <li><a href="${pageContext.request.contextPath}/user/allStudent.jsp">รายชื่อนักศึกษาทั้งหมด</a></li>
          </ul>
         <ul class="nav navbar-nav navbar-right" >
             <li class=""><a href="${pageContext.request.contextPath}/user/logout.jsp"> <%= request.getSession().getAttribute("username") %>  &nbsp;&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></li>
          </ul>
         
        </div>
      </div>
    </nav>
    