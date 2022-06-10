CREATE DATABASE i_Taskkkk;
USE i_Taskkkk;

CREATE TABLE roles (
    id ENUM('1','2') NOT NULL,
    role_name VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
CREATE TABLE task_status(
    id INT PRIMARY KEY,
    status_ ENUM('PENDING', 'PROCESSING', 'REVIEWING', 'COMPLETED') UNIQUE
);
CREATE TABLE permissions (
    id enum('1','2','3') NOT NULL,
    permission_type varchar(20) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    fullName varchar(30) DEFAULT NULL,
    email varchar(30) DEFAULT NULL UNIQUE,
    phone char(10) DEFAULT NULL UNIQUE,
    username varchar(20) DEFAULT NULL UNIQUE,
    password_ varchar(16) DEFAULT NULL,
    role_id enum('1','2') DEFAULT NULL,
    avatar varchar(1000) DEFAULT '/assets/image/anonymous.png',
    PRIMARY KEY (id),
    KEY role_id (role_id),
    CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE tasks (
    id int NOT NULL AUTO_INCREMENT,
    task_name varchar(40) NOT NULL,
    create_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deadline date NOT NULL,
    creator_id int DEFAULT NULL,
    last_update datetime DEFAULT NULL,
    updated_by int DEFAULT NULL,
    status_id int DEFAULT '1',
    description_ varchar(200) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY status_id (status_id),
    KEY creator_id (creator_id),
    CONSTRAINT tasks_ibfk_2 FOREIGN KEY (creator_id) REFERENCES users (id)
);
CREATE TABLE performers (
    id int NOT NULL AUTO_INCREMENT,
    task_id int NOT NULL,
    user_id int NOT NULL,
    permission_id enum('1','2','3') DEFAULT NULL,
    PRIMARY KEY (id),
    KEY performers_ibfk_3_idx (permission_id),
    KEY performers_ibfk_1 (task_id),
    KEY performers_ibfk_2 (user_id),
    CONSTRAINT performers_ibfk_1 FOREIGN KEY (task_id) REFERENCES tasks (id),
    CONSTRAINT performers_ibfk_2 FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT performers_ibfk_3 FOREIGN KEY (permission_id) REFERENCES permissions (id)
);


