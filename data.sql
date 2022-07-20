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
