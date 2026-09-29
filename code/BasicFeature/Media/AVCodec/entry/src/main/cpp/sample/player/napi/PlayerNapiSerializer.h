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

#ifndef VIDEO_CODEC_PLAYER_NAPI_SERIALIZER_H
#define VIDEO_CODEC_PLAYER_NAPI_SERIALIZER_H

#include "Player.h"
#include "napi/native_api.h"

namespace PlayerNapiSerializer {
bool CreatePlaybackResult(napi_env env, bool success, PlaybackCompletionReason reason,
    bool structuredResult, napi_value &result);
bool CreatePlaybackInfo(napi_env env, const PlaybackInfo &info, napi_value &result);
bool CreateMediaInfo(napi_env env, const MediaInfo &info, napi_value &result);
bool ExportPlayerState(napi_env env, napi_value exports);
} // namespace PlayerNapiSerializer

#endif // VIDEO_CODEC_PLAYER_NAPI_SERIALIZER_H
