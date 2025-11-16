# General guide to setup a development environment

## Build dependencies:
* cmake
* gcc or mingw
* curses


### Linux
These are for arch linux, but you'll figure it out for other distros

```bash
sudo pacman -Syu base-devel cmake gcc glibc curses
```

### Windows

## Cloning repo & setting up build system

Clone the repository and submodules
```bash
git clone https://github.com/Mikxus/TT00BT65-3001-capstone-project.git
```

Go to the new directory
```bash
cd TT00BT65-3001-capstone-project
```

Create new directory for build files
```bash
mkdir build
```

Generate out of source build system with cmake. This ensures that all build related files do not litter our source tree.
Debug build switches our debug prints on enabling easier debugging.
```bash
cmake -Bbuild/release -DCMAKE_BUILD_TYPE=Release
# Or debug build
cmake -Bbuild/debug -DCMAKE_BUILD_TYPE=Debug
```

To build the project as release or debug:

```bash
cmake --build build/release --config CMAKE_BUILD_TYPE=Release
 
cmake --build build/debug --config CMAKE_BUILD_TYPE=Debug
```