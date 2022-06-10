package com.thi.case3.dto;

import com.thi.case3.models.PermissionType;

public class PerformerDTO {
    private int id;
    private int userId;
    private long taskId;
    private PermissionType permissionId;
    private String fullName;
    private String avatar;

    public PerformerDTO() {
    }

    public PerformerDTO(int id, int userId, long taskId, PermissionType permissionId, String fullName, String avatar) {
        this.id = id;
        this.userId = userId;
        this.taskId = taskId;
        this.permissionId = permissionId;
        this.fullName = fullName;
        this.avatar = avatar;
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

    public PermissionType getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(PermissionType permissionId) {
        this.permissionId = permissionId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
