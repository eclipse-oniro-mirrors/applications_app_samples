/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "sample_callback.h"
#include <algorithm>
#include <cstdint>
#include "av_codec_sample_log.h"

#undef LOG_TAG
#define LOG_TAG "sampleCallback"

namespace {
constexpr int LIMIT_LOGD_FREQUENCY = 50;
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;
constexpr int64_t US_PER_SECOND = 1'000'000;

int64_t GetQueuedAudioDurationUs(size_t queuedBytes, const SampleInfo &sampleInfo)
{
    if (sampleInfo.audio.audioSampleRate <= 0 || sampleInfo.audio.audioChannelCount <= 0) {
        return 0;
    }
    const uint64_t bytesPerFrame = static_cast<uint64_t>(sampleInfo.audio.audioChannelCount) * BYTES_PER_SAMPLE_2;
    const uint64_t queuedFrames = queuedBytes / bytesPerFrame;
    const uint64_t remainingBytes = queuedBytes % bytesPerFrame;
    const auto sampleRate = static_cast<uint64_t>(sampleInfo.audio.audioSampleRate);
    const uint64_t durationUs = queuedFrames * US_PER_SECOND / sampleRate +
        remainingBytes * US_PER_SECOND / (sampleRate * bytesPerFrame);
    return static_cast<int64_t>(durationUs);
}

bool IsCallbackUnavailable(const CodecUserData *codecUserData)
{
    return codecUserData == nullptr || codecUserData->isDestroyed.load();
}

void UpdateVideoOutputInfo(OH_AVFormat *format, CodecUserData *codecUserData)
{
    if (format == nullptr || codecUserData == nullptr) {
        return;
    }

    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &codecUserData->width);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &codecUserData->height);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &codecUserData->widthStride);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &codecUserData->heightStride);

    if (codecUserData->sampleInfo != nullptr) {
        int32_t pixelFormat = codecUserData->sampleInfo->video.pixelFormat;
        if (OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat)) {
            codecUserData->sampleInfo->video.pixelFormat = static_cast<OH_AVPixelFormat>(pixelFormat);
        }
    }
}
} // namespace

int32_t SampleCallback::OnRenderWriteData(OH_AudioRenderer *renderer, void *userData, void *buffer, int32_t length)
{
    (void)renderer;
    auto *codecUserData = static_cast<CodecUserData *>(userData);

    if (codecUserData == nullptr) {
        AVCODEC_SAMPLE_LOGE("codecUserData is nullptr in OnRenderWriteData");
        return -1;
    }

    if (IsCallbackUnavailable(codecUserData)) {
        AVCODEC_SAMPLE_LOGD("codecUserData is being destroyed, skip callback");
        return 0;
    }
    if (buffer == nullptr || length <= 0) {
        AVCODEC_SAMPLE_LOGE("Invalid audio render buffer");
        return -1;
    }

    auto *dest = static_cast<uint8_t *>(buffer);
    size_t index = 0;
    std::unique_lock<std::mutex> lock(codecUserData->outputMutex);
    while (!codecUserData->renderQueue.empty() && index < length) {
        dest[index] = codecUserData->renderQueue.front();
        ++index;
        codecUserData->renderQueue.pop();
    }
    if (index < static_cast<size_t>(length)) {
        std::fill(dest + index, dest + length, 0);
    }
    AVCODEC_SAMPLE_LOGD("render BufferLength:%{public}d Out buffer count: %{public}u, renderQueue.size: %{public}u "
                        "renderReadSize: %{public}u",
                        length, codecUserData->outputFrameCount,
                        static_cast<uint32_t>(codecUserData->renderQueue.size()), static_cast<uint32_t>(index));

    if (codecUserData->sampleInfo != nullptr) {
        const int32_t channelCount = codecUserData->sampleInfo->audio.audioChannelCount;
        const int32_t sampleRate = codecUserData->sampleInfo->audio.audioSampleRate;
        if (channelCount > 0 && sampleRate > 0) {
            const size_t bytesPerFrame = static_cast<size_t>(channelCount) * BYTES_PER_SAMPLE_2;
            codecUserData->audioFramesWritten += static_cast<int64_t>(index / bytesPerFrame);
            codecUserData->currentPosAudioBufferPts = codecUserData->endPosAudioBufferPts -
                GetQueuedAudioDurationUs(codecUserData->renderQueue.size(), *codecUserData->sampleInfo);
            if (codecUserData->playbackPositionUs != nullptr) {
                codecUserData->playbackPositionUs->store(codecUserData->currentPosAudioBufferPts);
            }
        }
    }

    if (codecUserData->renderQueue.size() < length) {
        codecUserData->renderCond.notify_all();
    }
    return 0;
}

