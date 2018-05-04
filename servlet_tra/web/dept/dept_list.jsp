<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/5/4
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<head>
    <title>部门信息表</title>
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
            location.href = 'dept_controller.jsp?commitType=update&deptid=' + $("input:checked").val();
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
                var chencedDeptids = $("input:checked");
                var deptids = '';
                //循环遍历所有选中项的deptids项
                for(var i = 0; i < chencedDeptids.length; i++){
                    //如果不是最后一个deptid,则拼凑逗号
                    if(i != chencedDeptids.length -1 ){
                        deptids += chencedDeptids[i].value + ",";
                    }else {
                        deptids += chencedDeptids[i].value;
                    }
                }
                //跳转到dept_controller.jsp
                location.href = "dept_controller.jsp?commitType=doDelete&deptids=" + deptids;
            }
        });
    });


</script>
<body>
<h1 class="page-header" style="font-family: 'Adobe 黑体 Std R';text-align: center">部门信息表</h1>
<div class="table-responsive">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <td>选择</td>
            <td>部门编号</td>
            <td>部门名称</td>
            <td>部门人数</td>
            <td>部门描述</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${depts}" var="dept">
            <tr>
                <td><input type="checkbox" name="empid" value="${dept.deptid}"></td>
                <td>${dept.deptid}</td>
                <td>${dept.deptname}</td>
                <td>${dept.deptnum}</td>
                <td>${dept.deptdesc}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" style="font-family: 'Adobe 黑体 Std R'; font-size: 20px">
        <input  class="btn btn-large btn-primary" type="submit" value="新增" onclick="location.href('dept_controller.jsp?commitType=add')">
        <input class="btn btn-large btn-primary" type="button" value="修改" id="btnUpdate">
        <input class="btn btn-large btn-primary" type="button" value="删除" id="btnDelete">
    </div>
</div>
</body>
</html>
