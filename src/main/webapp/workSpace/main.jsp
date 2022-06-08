<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/layout/headerLink.jsp"%>

    <title>Document</title>
</head>
<body>
<%@ include file="/layout/header.jsp"%>

<div id = "workspace">
    <div id="create-task-div">

        <div style="height: 20px">
            <span class="close-btn">&times;</span>
        </div>
        <form action="#">
            <div class="row title">
                <label>Task name</label>
                <input type="text" spellcheck="false" id="input-new-task">
            </div>
            <div class="row title">
                <label>Deadline</label>
                <input type="date" spellcheck="false" id="input-new-deadline">
            </div>
            <button type="button" class="btn btn-warning" id="btn-new-task">
                <a>
                    <i class="fa-solid fa-plus"></i> Create
                </a>
            </button>
        </form>
    </div>

    <div class="kanban">
        <div class="kanban_column kanban_column-pending">
            <div class="kanban_column-title">
                <h4>PENDING</h4>
            </div>
            <button class="kanban_add-item" id="btn-add-task" type="button">+ Add</button>
            <div id="taskPending">
                <c:forEach var="item" items="${pendingTasks}">
                    <div id="tr_${item.getId()}" class="task" draggable="true">
                        <div class="sub-task">
                            <div class = "title">${item.getTaskName()}</div>
                            <div class="time"><i class="far fa-calendar-alt"></i>${item.getDeadline()}</div>
                        </div>
                        <div class="div-image" >
                            <img class = "avatar" src="${item.getAvatar()}" alt="">
                            <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                            <ul class="task-menu">
                                <li><i class="fa fa-pencil"></i>Detail</li>
                                <li class="delete"><i class="fa fa-remove"></i>Delete</li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div id="taskProcessing" class="kanban_column kanban_column-processing">
            <div class="kanban_column-title">
                <h4>PROCESSING</h4>
            </div>
            <c:forEach var="item" items="${processingTasks}">
                <div id="tr_${item.getId()}" class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${item.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${item.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${item.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li class="delete"><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>


        <div id="taskReviewing" class="kanban_column kanban_column-reviewing">
            <div class="kanban_column-title">
                <h4>REVIEWING</h4>
            </div>
            <c:forEach var="item" items="${reviewingTasks}">
                <div id="tr_${item.getId()}" class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${item.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${item.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${item.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li class="delete"><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="taskCompleted" class="kanban_column kanban_column-completed">
            <div class="kanban_column-title">
                <h4>COMPLETED</h4>
            </div>
            <c:forEach var="item" items="${completedTasks}">
                <div id="tr_${item.getId()}" class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${item.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${item.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${item.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li class="delete"><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>


</div>


<script src="/assets/script.js"></script>
<script src="/assets/js/axios.min.js"></script>

<script>
    let btnNewTask = document.getElementById("btn-new-task");

    btnNewTask.addEventListener("click", function () {
        let task = {
            taskName: document.getElementById('input-new-task').value,
            deadline: document.getElementById('input-new-deadline').value
        }

        createTask(task);
    })

    function createTask(task) {
        axios({
            method: 'post',
            url: 'http://localhost:8089/api/i-task?action=create',
            data: task
        })
            .then(function (response) {

                let str = `
                    <div id="tr_\${response.data.id}" class="task" draggable="true">
                        <div class="sub-task">
                            <div class = "title">\${response.data.taskName}</div>
                            <div class="time"><i class="far fa-calendar-alt"></i>\${response.data.deadline}</div>
                        </div>
                        <div class="div-image" >
                            <img class = "avatar" src="\${response.data.avatar}" alt="">
                            <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                            <ul class="task-menu">
                                <li><i class="fa fa-pencil"></i>Detail</li>
                                <li class="delete"><i class="fa fa-remove"></i>Delete</li>
                            </ul>
                        </div>
                    </div>
                `;

                let taskPending = document.getElementById('taskPending');
                taskPending.insertAdjacentHTML('afterbegin', str);

                handlerTask();
                handlerColumn();
            });
    }

    function updateTaskStatus(statusId, taskId) {
        axios({
            method: 'get',
            url: 'http://localhost:8089/api/i-task?action=change-status&statusId=' + statusId + '&taskId=' + taskId,
        })
    }

    function deleteTask(taskId) {
        axios({
            method: 'delete',
            url: 'http://localhost:8089/api/i-task?action=delete&taskId=' + taskId,
        })
        .then(function (response) {
            let data = response.data;

            if (data === "success") {
                document.getElementById("tr_" + taskId).remove();
            }
        })
    }

    function getAllTasks() {
        axios({
            method: 'get',
            url: 'http://localhost:8089/api/i-task?action=getAllTasks'
        })
            .then(function (response) {
                let taskArr = [];
                taskArr = response.data;

                taskArr.forEach(item => {
                    let str = `
                        <div id="tr_\${item.id}" class="task" draggable="true">
                            <div class="sub-task">
                                <div class = "title">\${item.taskName}</div>
                                <div class="time"><i class="far fa-calendar-alt"></i>\${item.deadline}</div>
                            </div>
                            <div class="div-image" >
                                <img class = "avatar" src="\${item.avatar}" alt="">
                                <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                                <ul class="task-menu">
                                    <li><i class="fa fa-pencil"></i>Detail</li>
                                    <li class="delete"><i class="fa fa-remove"></i>Delete</li>
                                </ul>
                            </div>
                        </div>
                    `;

                    let taskPending = document.getElementById('taskPending');
                    taskPending.insertAdjacentHTML('afterbegin', str);
                });

                handlerTask();
                handlerColumn();

                handlerDelete();
            });
    }

    function handlerDelete() {
        let btnDelete = document.querySelectorAll(".delete");

        btnDelete.forEach(item => {
            item.addEventListener("click", function (e) {
                let id = e.target.parentElement.parentElement.parentElement.id.replace("tr_", "");
                deleteTask(id);
            })
        })
    }

    window.onload = function() {
        getAllTasks();
    }
</script>

</body>
</html>