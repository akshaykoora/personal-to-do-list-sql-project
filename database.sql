--Table to store Project Tasks
--In the case that tasks table needs to be reset
-- Create the database
CREATE DATABASE PersonalToDoList;

-- Use the created database
USE PersonalToDoList;

-- Create a table to store to-do list items
CREATE TABLE TodoList (
    task_id INT AUTO_INCREMENT PRIMARY KEY,  -- Auto-incremented task ID
    task_description VARCHAR(255),           -- Description of the task
    due_date DATE,                           -- Due date of the task
    status VARCHAR(50) DEFAULT 'Pending',    -- Status of the task (Pending, Completed)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when task is created
);
-- Insert sample tasks into the TodoList table
INSERT INTO TodoList (task_description, due_date, status)
VALUES 
    ('Complete homework', '2024-11-20', 'Pending'),
    ('Buy groceries', '2024-11-18', 'Pending'),
    ('Call mom', '2024-11-15', 'Completed'),
    ('Attend meeting', '2024-11-22', 'Pending');
-- Select all tasks from the TodoList
SELECT * FROM TodoList;
-- Select only pending tasks
SELECT * FROM TodoList WHERE status = 'Pending';
-- Update the status of a task (for example, marking 'Complete homework' as completed)
UPDATE TodoList 
SET status = 'Completed' 
WHERE task_id = 1;
-- Delete a specific task by its ID
DELETE FROM TodoList WHERE task_id = 2;
-- Select tasks where the due date is today
SELECT * FROM TodoList WHERE due_date = CURRENT_DATE;
-- Select tasks where the due date is in the past and the status is still 'Pending'
SELECT * FROM TodoList WHERE due_date < CURRENT_DATE AND status = 'Pending';
-- Add a new task function
DELIMITER $$

CREATE PROCEDURE AddTask(IN task_desc VARCHAR(255), IN task_due DATE)
BEGIN
    INSERT INTO TodoList (task_description, due_date)
    VALUES (task_desc, task_due);
END $$

DELIMITER ;

-- Call the procedure to add a task
CALL AddTask('Finish reading book', '2024-11-25');
