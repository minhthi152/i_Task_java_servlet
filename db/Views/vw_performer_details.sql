CREATE VIEW vw_performer_details AS
SELECT
    p.id,
    p.task_id,
    p.user_id,
    p.permission_id,
    u.fullname,
    u.avatar
FROM performers AS p
JOIN users AS u
WHERE u.id  = p.user_id;