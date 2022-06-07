<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

            <c:forEach var = "pendingTask" items="${pendingTasks}">
                <div class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${pendingTask.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${pendingTask.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${pendingTask.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>

        </div>

        <div class="kanban_column kanban_column-processing">
            <div class="kanban_column-title">
                <h4>PROCESSING</h4>
            </div>
            <c:forEach var="processingTask" items="${processingTasks}">
                <div class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${processingTask.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${processingTask.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${processingTask.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>


        </div>


        <div class="kanban_column kanban_column-reviewing">
            <div class="kanban_column-title">
                <h4>REVIEWING</h4>
            </div>
            <c:forEach var="reviewingTask" items="${reviewingTasks}">
                <div class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${reviewingTask.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${reviewingTask.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${reviewingTask.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>

        </div>

        <div class="kanban_column kanban_column-completed">
            <div class="kanban_column-title">
                <h4>COMPLETED</h4>
            </div>
            <c:forEach var="completedTask" items="${completedTasks}">
                <div class="task" draggable="true">
                    <div class="sub-task">
                        <div class = "title">${completedTask.getTaskName()}</div>
                        <div class="time"><i class="far fa-calendar-alt"></i>${completedTask.getDeadline()}</div>
                    </div>
                    <div class="div-image" >
                        <img class = "avatar" src="${completedTask.getAvatar()}" alt="">
                        <i class="fa-solid fa-gear" onclick="showMenu(this)"></i>
                        <ul class="task-menu">
                            <li><i class="fa fa-pencil"></i>Detail</li>
                            <li><i class="fa fa-remove"></i>Delete</li>
                        </ul>
                    </div>
                </div>
            </c:forEach>

        </div>

    </div>


</div>


<script src="/assets/script.js"></script>
</body>
</html>