CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `unusedreservationsview` AS
    SELECT 
        `r`.`reservation_id` AS `reservation_id`,
        `f`.`name` AS `faculty_member_name`,
        `v`.`make` AS `make`,
        `v`.`model` AS `model`,
        `r`.`reservation_date` AS `reservation_date`,
        `r`.`expected_departure_date` AS `expected_departure_date`
    FROM
        (((`reservations` `r`
        LEFT JOIN `trip_completion` `t` ON (`r`.`faculty_member_id` = `t`.`faculty_member_id`
            AND `r`.`vehicle_id` = `t`.`vehicle_id`))
        JOIN `faculty_members` `f` ON (`r`.`faculty_member_id` = `f`.`faculty_member_id`))
        JOIN `vehicles` `v` ON (`r`.`vehicle_id` = `v`.`vehicle_id`))
    WHERE
        `t`.`trip_completion_id` IS NULL