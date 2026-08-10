# learning-prolog

In this repository, a declarative logic programming project built using SWI-Prolog and gets executed.

Features
 * Knowledge Base: Defines domain-specific facts and data structures.
 * Logical Inference: Implements rules for automated reasoning and query resolution.
 * Interactive CLI Execution: Runs seamlessly via the SWI-Prolog terminal interpreter.
 * Version Controlled: Tracked and managed using Git and GitHub.
   
Prerequisites
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

Usage
1. Launching the Program
Navigate to the project directory and load your primary Prolog source file:
swipl main.pl

2. Executing Queries
Once the Prolog prompt (?-) appears, enter your queries. Always end queries with a period (.).
% Example Query
?- rule_name(Input, Result).

% Exit SWI-Prolog
?- halt.

Git Workflow Reference
Standard Git commands used to stage, commit, and update the repository:
# Check status of modified files
git status

# Stage specific source files
git add file_name.pl

# Commit staged changes with a descriptive message
git commit -m "Add descriptive commit message here"

# Push updates to the main remote branch
git push origin main

Repository Structure
repository-name/
│
├── main.pl           # Core Prolog source code (facts & rules)
├── README.md         # Project documentation
└── .gitignore        # Specifies untracked files to ignore


# How to Install in Windows 
SWI-Prolog:
Download the 64-bit Windows installer from swi-prolog.org.
Run the setup wizard and ensure "Add swipl to the system PATH" is selected.
Git & VS Code:
Download and install Git from git-scm.com.
Install Visual Studio Code and add the Prolog extension for syntax formatting.
