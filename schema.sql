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

                    -- Day 4 --
            ---------------------------

create table vets (
    id int generated always as identity primary key,
    name varchar(50),
    age int,
    date_of_graduation date
)

create table specializations (
    vet_id int,
    specie_id int,
    constraint fk_vets foreign key (vet_id) references vets(id),
    constraint fk_speies foreign key (specie_id) references species(id)
)

create table visits (
  vet_id int,
  animal_id int,
  date_of_visit date,
  constraint fk_vets foreign key (vet_id) references vets(id),
  constraint fk_animals foreign key (animal_id) references animals(id)
);

                        --- WEEK 2 DAY 1----
                        --------------------

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);