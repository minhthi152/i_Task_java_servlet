package com.thi.case3.models;

public enum Role {
    LEADER("1"),
    MEMBER("2");

    private final String value;

    private Role(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    public static Role parseRole(String value) {
        Role[] values = values();
        for (Role role : values) {
            if (role.value.equals(value))
                return role;
        }
        throw new IllegalArgumentException("invalid");
    }
}
