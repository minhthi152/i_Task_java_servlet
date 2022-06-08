CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_task`(
    IN taskName VARCHAR(50),
    IN deadline VARCHAR(10),
    IN creatorId INT,
    IN statusId INT,
    IN description_ VARCHAR(255)
)
BEGIN
    DECLARE last_id_in_tasks INT DEFAULT 0;

    INSERT INTO tasks (
        task_name,
        create_date,
        deadline,
        creator_id,
        last_update,
        status_id,
        description_
    )
    VALUES (
        taskName,
        NOW(),
        deadline,
        creatorId,
        NOW(),
        statusId,
        description_
    );

    SET last_id_in_tasks = LAST_INSERT_ID();

    SELECT
        t.id,
        t.task_name,
        t.create_date,
        t.deadline,
        t.creator_id,
        t.last_update,
        t.updated_by,
        t.status_id,
        t.description_,
        u.avatar
    FROM tasks AS t
    JOIN users AS u
        ON t.creator_id = u.id
    WHERE t.id = last_id_in_tasks;
END