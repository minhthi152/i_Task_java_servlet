package com.thi.case3.controllers.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.thi.case3.models.Performer;
import com.thi.case3.models.PermissionType;
import com.thi.case3.models.Task;
import com.thi.case3.services.PerformerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="PerformerApiServlet", urlPatterns = "/api/performer")
public class PerformerApiServlet extends HttpServlet {
    PerformerService performerService = new PerformerService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action){
            case "addPerformerToTask":
                addPerformerToTask(req,resp);
                break;
        }
    }

    private void addPerformerToTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           String json = null;
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            JsonObject data = new Gson().fromJson(req.getReader(), JsonObject.class);
            int taskId = data.get("taskId").getAsInt();
            int userId = data.get("userId").getAsInt();
            int permissionId = data.get("permissionId").getAsInt();

            Performer performer= new Performer(taskId, userId, PermissionType.parsePermissionType(permissionId));
             Performer createdPerformer = performerService.addPerformerToTask(performer);

        if (createdPerformer != null) {
            json = new Gson().toJson(createdPerformer);
        }
        else {
            json = new Gson().toJson("error");
        }

        resp.getWriter().write(json);
        }


}
