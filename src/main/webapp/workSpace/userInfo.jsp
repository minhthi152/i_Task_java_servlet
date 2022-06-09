<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/layout/headerLink.jsp"%>


    <title>Document</title>
</head>

<body>
<%@ include file="/layout/header.jsp" %>

<div class="container" style="background-color: #fff;">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID </th>
            <th>Fullname</th>
            <th>Username</th>
            <th>Role</th>
            <th>Email</th>
            <th>Phone number</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>ID </th>
            <th>Fullname</th>
            <th>Username</th>
            <th>Role</th>
            <th>Email</th>
            <th>Phone number</th>
        </tr>
        </tbody>
    </table>
</div>

<div class="container">
    <button type="button" class="btn btn-success">
        <a>
            <i class="fa-solid fa-user-group"></i> Change password
        </a>
    </button>
    <button type="button" class="btn btn-success">
        <a>
            <i class="fa-solid fa-user-group"></i> Change avatar
        </a>
    </button>
</div>
<br>
<div class="container">
    <img id="avatar" src="/image/dinosour.png" alt="">
</div>


</body>

</html>
