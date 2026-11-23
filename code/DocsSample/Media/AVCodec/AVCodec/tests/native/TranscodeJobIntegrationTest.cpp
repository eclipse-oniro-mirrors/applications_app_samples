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
#include <cerrno>
#include <cstdlib>
#include <fcntl.h>
#include <iostream>
#include <map>
#include <string>
#include <type_traits>
#include <unistd.h>
#include <vector>
#include <hilog/log.h>
#include "TestCheck.h"
#include "sample/transcoder/core/TranscodeJob.h"

struct OH_AVFormat {
    std::map<std::string, int64_t> numbers;
    std::map<std::string, double> decimals;
    std::map<std::string, std::string> strings;
};
struct OH_AVBuffer {
    std::vector<uint8_t> bytes;
    OH_AVCodecBufferAttr attr {};
};
struct OH_AVCodec {
    OH_AVBuffer input;
    OH_AVBuffer output;
    bool ready = false;
};
struct OH_AVSource {
    int fd;
};
struct OH_AVDemuxer {
    int samples = 0;
};
struct OH_AVMuxer {
    int fd;
};
struct OH_AVCapability {
    const char *name;
};
struct NativeWindow {};

namespace {
using TestSupport::Require;

constexpr const char *VIDEO_MIME = "video/avc";
constexpr int32_t FRAME_WIDTH = 16;
constexpr int32_t FRAME_HEIGHT = 16;
constexpr int32_t FRAME_BYTES = FRAME_WIDTH * FRAME_HEIGHT * 3 / 2;
constexpr int64_t SOURCE_DURATION_US = 100000;
constexpr int64_t TAIL_PTS_US = 33000;
constexpr int VIDEO_SAMPLE_COUNT = 2;
constexpr int32_t ENCODER_BITRATE_MAX = 100000000;
constexpr int32_t AUDIO_MODE_NONE = 2;
constexpr int32_t STATE_FINISHED = 2;
constexpr int32_t STATE_CANCELLED = 3;
constexpr int32_t STATE_FAILED = 4;
constexpr OH_AVErrCode START_FAILURE = AV_ERR_UNKNOWN;
constexpr OH_AVErrCode FINALIZE_FAILURE = AV_ERR_OPERATE_NOT_PERMIT;
constexpr OH_AVErrCode DESTROY_FAILURE = AV_ERR_INVALID_VAL;
constexpr uint32_t VIDEO_TRACK = 0;

enum class Scenario {
    SUCCESS,
    CANCEL,
    DECODER_START_FAILURE,
    MUX_START_FAILURE,
    FINALIZE_FAILURE,
};

struct Observation {
    Scenario scenario = Scenario::SUCCESS;
    std::vector<std::string> events;
    std::vector<int64_t> muxPtsUs;
    TranscodeJob *job = nullptr;
    int outputFd = -1;
    int inputEos = 0;
    int decoderReturns = 0;
    int encoderReturns = 0;
};
Observation g_observation;
OH_AVCapability g_encoder {"test-encoder"};
OH_AVCapability g_decoder {"test-decoder"};

void Record(const char *event)
{
    g_observation.events.emplace_back(event);
}

OH_AVFormat *VideoFormat()
{
    auto *format = new OH_AVFormat;
    format->numbers[OH_MD_KEY_TRACK_TYPE] = MEDIA_TYPE_VID;
    format->numbers[OH_MD_KEY_WIDTH] = FRAME_WIDTH;
    format->numbers[OH_MD_KEY_HEIGHT] = FRAME_HEIGHT;
    format->numbers[OH_MD_KEY_VIDEO_STRIDE] = FRAME_WIDTH;
    format->numbers[OH_MD_KEY_VIDEO_SLICE_HEIGHT] = FRAME_HEIGHT;
    format->numbers[OH_MD_KEY_PIXEL_FORMAT] = AV_PIXEL_FORMAT_NV12;
    format->strings[OH_MD_KEY_CODEC_MIME] = VIDEO_MIME;
    return format;
}

OH_AVCodec *NewCodec()
{
    auto *codec = new OH_AVCodec;
    codec->input.bytes.resize(FRAME_BYTES);
    codec->output.bytes.resize(FRAME_BYTES);
    return codec;
}

OH_AVErrCode QueryOutput(OH_AVCodec *codec, uint32_t *index)
{
    if (!codec->ready) {
        return AV_ERR_TRY_AGAIN_LATER;
    }
    *index = 0;
    codec->ready = false;
    return AV_ERR_OK;
}

int NewFile()
{
    char name[] = "/tmp/avcodec-transcode-XXXXXX";
    const int fd = mkstemp(name);
    Require(fd >= 0, "Open temporary descriptor");
    Require(unlink(name) == 0, "Unlink temporary path while the descriptor is held");
    return fd;
}

bool IsClosed(int fd)
{
    return fcntl(fd, F_GETFD) == -1 && errno == EBADF;
}

TranscodeSnapshot Run(Scenario scenario)
{
    g_observation = {};
    g_observation.scenario = scenario;
    TranscodeOptions options;
    options.inputFd = NewFile();
    options.outputFd = NewFile();
    g_observation.outputFd = options.outputFd;
    options.audioMode = AUDIO_MODE_NONE;
    options.surface = scenario == Scenario::DECODER_START_FAILURE;
    Require(ftruncate(options.inputFd, FRAME_BYTES) == 0, "Provide a nonempty input file");
    TranscodeSnapshot snapshot;
    {
        TranscodeJob job(options);
        // 仅在Run同步调用SDK替身时借用任务，以便在写入样本时取消。
        g_observation.job = &job;
        job.Run();
        snapshot = job.Snapshot();
        g_observation.job = nullptr;
        Require(IsClosed(options.inputFd) && IsClosed(options.outputFd), "Run closes both owned descriptors");
    }
    return snapshot;
}

void CheckRelease()
{
    std::vector<std::string> expected;
    const Scenario scenario = g_observation.scenario;
    const bool decoderStartFailed = scenario == Scenario::DECODER_START_FAILURE;
    if (scenario == Scenario::SUCCESS || scenario == Scenario::FINALIZE_FAILURE) {
        expected.emplace_back("muxer.stop");
    }
    if (scenario == Scenario::SUCCESS) {
        expected.emplace_back("validation.open");
        expected.emplace_back("validation.destroy");
    }
    if (!decoderStartFailed) {
        expected.emplace_back("decoder.stop");
    }
    expected.emplace_back("decoder.destroy");
    expected.emplace_back("encoder.stop");
    expected.emplace_back("encoder.destroy");
    if (decoderStartFailed) {
        expected.emplace_back("encoder.window.destroy");
    } else {
        expected.emplace_back("muxer.destroy");
    }
    expected.emplace_back("demuxer.destroy");
    expected.emplace_back("source.destroy");
    Require(g_observation.events == expected, "Finalize, validate and release each resource in dependency order");
}

void TestSuccess()
{
    const auto snapshot = Run(Scenario::SUCCESS);
    Require(snapshot.state == STATE_FINISHED && snapshot.stage == "complete", "Successful run completes");
    Require(snapshot.outputValidation == "passed" && snapshot.outputDurationUs == SOURCE_DURATION_US,
        "Finalization reopens and validates the output");
    const std::vector<int64_t> expectedPtsUs {0, TAIL_PTS_US};
    Require(snapshot.frames == VIDEO_SAMPLE_COUNT && g_observation.muxPtsUs == expectedPtsUs,
        "A final decoded frame carrying EOS is written along with the ordinary frame");
    Require(g_observation.inputEos == 1 && g_observation.decoderReturns == 1 &&
        g_observation.encoderReturns == VIDEO_SAMPLE_COUNT, "Submit one encoder EOS and return each ordinary output");
    CheckRelease();
}

void TestCancellation()
{
    const auto snapshot = Run(Scenario::CANCEL);
    Require(snapshot.state == STATE_CANCELLED && snapshot.stage == "cancelled", "Cancel during the first mux write");
    Require(g_observation.muxPtsUs.size() == 1 && g_observation.encoderReturns == 1,
        "Return the in-flight encoder buffer");
    Require(snapshot.outputValidation.empty(), "Cancel leaves output validation unstarted");
    CheckRelease();
}

void TestPartialInitialization()
{
    const auto snapshot = Run(Scenario::DECODER_START_FAILURE);
    Require(snapshot.state == STATE_FAILED && snapshot.errorCode == START_FAILURE &&
        snapshot.detail == "Start video decoder", "Expose the decoder startup error");
    Require(g_observation.muxPtsUs.empty(), "Codec startup failure produces no output sample");
    CheckRelease();
}

void TestMuxerStartFailure()
{
    const auto snapshot = Run(Scenario::MUX_START_FAILURE);
    Require(snapshot.state == STATE_FAILED && snapshot.errorCode == START_FAILURE &&
        snapshot.detail == "Start MP4 muxer", "Report a mux start failure");
    Require(g_observation.muxPtsUs.empty() && g_observation.encoderReturns == 1,
        "Return the encoder buffer when the muxer cannot start");
    CheckRelease();
}

void TestFinalizationFailure()
{
    const auto snapshot = Run(Scenario::FINALIZE_FAILURE);
    Require(snapshot.state == STATE_FAILED && snapshot.errorCode == FINALIZE_FAILURE &&
        snapshot.detail == "Finalize MP4 container", "Report the primary mux finalization error");
    Require(snapshot.cleanupFailure.code == DESTROY_FAILURE && snapshot.cleanupFailure.stage == "muxer.destroy",
        "Record the mux destroy error alongside the primary error");
    const std::vector<int64_t> expectedPtsUs {0, TAIL_PTS_US};
    Require(g_observation.muxPtsUs == expectedPtsUs && snapshot.outputValidation.empty(),
        "Failed finalization occurs after tail output and before validation");
    CheckRelease();
}
} // namespace

