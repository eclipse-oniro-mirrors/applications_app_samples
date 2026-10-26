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
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include <sstream>

#undef LOG_TAG
#define LOG_TAG "recorder"

namespace {
constexpr int64_t MAX_DYNAMIC_VIDEO_BITRATE = 100000000;
std::string EncoderOutputSnapshot(VideoEncoder *encoder, const char *name)
{
    if (encoder == nullptr) {
        return std::string(name) + "=disabled";
    }
    std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> format(
        encoder->GetOutputDescription(), OH_AVFormat_Destroy);
    if (format == nullptr) {
        return std::string(name) + "=output description unavailable";
    }
    int32_t width = 0;
    int32_t height = 0;
    int64_t bitrate = 0;
    double frameRate = 0;
    std::ostringstream text;
    text << name << ": ";
    if (OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_WIDTH, &width) &&
        OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_HEIGHT, &height)) {
        text << "size=" << width << "x" << height << "; ";
    }
    if (OH_AVFormat_GetDoubleValue(format.get(), OH_MD_KEY_FRAME_RATE, &frameRate)) {
        text << "fps=" << frameRate << "; ";
    }
    if (OH_AVFormat_GetLongValue(format.get(), OH_MD_KEY_BITRATE, &bitrate)) {
        text << "bitrate=" << bitrate;
    }
    text << " (missing fields are not reported by codec; measured stream statistics are separate)";
    return text.str();
}
}

void Recorder::CaptureEncoderDescription(bool primary)
{
    auto *encoder = primary ? videoEncoder_.get() : secondaryVideoEncoder_.get();
    if (encoder == nullptr) { return; }
    std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> format(
        encoder->GetOutputDescription(), OH_AVFormat_Destroy);
    int32_t width = 0;
    int32_t height = 0;
    double fps = 0;
    int64_t bitrate = 0;
    if (format != nullptr) {
        (void)OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_WIDTH, &width);
        (void)OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_HEIGHT, &height);
        (void)OH_AVFormat_GetDoubleValue(format.get(), OH_MD_KEY_FRAME_RATE, &fps);
        (void)OH_AVFormat_GetLongValue(format.get(), OH_MD_KEY_BITRATE, &bitrate);
    }
    std::string description = EncoderOutputSnapshot(encoder, primary ? "primary" : "secondary");
    description += "; actualCodecName=not reported";
    // 输出描述不等同于码流解析。未读取码流的尺寸和 HDR 元数据时，不把请求配置当作实测结论。
    description += "; bitstream size/HDR=not verified";
    (primary ? primaryStats_ : secondaryStats_).ConfigureDescription(
        DescribeCodecRequest(primary ? sampleInfo_ : secondarySampleInfo_, true), description,
        width, height, fps, bitrate);
}

int32_t Recorder::UpdateVideoParameters(const std::string &sessionId, bool primary, int64_t bitrate,
    bool requestKeyFrame)
{
    // 与 Init/Release 共用生命周期锁。异步请求还需匹配会话，防止旧页面请求落到新编码器上。
    std::lock_guard<std::mutex> lock(mutex_);
    if (!isStarted_.load() || isStopping_.load() || isEos_.load() ||
        sessionId != sampleInfo_.output.sessionId) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    VideoEncoder *encoder = primary ? videoEncoder_.get() : secondaryVideoEncoder_.get();
    if (encoder == nullptr || bitrate < 0 || bitrate > MAX_DYNAMIC_VIDEO_BITRATE ||
        (bitrate == 0 && !requestKeyFrame)) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> format(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    if (format == nullptr || (bitrate > 0 && !OH_AVFormat_SetLongValue(format.get(), OH_MD_KEY_BITRATE, bitrate)) ||
        (requestKeyFrame && !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_REQUEST_I_FRAME, 1))) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const int32_t ret = encoder->SetParameter(format.get());
    (primary ? primaryStats_ : secondaryStats_).ParameterResult(bitrate, requestKeyFrame, ret == AVCODEC_SAMPLE_ERR_OK);
    const std::string update = std::string(primary ? "primary" : "secondary") +
        " bitrate=" + std::to_string(bitrate) + "; requestKeyFrame=" + std::to_string(requestKeyFrame) +
        "; result=" + std::to_string(ret);
    sessionReport_.Change(update);
    AVCODEC_SAMPLE_LOGI("Session %{public}s update: %{public}s", sessionId.c_str(), update.c_str());
    // 返回成功只表示编码器接受参数；实际码率仍由输出字节数和 PTS 统计，关键帧以输出 flags 为准。
    return ret;
}

