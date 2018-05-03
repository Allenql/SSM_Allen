package com.sust.spring.mapper;

import com.sust.spring.domain.Dept;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

public interface DeptMapper {

    @Select("select * from dept")
    List<Dept> findAll();
}
