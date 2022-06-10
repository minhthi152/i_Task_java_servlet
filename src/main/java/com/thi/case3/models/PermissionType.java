package com.thi.case3.models;

public enum PermissionType {
    READ_ONLY (1),
    UPDATE (2),
    UPDATE_DELETE (3);
    private final int value;

    PermissionType(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }

    public static PermissionType parsePermissionType(int value) {
        for (PermissionType permissionType : values()) {
            if (permissionType.ordinal() == value)
                return permissionType;
        }
        throw new IllegalArgumentException(value + "permission type  invalid");
    }
}
