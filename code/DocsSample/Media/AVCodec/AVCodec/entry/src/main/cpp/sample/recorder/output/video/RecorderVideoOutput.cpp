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

#undef LOG_TAG
#define LOG_TAG "recorder"

namespace {
constexpr int32_t NS_PER_US = 1000;
}

void Recorder::VideoEncOutputSyncThread()
{
    // [Start encoder_sync_output_buffer]
    while (isStarted_) {
        // [StartExclude encoder_sync_output_buffer]
        if (encContext_->hasError.load()) {
            AbortRecording("Video codec callback failed");
            break;
        }
        const int64_t waitStart = RecorderClockUs();
        // [EndExclude encoder_sync_output_buffer]
        CodecBufferInfo bufferInfo;
        const int32_t ret = videoEncoder_->GetOutputBuffer(bufferInfo, codecBufferTimeoutUs);
        if (!isStarted_) {
            // 输出线程退出后，由编码器Destroy统一回收未归还的Buffer。
            break;
        }
        if (ret == AVCODEC_SAMPLE_ERR_AGAIN) {
            continue;
        }
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AbortRecording("Video output buffer retrieval failed");
            break;
        }
        // [StartExclude encoder_sync_output_buffer]
        const int64_t receivedAtUs = RecorderClockUs();
        primaryStats_.RecordRetrieval(receivedAtUs - waitStart);
        // [EndExclude encoder_sync_output_buffer]
        if (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            // [StartExclude encoder_sync_output_buffer]
            RecordVideoOutputEos(bufferInfo, true, receivedAtUs);
            // [EndExclude encoder_sync_output_buffer]
            AVCODEC_SAMPLE_LOGI("Catch EOS, primary video output thread out");
            break;
        }
        // [StartExclude encoder_sync_output_buffer]
        if (!ProcessVideoOutputBuffer(bufferInfo, true, receivedAtUs)) {
            break;
        }
        // [EndExclude encoder_sync_output_buffer]
    }
    // [End encoder_sync_output_buffer]
    FinishVideoOutputThread(encContext_.get(), true);
}

void Recorder::VideoEncOutputAsyncThread()
{
    // [Start encoder_output_buffer]
    while (isStarted_) {
        // 获取输出buffer。
        const int64_t waitStart = RecorderClockUs();
        std::shared_ptr<CodecBufferInfo> bufferInfo = encContext_->outputBufferQueue.Dequeue();
        // 开发者可根据业务需要，对输出数据进行保存/释放处理。
        // 示例：将编码完成帧数据buffer写入到对应输出文件中。
        // outputFile->write(reinterpret_cast<char *>(OH_AVBuffer_GetAddr(bufferInfo->buffer)), bufferInfo->attr.size);
        // [StartExclude encoder_output_buffer]
        const int64_t receivedAtUs = RecorderClockUs();
        if (!isStarted_ || encContext_->hasError.load()) {
            // 停止或故障后不再消费输出，未归还的Buffer由Destroy统一回收。
            if (isStarted_) {
                AbortRecording("Video codec callback failed");
            }
            break;
        }
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");
        primaryStats_.RecordRetrieval(receivedAtUs - waitStart);
        // [EndExclude encoder_output_buffer]
        if (bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            // [StartExclude encoder_output_buffer]
            RecordVideoOutputEos(*bufferInfo, true, receivedAtUs);
            // [EndExclude encoder_output_buffer]
            AVCODEC_SAMPLE_LOGI("Catch EOS, primary video output thread out");
            break;
        }
        if (!ProcessVideoOutputBuffer(*bufferInfo, true, receivedAtUs)) {
            break;
        }
    }
    // [End encoder_output_buffer]
    FinishVideoOutputThread(encContext_.get(), true);
}

void Recorder::NormalizeVideoOutputTimestamp(CodecUserData &context, CodecBufferInfo &bufferInfo)
{
    if ((bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_SYNC_FRAME) ||
        bufferInfo.attr.flags == AVCODEC_BUFFER_FLAGS_NONE) {
        if (context.isFirstVideoSyncFrame.exchange(false)) {
            context.firstVideoSyncFramePts = bufferInfo.attr.pts;
        }
        if (!sampleInfo_.video.bufferInput) {
            bufferInfo.attr.pts = (bufferInfo.attr.pts - context.firstVideoSyncFramePts) / NS_PER_US;
        }
    } else {
        bufferInfo.attr.pts = 0;
    }
}

