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

#include "../../core/Recorder.h"

namespace {
constexpr int64_t MICROSECOND = 1000000;
constexpr auto AUDIO_INPUT_ASYNC_WAIT = std::chrono::milliseconds(100);
constexpr auto AUDIO_INPUT_SYNC_WAIT = std::chrono::milliseconds(100);
constexpr int64_t AUDIO_INPUT_QUERY_TIMEOUT_US = 100000;
constexpr int32_t AUDIO_INPUT_CALLBACK_WAIT_MS = 100;
constexpr int32_t AUDIO_EOS_WAIT_MS = 5000;
constexpr int64_t AUDIO_EOS_WAIT_US = AUDIO_EOS_WAIT_MS * 1000LL;
}

int32_t Recorder::CreateAudioEncoder()
{
    int32_t ret = audioEncoder_->Create(sampleInfo_.audio.audioCodecMime);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create audio encoder(%{public}s) failed",
                             sampleInfo_.audio.audioCodecMime.c_str());
    AVCODEC_SAMPLE_LOGI("Create audio encoder(%{public}s)", sampleInfo_.audio.audioCodecMime.c_str());

    // Config失败时先销毁codec，再回收临时上下文，避免已注册回调借用悬空指针。
    std::unique_ptr<CodecUserData> context = std::make_unique<CodecUserData>();
    context->recordingAudioStats = &audioStats_;
    context->failureDetails = &failure_;
    ret = audioEncoder_->Config(sampleInfo_, context.get());
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        (void)audioEncoder_->Release();
        return ret;
    }
    audioEncContext_ = std::move(context);

    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Recorder::AudioEncInputAsyncThread]
void Recorder::AudioEncInputAsyncThread()
{
    while (isStarted_ && !audioInputStopping_) {
        if (audioEncContext_->hasError.load()) {
            AbortRecording("Audio codec callback failed");
            break;
        }
        if (!WaitForAudioInputFrame(AUDIO_INPUT_ASYNC_WAIT)) {
            continue;
        }
        std::unique_lock<std::mutex> inputLock(mediaInputMutex_);
        if (isPaused_ || !isStarted_ || audioInputStopping_) {
            continue;
        }
        const auto bufferInfo = audioEncContext_->inputBufferQueue.Dequeue(AUDIO_INPUT_CALLBACK_WAIT_MS);
        if (audioEncContext_->hasError.load()) {
            AbortRecording("Audio codec callback failed");
            break;
        }
        if (!isStarted_) {
            break;
        }
        if (bufferInfo == nullptr) {
            continue;
        }
        if (!SubmitAudioInputFrame(*bufferInfo)) {
            break;
        }
    }
}
// [End Recorder::AudioEncInputAsyncThread]

bool Recorder::WaitForAudioInputFrame(std::chrono::milliseconds timeout)
{
    std::unique_lock<std::mutex> lock(audioEncContext_->inputMutex);
    audioEncContext_->inputCond.wait_for(lock, timeout, [this]() {
        return !isStarted_ || audioInputStopping_ || audioEncContext_->hasError ||
            (!isPaused_ && audioEncContext_->remainlen >= sampleInfo_.audio.audioMaxInputSize);
    });
    return isStarted_ && !audioInputStopping_ && !audioEncContext_->hasError && !isPaused_ &&
        audioEncContext_->remainlen >= sampleInfo_.audio.audioMaxInputSize;
}