AvCodecGraphics::EglWindowContext::~EglWindowContext() = default;
TranscodeGpuProcessor::~TranscodeGpuProcessor() = default;

bool TranscodeGpuProcessor::Initialize(OHNativeWindow *, int32_t, int32_t, int32_t, int32_t, int32_t, bool, int32_t)
{
    return false;
}

bool TranscodeGpuProcessor::Draw(int64_t)
{
    return false;
}
const char *OH_AVCODEC_MIMETYPE_AUDIO_AAC = "audio/mp4a-latm";
const char *OH_AVCODEC_MIMETYPE_VIDEO_HEVC = "video/hevc";
const char *OH_MD_KEY_AAC_IS_ADTS = "aac_is_adts";
const char *OH_MD_KEY_AUDIO_SAMPLE_FORMAT = "audio_sample_format";
const char *OH_MD_KEY_AUD_CHANNEL_COUNT = "aud_channel_count";
const char *OH_MD_KEY_AUD_SAMPLE_RATE = "aud_sample_rate";
const char *OH_MD_KEY_BITRATE = "bitrate";
const char *OH_MD_KEY_CHANNEL_LAYOUT = "channel_layout";
const char *OH_MD_KEY_CODEC_MIME = "codec_mime";
const char *OH_MD_KEY_COLOR_PRIMARIES = "color_primaries";
const char *OH_MD_KEY_DURATION = "duration";
const char *OH_MD_KEY_ENABLE_SYNC_MODE = "enable_sync_mode";
const char *OH_MD_KEY_FRAME_RATE = "frame_rate";
const char *OH_MD_KEY_HEIGHT = "height";
const char *OH_MD_KEY_I_FRAME_INTERVAL = "i_frame_interval";
const char *OH_MD_KEY_MATRIX_COEFFICIENTS = "matrix_coefficients";
const char *OH_MD_KEY_PIXEL_FORMAT = "pixel_format";
const char *OH_MD_KEY_PROFILE = "profile";
const char *OH_MD_KEY_RANGE_FLAG = "range_flag";
const char *OH_MD_KEY_ROTATION = "rotation";
const char *OH_MD_KEY_START_TIME = "start_time";
const char *OH_MD_KEY_TRACK_COUNT = "track_count";
const char *OH_MD_KEY_TRACK_START_TIME = "track_start_time";
const char *OH_MD_KEY_TRACK_TYPE = "track_type";
const char *OH_MD_KEY_TRANSFER_CHARACTERISTICS = "transfer_characteristics";
const char *OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE = "video_encode_bitrate_mode";
const char *OH_MD_KEY_VIDEO_IS_HDR_VIVID = "video_is_hdr_vivid";
const char *OH_MD_KEY_VIDEO_PIC_HEIGHT = "video_pic_height";
const char *OH_MD_KEY_VIDEO_PIC_WIDTH = "video_pic_width";
const char *OH_MD_KEY_VIDEO_SLICE_HEIGHT = "video_slice_height";
const char *OH_MD_KEY_VIDEO_STRIDE = "video_stride";
const char *OH_MD_KEY_WIDTH = "width";

extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...) __asm__("OH_LOG_Print");

extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}

