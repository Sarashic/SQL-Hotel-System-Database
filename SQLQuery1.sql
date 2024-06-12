--- Create the Hotel table
CREATE TABLE Hotel (
    Hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(255),
    location VARCHAR(255),
    rating DECIMAL(3,1),
    no_floors INT,
    opening_date DATE,
    opening_hours VARCHAR(255)
);

-- Create the Room table
CREATE TABLE Room (
    room_no INT PRIMARY KEY,
    room_type VARCHAR(20) CHECK (room_type IN ('classic', 'deluxe')),
    room_view VARCHAR(255),
    room_smoking_nosmoking VARCHAR(20) CHECK (room_smoking_nosmoking IN ('smoking', 'non-smoking')),
    room_occupancy_capacity INT,
    room_house_keepingstatus VARCHAR(255),
    hotel_id INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(Hotel_id)
);

-- Create the Customer table
CREATE TABLE Customer (
    Cust_id INT PRIMARY KEY,
    F_name VARCHAR(255),
    L_name VARCHAR(255),
    DOB DATE,
    address VARCHAR(255),
    Pin_code VARCHAR(10),
    city VARCHAR(100),
    state VARCHAR(100),
    age AS DATEDIFF(YEAR, DOB, GETDATE()),
    mobile_no VARCHAR(20),
    room_no INT,
    FOREIGN KEY (room_no) REFERENCES Room(room_no)
);

-- Create the TodayPrice table
CREATE TABLE TodayPrice (
    confirmation_number INT PRIMARY KEY,
    available_room INT,
    price DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    salecode VARCHAR(255),
    tax_breakdown VARCHAR(255),
    currency_conversionfee DECIMAL(10,2),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
);

-- Create the Payment table
CREATE TABLE Payment (
    payment_no INT PRIMARY KEY,
    payment_method VARCHAR(255),
    refund_request VARCHAR(255),
    confirmation_time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    split_details VARCHAR(255),
    currency_used VARCHAR(3),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES Customer(Cust_id)
);

-- Create the Staff table
CREATE TABLE Staff (
    employee_card INT PRIMARY KEY,
    role VARCHAR(255),
    Email VARCHAR(255),
    Education VARCHAR(255),
    Uniform_size VARCHAR(10),
    mobile_no VARCHAR(20),
    bonuses DECIMAL(10, 2)
);

-- Create the Supplier table
CREATE TABLE Supplier (
    Provider_ID INT PRIMARY KEY,
    Company_Name VARCHAR(255),
    contact VARCHAR(255),
    Products_services_provided VARCHAR(255),
    Code_number INT,
    amount DECIMAL(10, 2),
    Email VARCHAR(255)
);
