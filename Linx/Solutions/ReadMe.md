# Linx

## Solutions (Common)

For maintainability several solutions were created to contain common functionality that could be used by other solutions:

* 911Linx - This solution contains functions for getting/setting data in the [911Linx] database. (ex. getting/setting solution credentials)
* 911DataServices - This solution contains functions for retrieving data from other systems. (ex. getting Incident records from CAD)

### Dependencies

__Core__
* Require Linx Server - v5.22
* Require MSSQL Server 2012 or Newer
* Require __911Linx__ Database
* Require __911Linx__ Solution
* Require __911DataServices__ Solution

### Installing

* Install Database using provided TSQL (Order: DBCreate,Tables,Views,StoredProcedures,SeedData)
* Perform any modifications needed to SeedData to fit your deployment
* Install SeedData for the above solution dependencies
* Install Linx Server and use default port :8080 (if other port is used please update all solution settings and seed data accordingly)
* Login to Linx Server and upload solutions 
* Modify Settings in each solution for your environment

### Executing program

* Enable the _core_ solutons once desired modifications are made

## Help

All solutions are integrated with the [911Linx] database and will not work correctly unless accessible.
You will only need to load the SeedData that correlates to the solution(s) your interested in running.

## Authors

Summit County 911 Dispatch Center Dev Team

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments

* [Linx](https://linx.software/)
