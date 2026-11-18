# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(GewuService)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libqos.so libhilog_ndk.z.so)

# [Start GewuServicePrepareOpenSourceDeps]
# Fetch the third-party nlohmann/json header during the build stage.
set(OPENSOURCE_DEPS_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/../../../../prepare_opensource_deps.sh)
if(CMAKE_HOST_WIN32)
    # Use Git Bash explicitly: other bash entries on Windows may be WSL stubs
    # that cannot access Windows-style paths.
    set(OPENSOURCE_DEPS_BASH "")
    foreach(_BASH_CANDIDATE "C:/Program Files/Git/bin/bash.exe"
                            "C:/Program Files/Git/usr/bin/bash.exe")
        if(EXISTS "${_BASH_CANDIDATE}")
            set(OPENSOURCE_DEPS_BASH "${_BASH_CANDIDATE}")
            break()
        endif()
    endforeach()
    if(NOT OPENSOURCE_DEPS_BASH)
        find_program(OPENSOURCE_DEPS_BASH NAMES bash.exe NO_CMAKE_FIND_ROOT_PATH)
    endif()
else()
    find_program(OPENSOURCE_DEPS_BASH NAMES bash sh)
endif()
if(NOT OPENSOURCE_DEPS_BASH)
    message(FATAL_ERROR "Git Bash is required to run ${OPENSOURCE_DEPS_SCRIPT}. "
                        "Please install Git for Windows or run the script manually.")
endif()

add_custom_target(prepare_opensource_deps
    COMMAND "${OPENSOURCE_DEPS_BASH}" "${OPENSOURCE_DEPS_SCRIPT}"
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Preparing third-party dependencies (nlohmann/json)"
    VERBATIM)
add_dependencies(entry prepare_opensource_deps)
# [End GewuServicePrepareOpenSourceDeps]
