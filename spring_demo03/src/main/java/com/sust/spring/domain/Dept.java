package com.sust.spring.domain;

public class Dept {

    private int deptid;
    private String deptname;
    private int deptnum;
    private String deptdesc;

    public int getDeptid() {
        return deptid;
    }

    public void setDeptid(int deptid) {
        this.deptid = deptid;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public int getDeptnum() {
        return deptnum;
    }

    public void setDeptnum(int deptnum) {
        this.deptnum = deptnum;
    }

    public String getDeptdesc() {
        return deptdesc;
    }

    public void setDeptdesc(String deptdesc) {
        this.deptdesc = deptdesc;
    }
}
