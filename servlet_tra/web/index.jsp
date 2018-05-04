<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/4/28
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <head>
    <title>信息</title>
  </head>
  <body style="overflow-y: hidden">
    <div align="center" style="width: 200px; height: auto; margin-top: 400px; margin-left: 900px;">
        <input type="button" class="btn btn-info" onclick="location.href='emp/emp_controller.jsp?commitType=findAll&currentPage=1'" value="显示员工信息" />
        <br/><br/>
        <input type="button" class="btn btn-info" onclick="location.href='dept/dept_controller.jsp?commitType=findAll'" value="显示部门信息" />
    </div>
  </body>
</html>