extern "C" OH_AVBuffer *FakeAVBufferCreate(int32_t capacity) __asm__("OH_AVBuffer_Create");
static_assert(std::is_same_v<decltype(&FakeAVBufferCreate), decltype(&OH_AVBuffer_Create)>);
OH_AVBuffer *FakeAVBufferCreate(int32_t capacity)
{
    return new OH_AVBuffer {std::vector<uint8_t>(capacity), {}};
}

extern "C" OH_AVErrCode FakeAVBufferDestroy(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_Destroy");
static_assert(std::is_same_v<decltype(&FakeAVBufferDestroy), decltype(&OH_AVBuffer_Destroy)>);
OH_AVErrCode FakeAVBufferDestroy(OH_AVBuffer *buffer)
{
    delete buffer;
    return AV_ERR_OK;
}

extern "C" uint8_t *FakeAVBufferGetAddr(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_GetAddr");
static_assert(std::is_same_v<decltype(&FakeAVBufferGetAddr), decltype(&OH_AVBuffer_GetAddr)>);
uint8_t *FakeAVBufferGetAddr(OH_AVBuffer *buffer)
{
    return buffer->bytes.data();
}

extern "C" OH_AVErrCode FakeAVBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_GetBufferAttr");
static_assert(std::is_same_v<decltype(&FakeAVBufferGetBufferAttr), decltype(&OH_AVBuffer_GetBufferAttr)>);
OH_AVErrCode FakeAVBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return AV_ERR_OK;
}

extern "C" int32_t FakeAVBufferGetCapacity(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_GetCapacity");
static_assert(std::is_same_v<decltype(&FakeAVBufferGetCapacity), decltype(&OH_AVBuffer_GetCapacity)>);
int32_t FakeAVBufferGetCapacity(OH_AVBuffer *buffer)
{
    return static_cast<int32_t>(buffer->bytes.size());
}

extern "C" OH_AVErrCode FakeAVBufferSetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_SetBufferAttr");
static_assert(std::is_same_v<decltype(&FakeAVBufferSetBufferAttr), decltype(&OH_AVBuffer_SetBufferAttr)>);
OH_AVErrCode FakeAVBufferSetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
{
    buffer->attr = *attr;
    return AV_ERR_OK;
}

extern "C" bool FakeAVCapabilityAreVideoSizeAndFrameRateSupported(OH_AVCapability *, int32_t width,
    int32_t height, int32_t frameRate)
    __asm__("OH_AVCapability_AreVideoSizeAndFrameRateSupported");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityAreVideoSizeAndFrameRateSupported),
    decltype(&OH_AVCapability_AreVideoSizeAndFrameRateSupported)>);
bool FakeAVCapabilityAreVideoSizeAndFrameRateSupported(OH_AVCapability *, int32_t width, int32_t height,
    int32_t frameRate)
{
    return width == FRAME_WIDTH && height == FRAME_HEIGHT && frameRate > 0;
}

extern "C" OH_AVErrCode FakeAVCapabilityGetAudioChannelCountRange(OH_AVCapability *, OH_AVRange *)
    __asm__("OH_AVCapability_GetAudioChannelCountRange");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityGetAudioChannelCountRange),
    decltype(&OH_AVCapability_GetAudioChannelCountRange)>);
OH_AVErrCode FakeAVCapabilityGetAudioChannelCountRange(OH_AVCapability *, OH_AVRange *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAVCapabilityGetAudioSupportedSampleRates(OH_AVCapability *, const int32_t **, uint32_t *)
    __asm__("OH_AVCapability_GetAudioSupportedSampleRates");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityGetAudioSupportedSampleRates),
    decltype(&OH_AVCapability_GetAudioSupportedSampleRates)>);
OH_AVErrCode FakeAVCapabilityGetAudioSupportedSampleRates(OH_AVCapability *, const int32_t **, uint32_t *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAVCapabilityGetEncoderBitrateRange(OH_AVCapability *, OH_AVRange *bitrateRange)
    __asm__("OH_AVCapability_GetEncoderBitrateRange");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityGetEncoderBitrateRange),
    decltype(&OH_AVCapability_GetEncoderBitrateRange)>);
OH_AVErrCode FakeAVCapabilityGetEncoderBitrateRange(OH_AVCapability *, OH_AVRange *bitrateRange)
{
    *bitrateRange = {1, ENCODER_BITRATE_MAX};
    return AV_ERR_OK;
}

extern "C" const char *FakeAVCapabilityGetName(OH_AVCapability *capability) __asm__("OH_AVCapability_GetName");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityGetName), decltype(&OH_AVCapability_GetName)>);
const char *FakeAVCapabilityGetName(OH_AVCapability *capability)
{
    return capability->name;
}

extern "C" OH_AVErrCode FakeAVCapabilityGetVideoSupportedPixelFormats(OH_AVCapability *,
    const int32_t **pixelFormats, uint32_t *pixelFormatNum)
    __asm__("OH_AVCapability_GetVideoSupportedPixelFormats");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityGetVideoSupportedPixelFormats),
    decltype(&OH_AVCapability_GetVideoSupportedPixelFormats)>);
OH_AVErrCode FakeAVCapabilityGetVideoSupportedPixelFormats(OH_AVCapability *, const int32_t **pixelFormats,
    uint32_t *pixelFormatNum)
{
    static constexpr int32_t FORMATS[] = {AV_PIXEL_FORMAT_NV12};
    *pixelFormats = FORMATS;
    *pixelFormatNum = sizeof(FORMATS) / sizeof(FORMATS[0]);
    return AV_ERR_OK;
}

extern "C" bool FakeAVCapabilityIsEncoderBitrateModeSupported(OH_AVCapability *, OH_BitrateMode)
    __asm__("OH_AVCapability_IsEncoderBitrateModeSupported");
static_assert(std::is_same_v<decltype(&FakeAVCapabilityIsEncoderBitrateModeSupported),
    decltype(&OH_AVCapability_IsEncoderBitrateModeSupported)>);
bool FakeAVCapabilityIsEncoderBitrateModeSupported(OH_AVCapability *, OH_BitrateMode)
{
    return true;
}

extern "C" OH_AVCapability *FakeAVCodecGetCapability(const char *mime, bool isEncoder)
    __asm__("OH_AVCodec_GetCapability");
static_assert(std::is_same_v<decltype(&FakeAVCodecGetCapability), decltype(&OH_AVCodec_GetCapability)>);
OH_AVCapability *FakeAVCodecGetCapability(const char *mime, bool isEncoder)
{
    return std::string(mime) == VIDEO_MIME ? (isEncoder ? &g_encoder : &g_decoder) : nullptr;
}

