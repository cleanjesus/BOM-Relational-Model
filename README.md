# Motorcycle Bill of Materials Database

A PostgreSQL project for modeling a motorcycle bill of materials (BOM) using a relational schema. The database supports assembly structures, purchased components, vendor relationships, and part usage quantities, enabling structured querying of component hierarchies and assembly composition.

## Project Structure

- `schema/tables.sql` — table definitions and relational constraints
- `data/inserts.sql` — sample data population script
- `Queries.sql` — SQL queries for BOM analysis and reporting

## Schema Overview

The database is organized around the following entities:

- `parts` — master list of all parts
- `assemblies` — parts that function as assemblies
- `piece_parts` — externally sourced components
- `vendors` — supplier reference data
- `usages` — assembly-to-component relationships with quantity

## Setup

Run the SQL files in the following order:

1. `schema/tables.sql`
2. `data/inserts.sql`
3. `Queries.sql`

## Included Query Examples

The project includes example queries for:

- tracing parent-child part relationships
- identifying components that belong to the same assembly
- comparing usage relationships by quantity
- retrieving components directly associated with a given assembly

## Purpose

This project demonstrates relational data modeling, normalized schema design, and SQL querying patterns for working with structured manufacturing and assembly data.