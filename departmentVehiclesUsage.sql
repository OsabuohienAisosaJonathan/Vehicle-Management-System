CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `departmentvehicleusage` AS
    SELECT 
        `d`.`department_name` AS `department_name`,
        COUNT(DISTINCT `r`.`vehicle_id`) AS `num_vehicles_used`,
        `fm`.`name` AS `most_recurrent_faculty_member`
    FROM
        ((`departments` `d`
        LEFT JOIN `faculty_members` `fm` ON (`d`.`department_id` = `fm`.`department_id`))
        LEFT JOIN `reservations` `r` ON (`fm`.`faculty_member_id` = `r`.`faculty_member_id`))
    GROUP BY `d`.`department_name`
    ORDER BY COUNT(DISTINCT `r`.`vehicle_id`) DESC