<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MeetUP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <style>
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

        p, h4 {
            font-size: 16px;
            color: steelblue;
        }

        /*.eventsList {*/
        /*list-style-type: none;*/
        /*}*/

        .eventAutorData {
            font-size: 10px;
            color: darkslategrey;
        }

        .box {
            padding: 10px;
        }

        .box .inner {
            background-color: #c6456f;
            border-radius: 5px;
        }

        .imgBox {
            padding: 10px;
        }

        .btm {
            padding: 10px;
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

        <security:authorize access="isAuthenticated()">
            <security:authentication var="user" property="principal"/>
            <a href="/user/${user.id}"> ${user.username}</a>
            <br/>
            <form action="/logout" method="post">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
                <input type="submit" value="Logout">
            </form>
        </security:authorize>


        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<c:url value="/user/register"/>">SIGN UP</a></li>

                <li><a href="<c:url value="/user/login"/>">LOG IN</a></li>

            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid bg-1 text-center">
    <h3>LET'S MEET UP!</h3>
    <h4>Be a part of private events</h4>
    <div class="imgBox">
        <img src="resources/images/party.jpg" class="img-circle" alt="Party">
    </div>

    <div style ="font-size: 15px">
        <a href="<c:url value="/meet/allm"/>"><button class ="btn btn-default">Show all events</button></a>
        <a href="<c:url value="/user/search-meets"/>"><button class ="btn btn-default">Show events by category</button></a>
        <a href="<c:url value="/user/search-meetscity"/>"><button class ="btn btn-default">Show events by city</button></a>
        <a href="<c:url value="/user/all"/>"><button class ="btn btn-default">Show events by user</button></a>
    </div>
<br>
    <br>
    <br>
    <br><br><br><br><br>






<footer class="container-fluid bg-4 text-center">
    <p>Meeting Application For Active People All Rights Reserved 2018</p>
</footer>

</body>
</html>