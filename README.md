LEARNING-PROLOG 

In this repository, a declarative logic programming project built using SWI-Prolog and gets executed.

FEATURES:

 * Knowledge Base: Defines domain-specific facts and data structures.
 * Logical Inference: Implements rules for automated reasoning and query resolution.
 * Interactive CLI Execution: Runs seamlessly via the SWI-Prolog terminal interpreter.
 * Version Controlled: Tracked and managed using Git and GitHub.
   
PREREQUISITES:

Ensure the following tools are installed on your environment:
 * SWI-Prolog (v8.0 or higher) — Added to system PATH.
 * Git — For source control.
 * Visual Studio Code — Recommended editor (with the Prolog syntax extension).
Installation & Setup
 * Clone the Repository:
   git clone https://github.com/your-username/repository-name.git
cd repository-name

 * Verify SWI-Prolog Installation:
   swipl --version



HOW TO INSTALL IN WINDOWS : 

SWI-Prolog:
Download the 64-bit Windows installer from swi-prolog.org.
Run the setup wizard and ensure "Add swipl to the system PATH" is selected.
Git & VS Code:
Download and install Git from git-scm.com.
Install Visual Studio Code and add the Prolog extension for syntax formatting.

USAGE:

1. Launching the Program
Navigate to the project directory and load your primary Prolog source file:
swipl main.pl
2. Executing Queries
Once the Prolog prompt (?-) appears, enter your queries. Always end queries with a period (.).
% Example Query
?- rule_name(Input, Result).
% Exit SWI-Prolog
?- halt.

PROJECT OVERVIEW:

A simple Prolog system to match lost items on campus with found items using attribute matching and nearby locations.

Features

Search & Claim: Search by Category, Color, and Location to get immediate claim details.

Smart Location Matching: Finds items lost in nearby areas (e.g., lost in Cafeteria, turned in at Student Center).

Live Database: Add new found items to the database at runtime.
