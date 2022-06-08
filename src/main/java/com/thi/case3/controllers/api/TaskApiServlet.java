package com.thi.case3.controllers.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.thi.case3.models.Status;
import com.thi.case3.models.Task;
import com.thi.case3.services.ITaskService;
import com.thi.case3.services.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.thi.case3.utils.ValidateUtils;

@WebServlet(name = "TaskApiServlet", urlPatterns = "/api/i-task")
public class TaskApiServlet extends HttpServlet {

    ITaskService taskService = new TaskService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "getAllTasks":
                getAllTasks(req,resp);
                break;
            case "change-status":
                changeStatus(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createTask(req,resp);
                break;
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "delete":
                deleteTask(req,resp);
                break;
        }
    }

    private void getAllTasks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = null;
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        List<Task> pendingTasks = taskService.getTasksByStatus(Status.PENDING);
        json = new Gson().toJson(pendingTasks);

        resp.getWriter().write(json);
    }

    private void createTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = null;
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        JsonObject data = new Gson().fromJson(req.getReader(), JsonObject.class);
        String taskName = data.get("taskName").getAsString();
        String deadline = data.get("deadline").getAsString();
        int createdBy = 1;
        Status status = Status.PENDING;
        String description = "desc ...";

        Task task = new Task(taskName, deadline, createdBy, status, description);

        Task createdTask = taskService.addTask(task);

        json = new Gson().toJson(createdTask);

        resp.getWriter().write(json);
    }

    private void changeStatus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int statusId = Integer.parseInt(req.getParameter("statusId"));

        taskService.changeStatus(statusId, taskId);
    }

    private void deleteTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = null;
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        String strId = req.getParameter("taskId");

        if (!ValidateUtils.isNumberValid(strId)) {
            json = new Gson().toJson("Invalid ID");
        }
        else {
            int taskId = Integer.parseInt(strId);
            boolean deleted =  taskService.remove(taskId);

            if (deleted) {
                json = new Gson().toJson("success");
            }
            else {
                json = new Gson().toJson("error");
            }
        }

        resp.getWriter().write(json);
    }

}
