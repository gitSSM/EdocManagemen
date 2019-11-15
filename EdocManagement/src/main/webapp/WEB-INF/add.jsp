<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ShiXin
  Date: 2019/11/14
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>添加</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="https://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

    <script type="text/javascript">
        $(function () {

            $("#form").submit(function () {
                var title=$("#title").val();
                var createdate=$("#createdate").val();
                var $regExp = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;

                if (title==""||title==null){
                    alert("文档名称不能为空！");
                    return false;
                }
                if (createdate == ""||createdate==null) {
                    alert("上传日期不能为空");
                    return false;
                }
                if (!$regExp.test(createdate)) {
                    alert("日期的输入格式为‘年-月-日’");
                    return false;
                }

                return true;
            });
        });

    </script>
</head>
<body>
<form action="/edoc/addlist.html" method="post" id="form">
<table align="center" border="1" cellpadding="0" cellspacing="0">
    <tr><th colspan="2" style="font-size: 30px;background-color: #C9f8cc" >添加电子文档</th></tr>
    <tr>
        <td>分类名称：</td>
        <td><select name="categoryId">
            <c:if test="${categoryList!=null}">
                <c:forEach items="${categoryList}" var="ca">
                    <option value="${ca.id}">${ca.name}</option>
                </c:forEach>
            </c:if>
        </select></td>
    </tr>
    <tr><td>文档名称：</td>
    <td><input name="title" id="title" type="text" value=""/></td>
    </tr>
    <tr>
        <td>文档摘要：</td>
        <td><input type="tel" id="summary" name="summary" value=""></td>
    </tr>
    <tr>
        <td>上传人：</td>
        <td><input type="text" id="uploaduser" name="uploaduser" value=""/></td>
    </tr>
    <tr>
        <td>上传时间:</td>
        <td><input name="createdate" id="createdate" type="text" value="<fmt:formatDate value='${edocEntry.createdate}' pattern='yyyy-MM-dd'></fmt:formatDate> ">yyyy-MM-dd</td>
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
