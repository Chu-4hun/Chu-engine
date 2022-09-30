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


find_package(glad QUIET)
if (NOT glad_FOUND)
    set(URL_TO_GLAD "")
    file(READ ${CMAKE_CURRENT_LIST_DIR}/gladurl.txt URL_TO_GLAD)
    message("${URL_TO_GLAD}")
    include(FetchContent)
    FetchContent_Declare(
            glad
            URL ${URL_TO_GLAD}
    )
    FetchContent_MakeAvailable(glad)
endif ()

include_directories(${CMAKE_BINARY_DIR}/_deps/glfw-src/include/ ${CMAKE_BINARY_DIR}/_deps/glad-src/include/)
set(SOURCES main.cpp ${CMAKE_BINARY_DIR}/_deps/glad-src/src/glad.c)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(ChuEngine OpenGL::GL glfw)



