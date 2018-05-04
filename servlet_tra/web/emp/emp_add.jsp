<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/5/2
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <title>新增员工</title>
</head>
<body>
<h1 class="page-header" style="font-family: 'Adobe 黑体 Std R';text-align: center">新增员工信息</h1>
<div style="padding: 100px 800px 10px;">
    <form class="bs-example bs-example-form" role="form" method="post" action="emp_controller.jsp?commitType=doAdd">
        <div class="input-group">
            <span class="input-group-addon">姓名</span>
            <input type="text" name="empname" class="form-control" placeholder="请输入姓名">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">性别</span>&nbsp;
            <input type="radio" name="empsex" checked value="男">男
            <input type="radio" name="empsex" value="女">女
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">年龄</span>
            <input type="text" name="empage" class="form-control" placeholder="请输入年龄">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">电话</span>
            <input type="text" class="form-control" name="empphone" placeholder="请输入11位手机号码">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">地址</span>
            <input type="text" name="empaddress" class="form-control" placeholder="请输入地址">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">部门</span>
            <select style="height:40px; width: 70px; color: gray;" name="deptid">
                <c:forEach items="${depts}" var="dept">
                <option value="${dept.deptid}">${dept.deptname}</option>
                </c:forEach>
            </select>
        </div><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input class="btn btn-success" type="submit" value="新增">
        <input style="margin-left: 100px" class="	btn btn-danger" type="button" onclick="javascript:window.history.back()" value="返回">
    </form>
</div>
</body>
</html>
