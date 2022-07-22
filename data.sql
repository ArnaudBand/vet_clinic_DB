/* Populate database with sample data. */

                  --     Day 1
        -----------------------------------

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values
        ('Agumon', 'Feb 3, 2020', 0, true, 10.23),
        ('Gabumon', 'Nov 15, 2018', 2, true, 8),
        ('Pikachu', 'Jan 7, 2021', 1, false, 15.04),
        ('Devimon', 'May 12, 2017', 5, true, 11);

                      -- Day 2 
        -------------------------------------

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values
        ('Charmander', '2020-02-08', 0, FALSE, -11),
        ('Plantmon', '2021-11-15', 2, TRUE, -5.7),
        ('Squirtle', '1993-04-02', 3, FALSE, -12.13),
        ('Angemon', '2005-06-12', 1, TRUE, -45),
        ('Boarmon', '2005-06-07', 7, TRUE, 20.4),
        ('Blossom', '1998-10-13', 3, TRUE, 17),
        ('Ditto', '2022-05-14', 4, TRUE, 22);


                        -- Day 3
            -----------------------------            


insert into species (name) values 
   ('Pokemon'),
   ('Digimon');


update animals set species_id = (select id from species where name = 'Digimon') where name like '%mon';
update animals set species_id = (select id from species where name = 'Pokemon') where name not like '%mon%';

insert into owners (full_name, age) values
        ('Sam Smith', 34),
        ('Jennifer Orwell', 19),
        ('Bob', 45),
        ('Melody Pond', 77),
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38);
        
update animals set owner_id = (select id from owners where full_name = 'Sam Smith') where name = 'Agumon';
update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') where name = 'Gabumon' or name = 'Pikachu';
update animals set owner_id = (select id from owners where full_name = 'Bob') where name = 'Devimon' or name = 'Plantmon';
update animals set owner_id = (select id from owners where full_name = 'Melody Pond') where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
update animals set owner_id = (select id from owners where full_name = 'Dean Winchester') where name = 'Angemon' or name = 'Boarmon';

                        ------ Day 4 ------
                        -------------------

-- Vets table
insert into vets (name, age, date_of_graduation) values
        ('William Tatcher', 45, '2000-04-23'),
        ('Maisy Smith', 26, '2019-01-17'),
        ('Stephanie Mendez', 64, '1981-05-04'),
        ('Jack Harkness', 38, '2008-06-08');


-- Specializations table
insert into specializations (vet_id, specie_id)
select vets.id, species.id from vets, species
where vets.name = 'William Tatcher' and species.name = 'Pokemon';

insert into specializations (vet_id, specie_id)
select vets.id, species.id from vets, species
where vets.name = 'Stephanie Mendez' and species.name in ('Digimon', 'Pokemon');

insert into specializations (vet_id, specie_id)
select vets.id, species.id from vets, species
where vets.name = 'Jack Harkness' and species.name = 'Digimon';


-- Visits table
insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-05-24' from animals, vets 
where animals.name='Agumon' and vets.name = 'William Tatcher';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-07-22' from animals, vets 
where animals.name='Agumon' and vets.name = 'Stephanie Mendez';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2021-02-02' from animals, vets 
where animals.name='Gabumon' and vets.name = 'Jack Harkness';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-01-05' from animals, vets 
where animals.name='Pikachu' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-03-08' from animals, vets 
where animals.name='Pikachu' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-05-24' from animals, vets 
where animals.name='Pikachu' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2021-05-04' from animals, vets 
where animals.name='Devimon' and vets.name = 'Stephanie Mendez';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2021-02-24' from animals, vets 
where animals.name='Charmander' and vets.name = 'Jack Harkness';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2019-12-21' from animals, vets 
where animals.name='Plantmon' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-08-10' from animals, vets 
where animals.name='Plantmon' and vets.name = 'William Tatcher';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2021-04-07' from animals, vets 
where animals.name='Plantmon' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2019-09-29' from animals, vets 
where animals.name='Squirtle' and vets.name = 'Stephanie Mendez';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-10-03' from animals, vets 
where animals.name='Angemon' and vets.name = 'Jack Harkness';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-11-04' from animals, vets 
where animals.name='Angemon' and vets.name = 'Jack Harkness';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2019-01-24' from animals, vets 
where animals.name='Boarmon' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2019-05-15' from animals, vets 
where animals.name='Boarmon' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-02-27' from animals, vets 
where animals.name='Boarmon' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-08-03' from animals, vets 
where animals.name='Boarmon' and vets.name = 'Maisy Smith';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2020-05-24' from animals, vets 
where animals.name='Blossom' and vets.name = 'Stephanie Mendez';

insert into visits (animal_id, vet_id, date_of_visit)
select animals.id, vets.id, '2021-01-11' from animals, vets 
where animals.name='Blossom' and vets.name = 'William Tatcher';
