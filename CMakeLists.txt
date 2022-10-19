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
endif ()

#Thanks gods https://github.com/Perlmint/glew-cmake exist 😭

find_package(GLEW QUIET)
if (NOT GLEW_FOUND)
    include(FetchContent)
    FetchContent_Declare(
            GLEW
            GIT_REPOSITORY https://github.com/Perlmint/glew-cmake
            GIT_TAG glew-cmake-2.2.0
    )
    FetchContent_MakeAvailable(GLEW)
endif ()

set(GLEW_USE_STATIC_LIBS TRUE)
set(ONLY_LIBS ON)

include_directories(${CMAKE_BINARY_DIR}/_deps/glfw-src/include/ ${CMAKE_BINARY_DIR}/_deps/glew-src/include/)
set(SOURCES main.cpp  ${CMAKE_BINARY_DIR}/_deps/glew-src/src/)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(ChuEngine OpenGL::GL glfw libglew_static)



