package com.thi.case3.controllers;

import com.thi.case3.dto.PerformerDTO;
import com.thi.case3.dto.TaskDTO;
import com.thi.case3.models.Status;
import com.thi.case3.models.Task;
import com.thi.case3.models.User;
import com.thi.case3.services.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "TaskServlet", urlPatterns = "/i-Task")
public class TaskServlet extends HttpServlet {
    ITaskService taskService = new TaskService();
    IUserService userService = new UserService();

    PerformerService performerService = new PerformerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("sessionUser") == null) {
            resp.sendRedirect("/signIn");
        }
        else {
            String action = req.getParameter("action");

            if (action == null) {
                action = "";
            }
            switch (action){
                case "logOut":
                    showSignInPage(req,resp);
                    break;
                case "user-info":
                    showUserInfoPage(req,resp);
                    break;
                case "detail":
                    showDetailPage(req,resp);
                    break;
                default:
                    showAll(req, resp);
                    break;
            }
        }
    }



    private void showSignInPage(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession(false);
            session.removeAttribute("sessionUser");

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

    private void showUserInfoPage(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/workSpace/userInfo.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showDetailPage(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/workSpace/detail.jsp");
        long taskId = Long.parseLong(req.getParameter("id"));
        TaskDTO taskDTO = taskService.getDetailsByTaskId(taskId);
        req.setAttribute("task", taskDTO);
        List<User> users = userService.getUsers();
        req.setAttribute("users", users);
        List<PerformerDTO> performerDTOs = performerService.getAllPerformersOfTask(taskId);
        req.setAttribute("performerDTOs", performerDTOs);


        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

}
