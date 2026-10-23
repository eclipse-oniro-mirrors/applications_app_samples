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

export interface RecorderVideoOptions {
  mime: string;
  codecName: string;
  width: number;
  height: number;
  frameRate: number;
  bitrate: number;
  pixelFormat: number;
  bitrateMode: number;
  iFrameInterval: number;
  hdrVivid: boolean;
  synchronous: boolean;
}

export interface RecorderAudioOptions {
  sampleRate: number;
  channelCount: number;
  bitrate: number;
  latencyMode: number;
}

export interface RecorderPreprocessOptions {
  mode: number;
  downsamplingWidth: number;
  downsamplingHeight: number;
  dropToFrameRate: number;
  cropLeft: number;
  cropTop: number;
  cropRight: number;
  cropBottom: number;
}

export interface RecorderSecondaryOptions {
  enabled: boolean;
  fd: number;
  width: number;
  height: number;
}

export interface RecorderDumpOptions {
  enabled: boolean;
  primaryPath: string;
  secondaryPath: string;
  maxMiB: number;
  maxSeconds: number;
}

export interface RecorderOutputOptions {
  fd: number;
  format: number;
}

export interface RecorderOptions {
  video: RecorderVideoOptions;
  audio: RecorderAudioOptions;
  preprocess: RecorderPreprocessOptions;
  secondary: RecorderSecondaryOptions;
  dump: RecorderDumpOptions;
  output: RecorderOutputOptions;
}

export const initNative: (options: RecorderOptions) => Promise<Response>

export const startNative: () => boolean

export const stopBeginNative: () => Promise<Response>

export const stopEndNative: () => Promise<Response>

export interface RecorderStageTiming {
  count: number;
  averageMs: number;
  p95Ms: number;
  maximumMs: number;
}

export interface RecorderStreamStats {
  width: number;
  height: number;
  frames: number;
  bytes: number;
  framesPerSecond: number;
  bitrate: number;
  recentBitrate: number;
  recentFps: number;
  expectedFps: number;
  targetBitrate: number;
  outputIdleMs: number;
  longestGapMs: number;
  keyFrames: number;
  lastKeyFramePtsUs: number;
  keyFrameIntervalMs: number;
  keyFrameWaitMs: number;
  keyFrameRequests: number;
  parameterAccepted: number;
  parameterRejected: number;
  ptsRegressions: number;
  queueDepth: number;
  queuePeak: number;
  codecWidth: number;
  codecHeight: number;
  codecFps: number;
  codecBitrate: number;
  fileBytes: number;
  freeBytes: number;
  fileBytesPerSecond: number;
  dumpBytes: number;
  keyFrameRequest: string;
  requestedConfiguration: string;
  codecDescription: string;
  dumpState: string;
  queueWait: RecorderStageTiming;
  queueResidence: RecorderStageTiming;
  muxerWrite: RecorderStageTiming;
  dumpWrite: RecorderStageTiming;
  bufferHold: RecorderStageTiming;
}

export interface RecorderFailure {
  stage: string;
  code: number;
  message: string;
}

export interface RecorderDiagnostics {
  audio: RecorderAudioStats;
  timeline: RecorderTimelineEvent[];
  endReason: string;
  sessionId: string;
  requestedConfiguration: string;
  observedConfiguration: string;
  parameterChanges: string;
  active: boolean;
  failure: RecorderFailure;
  primary: RecorderStreamStats;
  secondary: RecorderStreamStats;
}

export interface RecorderAudioStats {
  capturedFrames: number;
  pendingPcmMs: number;
  outputFrames: number;
  outputBytes: number;
  recentBitrate: number;
  outputIdleMs: number;
  firstPtsUs: number;
  lastPtsUs: number;
  primaryFirstPtsUs: number;
  primaryLastPtsUs: number;
  secondaryFirstPtsUs: number;
  secondaryLastPtsUs: number;
  primaryWriteFailures: number;
  secondaryWriteFailures: number;
  primaryMuxer: RecorderStageTiming;
  secondaryMuxer: RecorderStageTiming;
}

export interface RecorderTimelineEvent {
  elapsedMs: number;
  stage: string;
  result: string;
}

export const markStage: (sessionId: string, stage: string, result: string) => void

export const getDiagnostics: () => RecorderDiagnostics

/** bitrate=0 表示仅请求关键帧；primary=false 选择副路。成功表示接受请求，不表示已输出关键帧。 */
export const updateParameters: (sessionId: string, primary: boolean, bitrate: number,
  requestKeyFrame: boolean) => Promise<Response>

export class Response {
  code: number
  outputId: string
}
