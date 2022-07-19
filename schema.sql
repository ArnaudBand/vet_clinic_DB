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

update animals set species = 'unspecified';

update animals set species = 'digimon' where name like '%mom';

update animals set species = 'pokemon' where species is null;

delete from animals;
delete from animals where date_of_birth > date '2022-01-01';
update animals set weight_kg = weight_kg * -1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
