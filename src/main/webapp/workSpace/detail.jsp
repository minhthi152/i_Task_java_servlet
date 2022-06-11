<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/layout/headerLink.jsp" %>
    <link rel="stylesheet" href="/assets/iziToast/iziToast-1.4.0.min.css">
    <title>Document</title>

</head>
<body>
<%@ include file="/layout/header.jsp" %>
<div class="task-body" style="margin-top: 80px">


    <div id="update-task-div">

        <div style="height: 20px">
            <span class="close-update-btn">&times;</span>
        </div>
        <form method="post">

            <table>
                <tr>
                    <td><label>Task name</label></td>
                    <td><input type="text" spellcheck="false" id="update-new-task" name="newTaskName"></td>
                </tr>
                <tr>
                    <td><label>Deadline</label></td>
                    <td><input type="date" spellcheck="false" id="update-new-deadline" name="newDeadline"></td>
                </tr>
                <tr>
                    <td><label>Status</label></td>
                    <td>
                        <select>
                            <option value="1">PENDING</option>
                            <option value="2">PROCESSING</option>
                            <option value="3">REVIEWING</option>
                            <option value="4">COMPLETED</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-warning" id="btn-update-task">
                            <a>
                                <i class="fa-solid fa-plus"></i> Update
                            </a>
                        </button>
                    </td>
                </tr>

            </table>

        </form>
    </div>

    <div class="container">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-2">
                    <h3 name="task-id" id="task-id">${task.getId()}</h3>
                </div>
                <div class="col-sm-3">
                    <h3 name="task-name">${task.getTaskName()}</h3>
                </div>
                <div class="col-sm-7">
                </div>
            </div>
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Create date</th>
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
                    <div id="performersList">

                        <c:forEach items='${requestScope["performerDTOs"]}' var="item">
                            <div class="div-image" style="display:inline-block;position: relative;">
                                <img class="avatar" src="${item.getAvatar()}" alt="">
                                <div class="iconAvatar"><i class="fa-solid fa-circle-minus"></i></div>
                            </div>
                        </c:forEach>

                    </div>
                </td>


                <td>
                    <div class="row">
                        <div class="col-sm-2">
                            <button id="open-update-form-btn" class="btn btn-outline-primary" type="button">
                                <i class="fas fa-edit"></i>
                            </button>
                            <%--                            <a id="open-update-form" class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html" data-bs-original-title="Edit">--%>

                            <%--                            </a>--%>
                        </div>
                        </form action="#">
                        <div class="col-sm-8">

                            <select id="user_id" class="form-select" name="userId">
                                <option value="" disabled selected>Add performer</option>
                                <c:forEach items='${requestScope["users"]}' var="item">
                                    <option value="${item.getId()}">(${item.getId()}) ${item.getFullName()}</option>
                                </c:forEach>
                            </select>


                        </div>
                        <div class="col-sm-2">
                            <button type="button" id="btn-addPerformer" class="btn btn-outline-primary"><i
                                    class="fa-solid fa-user-plus"></i></button>
                        </div>
                        </form>
                    </div>
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
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html"
                       data-bs-original-title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html"
                       data-bs-original-title="Edit">
                        <i class="fa-solid fa-xmark"></i>
                    </a>
                    <a class="btn btn-outline-primary" title="" data-toggle="tooltip" href="./update.html"
                       data-bs-original-title="Edit">
                        <i class="fa-solid fa-circle-plus"></i>
                    </a>

                </td>

            </tr>
            </tbody>
        </table>
    </div>
</div>

<script src="/assets/iziToast/iziToast-1.4.0.js"></script>
<script src="/assets/js/axios.min.js"></script>


<script>
    let btnAddPerformer = document.getElementById("btn-addPerformer");

    btnAddPerformer.addEventListener("click", function () {
        let taskId = document.getElementById("task-id").textContent;
        var selectedUser = document.getElementById('user_id');
        var userId = selectedUser.options[selectedUser.selectedIndex].value;
        console.log(taskId);
        console.log(userId);

        let permissionId = 1;
        let performer = {
            taskId: taskId,
            userId: userId,
            permissionId: permissionId
        }
        addPerformerToTask(performer);
    })

    function addPerformerToTask(performer) {
        let taskId = document.getElementById("task-id");

        axios({
            method: 'post',
            url: 'http://localhost:8080/api/performer?action=addPerformerToTask',
            data: performer
        })
            .then(function (response) {
                console.log(response)
                let data = response.data;
                let str = `
                        <div class="div-image" style="display:inline-block;position: relative;">
                                <img class = "avatar" src="\${response.data.avatar}" alt="">
                                <div class="iconAvatar"><i class="fa-solid fa-circle-minus"></i></div>
                        </div>
                    `;

                let performersList = document.getElementById('performersList');
                performersList.insertAdjacentHTML('afterbegin', str);

                iziToast.success({
                    title: 'OK',
                    position: 'bottomRight',
                    timeout: 2500,
                    message: 'Successfully added performer!'
                });


            })
            .catch((error) => {
                iziToast.error({
                    title: 'OK',
                    position: 'bottomRight',
                    timeout: 1500,
                    message: error.response.data
                });
            });
    }


    var updateForm = document.getElementById("update-task-div");

    var openUpdateBtn = document.getElementById("open-update-form-btn");

    var spanClose = document.getElementsByClassName("close-update-btn")[0];

    openUpdateBtn.onclick = function () {
        updateForm.style.display = "block";
    }

    spanClose.onclick = function () {
        updateForm.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == updateForm) {
            updateForm.style.display = "none";
        }
    }

</script>
</body>
</html>