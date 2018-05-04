<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/5/3
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <title>修改员工</title>
</head>
<body>
<h1 class="page-header" style="font-family: 'Adobe 黑体 Std R';text-align: center">修改员工信息</h1>
<div style="padding: 100px 800px 10px;">
    <form class="bs-example bs-example-form" role="form" method="post" action="emp_controller.jsp?commitType=doUpdate">
        <input type="hidden" name="empid" value="${emp.empid}"/>
        <input type="hidden" name="preDeptid" value="${emp.deptid}">
        <div class="input-group">
            <span class="input-group-addon">姓名</span>
            <input type="text" name="empname" class="form-control" value="${emp.empname}">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">性别</span>&nbsp;
            <input type="radio" name="empsex" value="男" ${emp.empsex == '男'?'checked':''}>男
            <input type="radio" name="empsex" value="女" ${emp.empsex == '女'?'checked':''}>女
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">年龄</span>
            <input type="text" name="empage" class="form-control" value="${emp.empage}">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">电话</span>
            <input type="text" class="form-control" name="empphone" value="${emp.empphone}">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">地址</span>
            <input type="text" name="empaddress" class="form-control" value="${emp.empaddress}">
        </div><br>
        <div class="input-group">
            <span class="input-group-addon">部门</span>
            <select style="height:40px; width: 70px; color: gray;" name="deptid">
                <c:forEach items="${depts}" var="dept">
                    <c:if test="${dept.deptid == emp.deptid}">
                        <option value="${dept.deptid}" selected>${dept.deptname}</option>
                    </c:if>
                    <c:if test="${dept.deptid != emp.deptid}">
                        <option value="${dept.deptid}">${dept.deptname}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input class="btn btn-success" type="submit" value="修改">
        <input style="margin-left: 100px" class="	btn btn-danger" type="button" onclick="javascript:window.history.back()" value="返回">
    </form>
    <%--<c:out value="${depts}"></c:out>--%>
</div>
</body>
</html>
