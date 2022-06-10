CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_performer_to_task`(
	IN task_id INT,
	IN user_id INT,
	IN permission_id INT,
	OUT message VARCHAR(200)
)
BEGIN
	IF(SELECT COUNT(*) FROM tasks WHERE tasks.id = task_id)
	THEN
		IF (SELECT COUNT(*) FROM users WHERE users.id = user_id)
        THEN
			IF ((SELECT COUNT(*) FROM performers WHERE performers.user_id = user_id AND performers.task_id = task_id) = 0)
			THEN
				IF (SELECT COUNT(*) FROM permissions WHERE permissions.id = permission_id)
				THEN
                   INSERT INTO i_task.performers(task_id, user_id, permission_id)
                   VALUES (task_id, user_id, permission_id);

                    SET message = "Successfully added performer to the task";

                ELSE
					SET message = "Invalid permission ID";
                END IF;
            ELSE
				SET message = "This user ID has been already in this task";
            END IF;
        ELSE
        SET message = "Invalid user ID";
        END IF;
    ELSE
	SET message = "Invalid task ID";
END IF;
END