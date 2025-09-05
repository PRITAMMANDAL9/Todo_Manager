INSERT INTO todos 
    (ID, TITLE, DESCRIPTION, COMPLETED, CREATED_DATE, DUE_DATE, PRIORITY, USER_ID)
VALUES
    (1, 'Finish project', 'Complete Hibernate + Spring integration', false, NOW(), DATEADD(DAY, 7, NOW()), 'HIGH', 101);
