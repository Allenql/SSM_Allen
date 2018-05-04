package com.sust.dao;

import com.sust.domain.Dept;
import com.sust.util.JdbcTemplate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeptDao extends BaseDAO {
    /**
     * 查询全部部门信息
     * @return 返回List集合
     */
    public List<Dept> findAllDept() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate();
        String sql = "select * from dept";
        ResultSet rs = jdbcTemplate.executeQuery(sql,null);
        List<Dept> depts = new ArrayList<>();
        try {
            while (rs.next()) {
                Dept dept = new Dept();
                dept.setDeptid(rs.getInt("deptid"));
                dept.setDeptname(rs.getString("deptname"));
                dept.setDeptnum(rs.getInt("deptnum"));
                dept.setDeptdesc(rs.getString("deptdesc"));
                depts.add(dept);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        jdbcTemplate.closeResource();
        return depts;
    }

    /**
     * 新增员工信息时修改部门人数
     * @param deptid
     * @return 返回影响的行数
     */
    public int updateDeptNumByAddEmp(int deptid){
        String sql = "update dept set deptnum = deptnum + 1 where deptid = " + deptid;
        return this.getJdbcTemplate().executeUpdate(sql,null);
    }

    /**
     * 修改员工信息时修改部门人数
     * @param deptid   修改之后的部门编号
     * @param preDeptid  修改之前的部门编号
     * @return 返回影响的行数
     */
    public int updateDeptNumByUpdateEmp(int deptid,String preDeptid){
        System.out.println(preDeptid);
        String sql = "update dept set deptnum = deptnum + 1 where deptid = " + deptid;
        String sql2 = "update dept set deptnum = deptnum - 1 where deptid = " + preDeptid;
        return this.getJdbcTemplate().executeBatch(new String[]{sql,sql2});
    }

    /**
     * 删除员工信息时修改部门人数
     * @param empids 可同时删除多条记录
     * @return  返回影响的行数
     */
    public int updateDeptNumByDeleteEmp(String empids){
            String[] sqls = new String[empids.split(",").length];
        for(int i = 0; i < empids.split(",").length; i++){
           sqls[i] = "update dept set deptnum = deptnum - 1 where deptid = (select deptid from emp where empid = "+empids.split(",")[i]+")";
            System.out.println(sqls[i]);
        }
        return this.getJdbcTemplate().executeBatch(sqls);
    }

    /**
     * 新增部门信息
     * @param dept
     * @return 返回影响的行数
     */
    public int doAdd(Dept dept){
        String sql = "insert into dept values(null, ?, ?, ?)";
        return getJdbcTemplate().executeUpdate(sql,new String[]{dept.getDeptname(), dept.getDeptnum()+"", dept.getDeptdesc()});
    }

    /**
     * 通过id查询部门信息
     * @param deptid
     * @return
     */
    public Dept findById(int deptid){
        String sql = "select * from dept where deptid = " + deptid;
        ResultSet rs =  this.getJdbcTemplate().executeQuery(sql,null);
        Dept dept = null;
        try {
            while (rs.next()){
                dept = new Dept();
                dept.setDeptid(rs.getInt("deptid"));
                dept.setDeptname(rs.getString("deptname"));
                dept.setDeptnum(rs.getInt("deptnum"));
                dept.setDeptdesc(rs.getString("deptdesc"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            this.closeResources();
        }
        return dept;
    }

    /**
     * 修改部门信息
     * @param dept
     * @return
     */
    public int doUpdate(Dept dept, int deptid){
        String sql = "update dept set deptname = ?, deptnum = ?, deptdesc = ? where deptid = " + deptid;
        return this.getJdbcTemplate().executeUpdate(sql,new String[]{dept.getDeptname(), dept.getDeptnum() + "" ,dept.getDeptdesc()});
    }

    /**
     * 删除部门信息
     * @param deptids  需要删除的部门编号
     * @return
     */
    public int doDelete(String deptids){
        String sql = "delete from dept where deptid in("+deptids+")";
        return this.getJdbcTemplate().executeUpdate(sql, null);
    }
}
