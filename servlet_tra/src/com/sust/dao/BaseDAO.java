package com.sust.dao;


import com.sust.util.JdbcTemplate;

public class BaseDAO {

//     public static int pageNorm = 3;
    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void closeResources() {
        jdbcTemplate.closeResource();
    }
}
