<%--
  Created by IntelliJ IDEA.
  User: ShiXin
  Date: 2019/11/14
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<form action="/edoc/updatelist.html" method="post" >

    <table align="center" border="1" cellpadding="0" cellspacing="0">
        <tr><th colspan="2" style="font-size: 30px;background-color: #C9f8cc">更新电子文档</th></tr>
        <tr>
            <td>文档编号：</td>
            <td>
                <input type="tel" value="${edocEntry.id}" name="id">
            </td>
        </tr>
        <tr><td>文档名称：</td>
            <td><input name="title" type="text" value="${edocEntry.title}"/></td>
        </tr>

        <tr>
            <td>文档摘要：</td>
            <td><input type="text" name="summary" value="${edocEntry.summary}"></td>
        </tr>
        <tr>
            <td>上传人：</td>
            <td><input type="text" name="uploaduser" value="${edocEntry.uploaduser}">
                </td>
        </tr>
        <tr>
            <td>上传时间:</td>
            <td><input name="createdate11" type="text" value="<fmt:formatDate value="${edocEntry.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate> ">yyyy-MM-dd</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="提交">
                <input type="button" onclick="javascript:history.back(-1)" value="返回">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
