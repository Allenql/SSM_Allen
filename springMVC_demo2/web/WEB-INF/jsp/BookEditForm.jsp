<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ZQL
  Date: 2018/5/29
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Book</title>
</head>
<body>
<div>
    <c:url var="formAction" value="/update-book"/>
    <form:form commandName="book" action="${formAction}" method="post">
        <fieldset>
            <legend>修改图书</legend>
            <form:hidden path="id"/>
            <p>
                <label for="category">类别：</label>
                <form:select path="category.id" id="category" items="${categories}" itemLabel="name" itemValue="id"/>
            </p>
            <p>
                <label for="title">书名：</label>
                <form:input path="title" id="title"/>
            </p>
            <p>
                <label for="author">作者：</label>
                <form:input path="author" id="author"/>
            </p>
            <p>
                <label for="isbn">ISBN：</label>
                <form:input path="isbn" id="isbn"/>
            </p>
            <p>
                <label for="price">价格：￥</label>
                <form:input path="price" id="price"/>
            </p>
            <p id="buttons">
                <input id="reset" type="reset" tabindex="4">
                <input id="submit" type="submit" tabindex="5" value="修改图书">
            </p>
        </fieldset>
    </form:form>
</div>
</body>
</html>
