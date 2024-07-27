# Enumeration Buster

Enumeration Buster is a directory enumeration script that performs HTTP requests based on a supplied wordlist to discover accessible directories. It includes a spinner progress indicator and optional verbose mode.

## Requirements

- curl
- grep

## Usage

1. Clone the repository:

    ```sh
    git clone https://github.com/cgarey2014/Enumeration-Buster.git
    cd Enumeration-Buster
    ```

2. Make the script executable:

    ```sh
    chmod +x dir_enum.sh
    ```

3. Run the script:

    ```sh
    ./dir_enum.sh -u <url> -w <wordlist> [-v]
    ```

    - `-u <url>`: Base URL for directory enumeration (e.g., http://example.com)
    - `-w <wordlist>`: Path to the wordlist file
    - `-v`: Enable verbose mode (optional)

## Adding to PATH

To run `dir_enum.sh` from anywhere in your terminal, you need to add the script to your PATH.

1. Move the script to a directory that is already in your PATH, such as `/usr/local/bin`:

    ```sh
    sudo mv dir_enum.sh /usr/local/bin/
    ```

2. Alternatively, you can add the directory containing the script to your PATH. Add the following line to your `~/.bashrc`, `~/.zshrc`, or the appropriate configuration file for your shell:

    ```sh
    export PATH=$PATH:/path/to/Enumeration-Buster
    ```

    Replace `/path/to/Enumeration-Buster` with the actual path to the directory containing `dir_enum.sh`.

3. Reload your shell configuration:

    ```sh
    source ~/.bashrc
    # or
    source ~/.zshrc
    ```

## Example

```sh
dir_enum.sh -u http://example.com -w wordlist.txt -v
```

## Features
- Directory enumeration based on a supplied wordlist.
- Displays HTTP response codes.
- Verbose mode to show all attempted URLs and their response codes.
- Spinner progress indicator.
- Highlighted output for found directories.

##Author
Chris Garey

License
This project is licensed under the MIT License - see the LICENSE file for details.
