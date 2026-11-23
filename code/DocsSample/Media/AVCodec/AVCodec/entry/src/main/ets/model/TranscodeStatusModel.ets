/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TranscodeStatus } from 'libtranscoder.so';

export function idleTranscodeStatus(): TranscodeStatus {
  return {
    state: 0,
    stage: 'idle',
    detail: '',
    errorCode: 0,
    progress: 0,
    frames: 0,
    bytes: 0,
    outputWidth: 0,
    outputHeight: 0,
    audioCopied: false,
    elapsedMs: 0,
    firstFrameMs: -1,
    fps: 0,
    speed: 0,
    remainingSeconds: -1,
    decoderWaitMs: 0,
    encoderInputWaitMs: 0,
    encoderOutputWaitMs: 0,
    copiedBytes: 0,
    fileBytes: 0,
    availableBytes: -1,
    estimatedBytes: -1,
    diagnostics: [],
    decoderName: '',
    encoderName: '',
    sourceWidth: 0,
    sourceHeight: 0,
    durationUs: 0,
    sourceFrameRate: 0,
    sourceMime: '',
    audioTracks: [],
    audioTrackIds: [],
    selectedAudioChannels: 0,
    subtitleTracks: [],
    minBitrate: 0,
    maxBitrate: 0,
    audioBytes: 0,
    audioMode: 0,
    outputDurationUs: 0,
    outputValidation: '',
    sampleValidation: 'not_requested'
  };
}
