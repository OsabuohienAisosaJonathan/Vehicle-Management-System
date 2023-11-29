CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBillDetails`(IN bill_id INT)
BEGIN
    SELECT
        Reservations.reservation_id,
        Reservations.faculty_member_id,
        Faculty_members.name AS faculty_member_name,
        Reservations.vehicle_id,
        Vehicles.make,
        Vehicles.model,
        Reservations.reservation_date,
        Reservations.expected_departure_date,
        Reservations.destination,
        Reservations.authorized_faculty_member_name
    FROM
        Reservations
    INNER JOIN Faculty_members ON Reservations.faculty_member_id = Faculty_members.faculty_member_id
    INNER JOIN Vehicles ON Reservations.vehicle_id = Vehicles.vehicle_id
    WHERE
        Reservations.reservation_id = bill_id;
END