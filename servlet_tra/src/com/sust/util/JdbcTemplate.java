package com.sust.util;

import java.sql.*;

public class JdbcTemplate {

    private Connection connection;

    private PreparedStatement preparedStatement;

    private ResultSet resultSet;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //获取链接
    private void getConnection() {
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_jsp", "root", "0212");
            connection.setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //创建ps对象
    private void createPreparedStatement(String sql) {
        this.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 执行查询的sql
     *
     * @param sql  带?号的sql
     * @param args ？号的值
     * @return rs
     */
    public ResultSet executeQuery(String sql, String[] args) {
        this.createPreparedStatement(sql);
        try {
            //？号赋值
            for (int i = 0; args != null && i < args.length; i++) {
                preparedStatement.setString(i + 1, args[i]);
            }
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    /**
     * 分页查询
     * @param sql
     * @param args
     * @return
     */
    public ResultSet executeQueryWithCurrentPage(String sql, Integer[] args) {
        this.createPreparedStatement(sql);
        try {
            //？号赋值
            for (int i = 0; args != null && i < args.length; i++) {
                preparedStatement.setInt(i + 1, args[i]);
            }
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    /**
     * 执行增删改的sql
     *
     * @param sql  带？号的sql
     * @param args ？号的值
     * @return 影响的行数
     */
    public int executeUpdate(String sql, String[] args) {
        int rowCount = -1;

        this.createPreparedStatement(sql);
        try {
            //？号赋值
            for (int i = 0; args != null && i < args.length; i++) {
                preparedStatement.setString(i + 1, args[i]);
            }
            rowCount = preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            //关闭资源
            this.closeResource();
        }
        return rowCount;
    }

    /**
     * 获取首行首列的值
     *
     * @param sql
     * @return
     */
    public String executeScalar(String sql, String[] args) {
        String count = "";

        this.createPreparedStatement(sql);
        try {
            //？号赋值
            for (int i = 0; args != null && i < args.length; i++) {
                preparedStatement.setString(i + 1, args[i]);
            }
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getString(1); //获取数据库中首行首列的值
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //关闭资源
            this.closeResource();
        }
        return count;

    }

    /**
     * 批处理
     *
     * @param sqls
     * @return
     */
    public int executeBatch(String[] sqls) {
        int rowCount = 0;
        this.getConnection();
        try {
            Statement statement = connection.createStatement();
            for (int i = 0; i < sqls.length; i++) {
                statement.addBatch(sqls[i]);
            }
            int[] rows = statement.executeBatch();
            connection.commit();

            for (int row : rows) {
                rowCount += row;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            this.closeResource();
        }
        return rowCount;
    }

    /**
     * 关闭资源
     */
    public void closeResource() {
        try {
            if (resultSet != null) {
                resultSet.close();
                resultSet = null;
            }
            if (preparedStatement != null) {
                preparedStatement.close();
                preparedStatement = null;
            }
            if (connection != null) {
                connection.close();
                connection = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
