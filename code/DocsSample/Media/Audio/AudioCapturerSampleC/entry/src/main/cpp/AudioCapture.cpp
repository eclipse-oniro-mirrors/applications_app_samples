/*
* Copyright (C) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#include "napi/native_api.h"
#include <hilog/log.h>
#include "ohaudio/native_audiorenderer.h"
// [Start header_file]
#include <ohaudio/native_audiocapturer.h>
#include <ohaudio/native_audiostreambuilder.h>
// [End header_file]
#include <atomic>
#include <cstdint>
#include <cstring>
#include <mutex>
#include <sstream>
#include <string>

extern "C" OH_AudioStream_Result OH_AudioStreamBuilder_SetCapturerLoopbackEffectEnabled(
    OH_AudioStreamBuilder* builder, bool enabled) __attribute__((weak));

namespace {
// [Start PlaybackCaptureConstants]
constexpr int32_t PLAYBACK_CAPTURE_SAMPLE_RATE = 48000;
constexpr int32_t PLAYBACK_CAPTURE_CHANNEL_COUNT = 2;
constexpr uint32_t PLAYBACK_CAPTURE_MODE = AUDIOSTREAM_PLAYBACKCAPTURE_MODE_MEDIA |
    AUDIOSTREAM_PLAYBACKCAPTURE_MODE_EXCLUDING_SELF;
// [End PlaybackCaptureConstants]
constexpr unsigned int AUDIO_CAPTURE_LOG_DOMAIN = 0xF811;
constexpr const char* AUDIO_CAPTURE_LOG_TAG = "AudioCaptureDemo";

// [Start PlaybackCaptureGlobalState]
std::mutex g_playbackCaptureMutex;
OH_AudioCapturer* g_playbackCaptureCapturer = nullptr;
std::atomic<int32_t> g_playbackCaptureStartState{-1};
std::atomic<uint64_t> g_playbackCaptureReadBytes{0};
// [End PlaybackCaptureGlobalState]

napi_value CreateStringResult(napi_env env, const std::string& message)
{
    napi_value retVal;
    napi_create_string_utf8(env, message.c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// [Start PlaybackCaptureStateToText]
const char* PlaybackCaptureStateToText(int32_t state)
{
    switch (state) {
        case AUDIOSTREAM_PLAYBACKCAPTURE_START_STATE_SUCCESS:
            return "SUCCESS";
        case AUDIOSTREAM_PLAYBACKCAPTURE_START_STATE_FAILED:
            return "FAILED";
        case AUDIOSTREAM_PLAYBACKCAPTURE_START_STATE_NOT_AUTHORIZED:
            return "NOT_AUTHORIZED";
        default:
            return "WAITING";
    }
}
// [End PlaybackCaptureStateToText]
} // namespace

// [Start Set_AudioCallbackFunction]
void MyOnReadData_NewAPI(
    OH_AudioCapturer* capturer,
    void* userData,
    void* audioData,
    int32_t audioDataSize)
{
    // 从buffer中取出length长度的录音数据。
}

void MyOnInterruptEvent_NewAPI(
    OH_AudioCapturer* capturer,
    void* userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    // 根据type和hint表示的音频中断信息，更新录制器状态和界面。
}

void MyOnError_NewAPI(
    OH_AudioCapturer* capturer,
    void* userData,
    OH_AudioStream_Result error)
{
    // 根据error表示的音频异常信息，做出相应的处理。
}

// [Start PlaybackCaptureReadDataCallback]
void MyOnPlaybackCaptureReadData(
    OH_AudioCapturer* capturer,
    void* userData,
    void* audioData,
    int32_t audioDataSize)
{
    if (audioData == nullptr || audioDataSize <= 0) {
        return;
    }
    g_playbackCaptureReadBytes.fetch_add(static_cast<uint64_t>(audioDataSize));
}
// [End PlaybackCaptureReadDataCallback]

// [Start PlaybackCaptureStartCallback]
void MyOnPlaybackCaptureStart(
    OH_AudioCapturer* capturer,
    void* userData,
    OH_AudioStream_PlaybackCaptureStartState state)
{
    int32_t stateValue = static_cast<int32_t>(state);
    g_playbackCaptureStartState.store(stateValue);
    OH_LOG_Print(LOG_APP, LOG_INFO, AUDIO_CAPTURE_LOG_DOMAIN, AUDIO_CAPTURE_LOG_TAG,
        "Playback capture start callback state=%{public}d", stateValue);

    if (state == AUDIOSTREAM_PLAYBACKCAPTURE_START_STATE_SUCCESS) {
        return;
    }

    OH_AudioCapturer* capturerToRelease = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_playbackCaptureMutex);
        if (g_playbackCaptureCapturer == capturer) {
            capturerToRelease = g_playbackCaptureCapturer;
            g_playbackCaptureCapturer = nullptr;
        }
    }
    if (capturerToRelease != nullptr) {
        OH_AudioCapturer_Release(capturerToRelease);
    }
}
// [End PlaybackCaptureStartCallback]
// [StartExclude Set_AudioCallbackFunction]

// [Start callback_Capture]
// [Start callbackNullptr_Capture]
// [Start SetCapturerReadDataCallback]
// [Start public_Function]
// [Start SetCapturerCallback]
int32_t MyOnReadData_Legacy(
    OH_AudioCapturer* capturer,
    void* userData,
    void* buffer,
    int32_t length)
{
    // 从buffer中取出length长度的录音数据。
    return 0;
}
// [StartExclude SetCapturerReadDataCallback]
// [StartExclude public_Function]
int32_t MyOnInterruptEvent_Legacy(
    OH_AudioCapturer* capturer,
    void* userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    // 根据type和hint表示的音频中断信息，更新录制器状态和界面。
    return 0;
}
// [StartExclude callback_Capture]
// [StartExclude callbackNullptr_Capture]

int32_t MyOnStreamEvent_Legacy(
    OH_AudioCapturer* capturer,
    void* userData,
    OH_AudioStream_Event event)
{
    // 根据event表示的音频流事件信息，更新录制器状态和界面。
    return 0;
}

int32_t MyOnError_Legacy(
    OH_AudioCapturer* capturer,
    void* userData,
    OH_AudioStream_Result error)
{
    // 根据error表示的音频异常信息，做出相应的处理。
    return 0;
}
// [StartExclude SetCapturerCallback]

// [EndExclude public_Function]
// [Start SetRendererCallback]
int32_t MyOnWriteData(
    OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t length)
{
    // 从公共缓冲区buffer中读取数据，并按length长度写入buffer。
    return 0;
}
// [End public_Function]
int32_t MyOnStreamEvent_Renderer(
    OH_AudioRenderer* renderer,
    void* userData,
    OH_AudioStream_Event event)
{
    // 根据event表示的音频流事件信息，更新播放器状态和界面。
    return 0;
}

int32_t MyOnInterruptEvent_Renderer(
    OH_AudioRenderer* renderer,
    void* userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    // 根据type和hint表示的音频中断信息，更新播放器状态和界面。
    return 0;
}

int32_t MyOnError_Renderer(
    OH_AudioRenderer* renderer,
    void* userData,
    OH_AudioStream_Result error)
{
    // 根据error表示的音频异常信息，做出相应的处理。
    return 0;
}
// [StartExclude SetRendererCallback]

// 创建录制音频流（新版回调）
napi_value CreateAudioCapturer(napi_env env, napi_callback_info info)
{
    // [Start Create_Capture]
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);
    // [End Create_Capture]

    // [Start Configure_Capture]
    // 设置音频采样率。
    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    // 设置音频声道。
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    // 设置音频采样格式。
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    // 设置音频流的编码类型。
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    // 设置输入音频流的工作场景。
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);
    // [End Configure_Capture]

    // [EndExclude Set_AudioCallbackFunction]
    // 配置音频中断事件回调函数。
    OH_AudioCapturer_OnInterruptCallback OnInterruptCb = MyOnInterruptEvent_NewAPI;
    OH_AudioStreamBuilder_SetCapturerInterruptCallback(builder, OnInterruptCb, nullptr);

    // 配置音频异常回调函数。
    OH_AudioCapturer_OnErrorCallback OnErrorCb = MyOnError_NewAPI;
    OH_AudioStreamBuilder_SetCapturerErrorCallback(builder, OnErrorCb, nullptr);

    // 配置音频输入流的回调。
    OH_AudioCapturer_OnReadDataCallback OnReadDataCb = MyOnReadData_NewAPI;
    OH_AudioStreamBuilder_SetCapturerReadDataCallback(builder, OnReadDataCb, nullptr);
    // [End Set_AudioCallbackFunction]

    // [Start GenerateCapturer_Capture]
    OH_AudioCapturer* audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    // [End GenerateCapturer_Capture]
    
    // [Start Destroy_Capture]
    OH_AudioStreamBuilder_Destroy(builder);
    // [End Destroy_Capture]

    std::stringstream ss;
    ss << "创建录制音频流成功\n";
    ss << "采样率: 48000Hz\n";
    ss << "声道数: 2\n";
    ss << "回调方式: 新版API";

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 创建录制音频流（旧版回调 - 方式1）
napi_value CreateAudioCapturerLegacy1(napi_env env, napi_callback_info info)
{
    std::stringstream ss;
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);

    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);

    OH_AudioCapturer_Callbacks callbacks;
    
    // [EndExclude callback_Capture]
    // 配置回调函数，如果需要监听，则赋值。
    callbacks.OH_AudioCapturer_OnReadData = MyOnReadData_Legacy;
    callbacks.OH_AudioCapturer_OnInterruptEvent = MyOnInterruptEvent_Legacy;
    
    // （必选）如果不需要监听，使用空指针初始化。
    callbacks.OH_AudioCapturer_OnStreamEvent = nullptr;
    callbacks.OH_AudioCapturer_OnError = nullptr;
    // [End callback_Capture]

    OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, nullptr);

    OH_AudioCapturer* audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);

    ss << "创建录制音频流成功（使用空指针初始化）\n";
    ss << "使用空指针初始化未使用的回调";

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 创建录制音频流（旧版回调 - 方式2）
napi_value CreateAudioCapturerLegacy2(napi_env env, napi_callback_info info)
{
    std::stringstream ss;
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);

    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);

    // [EndExclude callbackNullptr_Capture]
    // 使用前，初始化并清零结构体。
    OH_AudioCapturer_Callbacks callbacks = {0};
    // 配置需要的回调函数。
    callbacks.OH_AudioCapturer_OnReadData = MyOnReadData_Legacy;
    callbacks.OH_AudioCapturer_OnInterruptEvent = MyOnInterruptEvent_Legacy;
    // [End callbackNullptr_Capture]

    OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, nullptr);

    OH_AudioCapturer* audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);

    ss << "创建录制音频流成功（使用清零结构体初始化）\n";
    ss << "使用清零结构体";

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 创建耳返录制流
napi_value CreateAudioCapturerLoopback(napi_env env, napi_callback_info info)
{
    OH_AudioStream_Type streamType = AUDIOSTREAM_TYPE_CAPTURER;
    // [Start create_StreamType]
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, streamType);
    // [End create_StreamType]
    
    // [Start latencyMode_Capture]
    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_FAST;
    OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);
    // [End latencyMode_Capture]
    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);
    // [EndExclude SetCapturerCallback]
    OH_AudioCapturer_Callbacks callbacks;
    // 配置回调函数。
    callbacks.OH_AudioCapturer_OnReadData = MyOnReadData_Legacy;
    callbacks.OH_AudioCapturer_OnStreamEvent = MyOnStreamEvent_Legacy;
    callbacks.OH_AudioCapturer_OnInterruptEvent = MyOnInterruptEvent_Legacy;
    callbacks.OH_AudioCapturer_OnError = MyOnError_Legacy;

    OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, nullptr);
    // [End SetCapturerCallback]

    OH_AudioCapturer* audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);

    std::stringstream ss;
    ss << "创建耳返录制流成功\n";
    ss << "时延模式: FAST";

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 创建采集回环音效的录制流
napi_value CreateAudioCapturerLoopbackEffect(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_FAST;
    OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);
    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);

    // [Start SetCapturerLoopbackEffectEnabled]
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetCapturerLoopbackEffectEnabled != nullptr ?
        OH_AudioStreamBuilder_SetCapturerLoopbackEffectEnabled(builder, true) :
        AUDIOSTREAM_ERROR_ILLEGAL_STATE;
    // [End SetCapturerLoopbackEffectEnabled]

    OH_AudioStreamBuilder_Destroy(builder);

    std::stringstream ss;
    ss << "创建采集回环音效的录制流" << (result == AUDIOSTREAM_SUCCESS ? "成功" : "失败") << "\n";
    ss << "接口: OH_AudioStreamBuilder_SetCapturerLoopbackEffectEnabled\n";
    ss << "启用状态: true\n";
    ss << "返回码: " << result;

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 创建低时延模式录制流
napi_value CreateLowLatencyModeCapturer(napi_env env, napi_callback_info info)
{
    std::stringstream ss;
    OH_AudioStreamBuilder* builder;

    OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_FAST;
    OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);

    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);

    // [EndExclude SetCapturerReadDataCallback]
    // 配置读入音频数据回调函数。
    OH_AudioCapturer_OnReadDataCallback readDataCb = MyOnReadData_NewAPI;
    OH_AudioStreamBuilder_SetCapturerReadDataCallback(builder, readDataCb, nullptr);
    // [End SetCapturerReadDataCallback]

    OH_AudioCapturer* audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);

    ss << "创建低时延模式录制流成功\n";
    ss << "时延模式: FAST\n";
    ss << "适用场景: k歌、直播";

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 创建耳返播放流
napi_value CreateAudioRendererLoopback(napi_env env, napi_callback_info info)
{
    // [Start Create_Renderer]
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    // [End Create_Renderer]

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_FAST;
    OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);

    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    // [Start SetRendererInfo]
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MUSIC);
    // [End SetRendererInfo]

    // [EndExclude SetRendererCallback]
    OH_AudioRenderer_Callbacks callbacks;
    
    // 配置回调函数。
    callbacks.OH_AudioRenderer_OnWriteData = MyOnWriteData;
    callbacks.OH_AudioRenderer_OnStreamEvent = MyOnStreamEvent_Renderer;
    callbacks.OH_AudioRenderer_OnInterruptEvent = MyOnInterruptEvent_Renderer;
    callbacks.OH_AudioRenderer_OnError = MyOnError_Renderer;

    // 设置输出音频流的回调。
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    // [End SetRendererCallback]

    // [Start GenerateRenderer]
    OH_AudioRenderer* audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    // [End GenerateRenderer]
    OH_AudioStreamBuilder_Destroy(builder);

    std::stringstream ss;
    ss << "创建耳返播放流成功\n";
    ss << "时延模式: FAST";

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// 设置录音流静音提示
napi_value SetAudioCapturerMuteHint(napi_env env, napi_callback_info info)
{
    std::stringstream ss;
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioCapturer* audioCapturer = nullptr;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);
    if (result != AUDIOSTREAM_SUCCESS || builder == nullptr) {
        ss << "创建录制音频流构造器失败，错误码: " << result;
        napi_value retVal;
        napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
        return retVal;
    }

    const int SAMPLING_RATE_48K = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE_48K);
    const int channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetCapturerInfo(builder, AUDIOSTREAM_SOURCE_TYPE_MIC);
    OH_AudioStreamBuilder_SetCapturerReadDataCallback(builder, MyOnReadData_NewAPI, nullptr);

    result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS || audioCapturer == nullptr) {
        ss << "构造录制音频流失败，错误码: " << result;
        napi_value retVal;
        napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
        return retVal;
    }

    result = OH_AudioCapturer_Start(audioCapturer);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioCapturer_Release(audioCapturer);
        ss << "启动录制音频流失败，错误码: " << result;
        napi_value retVal;
        napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
        return retVal;
    }

    // [Start cset_mute_hint]
    bool mute = true;
    OH_AudioStream_Result setResult = OH_AudioCapturer_SetMuteHint(audioCapturer, mute);
    if (setResult != AUDIOSTREAM_SUCCESS) {
        // 根据返回值处理异常，如AUDIOSTREAM_ERROR_ILLEGAL_STATE。
    }

    mute = false;
    OH_AudioStream_Result unsetResult = OH_AudioCapturer_SetMuteHint(audioCapturer, mute);
    // [End cset_mute_hint]

    OH_AudioCapturer_Stop(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);

    ss << "上报录音流静音提示完成（接口不实际触发静音）\n";
    ss << "setMuteHint(true) 返回值: " << setResult << "\n";
    ss << "setMuteHint(false) 返回值: " << unsetResult;

    napi_value retVal;
    napi_create_string_utf8(env, ss.str().c_str(), NAPI_AUTO_LENGTH, &retVal);
    return retVal;
}

// [Start ConfigurePlaybackCaptureBuilder]
bool ConfigurePlaybackCaptureBuilder(OH_AudioStreamBuilder* builder, std::stringstream& ss)
{
    OH_AudioStream_Result samplingRateResult =
        OH_AudioStreamBuilder_SetSamplingRate(builder, PLAYBACK_CAPTURE_SAMPLE_RATE);
    OH_AudioStream_Result channelCountResult =
        OH_AudioStreamBuilder_SetChannelCount(builder, PLAYBACK_CAPTURE_CHANNEL_COUNT);
    OH_AudioStream_Result sampleFormatResult =
        OH_AudioStreamBuilder_SetSampleFormat(builder, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStream_Result encodingTypeResult =
        OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStream_Result callbackResult =
        OH_AudioStreamBuilder_SetCapturerReadDataCallback(builder, MyOnPlaybackCaptureReadData, nullptr);

    // [Start SetPlaybackCaptureMode]
    OH_AudioStream_Result playbackCaptureModeResult =
        OH_AudioStreamBuilder_SetPlaybackCaptureMode(builder, PLAYBACK_CAPTURE_MODE);
    // [End SetPlaybackCaptureMode]
    ss << "OH_AudioStreamBuilder_SetSamplingRate 返回值: " << samplingRateResult << "\n";
    ss << "OH_AudioStreamBuilder_SetChannelCount 返回值: " << channelCountResult << "\n";
    ss << "OH_AudioStreamBuilder_SetSampleFormat 返回值: " << sampleFormatResult << "\n";
    ss << "OH_AudioStreamBuilder_SetEncodingType 返回值: " << encodingTypeResult << "\n";
    ss << "OH_AudioStreamBuilder_SetCapturerReadDataCallback 返回值: " << callbackResult << "\n";
    ss << "OH_AudioStreamBuilder_SetPlaybackCaptureMode 返回值: " << playbackCaptureModeResult << "\n";
    return playbackCaptureModeResult == AUDIOSTREAM_SUCCESS;
}
// [End ConfigurePlaybackCaptureBuilder]

// [Start CreatePlaybackCapture]
OH_AudioCapturer* CreatePlaybackCapture(std::stringstream& ss)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_CAPTURER);
    ss << "OH_AudioStreamBuilder_Create 返回值: " << result << "\n";
    if (result != AUDIOSTREAM_SUCCESS || builder == nullptr) {
        ss << "创建音频内录构造器失败";
        return nullptr;
    }
    if (!ConfigurePlaybackCaptureBuilder(builder, ss)) {
        OH_AudioStreamBuilder_Destroy(builder);
        ss << "设置音频内录模式失败";
        return nullptr;
    }
    OH_AudioCapturer* audioCapturer = nullptr;
    result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    ss << "OH_AudioStreamBuilder_GenerateCapturer 返回值: " << result << "\n";
    OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS || audioCapturer == nullptr) {
        ss << "构造音频内录流失败";
        return nullptr;
    }
    return audioCapturer;
}
// [End CreatePlaybackCapture]

// [Start StorePlaybackCapture]
bool StorePlaybackCapture(OH_AudioCapturer* audioCapturer)
{
    std::lock_guard<std::mutex> lock(g_playbackCaptureMutex);
    if (g_playbackCaptureCapturer != nullptr) {
        return false;
    }
    g_playbackCaptureCapturer = audioCapturer;
    g_playbackCaptureStartState.store(-1);
    g_playbackCaptureReadBytes.store(0);
    return true;
}
// [End StorePlaybackCapture]

// [Start RequestPlaybackCaptureStartProcess]
bool RequestPlaybackCaptureStart(OH_AudioCapturer* audioCapturer, std::stringstream& ss)
{
    // [Start RequestPlaybackCaptureStart]
    OH_AudioStream_Result result = OH_AudioCapturer_RequestPlaybackCaptureStart(
        audioCapturer, MyOnPlaybackCaptureStart, nullptr);
    // [End RequestPlaybackCaptureStart]
    ss << "OH_AudioCapturer_RequestPlaybackCaptureStart 返回值: " << result << "\n";
    if (result == AUDIOSTREAM_SUCCESS) {
        return true;
    }
    bool shouldRelease = false;
    {
        std::lock_guard<std::mutex> lock(g_playbackCaptureMutex);
        if (g_playbackCaptureCapturer == audioCapturer) {
            g_playbackCaptureCapturer = nullptr;
            shouldRelease = true;
        }
    }
    if (shouldRelease) {
        OH_AudioCapturer_Release(audioCapturer);
    }
    ss << "请求启动音频内录失败";
    return false;
}
// [End RequestPlaybackCaptureStartProcess]

// 启动音频内录
// [Start StartPlaybackCapture]
napi_value StartPlaybackCapture(napi_env env, napi_callback_info info)
{
    std::stringstream ss;
    {
        std::lock_guard<std::mutex> lock(g_playbackCaptureMutex);
        if (g_playbackCaptureCapturer != nullptr) {
            ss << "音频内录已存在，请先停止后再启动\n";
            ss << "当前状态: " << PlaybackCaptureStateToText(g_playbackCaptureStartState.load()) << "\n";
            ss << "已读取字节数: " << g_playbackCaptureReadBytes.load();
            return CreateStringResult(env, ss.str());
        }
    }
    OH_AudioCapturer* audioCapturer = CreatePlaybackCapture(ss);
    if (audioCapturer == nullptr) {
        return CreateStringResult(env, ss.str());
    }
    if (!StorePlaybackCapture(audioCapturer)) {
        OH_AudioCapturer_Release(audioCapturer);
        ss << "音频内录已由其他请求启动，本次创建的流已释放";
        return CreateStringResult(env, ss.str());
    }
    if (!RequestPlaybackCaptureStart(audioCapturer, ss)) {
        return CreateStringResult(env, ss.str());
    }
    ss << "音频内录启动请求已发起\n";
    ss << "采集模式: MEDIA | EXCLUDING_SELF\n";
    ss << "回调结果: 请稍后点击\"查询音频内录状态\"查看";
    return CreateStringResult(env, ss.str());
}
// [End StartPlaybackCapture]

// 查询音频内录状态
napi_value GetPlaybackCaptureStatus(napi_env env, napi_callback_info info)
{
    bool isActive = false;
    {
        std::lock_guard<std::mutex> lock(g_playbackCaptureMutex);
        isActive = g_playbackCaptureCapturer != nullptr;
    }

    int32_t state = g_playbackCaptureStartState.load();
    std::stringstream ss;
    ss << "音频内录状态: " << PlaybackCaptureStateToText(state) << "\n";
    ss << "是否存在内录流: " << (isActive ? "true" : "false") << "\n";
    ss << "已读取字节数: " << g_playbackCaptureReadBytes.load();
    return CreateStringResult(env, ss.str());
}

// 停止音频内录
// [Start StopPlaybackCapture]
napi_value StopPlaybackCapture(napi_env env, napi_callback_info info)
{
    OH_AudioCapturer* capturerToRelease = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_playbackCaptureMutex);
        capturerToRelease = g_playbackCaptureCapturer;
        g_playbackCaptureCapturer = nullptr;
    }

    std::stringstream ss;
    if (capturerToRelease == nullptr) {
        ss << "当前没有正在运行或等待授权的音频内录流\n";
        ss << "最后状态: " << PlaybackCaptureStateToText(g_playbackCaptureStartState.load());
        return CreateStringResult(env, ss.str());
    }

    OH_AudioStream_Result stopResult = OH_AudioCapturer_Stop(capturerToRelease);
    OH_AudioStream_Result releaseResult = OH_AudioCapturer_Release(capturerToRelease);
    ss << "停止音频内录完成\n";
    ss << "OH_AudioCapturer_Stop 返回值: " << stopResult << "\n";
    ss << "OH_AudioCapturer_Release 返回值: " << releaseResult << "\n";
    ss << "本次读取字节数: " << g_playbackCaptureReadBytes.load();
    g_playbackCaptureStartState.store(-1);
    g_playbackCaptureReadBytes.store(0);
    return CreateStringResult(env, ss.str());
}
// [End StopPlaybackCapture]

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"CreateAudioCapturer", nullptr, CreateAudioCapturer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateAudioCapturerLegacy1", nullptr, CreateAudioCapturerLegacy1, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"CreateAudioCapturerLegacy2", nullptr, CreateAudioCapturerLegacy2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"CreateAudioCapturerLoopback", nullptr, CreateAudioCapturerLoopback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"CreateAudioCapturerLoopbackEffect", nullptr, CreateAudioCapturerLoopbackEffect, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateLowLatencyModeCapturer", nullptr, CreateLowLatencyModeCapturer, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"CreateAudioRendererLoopback", nullptr, CreateAudioRendererLoopback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"SetAudioCapturerMuteHint", nullptr, SetAudioCapturerMuteHint, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"StartPlaybackCapture", nullptr, StartPlaybackCapture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPlaybackCaptureStatus", nullptr, GetPlaybackCaptureStatus, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"StopPlaybackCapture", nullptr, StopPlaybackCapture, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