extern "C" OH_AVCapability *FakeAVCodecGetCapabilityByCategory(const char *, bool, OH_AVCodecCategory)
    __asm__("OH_AVCodec_GetCapabilityByCategory");
static_assert(std::is_same_v<decltype(&FakeAVCodecGetCapabilityByCategory),
    decltype(&OH_AVCodec_GetCapabilityByCategory)>);
OH_AVCapability *FakeAVCodecGetCapabilityByCategory(const char *, bool, OH_AVCodecCategory)
{
    return nullptr;
}

extern "C" OH_AVDemuxer *FakeAVDemuxerCreateWithSource(OH_AVSource *) __asm__("OH_AVDemuxer_CreateWithSource");
static_assert(std::is_same_v<decltype(&FakeAVDemuxerCreateWithSource), decltype(&OH_AVDemuxer_CreateWithSource)>);
OH_AVDemuxer *FakeAVDemuxerCreateWithSource(OH_AVSource *)
{
    return new OH_AVDemuxer;
}

extern "C" OH_AVErrCode FakeAVDemuxerDestroy(OH_AVDemuxer *demuxer) __asm__("OH_AVDemuxer_Destroy");
static_assert(std::is_same_v<decltype(&FakeAVDemuxerDestroy), decltype(&OH_AVDemuxer_Destroy)>);
OH_AVErrCode FakeAVDemuxerDestroy(OH_AVDemuxer *demuxer)
{
    Record("demuxer.destroy");
    delete demuxer;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeAVDemuxerReadSampleBuffer(OH_AVDemuxer *demuxer, uint32_t trackIndex, OH_AVBuffer *sample)
    __asm__("OH_AVDemuxer_ReadSampleBuffer");
static_assert(std::is_same_v<decltype(&FakeAVDemuxerReadSampleBuffer), decltype(&OH_AVDemuxer_ReadSampleBuffer)>);
OH_AVErrCode FakeAVDemuxerReadSampleBuffer(OH_AVDemuxer *demuxer, uint32_t trackIndex, OH_AVBuffer *sample)
{
    Require(trackIndex == VIDEO_TRACK && demuxer->samples < VIDEO_SAMPLE_COUNT,
        "Read only the two expected video samples");
    sample->attr = {};
    sample->attr.size = FRAME_BYTES;
    if (++demuxer->samples == VIDEO_SAMPLE_COUNT) {
        sample->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        sample->attr.pts = TAIL_PTS_US;
    }
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeAVDemuxerSeekToTime(OH_AVDemuxer *, int64_t, OH_AVSeekMode)
    __asm__("OH_AVDemuxer_SeekToTime");
static_assert(std::is_same_v<decltype(&FakeAVDemuxerSeekToTime), decltype(&OH_AVDemuxer_SeekToTime)>);
OH_AVErrCode FakeAVDemuxerSeekToTime(OH_AVDemuxer *, int64_t, OH_AVSeekMode)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAVDemuxerSelectTrackByID(OH_AVDemuxer *, uint32_t trackIndex)
    __asm__("OH_AVDemuxer_SelectTrackByID");
static_assert(std::is_same_v<decltype(&FakeAVDemuxerSelectTrackByID), decltype(&OH_AVDemuxer_SelectTrackByID)>);
OH_AVErrCode FakeAVDemuxerSelectTrackByID(OH_AVDemuxer *, uint32_t trackIndex)
{
    return trackIndex == VIDEO_TRACK ? AV_ERR_OK : AV_ERR_INVALID_VAL;
}

extern "C" OH_AVFormat *FakeAVFormatCreateAudioFormat(const char *, int32_t, int32_t)
    __asm__("OH_AVFormat_CreateAudioFormat");
static_assert(std::is_same_v<decltype(&FakeAVFormatCreateAudioFormat), decltype(&OH_AVFormat_CreateAudioFormat)>);
OH_AVFormat *FakeAVFormatCreateAudioFormat(const char *, int32_t, int32_t)
{
    return nullptr;
}

extern "C" OH_AVFormat *FakeAVFormatCreateVideoFormat(const char *mimeType, int32_t width, int32_t height)
    __asm__("OH_AVFormat_CreateVideoFormat");
static_assert(std::is_same_v<decltype(&FakeAVFormatCreateVideoFormat), decltype(&OH_AVFormat_CreateVideoFormat)>);
OH_AVFormat *FakeAVFormatCreateVideoFormat(const char *mimeType, int32_t width, int32_t height)
{
    auto *format = VideoFormat();
    format->strings[OH_MD_KEY_CODEC_MIME] = mimeType;
    format->numbers[OH_MD_KEY_WIDTH] = width;
    format->numbers[OH_MD_KEY_HEIGHT] = height;
    return format;
}

extern "C" void FakeAVFormatDestroy(OH_AVFormat *format) __asm__("OH_AVFormat_Destroy");
static_assert(std::is_same_v<decltype(&FakeAVFormatDestroy), decltype(&OH_AVFormat_Destroy)>);
void FakeAVFormatDestroy(OH_AVFormat *format)
{
    delete format;
}

extern "C" bool FakeAVFormatGetDoubleValue(OH_AVFormat *format, const char *key, double *out)
    __asm__("OH_AVFormat_GetDoubleValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatGetDoubleValue), decltype(&OH_AVFormat_GetDoubleValue)>);
bool FakeAVFormatGetDoubleValue(OH_AVFormat *format, const char *key, double *out)
{
    const auto entry = format->decimals.find(key);
    if (entry == format->decimals.end()) {
        return false;
    }
    *out = entry->second;
    return true;
}

extern "C" bool FakeAVFormatGetIntValue(OH_AVFormat *format, const char *key, int32_t *out)
    __asm__("OH_AVFormat_GetIntValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatGetIntValue), decltype(&OH_AVFormat_GetIntValue)>);
bool FakeAVFormatGetIntValue(OH_AVFormat *format, const char *key, int32_t *out)
{
    const auto entry = format->numbers.find(key);
    if (entry == format->numbers.end()) {
        return false;
    }
    *out = static_cast<int32_t>(entry->second);
    return true;
}

extern "C" bool FakeAVFormatGetLongValue(OH_AVFormat *format, const char *key, int64_t *out)
    __asm__("OH_AVFormat_GetLongValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatGetLongValue), decltype(&OH_AVFormat_GetLongValue)>);
bool FakeAVFormatGetLongValue(OH_AVFormat *format, const char *key, int64_t *out)
{
    const auto entry = format->numbers.find(key);
    if (entry == format->numbers.end()) {
        return false;
    }
    *out = entry->second;
    return true;
}

extern "C" bool FakeAVFormatGetStringValue(OH_AVFormat *format, const char *key, const char **out)
    __asm__("OH_AVFormat_GetStringValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatGetStringValue), decltype(&OH_AVFormat_GetStringValue)>);
bool FakeAVFormatGetStringValue(OH_AVFormat *format, const char *key, const char **out)
{
    const auto entry = format->strings.find(key);
    if (entry == format->strings.end()) {
        return false;
    }
    *out = entry->second.c_str();
    return true;
}

extern "C" bool FakeAVFormatSetDoubleValue(OH_AVFormat *format, const char *key, double value)
    __asm__("OH_AVFormat_SetDoubleValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatSetDoubleValue), decltype(&OH_AVFormat_SetDoubleValue)>);
bool FakeAVFormatSetDoubleValue(OH_AVFormat *format, const char *key, double value)
{
    format->decimals[key] = value;
    return true;
}

extern "C" bool FakeAVFormatSetIntValue(OH_AVFormat *format, const char *key, int32_t value)
    __asm__("OH_AVFormat_SetIntValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatSetIntValue), decltype(&OH_AVFormat_SetIntValue)>);
bool FakeAVFormatSetIntValue(OH_AVFormat *format, const char *key, int32_t value)
{
    format->numbers[key] = value;
    return true;
}

extern "C" bool FakeAVFormatSetLongValue(OH_AVFormat *format, const char *key, int64_t value)
    __asm__("OH_AVFormat_SetLongValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatSetLongValue), decltype(&OH_AVFormat_SetLongValue)>);
bool FakeAVFormatSetLongValue(OH_AVFormat *format, const char *key, int64_t value)
{
    format->numbers[key] = value;
    return true;
}

extern "C" bool FakeAVFormatSetStringValue(OH_AVFormat *format, const char *key, const char *value)
    __asm__("OH_AVFormat_SetStringValue");
static_assert(std::is_same_v<decltype(&FakeAVFormatSetStringValue), decltype(&OH_AVFormat_SetStringValue)>);
bool FakeAVFormatSetStringValue(OH_AVFormat *format, const char *key, const char *value)
{
    format->strings[key] = value;
    return true;
}

extern "C" OH_AVErrCode FakeAVMuxerAddTrack(OH_AVMuxer *, int32_t *trackIndex, OH_AVFormat *)
    __asm__("OH_AVMuxer_AddTrack");
static_assert(std::is_same_v<decltype(&FakeAVMuxerAddTrack), decltype(&OH_AVMuxer_AddTrack)>);
OH_AVErrCode FakeAVMuxerAddTrack(OH_AVMuxer *, int32_t *trackIndex, OH_AVFormat *)
{
    *trackIndex = VIDEO_TRACK;
    return AV_ERR_OK;
}

extern "C" OH_AVMuxer *FakeAVMuxerCreate(int32_t fd, OH_AVOutputFormat format) __asm__("OH_AVMuxer_Create");
static_assert(std::is_same_v<decltype(&FakeAVMuxerCreate), decltype(&OH_AVMuxer_Create)>);
OH_AVMuxer *FakeAVMuxerCreate(int32_t fd, OH_AVOutputFormat format)
{
    return format == AV_OUTPUT_FORMAT_MPEG_4 ? new OH_AVMuxer {fd} : nullptr;
}

extern "C" OH_AVErrCode FakeAVMuxerDestroy(OH_AVMuxer *muxer) __asm__("OH_AVMuxer_Destroy");
static_assert(std::is_same_v<decltype(&FakeAVMuxerDestroy), decltype(&OH_AVMuxer_Destroy)>);
OH_AVErrCode FakeAVMuxerDestroy(OH_AVMuxer *muxer)
{
    Require(!IsClosed(muxer->fd), "Output descriptor outlives its muxer");
    Record("muxer.destroy");
    delete muxer;
    return g_observation.scenario == Scenario::FINALIZE_FAILURE ? DESTROY_FAILURE : AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeAVMuxerSetRotation(OH_AVMuxer *, int32_t) __asm__("OH_AVMuxer_SetRotation");
static_assert(std::is_same_v<decltype(&FakeAVMuxerSetRotation), decltype(&OH_AVMuxer_SetRotation)>);
OH_AVErrCode FakeAVMuxerSetRotation(OH_AVMuxer *, int32_t)
{
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeAVMuxerStart(OH_AVMuxer *) __asm__("OH_AVMuxer_Start");
static_assert(std::is_same_v<decltype(&FakeAVMuxerStart), decltype(&OH_AVMuxer_Start)>);
OH_AVErrCode FakeAVMuxerStart(OH_AVMuxer *)
{
    return g_observation.scenario == Scenario::MUX_START_FAILURE ? START_FAILURE : AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeAVMuxerStop(OH_AVMuxer *muxer) __asm__("OH_AVMuxer_Stop");
static_assert(std::is_same_v<decltype(&FakeAVMuxerStop), decltype(&OH_AVMuxer_Stop)>);
OH_AVErrCode FakeAVMuxerStop(OH_AVMuxer *muxer)
{
    Require(!IsClosed(muxer->fd), "Output descriptor outlives mux finalization");
    Record("muxer.stop");
    return g_observation.scenario == Scenario::FINALIZE_FAILURE ? FINALIZE_FAILURE : AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeAVMuxerWriteSampleBuffer(OH_AVMuxer *muxer, uint32_t trackIndex, const OH_AVBuffer *sample)
    __asm__("OH_AVMuxer_WriteSampleBuffer");
static_assert(std::is_same_v<decltype(&FakeAVMuxerWriteSampleBuffer), decltype(&OH_AVMuxer_WriteSampleBuffer)>);
OH_AVErrCode FakeAVMuxerWriteSampleBuffer(OH_AVMuxer *muxer, uint32_t trackIndex, const OH_AVBuffer *sample)
{
    Require(trackIndex == VIDEO_TRACK, "Write to the configured track");
    Require(sample->attr.size == FRAME_BYTES, "Write a complete encoded frame");
    g_observation.muxPtsUs.push_back(sample->attr.pts);
    if (g_observation.scenario == Scenario::CANCEL) {
        g_observation.job->Cancel();
    }
    return write(muxer->fd, sample->bytes.data(), sample->bytes.size()) == FRAME_BYTES ? AV_ERR_OK : AV_ERR_UNKNOWN;
}

extern "C" OH_AVSource *FakeAVSourceCreateWithFD(int32_t fd, int64_t offset, int64_t size)
    __asm__("OH_AVSource_CreateWithFD");
static_assert(std::is_same_v<decltype(&FakeAVSourceCreateWithFD), decltype(&OH_AVSource_CreateWithFD)>);
OH_AVSource *FakeAVSourceCreateWithFD(int32_t fd, int64_t offset, int64_t size)
{
    if (fd == g_observation.outputFd) {
        Record("validation.open");
    }
    return offset == 0 && size > 0 ? new OH_AVSource {fd} : nullptr;
}

extern "C" OH_AVErrCode FakeAVSourceDestroy(OH_AVSource *source) __asm__("OH_AVSource_Destroy");
static_assert(std::is_same_v<decltype(&FakeAVSourceDestroy), decltype(&OH_AVSource_Destroy)>);
OH_AVErrCode FakeAVSourceDestroy(OH_AVSource *source)
{
    Require(!IsClosed(source->fd), "Descriptor outlives its media source");
    Record(source->fd == g_observation.outputFd ? "validation.destroy" : "source.destroy");
    delete source;
    return AV_ERR_OK;
}

extern "C" OH_AVFormat *FakeAVSourceGetSourceFormat(OH_AVSource *) __asm__("OH_AVSource_GetSourceFormat");
static_assert(std::is_same_v<decltype(&FakeAVSourceGetSourceFormat), decltype(&OH_AVSource_GetSourceFormat)>);
OH_AVFormat *FakeAVSourceGetSourceFormat(OH_AVSource *)
{
    auto *format = new OH_AVFormat;
    format->numbers[OH_MD_KEY_TRACK_COUNT] = 1;
    format->numbers[OH_MD_KEY_DURATION] = SOURCE_DURATION_US;
    return format;
}

extern "C" OH_AVFormat *FakeAVSourceGetTrackFormat(OH_AVSource *, uint32_t trackIndex)
    __asm__("OH_AVSource_GetTrackFormat");
static_assert(std::is_same_v<decltype(&FakeAVSourceGetTrackFormat), decltype(&OH_AVSource_GetTrackFormat)>);
OH_AVFormat *FakeAVSourceGetTrackFormat(OH_AVSource *, uint32_t trackIndex)
{
    return trackIndex == VIDEO_TRACK ? VideoFormat() : nullptr;
}

extern "C" OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *, const OH_AVFormat *) __asm__("OH_AudioCodec_Configure");
static_assert(std::is_same_v<decltype(&FakeAudioCodecConfigure), decltype(&OH_AudioCodec_Configure)>);
OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *, const OH_AVFormat *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVCodec *FakeAudioCodecCreateByMime(const char *, bool) __asm__("OH_AudioCodec_CreateByMime");
static_assert(std::is_same_v<decltype(&FakeAudioCodecCreateByMime), decltype(&OH_AudioCodec_CreateByMime)>);
OH_AVCodec *FakeAudioCodecCreateByMime(const char *, bool)
{
    return nullptr;
}

extern "C" OH_AVErrCode FakeAudioCodecDestroy(OH_AVCodec *) __asm__("OH_AudioCodec_Destroy");
static_assert(std::is_same_v<decltype(&FakeAudioCodecDestroy), decltype(&OH_AudioCodec_Destroy)>);
OH_AVErrCode FakeAudioCodecDestroy(OH_AVCodec *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecFreeOutputBuffer(OH_AVCodec *, uint32_t)
    __asm__("OH_AudioCodec_FreeOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeAudioCodecFreeOutputBuffer), decltype(&OH_AudioCodec_FreeOutputBuffer)>);
OH_AVErrCode FakeAudioCodecFreeOutputBuffer(OH_AVCodec *, uint32_t)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *, uint32_t) __asm__("OH_AudioCodec_GetInputBuffer");
static_assert(std::is_same_v<decltype(&FakeAudioCodecGetInputBuffer), decltype(&OH_AudioCodec_GetInputBuffer)>);
OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *, uint32_t)
{
    return nullptr;
}

extern "C" OH_AVBuffer *FakeAudioCodecGetOutputBuffer(OH_AVCodec *, uint32_t) __asm__("OH_AudioCodec_GetOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeAudioCodecGetOutputBuffer), decltype(&OH_AudioCodec_GetOutputBuffer)>);
OH_AVBuffer *FakeAudioCodecGetOutputBuffer(OH_AVCodec *, uint32_t)
{
    return nullptr;
}

extern "C" OH_AVFormat *FakeAudioCodecGetOutputDescription(OH_AVCodec *) __asm__("OH_AudioCodec_GetOutputDescription");
static_assert(std::is_same_v<decltype(&FakeAudioCodecGetOutputDescription),
    decltype(&OH_AudioCodec_GetOutputDescription)>);
OH_AVFormat *FakeAudioCodecGetOutputDescription(OH_AVCodec *)
{
    return nullptr;
}

extern "C" OH_AVErrCode FakeAudioCodecPrepare(OH_AVCodec *) __asm__("OH_AudioCodec_Prepare");
static_assert(std::is_same_v<decltype(&FakeAudioCodecPrepare), decltype(&OH_AudioCodec_Prepare)>);
OH_AVErrCode FakeAudioCodecPrepare(OH_AVCodec *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *, uint32_t) __asm__("OH_AudioCodec_PushInputBuffer");
static_assert(std::is_same_v<decltype(&FakeAudioCodecPushInputBuffer), decltype(&OH_AudioCodec_PushInputBuffer)>);
OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *, uint32_t)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *, uint32_t *, int64_t)
    __asm__("OH_AudioCodec_QueryInputBuffer");
static_assert(std::is_same_v<decltype(&FakeAudioCodecQueryInputBuffer), decltype(&OH_AudioCodec_QueryInputBuffer)>);
OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *, uint32_t *, int64_t)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *, uint32_t *, int64_t)
    __asm__("OH_AudioCodec_QueryOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeAudioCodecQueryOutputBuffer), decltype(&OH_AudioCodec_QueryOutputBuffer)>);
OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *, uint32_t *, int64_t)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
    __asm__("OH_AudioCodec_RegisterCallback");
static_assert(std::is_same_v<decltype(&FakeAudioCodecRegisterCallback), decltype(&OH_AudioCodec_RegisterCallback)>);
OH_AVErrCode FakeAudioCodecRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecStart(OH_AVCodec *) __asm__("OH_AudioCodec_Start");
static_assert(std::is_same_v<decltype(&FakeAudioCodecStart), decltype(&OH_AudioCodec_Start)>);
OH_AVErrCode FakeAudioCodecStart(OH_AVCodec *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *) __asm__("OH_AudioCodec_Stop");
static_assert(std::is_same_v<decltype(&FakeAudioCodecStop), decltype(&OH_AudioCodec_Stop)>);
OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" void FakeNativeWindowDestroyNativeWindow(OHNativeWindow *window)
    __asm__("OH_NativeWindow_DestroyNativeWindow");
static_assert(std::is_same_v<decltype(&FakeNativeWindowDestroyNativeWindow),
    decltype(&OH_NativeWindow_DestroyNativeWindow)>);
void FakeNativeWindowDestroyNativeWindow(OHNativeWindow *window)
{
    Record("encoder.window.destroy");
    delete window;
}

extern "C" OH_AVErrCode FakeVideoDecoderConfigure(OH_AVCodec *, OH_AVFormat *) __asm__("OH_VideoDecoder_Configure");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderConfigure), decltype(&OH_VideoDecoder_Configure)>);
OH_AVErrCode FakeVideoDecoderConfigure(OH_AVCodec *, OH_AVFormat *)
{
    return AV_ERR_OK;
}

extern "C" OH_AVCodec *FakeVideoDecoderCreateByMime(const char *) __asm__("OH_VideoDecoder_CreateByMime");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderCreateByMime), decltype(&OH_VideoDecoder_CreateByMime)>);
OH_AVCodec *FakeVideoDecoderCreateByMime(const char *)
{
    return nullptr;
}

extern "C" OH_AVCodec *FakeVideoDecoderCreateByName(const char *) __asm__("OH_VideoDecoder_CreateByName");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderCreateByName), decltype(&OH_VideoDecoder_CreateByName)>);
OH_AVCodec *FakeVideoDecoderCreateByName(const char *)
{
    return NewCodec();
}

extern "C" OH_AVErrCode FakeVideoDecoderDestroy(OH_AVCodec *codec) __asm__("OH_VideoDecoder_Destroy");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderDestroy), decltype(&OH_VideoDecoder_Destroy)>);
OH_AVErrCode FakeVideoDecoderDestroy(OH_AVCodec *codec)
{
    Record("decoder.destroy");
    delete codec;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoDecoderFreeOutputBuffer(OH_AVCodec *, uint32_t)
    __asm__("OH_VideoDecoder_FreeOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderFreeOutputBuffer), decltype(&OH_VideoDecoder_FreeOutputBuffer)>);
OH_AVErrCode FakeVideoDecoderFreeOutputBuffer(OH_AVCodec *, uint32_t)
{
    ++g_observation.decoderReturns;
    return AV_ERR_OK;
}

extern "C" OH_AVBuffer *FakeVideoDecoderGetInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_VideoDecoder_GetInputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderGetInputBuffer), decltype(&OH_VideoDecoder_GetInputBuffer)>);
OH_AVBuffer *FakeVideoDecoderGetInputBuffer(OH_AVCodec *codec, uint32_t)
{
    return &codec->input;
}

extern "C" OH_AVBuffer *FakeVideoDecoderGetOutputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_VideoDecoder_GetOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderGetOutputBuffer), decltype(&OH_VideoDecoder_GetOutputBuffer)>);
OH_AVBuffer *FakeVideoDecoderGetOutputBuffer(OH_AVCodec *codec, uint32_t)
{
    return &codec->output;
}

