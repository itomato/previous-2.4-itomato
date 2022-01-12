# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.21.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.21.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/me/Code/Previous-tweaks/previous-code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/me/Code/Previous-tweaks/previous-code/build

# Utility rule file for distclean.

# Include any custom commands dependencies for this target.
include CMakeFiles/distclean.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/distclean.dir/progress.make

distclean: CMakeFiles/distclean.dir/build.make
	rm -f config.h
	rm -f install_manifest.txt
	rm -f src/hatari
	rm -f src/cpu/build68k
	rm -f src/cpu/cpudefs.c
	rm -f src/cpu/cpuemu_??.c
	rm -f src/cpu/cpustbl.c
	rm -f src/cpu/cputbl.h
	rm -f src/cpu/gencpu
	rm -f tools/hmsa/hmsa
	find . -depth -name CMakeFiles | xargs rm -rf
	find . -depth -name CMakeCache.txt | xargs rm -rf
	find . -depth -name '*.a' | xargs rm -rf
	find . -depth -name '*.1.gz' | xargs rm -rf
	find . -depth -name cmake_install.cmake | xargs rm -rf
	find . -depth -name Makefile | xargs rm -rf
.PHONY : distclean

# Rule to build all files generated by this target.
CMakeFiles/distclean.dir/build: distclean
.PHONY : CMakeFiles/distclean.dir/build

CMakeFiles/distclean.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/distclean.dir/cmake_clean.cmake
.PHONY : CMakeFiles/distclean.dir/clean

CMakeFiles/distclean.dir/depend:
	cd /Users/me/Code/Previous-tweaks/previous-code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/me/Code/Previous-tweaks/previous-code /Users/me/Code/Previous-tweaks/previous-code /Users/me/Code/Previous-tweaks/previous-code/build /Users/me/Code/Previous-tweaks/previous-code/build /Users/me/Code/Previous-tweaks/previous-code/build/CMakeFiles/distclean.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/distclean.dir/depend

