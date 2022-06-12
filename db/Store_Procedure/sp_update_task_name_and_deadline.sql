DELIMITER //
CREATE PROCEDURE sp_update_task_name_and_deadline(
    IN task_id INT,
    IN new_task_name VARCHAR(40),
    In new_deadline DATE,
    OUT message varchar(200)
)
BEGIN
	IF (SELECT COUNT(*) FROM tasks WHERE tasks.task_id = task_id)
	THEN
        UPDATE i_task.tasks
        SET
            task_name = new_task_name,
            deadline =  new_deadline,
            last_update = NOW()
        WHERE tasks.id = task_id;

        SET message = "Update task successfully";
    ELSE
		SET message = "ID does not exist";
    END IF;

END;
//
DELIMITER ;