extern "C" OH_AVFormat *FakeVideoDecoderGetOutputDescription(OH_AVCodec *)
    __asm__("OH_VideoDecoder_GetOutputDescription");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderGetOutputDescription),
    decltype(&OH_VideoDecoder_GetOutputDescription)>);
OH_AVFormat *FakeVideoDecoderGetOutputDescription(OH_AVCodec *)
{
    return VideoFormat();
}

extern "C" OH_AVErrCode FakeVideoDecoderPrepare(OH_AVCodec *) __asm__("OH_VideoDecoder_Prepare");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderPrepare), decltype(&OH_VideoDecoder_Prepare)>);
OH_AVErrCode FakeVideoDecoderPrepare(OH_AVCodec *)
{
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoDecoderPushInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_VideoDecoder_PushInputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderPushInputBuffer), decltype(&OH_VideoDecoder_PushInputBuffer)>);
OH_AVErrCode FakeVideoDecoderPushInputBuffer(OH_AVCodec *codec, uint32_t)
{
    codec->output.attr = codec->input.attr;
    codec->ready = true;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoDecoderQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
    __asm__("OH_VideoDecoder_QueryInputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderQueryInputBuffer), decltype(&OH_VideoDecoder_QueryInputBuffer)>);
OH_AVErrCode FakeVideoDecoderQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = 0;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoDecoderQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
    __asm__("OH_VideoDecoder_QueryOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderQueryOutputBuffer),
    decltype(&OH_VideoDecoder_QueryOutputBuffer)>);
OH_AVErrCode FakeVideoDecoderQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    return QueryOutput(codec, index);
}

extern "C" OH_AVErrCode FakeVideoDecoderRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
    __asm__("OH_VideoDecoder_RegisterCallback");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderRegisterCallback), decltype(&OH_VideoDecoder_RegisterCallback)>);
