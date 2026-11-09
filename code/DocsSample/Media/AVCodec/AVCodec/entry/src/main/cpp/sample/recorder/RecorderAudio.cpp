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

#include "Recorder.h"
#include <limits>

namespace {
constexpr int64_t MICROSECOND = 1000000;
constexpr int64_t TIMEOUT_US = 5000000;
constexpr int32_t AUDIO_INPUT_STOP_POLL_INTERVAL_MS = 10;
constexpr auto AUDIO_INPUT_ASYNC_WAIT = std::chrono::seconds(5);
constexpr auto AUDIO_INPUT_SYNC_WAIT = std::chrono::milliseconds(100);
constexpr int64_t AUDIO_INPUT_QUERY_TIMEOUT_US = 100000;
constexpr int32_t AUDIO_INPUT_CALLBACK_WAIT_MS = 100;
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
    audioEncContext_ = context.release();

    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Recorder::AudioEncInputAsyncThread]
void Recorder::AudioEncInputAsyncThread()
{
    while (isStarted_ && !isEos_) {
        if (isStopping_.load()) {
            std::this_thread::sleep_for(std::chrono::milliseconds(AUDIO_INPUT_STOP_POLL_INTERVAL_MS));
            continue;
        }
        if (!WaitForAudioInputFrame(AUDIO_INPUT_ASYNC_WAIT)) {
            continue;
        }
        std::unique_lock<std::mutex> inputLock(mediaInputMutex_);
        if (isPaused_ || !isStarted_ || isEos_) { continue; }
        std::shared_ptr<CodecBufferInfo> bufferInfo =
            audioEncContext_->inputBufferQueue.Dequeue(AUDIO_INPUT_CALLBACK_WAIT_MS);
        std::shared_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
        if (audioEncContext_->hasError.load()) {
            AbortRecording("Audio codec callback failed");
            break;
        }
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Audio buffer queue is empty, continue");
        if (!SubmitAudioInputFrame(*bufferInfo)) {
            break;
        }
        ++audioEncContext_->inputFrameCount;
    }
}
// [End Recorder::AudioEncInputAsyncThread]

bool Recorder::WaitForAudioInputFrame(std::chrono::milliseconds timeout)
{
    std::unique_lock<std::mutex> lock(audioEncContext_->inputMutex);
    audioEncContext_->inputCond.wait_for(lock, timeout, [this]() {
        return !isStarted_ || isEos_.load() ||
            (!isPaused_ && audioEncContext_->remainlen >= sampleInfo_.audio.audioMaxInputSize);
    });
    return isStarted_ && !isEos_.load() && !isPaused_ &&
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
    const int32_t ret = audioEncoder_->PushInputData(bufferInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording("Audio input push failed");
        return false;
    }
    audioSubmittedFrames_ += inputSize / sampleInfo_.audio.audioChannelCount / sizeof(int16_t);
    return true;
}

// [Start Recorder::AudioEncOutputAsyncThread]
void Recorder::AudioEncOutputAsyncThread()
{
    while (isStarted_) {
        std::shared_ptr<CodecBufferInfo> bufferInfo = audioEncContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        if (audioEncContext_->hasError.load()) {
            AbortRecording("Audio codec callback failed");
            break;
        }
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");

        if (!ProcessAudioOutputBuffer(*bufferInfo)) {
            break;
        }
    }
    AVCODEC_SAMPLE_LOGI("Exit, frame count: %{public}u", audioEncContext_->inputFrameCount);
}
// [End Recorder::AudioEncOutputAsyncThread]

// [Start Recorder::AudioEncInputSyncThread]
void Recorder::AudioEncInputSyncThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Audio encoder sync thread out");
        // 收到EOS后停止提交新输入，但输出线程仍会继续排空已编码样本。
        if (isEos_.load()) {
            AVCODEC_SAMPLE_LOGI("Audio input thread received EOS signal, stopping input");
            break;
        }
        // 等待缓存凑满一帧；不完整音频数据会造成时长和时间戳异常。
        if (!WaitForAudioInputFrame(AUDIO_INPUT_SYNC_WAIT)) {
            if (!isStarted_ || isEos_.load()) {
                break;
            }
            continue;
        }
        // 数据充足后才可以申请codec输入buffer；减少申请成功后因缓存不足无法及时归还的风险。
        std::unique_lock<std::mutex> inputLock(mediaInputMutex_);
        if (isPaused_ || !isStarted_ || isEos_) { continue; }
        CodecBufferInfo bufferInfo;
        bufferInfo.bufferIndex = std::numeric_limits<uint32_t>::max();
        auto buffer = audioEncoder_->GetInputBuffer(bufferInfo, AUDIO_INPUT_QUERY_TIMEOUT_US);
        if (buffer == nullptr) {
            if (bufferInfo.bufferIndex != std::numeric_limits<uint32_t>::max()) {
                // Query已成功但Get失败时，索引可能仍由应用持有；结束会话交由codec回收。
                AbortRecording("Synchronous audio input buffer retrieval failed");
                break;
            }
            AVCODEC_SAMPLE_LOGW("Get input buffer timeout, retry");
            continue;
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
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Audio encoder output thread out");
        CodecBufferInfo bufferInfo;
        int32_t errCode = audioEncoder_->GetOutputBuffer(bufferInfo, TIMEOUT_US);
        if (errCode == AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGI("AVCODEC_SAMPLE_ERR_OK");
        } else if (errCode == AVCODEC_SAMPLE_ERR_ERROR) {
            if (isStarted_ && !isStopping_) {
                AbortRecording("Audio output buffer retrieval failed");
            }
            break;
        } else if (errCode == AVCODEC_SAMPLE_ERR_END) {
            AVCODEC_SAMPLE_LOGI("Audio output thread reached EOS");
            break;
        } else {
            AVCODEC_SAMPLE_LOGW("Get output buffer timeout, retry");
            continue;
        }

        if (!ProcessAudioOutputBuffer(bufferInfo)) {
            break;
        }
    }
    // 同步模式仍由视频线程触发释放；音频先结束时，视频仍在使用Muxer。
    AVCODEC_SAMPLE_LOGI("Audio output thread exited, waiting for video thread to trigger release");
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
    const int32_t freeRet = audioEncoder_->FreeOutputData(bufferInfo.bufferIndex);
    if (writeRet != AVCODEC_SAMPLE_ERR_OK || freeRet != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording(writeRet != AVCODEC_SAMPLE_ERR_OK ? "Write encoded audio sample failed" :
            "Release encoded audio buffer failed");
        return false;
    }
    if (eos) {
        audioEosReceived_ = true;
        sessionReport_.Event("audio.eos");
        isAudioEos_.store(true);
        audioStats_.Stop();
        videoEosCond_.notify_all();
        return false;
    }
    return true;
}
