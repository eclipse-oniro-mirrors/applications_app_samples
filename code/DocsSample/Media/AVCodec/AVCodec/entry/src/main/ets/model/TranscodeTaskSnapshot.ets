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

import { TranscodeRequest } from 'libtranscoder.so';

// 保存值快照，预检、Native提交与报告不再读取界面草稿。
export class TranscodeTaskSnapshot {
  public readonly configuration: string;
  private readonly encodedRequest: string;

  constructor(configuration: string, request: TranscodeRequest) {
    this.configuration = configuration;
    this.encodedRequest = JSON.stringify(request);
  }

  request(inputFd: number, outputFd: number): TranscodeRequest {
    const request: TranscodeRequest = JSON.parse(this.encodedRequest) as TranscodeRequest;
    request.inputFd = inputFd;
    request.outputFd = outputFd;
    return request;
  }

  validRange(durationUs: number): boolean {
    const request: TranscodeRequest = this.request(0, 0);
    const startMs: number = request.startTimeMs ?? 0;
    const endMs: number = request.endTimeMs ?? 0;
    if (!Number.isSafeInteger(startMs) || !Number.isSafeInteger(endMs) || startMs < 0 || endMs < 0) {
      return false;
    }
    if (durationUs <= 0) { return startMs === 0 && endMs === 0; }
    const selectedEnd: number = endMs === 0 ? durationUs / 1000 : endMs;
    return selectedEnd > startMs && selectedEnd <= durationUs / 1000;
  }
}
