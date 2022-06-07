<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/layout/headerLink.jsp"%>
    <title>Sign in</title>
    <style>
        .form-container{
            padding-top: 20px;
            padding-left: 20px;
            padding-right: 20px;

            width: 400px;
            height: 530px;
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
    <form class="form-login" action="/signIn" method="post">
        <legend>Sign In</legend>
        <!-- Email input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="form2Example1">Username</label>
            <input type="text" name="username" id="form2Example1" class="form-control"/>
        </div>

        <!-- Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="form2Example2">Password</label>
            <input type="password" name="password" id="form2Example2" class="form-control"/>
        </div>
        <p>${message}</p>

        <!-- 2 column grid layout for inline styling -->
        <div class="row mb-4">
            <div class="col d-flex justify-content-center">
                <!-- Checkbox -->
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                    <label class="form-check-label" for="form2Example31"> Remember me </label>
                </div>
            </div>

            <div class="col">
                <!-- Simple link -->
                <a href="#!">Forgot password?</a>
            </div>
        </div>

        <!-- Submit button -->
        <div class="text-center">
            <button type="submit" id="btn-sign-in" class="btn btn-primary btn-block mb-4">Sign in</button>
        </div>
        <!-- Register buttons -->
        <div class="text-center">
            <p>Not a member? <a href="#!">Register</a></p>
            <p>or sign up with:</p>
            <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fa-brands fa-facebook-square"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fa-brands fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fa-brands fa-google"></i>
            </button>
        </div>
    </form>
</div>
</body>
</html>



