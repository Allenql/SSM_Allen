<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/5/4
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<head>
    <title>错误</title>
</head>
<script>
    $(document).ready(function () {
        if(confirm("部门尚有员工，不可删除！")){
            location.href="dept_controller.jsp?commitType=findAll";
        }
        location.href="dept_controller.jsp?commitType=findAll";
    });
</script>
<body>
</body>
</html>
