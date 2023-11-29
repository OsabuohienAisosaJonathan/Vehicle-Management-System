CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vehicle_usage_summary` AS
    SELECT 
        MONTH(`tc`.`odometer_readings_end`) AS `month`,
        YEAR(`tc`.`odometer_readings_end`) AS `year`,
        `fm`.`name` AS `faculty_member_name`,
        `d`.`department_name` AS `department_name`,
        SUM(`tc`.`odometer_readings_end` - `tc`.`odometer_readings_start`) AS `total_mileage`
    FROM
        ((`trip_completion` `tc`
        JOIN `faculty_members` `fm` ON (`tc`.`faculty_member_id` = `fm`.`faculty_member_id`))
        JOIN `departments` `d` ON (`fm`.`department_id` = `d`.`department_id`))
    GROUP BY YEAR(`tc`.`odometer_readings_end`) , MONTH(`tc`.`odometer_readings_end`) , `fm`.`faculty_member_id` , `d`.`department_name`