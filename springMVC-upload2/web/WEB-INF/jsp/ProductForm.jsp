<%--
  Created by IntelliJ IDEA.
  User: ZQL
  Date: 2018/5/30
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
<div>
    <form action="/save-product" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>文件上传演示</legend>
            <label for="image">文件：</label>
            <input type="file" id="image"  name="images[0]">
            <br><br>
            <div id="button2">
                <label></label>
                <input id="reset" type="reset" tabindex="4">
                <input id="submit" type="submit" tabindex="5" value="上传">
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
