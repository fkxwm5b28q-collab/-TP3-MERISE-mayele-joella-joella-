CREATE TABLE salarié (
    numsal INT AUTO_INCREMENT PRIMARY KEY,
    prnomsal VARCHAR(50),
    genre VARCHAR(10),
    DateEmb DATE,
    DateNais DATE,
    nomsal VARCHAR(50)
);
DELIMITER //

CREATE PROCEDURE InsererSalaries()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 100 DO
        INSERT INTO salarié (nomsal, prnomsal, genre, DateEmb, DateNais)
        VALUES (
            CONCAT('Nom', i),
            CONCAT('Prenom', i),
            ELT(FLOOR(1 + RAND() * 2), 'F', 'M'),
            DATE_ADD('2010-01-01', INTERVAL FLOOR(RAND() * 5000) DAY),
            DATE_ADD('1980-01-01', INTERVAL FLOOR(RAND() * 10000) DAY)
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
CALL InsererSalaries();
SELECT * FROM salarié LIMIT 100;