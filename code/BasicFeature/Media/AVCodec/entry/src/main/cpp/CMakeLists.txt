# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(videoCodecSample)

set(CMAKE_CXX_STANDARD 17)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
option(AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY "Enable smart fluency video decoding" ON)
option(AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID "Read temporal layer ID from encoded video output" ON)

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/capabilities/include
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/error
                    ${NATIVERENDER_ROOT_PATH}/common/dfx/log
                    ${NATIVERENDER_ROOT_PATH}/render/include
                    ${NATIVERENDER_ROOT_PATH}/sample/player
                    ${NATIVERENDER_ROOT_PATH}/sample/player/core
                    ${NATIVERENDER_ROOT_PATH}/sample/player/output
                    ${NATIVERENDER_ROOT_PATH}/sample/player/sync
                    ${NATIVERENDER_ROOT_PATH}/sample/player/napi
                    ${NATIVERENDER_ROOT_PATH}/sample/recorder
)

set(BASE_LIBRARY
    libace_napi.z.so libGLESv3.so libace_ndk.z.so libuv.so libhilog_ndk.z.so
    libnative_media_codecbase.so libnative_media_core.so libnative_media_vdec.so libnative_window.so libnative_buffer.so
    libnative_media_venc.so libnative_media_acodec.so libnative_media_avdemuxer.so libnative_media_avsource.so libnative_media_avmuxer.so
    libohaudio.so
)
add_library(player SHARED sample/player/napi/PlayerNative.cpp
                          sample/player/napi/PlayerNapiParser.cpp
                          sample/player/napi/PlayerNapiSerializer.cpp
                          sample/player/core/Player.cpp
                          sample/player/core/PlayerLifecycle.cpp
                          sample/player/core/PlayerRelease.cpp
                          sample/player/core/PlayerSeek.cpp
                          sample/player/sync/PlayerStateMachine.cpp
                          sample/player/sync/PlaybackClock.cpp
                          sample/player/sync/AvSyncController.cpp
                          sample/player/sync/SeekController.cpp
                          sample/player/output/VideoPipeline.cpp
                          sample/player/output/AudioOutputPump.cpp
                          sample/player/output/PlayerVideoPresentation.cpp
                          sample/player/output/PlayerVideoOutput.cpp
                          sample/player/output/PlayerAudioOutput.cpp
                          sample/player/output/BufferRenderer.cpp
                          sample/player/output/HdrMetadataHelper.cpp
                          capabilities/demuxer.cpp
                          capabilities/codec_capability.cpp
                          capabilities/video_decoder.cpp
                          capabilities/audio_decoder.cpp
                          render/plugin_render.cpp
                          render/plugin_manager.cpp
                          common/sample_callback.cpp
)

add_library(recorder SHARED sample/recorder/RecorderNative.cpp
                            sample/recorder/Recorder.cpp
                            capabilities/muxer.cpp
                            capabilities/codec_capability.cpp
                            capabilities/video_encoder.cpp
                            capabilities/audio_capturer.cpp
                            capabilities/audio_encoder.cpp
                            common/sample_callback.cpp
)

if(AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY)
    target_compile_definitions(player PRIVATE AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY)
endif()

if(AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID)
    target_compile_definitions(recorder PRIVATE AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID)
endif()

target_link_libraries(player PUBLIC ${BASE_LIBRARY})
target_link_libraries(recorder PUBLIC ${BASE_LIBRARY})
