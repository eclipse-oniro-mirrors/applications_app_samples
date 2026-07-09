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

export enum AudioSourceType {
  MIC = 0,
  VOICE_RECOGNITION = 1,
  PLAYBACK_CAPTURE = 2,
  VOICE_COMMUNICATION = 7,
  VOICE_MESSAGE = 10,
  TYPE_CAMCORDER = 13,
  UNPROCESSED = 14,
  LIVE = 17,
}

export enum AudioSamplingRate {
  SAMPLE_RATE_8000 = 8000,
  SAMPLE_RATE_11025 = 11025,
  SAMPLE_RATE_16000 = 16000,
  SAMPLE_RATE_22050 = 22050,
  SAMPLE_RATE_24000 = 24000,
  SAMPLE_RATE_32000 = 32000,
  SAMPLE_RATE_44100 = 44100,
  SAMPLE_RATE_48000 = 48000,
  SAMPLE_RATE_96000 = 96000,
}

export enum AudioChannel {
  MONO = 1,
  STEREO = 2,
  CHANNEL_3 = 3,
}

export enum AudioSampleFormat {
  U8 = 0,
  S16LE = 1,
  S24LE = 2,
  S32LE = 3,
  F32LE = 4
}

export const SECOND_BUFFER_WALK = 48000 * 2 * (16 / 8);

export enum InterruptHintType {
  INTERRUPT_HINT_NONE = 0,
  INTERRUPT_HINT_RESUME = 1,
  INTERRUPT_HINT_PAUSE = 2,
  INTERRUPT_HINT_STOP = 3,
  INTERRUPT_HINT_DUCK = 4,
  INTERRUPT_HINT_UNDUCK = 5,
  INTERRUPT_HINT_MUTE = 6,
  INTERRUPT_HINT_UNMUTE = 7,
}

export enum AudioState {
  RUNNING = 0,
  PAUSED = 1,
  STOPPED = 2,
  MUTED = 3,
  UNMUTED = 4
}