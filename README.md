# Motorcycle Bill of Materials Database

A relational database project in PostgreSQL for modeling a motorcycle bill of materials (BOM). The schema supports assembly structures, purchased components, vendor relationships, and part usage quantities, enabling structured querying of component hierarchies and assembly composition.

## Project Structure

- `schema/` — table definitions and relational constraints
- `data/` — sample data population scripts
- `queries/` — SQL queries for BOM analysis and reporting

## Schema Overview

The database is organized around the following entities:

- `parts` — master list of all parts
- `assemblies` — parts that function as assemblies
- `piece_parts` — externally sourced components
- `vendors` — supplier reference data
- `usages` — assembly-to-component relationships with quantity

## Setup

Run the SQL files in the following order:

1. `schema/create_tables.sql`
2. `data/insert_data.sql`
3. desired files in `queries/`

## Included Query Examples

The project includes example queries for:

- tracing parent-child part relationships
- identifying components that belong to the same assembly
- comparing usage relationships by quantity
- retrieving components directly associated with a given assembly

## Purpose

This project demonstrates relational data modeling, normalized schema design, and SQL querying patterns for working with structured manufacturing and assembly data.