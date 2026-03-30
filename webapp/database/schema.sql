CREATE TABLE IF NOT EXISTS hotel_chain(
    hotel_chain_id integer primary key,
    street_number integer not null check( street_number>0),
    street_name  varchar(50) not null,
    city varchar(50) not null,
    province varchar(50) not null,
    zip varchar(6) not null  CHECK (zip ~ '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    num_of_hotels integer not null check (num_of_hotels>=1),
    hotel_chain_name varchar(50) not null unique
);



create table if not exists hotel_chain_contact_phone(
    hotel_chain_phone integer primary key CHECK (hotel_chain_phone between 10000000000 and 99999999999),
    hotel_chain_id integer not null,
    foreign key (hotel_chain_id) 
        references hotel_chain(hotel_chain_id) on delete cascade
);


CREATE OR REPLACE FUNCTION limit_phone_per_chain()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        SELECT COUNT(*) 
        FROM hotel_chain_contact_phone
        WHERE hotel_chain_id = NEW.hotel_chain_id
    ) >= 5 THEN
        RAISE EXCEPTION 'A hotel chain cannot have more than 5 phone numbers';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER phone_limit_trigger
BEFORE INSERT ON hotel_chain_contact_phone
FOR EACH ROW
EXECUTE FUNCTION limit_phone_per_chain();

create table if not exists hotel_chain_contact_email(
    hotel_chain_email varchar(50) primary key,
    hotel_chain_id integer not null,
    foreign key (hotel_chain_id) 
        references hotel_chain(hotel_chain_id) on delete cascade,
    CONSTRAINT CHK_Email_Charindex CHECK (CHARINDEX('@', Email) > 0)
);


CREATE OR REPLACE FUNCTION limit_email_per_chain()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        SELECT COUNT(*) 
        FROM hotel_chain_contact_email
        WHERE hotel_chain_id = NEW.hotel_chain_id
    ) >= 5 THEN
        RAISE EXCEPTION 'A hotel chain cannot have more than 5 emails';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER email_limit_trigger
BEFORE INSERT ON hotel_chain_contact_email
FOR EACH ROW
EXECUTE FUNCTION limit_email_per_chain();

create table if not exists hotel(
    hotel_id integer primary key,
    hotel_chain_id integer not null,
    street_number integer not null check( street_number>0),
    street_name  varchar(50) not null,
    city varchar(50) not null,
    province varchar(50) not null,
    zip varchar(6) not null  CHECK (zip ~ '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    hotel_name varchar(50) not null unique,
    num_of_rooms integer not null check(num_of_rooms>=1),
    star_rating integer not null check(star_rating between 1 and 5),
    manager_ssn integer not null unique
);


create table if not exists hotel_contact_phone(
    hotel_phone integer primary key CHECK (hotel_phone between 10000000000 and 99999999999),
    hotel_id integer not null,
    foreign key (hotel_id) 
        references hotel(hotel_id) on delete cascade
);




CREATE OR REPLACE FUNCTION limit_phone_per_hotel()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        SELECT COUNT(*) 
        FROM hotel_contact_phone
        WHERE hotel_id = NEW.hotel_id
    ) >= 5 THEN
        RAISE EXCEPTION 'A hotel cannot have more than 5 phone numbers';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER phone_limit_trigger_hotel
BEFORE INSERT ON hotel_contact_phone
FOR EACH ROW
EXECUTE FUNCTION limit_phone_per_hotel();

create table if not exists hotel_contact_email(
    hotel_email varchar(50) primary key,
    hotel_id integer not null,
    foreign key (hotel_id) 
        references hotel(hotel_id) on delete cascade,
        CONSTRAINT CHK_Email_Charindex CHECK (CHARINDEX('@', Email) > 0)
);


CREATE OR REPLACE FUNCTION limit_email_per_hotel()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        SELECT COUNT(*) 
        FROM hotel_contact_email
        WHERE hotel_id = NEW.hotel_id
    ) >= 5 THEN
        RAISE EXCEPTION 'A hotel cannot have more than 5 emails';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER email_limit_trigger_hotel
BEFORE INSERT ON hotel_contact_email
FOR EACH ROW
EXECUTE FUNCTION limit_email_per_hotel();

CREATE TABLE Manages (
    hotel_id INTEGER PRIMARY KEY,

    employee_ssn INTEGER NOT NULL UNIQUE CHECK (employee_ssn between 100000000 and 999999999),

    FOREIGN KEY (hotel_id)
        REFERENCES hotel(hotel_id)
        ON DELETE CASCADE,

    FOREIGN KEY (employee_ssn)
        REFERENCES employee(employee_ssn)
);

