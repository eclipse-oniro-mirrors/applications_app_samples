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
export enum AudioSamplingRate {
  SAMPLE_RATE_8000 = 8000,
  SAMPLE_RATE_16000 = 16000,
  SAMPLE_RATE_44100 = 44100,
  SAMPLE_RATE_48000 = 48000,
}

export enum AudioChannel {
  MONO = 1,
  STEREO = 2,
}

export enum AudioSampleFormat {
  U8 = 0,
  S16LE = 1,
  S24LE = 2,
  S32LE = 3,
  F32LE = 4,
}

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
  DUCKED = 3,
  UNDUCKED = 4,
}

export enum StreamUsage {
  MUSIC = 1,
  NAVIGATION = 9,
}

export const BYTES_PER_SAMPLE_S16LE = 2; // S16LE format: 2 bytes per sample
export const MUSIC_SAMPLE_RATE = 44100;
export const MUSIC_CHANNEL_COUNT = 2;
export const MUSIC_SAMPLE_FORMAT = 1; // S16LE
export const MUSIC_BYTE_RATE = MUSIC_SAMPLE_RATE * MUSIC_CHANNEL_COUNT * BYTES_PER_SAMPLE_S16LE;
export const MUSIC_DURATION_MS = 30000; // 30 seconds music duration

export const NAV_SAMPLE_RATE = 16000;
export const NAV_CHANNEL_COUNT = 1;
export const NAV_SAMPLE_FORMAT = 1; // S16LE
export const NAV_BYTE_RATE = NAV_SAMPLE_RATE * NAV_CHANNEL_COUNT * BYTES_PER_SAMPLE_S16LE;
export const NAV_DURATION_MS = 8000; // 8 seconds navigation duration
