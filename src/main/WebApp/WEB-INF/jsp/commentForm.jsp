<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="forr" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Comment form</title>
</head>
<body>
<style>
    .error {
        color: red;
    }
</style>

<form:form method="post" modelAttribute="comment">
    Tell me why do you want to join this event: <form:textarea path="text" rows="3" cols="20"/><br>
    <form:errors path="text" cssClass="error" /><br><br>
    <%--User: <form:select path="user.id" items="${allUsers}" itemLabel="username" itemValue="id"></form:select><br>--%>

    <input type="submit" value="Submit">
</form:form>


</body>
</html>