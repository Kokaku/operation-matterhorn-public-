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

# Include any dependencies generated for this target.
include CMakeFiles/project-matterhorn.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/project-matterhorn.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/project-matterhorn.dir/flags.make

CMakeFiles/project-matterhorn.dir/Window.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/Window.cpp.o: Window.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/Window.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/Window.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Window.cpp

CMakeFiles/project-matterhorn.dir/Window.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/Window.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Window.cpp > CMakeFiles/project-matterhorn.dir/Window.cpp.i

CMakeFiles/project-matterhorn.dir/Window.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/Window.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Window.cpp -o CMakeFiles/project-matterhorn.dir/Window.cpp.s

CMakeFiles/project-matterhorn.dir/Window.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/Window.cpp.o.requires

CMakeFiles/project-matterhorn.dir/Window.cpp.o.provides: CMakeFiles/project-matterhorn.dir/Window.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/Window.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/Window.cpp.o.provides

CMakeFiles/project-matterhorn.dir/Window.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/Window.cpp.o

CMakeFiles/project-matterhorn.dir/Texture.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/Texture.cpp.o: Texture.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/Texture.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/Texture.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Texture.cpp

CMakeFiles/project-matterhorn.dir/Texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/Texture.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Texture.cpp > CMakeFiles/project-matterhorn.dir/Texture.cpp.i

CMakeFiles/project-matterhorn.dir/Texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/Texture.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Texture.cpp -o CMakeFiles/project-matterhorn.dir/Texture.cpp.s

CMakeFiles/project-matterhorn.dir/Texture.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/Texture.cpp.o.requires

CMakeFiles/project-matterhorn.dir/Texture.cpp.o.provides: CMakeFiles/project-matterhorn.dir/Texture.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/Texture.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/Texture.cpp.o.provides

CMakeFiles/project-matterhorn.dir/Texture.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/Texture.cpp.o

CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o: HeightMap.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/HeightMap.cpp

CMakeFiles/project-matterhorn.dir/HeightMap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/HeightMap.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/HeightMap.cpp > CMakeFiles/project-matterhorn.dir/HeightMap.cpp.i

CMakeFiles/project-matterhorn.dir/HeightMap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/HeightMap.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/HeightMap.cpp -o CMakeFiles/project-matterhorn.dir/HeightMap.cpp.s

CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.requires

CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.provides: CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.provides

CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o

CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o: CameraPath.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CameraPath.cpp

CMakeFiles/project-matterhorn.dir/CameraPath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/CameraPath.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CameraPath.cpp > CMakeFiles/project-matterhorn.dir/CameraPath.cpp.i

CMakeFiles/project-matterhorn.dir/CameraPath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/CameraPath.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CameraPath.cpp -o CMakeFiles/project-matterhorn.dir/CameraPath.cpp.s

CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.requires

CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.provides: CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.provides

CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o

CMakeFiles/project-matterhorn.dir/Skybox.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/Skybox.cpp.o: Skybox.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/Skybox.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/Skybox.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Skybox.cpp

CMakeFiles/project-matterhorn.dir/Skybox.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/Skybox.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Skybox.cpp > CMakeFiles/project-matterhorn.dir/Skybox.cpp.i

CMakeFiles/project-matterhorn.dir/Skybox.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/Skybox.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Skybox.cpp -o CMakeFiles/project-matterhorn.dir/Skybox.cpp.s

CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.requires

CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.provides: CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.provides

CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/Skybox.cpp.o

CMakeFiles/project-matterhorn.dir/Grid.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/Grid.cpp.o: Grid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/Grid.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/Grid.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Grid.cpp

CMakeFiles/project-matterhorn.dir/Grid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/Grid.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Grid.cpp > CMakeFiles/project-matterhorn.dir/Grid.cpp.i

CMakeFiles/project-matterhorn.dir/Grid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/Grid.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Grid.cpp -o CMakeFiles/project-matterhorn.dir/Grid.cpp.s

CMakeFiles/project-matterhorn.dir/Grid.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/Grid.cpp.o.requires

CMakeFiles/project-matterhorn.dir/Grid.cpp.o.provides: CMakeFiles/project-matterhorn.dir/Grid.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/Grid.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/Grid.cpp.o.provides

CMakeFiles/project-matterhorn.dir/Grid.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/Grid.cpp.o

CMakeFiles/project-matterhorn.dir/Shader.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/Shader.cpp.o: Shader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/Shader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/Shader.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Shader.cpp

CMakeFiles/project-matterhorn.dir/Shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/Shader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Shader.cpp > CMakeFiles/project-matterhorn.dir/Shader.cpp.i

CMakeFiles/project-matterhorn.dir/Shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/Shader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Shader.cpp -o CMakeFiles/project-matterhorn.dir/Shader.cpp.s

CMakeFiles/project-matterhorn.dir/Shader.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/Shader.cpp.o.requires

CMakeFiles/project-matterhorn.dir/Shader.cpp.o.provides: CMakeFiles/project-matterhorn.dir/Shader.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/Shader.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/Shader.cpp.o.provides

CMakeFiles/project-matterhorn.dir/Shader.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/Shader.cpp.o

CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o: ShaderProgram.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/ShaderProgram.cpp

CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/ShaderProgram.cpp > CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.i

CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/ShaderProgram.cpp -o CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.s

CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.requires

CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.provides: CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.provides

CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o

CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o: ShadowMap.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/ShadowMap.cpp

CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/ShadowMap.cpp > CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.i

CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/ShadowMap.cpp -o CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.s

CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.requires

CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.provides: CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.provides

CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o

CMakeFiles/project-matterhorn.dir/Camera.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/Camera.cpp.o: Camera.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/Camera.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/Camera.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Camera.cpp

CMakeFiles/project-matterhorn.dir/Camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/Camera.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Camera.cpp > CMakeFiles/project-matterhorn.dir/Camera.cpp.i

CMakeFiles/project-matterhorn.dir/Camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/Camera.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/Camera.cpp -o CMakeFiles/project-matterhorn.dir/Camera.cpp.s

CMakeFiles/project-matterhorn.dir/Camera.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/Camera.cpp.o.requires

CMakeFiles/project-matterhorn.dir/Camera.cpp.o.provides: CMakeFiles/project-matterhorn.dir/Camera.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/Camera.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/Camera.cpp.o.provides

CMakeFiles/project-matterhorn.dir/Camera.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/Camera.cpp.o

CMakeFiles/project-matterhorn.dir/main.cpp.o: CMakeFiles/project-matterhorn.dir/flags.make
CMakeFiles/project-matterhorn.dir/main.cpp.o: main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/project-matterhorn.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/project-matterhorn.dir/main.cpp.o -c /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/main.cpp

CMakeFiles/project-matterhorn.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project-matterhorn.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/main.cpp > CMakeFiles/project-matterhorn.dir/main.cpp.i

CMakeFiles/project-matterhorn.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project-matterhorn.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/main.cpp -o CMakeFiles/project-matterhorn.dir/main.cpp.s

CMakeFiles/project-matterhorn.dir/main.cpp.o.requires:
.PHONY : CMakeFiles/project-matterhorn.dir/main.cpp.o.requires

CMakeFiles/project-matterhorn.dir/main.cpp.o.provides: CMakeFiles/project-matterhorn.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/project-matterhorn.dir/build.make CMakeFiles/project-matterhorn.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/project-matterhorn.dir/main.cpp.o.provides

CMakeFiles/project-matterhorn.dir/main.cpp.o.provides.build: CMakeFiles/project-matterhorn.dir/main.cpp.o

# Object files for target project-matterhorn
project__matterhorn_OBJECTS = \
"CMakeFiles/project-matterhorn.dir/Window.cpp.o" \
"CMakeFiles/project-matterhorn.dir/Texture.cpp.o" \
"CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o" \
"CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o" \
"CMakeFiles/project-matterhorn.dir/Skybox.cpp.o" \
"CMakeFiles/project-matterhorn.dir/Grid.cpp.o" \
"CMakeFiles/project-matterhorn.dir/Shader.cpp.o" \
"CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o" \
"CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o" \
"CMakeFiles/project-matterhorn.dir/Camera.cpp.o" \
"CMakeFiles/project-matterhorn.dir/main.cpp.o"

# External object files for target project-matterhorn
project__matterhorn_EXTERNAL_OBJECTS =

project-matterhorn: CMakeFiles/project-matterhorn.dir/Window.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/Texture.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/Skybox.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/Grid.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/Shader.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/Camera.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/main.cpp.o
project-matterhorn: CMakeFiles/project-matterhorn.dir/build.make
project-matterhorn: /usr/local/lib/libglfw.dylib
project-matterhorn: /usr/local/lib/libGLEW.dylib
project-matterhorn: CMakeFiles/project-matterhorn.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable project-matterhorn"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/project-matterhorn.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/grass.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/grass.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/rock.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/rock.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/snow.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/snow.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/sand.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/sand.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/skybox_xneg.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/skybox_xneg.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/skybox_xpos.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/skybox_xpos.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/skybox_yneg.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/skybox_yneg.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/skybox_ypos.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/skybox_ypos.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/skybox_zneg.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/skybox_zneg.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying textures/skybox_zpos.tga to /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn"
	/usr/local/Cellar/cmake/3.0.0/bin/cmake -E copy textures/skybox_zpos.tga /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn

# Rule to build all files generated by this target.
CMakeFiles/project-matterhorn.dir/build: project-matterhorn
.PHONY : CMakeFiles/project-matterhorn.dir/build

CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/Window.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/Texture.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/HeightMap.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/CameraPath.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/Skybox.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/Grid.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/Shader.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/ShaderProgram.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/ShadowMap.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/Camera.cpp.o.requires
CMakeFiles/project-matterhorn.dir/requires: CMakeFiles/project-matterhorn.dir/main.cpp.o.requires
.PHONY : CMakeFiles/project-matterhorn.dir/requires

CMakeFiles/project-matterhorn.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/project-matterhorn.dir/cmake_clean.cmake
.PHONY : CMakeFiles/project-matterhorn.dir/clean

CMakeFiles/project-matterhorn.dir/depend:
	cd /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn /Users/Kokaku/Documents/EPFL/ba6/compgraph/project/operation-matterhorn/CMakeFiles/project-matterhorn.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/project-matterhorn.dir/depend

