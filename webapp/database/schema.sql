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

INSERT INTO hotel_chain(hotel_chain_id, street_number, city, province, zip, num_of_hotels, hotel_chain_name)
Values 
(1, 125, 'Kingston', 'Ontario', 'R2K5I5', 8, 'Star Hotels'),
(2, 13, 'Ottawa', 'Ontario', 'K3K4I2', 9, 'Jamie Houses You'),
(3, 124,  'Edmonton', 'Alberta', 'H4K5I6', 8, 'Edmonton Best'),
(4, 12, 'Vancouver', 'British Columbia', 'H3K5O3', 10, 'Chateau Vanny'),
(5, 14, 'Hamilton', 'Ontario', 'K4K2H6', 8, 'Alexander Hotels');

create table if not exists hotel_chain_contact_phone(
    hotel_chain_phone integer primary key CHECK (hotel_chain_phone ~ '^[0-9]{10,11}$'),
    hotel_chain_id integer not null,
    foreign key (hotel_chain_id) 
        references hotel_chain(hotel_chain_id) on delete cascade
);

insert into hotel_chain_contact_phone(hotel_chain_phone, hotel_chain_id)
values
(8325667382, 1),
(3651737377, 1),
(2648264736, 2),
(3736287598, 2),
(3456664736, 2),
(6139264927, 3),
(2518362536, 4),
(1234567891, 4),
(36483637256,5),
(1254758789,5);

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
    hotel_chain_email varchar(50) primary key check(),
    hotel_chain_id integer not null,
    foreign key (hotel_chain_id) 
        references hotel_chain(hotel_chain_id) on delete cascade,
        CONSTRAINT CHK_Email_Charindex CHECK (CHARINDEX('@', Email) > 0);
)

insert into hotel_chain_contact_email(hotel_chain_email, hotel_chain_id)
values 
('hotelsforyou@starhotels.com', 1),
('bookhotels@starhotels.com', 1),
('jhotels@jamiehousesyou.com', 2),
('eddyhotels@edmontonsbest.com', 3),
('edmontonbesthotels@edmontonsbest.com', 3),
('edshotels@edmontonsbest.com', 3),
('chateauvancouver@chateauvanny.com', 4),
('chateauvan@chateauvanny.com', 4),
('bookalexhotels@alexanderhotels.com', 5);

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

create table hotel(
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