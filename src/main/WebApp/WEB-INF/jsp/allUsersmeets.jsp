<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All events of users</title>
</head>
<body>
<table border="2", bgcolor="#00FF00">
    <tr>
        <th>Nickname</th>
        <th>Events</th>

    </tr>

    <c:forEach items="${allUsers}" var = "user">
        <tr>
            <td> ${user.username}</td>
            <td><a href = "/user/${user.id}/meets">show events of this user</a></td>
            <%--<td>--%>
                <%--<c:forEach items="${user.meets}" var="tweet">--%>
                    <%--<td>${meet.text}</td> &lt;%&ndash;czemu to nie dziala od razu tylko trzeba tworzyc osobnego jspa???&ndash;%&gt;--%>
                <%--</c:forEach>--%>
            <%--</td>--%>
        </tr>
    </c:forEach>
</table>

</body>
</html>