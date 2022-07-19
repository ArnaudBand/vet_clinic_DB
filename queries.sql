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
-- How many animals are there?
select count(*) from animals;
-- How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;
-- Who escapes the most, neutered or not neutered animals?
select neutered, max(escape_attempts)from animals by group by neutered;
-- What is the minimum and maximum weight of each type of animal?
select species, max(weight_kg), min(weight_kg) from animals group by species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01'and '2000-01-01' group by species;



