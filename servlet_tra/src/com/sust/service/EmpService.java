package com.sust.service;

import com.sust.dao.DeptDao;
import com.sust.dao.EmpDao;
import com.sust.domain.Dept;
import com.sust.domain.Emp;

import java.util.List;

public class EmpService {
    private EmpDao empDao = new EmpDao();
    private DeptDao deptDao = new DeptDao();
    public List<Emp> findAll(){
        return empDao.findAll();
    }

    public boolean doAdd(Emp emp){
        //新增员工
        int rowCount = empDao.doAdd(emp);

        //修改部门人数
        rowCount += deptDao.updateDeptNumByAddEmp(emp.getDeptid());

        return rowCount == 2 ? true : false;
    }

    public Emp findById(String empid){
        return empDao.findById(empid);
    }

    public boolean doUpdate(Emp emp,String preDeptid){
        //1.修改员工信息
        int rowCount = empDao.doUpdate(emp);
        //2.修改部门人数
        rowCount += deptDao.updateDeptNumByUpdateEmp(emp.getDeptid(),preDeptid);

        return rowCount >= 3 ? true : false;
    }

    public boolean doDelete(String empids){
        //1.修改部门人数
        int rowCount = deptDao.updateDeptNumByDeleteEmp(empids);
        //2.删除员工信息
        rowCount += empDao.doDelete(empids);

        return rowCount >= 2 ? true : false;
    }

    public int getCountPage(){
        int count = empDao.getCountPage();
        return count;
    }

    public List<Emp> getEmp(int currentPage){
        return empDao.getEmp(currentPage);
    }

}
