<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Tweets</title>
</head>
<body>
<ul>
    <c:forEach var="meet" items="${umeets}">
        <li>
               Date of event: ${meet.meetingDate}<br>
               Category: ${meet.category}<br>
               City: ${meet.city}<br>
               Decription: ${meet.text}<br>

        </li>
    </c:forEach>
</ul>


</body>
</html>