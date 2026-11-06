# the minimum version of CMake.
cmake_minimum_required(VERSION 3.10)
project(codecCapabilitySample)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/capability/include
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/log
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/error
)

add_library(capability SHARED capability/CapabilityQueryNative.cpp
                                capability/CapabilityQuery.cpp
                                capability/CapabilityConfigQuery.cpp
                                capability/CapabilityVideoQuery.cpp
                                capability/EncodingConfigQuery.cpp
                                capability/BFrameQuery.cpp
                                capability/TemporalScalabilityQuery.cpp
                                capability/CodecList.cpp)

# [Start capability_cmake_link_libraries]
target_link_libraries(capability PUBLIC libnative_media_codecbase.so)
target_link_libraries(capability PUBLIC libnative_media_core.so)
target_link_libraries(capability PUBLIC libnative_media_venc.so)
target_link_libraries(capability PUBLIC libnative_media_vdec.so)
target_link_libraries(capability PUBLIC libnative_media_acodec.so)
# [End capability_cmake_link_libraries]

# [Start config_cmake_link_libraries]
target_link_libraries(capability PUBLIC libnative_media_codecbase.so)
target_link_libraries(capability PUBLIC libnative_media_core.so)
target_link_libraries(capability PUBLIC libnative_media_venc.so)
# [End config_cmake_link_libraries]

# hilog日志库与N-API能力库，均为OpenHarmony SDK发布的系统动态库。
# 说明：libhilog_ndk.z.so为SDK sysroot内的官方原始库名，须按原名链接。
target_link_libraries(capability PUBLIC libace_napi.z.so)
target_link_libraries(capability PUBLIC libhilog_ndk.z.so)
