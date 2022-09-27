cmake_minimum_required(VERSION 3.16)
project(ChuEngine)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXE_LINKER_FLAGS "-static")

# raylib
find_package(raylib QUIET)
if (NOT raylib_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            raylib
            GIT_REPOSITORY https://github.com/raysan5/raylib
            GIT_TAG 4.2.0
    )
    FetchContent_MakeAvailable(raylib)
endif()

# This is the main part:
set(SOURCES main.cpp)
link_directories(${CMAKE_BINARY_DIR}/res)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} PUBLIC raylib)



