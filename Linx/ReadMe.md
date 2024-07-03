# Linx

Summit County 911 Center uses [Linx](https://linx.software/) as an easy to use software integration platform for many of our third party interfaces.

## Description

This repository was created to assist and share our integration solutions with other PSAP's who may interface with similar 3rd Party vendors.

## Getting Started

All solutions provided here are managed and configured via the [911Linx] mssql database include within this repository. You will need to execute the tsql scripts to create the database locally before being able to start using the provided linx solutions.

### Dependencies

* Require Linx Server - v5.22 or v6.6 (Version not compatable with eachother, please download solutions from the correct version folder)
* Require MSSQL Server 2012 or Newer

### Installing

* Install Database using provided TSQL (Order: DBCreate,Tables,Views,StoredProcedures,SeedData)
* Install Linx Server and use default port :8080 (if other port is used please update all solution settings and seed data accordingly)
* Login to Linx Server and upload solutions 
* Modify Settings in each solution for your environment
* Any modifications needed to SeedData to fit your deployment

### Executing program

* Enable the soluton once desired modifications are made

## Help

All solutions are integrated with the [911Linx] database and will not work correctly unless accessible.
You will only need to load the SeedData that correlates to the solution(s) your interested in running.


## Authors

Summit County 911 Dispatch Center Dev Team

ex. R Spencer Levin
ex. [@DBA]

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments

* [Linx](https://linx.software/)
