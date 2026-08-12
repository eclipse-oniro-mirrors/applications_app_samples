/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export enum PlayerState {
  IDLE = 0,
  INITIALIZING = 1,
  READY = 2,
  PLAYING = 3,
  STOPPING = 4,
}

export type PlaybackCompletionReason = 'completed' | 'stopped' | 'error'

export interface PlayOptions {
  inputFileFd: number;
  inputFileOffset: number;
  inputFileSize: number;
  videoDecoderType: number;
  videoDecoderRunMode: number;
  videoDecoderSyncMode: number;
  isSmartFluencySupported: boolean;
  enableVideoDump: boolean;
}

export interface PlaybackResult {
  success: boolean;
  reason: PlaybackCompletionReason;
}

export const play: (
  options: PlayOptions,
  cbFn: (result: PlaybackResult) => void
) => boolean

export const playNative: (
  inputFileFd: number,
  inputFileOffset: number,
  inputFileSize: number,
  videoDecoderType: number,
  videoDecoderRunMode: number,
  videoDecoderSyncMode: number,
  isSmartFluencySupported: boolean,
  enableVideoDump: boolean,
  cbFn: (success: boolean) => void
) => boolean

export const stop: () => boolean

export const getState: () => PlayerState

export const isSmartFluencyAvailable: () => boolean

export const setPlaybackSpeed: (
  speed: number,
) => void

export const setTransform: (
  transformHint: number,
) => void

export const setSmartFluencyEnabled: (
  enabled: boolean,
) => void

export const onThermalWarningReceived: (
  ratio: number,
) => void

export const onThermalLevelRecovered: () => void
