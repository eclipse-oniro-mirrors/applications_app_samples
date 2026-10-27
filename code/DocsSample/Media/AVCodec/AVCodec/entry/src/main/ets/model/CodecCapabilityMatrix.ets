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

import { deviceInfo } from '@kit.BasicServicesKit';
import { DeviceCodecCapability, DeviceCodecCapabilityRange, DeviceCodecProfileLevels } from 'libplayer.so';

export interface CodecMatrixRow {
  key: string; name: string; mime: string; codecType: number; hardware: boolean; capabilities: string;
}
export interface CodecMatrixSnapshot { version: number; capturedAt: number; device: string; api: number; rows: CodecMatrixRow[]; }
export class CodecCapabilityMatrix {
  static capture(codecs: DeviceCodecCapability[]): CodecMatrixSnapshot {
    return { version: 1, capturedAt: Date.now(), device: deviceInfo.productModel, api: deviceInfo.sdkApiVersion,
      rows: codecs.map((codec: DeviceCodecCapability): CodecMatrixRow => ({
        key: codec.codecType + ':' + codec.mimeType + ':' + codec.codecName, name: codec.codecName,
        mime: codec.mimeType, codecType: codec.codecType, hardware: codec.hardware,
        capabilities: 'instances=' + codec.maxInstances + '; width=' + CodecCapabilityMatrix.range(codec.videoWidthRange) +
          '; height=' + CodecCapabilityMatrix.range(codec.videoHeightRange) +
          '; rate=' + CodecCapabilityMatrix.range(codec.videoFrameRateRange) +
          '; alignment=' + codec.videoWidthAlignment + ',' + codec.videoHeightAlignment +
          '; pixels=' + codec.videoPixelFormats.slice().sort((a: number, b: number): number => a - b).join(',') +
          '; profiles=' + codec.profiles.slice().sort((a: number, b: number): number => a - b).join(',') +
          '; levels=' + codec.profileLevels.map((item: DeviceCodecProfileLevels): string => item.profile + ':' +
            item.levels.slice().sort((a: number, b: number): number => a - b).join(',')).sort().join('|') +
          '; samples=' + codec.audioSampleRates.slice().sort((a: number, b: number): number => a - b).join(',') +
          '; sampleRanges=' + codec.audioSampleRateRanges.map((item: DeviceCodecCapabilityRange): string =>
            CodecCapabilityMatrix.range(item)).sort().join(',') +
          '; channels=' + CodecCapabilityMatrix.range(codec.audioChannelCountRange) +
          '; bitrate=' + CodecCapabilityMatrix.range(codec.encoderBitrateRange)
      })).sort((a: CodecMatrixRow, b: CodecMatrixRow): number => a.key.localeCompare(b.key)) };
  }
  private static range(range: DeviceCodecCapabilityRange | undefined): string {
    return range === undefined ? '?' : range.min + ':' + range.max;
  }
  static parse(text: string): CodecMatrixSnapshot {
    if (text.length > 2 * 1024 * 1024) { throw new Error('Capability snapshot too large'); }
    const snapshot: CodecMatrixSnapshot = JSON.parse(text) as CodecMatrixSnapshot;
    if (snapshot === null || snapshot.version !== 1 || !Array.isArray(snapshot.rows) || snapshot.rows.length > 512 ||
      typeof snapshot.device !== 'string' || snapshot.device.length > 256 || !Number.isInteger(snapshot.api) ||
      !Number.isFinite(snapshot.capturedAt)) { throw new Error('Invalid capability snapshot'); }
    const keys: Set<string> = new Set<string>();
    for (const row of snapshot.rows) {
      if (row === null || typeof row.name !== 'string' || typeof row.mime !== 'string' ||
        typeof row.key !== 'string' || row.key !== row.codecType + ':' + row.mime + ':' + row.name ||
        !Number.isInteger(row.codecType) || row.codecType < 0 || row.codecType > 3 ||
        typeof row.hardware !== 'boolean' || typeof row.capabilities !== 'string' ||
        row.capabilities.length > 8192 || keys.has(row.key)) { throw new Error('Invalid capability row'); }
      keys.add(row.key);
    }
    return snapshot;
  }
  static compare(current: CodecMatrixSnapshot, previous: CodecMatrixSnapshot): string[] {
    const lines: string[] = [previous.device + ' / API ' + previous.api + ' -> ' + current.device + ' / API ' + current.api];
    current.rows.forEach((row: CodecMatrixRow): void => {
      const before: CodecMatrixRow | undefined = previous.rows.find((item: CodecMatrixRow): boolean => item.key === row.key);
      if (before === undefined) { lines.push('+ ' + row.key); }
      else if (row.hardware !== before.hardware || row.capabilities !== before.capabilities) {
        lines.push('~ ' + row.key + '\n  before: ' + (before.hardware ? 'HW ' : 'SW ') + before.capabilities +
          '\n  current: ' + (row.hardware ? 'HW ' : 'SW ') + row.capabilities);
      }
    });
    previous.rows.forEach((row: CodecMatrixRow): void => {
      if (!current.rows.some((item: CodecMatrixRow): boolean => item.key === row.key)) { lines.push('- ' + row.key); }
    });
    return lines;
  }
}
