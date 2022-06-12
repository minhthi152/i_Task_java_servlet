package com.thi.case3.controllers.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.thi.case3.dto.PerformerDTO;
import com.thi.case3.models.Performer;
import com.thi.case3.models.PermissionType;
import com.thi.case3.models.Task;
import com.thi.case3.models.User;
import com.thi.case3.services.ITaskService;
import com.thi.case3.services.PerformerService;
import com.thi.case3.services.TaskService;
import com.thi.case3.services.UserService;
import com.thi.case3.utils.ValidateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "PerformerApiServlet", urlPatterns = "/api/performer")
public class PerformerApiServlet extends HttpServlet {
    PerformerService performerService = new PerformerService();
    ITaskService taskService = new TaskService();

    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addPerformerToTask":
                addPerformerToTask(req, resp);
                break;
            case "editTaskDetails":
                editTaskDetails(req, resp);
                break;
        }
    }

    private void editTaskDetails(HttpServletRequest req, HttpServletResponse resp) {

        String json = null;
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        JsonObject data = null;
        try {
            data = new Gson().fromJson(req.getReader(), JsonObject.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        Long taskId = data.get("taskId").getAsLong();
        String newTaskName = data.get("taskName").getAsString();
        String newDeadline  = data.get("deadline").getAsString();


        Task updatedTask =  taskService.update(taskId,newTaskName,newDeadline);

        json = new Gson().toJson(updatedTask);
        try {
            resp.getWriter().write(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "removePerformerFromTask":
                removePerformerFromTask(req, resp);
                break;
        }
    }

    private void removePerformerFromTask(HttpServletRequest req, HttpServletResponse resp) {
            String json = null;
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            String stPerformerId = req.getParameter("id");

            if (!ValidateUtils.isNumberValid(stPerformerId)) {
                json = new Gson().toJson("Invalid ID");
            }
            else {
                int performerId = Integer.parseInt(stPerformerId);
                boolean deleted =  performerService.remove(performerId);

                if (deleted) {
                    json = new Gson().toJson("success");
                }
                else {
                    json = new Gson().toJson("error");
                }
            }

        try {
            resp.getWriter().write(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    private void addPerformerToTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        JsonObject data = new Gson().fromJson(req.getReader(), JsonObject.class);
        int taskId = data.get("taskId").getAsInt();
        int userId = data.get("userId").getAsInt();
        int permissionId = data.get("permissionId").getAsInt();

        Performer performer = new Performer(userId, taskId, PermissionType.parsePermissionType(permissionId));


        req.setAttribute("performer", performer);
        try {
            performerService.addPerformerToTask(performer);
            User user = userService.getUserById(userId);

            PerformerDTO performerDTO = new PerformerDTO(performer, user);
            int performerId = performerService.getPerformerIdByUserIdAndTaskId(user.getId(), (int) performer.getTaskId());
            performerDTO.setId(performerId);
            req.setAttribute("performerId", performerId);
            String json = new Gson().toJson(performerDTO);



            resp.getWriter().write(json);

        } catch (IllegalArgumentException ex) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write(ex.getMessage());
        }

    }


}
