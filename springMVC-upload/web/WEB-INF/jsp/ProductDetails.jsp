<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZQL
  Date: 2018/5/30
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件展示</title>
</head>
<body>
<div>
    <p>文件上传成功！</p>
    <ol>
        <c:forEach items="${product.images}" var="image">
            <li>${image.originalFilename}
                <img width="300px" src="<c:url value='/image/'/>${image.originalFilename}">
            </li>
        </c:forEach>
    </ol>
</div>
</body>
</html>
