#!/bin/bash

# Check if curl and grep are installed
if ! command -v curl &> /dev/null || ! command -v grep &> /dev/null; then
    echo "Error: curl and grep are required but not installed."
    exit 1
fi

# Color definitions
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# Usage function
usage() {
    echo "Usage: $0 -u <url> -w <wordlist> [-v]"
    echo "  -u <url>      Base URL for directory enumeration (e.g., http://example.com)"
    echo "  -w <wordlist> Path to the wordlist file"
    echo "  -v            Enable verbose mode"
    exit 1
}

# Parse command-line options
while getopts ":u:w:v" opt; do
    case ${opt} in
        u )
            base_url=$OPTARG
            ;;
        w )
            wordlist=$OPTARG
            ;;
        v )
            verbose=true
            ;;
        \? )
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Validate inputs
if [ -z "$base_url" ] || [ -z "$wordlist" ]; then
    usage
fi

# Arrays to store found directories
found_dirs=()

# Initialize spinner
spinner() {
    local delay=0.1
    local spinstr='|/-\'
    while :; do
        for s in $spinstr; do
            echo -ne "${YELLOW}${s}\r"
            sleep $delay
        done
    done
}

# Start spinner in the background
spinner_pid=$!

# Perform directory enumeration
total_lines=$(wc -l < "$wordlist")
current_line=0

while IFS= read -r word; do
    url="${base_url}/${word}"
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

    if [ "$verbose" = true ]; then
        echo -e "${YELLOW}[${response}] ${url}${RESET}"
    fi

    case $response in
        200)
            echo -e "${GREEN}[200] ${url}${RESET}"
            found_dirs+=("$url")
            ;;
        403)
            echo -e "${RED}[403] ${url}${RESET}"
            ;;
        *)
            ;;
    esac

    # Update progress
    current_line=$((current_line + 1))
    progress=$((current_line * 100 / total_lines))
    echo -ne "${YELLOW}Progress: ${progress}%\r"
done < "$wordlist"



echo -e "${YELLOW}Enumeration completed.${RESET}"
