/* drag and drop */

// const tasks = document.querySelectorAll(".task");
// const columns = document.querySelectorAll(".kanban_column");
let draggableTask = null;

const PENDING = 1;
const PROCESSING = 2;
const REVIEWING = 3;
const COMPLETED = 4;

let taskId = 0;

function handlerTask() {
    const tasks = document.querySelectorAll(".task");

    tasks.forEach((task) => {
        task.addEventListener("dragstart", dragStart);
        task.addEventListener("dragend", dragEnd);
    });
}

function dragStart() {
    draggableTask = this;
  setTimeout(() => {
    this.style.display = "none";
  }, 0);
  // console.log("dragStart");
}

function dragEnd(e) {
    draggableTask = null;

    taskId = e.target.id.replace("tr_", "");

    setTimeout(() => {
        this.style.display = "flex";
    }, 0);

    // console.log("dragEnd");
}

function handlerColumn() {
    const columns = document.querySelectorAll(".kanban_column");

    columns.forEach((column) => {
        column.addEventListener("dragover", dragOver);
        column.addEventListener("dragenter", dragEnter);
        column.addEventListener("dragleave", dragLeave);
        column.addEventListener("drop", dragDrop);
    });

    let taskPending = document.getElementById('taskPending');
    taskPending.addEventListener("drop", dropLeavePending);

    let taskProcessing = document.getElementById('taskProcessing');
    taskProcessing.addEventListener("drop", dropLeaveProcessing);

    let taskReviewing = document.getElementById('taskReviewing');
    taskReviewing.addEventListener("drop", dropLeaveReviewing);

    let taskCompleted = document.getElementById('taskCompleted');
    taskCompleted.addEventListener("drop", dropLeaveCompleted);
}

function dropLeavePending() {
    setTimeout(() => {
        console.log("dropLeavePending");
        updateTaskStatus(PENDING, taskId);
    }, 500);
}

function dropLeaveProcessing() {
    setTimeout(() => {
        console.log("dropLeaveProcessing");
        updateTaskStatus(PROCESSING, taskId);
    }, 500);
}

function dropLeaveReviewing() {
    setTimeout(() => {
        console.log("dropLeaveReviewing");
        updateTaskStatus(REVIEWING, taskId);
    }, 500);
}

function dropLeaveCompleted() {
    setTimeout(() => {
        console.log("dropLeaveCompleted");
        updateTaskStatus(COMPLETED, taskId);
    }, 500);
}

function dragOver(e) {
  e.preventDefault();
  //   console.log("dragOver");
}

function dragEnter() {
  this.style.border = "2px dashed #ccc";
  // console.log("dragEnter");
}

function dragLeave() {
  this.style.border = "none";
  // console.log("dragLeave");
}

function dragDrop() {
  this.style.border = "none";
  this.appendChild(draggableTask);
  // console.log("dropped");
}

 /* end  for drag and drop */


 //show task menu
 function showMenu(selectedTask){
      let taskMenu = selectedTask.parentElement.lastElementChild;
      taskMenu.classList.add("show");
      document.addEventListener("click", e => {
          if(e.target != selectedTask){ 
              taskMenu.classList.remove("show");
          }
      })
  }


//---------js pop up create task--------------
// Get the popUp
var popUp = document.getElementById("create-task-div");

// Get the button that opens the popUp
var btn = document.getElementById("btn-add-task");

// Get the <span> element that closes the popUp
var span = document.getElementsByClassName("close-btn")[0];

// When the user clicks the button, open the popUp
btn.onclick = function() {
    popUp.style.display = "block";
}

// When the user clicks on <span> (x), close the popUp
span.onclick = function() {
    popUp.style.display = "none";
}

// When the user clicks anywhere outside of the popUp, close it
window.onclick = function(event) {
    if (event.target == popUp) {
        popUp.style.display = "none";
    }
}

// ---------end js for pop up-------