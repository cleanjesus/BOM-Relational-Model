-- Question 1
SELECT      c.number, c.name, a.number, a.name
FROM        usages INNER JOIN parts c ON parts_number = c.number
            INNER JOIN parts a ON assemblies_parts_number = a.number
ORDER BY    assemblies_parts_number, parts_number;

-- Question 2
SELECT      p1.name, p2.name
FROM        usages u1 CROSS JOIN usages u2
            INNER JOIN parts p1 ON u1.parts_number = p1.number
            INNER JOIN parts p2 ON u2.parts_number = p2.number
WHERE       u1.assemblies_parts_number = u2.assemblies_parts_number
            AND u1.parts_number < u2.parts_number
ORDER BY    p1.name, p2.name;

-- Question 3
SELECT      u1.assemblies_parts_number, a1.name, u1.parts_number, p1.name,
            u2.assemblies_parts_number, a2.name, u2.parts_number, p2.name
FROM        usages u1 INNER JOIN usages u2 USING (quantity)
            INNER JOIN parts a1 ON u1.assemblies_parts_number = a1.number
            INNER JOIN parts p1 ON u1.parts_number = p1.number
            INNER JOIN parts a2 ON u2.assemblies_parts_number = a2.number
            INNER JOIN parts p2 ON u2.parts_number = p2.number
WHERE       (u1.assemblies_parts_number, u1.parts_number) < (u2.assemblies_parts_number, u2.parts_number)
ORDER BY    u1.assemblies_parts_number, u2.assemblies_parts_number;

-- Question 4
SELECT      c.number, c.name
FROM        parts a INNER JOIN usages ON a.number = assemblies_parts_number
            INNER JOIN parts c ON parts_number = c.number
WHERE       a.name = 'Engine'
ORDER BY    c.name;

-- Question 5
SELECT      p2.number, p2.name
FROM        parts e INNER JOIN usages u1 on e.number = u1.assemblies_parts_number
            INNER JOIN parts p1 ON u1.parts_number = p1.number
            INNER JOIN usages u2 ON p1.number = u2.assemblies_parts_number
            INNER JOIN parts p2 on u2.parts_number = p2.number
WHERE       e.name = 'Engine'
ORDER BY    p2.name;

-- Question 6
SELECT      p3.number, p3.name
FROM        parts e INNER JOIN usages u1 on e.number = u1.assemblies_parts_number
            INNER JOIN parts p1 on u1.parts_number = p1.number
            INNER JOIN usages u2 on p1.number = u2.assemblies_parts_number
            INNER JOIN parts p2 on u2.parts_number = p2.number
            INNER JOIN usages u3 on p2.number = u3.assemblies_parts_number
            INNER JOIN parts p3 on u3.parts_number = p3.number
WHERE       e.name = 'Engine'
ORDER BY    p3.name;

-- Question 7
SELECT      name, number, component_count
FROM        (
                SELECT      name, number, COUNT(parts_number) AS component_count
                FROM        parts INNER JOIN usages ON number = assemblies_parts_number
                GROUP BY    name, number
            )   AS   assembly_counts
WHERE       component_count = (
                SELECT      MAX(component_count)
                FROM        (
                                SELECT COUNT(parts_number) AS component_count
                                FROM usages
                                GROUP BY assemblies_parts_number
                            )   AS max_count
            );

-- Question 8 Subquery
SELECT      name, number, component_quantity
FROM        (
                SELECT      name, number, SUM(quantity) AS component_quantity
                FROM        parts INNER JOIN usages ON number = assemblies_parts_number
                GROUP BY    name, number
            )   AS cq
WHERE       component_quantity = (
                SELECT      MAX(component_quantity)
                FROM        (
                                SELECT SUM(quantity) AS component_quantity
                                FROM usages
                                GROUP BY assemblies_parts_number
                            )   AS max_quantity
            );

-- Question 8 CTE
WITH        AssemblyTotal AS (
                SELECT      name, number, SUM(quantity) AS total_quantity
                FROM        parts INNER JOIN usages ON number = assemblies_parts_number
                GROUP BY    name, number
)
SELECT      name, number, total_quantity
FROM        AssemblyTotal
WHERE       total_quantity = (
                SELECT MAX(total_quantity)
                FROM AssemblyTotal
            );

-- Question 9 EXCEPT
SELECT      name, number
FROM        parts
EXCEPT
SELECT      name, parts_number
FROM        parts INNER JOIN usages ON number = parts_number
WHERE       assemblies_parts_number IN (
                SELECT      parts_number
                FROM        usages INNER JOIN parts ON assemblies_parts_number = number
                WHERE       name = 'Transmission'
            )
ORDER BY    number;

-- Question 9 NOT IN
SELECT      name, number
FROM        parts
WHERE       number NOT IN (
                SELECT      parts_number
                FROM        usages
                WHERE       assemblies_parts_number IN (
                                SELECT  parts_number
                                FROM    usages
                                JOIN    parts ON assemblies_parts_number = number
                                WHERE   name = 'Transmission'
                            )
            )
ORDER BY    number;