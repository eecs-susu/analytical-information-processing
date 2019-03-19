CREATE TABLE details (
    id integer PRIMARY KEY,
    name char(20) NOT NULL,
    city char(20) NOT NULL,
    color char(20),
    weight float CHECK(weight > 0),
    CONSTRAINT unique_detail UNIQUE(name, city, color)
);
