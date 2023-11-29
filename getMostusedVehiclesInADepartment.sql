CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMostUsedVehicleInMyDepartment`(IN departmentName VARCHAR(255))
BEGIN
    DECLARE myDepartmentId INT;

    -- Get the department ID for the provided department name
    SELECT department_id INTO myDepartmentId FROM Departments WHERE department_name = departmentName;

    IF myDepartmentId IS NOT NULL THEN
        -- Temporary table to store the count of vehicle usage for each department
        CREATE TEMPORARY TABLE TempVehicleUsage AS
            SELECT
                Departments.department_id,
                Vehicles.vehicle_id,
                COUNT(DISTINCT Reservations.reservation_id) AS num_reservations
            FROM
                Departments
                JOIN Faculty_members ON Departments.department_id = Faculty_members.department_id
                JOIN Reservations ON Faculty_members.faculty_member_id = Reservations.faculty_member_id
                JOIN Vehicles ON Reservations.vehicle_id = Vehicles.vehicle_id
            GROUP BY
                Departments.department_id, Vehicles.vehicle_id;

        -- Get the most used vehicle in my department
        SELECT
            TempVehicleUsage.vehicle_id,
            Vehicles.make,
            Vehicles.model,
            Vehicles.year,
            Vehicles.color,
            Vehicles.license_plate_number,
            MAX(TempVehicleUsage.num_reservations) AS num_reservations
        FROM
            TempVehicleUsage
            JOIN Vehicles ON TempVehicleUsage.vehicle_id = Vehicles.vehicle_id
        WHERE
            TempVehicleUsage.department_id = myDepartmentId
        GROUP BY
            TempVehicleUsage.vehicle_id
        ORDER BY
            num_reservations DESC
        LIMIT 1;

        -- Drop the temporary table
        DROP TEMPORARY TABLE IF EXISTS TempVehicleUsage;

    ELSE
        -- Handle the case when the department does not exist
        SELECT 'Department not found.' AS result;

    END IF;
END