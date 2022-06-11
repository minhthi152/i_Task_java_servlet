package com.thi.case3.models;

public class Performer {
    private int id;
    private int userId;
    private long taskId;
    private String fullName;
    private PermissionType permissionId;


    public Performer() {
    }

    public Performer(int userId, long taskId, PermissionType permissionId) {
        this.userId = userId;
        this.taskId = taskId;
        this.permissionId = permissionId;
    }

    public Performer(int id, int userId, long taskId, String fullName, PermissionType permissionId) {
        this.id = id;
        this.userId = userId;
        this.taskId = taskId;
        this.fullName = fullName;
        this.permissionId = permissionId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public long getTaskId() {
        return taskId;
    }

    public void setTaskId(long taskId) {
        this.taskId = taskId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public PermissionType getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(PermissionType permissionId) {
        this.permissionId = permissionId;
    }

    @Override
    public String toString() {
        return "Performer{" +
                "id=" + id +
                ", userId=" + userId +
                ", taskId=" + taskId +
                ", fullName='" + fullName + '\'' +
                ", permissionId=" + permissionId +
                '}';
    }
}
