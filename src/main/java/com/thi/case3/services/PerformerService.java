package com.thi.case3.services;

import com.thi.case3.dto.PerformerDTO;
import com.thi.case3.models.*;
import com.thi.case3.utils.MySQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.thi.case3.utils.MySQLConnection.getConnection;
import static com.thi.case3.utils.MySQLConnection.printSQLException;

public class PerformerService {

    private static final String VW_PERFORMER_DETAILS = "SELECT * FROM i_task.vw_performer_details WHERE task_id = ?;";

    private static final String SP_ADD_PERFOMER_TO_TASK = "CALL i_task.sp_add_performer_to_task(?, ?, ?, ?);";


    private static final String DELETE_PERFORMER_BY_ID = "DELETE FROM performers WHERE id = ?;";

    private static final String GET_PERFORMER_ID_BY_USER_ID_AND_TASK_ID = ""+
            "SELECT id FROM performers " +
            "WHERE user_id = ? AND task_id = ?;";

    public String addPerformerToTask(Performer newPerformer) {
        String message;
        System.out.println(newPerformer);
        try (
                Connection connection = MySQLConnection.getConnection();
                CallableStatement callableStatement = connection.prepareCall(SP_ADD_PERFOMER_TO_TASK)
        ) {

            callableStatement.setLong(1, newPerformer.getTaskId());
            callableStatement.setInt(2, newPerformer.getUserId());
            callableStatement.setInt(3, newPerformer.getPermissionId().getValue());
            callableStatement.registerOutParameter(4, Types.VARCHAR);
            callableStatement.executeQuery();
            System.out.println(callableStatement);
            message = callableStatement.getString(4);

            if (message != null && !message.contains("Successfully"))
                throw new IllegalArgumentException(message);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return message;
    }

    public List<PerformerDTO> getAllPerformersOfTask(long taskId) {
        List<PerformerDTO> performerDTOs = new ArrayList<>();

        try {
            Connection connection = MySQLConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(VW_PERFORMER_DETAILS);
            preparedStatement.setLong(1, taskId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                int permissionId = rs.getInt("permission_id");
                String fullName = rs.getString("fullname");
                String avatar = rs.getString("avatar");


                performerDTOs.add(new PerformerDTO(id, (int) taskId, userId, PermissionType.parsePermissionType(permissionId), fullName, avatar));
            }

        } catch (SQLException e) {
            MySQLConnection.printSQLException(e);
        }

        return performerDTOs;
    }

    public boolean remove(int performerId) {
        boolean isDeleted = false;

        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PERFORMER_BY_ID);
            preparedStatement.setInt(1, performerId);
            preparedStatement.execute();

            isDeleted = true;
        } catch (SQLException e){
            printSQLException(e);
        }

        return isDeleted;
    }

    public int getPerformerIdByUserIdAndTaskId(int userId, int taskId){
        int id =-1;
        try {
            Connection connection = MySQLConnection.getConnection();


            // "SELECT id FROM performers WHERE user_id = ? AND task_id = ?;";
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PERFORMER_ID_BY_USER_ID_AND_TASK_ID);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, taskId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                 id = rs.getInt("id");

            }

        } catch (SQLException e) {
            MySQLConnection.printSQLException(e);
            return id;
        }
        return id;
    }

}
