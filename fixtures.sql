CREATE TABLE recall (
    id SERIAL PRIMARY KEY, make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    body TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

INSERT INTO recall (make, model, body, created_at, updated_at) VALUES ('Audi', 'A1', 'Faulty indicator', NOW(), NOW());
INSERT INTO recall (make, model, body, created_at, updated_at) VALUES ('Audi', 'A2', 'Faulty airbags', NOW(), NOW());
