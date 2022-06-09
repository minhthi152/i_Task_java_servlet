package com.thi.case3.services;

import com.thi.case3.models.Role;
import com.thi.case3.models.User;

import java.math.BigDecimal;
import java.sql.*;
import java.util.List;

import static com.thi.case3.utils.MySQLConnection.getConnection;
import static com.thi.case3.utils.MySQLConnection.printSQLException;

public class UserService implements IUserService{

    private static final String GET_USER_BY_ID = "" +
            "SELECT " +
            "u.id, " +
            "u.fullname, " +
            "u.email, " +
            "u.phone, " +
            "u.username, " +
            "u.password_, " +
            "u.role_id, " +
            "u.avatar " +
            "FROM users AS u " +
            "WHERE u.username = ? " +
            "AND u.password_ = ?;";


    @Override
    public List<User> getUsers() {
        return null;
    }

    @Override
    public User signIn(String userName, String password) {
        User onlineUser = null;
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_ID);

            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);

            System.out.println(this.getClass() + " query: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int role_id = rs.getInt("role_id");
                String avatar = rs.getString("avatar");


                onlineUser= new User(id, fullName, email,phone,userName, password, role_id, avatar);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return onlineUser;
    }

    @Override
    public void add(User newUser) {

    }

    @Override
    public void update(User newUser) {

    }

    @Override
    public boolean existById(int id) {
        return false;
    }

    @Override
    public boolean checkDuplicateEmail(String email) {
        return false;
    }

    @Override
    public boolean checkDuplicatePhone(String phone) {
        return false;
    }

    @Override
    public boolean checkDuplicateUserName(String userName) {
        return false;
    }

    @Override
    public User getUserById(int id) {
        return null;
    }


    public User getCreatorByTaskId(long taskId){


        return null;
    }
}