int32_t Recorder::InitializeSession(SampleInfo &sampleInfo)
{
    // 本次录制会话独占封装器、编码器和采集器，失败时由 ReleaseThread 回收已创建的资源。
    audioEncoder_ = std::make_unique<AudioEncoder>();
    audioCapturer_ = std::make_unique<AudioCapturer>();
    videoEncoder_ = std::make_unique<VideoEncoder>();
    muxer_ = std::make_unique<Muxer>();
    if (sampleInfo_.output.enableDualOutput) {
        secondaryVideoEncoder_ = std::make_unique<VideoEncoder>();
        secondaryMuxer_ = std::make_unique<Muxer>();
    }

    int32_t ret = muxer_->Create(sampleInfo_.output.outputFd, sampleInfo_.output.outputFormat);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create muxer with fd(%{public}d) failed",
                             sampleInfo_.output.outputFd);

    ret = muxer_->Config(sampleInfo_);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Recorder muxer config failed");

    ret = InitializeSecondaryMuxer();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Configure secondary muxer failed");

    ret = CreateAudioEncoder();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create audio encoder failed");

    audioCapturer_->AudioCapturerInit(sampleInfo_, audioEncContext_);

    ret = CreateVideoEncoder();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create video encoder failed");
    primaryStats_.Reset(sampleInfo_.video, true);
    secondaryStats_.Reset(secondarySampleInfo_.video, secondaryVideoEncoder_ != nullptr);
    encContext_->outputBufferQueue.EnableDiagnostics();
    if (secondaryEncContext_ != nullptr) {
        secondaryEncContext_->outputBufferQueue.EnableDiagnostics();
    }
    CaptureEncoderDescription(true);
    if (secondaryVideoEncoder_ != nullptr) {
        CaptureEncoderDescription(false);
    }
    sessionReport_.Observe(EncoderOutputSnapshot(videoEncoder_.get(), "primary") + "\n" +
        EncoderOutputSnapshot(secondaryVideoEncoder_.get(), "secondary"));
    (void)OpenVideoDumpFiles();
    sampleInfo.video.window = sampleInfo_.video.window;
    return ret;
}

void Recorder::OpenVideoDumpFiles()
{
    primaryDump_.Open(sampleInfo_.output.enableVideoDump ? sampleInfo_.output.videoDumpPath : "",
        sampleInfo_.output, sampleInfo_.video);
    secondaryDump_.Open(sampleInfo_.output.enableVideoDump && sampleInfo_.output.enableDualOutput ?
        sampleInfo_.output.secondaryVideoDumpPath : "", sampleInfo_.output, secondarySampleInfo_.video);
    RefreshStreamStorage(true, true);
    if (sampleInfo_.output.enableDualOutput) { RefreshStreamStorage(false, true); }
}

void Recorder::DumpVideoOutput(const CodecBufferInfo &bufferInfo, bool isPrimary)
{
    (isPrimary ? primaryDump_ : secondaryDump_).Write(bufferInfo);
}

void Recorder::CloseVideoDumpFiles()
{
    primaryDump_.Close();
    secondaryDump_.Close();
}

int32_t Recorder::StartVideoPipeline()
{
    isEos_ = false;
    int32_t ret = StartVideoMuxers();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return ret;
    }
    ret = StartVideoEncoders();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return ret;
    }
    isStarted_ = true;
    primaryStats_.Start();
    secondaryStats_.Start();
    const int32_t outputThreadRet = StartVideoOutputThreads();
    if (outputThreadRet != AVCODEC_SAMPLE_ERR_OK) {
        isStarted_.store(false);
    }
    return outputThreadRet;
}

