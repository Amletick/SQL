USE test_db;
DROP FUNCTION IF EXISTS format_seconds;
DROP PROCEDURE IF EXISTS print_even_numbers;
-- Создание функции
DELIMITER //

CREATE FUNCTION format_seconds(seconds INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(255);

    SET days = FLOOR(seconds / 86400);
    SET hours = FLOOR((seconds % 86400) / 3600);
    SET minutes = FLOOR((seconds % 3600) / 60);
    SET secs = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    RETURN result;
END //

DELIMITER ;

-- Тестирование функции
SELECT format_seconds(123456);

-- Создание процедуры
DELIMITER //

CREATE PROCEDURE print_even_numbers(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= n DO
        IF i % 2 = 0 THEN
            SELECT i;
        END IF;
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

-- Тестирование процедуры
CALL print_even_numbers(10);
