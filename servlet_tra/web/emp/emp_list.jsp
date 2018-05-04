<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/4/28
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<head>
    <title>员工信息表</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    //页面加载事件
    $(document).ready(function () {
        // alert("sss");
    //1.获取input标签  2.绑定单击事件
        $("#btnUpdate").click(function () {
            // alert("ssss");
            //3.获取选中项个数
            var checkedCount = $("input:checked").length;
            // alert(checkedCount);
            //4.判断个数
            if(checkedCount == 0){ //非空校验
                alert("请选择要修改的数据！");
                return;
            }
            if(checkedCount >= 2){ //合法性校验
                alert("一次只能修改一条数据！");
                //遍历所有选中的input
                $("input:checked").each(function () {
                    //修改checked属性
                    $(this).attr("checked",false);
                });
                return;
            }
            //跳转到emp_controller.jsp
            location.href = 'emp_controller.jsp?commitType=update&empid=' + $("input:checked").val();
        });

        //删除员工
        $("#btnDelete").click(function () {
            //3.获取选中项个数
            var checkedCount = $("input:checked").length;
            // alert(checkedCount);
            //4.判断个数
            if(checkedCount == 0){ //非空校验
                alert("请选择要删除的数据！");
                return;
            }
            //删除的确定
            if(confirm("确定要删除吗？")){
                //获取需要删除的empId
                var chencedEmpids = $("input:checked");
                var empids = '';
                //循环遍历所有选中项的empids项
                for(var i = 0; i < chencedEmpids.length; i++){
                    //如果不是最后一个empid,则拼凑逗号
                    if(i != chencedEmpids.length -1 ){
                        empids += chencedEmpids[i].value + ",";
                    }else {
                        empids += chencedEmpids[i].value;
                    }
                }
                //跳转到emp_controller.jsp
                location.href = "emp_controller.jsp?commitType=doDelete&empids=" + empids;
            }
        });
    });


</script>
<body>
<h1 class="page-header" style="font-family: 'Adobe 黑体 Std R';text-align: center">员工信息表</h1>
<div class="table-responsive">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <td>选择</td>
            <td>编号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>地址</td>
            <td>手机号码</td>
            <td>入职日期</td>
            <td>部门编号</td>
            <td>部门名称</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${emps}" var="emp">
            <tr>
                <td><input type="checkbox" name="empid" value="${emp.empid}"></td>
                <td>${emp.empid}</td>
                <td>${emp.empname}</td>
                <td>${emp.empsex}</td>
                <td>${emp.empage}</td>
                <td>${emp.empaddress}</td>
                <td>${emp.empphone}</td>
                <td>${emp.empdate}</td>
                <td>${emp.deptid}</td>
                <td>${emp.deptname}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" style="font-family: 'Adobe 黑体 Std R'; font-size: 20px">
            <c:choose>
                <c:when test="${requestScope.currentPage > 1}">
                    <input class="btn btn-info" type="button" value="上一页" onclick="location.href('${pageContext.request.contextPath}/emp/emp_controller.jsp?commitType=findAll&currentPage=${requestScope.currentPage-1}')">
                </c:when>
                <c:otherwise>
                    <input class="btn btn-info" type="button" value="上一页" onclick="javascript:window.alert('已经是第一页');">
                </c:otherwise>
            </c:choose>
    <input  class="btn btn-large btn-primary" type="submit" value="新增" onclick="location.href('emp_controller.jsp?commitType=add')">
    <input class="btn btn-large btn-primary" type="button" value="修改" id="btnUpdate">
    <input class="btn btn-large btn-primary" type="button" value="删除" id="btnDelete">
        <c:choose>
            <c:when test="${requestScope.currentPage < requestScope.countPage}">
                <input class="btn btn-info" type="button" value="下一页" onclick="location.href('${pageContext.request.contextPath}/emp/emp_controller.jsp?commitType=findAll&currentPage=${requestScope.currentPage+1}')">
            </c:when>
            <c:otherwise>
                <input class="btn btn-info" type="button" value="下一页" onclick="javascript:window.alert('已经是最后一页');">
            </c:otherwise>
        </c:choose>
    </div>
</div>
<center>
    <div>
        第${requestScope.currentPage}页/共${requestScope.countPage}页
    </div>
</center>
</body>
</html>
