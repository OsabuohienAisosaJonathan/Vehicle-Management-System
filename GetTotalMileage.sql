CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTotalMileage`(
    IN facultyMemberName VARCHAR(255),
    IN departmentName VARCHAR(255)
)
BEGIN
    SELECT 
        Faculty_members.name AS FacultyMemberName,
        Departments.department_name AS DepartmentName,
        SUM(Trip_completion.odometer_readings_end - Trip_completion.odometer_readings_start) AS TotalMileage
    FROM 
        Faculty_members
    LEFT JOIN 
        Departments ON Faculty_members.department_id = Departments.department_id
    LEFT JOIN 
        Trip_completion ON Faculty_members.faculty_member_id = Trip_completion.faculty_member_id
    WHERE 
        (facultyMemberName IS NULL OR Faculty_members.name = facultyMemberName)
        AND (departmentName IS NULL OR Departments.department_name = departmentName)
        AND YEAR(Trip_completion.odometer_readings_end) = YEAR(CURRENT_DATE)
    GROUP BY 
        Faculty_members.name, Departments.department_name;
END