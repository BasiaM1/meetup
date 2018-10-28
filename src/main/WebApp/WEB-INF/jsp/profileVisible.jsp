<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All users</title>
</head>
<body>

    <h3>About user </h3>


        ${user.username}<br>
        ${user.name}<br>
        ${user.surname}<br>
        ${user.aboutme}<br>
        <a href = "/user/${user.id}/meets">show tweets of this user</a> <%--jak wyswietlic na tej stronie od razu tweety dla konkretnego uzytkownika --%>


</body>
</html>