int32_t Recorder::StartVideoMuxers()
{
    // 先启动 Muxer，确保首个编码输出到达时容器轨道已可写。
    int32_t ret = muxer_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Muxer start failed");
        return ret;
    }
    if (secondaryMuxer_ != nullptr && secondaryMuxer_->Start() != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Secondary muxer start failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StartVideoEncoders()
{
    int32_t ret = videoEncoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Video encoder start failed");
        return ret;
    }
    if (secondaryVideoEncoder_ != nullptr && secondaryVideoEncoder_->Start() != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Secondary video encoder start failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StartVideoOutputThreads()
{
    if (sampleInfo_.codec.codecSyncMode) {
        encOutputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncOutputSyncThread, this,
            videoEncoder_.get(), encContext_, muxer_.get(), true);
        if (secondaryVideoEncoder_ != nullptr) {
            secondaryEncOutputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncOutputSyncThread, this,
                secondaryVideoEncoder_.get(), secondaryEncContext_, secondaryMuxer_.get(), false);
        }
    } else {
        encOutputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncOutputAsyncThread, this,
            videoEncoder_.get(), encContext_, muxer_.get(), true);
        if (secondaryVideoEncoder_ != nullptr) {
            secondaryEncOutputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncOutputAsyncThread, this,
                secondaryVideoEncoder_.get(), secondaryEncContext_, secondaryMuxer_.get(), false);
        }
    }
    if (encOutputThread_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create thread failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::CreateVideoEncoder()
{
    const bool enablePreproc = sampleInfo_.video.preprocMode != 0 || sampleInfo_.video.dropToFrameRate > 0.0 ||
        sampleInfo_.output.enableDualOutput;
    CHECK_AND_RETURN_RET_LOG(!enablePreproc || sampleInfo_.codec.codecName.empty(), AVCODEC_SAMPLE_ERR_ERROR,
        "Named encoder cannot use the dedicated preprocessor creation path");
    int32_t ret = enablePreproc ? videoEncoder_->CreatePrimaryWithPreproc(sampleInfo_.video.videoCodecMime) :
        (sampleInfo_.codec.codecName.empty() ? videoEncoder_->Create(sampleInfo_.video.videoCodecMime) :
            videoEncoder_->CreateByName(sampleInfo_.codec.codecName));
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create video encoder failed");

    // Config 失败时先销毁 codec，再回收临时上下文，避免已注册回调借用悬空指针。
    std::unique_ptr<CodecUserData> context = std::make_unique<CodecUserData>();
    context->sampleInfo = &sampleInfo_;
    context->failureDetails = &failure_;
    ret = videoEncoder_->Config(sampleInfo_, context.get());
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        // 配置可能已经创建输出 Surface，销毁 codec 后才能归还窗口引用。
        (void)videoEncoder_->Release();
        if (sampleInfo_.video.window != nullptr) {
            OH_NativeWindow_DestroyNativeWindow(sampleInfo_.video.window);
            sampleInfo_.video.window = nullptr;
        }
        return ret;
    }
    encContext_ = context.release();

    if (sampleInfo_.output.enableDualOutput) {
        secondaryEncContext_ = new CodecUserData();
        secondaryEncContext_->sampleInfo = &secondarySampleInfo_;
        secondaryEncContext_->failureDetails = &failure_;
        ret = secondaryVideoEncoder_->CreateSecondaryFromPrimary(*videoEncoder_);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            return ret;
        }
        ret = secondaryVideoEncoder_->Config(secondarySampleInfo_, secondaryEncContext_, false);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            (void)secondaryVideoEncoder_->Release();
            delete secondaryEncContext_;
            secondaryEncContext_ = nullptr;
            return ret;
        }
        // 副编码器共享主路输入 Surface，不再向 ArkTS 暴露第二个 CameraKit VideoOutput。
    }

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::InitializeSecondaryMuxer()
{
    if (sampleInfo_.output.enableDualOutput) {
        CHECK_AND_RETURN_RET_LOG(sampleInfo_.output.secondaryOutputFd >= 0 && secondaryMuxer_ != nullptr,
            AVCODEC_SAMPLE_ERR_ERROR, "Secondary output is not available");
        SampleInfo secondaryInfo = sampleInfo_;
        secondaryInfo.output.outputFd = sampleInfo_.output.secondaryOutputFd;
        secondaryInfo.output.enableDualOutput = false;
        const int32_t secondaryWidth = sampleInfo_.output.secondaryVideoWidth > 0 ?
            sampleInfo_.output.secondaryVideoWidth : sampleInfo_.video.videoWidth;
        const int32_t secondaryHeight = sampleInfo_.output.secondaryVideoHeight > 0 ?
            sampleInfo_.output.secondaryVideoHeight : sampleInfo_.video.videoHeight;
        // Configure 的宽高仍描述共享的 CameraKit 源帧；副路输出尺寸由自己的降采样 Key 指定。
        // 主路裁剪不能隐式传到副路；副路单独按源尺寸或降采样尺寸输出。
        secondaryInfo.video.preprocMode = VIDEO_PREPROC_NONE;
        if (secondaryWidth != sampleInfo_.video.videoWidth || secondaryHeight != sampleInfo_.video.videoHeight) {
            secondaryInfo.video.preprocMode = VIDEO_PREPROC_DOWNSAMPLING;
            secondaryInfo.video.downsamplingWidth = secondaryWidth;
            secondaryInfo.video.downsamplingHeight = secondaryHeight;
        }
        secondarySampleInfo_ = secondaryInfo;
        int32_t ret = secondaryMuxer_->Create(secondaryInfo.output.outputFd, secondaryInfo.output.outputFormat);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create secondary muxer failed");
        ret = secondaryMuxer_->Config(secondaryInfo);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Configure secondary muxer failed");
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