OH_AVErrCode FakeVideoDecoderRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeVideoDecoderRenderOutputBuffer(OH_AVCodec *, uint32_t)
    __asm__("OH_VideoDecoder_RenderOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderRenderOutputBuffer),
    decltype(&OH_VideoDecoder_RenderOutputBuffer)>);
OH_AVErrCode FakeVideoDecoderRenderOutputBuffer(OH_AVCodec *, uint32_t)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeVideoDecoderSetSurface(OH_AVCodec *, OHNativeWindow *window)
    __asm__("OH_VideoDecoder_SetSurface");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderSetSurface), decltype(&OH_VideoDecoder_SetSurface)>);
OH_AVErrCode FakeVideoDecoderSetSurface(OH_AVCodec *, OHNativeWindow *window)
{
    return window != nullptr ? AV_ERR_OK : AV_ERR_INVALID_VAL;
}

extern "C" OH_AVErrCode FakeVideoDecoderStart(OH_AVCodec *) __asm__("OH_VideoDecoder_Start");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderStart), decltype(&OH_VideoDecoder_Start)>);
OH_AVErrCode FakeVideoDecoderStart(OH_AVCodec *)
{
    return g_observation.scenario == Scenario::DECODER_START_FAILURE ? START_FAILURE : AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoDecoderStop(OH_AVCodec *) __asm__("OH_VideoDecoder_Stop");
static_assert(std::is_same_v<decltype(&FakeVideoDecoderStop), decltype(&OH_VideoDecoder_Stop)>);
OH_AVErrCode FakeVideoDecoderStop(OH_AVCodec *)
{
    Record("decoder.stop");
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderConfigure(OH_AVCodec *, OH_AVFormat *) __asm__("OH_VideoEncoder_Configure");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderConfigure), decltype(&OH_VideoEncoder_Configure)>);
OH_AVErrCode FakeVideoEncoderConfigure(OH_AVCodec *, OH_AVFormat *)
{
    return AV_ERR_OK;
}

