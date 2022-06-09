<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/layout/headerLink.jsp"%>


    <title>Document</title>
</head>
<body>
<%@ include file="/layout/header.jsp"%>
<div class="task-body">

    <div class="container">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-2">
                    <h3 name="task-id" >${task.getId()}</h3>
                </div>
                <div class="col-sm-3">
                    <h3 name="task-name" >${task.getTaskName()}</h3>
                </div>
                <div class="col-sm-7">
                </div>
            </div>
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Create date </th>
                <th>Deadline</th>
                <th>Create by</th>
                <th>Status</th>
                <th>Performer</th>
                <th>Edit</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${task.getCreateDate()}</td>
                <td>${task.getDeadline()}</td>
                <td>${task.getCreatorFullName()}</td>
                <td>${task.getStatusName()}</td>
                <td>
                    <div>
                        <div class="div-image" style="display:inline-block;position: relative;">
                            <img class = "avatar" src="/assets/image/dinosaur.png" alt="">
                            <div class="iconAvatar"><i class="fa-solid fa-circle-minus"></i></div>
                        </div>
                        <div class="div-image" style="display:inline-block;position: relative;">
                            <img class = "avatar" src="/assets/image/dinosaur.png" alt="">
                            <div class="iconAvatar"><i class="fa-solid fa-circle-minus"></i></div>
                        </div>
                        <div class="div-image" style="display:inline-block;position: relative;">
                            <img class = "avatar" src="/assets/image/dinosaur.png" alt="">
                            <div class="iconAvatar"><i class="fa-solid fa-circle-minus"></i></div>
                        </div>
                    </div>
                </td>


                <td>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html" data-bs-original-title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html" data-bs-original-title="Edit">
                        <i class="fa-solid fa-user-plus"></i>
                    </a>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html" data-bs-original-title="Edit">
                        <i class="fa-solid fa-circle-plus"></i>
                    </a>


                </td>

            </tr>
            </tbody>
        </table>
    </div>

    <div class="container">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><i class="far fa-calendar-alt"></i></th>
                <th>Content</th>
                <th>Create by</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>hshsh</td>
                <td>dfgsdfg</td>
                <td>Thi Pham</td>
                <td>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html" data-bs-original-title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html" data-bs-original-title="Edit">
                        <i class="fa-solid fa-xmark"></i>
                    </a>

                </td>


            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>