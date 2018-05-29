<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZQL
  Date: 2018/5/29
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book List</title>
</head>
<body>
<div>
    <h1>图书列表</h1>
    <a href="<c:url value="/input-book"/>">添加图书</a>
    <table border="1">
        <tr>
            <th>类别</th>
            <th>书名</th>
            <th>ISBN</th>
            <th>作者</th>
            <th>价格</th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach items="${books}" var="book">
            <tr>
                <td>${book.category.name}</td>
                <td>${book.title}</td>
                <td>${book.isbn}</td>
                <td>${book.author}</td>
                <td>￥${book.price}</td>
                <td><a href="edit-book/${book.id}">修改</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
