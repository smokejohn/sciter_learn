cmake_minimum_required(VERSION 3.10)

# project definition
project(hellocpp VERSION 0.1
                 DESCRIPTION "Learning sciter"
                 HOMEPAGE_URL "https://sciter.com/hello-cpp-tutorial/"
                 LANGUAGES CXX)

# set compile_commands (clangd)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# set base directories
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/source")
set(SCITER_DIR "${CMAKE_CURRENT_SOURCE_DIR}/sciter")

# set c++ 11
set(CMAKE_CXX_STANDARD 11)

############
# GTK 3
############

# use custom FindGTK3.cmake
set(CMAKE_MODULE_PATH ${SRC_DIR}/cmake/)
find_package(GTK3 REQUIRED gtk)

# fix missing harfbuzz lib
# this is not guaranteed to work on every linux distro
# as the libraries will be in different locations
# TODO: Use variables to set location
list(APPEND GTK3_INCLUDE_DIRS "/usr/include/harfbuzz")
list(APPEND GTK3_LIBRARIES "/usr/lib64/libharfbuzz.so" "/usr/lib64/libdl.so")

###############
# hellocpp
###############

# add executable sources
add_executable(hellocpp "${SRC_DIR}/main.cpp"
                        "${SCITER_DIR}/include/sciter-gtk-main.cpp")

# tell where header files are
target_include_directories(hellocpp PRIVATE "${SCITER_DIR}/include"
                                    PRIVATE "${GTK3_INCLUDE_DIRS}")

# tell what to link against
# hardcoding the path to libdl sucks as the library could be elsewhere
# on other linux distributions
# TODO: Use variables to set location
target_link_libraries(hellocpp PRIVATE "${GTK3_LIBRARIES}"
                               PRIVATE "/usr/lib64/libdl.so")


# copy needed libsciter-gtk.so shared obj library next to binary
add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
            "${SCITER_DIR}/bin.lnx/x64/libsciter-gtk.so"
            "${CMAKE_BINARY_DIR}"
    )