int32_t SampleCallback::OnRenderStreamEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Event event)
{
    (void)renderer;
    (void)userData;
    (void)event;
    return 0;
}

int32_t SampleCallback::OnRenderInterruptEvent(OH_AudioRenderer *renderer, void *userData,
                                               OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint)
{
    (void)renderer;
    (void)userData;
    (void)type;
    (void)hint;
    return 0;
}

int32_t SampleCallback::OnRenderError(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Result error)
{
    (void)renderer;
    (void)error;
    auto *codecUserData = static_cast<CodecUserData *>(userData);
    if (!IsCallbackUnavailable(codecUserData)) {
        codecUserData->hasError.store(true);
        if (codecUserData->runningFlag != nullptr) {
            codecUserData->runningFlag->store(false);
        }
    }
    AVCODEC_SAMPLE_LOGE("OnRenderError");
    return 0;
}

void SampleCallback::OnCodecError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    auto *codecUserData = static_cast<CodecUserData *>(userData);
    if (!IsCallbackUnavailable(codecUserData)) {
        codecUserData->hasError.store(true);
        if (codecUserData->runningFlag != nullptr) {
            codecUserData->runningFlag->store(false);
        }
    }
    AVCODEC_SAMPLE_LOGE("On codec error, error code: %{public}d", errorCode);
}

void SampleCallback::OnCodecFormatChange(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    AVCODEC_SAMPLE_LOGI("On codec format change");
    auto *codecUserData = static_cast<CodecUserData *>(userData);
    if (IsCallbackUnavailable(codecUserData) || format == nullptr) {
        return;
    }
    std::unique_lock<std::shared_mutex> codecLock(codecUserData->codecMutex);
    UpdateVideoOutputInfo(format, codecUserData);
    int32_t pixelFormat = codecUserData->sampleInfo != nullptr ?
        codecUserData->sampleInfo->video.pixelFormat : -1;
    AVCODEC_SAMPLE_LOGI("Format changed: %{public}d*%{public}d, stride: %{public}d*%{public}d, "
        "pixel format: %{public}d",
                        codecUserData->width, codecUserData->height,
                        codecUserData->widthStride, codecUserData->heightStride, pixelFormat);
}

void SampleCallback::OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    auto *codecUserData = static_cast<CodecUserData *>(userData);
    if (IsCallbackUnavailable(codecUserData) || buffer == nullptr) {
        return;
    }
    if (codecUserData->isEncFirstFrame) {
        OH_AVFormat *format = OH_VideoEncoder_GetInputDescription(codec);
        if (format != nullptr) {
            OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &codecUserData->width);
            OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &codecUserData->height);
            OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &codecUserData->widthStride);
            OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &codecUserData->heightStride);
            OH_AVFormat_Destroy(format);
        }
        codecUserData->isEncFirstFrame = false;
    }
    codecUserData->inputBufferQueue.Enqueue(std::make_shared<CodecBufferInfo>(index, buffer));
}

// [Start quick_start]
static int32_t GetTemporalLayerID(OH_AVBuffer *buffer)
{
    int32_t layerID = -1;
    // 该能力依赖 API 26 Native SDK 中的 OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_LAYER_ID。
    // 若编译找不到该 Key，请确认 SDK 路径并清理 CMake 缓存；兼容旧 SDK 时可在cmake中将
    // AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID 设为 OFF。
#ifdef AVCODEC_SAMPLE_ENABLE_TEMPORAL_LAYER_ID
    OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
    if (format != nullptr) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_LAYER_ID, &layerID);
        OH_AVFormat_Destroy(format);
    }
#else
    (void)buffer;
#endif
    return layerID;
}

void SampleCallback::OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    // [StartExclude quick_start]
    auto *codecUserData = static_cast<CodecUserData *>(userData);
    if (IsCallbackUnavailable(codecUserData) || buffer == nullptr) {
        return;
    }
    if (codecUserData->isDecFirstFrame) {
        OH_AVFormat *format = OH_VideoDecoder_GetOutputDescription(codec);
        if (format != nullptr) {
            UpdateVideoOutputInfo(format, codecUserData);
            OH_AVFormat_Destroy(format);
        }
        codecUserData->isDecFirstFrame = false;
    }
    codecUserData->outputBufferQueue.Enqueue(std::make_shared<CodecBufferInfo>(index, buffer));
    // [EndExclude quick_start]

    // 从AVBuffer中获取时域层级信息。
    int32_t layerID = GetTemporalLayerID(buffer);
    if (layerID >= 0 && index % LIMIT_LOGD_FREQUENCY == 0) {
        AVCODEC_SAMPLE_LOGD("Temporal layer ID: %{public}d", layerID);
    }
}
// [End quick_start]
