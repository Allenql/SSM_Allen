package com.sust.spring.service.impl;

import com.sust.spring.domain.Dept;
import com.sust.spring.service.DeptService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application-context.xml");
        DeptService deptService = applicationContext.getBean("deptServiceImpl", DeptService.class);
        List<Dept> deptList = deptService.findAll();
        System.out.println(deptList.size());
    }
}
