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
#include "NativePlayerContext.h"
#include "dfx/error/av_codec_sample_error.h"

int32_t StartPlayerPlayback(NativePlayerSession &session, SampleInfo &info,
    void (*callback)(void *, bool, PlaybackCompletionReason), void *data)
{
    if (session.StopPending()) {
        callback(data, true, PlaybackCompletionReason::STOPPED);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    info.playback.playDoneCallback = callback;
    info.playback.playDoneCallbackData = data;
    bool completionOwned = false;
    const int32_t initialized = session.player.Init(info, &completionOwned);
    if (initialized != AVCODEC_SAMPLE_ERR_OK) {
        if (!completionOwned) { callback(data, false, PlaybackCompletionReason::ERROR); }
        return initialized;
    }
    if (session.StopPending()) {
        (void)session.player.Stop();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return session.player.Start();
}
