package com.thi.case3.controllers;

import com.google.gson.JsonObject;
import com.thi.case3.models.Status;
import com.thi.case3.models.Task;
import com.thi.case3.services.ITaskService;
import com.thi.case3.services.TaskService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "TaskServlet", urlPatterns = "/i-Task")
public class TaskServlet extends HttpServlet {
    ITaskService taskService = new TaskService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "logOut":
                showSignInPage(req,resp);
                break;
            case "delete":
                deleteTask(req,resp);
                break;
            default:
                showAll(req, resp);
                break;
        }
    }

    private void showSignInPage(HttpServletRequest req, HttpServletResponse resp) {
        try {
            resp.sendRedirect("/signIn");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/workSpace/main.jsp");

//        List<Task> pendingTasks = taskService.getTasksByStatus(Status.PENDING);
//        System.out.println(pendingTasks);
//        req.setAttribute("pendingTasks", pendingTasks);

        List<Task> processingTasks = taskService.getTasksByStatus(Status.PROCESSING);
        req.setAttribute("processingTasks", processingTasks);

        List<Task> reviewingTasks = taskService.getTasksByStatus(Status.REVIEWING);
        req.setAttribute("reviewingTasks", reviewingTasks);

        List<Task> completedTasks = taskService.getTasksByStatus(Status.COMPLETED);
        req.setAttribute("completedTasks", completedTasks);

        dispatcher.forward(req, resp);

    }

    private void deleteTask(HttpServletRequest req, HttpServletResponse resp) {

    }
}
