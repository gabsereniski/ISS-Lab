use secure_db;

INSERT INTO pokemon (pokedex_number, name, attack, defense, hp, speed, sp_attack, sp_defense, type1, type2, abilities, capture_rate, weight_kg, height_m, classfication, generation, is_legendary)
VALUES
(1001, 'Zaplet', 75, 80, 70, 100, 95, 85, 'electric', 'steel', 'Static - Lightning Rod', 60, 35.5, 1.4, 'Bolt Pokemon', 2, 0),
(1002, 'Terraclaw', 90, 95, 85, 60, 50, 70, 'ground', 'fighting', 'Sturdy - Sand Force', 90, 62.3, 1.8, 'Mole Pokemon', 3, 0),
(1003, 'Flamara', 85, 60, 70, 105, 110, 90, 'fire', 'flying', 'Flame Body - Speed Boost', 45, 22.0, 1.2, 'Blaze Pokemon', 2, 0),
(1004, 'Aquariel', 60, 70, 80, 55, 75, 95, 'water', 'fairy', 'Hydration - Swift Swim', 30, 18.9, 0.9, 'Wave Pokemon', 4, 0),
(1005, 'Cryofang', 110, 80, 85, 70, 75, 80, 'ice', 'dark', 'Ice Body - Pressure', 45, 150.0, 2.1, 'Frost Fang Pokemon', 5, 0),
(1006, 'Shadowrox', 125, 100, 70, 80, 90, 90, 'rock', 'ghost', 'Levitate - Cursed Body', 3, 200.0, 3.0, 'Phantom Stone Pokemon', 6, 1),
(1007, 'Venovine', 65, 60, 65, 50, 85, 90, 'poison', 'grass', 'Chlorophyll - Poison Point', 120, 9.5, 0.8, 'Venomous Vine Pokemon', 1, 0),
(1008, 'Sparkidon', 95, 85, 100, 120, 85, 70, 'electric', 'normal', 'Intimidate - Volt Absorb', 50, 55.0, 1.6, 'Thunder Beast Pokemon', 3, 0),
(1009, 'Pyroarion', 105, 70, 90, 90, 115, 85, 'fire', 'steel', 'Blaze - Flash Fire', 45, 81.7, 2.3, 'Lionheart Pokemon', 7, 0),
(1010, 'Dracosoul', 130, 90, 105, 95, 120, 100, 'dragon', 'psychic', 'Pressure - Multiscale', 3, 210.5, 4.2, 'Celestial Dragon Pokemon', 8, 1),
(1011, 'Lumigale', 70, 60, 60, 110, 90, 80, 'fairy', 'flying', 'Cute Charm - Pixilate', 70, 12.4, 0.9, 'Luminous Gale Pokemon', 3, 0),
(1012, 'Gravemaw', 115, 95, 75, 60, 55, 85, 'dark', 'rock', 'Strong Jaw - Unnerve', 45, 76.0, 1.5, 'Predator Pokemon', 5, 0),
(1013, 'Toxifin', 80, 65, 70, 95, 75, 85, 'poison', 'water', 'Poison Touch - Merciless', 80, 30.5, 1.2, 'Toxic Spine Pokemon', 4, 0),
(1014, 'Flaregeon', 90, 70, 80, 100, 105, 80, 'fire', 'dragon', 'Blaze - Flash Fire', 50, 56.7, 1.7, 'Blazing Wing Pokemon', 6, 0),
(1015, 'Cryostar', 70, 60, 85, 55, 90, 110, 'ice', 'psychic', 'Levitate - Inner Focus', 40, 50.3, 1.6, 'Glacial Shine Pokemon', 2, 0),
(1016, 'Thundrock', 100, 120, 70, 80, 75, 60, 'electric', 'rock', 'Rock Head - Motor Drive', 30, 120.0, 2.5, 'Electro Boulder Pokemon', 7, 0),
(1017, 'Bramblethorn', 75, 95, 90, 40, 60, 80, 'grass', 'dark', 'Iron Barbs - Rough Skin', 90, 35.0, 1.3, 'Thorny Beast Pokemon', 3, 0),
(1018, 'Pyromagus', 110, 65, 75, 90, 115, 95, 'fire', 'psychic', 'Magician - Blaze', 45, 45.5, 1.8, 'Flaming Sorcerer Pokemon', 8, 1),
(1019, 'Aquaknight', 85, 90, 95, 65, 80, 100, 'water', 'steel', 'Torrent - Battle Armor', 60, 98.3, 2.1, 'Armored Wave Pokemon', 4, 0),
(1020, 'Draconis', 140, 95, 100, 85, 120, 95, 'dragon', 'fairy', 'Multiscale - Pressure', 5, 210.7, 4.5, 'Royal Dragon Pokemon', 8, 1),
(1021, 'Glacierhorn', 90, 100, 85, 50, 80, 95, 'ice', 'rock', 'Solid Rock - Sturdy', 40, 140.0, 2.8, 'Icy Horn Pokemon', 3, 0),
(1022, 'Flamejaw', 120, 80, 75, 85, 110, 90, 'fire', 'dark', 'Sheer Force - Moxie', 45, 68.5, 1.9, 'Infernal Fang Pokemon', 7, 0),
(1023, 'Voltasurge', 95, 85, 80, 115, 100, 70, 'electric', 'flying', 'Static - Volt Absorb', 60, 48.0, 1.5, 'Storm Wing Pokemon', 2, 0),
(1024, 'Hydralash', 80, 90, 110, 55, 95, 105, 'water', 'dragon', 'Torrent - Swift Swim', 30, 150.5, 2.2, 'Aqua Serpent Pokemon', 4, 0),
(1025, 'Terradon', 110, 120, 95, 60, 80, 70, 'rock', 'ground', 'Sand Stream - Sturdy', 20, 300.0, 3.5, 'Ancient Titan Pokemon', 1, 1),
(1026, 'Sparkflare', 105, 75, 70, 100, 115, 90, 'electric', 'fire', 'Flame Body - Volt Absorb', 50, 65.0, 1.7, 'Blazing Bolt Pokemon', 6, 0),
(1027, 'Leafdrift', 70, 80, 60, 120, 90, 70, 'grass', 'flying', 'Overgrow - Gale Wings', 80, 25.4, 1.3, 'Leaf Glider Pokemon', 3, 0),
(1028, 'Mystivine', 85, 70, 75, 65, 100, 95, 'grass', 'ghost', 'Infiltrator - Cursed Body', 70, 30.0, 1.4, 'Mystic Vine Pokemon', 7, 0),
(1029, 'Volcanosh', 120, 100, 80, 70, 90, 85, 'fire', 'rock', 'Flame Body - Rock Head', 30, 250.0, 2.7, 'Volcano Core Pokemon', 4, 1),
(1030, 'Aquamoth', 60, 50, 70, 110, 90, 80, 'water', 'bug', 'Swift Swim - Tinted Lens', 90, 18.0, 1.0, 'Ripple Wing Pokemon', 2, 0);