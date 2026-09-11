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

#include <cinttypes>
#include <shared_mutex>
#include <utility>
#include "AudioOutputPump.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "AudioOutputPump"

namespace {
constexpr int64_t CODEC_BUFFER_TIMEOUT_US = 100000;
}

AudioOutputPump::AudioOutputPump(Config config)
    : decoder_(config.decoder), context_(config.context), running_(config.running),
      playbackFailed_(config.playbackFailed),
      outputPrepareCallback_(std::move(config.outputPrepareCallback)),
      outputCallback_(std::move(config.outputCallback)),
      dumpCallback_(std::move(config.dumpCallback))
{
}

void AudioOutputPump::MarkPlaybackFailed(const char *message)
{
    AVCODEC_SAMPLE_LOGE("%{public}s", message);
    playbackFailed_ = true;
    running_ = false;
}

bool AudioOutputPump::EnqueueOutput(CodecBufferInfo &bufferInfo)
{
    if (bufferInfo.buffer == nullptr) {
        MarkPlaybackFailed("Audio output buffer is null");
        return false;
    }
    uint8_t *source = OH_AVBuffer_GetAddr(bufferInfo.buffer);
    if (source == nullptr) {
        MarkPlaybackFailed("Audio output buffer address is null");
        return false;
    }
    if (bufferInfo.attr.offset < 0 || bufferInfo.attr.size <= 0) {
        MarkPlaybackFailed("Audio output buffer range is invalid");
        return false;
    }
    const int32_t capacity = OH_AVBuffer_GetCapacity(bufferInfo.buffer);
    if (capacity < 0 || bufferInfo.attr.offset > capacity ||
        bufferInfo.attr.size > capacity - bufferInfo.attr.offset) {
        MarkPlaybackFailed("Audio output buffer exceeds its capacity");
        return false;
    }
    source += bufferInfo.attr.offset;

    std::unique_lock<std::mutex> lock(context_.outputMutex);
    for (int32_t i = 0; i < bufferInfo.attr.size; i++) {
        context_.renderQueue.push(source[i]);
    }
    return true;
}

bool AudioOutputPump::HandleOutputBuffer(CodecBufferInfo &bufferInfo, bool dumpOutput)
{
    context_.outputFrameCount++;
    AVCODEC_SAMPLE_LOGW("Output count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
        context_.outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
    if (outputPrepareCallback_ && !outputPrepareCallback_(bufferInfo)) {
        int32_t ret = decoder_.FreeOutputBuffer(bufferInfo.bufferIndex, false);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            MarkPlaybackFailed("Free discarded audio output buffer failed");
            return false;
        }
        return running_ && !playbackFailed_;
    }
    if (!EnqueueOutput(bufferInfo)) {
        return false;
    }
    if (dumpOutput && dumpCallback_) {
        dumpCallback_(bufferInfo);
    }
    return outputCallback_(bufferInfo);
}

bool AudioOutputPump::ProcessAsyncOutput()
{
    CHECK_AND_RETURN_RET_LOG(running_, false, "Audio decoder output thread out");
    std::shared_ptr<CodecBufferInfo> bufferInfo = context_.outputBufferQueue.Dequeue();
    std::shared_lock<std::shared_mutex> codecLock(context_.codecMutex);
    CHECK_AND_RETURN_RET_LOG(running_, false, "Audio decoder output thread out");
    if (bufferInfo == nullptr || !bufferInfo->isValid) {
        AVCODEC_SAMPLE_LOGW("Buffer queue is empty or invalid, continue");
        return true;
    }
    CHECK_AND_RETURN_RET_LOG(!(bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS), false,
        "Catch EOS, thread out");
    return HandleOutputBuffer(*bufferInfo, true);
}

bool AudioOutputPump::ProcessSyncOutput()
{
    CHECK_AND_RETURN_RET_LOG(running_, false, "Audio decoder output sync thread out");
    CodecBufferInfo bufferInfo(nullptr);
    int32_t errCode = decoder_.GetOutputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
    if (errCode == AVCODEC_SAMPLE_ERR_END) {
        AVCODEC_SAMPLE_LOGI("Audio decoder reached EOS");
        return false;
    }
    if (errCode == AVCODEC_SAMPLE_ERR_ERROR) {
        MarkPlaybackFailed("Audio decoder output failed");
        return false;
    }
    if (errCode != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGI("No audio output buffer available, continue");
        return true;
    }
    return HandleOutputBuffer(bufferInfo, false);
}
