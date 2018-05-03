package com.sust.spring.dao.impl;

import com.sust.spring.dao.DeptDAO;
import com.sust.spring.domain.Dept;
import com.sust.spring.mapper.DeptMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DeptDAOImpl implements DeptDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Dept> findAll() {
        DeptMapper deptMapper = sqlSession.getMapper(DeptMapper.class);
        return deptMapper.findAll();
    }
}
