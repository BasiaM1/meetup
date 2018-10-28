<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Meeting application</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<link rel="stylesheet" type="text/css" href="resources/css/style.css">--%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .error {
            color: red;
        }
        .bg-1 {
            background-color: #1abc9c; /* Green */
            color: #ffffff;
        }

        .bg-2 {
            background-color: #474e5d; /* Dark Blue */
            color: #ffffff;
        }

        .bg-3 {
            background-color: #ffffff; /* White */
            color: #555555;
        }

        .container-fluid {
            padding-top: 30px;
            padding-bottom: 30px;
        }

        .navbar {
            padding-top: 15px;
            padding-bottom: 15px;
            border: 0;
            border-radius: 0;
            margin-bottom: 0;
            font-size: 12px;
            letter-spacing: 5px;
        }

        .navbar-nav li a:hover {
            color: #1abc9c !important;
        }

        .bg-4 {
            background-color: #2f2f2f;
            color: #ffffff;
        }

        body {
            font: 20px "Montserrat", sans-serif;
            line-height: 1.8;
            color: #f5f6f7;
        }

        p {font-size: 16px;}

        .whyJoin {
            color: darkslategrey;
            padding: 20px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/"><img class="logoApp" src="resources/images/logoMeetingApplication.png"></a>
        </div>
        <%--<div class="collapse navbar-collapse" id="myNavbar">--%>
            <%--<ul class="nav navbar-nav navbar-right">--%>
                <%--<li><a href="user/all">ADMIN</a></li>--%>
                <%--<li><a href="user/login">LOG IN</a></li>--%>
                <%--<li><a href="user/register">SING UP</a></li>--%>

            <%--</ul>--%>
        <%--</div>--%>
    </div>
</nav>

<div class="container-fluid bg-1 text-center">
    <h3>LET'S MEET UP!</h3>
    <h4>Be a part of private events</h4>
    <div class="imgBox">
        <img src="resources/images/party.jpg" class="img-circle" alt="Party">

        <div class="whyJoin">

            <form:form method="post" modelAttribute="meet">
                <form:hidden path="id"/>
                <form:hidden path="user.id"/>
                <h1>Please create your event</h1><br>
                Choose category:<form:select path="category" items="${categoryItems}" /><br>
                <form:errors path="category" cssClass="error" /><br><br>
                Choose city:<form:select path="city" items="${cityItems}" /><br>
                <form:errors path="city" cssClass="error" /><br><br>
                When:<form:input path="meetingDate" type="date" placeholder="date of event" /><br>
                Event description: <form:textarea path="text" rows="10" cols="100"/><br>
                <form:errors path="text" cssClass="error" /><br><br>


                <input type="submit" value="Submit">
            </form:form>

        </div>

        <footer class="container-fluid bg-4 text-center">
            <p>Meeting Application For Active People All Rights Reserved 2018</p>
        </footer>

</body>
</html>