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

#BYPRODUCTS containing a "#" is not allowed.(┬┬﹏┬┬)

#find_package(glad QUIET)
#if (NOT glad_FOUND)
#    include(FetchContent)
#    FetchContent_Declare(
#            glad
#            URL "https://glad.dav1d.de/#language=c&specification=gl&api=gl%3D4.6&api=gles1%3Dnone&api=gles2%3Dnone&api=glsc2%3Dnone&profile=compatibility&loader=on"
#            DOWNLOAD_NO_EXTRACT TRUE
#
#    )
#    FetchContent_MakeAvailable(glad)
#endif()
include_directories(${CMAKE_BINARY_DIR}/_deps/glfw-src/include/ ${CMAKE_SOURCE_DIR}/lib/glad/include)
set(SOURCES main.cpp lib/glad/src/glad.c)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(ChuEngine OpenGL::GL glfw)



