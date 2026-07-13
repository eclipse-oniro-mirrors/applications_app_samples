cmake_minimum_required(VERSION 3.5.0)
project(PickerCAPI)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

# 【关键修复】指定头文件目录
include_directories(${NATIVERENDER_ROOT_PATH}/include)

# 编译源文件
file(GLOB_RECURSE ENTRY_SOURCES CONFIGURE_DEPENDS
    "${NATIVERENDER_ROOT_PATH}/*.cpp"
)

add_library(entry SHARED ${ENTRY_SOURCES})

target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libace_ndk.z.so
    libhilog_ndk.z.so
)