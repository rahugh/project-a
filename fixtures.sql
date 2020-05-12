DROP TABLE make CASCADE;
DROP TABLE model CASCADE;
DROP TABLE car CASCADE;
DROP TABLE account CASCADE;
DROP TABLE account_car CASCADE;
DROP TABLE recall CASCADE;

CREATE TABLE make (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE model (
    id SERIAL PRIMARY KEY,
    make_id INTEGER REFERENCES make(id) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE car (
    id SERIAL PRIMARY KEY,
    model_id INTEGER REFERENCES model(id) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    email VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE account_car (
    account_id INTEGER REFERENCES account(id) NOT NULL,
    car_id INTEGER REFERENCES car(id) NOT NULL,
    PRIMARY KEY(account_id, car_id)
);

CREATE TABLE recall (
    id SERIAL PRIMARY KEY,
    model_id INTEGER REFERENCES model(id) NOT NULL,
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO make (name) VALUES ('Audi');
INSERT INTO make (name) VALUES ('BMW');
INSERT INTO make (name) VALUES ('Ford');
INSERT INTO make (name) VALUES ('Holden');
INSERT INTO make (name) VALUES ('Hyundai');
INSERT INTO make (name) VALUES ('Kia');
INSERT INTO make (name) VALUES ('Mazda');
INSERT INTO make (name) VALUES ('Mercedes-Benz');
INSERT INTO make (name) VALUES ('Mitsubishi');
INSERT INTO make (name) VALUES ('Nissan');
INSERT INTO make (name) VALUES ('Subaru');
INSERT INTO make (name) VALUES ('Toyota');
INSERT INTO make (name) VALUES ('Volkswagen');

INSERT INTO model(make_id, name) VALUES (1, 'A1');
INSERT INTO model(make_id, name) VALUES (1, 'A3');
INSERT INTO model(make_id, name) VALUES (2, '1 Series');
INSERT INTO model(make_id, name) VALUES (2, '2 Series');
INSERT INTO model(make_id, name) VALUES (3, 'Focus');
INSERT INTO model(make_id, name) VALUES (3, 'Fiesta');

INSERT INTO recall (model_id, body) VALUES (1, 'Faulty indicator');
INSERT INTO recall (model_id, body) VALUES (2, 'Faulty airbags');
INSERT INTO recall (model_id, body) VALUES (3, 'Faulty breaks');
INSERT INTO recall (model_id, body) VALUES (4, 'Faulty seatbelts');
INSERT INTO recall (model_id, body) VALUES (5, 'Faulty engine');
INSERT INTO recall (model_id, body) VALUES (6, 'Faulty wheels');
