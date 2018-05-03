package com.sust.spring.dao;

import com.sust.spring.domain.Dept;

import java.util.List;

public interface DeptDAO {

    List<Dept> findAll();
}
