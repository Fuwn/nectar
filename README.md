<h1 align="center">🍯 Nectar</h1>

<p align="center">
  <b>Command-line <a href="https://www.honeyfeed.fm/">Honeyfeed</a> Reader</b>
</p>

[![asciicast](https://asciinema.org/a/VOYQVTlC7zg1c5OfXhtsz07ed.svg)](https://asciinema.org/a/VOYQVTlC7zg1c5OfXhtsz07ed)

## Installation

### Arch Linux

#### With an AUR-helper

```shell
yay -S nectar
```

#### Manually

```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/nectar.git
cd nectar
makepkg -si
```

### *Building* From Source

[Bashly](https://bashly.dannyb.co/) is required to *build* Nectar.

```shell
git clone https://github.com/Fuwn/nectar.git
cd nectar
bashly generate
./nectar
```

To make Nectar globally accessible, add Nectar to your `PATH` environment variable.

### Pre-*built* Archives

Complete Nectar *builds* can be located in the *[Releases](https://github.com/Fuwn/nectar/releases)* tab.

## Usage

### Dependencies (bundled in AUR)

- [Gum](https://github.com/charmbracelet/gum/)
- [pup](https://github.com/ericchiang/pup)
- [html2md](https://github.com/suntong/html2md)
- [Glow](https://github.com/charmbracelet/glow)

### Help

```
nectar - Command-line Honeyfeed Reader

Usage:
  nectar COMMAND
  nectar [COMMAND] --help | -h
  nectar --version | -v

Commands:
  chapter   Read a chapter directly in your terminal
  novel     Select a chapter to read directly in your terminal
  search    Search and select a novel to read directly in your terminal

Options:
  --help, -h
    Show this help

  --version, -v
    Show version number

```

## License

This project is licensed with the [GNU General Public License v3.0](./LICENSE).
