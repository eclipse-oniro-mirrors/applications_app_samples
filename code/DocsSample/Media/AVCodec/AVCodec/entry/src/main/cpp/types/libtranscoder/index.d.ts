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
  surface: boolean;
  grayscale: boolean;
  keepAudio: boolean;
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
}

export const start: (options: TranscodeRequest) => Promise<TranscodeStatus>;
export const getStatus: () => TranscodeStatus;
export const cancel: () => void;
