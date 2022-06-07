
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/layout/headerLink.jsp"%>
    <title>Document</title>
    <style>

        .form-container{
            padding-top: 40px;
            padding-left: 30px;
            padding-right: 30px;
            padding-bottom: 40px;

            width: 600px;
            height: 550px;
            margin: 0 auto;
            margin-top: 50px;
            /* text-align: center; */
            background-color:#fff ;
            border-radius: 5px;
            /* text-align: center; */
        }
        body{
            background-image: url("https://wallpaperaccess.com/full/349872.jpg");
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<div class="form-container">
    <form class="form-login">
        <legend>Sign Up</legend>
        <p>Create your account. It's free and only takes a minute</p>
        <div class="row">
            <!-- Email input -->
            <div class="form-outline mb-4 col-md-6">
                <label class="form-label" for="email">Email address</label>
                <input type="email" id="email" class="form-control" />
            </div>
            <!-- Phone input -->
            <div class="form-outline mb-4 col-md-6">
                <label class="form-label" for="phone">Phone number</label>
                <input type="text" id="phone" class="form-control" />
            </div>
        </div>
        
        <div class="row">
            <!-- Fullname input -->
            <div class="form-outline mb-4 col-md-6">
                <label class="form-label" for="fullName">Full name</label>
                <input type="text" id="fullName" class="form-control" />
            </div>
            <!-- Username input -->
            <div class="form-outline mb-4 col-md-6">
                <label class="form-label" for="username">Username</label>
                <input type="text" id="username" class="form-control" />
            </div>
        </div>
            <!-- Password input -->
        <div class="row">
            <div class="form-outline mb-4 col-md-6">
                <label class="form-label" for="password">Password</label>
                <input type="password" id="password" class="form-control" />
            </div>
            <div class="form-outline mb-4 col-md-6">
                <label class="form-label" for="password">Re-type password</label>
                <input type="password" id="rePassword" class="form-control" />
            </div>
        </div>

        <div class="row">
            <div class = "col-md-1"><input type="checkbox"></div>
            <div class="col-md-11"><p> I agree with the term of services</p></div>
        </div>
            <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Sign up</button>
    </form>
</div>
</body>
</html>