extern "C" OH_AVCodec *FakeVideoEncoderCreateByName(const char *) __asm__("OH_VideoEncoder_CreateByName");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderCreateByName), decltype(&OH_VideoEncoder_CreateByName)>);
OH_AVCodec *FakeVideoEncoderCreateByName(const char *)
{
    return NewCodec();
}

extern "C" OH_AVErrCode FakeVideoEncoderDestroy(OH_AVCodec *codec) __asm__("OH_VideoEncoder_Destroy");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderDestroy), decltype(&OH_VideoEncoder_Destroy)>);
OH_AVErrCode FakeVideoEncoderDestroy(OH_AVCodec *codec)
{
    Record("encoder.destroy");
    delete codec;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderFreeOutputBuffer(OH_AVCodec *, uint32_t)
    __asm__("OH_VideoEncoder_FreeOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderFreeOutputBuffer), decltype(&OH_VideoEncoder_FreeOutputBuffer)>);
OH_AVErrCode FakeVideoEncoderFreeOutputBuffer(OH_AVCodec *, uint32_t)
{
    ++g_observation.encoderReturns;
    return AV_ERR_OK;
}

extern "C" OH_AVBuffer *FakeVideoEncoderGetInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_VideoEncoder_GetInputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderGetInputBuffer), decltype(&OH_VideoEncoder_GetInputBuffer)>);
OH_AVBuffer *FakeVideoEncoderGetInputBuffer(OH_AVCodec *codec, uint32_t)
{
    return &codec->input;
}

