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

export interface RecordingOutputExpectation extends RecordingOutputMetadata {
  hasAudio: boolean;
}

export interface RecordingOutputMetadata {
  width: number;
  height: number;
  hasAudio?: boolean;
  durationMs: number;
  fileBytes: number;
}

export interface RecordingOutputCheck {
  uri: string;
  secondary: boolean;
  status: string;
  expected: RecordingOutputExpectation;
  actual?: RecordingOutputMetadata;
  differences: string[];
  error: string;
}

export class RecordingOutputValidation {
  static compare(uri: string, secondary: boolean, expected: RecordingOutputExpectation,
    actual?: RecordingOutputMetadata, error: string = ''): RecordingOutputCheck {
    const differences: string[] = [];
    if (actual !== undefined) {
      if (actual.width !== expected.width || actual.height !== expected.height) { differences.push('dimensions'); }
      if (actual.hasAudio !== undefined && actual.hasAudio !== expected.hasAudio) { differences.push('audio'); }
      // 相机首帧、AAC尾帧及停止排空会带来少量偏差，短片段也保留1.5s容差。
      if (Number.isFinite(actual.durationMs) && Math.abs(actual.durationMs - expected.durationMs) >
        Math.max(1500, expected.durationMs * 0.1)) { differences.push('duration'); }
      if (actual.fileBytes <= 0 || (expected.fileBytes >= 0 && actual.fileBytes !== expected.fileBytes)) {
        differences.push('size');
      }
    }
    const missing: boolean = actual === undefined || actual.width <= 0 || actual.height <= 0 ||
      !Number.isFinite(actual.durationMs) || actual.durationMs <= 0 || actual.hasAudio === undefined ||
      expected.fileBytes < 0;
    return { uri, secondary, expected, actual, differences,
      status: error.length > 0 || missing ? 'unavailable' : (differences.length > 0 ? 'different' : 'matched'),
      error: error || (missing ? 'Required metadata or final file size is unavailable' : '') };
  }
}
