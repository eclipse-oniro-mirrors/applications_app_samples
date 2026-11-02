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

export interface TranscodeRequest {
  inputFd: number;
  outputFd: number;
  mime: string;
  bitrate: number;
  longEdge: number;
  useSurfaceInput: boolean;
  grayscale: boolean;
  resizeMode?: number;
  encoderCategory: number;
  audioMode: number;
  audioTrack: number;
  startTimeMs?: number;
  endTimeMs?: number;
}

export interface TranscodeMeasurement {
  name: string;
  calls: number;
  totalMs: number;
  averageMs: number;
  p95Ms: number;
  maxMs: number;
}

export interface TranscodeStatus {
  state: number;
  stage: string;
  detail: string;
  errorCode: number;
  progress: number;
  frames: number;
  bytes: number;
  outputWidth: number;
  outputHeight: number;
  audioCopied: boolean;
  elapsedMs: number;
  firstFrameMs: number;
  fps: number;
  speed: number;
  remainingSeconds: number;
  decoderWaitMs: number;
  encoderInputWaitMs: number;
  encoderOutputWaitMs: number;
  copiedBytes: number;
  fileBytes: number;
  availableBytes: number;
  estimatedBytes: number;
  diagnostics: TranscodeMeasurement[];
  decoderName: string;
  encoderName: string;
  sourceWidth: number;
  sourceHeight: number;
  durationUs: number;
  sourceFrameRate: number;
  sourceMime: string;
  audioTracks: string[];
  audioTrackIds: number[];
  minBitrate: number;
  maxBitrate: number;
  audioBytes: number;
  audioMode: number;
  outputDurationUs?: number;
  outputValidation?: string;
}

export const start: (options: TranscodeRequest) => Promise<TranscodeStatus>;
export const inspect: (options: TranscodeRequest) => Promise<TranscodeStatus>;
export const getStatus: () => TranscodeStatus;
export const cancel: () => void;