bool Recorder::ProcessVideoOutputBuffer(CodecBufferInfo &bufferInfo, bool isPrimary, int64_t receivedAtUs)
{
    auto *encoder = isPrimary ? videoEncoder_.get() : secondaryVideoEncoder_.get();
    auto *context = isPrimary ? encContext_.get() : secondaryEncContext_.get();
    auto *muxer = isPrimary ? muxer_.get() : secondaryMuxer_.get();
    NormalizeVideoOutputTimestamp(*context, bufferInfo);
    RecordVideoOutput(context, bufferInfo, isPrimary);
    auto &stats = isPrimary ? primaryStats_ : secondaryStats_;
    int64_t dumpUs = -1;
    int64_t muxerUs = -1;
    int32_t writeRet = AVCODEC_SAMPLE_ERR_OK;
    if (bufferInfo.attr.size > 0) {
        if ((isPrimary ? primaryDump_ : secondaryDump_).IsWriting()) {
            const int64_t start = RecorderClockUs();
            DumpVideoOutput(bufferInfo, isPrimary);
            dumpUs = RecorderClockUs() - start;
        }
        const int64_t muxerStart = RecorderClockUs();
        writeRet = muxer->WriteSample(muxer->GetVideoTrackId(), bufferInfo.buffer, bufferInfo.attr);
        muxerUs = RecorderClockUs() - muxerStart;
        if (writeRet == AVCODEC_SAMPLE_ERR_OK) {
            stats.Record(bufferInfo.attr);
        }
    }
    // 普通输出按原索引归还以供复用；EOS由输出线程退出后的Destroy统一回收。
    const int32_t freeRet = encoder->FreeOutputBuffer(bufferInfo);
    stats.RecordStages(muxerUs, dumpUs, RecorderClockUs() - receivedAtUs);
    RefreshStreamStorage(isPrimary);
    if (freeRet != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("recorder.video.release", freeRet, "归还视频编码输出 Buffer 失败");
        AbortRecording("Release encoded video buffer failed");
        return false;
    }
    if (writeRet != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording("Write encoded video sample failed");
        return false;
    }
    return true;
}

void Recorder::RecordVideoOutputEos(CodecBufferInfo &bufferInfo, bool isPrimary, int64_t receivedAtUs)
{
    auto *context = isPrimary ? encContext_.get() : secondaryEncContext_.get();
    NormalizeVideoOutputTimestamp(*context, bufferInfo);
    RecordVideoOutput(context, bufferInfo, isPrimary);
    (isPrimary ? primaryStats_ : secondaryStats_).RecordStages(-1, -1, RecorderClockUs() - receivedAtUs);
    RefreshStreamStorage(isPrimary);
    sessionReport_.Event(isPrimary ? "primary.eos" : "secondary.eos");
    (isPrimary ? videoOutputEosReceived_ : secondaryVideoOutputEosReceived_).store(true);
    outputDoneCond_.notify_all();
    // EOS不再交给编码器复用，保留至输出线程结束后由Destroy回收。
}

void Recorder::FinishVideoOutputThread(CodecUserData *context, bool isPrimary)
{
    sessionReport_.Event(isPrimary ? "primary.thread_end" : "secondary.thread_end");
    (isPrimary ? primaryStats_ : secondaryStats_).Stop();
    RefreshStreamStorage(isPrimary, true);
    AVCODEC_SAMPLE_LOGI("Exit, frame count: %{public}u", context->outputFrameCount.load());
    {
        std::lock_guard<std::mutex> lock(outputDoneMutex_);
        (isPrimary ? videoOutputDone_ : secondaryVideoOutputDone_).store(true);
        outputDoneCond_.notify_all();
    }
    if (!isStopping_ && videoOutputDone_.load() &&
        (secondaryVideoEncoder_ == nullptr || secondaryVideoOutputDone_.load())) {
        StartRelease();
    }
}
