SELECT      c.number, c.name, a.number, a.name
FROM        usages INNER JOIN parts c ON parts_number = c.number
            INNER JOIN parts a ON assemblies_parts_number = a.number
ORDER BY assemblies_parts_number, parts_number;

SELECT      p1.name, p2.name
FROM        usages u1 CROSS JOIN usages u2
            INNER JOIN parts p1 ON u1.parts_number = p1.number
            INNER JOIN parts p2 ON u2.parts_number = p2.number
WHERE       u1.assemblies_parts_number = u2.assemblies_parts_number
            AND u1.parts_number < u2.parts_number
ORDER BY    p1.name, p2.name;

SELECT      u1.assemblies_parts_number, a1.name, u1.parts_number, p1.name,
            u2.assemblies_parts_number, a2.name, u2.parts_number, p2.name
FROM        usages u1 INNER JOIN usages u2 USING (quantity)
            INNER JOIN parts a1 ON u1.assemblies_parts_number = a1.number
            INNER JOIN parts p1 ON u1.parts_number = p1.number
            INNER JOIN parts a2 ON u2.assemblies_parts_number = a2.number
            INNER JOIN parts p2 ON u2.parts_number = p2.number
WHERE       (u1.assemblies_parts_number, u1.parts_number) < (u2.assemblies_parts_number, u2.parts_number)
ORDER BY    u1.assemblies_parts_number, u2.assemblies_parts_number;

SELECT      c.number, c.name, a.name
FROM        parts a INNER JOIN usages ON a.number = assemblies_parts_number
            INNER JOIN parts c ON parts_number = c.number
WHERE       a.name = 'Engine'
ORDER BY    c.name;