extern "C" OH_AVFormat *FakeVideoEncoderGetInputDescription(OH_AVCodec *)
    __asm__("OH_VideoEncoder_GetInputDescription");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderGetInputDescription),
    decltype(&OH_VideoEncoder_GetInputDescription)>);
OH_AVFormat *FakeVideoEncoderGetInputDescription(OH_AVCodec *)
{
    return VideoFormat();
}

extern "C" OH_AVBuffer *FakeVideoEncoderGetOutputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_VideoEncoder_GetOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderGetOutputBuffer), decltype(&OH_VideoEncoder_GetOutputBuffer)>);
OH_AVBuffer *FakeVideoEncoderGetOutputBuffer(OH_AVCodec *codec, uint32_t)
{
    return &codec->output;
}

extern "C" OH_AVFormat *FakeVideoEncoderGetOutputDescription(OH_AVCodec *)
    __asm__("OH_VideoEncoder_GetOutputDescription");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderGetOutputDescription),
    decltype(&OH_VideoEncoder_GetOutputDescription)>);
OH_AVFormat *FakeVideoEncoderGetOutputDescription(OH_AVCodec *)
{
    return VideoFormat();
}

extern "C" OH_AVErrCode FakeVideoEncoderGetSurface(OH_AVCodec *, OHNativeWindow **window)
    __asm__("OH_VideoEncoder_GetSurface");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderGetSurface), decltype(&OH_VideoEncoder_GetSurface)>);
OH_AVErrCode FakeVideoEncoderGetSurface(OH_AVCodec *, OHNativeWindow **window)
{
    *window = new NativeWindow;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderNotifyEndOfStream(OH_AVCodec *) __asm__("OH_VideoEncoder_NotifyEndOfStream");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderNotifyEndOfStream),
    decltype(&OH_VideoEncoder_NotifyEndOfStream)>);
OH_AVErrCode FakeVideoEncoderNotifyEndOfStream(OH_AVCodec *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeVideoEncoderPrepare(OH_AVCodec *) __asm__("OH_VideoEncoder_Prepare");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderPrepare), decltype(&OH_VideoEncoder_Prepare)>);
OH_AVErrCode FakeVideoEncoderPrepare(OH_AVCodec *)
{
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderPushInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_VideoEncoder_PushInputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderPushInputBuffer), decltype(&OH_VideoEncoder_PushInputBuffer)>);
OH_AVErrCode FakeVideoEncoderPushInputBuffer(OH_AVCodec *codec, uint32_t)
{
    const auto &attr = codec->input.attr;
    Require((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) == 0 || attr.size == 0,
        "Encoder receives tail frame and empty EOS separately");
    if ((attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ++g_observation.inputEos;
    }
    codec->output.attr = attr;
    codec->ready = true;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
    __asm__("OH_VideoEncoder_QueryInputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderQueryInputBuffer), decltype(&OH_VideoEncoder_QueryInputBuffer)>);
OH_AVErrCode FakeVideoEncoderQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = 0;
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
    __asm__("OH_VideoEncoder_QueryOutputBuffer");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderQueryOutputBuffer),
    decltype(&OH_VideoEncoder_QueryOutputBuffer)>);
OH_AVErrCode FakeVideoEncoderQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    return QueryOutput(codec, index);
}

extern "C" OH_AVErrCode FakeVideoEncoderRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
    __asm__("OH_VideoEncoder_RegisterCallback");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderRegisterCallback), decltype(&OH_VideoEncoder_RegisterCallback)>);
OH_AVErrCode FakeVideoEncoderRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
{
    return AV_ERR_UNSUPPORT;
}

extern "C" OH_AVErrCode FakeVideoEncoderStart(OH_AVCodec *) __asm__("OH_VideoEncoder_Start");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderStart), decltype(&OH_VideoEncoder_Start)>);
OH_AVErrCode FakeVideoEncoderStart(OH_AVCodec *)
{
    return AV_ERR_OK;
}

extern "C" OH_AVErrCode FakeVideoEncoderStop(OH_AVCodec *) __asm__("OH_VideoEncoder_Stop");
static_assert(std::is_same_v<decltype(&FakeVideoEncoderStop), decltype(&OH_VideoEncoder_Stop)>);
OH_AVErrCode FakeVideoEncoderStop(OH_AVCodec *)
{
    Record("encoder.stop");
    return AV_ERR_OK;
}

int main()
{
    TestSuccess();
    TestCancellation();
    TestPartialInitialization();
    TestMuxerStartFailure();
    TestFinalizationFailure();
    std::cout << "Transcode job integration passed" << std::endl;
}
