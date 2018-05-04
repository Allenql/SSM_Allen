package com.sust.dao;

import com.sust.domain.Emp;
import com.sust.util.JdbcTemplate;
import jdk.nashorn.internal.scripts.JD;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmpDao extends BaseDAO{
        JdbcTemplate jdbcTemplate = new JdbcTemplate();

    /**
     * 查询全部员工信息
     * @return 返回List集合
     */
    public List<Emp> findAll(){
        String sql = "select emp.*,deptname from emp,dept where emp.deptid = dept.deptid  order by empid asc";   //根据编号升序排序
        ResultSet rs = jdbcTemplate.executeQuery(sql, null);
        List<Emp> empList = new ArrayList<>();
        try {
            while (rs.next()){
                Emp emp = new Emp();
                emp.setEmpid(rs.getInt("empid"));
                emp.setEmpname(rs.getString("empname"));
                emp.setEmpsex(rs.getString("empsex"));
                emp.setEmpage(rs.getInt("empage"));
                emp.setEmpphone(rs.getString("empphone"));
                emp.setEmpaddress(rs.getString("empaddress"));
                emp.setEmpdate(LocalDate.parse(rs.getString("empdate")));
                emp.setDeptid(rs.getInt("deptid"));
                emp.setDeptname(rs.getString("deptname"));
                empList.add(emp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        jdbcTemplate.closeResource();
        return empList;
    }

    /**
     * 新增员工信息
     * @param emp
     * @return 返回影响的行数
     */
    public int doAdd(Emp emp){
        int rowCount = 0;
        String sql = "insert into emp values(null,?,?,?,?,?,?,?)";
        rowCount = jdbcTemplate.executeUpdate(sql,new String[]{emp.getEmpname(),emp.getEmpsex(),emp.getEmpage()+"",
                emp.getEmpphone(),emp.getEmpaddress(),emp.getEmpdate().toString(),emp.getDeptid()+""});
        return rowCount;
    }

    /**
     * 通过id查询员工信息
     * @param empid
     * @return 返回一条记录 -- 员工
     */
    public Emp findById(String empid){
        Emp emp = new Emp();
        String sql = "select * from emp where empid = " + empid;
        ResultSet rs = this.getJdbcTemplate().executeQuery(sql,null);
        try {
            if(rs.next()){
                emp.setEmpid(rs.getInt("empid"));
                emp.setEmpname(rs.getString("empname"));
                emp.setEmpsex(rs.getString("empsex"));
                emp.setEmpage(rs.getInt("empage"));
                emp.setEmpphone(rs.getString("empphone"));
                emp.setEmpaddress(rs.getString("empaddress"));
                emp.setEmpdate(LocalDate.parse(rs.getString("empdate")));
                emp.setDeptid(rs.getInt("deptid"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            this.closeResources();;
        }
        return emp;
    }


    /**
     * 修改员工信息 --  个人看法：入职日期无需修改
     * @param emp
     * @return 返回影响的行数
     */
    public int doUpdate(Emp emp){
        String sql = "update emp set empname = ?, empsex = ?, empage = ?, empphone = ?, empaddress = ?, deptid = ? where empid = ?";
        return this.getJdbcTemplate().executeUpdate(sql,new String[]{emp.getEmpname(),emp.getEmpsex(),
                emp.getEmpage() + "",emp.getEmpphone(),emp.getEmpaddress(),emp.getDeptid()+"",emp.getEmpid()+""});
    }

    /**
     * 删除员工信息  --  一次可删除多条记录
     * @param empids
     * @return 返回影响的行数
     */
    public int doDelete(String empids){
        String sql = "delete from emp where empid in ("+empids+")";
        return this.getJdbcTemplate().executeUpdate(sql,null);
    }

    /**
     * 分页查询
     */
    private final int MAX_SIZE = 5;  //每页显示最多的记录数

    /**
     * 从数据库查询总记录数，计算出总页数
     * @return
     */
    public int getCountPage(){
        String sql = "select count(*) as count from emp";   //将查询结果保存在count中
        ResultSet rs =  this.getJdbcTemplate().executeQuery(sql,null);
        int count = 0;   //总记录数
        int countPage = 0;  //总页数
       try {
           if(rs.next()){
               count = rs.getInt("count");
           }
       }catch (Exception e){
           e.printStackTrace();
       }
       //  总页数 = 总条数/每页最大留言数， 可以除尽的话直接取结果，否则的话，结果+1
        countPage = (count % MAX_SIZE == 0 ? count/MAX_SIZE : count/MAX_SIZE+1);
       if(countPage != 0){
           return countPage;
       }else {
           return countPage + 1;  //因为没有第0页，所以默认第一页
       }
    }

    /**
     * 带分页的查询
     * @param currentPage
     * @return 返回List集合
     */
    public List<Emp> getEmp(int currentPage) { //currentPage为当前页数
        List<Emp> empList = new ArrayList<Emp>();
        String sql = "select emp.*, deptname from emp,dept where emp.deptid = dept.deptid order by empid asc limit ?,?";
        ResultSet rs = jdbcTemplate.executeQueryWithCurrentPage(sql,new Integer[]{(currentPage - 1) * MAX_SIZE, MAX_SIZE});
        try {
        while (rs.next()){
            Emp emp = new Emp();
            emp.setEmpid(rs.getInt("empid"));
            emp.setEmpname(rs.getString("empname"));
            emp.setEmpsex(rs.getString("empsex"));
            emp.setEmpage(rs.getInt("empage"));
            emp.setEmpphone(rs.getString("empphone"));
            emp.setEmpaddress(rs.getString("empaddress"));
            emp.setEmpdate(LocalDate.parse(rs.getString("empdate")));
            emp.setDeptid(rs.getInt("deptid"));
            emp.setDeptname(rs.getString("deptname"));
            empList.add(emp);
             }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            jdbcTemplate.closeResource();
        }
        return empList;
    }

    /**
     *   //查询当前部门下是否有员工
     * @param deptids
     * @return 返回人数
     */
    public int findEmpNumByDeleteDept(String deptids){
        String sql = "select count(*) as count from emp where deptid in("+ deptids +")";
        ResultSet rs = this.getJdbcTemplate().executeQuery(sql, null);
        int count = 0;
        try {
            while (rs.next()){
                count = rs.getInt("count");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return count;
    }
}
