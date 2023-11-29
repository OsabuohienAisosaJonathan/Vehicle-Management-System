***# Vehicle-Management-System***
This is a vehicle management system that manages the affairs of vehicles in an organization.

***Design of the Database:***
To design the database, we followed the steps below:
1. Identified the entities and their attributes.
2. Determined the relationships between the entities.
3. Normalized the database to at least 2NF.
4. Created tables, views, stored procedures, triggers, etc., when necessary.
5. Added integrity constraints to ensure the data's overall validity, integrity, and consistency in the database table.

***Entities and their Attributes:***
- Faculty members: Faculty member ID, name, department, email, phone number.
- Vehicles: vehicle ID, make, model, year, color, license plate number, current mileage, last maintenance date.
- Departments: department ID, department name.
- Reservations: reservation ID, faculty member ID, vehicle ID, reservation date, expected departure date, destination, authorized faculty member's name.
- Trip completion: trip completion ID, faculty member ID, vehicle ID, odometer readings at the start and end of the trip, maintenance complaints (if any), liters of fuel purchased (if any), NCU credit card number used to pay for the fuel, credit card receipt.
- Maintenance log: maintenance log ID, vehicle ID, brief description of the type of maintenance required, initial log entry date, date the vehicle is back into service.
- Maintenance detail: maintenance detail ID, maintenance log ID, maintenance item performed, parts used, identification of the mechanic who performed the maintenance item.
- Parts inventory: part ID, part name, part quantity, minimum quantity on hand.
- Parts usage: parts usage ID, maintenance log ID, part ID, quantity used.
- Mechanics: Mechanic ID, Mechanic name


***Relationships between the Entities:***
- A faculty member can reserve a vehicle.
- A vehicle can be reserved by multiple faculty members.
- A department can have multiple faculty members.
- A faculty member can belong to only one department.
- A vehicle can have multiple trip completion forms.
- A trip completion form is associated with only one faculty member and one vehicle.
- A vehicle can have multiple maintenance log entries.
- A maintenance log entry is associated with only one vehicle.
- A maintenance log entry can have multiple maintenance detail entries.
- A maintenance detail entry is associated with only one maintenance log entry.
- A part can be used in multiple maintenance detail entries.
- A maintenance detail entry can use only one part.

***Normalization of the Database:***
The database has been normalized to at least 2NF. The following tables have been created:
- Faculty members: faculty member ID (primary key), name, department, email, phone number.
- Vehicles: vehicle ID (primary key), make, model, year, color, license plate number, current mileage, last maintenance date.
- Departments: department ID (primary key), department name.
- Reservations: reservation ID (primary key), faculty member ID (foreign key), vehicle ID (foreign key), reservation date, expected departure date, destination, authorized faculty member's name.
- Trip completion: trip completion ID (primary key), faculty member ID (foreign key), vehicle ID (foreign key), odometer readings at the start and end of the trip, maintenance complaints (if any), liters of fuel purchased (if any), NCU credit card number used to pay for the fuel, credit card receipt.
- Maintenance log: maintenance log ID (primary key), vehicle ID (foreign key), brief description of the type of maintenance required, initial log entry date, date the vehicle is back into service.
- Maintenance detail: maintenance detail ID (primary key), maintenance log ID (foreign key), maintenance item performed, parts used, identification of the mechanic who performed the maintenance item.
- Parts inventory: part ID (primary key), part name, part quantity, minimum quantity on hand.
- Parts usage: parts usage ID (primary key), maintenance log ID (foreign key), part ID (foreign key), quantity used.

***Integrity Constraints:***
Integrity constraints have been added to ensure the data's overall validity, integrity, and consistency in the database table. The following constraints have been added:
- Primary key constraints on each table.
- Foreign key constraints on the Reservations, Trip completion, Maintenance log, and Parts usage tables.
- Check constraints on the Reservations table to ensure that the expected departure date is after the reservation date.
- Check constraints on the Trip completion table to ensure that the odometer readings at the end of the trip are greater than the odometer readings at the start of the trip.
- Check constraints on the Maintenance log table to ensure that the initial log entry date is before the date the vehicle is back into service.

