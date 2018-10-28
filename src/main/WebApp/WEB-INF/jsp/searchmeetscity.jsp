<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search event</title>
</head>
<body>
<%--<table border="2", bgcolor="#00FF00">--%>
    <%--<tr>--%>
        <%--<th></th>Category</th>--%>
        <%--<th>Events</th>--%>

    <%--</tr>--%>

    <%--<c:forEach items="${allMeets}" var = "meets">--%>
        <%--<tr>--%>
            <%--<td> ${meets.category}</td>--%>
            <%--<td><a href = "/meet/${meet.category}">show events of this category</a></td>--%>
                <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<c:forEach items="${user.meets}" var="tweet">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td>${meet.text}</td> &lt;%&ndash;czemu to nie dziala od razu tylko trzeba tworzyc osobnego jspa???&ndash;%&gt;&ndash;%&gt;--%>
                <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>

<%--<table border="2", bgcolor="#00FF00">--%>
    <%--<tr>--%>
        <%--<th></th>City</th>--%>
        <%--<th>Events</th>--%>

    <%--</tr>--%>

    <%--<c:forEach items="${allMeets}" var = "meets">--%>
        <%--<tr>--%>
            <%--<td> ${meets.city}</td>--%>
            <%--<td><a href = "/meet/${meet.city}">show events of this city</a></td>--%>
                <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<c:forEach items="${user.meets}" var="tweet">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td>${meet.text}</td> &lt;%&ndash;czemu to nie dziala od razu tylko trzeba tworzyc osobnego jspa???&ndash;%&gt;&ndash;%&gt;--%>
                <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>



<form method='Post'>

    <label>
        Search by city:<br>
        <input type="text" name="search1">
    </label>
    <br>

    <br>
    <button type="submit">Search</button>

</form>

</body>
</html>
