<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="forr" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tweet form</title>
</head>
<body>
<style>
    .error {
        color: red;
    }
</style>

<form:form method="post" modelAttribute="message">
    <form:hidden path="id"/>
    <form:hidden path="sender.id"/>

    To user: <form:input path="receiver.username"/><br>
    <form:errors path="receiver.username" cssClass="error" /><br><br>
    Title: <form:textarea path="title" rows="3" cols="10"/><br>
    <form:errors path="title" cssClass="error" /><br><br>
    Message text: <form:textarea path="textmessage" rows="3" cols="20"/><br>
    <form:errors path="textmessage" cssClass="error" /><br><br>
    <%--User: <form:select path="user.id" items="${allUsers}" itemLabel="username" itemValue="id"></form:select><br>--%>

    <input type="submit" value="Submit">
</form:form>


</body>
</html>