/* Database schema to keep the structure of entire database. */

create table animals (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(50),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

alter table animals add species varchar(50);

create table owners(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name varchar(50),
    age int 
);

create table species(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(50)
);

alter table animals add column species_id int;
ALTER TABLE animals ADD CONSTRAINT id_species FOREIGN KEY (species_id) REFERENCES species (id);
alter table animals add column owner_id int;
ALTER TABLE animals ADD CONSTRAINT id_owners FOREIGN KEY (owner_id) REFERENCES owners (id);


