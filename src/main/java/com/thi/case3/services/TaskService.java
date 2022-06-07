package com.thi.case3.services;

import com.thi.case3.models.Performer;
import com.thi.case3.models.Status;
import com.thi.case3.models.Task;
import com.thi.case3.models.User;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.thi.case3.utils.MySQLConnection.getConnection;
import static com.thi.case3.utils.MySQLConnection.printSQLException;

public class TaskService implements ITaskService{
    private final String GET_TASKS_BY_STATUS = ""+
            "SELECT " +
            "t.id, " +
            "t.task_name, " +
            "t.create_date, " +
            "t.deadline, " +
            "t.creator_id, " +
            "t.last_update, " +
            "t.updated_by, " +
            "t.status_id, " +
            "t.description_, " +
            "u.avatar " +
            "FROM tasks AS t " +
            "JOIN users AS u " +
            "ON t.creator_id = u.id " +
            "WHERE t.status_id = ?;";
    @Override
    public List<Task> getTasksByStatus(Status status) {
        List<Task> tasks = new ArrayList<>();

        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_TASKS_BY_STATUS);
            preparedStatement.setInt(1,status.getValue());
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String taskName = rs.getString("task_name");
                String createDate = rs.getString("create_date");
                String deadline = rs.getString("deadline");
                int creatorId = rs.getInt("creator_id");
                String lastUpdate = rs.getString("last_update");
                int updatedBy = rs.getInt("updated_by");
                String statusId = rs.getString("status_id");
                String description = rs.getString("description_");
                String avatar = rs.getString("avatar");


                tasks.add(new Task(id,taskName,createDate,deadline, creatorId,updatedBy,lastUpdate,status,description, avatar));
            }

        } catch (SQLException e){
            printSQLException(e);
        }
        return tasks;
    }

    @Override
    public void update() {

    }

    @Override
    public void addTask(Task newTask) {

    }

    @Override
    public Task getByTaskId(long TaskId) {
        return null;
    }

    @Override
    public boolean existById(long TaskId) {
        return false;
    }

    @Override
    public boolean checkDuplicateId(long id) {
        return false;
    }

    @Override
    public void update(Task task) {

    }

    @Override
    public void remove(Task task) {

    }
}
