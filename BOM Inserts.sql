
-- VENDORS
INSERT INTO vendors (name)
VALUES      ('Helical International'),
            ('Plates R Us'),
            ('Wholey Rollers'),
            ('Jack Daniels Belts'),
            ('Engine Accessories'),
            ('Comp USA'),
            ('Unharnessed at Large'),
            ('Get a Grip'),
            ('Telegraph Inc.'),
            ('Radio Shack'),
            ('Starbucks'),
            ('Michaels'),
            ('OSH');

-- PARTS
INSERT INTO parts (number, name)
VALUES      ('0', 'Motorcycle'),
            ('1', 'Engine'),
            ('1.1', 'Transmission'),
            ('1.1.1', 'Clutch'),
            ('1.1.1.1', 'Springs'),
            ('1.1.1.2', 'Torque Plates'),
            ('1.1.2', 'Variator'),
            ('1.1.2.1', 'Rollers'),
            ('1.1.3', 'Belt'),
            ('1.2', 'Head'),
            ('1.2.1', 'Pistons'),
            ('1.2.2', 'Rings'),
            ('1.3', 'Battery'),
            ('1.3.1', 'ECU'),
            ('1.3.2', 'Starter'),
            ('1.3.2.1', 'Stator'),
            ('1.3.2.1.1', 'Stator Wiring'),
            ('2', 'Frame'),
            ('2.1', 'Handlebars'),
            ('2.1.1', 'Grips'),
            ('2.1.2', 'Throttle'),
            ('2.1.2.1', 'Throttle Cables'),
            ('2.1.3', 'Kill Switch'),
            ('2.2', 'Seat'),
            ('2.2.1', 'Foam'),
            ('2.2.2', 'Fabric'),
            ('2.3', 'Headlight'),
            ('2.3.1', 'Bulb'),
            ('2.3.2', 'Headlight Wiring');

-- ASSEMBLIES
INSERT INTO assemblies (parts_number)
VALUES      ('0'),
            ('1'),
            ('1.1'),
            ('1.1.1'),
            ('1.1.2'),
            ('1.2'),
            ('1.3'),
            ('1.3.2'),
            ('1.3.2.1'),
            ('2'),
            ('2.1'),
            ('2.1.2'),
            ('2.2'),
            ('2.3');

-- PIECE PARTS
INSERT INTO piece_parts (parts_number, vendors_name)
VALUES      ('1.1.1.1', 'Helical International'),
            ('1.1.1.2', 'Plates R Us'),
            ('1.1.2.1', 'Wholey Rollers'),
            ('1.1.3', 'Jack Daniels Belts'),
            ('1.2.1', 'Engine Accessories'),
            ('1.2.2', 'Engine Accessories'),
            ('1.3.1', 'Comp USA'),
            ('1.3.2.1.1', 'Unharnessed at Large'),
            ('2.1.1', 'Get a Grip'),
            ('2.1.2.1', 'Telegraph Inc.'),
            ('2.1.3', 'Radio Shack'),
            ('2.2.1', 'Starbucks'),
            ('2.2.2', 'Michaels'),
            ('2.3.1', 'OSH'),
            ('2.3.2', 'Unharnessed at Large');

-- USAGES
INSERT INTO usages (parts_number, assemblies_parts_number, quantity)
VALUES      ('1', '0', 1),
            ('2', '0', 1),

            ('1.1', '1', 1),
            ('1.2', '1', 2),
            ('1.3', '1', 1),

            ('1.1.1', '1.1', 1),
            ('1.1.2', '1.1', 1),
            ('1.1.3', '1.1', 1),

            ('1.1.1.1', '1.1.1', 4),
            ('1.1.1.2', '1.1.1', 1),

            ('1.1.2.1', '1.1.2', 5),

            ('1.2.1', '1.2', 2),
            ('1.2.2', '1.2', 2),

            ('1.3.1', '1.3', 1),
            ('1.3.2', '1.3', 1),

            ('1.3.2.1', '1.3.2', 1),
            ('1.3.2.1.1', '1.3.2.1', 1),

            ('2.1', '2', 1),
            ('2.2', '2', 1),
            ('2.3', '2', 1),

            ('2.1.1', '2.1', 2),
            ('2.1.2', '2.1', 1),
            ('2.1.3', '2.1', 1),

            ('2.1.2.1', '2.1.2', 1),

            ('2.2.1', '2.2', 1),
            ('2.2.2', '2.2', 1),

            ('2.3.1', '2.3', 1),
            ('2.3.2', '2.3', 1);