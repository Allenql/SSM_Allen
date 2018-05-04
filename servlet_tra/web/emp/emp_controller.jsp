<%@ page import="java.util.List" %>
<%@ page import="com.sust.domain.Emp" %>
<%@ page import="com.sust.service.EmpService" %>
<%@ page import="com.sust.service.DeptService" %>
<%@ page import="com.sust.domain.Dept" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: Allen_local
  Date: 2018/4/28
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    EmpService empService = new EmpService();
    DeptService deptService = new DeptService();

    //设置编码格式
    request.setCharacterEncoding("UTF-8");
    //1.获取提交的类型
    String commitType = request.getParameter("commitType");

//    System.out.println(commitType);
    //2.判断提交的类型
    if("findAll".equals(commitType)){
        //全查
//        List<Emp> empList = empService.findAll();

        //分页查询
        //获取当前页数
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        //查询数据库 然后计算出总页数
        int countPage = empService.getCountPage();

        //将当前页数，总页数，以及查询到的数据返回给jsp页面
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("countPage",countPage);

        List<Emp> empList = empService.getEmp(currentPage);


        //保存emplist
        request.setAttribute("emps",empList);
        //跳转到emp_list.jsp
        request.getRequestDispatcher("emp_list.jsp").forward(request,response);
    }

    if("add".equals(commitType)){//新增准备
        List<Dept> depts = deptService.findAllDept();
        //保存部门名称
        request.setAttribute("depts",depts);
        //跳转到emp_add.jsp
        request.getRequestDispatcher("emp_add.jsp").forward(request,response);
    }

    if("doAdd".equals(commitType)){  //执行新增
        //获取提交的信息
        String empname = request.getParameter("empname");
        String empsex = request.getParameter("empsex");
        String empage = request.getParameter("empage");
        String empphone = request.getParameter("empphone");
        String empaddress = request.getParameter("empaddress");
        String deptid = request.getParameter("deptid");

        //封装数据
        Emp emp = new Emp();
        emp.setEmpname(empname);
        emp.setEmpsex(empsex);
        emp.setEmpage(Integer.parseInt(empage));
        emp.setEmpaddress(empaddress);
        emp.setEmpphone(empphone);
        emp.setDeptid(Integer.parseInt(deptid));
        emp.setEmpdate(LocalDate.now());

        //执行新增员工的方法
        boolean flag = empService.doAdd(emp);

        //判断执行结果
        if(flag){  //新增成功
            //重定向到控制层并执行查询
            response.sendRedirect("emp_controller.jsp?commitType=findAll&currentPage=1");
        }else {//跳转到错误页面
        }
    }

    //修改
    if("update".equals(commitType)){//修改准备
        List<Dept> depts = deptService.findAllDept();
//        System.out.println(depts);
        //保存部门名称
        request.setAttribute("depts",depts);
//        1.获取修改的empid
        String empid = request.getParameter("empid");
        //2.根据id获取员工信息
        Emp emp = empService.findById(empid);
        //保存emp
        request.setAttribute("emp",emp);
        //3.跳转到修改页面
        request.getRequestDispatcher("emp_update.jsp").forward(request,response);
    }

    if("doUpdate".equals(commitType)){ //修改执行
        //获取提交的信息
        String empid = request.getParameter("empid");
        System.out.println(empid);
        String empname = request.getParameter("empname");
        String empsex = request.getParameter("empsex");
        String empage = request.getParameter("empage");
        String empphone = request.getParameter("empphone");
        String empaddress = request.getParameter("empaddress");
        // 入职日期无需修改
        String deptid = request.getParameter("deptid");

        //修改之前的部门编号
        String preDeptid = request.getParameter("preDeptid");


        //封装数据
        Emp emp = new Emp();
        emp.setEmpid(Integer.parseInt(empid));
        emp.setEmpname(empname);
        emp.setEmpsex(empsex);
        emp.setEmpage(Integer.parseInt(empage));
        emp.setEmpaddress(empaddress);
        emp.setEmpphone(empphone);
        emp.setDeptid(Integer.parseInt(deptid));
        // 入职日期无需修改
//        emp.setEmpdate(LocalDate.now());

        //执行修改员工的方法
        boolean flag = empService.doUpdate(emp,preDeptid);

        //判断执行结果
        if(flag){  //修改成功
            //重定向到控制层并执行查询
            response.sendRedirect("emp_controller.jsp?commitType=findAll&currentPage=1");
        }else {//跳转到错误页面
        }
    }

    if("doDelete".equals(commitType)){
        String empids = request.getParameter("empids");
        //执行修改员工的方法
        boolean flag = empService.doDelete(empids);
        //判断执行结果
        if(flag){  //删除成功
            //重定向到控制层并执行查询
            response.sendRedirect("emp_controller.jsp?commitType=findAll&currentPage=1");
        }else {//跳转到错误页面
        }
    }




%>

</body>
</html>
