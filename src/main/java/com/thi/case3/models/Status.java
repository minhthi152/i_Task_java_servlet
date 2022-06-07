package com.thi.case3.models;

public enum Status {
    PENDING(1),
    PROCESSING(2),
    REVIEWING(3),
    COMPLETED(4);



    private final int value;

    Status(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }

    public static Status parseStatus(int value) {
        Status[] values = values();
        for (Status status : values) {
            if (status.value==value)
                return status;
        }
        throw new IllegalArgumentException("invalid");
    }
}
