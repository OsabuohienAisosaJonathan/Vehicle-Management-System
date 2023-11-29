-- Creating Tables

-- Faculty Members Table
CREATE TABLE Faculty_members (
    faculty_member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department_id INT,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Vehicles Table
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    year INT,
    color VARCHAR(50),
    license_plate_number VARCHAR(20),
    current_mileage INT,
    last_maintenance_date DATE
);

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- Reservations Table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    faculty_member_id INT,
    vehicle_id INT,
    reservation_date DATE,
    expected_departure_date DATE,
    destination VARCHAR(255),
    authorized_faculty_member_name VARCHAR(255),
    FOREIGN KEY (faculty_member_id) REFERENCES Faculty_members(faculty_member_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    CHECK (expected_departure_date > reservation_date)
);

-- Trip Completion Table
CREATE TABLE Trip_completion (
    trip_completion_id INT PRIMARY KEY,
    faculty_member_id INT,
    vehicle_id INT,
    odometer_readings_start INT,
    odometer_readings_end INT,
    maintenance_complaints VARCHAR(255),
    liters_of_fuel_purchased INT,
    ncu_credit_card_number VARCHAR(20),
    credit_card_receipt VARCHAR(255),
    FOREIGN KEY (faculty_member_id) REFERENCES Faculty_members(faculty_member_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    CHECK (odometer_readings_end > odometer_readings_start)
);

-- Maintenance Log Table
CREATE TABLE Maintenance_log (
    maintenance_log_id INT PRIMARY KEY,
    vehicle_id INT,
    maintenance_description VARCHAR(255),
    initial_log_entry_date DATE,
    vehicle_back_into_service_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    CHECK (initial_log_entry_date < vehicle_back_into_service_date)
);

-- Mechanics Table (Add this table)
CREATE TABLE Mechanics (
    mechanic_id INT PRIMARY KEY,
    mechanic_name VARCHAR(255)
);

-- Maintenance Detail Table
CREATE TABLE Maintenance_detail (
    maintenance_detail_id INT PRIMARY KEY,
    maintenance_log_id INT,
    maintenance_item_performed VARCHAR(255),
    parts_used VARCHAR(255),
    mechanic_id INT,
    FOREIGN KEY (maintenance_log_id) REFERENCES Maintenance_log(maintenance_log_id),
    FOREIGN KEY (mechanic_id) REFERENCES Mechanics(mechanic_id)
);

-- Parts Inventory Table
CREATE TABLE Parts_inventory (
    part_id INT PRIMARY KEY,
    part_name VARCHAR(255),
    part_quantity INT,
    min_quantity_on_hand INT
);

-- Parts Usage Table
CREATE TABLE Parts_usage (
    parts_usage_id INT PRIMARY KEY,
    maintenance_log_id INT,
    part_id INT,
    quantity_used INT,
    FOREIGN KEY (maintenance_log_id) REFERENCES Maintenance_log(maintenance_log_id),
    FOREIGN KEY (part_id) REFERENCES Parts_inventory(part_id)
);

-- Adding Foreign Key Constraints

-- Primary Key Constraints
ALTER TABLE Faculty_members ADD CONSTRAINT fk_faculty_dept FOREIGN KEY (department_id) REFERENCES Departments(department_id);
ALTER TABLE Reservations ADD CONSTRAINT fk_reservations_faculty FOREIGN KEY (faculty_member_id) REFERENCES Faculty_members(faculty_member_id);
ALTER TABLE Reservations ADD CONSTRAINT fk_reservations_vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id);
ALTER TABLE Trip_completion ADD CONSTRAINT fk_trip_completion_faculty FOREIGN KEY (faculty_member_id) REFERENCES Faculty_members(faculty_member_id);
ALTER TABLE Trip_completion ADD CONSTRAINT fk_trip_completion_vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id);
ALTER TABLE Maintenance_log ADD CONSTRAINT fk_maintenance_log_vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id);
ALTER TABLE Maintenance_detail ADD CONSTRAINT fk_maintenance_detail_log FOREIGN KEY (maintenance_log_id) REFERENCES Maintenance_log(maintenance_log_id);

-- Check Constraints
ALTER TABLE Reservations ADD CONSTRAINT chk_reservations_dates CHECK (expected_departure_date > reservation_date);
ALTER TABLE Trip_completion ADD CONSTRAINT chk_trip_completion_readings CHECK (odometer_readings_end > odometer_readings_start);
ALTER TABLE Maintenance_log ADD CONSTRAINT chk_maintenance_dates CHECK (initial_log_entry_date < vehicle_back_into_service_date);
