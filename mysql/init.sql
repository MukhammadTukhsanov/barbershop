CREATE TABLE
    users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100),
        phone VARCHAR(20),
        email VARCHAR(100),
        password_hash VARCHAR(255),
        role ENUM ('client', 'admin') DEFAULT 'client',
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    barbershops (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100),
        address VARCHAR(255),
        phone VARCHAR(20),
        working_days JSON,
        open_time TIME,
        close_time TIME,
        lunch_start TIME,
        lunch_end TIME
    );

CREATE TABLE
    barbers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100),
        barbershop_id INT,
        FOREIGN KEY (barbershop_id) REFERENCES barbershops (id) ON DELETE CASCADE
    );

CREATE TABLE
    timeslots (
        id INT AUTO_INCREMENT PRIMARY KEY,
        barbershop_id INT,
        barber_id INT,
        date DATE,
        start_time TIME,
        end_time TIME,
        is_available BOOLEAN DEFAULT TRUE,
        FOREIGN KEY (barbershop_id) REFERENCES barbershops (id),
        FOREIGN KEY (barber_id) REFERENCES barbers (id)
    );

CREATE TABLE
    bookings (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT,
        timeslot_id INT,
        status ENUM ('booked', 'cancelled', 'completed') DEFAULT 'booked',
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (timeslot_id) REFERENCES timeslots (id)
    );

CREATE TABLE
    notifications (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT,
        title VARCHAR(255),
        message TEXT,
        sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id)
    );