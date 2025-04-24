# 🔍 Directory Enumeration Script

**Author:** Chris Garey  
**Date:** 2024  
**Repository:** [BadUSB-Scripts](https://github.com/cgarey2014/BadUSB-Scripts)  
**Category:** Security / Penetration Testing / Directory Enumeration

---

## 📜 Description

This bash script automates the process of **directory enumeration** for a given URL using a wordlist. It attempts to find valid directories by making HTTP requests and checking the responses. The script supports basic verbosity, showing the HTTP response codes and the status of each directory being tested.

It’s designed to assist penetration testers and security researchers with the discovery of hidden or restricted directories on web servers. The script outputs the found directories and provides real-time feedback about the status of each attempt.

---

## ⚙️ Script Overview

### **directory_enumeration.sh**
   - **Description:** This script checks for valid directories on a web server by attempting HTTP requests with directory names from a given wordlist.
   - **Target:** Linux / macOS (with curl and grep installed)
   - **Key Features:**
     - **Verbose Mode:** Shows HTTP response codes for each request.
     - **Spinner:** Displays a progress spinner while performing the enumeration.
     - **Status Codes:** Highlights directories that return a **200** (OK) status, indicating they exist.
     - **Exit Status:** Reports missing dependencies (curl, grep) if not installed.

---

## 🚨 Disclaimer

**This script is intended for authorized use only.**  
**Ensure you have explicit permission before running it on any system or network. Unauthorized scanning may be illegal.**

The author assumes no responsibility for the misuse of this tool.

---

## 🛠️ Requirements

- **Operating System:** Linux or macOS
- **Dependencies:**
  - `curl`: For making HTTP requests.
  - `grep`: For searching through command output.
- **Wordlist:** A text file containing potential directory names to test (one per line).

---

## 🧠 Usage

### **Basic Usage:**

```bash
$ ./directory_enumeration.sh -u <url> -w <wordlist>
```

**-u <url>**: The base URL for the directory enumeration (e.g., http://example.com).

**-w <wordlist>**: Path to the wordlist file containing directory names to test.

**-v**: (Optional) Enable verbose mode, which shows HTTP response codes and the URLs being tested.

Example:
```bash
$ ./directory_enumeration.sh -u http://example.com -w /path/to/wordlist.txt
```

This will test all directories in the wordlist against the provided URL.

**Verbose Mode:**
To enable verbose output, use the -v flag. This will display HTTP status codes for each request.

```bash
$ ./directory_enumeration.sh -u http://example.com -w /path/to/wordlist.txt -v
```

## 📌 License
This project is distributed for educational purposes under the MIT License.
