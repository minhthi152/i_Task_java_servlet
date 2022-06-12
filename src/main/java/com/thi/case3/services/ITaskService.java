package com.thi.case3.services;

import com.thi.case3.dto.TaskDTO;
import com.thi.case3.models.Status;
import com.thi.case3.models.Task;

import java.util.List;

public interface ITaskService {
    List<Task> getTasksByStatus(Status status) ;
    void update();

    Task addTask(Task newTask) ;

    boolean changeStatus(int statusId, int taskId);

    TaskDTO getDetailsByTaskId(long TaskId) ;

    boolean existById(long TaskId) ;

    boolean checkDuplicateId(long id);

    Task update(Long id, String taskName, String deadline);

    boolean remove(int taskId);
    public List<Task> searchByTaskName(String taskName);
}
