package com.sust.spring.service.impl;

import com.sust.spring.dao.DeptDAO;
import com.sust.spring.domain.Dept;
import com.sust.spring.mapper.DeptMapper;
import com.sust.spring.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

//    @Autowired
//    private DeptDAO deptDAO;

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> findAll() {
        return deptMapper.findAll();
    }

//    @Override
//    public List<Dept> findAll() {
//        return deptDAO.findAll();
    // }
}