bool Recorder::SubmitAudioInputFrame(CodecBufferInfo &bufferInfo)
{
    // buffer地址仅在填充并提交给编码器期间有效，不跨回调或工作线程保存。
    OH_AVBuffer *buffer = bufferInfo.buffer;
    const int32_t inputSize = sampleInfo_.audio.audioMaxInputSize;
    const int32_t capacity = buffer == nullptr ? -1 : OH_AVBuffer_GetCapacity(buffer);
    uint8_t *inputBufferAddr = buffer == nullptr ? nullptr : OH_AVBuffer_GetAddr(buffer);
    if (inputSize <= 0 || inputBufferAddr == nullptr || capacity < inputSize) {
        AbortRecording("Invalid audio input buffer");
        return false;
    }

    bool readSuccess = false;
    {
        std::unique_lock<std::mutex> lock(audioEncContext_->inputMutex);
        readSuccess = audioEncContext_->ReadCache(inputBufferAddr, inputSize);
        audioStats_.Capture(0, audioEncContext_->remainlen);
    }
    if (!readSuccess) {
        AbortRecording("Audio cache read failed");
        return false;
    }

    bufferInfo.attr.size = inputSize;
    bufferInfo.attr.offset = 0;
    // PCM没有容器时间戳，按已提交的S16LE样本帧生成微秒PTS，避免重复使用零时间戳。
    bufferInfo.attr.pts = audioCaptureOffsetUs_ +
        audioSubmittedFrames_ * MICROSECOND / sampleInfo_.audio.audioSampleRate;
    bufferInfo.attr.flags = isAudioEncFirstFrame_ ? AVCODEC_BUFFER_FLAGS_CODEC_DATA : AVCODEC_BUFFER_FLAGS_NONE;
    isAudioEncFirstFrame_ = false;
    const int32_t ret = audioEncoder_->PushInputBuffer(bufferInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording("Audio input push failed");
        return false;
    }
    ++audioEncContext_->inputFrameCount;
    audioSubmittedFrames_ += inputSize / sampleInfo_.audio.audioChannelCount / sizeof(int16_t);
    return true;
}

// [Start Recorder::AudioEncOutputAsyncThread]
void Recorder::AudioEncOutputAsyncThread()
{
    while (isStarted_) {
        const auto bufferInfo = audioEncContext_->outputBufferQueue.Dequeue();
        if (!isStarted_ || audioEncContext_->hasError.load()) {
            if (bufferInfo != nullptr && audioEncoder_->FreeOutputBuffer(*bufferInfo) != AVCODEC_SAMPLE_ERR_OK) {
                failure_.Record("recorder.audio.release", AVCODEC_SAMPLE_ERR_ERROR,
                    "Return audio output while stopping failed");
            }
            if (isStarted_) {
                AbortRecording("Audio codec callback failed");
            }
            break;
        }
        if (bufferInfo == nullptr) {
            continue;
        }
        if (!ProcessAudioOutputBuffer(*bufferInfo)) {
            break;
        }
    }
    FinishAudioOutputThread();
}
// [End Recorder::AudioEncOutputAsyncThread]

// [Start Recorder::AudioEncInputSyncThread]
void Recorder::AudioEncInputSyncThread()
{
    while (isStarted_ && !audioInputStopping_) {
        if (audioEncContext_->hasError.load()) {
            AbortRecording("Audio codec callback failed");
            break;
        }
        if (!WaitForAudioInputFrame(AUDIO_INPUT_SYNC_WAIT)) {
            continue;
        }
        // PCM充足后才取得输入Buffer，同步模式只通过Query/Get获取。
        std::unique_lock<std::mutex> inputLock(mediaInputMutex_);
        if (isPaused_ || !isStarted_ || audioInputStopping_) {
            continue;
        }
        CodecBufferInfo bufferInfo;
        const int32_t ret = audioEncoder_->GetInputBuffer(bufferInfo, AUDIO_INPUT_QUERY_TIMEOUT_US);
        if (!isStarted_) {
            break;
        }
        if (ret == AVCODEC_SAMPLE_ERR_AGAIN) {
            continue;
        }
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AbortRecording("Synchronous audio input buffer retrieval failed");
            break;
        }
        if (!SubmitAudioInputFrame(bufferInfo)) {
            break;
        }
    }
}
// [End Recorder::AudioEncInputSyncThread]

// [Start Recorder::AudioEncOutputSyncThread]
void Recorder::AudioEncOutputSyncThread()
{
    while (isStarted_) {
        if (audioEncContext_->hasError.load()) {
            AbortRecording("Audio codec callback failed");
            break;
        }
        CodecBufferInfo bufferInfo;
        const int32_t ret = audioEncoder_->GetOutputBuffer(bufferInfo, codecBufferTimeoutUs);
        if (!isStarted_) {
            if (ret == AVCODEC_SAMPLE_ERR_OK &&
                audioEncoder_->FreeOutputBuffer(bufferInfo) != AVCODEC_SAMPLE_ERR_OK) {
                failure_.Record("recorder.audio.release", AVCODEC_SAMPLE_ERR_ERROR,
                    "Return audio output while stopping failed");
            }
            break;
        }
        if (ret == AVCODEC_SAMPLE_ERR_AGAIN) {
            continue;
        }
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AbortRecording("Audio output buffer retrieval failed");
            break;
        }
        if (!ProcessAudioOutputBuffer(bufferInfo)) {
            break;
        }
    }
    FinishAudioOutputThread();
}
// [End Recorder::AudioEncOutputSyncThread]

