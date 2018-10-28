<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Events of city</title>
</head>
<body>

<h4>Searching meets: ${search1}</h4>



<ul>
    <c:forEach var="meet" items="${meets1}">
        <li>
            Date of event:  ${meet.meetingDate}<br>
            Who created: <a href="/user/${meet.user.id}/aboutUser">${meet.user.username}</a><br>
            City of the event: ${meet.city}<br>
            Decription:  ${meet.text}<br>
            <a href="/meet/${meet.id}/comment"><button type="button" class="btn btn-primary btn-sm">JOIN</button></a>
        </li>

    </c:forEach>
</ul>



</body>
</html>