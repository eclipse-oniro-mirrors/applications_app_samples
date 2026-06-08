# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(EventSub_Sta)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_CXX_STANDARD 17)
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

set(GZ_FILE "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/jsoncpp/src/jsoncpp-1.9.6.tar.gz")
set(DEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../../build")
# 检查是否存在entry/build目录
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${DEST_DIR})
# 解压jsoncpp-1.9.6.tar.gz到entry/build，得到jsoncpp头文件的目录
execute_process(COMMAND tar -xzf ${GZ_FILE} -C ${DEST_DIR}
    WORKING_DIRECTORY ${DEST_DIR})

add_library(entry SHARED ani_init.cpp)
target_link_libraries(entry PUBLIC libhiappevent_ndk.z.so libhilog_ndk.z.so)
# 新增三方库依赖libjsoncpp.so(解析订阅事件中的json字符串)
target_link_libraries(entry PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/jsoncpp/${OHOS_ARCH}/lib/libjsoncpp.so)
target_include_directories(entry PRIVATE ${DEST_DIR}/jsoncpp-1.9.6/include/json)