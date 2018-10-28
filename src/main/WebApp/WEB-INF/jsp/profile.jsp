<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Twitter application</title>

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

        /*body#LoginForm{ background-image:url("https://hdwallsource.com/img/2014/9/blur-26347-27038-hd-wallpapers.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}*/

        body {
            background-color: #1abc9c;
        }
        .form-heading { color:#fff; font-size:23px;}
        .panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
        .panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
        .login-form .form-control {
            background: #f7f7f7 none repeat scroll 0 0;
            border: 1px solid #d4d4d4;
            border-radius: 4px;
            font-size: 14px;
            height: 50px;
            line-height: 50px;
        }
        .main-div {
            background: #ffffff none repeat scroll 0 0;
            border-radius: 2px;
            margin: 10px auto 30px;
            max-width: 38%;
            padding: 50px 70px 70px 71px;
        }

        .login-form .form-group {
            margin-bottom:10px;
        }
        .login-form{ text-align:center;}
        .forgot a {
            color: #777777;
            font-size: 14px;
            text-decoration: underline;
        }
        .login-form  .btn.btn-primary {
            background: #f0ad4e none repeat scroll 0 0;
            border-color: #f0ad4e;
            color: #ffffff;
            font-size: 14px;
            width: 100%;
            height: 50px;
            line-height: 50px;
            padding: 0;
        }
        .forgot {
            text-align: left; margin-bottom:30px;
        }
        .botto-text {
            color: #ffffff;
            font-size: 14px;
            margin: auto;
        }
        .login-form .btn.btn-primary.reset {
            background: #ff9900 none repeat scroll 0 0;
        }
        .back { text-align: left; margin-top:15px;}
        .back a {color: #444444; font-size: 13px;text-decoration: none;}

        .tableAllUsers {
            color: darkslategrey;
            font-size: 10px;
        }

    </style>
</head>

<body id="LoginForm">
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
    </div>
</nav>
<div class="container">
    <h1 class="form-heading">Your Profile</h1>
    <div class="login-form">
        <div class="main-div">




            <table border="0", bgcolor="#00FF00" class="tableAllUsers table table-striped">
                <p style="color: darkslategrey; text-align: left">Login: ${userProfile.username}</p>
                <p style="color: darkslategrey; text-align: left">Name:  ${userProfile.name}</p>
                <p style="color: darkslategrey; text-align: left">Surname: ${userProfile.surname}</p>
                <p style="color: darkslategrey; text-align: left">About User: ${userProfile.aboutme}</p>


            </table>




            <p><a href = "/meet/add?userId=${userProfile.id}">Add Event</a></p>
            <p><a href = "/message/add?senderId=${userProfile.id}">Write message</a></p>


            <table border="0", bgcolor="#00FF00" class="tableAllUsers table table-striped">
                <tr>
                    <th>Events</th>
                    <th>Category</th>
                    <th>City</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <c:forEach var="meet" items="${meets}">
                    <tr>
                        <td> ${meet.text}</td>
                        <td> ${meet.category}</td>
                        <td> ${meet.city}</td>

                        <td> ${meet.created}</td>
                        <td><a href = "/meet/edit/${meet.id}">edit</a>
                        <td><a href = "/meet/delete/${tmeet.id}">delete</a>
                    </tr>
                </c:forEach>
            </table>

        </div>


    </div>
    <div> <p class="botto-text"> The Best Events' Community</p></div>
</div></div></div>

<footer class="container-fluid bg-4 text-center">
    <p>Meeting Application For Active People All Rights Reserved 2018</p>
</footer>

</body>
</html>



