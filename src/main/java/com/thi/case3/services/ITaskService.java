package com.thi.case3.services;

import com.thi.case3.models.Status;
import com.thi.case3.models.Task;

import java.util.List;

public interface ITaskService {
    List<Task> getTasksByStatus(Status status) ;
    void update();

    Task addTask(Task newTask) ;

    void changeStatus(int taskId, int statusId);

    Task getByTaskId(long TaskId) ;

    boolean existById(long TaskId) ;
    boolean checkDuplicateId(long id);

    void update(Task task);

    void remove(Task task);
}
