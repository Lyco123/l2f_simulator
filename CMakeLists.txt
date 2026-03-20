cmake_minimum_required(VERSION 3.16)
cmake_policy(SET CMP0003 NEW)

project(learning_to_fly)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# This project currently only builds tests; keep root build minimal.
# Enable TensorBoard support only when Protobuf is available.
if(APPLE)
    find_package(Protobuf CONFIG QUIET)
else()
    find_package(Protobuf QUIET)
endif()
if(Protobuf_FOUND)
    set(RL_TOOLS_ENABLE_TENSORBOARD ON CACHE BOOL "" FORCE)
endif()

add_library(learning_to_fly INTERFACE)
target_include_directories(learning_to_fly INTERFACE include)

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/external/rl_tools/CMakeLists.txt")
    add_subdirectory(external/rl_tools)
endif()

option(LEARNING_TO_FLY_IN_SECONDS_ENABLE_TESTS "Enable tests" OFF)

if(LEARNING_TO_FLY_IN_SECONDS_ENABLE_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()
