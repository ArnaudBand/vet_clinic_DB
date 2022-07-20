/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals;

-- Find all animals whose name ends in "mon".

SELECT name from animals where name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.

select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';


-- List the name of all animals that are neutered and have less than 3 escape attempts.

select name from animals where neutered and escape_attempts < 3;


-- List the date of birth of all animals named either "Agumon" or "Pikachu".

SELECT date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';


-- List name and escape attempts of animals that weigh more than 10.5kg

select name, escape_attempts from animals where weight_kg > 10.5;

-- Find all animals that are neutered.

select * from animals where neutered

-- Find all animals not named Gabumon.

select * from where animals name != 'Gabumon'


-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)

select * from animals where weight_kg between 10.4 and 17.3;

                    -- Day 2
                    --  --  --

update animals set species = 'unspecified';
update animals set species = 'digimon' where name like '%mom';
update animals set species = 'pokemon' where species is null;
delete from animals;
delete from animals where date_of_birth > date '2022-01-01';
update animals set weight_kg = weight_kg * -1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;


-- How many animals are there?
select count(*) from animals;
-- How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;
-- What is the average weight of animals?
select avg(weight_kg) from animals;
-- Who escapes the most, neutered or not neutered animals?
select neutered, max(escape_attempts)from animals by group by neutered;
-- What is the minimum and maximum weight of each type of animal?
select species, max(weight_kg), min(weight_kg) from animals group by species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01'and '2000-01-01' group by species;



                    -- Day 3
            ------------------------



-- What animals belong to Melody Pond?
SELECT full_name, name FROM owners JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
select animals.name as Pokemon from animals join species on animals.species_id = species.id where species = 1;
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT name, full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
-- How many animals are there per species?
select species.name, count(species_id) from animals inner join species on animals.species_id = species.id group by species.name;
-- List all Digimon owned by Jennifer Orwell.
select name as Digimon_list from animals join owners on animals.owner_id = owners.id where full_name = 'Jennifer Orwell' and species_id = 2;
--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name AS not_escape FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
-- Who owns the most animals?
select owners.full_name, count(*) from owners join animals on owners.id = animals.owner_id group by owners.full_name having count(*) > 2;
