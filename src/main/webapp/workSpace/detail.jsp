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
                    <td><input type="text" spellcheck="false"  name="newTaskName"></td>
                </tr>
                <tr>
                    <td><label>Deadline</label></td>
                    <td><input type="date" spellcheck="false"  name="newDeadline"></td>
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
                <div class="col-sm-3" id="task-name-div">
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
                <td id="deadline-td">${task.getDeadline()}</td>
                <td>${task.getCreatorFullName()}</td>
                <td>${task.getStatusName()}</td>
                <td>
                    <div id="performersList">

                        <c:forEach items='${requestScope["performerDTOs"]}' var="item">
                            <div class="div-image" id="performer-img-${item.getId()}" style="display:inline-block;position: relative;" >
                                <img class="avatar" src="${item.getAvatar()}" alt="">
                                <div class="iconAvatar"><i id="btn-remove-performer${item.getId()}" class="fa-solid fa-circle-minus"></i></div>
                            </div>
                        </c:forEach>

                    </div>
                </td>


                <td>
                    <div class="row">
                        <div class="col-sm-2">
                            <button id="edit-task-btn" class="btn btn-outline-primary" type="button">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button id="save-task-btn" class="btn btn-outline-primary" type="button" style="display: none">
                                <i class="fa-solid fa-floppy-disk"></i>
                            </button>
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
<%--    Add performer to task--%>
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
                let performerDTO = response.data;
                let str = `
                        <div class="div-image" id="performer-img-\${performerDTO.id}" style="display:inline-block;position: relative;">
                                <img class = "avatar" src="\${performerDTO.avatar}" alt="">
                                <div class="iconAvatar" ><i class="fa-solid fa-circle-minus"></i></div>
                        </div>
                    `;

                let pId = `#performer-img-\${performerDTO.id} > `;
                let performersList = document.getElementById('performersList');
                performersList.insertAdjacentHTML('afterbegin', str);
                // #performer-img-90 > .iconAvatar
                let btnDeleter = document.querySelector(pId + ".iconAvatar");
                console.log(btnDeleter);

                btnDeleter.addEventListener("click", function (e){
                    let id = e.target.parentElement.parentElement.id.replace("performer-img-", "");
                    console.log(id);
                    removePerformerFromTask(id);

                })


                iziToast.success({
                    title: 'OK',
                    position: 'bottomRight',
                    timeout: 2500,
                    message: 'Successfully added performer!'
                });


            })
            .catch((error) => {
                iziToast.error({
                    title: 'Error',
                    position: 'bottomRight',
                    timeout: 1500,
                    message: error.response.data
                });
            });


    }

    //Delete a performer from a task
    function handleDeleting(){
        let deleteTaskBtn = document.querySelectorAll(".iconAvatar");
        console.log(deleteTaskBtn);
        deleteTaskBtn.forEach(item => {
            item.addEventListener("click", function (e){
                console.log(e);

                console.log(e.target.parentElement.parentElement.id);
                let id = e.target.parentElement.parentElement.id.replace("performer-img-", "");
                console.log(id);
                removePerformerFromTask(id);
            })
        })

    }

     function removePerformerFromTask(id){
         axios({
             method: 'delete',
             url: 'http://localhost:8080//api/performer?action=removePerformerFromTask&id=' + id,
         })
             .then(function (response) {
                 let data = response.data;

                 if (data === "success") {
                     document.getElementById("performer-img-" + id).remove();
                     if (data === "success") {
                         iziToast.info({
                             title: 'OK',
                             position: 'bottomRight',
                             timeout: 2500,
                             message: 'Remove performer out of task successfully'
                         });
                     }
                 }
             })
     }


    //----------edit and save task------------
    let editTaskBtn = document.getElementById("edit-task-btn");
    editTaskBtn.addEventListener("click", function (){
        editDetailTask();
    })

function editDetailTask() {
        console.log("editDetailTask");
    document.getElementById("edit-task-btn").style.display="none";
    document.getElementById("save-task-btn").style.display="block";

    var taskName = document.getElementById("task-name-div");
    var deadline = document.getElementById("deadline-td");

    var taskNameData = taskName.innerText;
    var deadlineData = deadline.innerText;

    taskName.innerHTML="<input type='text' id='name_text' value='"+taskNameData+"'>";
    deadline.innerHTML="<input type='text' id='name_text' value='"+deadlineData+"'>";
}

let saveTaskBtn = document.getElementById("save-task-btn");
saveTaskBtn.addEventListener("click", function (){
    saveTask();
})

function saveTask(){

    let taskId = document.getElementById("task-id").innerText;
    var newTaskName = document.getElementById("task-name-div");
    var newDeadline = document.getElementById("deadline-td");

    var newTaskNameData = newTaskName.firstChild.value;
    var newDeadlineData = newDeadline.firstChild.value;
    let task = {
        taskId: taskId,
        taskName: newTaskNameData,
        deadline: newDeadlineData
    }
    console.log(task);


    axios({
        method: 'post',
        url: 'http://localhost:8080/api/performer?action=editTaskDetails',
        data: task
    })
        .then(function (response) {

            data = response.data;


            newTaskName.innerHTML = `<h3 name="task-name" >\${data.taskName}</h3>`;
            newDeadline.innerText = data.deadline;
            console.log("susscess......")
            console.log(data)

            iziToast.success({
                title: 'OK',
                position: 'bottomRight',
                timeout: 2500,
                message: 'Successfully added performer!'
            });


        })
        .catch((error) => {
            console.log("error edit......")
            iziToast.error({
                title: 'Error',
                position: 'bottomRight',
                timeout: 1500,
                message: error.response.data
            });
        });


}

window.onload = function (){
    handleDeleting();
}





























    // // show update task form
    // var updateForm = document.getElementById("update-task-div");
    //
    // var openUpdateBtn = document.getElementById("open-update-form-btn");
    //
    // var spanClose = document.getElementsByClassName("close-update-btn")[0];
    //
    // openUpdateBtn.onclick = function () {
    //     updateForm.style.display = "block";
    // }
    //
    // spanClose.onclick = function () {
    //     updateForm.style.display = "none";
    // }
    //
    // window.onclick = function (event) {
    //     if (event.target == updateForm) {
    //         updateForm.style.display = "none";
    //     }
    // }


</script>
</body>
</html>