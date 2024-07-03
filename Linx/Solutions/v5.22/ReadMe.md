# Linx v5.22

## Solutions (Common)

For maintainability several solutions were created to contain common functionality that could be used by other solutions:

* 911Linx - This solution contains functions for getting/setting data in the [911Linx] database. (ex. getting/setting solution credentials)
* 911DataServices - This solution contains functions for retrieving data from other systems. (ex. getting Incident records from CAD)

## Solution - CodeRed

CodeRed is a reverse 911 notification system that supports multiple forms of transport media (SMS,Email,Voice,Mobile). The CodeRed solution facilitates handling a message request (see _data dictionary_) by parsing an xml or json payload and building the necessary CodeRed notification components to compose and launch a codered message.
It currently supports the QuickLaunch, Tone, and Scenario notification types along with SMS,Email,Voice,Mobile notification mediums.

####Additional Installation
* If not using the C2C acknowledgment workflow you can skip installing the __APIC2C__ solution followed by removing the _SendAck_ and _SendUpdate_ functions from the _ProcessMessageCodeRed_ function in the 911CodeRed solution.
* If not using the __911DataServices__ solution, you will need to replace the _RESTRequest_ found in Main->Process->Helpers->_Replace_Message_Body_Incident_Detail function with a _ExecuteSQL_ database plugin in the Linx designer in order to fetch your desired Incident record.

## Solution - New World Systems (NWS)

New World Systems is a Law/Fire RMS system (now owned by Tyler Technologies) that is either integrated with their NWS CAD product or can be integrated using their Ineroperability Engine (IOE). This solution takes advantage of the IOE interface by handling a timestamp request for a datetime period to fetch _closed_ incidents from CAD and exporting them as xml to a fileshare that IOE is monitoring.

We use a utility server that executes a powershell.exe command using the Invoke_WebRequest commandlet on a 1 minute schedule to make the timestamp request.

__Additional Installation__
* Update the sql query under Database->Process->SqlIncidentsByCriteria
* Update the sql query under Database->Process->SqlIncidentByIncidentNumber

## Solution - First Due

First Due is an online Pre-Planner application used by fire fighters. They have an incident dashboard that can take live incident data and overlay any provisioned pre-planning done by that organization. This solution extracts _live_ incident data from CAD and publishes it to the FirstDue API for realtime use.

__Additional Installation__
* Update the sql query under Database->Process->SqlIncidentsByCriteria
* Update the sql query under Database->Process->SqlIncidentByIncidentNumber

## Solution - Courts (Pioneer)

Pioneer is a judicial management application for tickets/citations issues by a municipality. This solution is a GUI wrapper for a powershell script that extracts and submits tickets/citations to the Pioneer API. In this manner the interface can be manually executed to perform one-off or bulk citation exports, as well as be executed on an automatic schedule by using services like Windows Task Schedular.

__Additional Installation__
* You will have to provide the powershell script to be executed by this solution and wire it in using the solution __Settings__.

### Dependencies

__Core__
* Require Linx Server - v5.22
* Require MSSQL Server 2012 or Newer
* Require __911Linx__ Database
* Require __911Linx__ Solution
* Require __911DataServices__ Solution

__CodeRed__
* __CORE__
* Require __911CodeRed__ Solution
* Require __APICodeRed__ Solution
* Require __APIC2C__ Solution

__FirstDue__
* __CORE__
* Require __911FirstDue__ Solution
* Require __APIFirstDue__ Solution

### Installing

* Install Database using provided TSQL (Order: DBCreate,Tables,Views,StoredProcedures,SeedData)
* Perform any modifications needed to SeedData to fit your deployment
* Install SeedData for the above solution dependencies
* Install Linx Server and use default port :8080 (if other port is used please update all solution settings and seed data accordingly)
* Login to Linx Server and upload solutions 
* Modify Settings in each solution for your environment

### Executing program

* Enable the _core_ solutons once desired modifications are made
* Enable the _applicable_ solutions once the desired modifications are made

## Help

All solutions are integrated with the [911Linx] database and will not work correctly unless accessible.
You will only need to load the SeedData that correlates to the solution(s) your interested in running.

## Authors

Summit County 911 Dispatch Center Dev Team

R Spencer Levin
[DBA]

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments

* [Linx](https://linx.software/)
