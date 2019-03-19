CREATE OR REPLACE FUNCTION check_weight_constraint(integer, integer, float) RETURNS boolean
    AS $$ SELECT (SELECT weight FROM details WHERE id = $2) * $1 <= $3 $$
    LANGUAGE SQL;

CREATE TABLE supplies (
    id integer PRIMARY KEY,
    provider_id integer REFERENCES providers(id),
    detail_id integer REFERENCES details(id),
    quantity integer CHECK(quantity > 0),
    price float CHECK(price > 0),
    ship_date date NOT NULL,
    CONSTRAINT total_weight CHECK(check_weight_constraint(quantity, detail_id, 1500))
);
