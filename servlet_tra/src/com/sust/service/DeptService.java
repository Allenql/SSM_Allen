package com.sust.service;

import com.sust.dao.DeptDao;
import com.sust.dao.EmpDao;
import com.sust.domain.Dept;

import java.sql.SQLException;
import java.util.List;

public class DeptService {
    DeptDao deptDao = new DeptDao();
    EmpDao empDao = new EmpDao();
    public List<Dept> findAllDept(){
        return deptDao.findAllDept();
    }

    public boolean doAdd(Dept dept){
        int rowCount = deptDao.doAdd(dept);
        return rowCount == 1 ? true : false;
    }

    public Dept fidById(int deptid){
        return deptDao.findById(deptid);
    }

    public boolean doUpdate(Dept dept, int deptid){
        int rowCount = deptDao.doUpdate(dept, deptid);
        return rowCount == 1 ? true : false;
    }

    public boolean doDelete(String deptids){
        //查询当前部门下是否有员工 若有 则提示不可删除
        int count = empDao.findEmpNumByDeleteDept(deptids);
        int rowCount = deptDao.doDelete(deptids);
        return count == 0 ? true : false;
    }
}
