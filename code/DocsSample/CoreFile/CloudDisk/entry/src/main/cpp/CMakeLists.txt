# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(clouddiskdemo)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp)
target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libohclouddiskmanager.so
    dl
)
# SDK 26.0.0 自带的 libohclouddiskmanager.so 是缺少 26.0.1/26.1.0 占位符接口的旧版本，
# 而工具链默认加了 --no-undefined，会在链接期报这些符号未定义。
# 运行设备（32 位用户态）的 /system/lib/ndk/libohclouddiskmanager.so 已导出全部符号，
# 因此这里允许库内保留未解析符号，由运行时动态链接到设备系统库。
# 升级到包含这些接口的 SDK 后可删除本行。
target_link_options(entry PRIVATE -Wl,--unresolved-symbols=ignore-all)