CREATE TABLE if not exists employee (
    employee_ssn INTEGER PRIMARY KEY  CHECK (employee_ssn between 100000000 and 999999999),
    hotel_id INTEGER NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street_number integer not null check( street_number>0),
    street_name  varchar(50) not null,
    city varchar(50) not null,
    province varchar(50) not null,
    zip varchar(6) not null  CHECK (zip ~ '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),

    FOREIGN KEY (hotel_id)
        REFERENCES hotel(hotel_id)
        ON DELETE CASCADE
);

CREATE TABLE if not exists employee_position (
    employee_ssn varchar(20) NOT NULL
        CHECK (employee_ssn between 100000000 and 999999999),

    hotel_id INTEGER NOT NULL,

    position VARCHAR(30) NOT NULL
        CHECK (
            position IN (
                'Doorman',
                'Concierge',
                'Valet',
                'Security',
                'Front desk agent',
                'Housekeeper',
                'Maintenance',
                'Cleaner',
                'Server',
                'Bartender',
                'Chef'
            )
        ),

    PRIMARY KEY (employee_ssn, hotel_id, position),

    FOREIGN KEY (hotel_id)
        REFERENCES hotel(hotel_id)
        ON DELETE CASCADE,

    FOREIGN KEY (employee_ssn)
        REFERENCES employee(employee_ssn)
        ON DELETE CASCADE
);

CREATE TABLE if not exists Room (
    hotel_id integer NOT NULL,
    room_number integer NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    capacity integer NOT NULL,
    view_type VARCHAR(20),
    extendable BOOLEAN NOT NULL,
    damages BOOLEAN NOT NULL,

    PRIMARY KEY (hotel_id, room_number),

    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id),

    CHECK (price > 0),
    CHECK (capacity > 0),
    CHECK (view_type IN ('Sea', 'Mountain')),

    CHECK (NOT (capacity = 1 AND extendable = TRUE))
);

create table if not exists amenity (
    hotel_id integer not null,
    room_number integer not null,
    amenity varchar(20),

    primary key(hotel_id, room_number, amentiy),
    FOREIGN KEY (hotel_id, room_number)
        REFERENCES Room(hotel_id, room_number),
    
    CHECK (amenity IN ('TV', 'AC', 'WiFi', 'Fridge', 'Microwave', 'Iron'))
);

create table if not exists customer (
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street_number integer not null check( street_number>0),
    street_name  varchar(50) not null,
    city varchar(50) not null,
    province varchar(50) not null,
    zip varchar(6) not null  CHECK (zip ~ '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    customer_id varchar(20) primary key,
    registration_date date not null check(registration_date <= CURRENT_DATE)
);

create table if not exists renting_booking (
    hotel_id integer not null,
    room_number integer not null,
    customer_id varchar(20) not null,
    renting_booking_id integer not null,
    checkin_date date not null,
    employee_responsable varchar(20) not null,
    booking boolean not null,
    booking_date date,
    PRIMARY KEY (renting_id),
    FOREIGN KEY (hotel_id, room_number)
        REFERENCES Room(hotel_id, room_number),
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_responsable)
        REFERENCES Employee(employee_ssn),
    Check (checkin_date < checkout_date),
    CHECK(checkin_date >= CURRENT_DATE),
    CHECK (
    (booking = TRUE AND booking_date IS NOT NULL)
    OR (booking = FALSE))
);

CREATE OR REPLACE FUNCTION check_renting_overlap()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Renting r
        WHERE r.hotel_id = NEW.hotel_id
          AND r.room_number = NEW.room_number
          AND r.renting_id <> NEW.renting_id
          AND NEW.checkin_date < r.checkout_date
          AND NEW.checkout_date > r.checkin_date
    ) THEN
        RAISE EXCEPTION 'This room already has a renting during the selected date range.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_renting_overlap
BEFORE INSERT OR UPDATE
ON Renting
FOR EACH ROW
EXECUTE FUNCTION check_renting_overlap();

create table if not exists archived_renting_booking (
    hotel_id integer not null,
    archived_renting_booking id integer primary key,
    room_number integer not null,
    checkin_date date not null,
    checkout_date date not null,
    booking_date date,
    booking boolean not null,
    check(checkin_date < checkout_date),
    CHECK (
    (booking = TRUE AND booking_date IS NOT NULL)
    OR (booking = FALSE))
);