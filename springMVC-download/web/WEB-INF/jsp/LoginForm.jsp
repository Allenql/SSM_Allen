<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
</head>
<body>
<div id="global">
<form:form commandName="login" action="login" method="post">
    <fieldset>
        <legend>登录</legend>
        <p>
            <label for="userName">用户名: </label>
            <form:input id="userName" path="userName" cssErrorClass="error"/>
        </p>
        <p>
            <label for="password">密码: </label>
            <form:password id="password" path="passWord" cssErrorClass="error"/>
        </p>
        <p id="buttons">
            <input id="reset" type="reset" tabindex="4">
            <input id="submit" type="submit" tabindex="5" 
                value="登录">
        </p>
    </fieldset>
</form:form>
</div>
</body>
</html>