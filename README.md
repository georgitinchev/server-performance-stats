# Server Performance Stats Script

**Project Reference:** [Server Performance Stats](https://...)

## Overview

`server-stats.sh` is a Bash script designed to analyze server performance statistics. It provides essential metrics for server resource utilization, helping administrators and developers understand and debug performance issues effectively.

---

## Features

- **CPU Usage**
  - Displays total CPU usage in percentage.

- **Memory Usage**
  - Reports used and free memory, including percentage breakdown.

- **Disk Usage**
  - Shows used and free disk space with percentage details.

- **Top Processes by CPU**
  - Lists the top 5 processes consuming the most CPU resources.

- **Top Processes by Memory**
  - Lists the top 5 processes consuming the most memory.

---

## Stretch Goals

Optionally, this script can include additional stats such as:

- **OS Version**
  - Displays the operating system version.

- **Uptime**
  - Shows how long the system has been running.

- **Load Average**
  - Reports the system's load average.

- **Logged-In Users**
  - Lists active users currently logged into the system.

- **Failed Login Attempts**
  - Displays the number of recent failed login attempts for security monitoring.

---

## Usage

1. Download the script:

2. Make the script executable:
   - chmod +x server-stats.sh

3. Run the script
   - ./server-stats.sh

## Prerequisites

- Linux-based server

- Bash shell (v4.0 or higher)

- Basic understanding of Linux commands
