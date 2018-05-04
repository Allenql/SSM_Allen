<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/5/4
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <title>修改部门信息</title>
</head>
<body>
<h1 class="page-header" style="font-family: 'Adobe 黑体 Std R';text-align: center">修改部门信息</h1>
<div style="padding: 100px 800px 10px;">
    <form class="bs-example bs-example-form" role="form" method="post" action="dept_controller.jsp?commitType=doUpdate">
        <input type="hidden" name="deptid" value="${dept.deptid}"/>
        <div class="input-group">
            <span class="input-group-addon">部门名称</span>
            <input type="text" name="deptname" class="form-control" value="${dept.deptname}">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">部门人数</span>
            <input type="text" name="deptnum" class="form-control" value="${dept.deptnum}">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">部门描述</span>
            <input type="text" class="form-control" name="deptdesc" value="${dept.deptdesc}">
        </div><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input class="btn btn-success" type="submit" value="修改">
        <input style="margin-left: 100px" class="	btn btn-danger" type="button" onclick="javascript:window.history.back()" value="返回">
    </form>
    <%--<c:out value="${depts}"></c:out>--%>
</div>
</body>
</html>
