/* Database schema to keep the structure of entire database. */

create table animals (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(50),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
)

alter table animals add species varchar(50);
