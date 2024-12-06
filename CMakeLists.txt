cmake_minimum_required(VERSION 3.20)
project(VulkanQuest VERSION 1.0.0 LANGUAGES CXX)

# Set C++ Standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add CMake module path for custom find scripts
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Find Vulkan
find_package(Vulkan REQUIRED)

# Fetch Content for Dependencies
include(FetchContent)

# GLM
FetchContent_Declare(
        glm
        GIT_REPOSITORY https://github.com/g-truc/glm.git
        GIT_TAG 1.0.1
)
FetchContent_MakeAvailable(glm)

# SDL2
FetchContent_Declare(
        SDL2
        GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
        GIT_TAG release-2.30.9
)
FetchContent_MakeAvailable(SDL2)

# Add source files
set(SOURCES ${PROJECT_SOURCE_DIR}/source/main.cpp)

# Define the executable
add_executable(VulkanQuest ${SOURCES})

# Link Libraries
target_link_libraries(VulkanQuest PRIVATE
        Vulkan::Vulkan
        glm::glm
        SDL2::SDL2
        SDL2::SDL2main
)

# Set the binary directory
set(CMAKE_BINARY_DIR "${PROJECT_SOURCE_DIR}/build")