// 同步和异步模式共用写入路径，保证两种模式对buffer归还和错误处理的规则一致。
bool Recorder::ProcessAudioOutputBuffer(CodecBufferInfo &bufferInfo)
{
    ++audioEncContext_->outputFrameCount;
    const bool eos = (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    const bool media = !eos && bufferInfo.attr.size > 0 &&
        (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0;
    if (media) {
        if (audioStats_.Output(bufferInfo.attr.pts, bufferInfo.attr.size)) {
            sessionReport_.Event("audio.first_output");
        }
    }
    int32_t writeRet = AVCODEC_SAMPLE_ERR_OK;
    if (!eos && bufferInfo.attr.size > 0) {
        const int64_t begin = RecorderClockUs();
        writeRet = muxer_->WriteSample(muxer_->GetAudioTrackId(), bufferInfo.buffer, bufferInfo.attr);
        audioStats_.Write(true, RecorderClockUs() - begin, writeRet == AVCODEC_SAMPLE_ERR_OK);
        if (writeRet == AVCODEC_SAMPLE_ERR_OK && secondaryMuxer_ != nullptr) {
            const int64_t secondaryBegin = RecorderClockUs();
            writeRet = secondaryMuxer_->WriteSample(
                secondaryMuxer_->GetAudioTrackId(), bufferInfo.buffer, bufferInfo.attr);
            audioStats_.Write(false, RecorderClockUs() - secondaryBegin, writeRet == AVCODEC_SAMPLE_ERR_OK);
        }
    }
    // 即使写入失败也先归还同一索引，随后由正常的错误收尾路径释放会话。
    const int32_t freeRet = audioEncoder_->FreeOutputBuffer(bufferInfo);
    if (writeRet != AVCODEC_SAMPLE_ERR_OK || freeRet != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording(writeRet != AVCODEC_SAMPLE_ERR_OK ? "Write encoded audio sample failed" :
            "Release encoded audio buffer failed");
        return false;
    }
    if (eos) {
        audioOutputEosReceived_ = true;
        sessionReport_.Event("audio.eos");
        audioStats_.Stop();
        outputDoneCond_.notify_all();
        return false;
    }
    return true;
}

void Recorder::FinishAudioOutputThread()
{
    audioStats_.Stop();
    sessionReport_.Event("audio.thread_end");
    AVCODEC_SAMPLE_LOGI("Audio output finished, output frames: %{public}u", audioEncContext_->outputFrameCount);
    std::lock_guard<std::mutex> lock(outputDoneMutex_);
    audioOutputDone_.store(true);
    outputDoneCond_.notify_all();
}

// EOS获取与普通输入一样，分别展示同步查询和异步回调队列。
// [Start recorder_audio_eos_sync]
int32_t Recorder::SendAudioEndOfStreamSync()
{
    CodecBufferInfo bufferInfo;
    const int32_t ret = audioEncoder_->GetInputBuffer(bufferInfo, AUDIO_EOS_WAIT_US);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Get synchronous audio EOS input buffer failed");
    return audioEncoder_->NotifyEndOfStream(bufferInfo);
}
// [End recorder_audio_eos_sync]

// [Start recorder_audio_eos_async]
int32_t Recorder::SendAudioEndOfStreamAsync()
{
    CHECK_AND_RETURN_RET_LOG(audioEncContext_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Audio context is null");
    // 异步模式只能使用输入回调给出的Buffer，不能调用同步QueryInputBuffer接口。
    const auto input = audioEncContext_->inputBufferQueue.Dequeue(AUDIO_EOS_WAIT_MS);
    CHECK_AND_RETURN_RET_LOG(input != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Get asynchronous audio EOS input buffer failed");
    CodecBufferInfo bufferInfo = *input;
    return audioEncoder_->NotifyEndOfStream(bufferInfo);
}
// [End recorder_audio_eos_async]
