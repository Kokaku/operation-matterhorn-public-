# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.0.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.0.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn

# Utility rule file for stringify_project-matterhorn_water_vshader.

# Include the progress variables for this target.
include CMakeFiles/stringify_project-matterhorn_water_vshader.dir/progress.make

CMakeFiles/stringify_project-matterhorn_water_vshader: water_vshader.h

water_vshader.h: water_vshader.glsl
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Converting water_vshader.glsl to a char* in water_vshader.h"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -DSHADERNAME=water_vshader -DINPUT_DIR=/Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn -DOUTPUT_DIR=/Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn -P /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/common/stringify_shader.cmake

stringify_project-matterhorn_water_vshader: CMakeFiles/stringify_project-matterhorn_water_vshader
stringify_project-matterhorn_water_vshader: water_vshader.h
stringify_project-matterhorn_water_vshader: CMakeFiles/stringify_project-matterhorn_water_vshader.dir/build.make
.PHONY : stringify_project-matterhorn_water_vshader

# Rule to build all files generated by this target.
CMakeFiles/stringify_project-matterhorn_water_vshader.dir/build: stringify_project-matterhorn_water_vshader
.PHONY : CMakeFiles/stringify_project-matterhorn_water_vshader.dir/build

CMakeFiles/stringify_project-matterhorn_water_vshader.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/stringify_project-matterhorn_water_vshader.dir/cmake_clean.cmake
.PHONY : CMakeFiles/stringify_project-matterhorn_water_vshader.dir/clean

CMakeFiles/stringify_project-matterhorn_water_vshader.dir/depend:
	cd /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles/stringify_project-matterhorn_water_vshader.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/stringify_project-matterhorn_water_vshader.dir/depend

