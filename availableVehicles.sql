CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `availablevehicles` AS
    SELECT 
        `vehicles`.`vehicle_id` AS `vehicle_id`,
        `vehicles`.`make` AS `make`,
        `vehicles`.`model` AS `model`,
        `vehicles`.`year` AS `year`,
        `vehicles`.`color` AS `color`,
        `vehicles`.`license_plate_number` AS `license_plate_number`,
        `vehicles`.`current_mileage` AS `current_mileage`,
        `vehicles`.`last_maintenance_date` AS `last_maintenance_date`
    FROM
        `vehicles`
    WHERE
        !( `vehicles`.`vehicle_id` IN (SELECT 
                `reservations`.`vehicle_id`
            FROM
                `reservations`
            WHERE
                `reservations`.`expected_departure_date` >= CURDATE()
                    AND `reservations`.`reservation_date` <= CURDATE()))