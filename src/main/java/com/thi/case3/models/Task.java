package com.thi.case3.models;

import java.util.List;

public class Task {
    private long id;
    private String taskName;
    private String createDate;
    private String deadline;
    private int createdBy;
    private int updatedBy;
    List<Performer> performers;
    private String lastUpdate;
    private Status status;
    private String description;
    private String avatar;
    public Task() {
    }

    public Task(long id, String taskName, String createDate, String deadline, int createdBy, int updatedBy, List<Performer> performers, String lastUpdate, Status status, String description) {
        this.id = id;
        this.taskName = taskName;
        this.createDate = createDate;
        this.deadline = deadline;
        this.createdBy = createdBy;
        this.updatedBy = updatedBy;
        this.performers = performers;
        this.lastUpdate = lastUpdate;
        this.status = status;
        this.description = description;
    }

    public Task(long id, String taskName, String createDate, String deadline, int createdBy, int updatedBy, String lastUpdate, Status status, String description, String avatar) {
        this.id = id;
        this.taskName = taskName;
        this.createDate = createDate;
        this.deadline = deadline;
        this.createdBy = createdBy;
        this.updatedBy = updatedBy;
        this.lastUpdate = lastUpdate;
        this.status = status;
        this.description = description;
        this.avatar = avatar;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }

    public List<Performer> getPermissions() {
        return performers;
    }

    public void setPermissions(List<Performer> performers) {
        this.performers = performers;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(String lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
