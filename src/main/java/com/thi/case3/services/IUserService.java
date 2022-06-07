package com.thi.case3.services;

import com.thi.case3.models.User;

import java.util.List;

public interface IUserService {
    List<User> getUsers();

    User signIn(String userName, String password);

    void add(User newUser);

    void update(User newUser);

    boolean existById(int id);

    boolean checkDuplicateEmail(String email);

    boolean checkDuplicatePhone(String phone);

    boolean checkDuplicateUserName(String userName);

    User getUserById(int id);
}
