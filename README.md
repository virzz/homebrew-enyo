# Homebrew Tap for Enyo

[Enyo](https://github.com/virzz/enyo-rs) - The Cyber Swiss Army Knife for terminal.

A Rust-based terminal toolkit providing various CLI utilities including encoding/decoding, hash calculation, JWT handling, network tools, and more.

## Installation

```bash
brew install virzz/enyo/enyo
```

Or tap first:

```bash
brew tap virzz/enyo
brew install enyo
```

## Upgrade

```bash
brew upgrade enyo
```

## Uninstall

```bash
brew uninstall enyo
brew untap virzz/enyo  # Optional: remove the tap
```

## Features

- **Base Encoding**: Base16/32/58/62/64/91 encoding and decoding
- **Hash Tools**: MD4/MD5/SHA1/SHA256/SHA512/RIPEMD and more
- **JWT Tool**: JWT token parsing and manipulation
- **Gopher Protocol**: Gopher protocol utilities
- **URL Encoding**: URL encode/decode utilities
- **And more...**

## Usage

```bash
# Show help
enyo --help

# Show version
enyo --version

# Example: Base64 encode
echo "Hello World" | enyo basex b64e

# Example: Calculate MD5 hash
echo "test" | enyo hash md5
```

## Shell Completions

Enyo supports shell completions for bash, zsh, and fish. After installation, completions are automatically installed.

## Documentation

- [Enyo Repository](https://github.com/virzz/enyo-rs)
- [Homebrew Documentation](https://docs.brew.sh)

## License

MIT License
