CREATE TABLE providers (
    id integer PRIMARY KEY,
    name char(20) NOT NULL,
    city char(20) NOT NULL,
    address char(50),
    risk integer CHECK(risk in (1, 2, 3)),
    CONSTRAINT unique_provider UNIQUE(name, address, city)
);
