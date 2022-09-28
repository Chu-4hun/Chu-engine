cmake_minimum_required(VERSION 3.23)
project(ChuEngine)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXE_LINKER_FLAGS "-static")

find_package(OpenGL REQUIRED)
find_package(glfw QUIET)
if (NOT glfw_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            glfw
            GIT_REPOSITORY https://github.com/glfw/glfw
            GIT_TAG 3.3.8
    )
    FetchContent_MakeAvailable(glfw)
endif()

# This is the main part:
set(SOURCES main.cpp)
include_directories(${CMAKE_BINARY_DIR}/_deps/glfw-src/include/)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(ChuEngine OpenGL::GL glfw)



