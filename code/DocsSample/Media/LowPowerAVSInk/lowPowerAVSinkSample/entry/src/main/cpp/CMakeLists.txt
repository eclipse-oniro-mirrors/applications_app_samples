# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(videoCodecSample)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/capabilities/include
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/err
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/log
                    ${NATIVERENDER_ROOT_PATH}/render/include
                    ${NATIVERENDER_ROOT_PATH}/sample/player
)

add_library(player SHARED sample/player/PlayerNative.cpp
                          sample/player/Player.cpp
                          capabilities/demuxer.cpp
                          capabilities/lpp_audio_streamer.cpp
                          capabilities/lpp_video_streamer.cpp
                          render/egl_core.cpp
                          render/plugin_render.cpp
                          render/plugin_manager.cpp
                          common/lppCallback.cpp
)

// [Start OH_Libraries_Otherso]
set(BASE_LIBRARY
    libace_napi.z.so libEGL.so libGLESv3.so libace_ndk.z.so libuv.so libhilog_ndk.z.so
    libnative_media_codecbase.so libnative_media_core.so libnative_media_vdec.so libnative_window.so
    libnative_media_venc.so libnative_media_acodec.so libnative_media_avdemuxer.so libnative_media_avsource.so
    libnative_media_avmuxer.so libohaudio.so
)
target_link_libraries(player PUBLIC ${BASE_LIBRARY})
// [End OH_Libraries_Otherso]

// [Start OH_Libraries_Lowpower_Avsink]
target_link_libraries(player PUBLIC liblowpower_avsink.so)
// [End OH_Libraries_Lowpower_Avsink]

// [Start OH_Libraries_Hilog]
target_link_libraries(player PUBLIC libhilog_ndk.z.so)
// [End OH_Libraries_Hilog]