<%@ page import="com.sust.service.DeptService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sust.domain.Dept" %><%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/5/4
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    //设置编码格式
    request.setCharacterEncoding("UTF-8");

    DeptService deptService = new DeptService();

    //获取提交的类型
    String commitType = request.getParameter("commitType");

    if("findAll".equals(commitType)){
        List<Dept> deptList = deptService.findAllDept();
        //将查询结果传递到jsp页面
        request.setAttribute("depts", deptList);
        //跳转到dept_list.jsp
        request.getRequestDispatcher("dept_list.jsp").forward(request,response);
    }

    if("add".equals(commitType)){  //新增准备
        //跳转到dept_add.jsp
        request.getRequestDispatcher("dept_add.jsp").forward(request,response);
    }

    if("doAdd".equals(commitType)){  //新增执行
        //获取jsp页面中填写的数据
        String deptname = request.getParameter("deptname");
        String deptnum = request.getParameter("deptnum");
        String deptdesc = request.getParameter("deptdesc");

        //封装数据
        Dept dept = new Dept();
        dept.setDeptname(deptname);
        dept.setDeptnum(Integer.parseInt(deptnum));
        dept.setDeptdesc(deptdesc);

        //执行新增的方法
        boolean flag = deptService.doAdd(dept);
        if(flag){
            //跳转到dept_controller.jsp?commitType=findAll
            request.getRequestDispatcher("dept_controller.jsp?commitType=findAll").forward(request,response);
        }else {
            //错误页面
        }
    }

    if("update".equals(commitType)) {//修改准备
        //获取选中的部门id
        String deptid = request.getParameter("deptid");
        //通过id查询数据
        Dept dept = deptService.fidById(Integer.parseInt(deptid));
        //把数据传递到jsp页面
        request.setAttribute("dept",dept);
        //跳转到dept_update.jsp
        request.getRequestDispatcher("dept_update.jsp").forward(request,response);
    }

    if("doUpdate".equals(commitType)){ //修改执行
        //获取页面中修改之后的信息
        String deptid = request.getParameter("deptid");
        String deptname = request.getParameter("deptname");
        String deptnum = request.getParameter("deptnum");
        String deptdesc = request.getParameter("deptdesc");

        //封装数据
        Dept dept = new Dept();
        dept.setDeptname(deptname);
        dept.setDeptnum(Integer.parseInt(deptnum));
        dept.setDeptdesc(deptdesc);


        //执行修改的方法
        boolean flag = deptService.doUpdate(dept, Integer.parseInt(deptid));
        if(flag){
            //跳转到dept_controller.jsp?commitType=findAll
            request.getRequestDispatcher("dept_controller.jsp?commitType=findAll").forward(request,response);
        }else{
            //错误页面
        }
    }

    if("doDelete".equals(commitType)){
        //获取需要删除的所有部门id
        String deptids = request.getParameter("deptids");
        //执行删除方法
        boolean flag = deptService.doDelete(deptids);
        if(flag){
            //跳转到dept_controller.jsp?commitType=findAll
            request.getRequestDispatcher("dept_controller.jsp?commitType=findAll").forward(request,response);
        }else{
            //跳转到错误页面
            request.getRequestDispatcher("error.jsp").forward(request,response);
        }
    }
%>
</body>
</html>
