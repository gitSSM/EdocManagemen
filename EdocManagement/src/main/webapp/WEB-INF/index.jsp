<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查询</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="https://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("th").css("background-color","#808080")
            $("tr:odd").css("background-color","#C9f8cc");
        });

        function  del(id) {
          var div=  document.getElementById("#div");
          div.html("删除成功");
          location.href='/edoc/index.html';
        }




    </script>
</head>
<body>
<div align="center">
    <form action="/edoc/index.html" method="post">

    <div>文档分类
    <select name="categoryId">
        <option value="">全部</option>

        <c:if test="${categoryList!=null}">
        <c:forEach items="${categoryList}" var="ca">
            <option value="${ca.id}">${ca.name}</option>
        </c:forEach>
        </c:if>
    </select>
        <input type="submit" value="查询" />
        <a href="/edoc/add.html"><input type="button" value="添加电子文档"/></a>
    </div>

    <table border="1" cellspacing="0" cellpadding="0">
        <tr>
            <th>文档编号</th>
            <th>文档名称</th>
            <th>文档摘要</th>
            <th>上传人</th>
            <th>上传时间</th>
            <th>操作</th>
        </tr>
        <c:forEach var="en" items="${entryList}">
            <tr>
                <td>${en.id}</td>
                <td>${en.title}</td>
                <td>${en.summary}</td>
                <td>${en.uploaduser}</td>
                <td><fmt:formatDate value="${en.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                <td><a href="/edoc/update.html?id=${en.id}">修改</a>
                <a  href="/edoc/del.html?id=${en.id}">删除</a>

                </td>
            </tr>
        </c:forEach>
        <c:if test="${result==true}">
            <tr><td id="del" colspan="6" align="center">删除成功</td></tr>
        </c:if>
        <c:if test="${result==false}">
            <tr> <td colspan="6"  align="center">删除失败</td></tr>
        </c:if>

    </table>
<div id="div"></div>
    </form>
</div>
</body>
</html>
