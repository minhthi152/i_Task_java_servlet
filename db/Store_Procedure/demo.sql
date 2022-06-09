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
WHERE t.id = 1100;

