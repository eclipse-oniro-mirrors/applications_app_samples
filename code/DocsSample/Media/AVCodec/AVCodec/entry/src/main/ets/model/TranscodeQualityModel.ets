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

export enum TranscodeAudioMode {
  COPY,
  REENCODE,
  NONE
}

export interface TranscodeQualitySnapshot {
  operation: number; filter: number; frameRate: number; bitrateMode: number; keyFrame: number;
  audioRate: number; audioChannels: number; audioBitrate: number;
  audioSourceLayout?: number;
  codecMode?: number;
  audioResampler?: number;
  deepValidation?: boolean;
  remuxAllAudioTracks?: boolean;
}

@Observed
export class TranscodeQualityModel {
  public operation: number = 0;
  public filter: number = 0;
  public frameRate: number = 0;
  public bitrateMode: number = 0;
  public keyFrame: number = 1;
  public audioRate: number = 0;
  public audioChannels: number = 0;
  public audioBitrate: number = 1;
  public audioSourceLayout: number = 0;
  public codecMode: number = 0;
  public audioResampler: number = 0;
  public deepValidation: boolean = false;
  public remuxAllAudioTracks: boolean = false;

  static valid(snapshot: TranscodeQualitySnapshot | undefined): boolean {
    if (snapshot === undefined) { return true; }
    if (snapshot === null || typeof snapshot !== 'object') { return false; }
    if (snapshot.audioResampler !== undefined && (!Number.isInteger(snapshot.audioResampler) ||
      snapshot.audioResampler < 0 || snapshot.audioResampler > 1)) { return false; }
    if (snapshot.codecMode !== undefined &&
      (!Number.isInteger(snapshot.codecMode) || snapshot.codecMode < 0 || snapshot.codecMode > 1)) { return false; }
    if (snapshot.deepValidation !== undefined && typeof snapshot.deepValidation !== 'boolean') { return false; }
    if (snapshot.remuxAllAudioTracks !== undefined && typeof snapshot.remuxAllAudioTracks !== 'boolean') {
      return false;
    }
    if (snapshot.audioSourceLayout !== undefined && (!Number.isInteger(snapshot.audioSourceLayout) ||
      snapshot.audioSourceLayout < 0 || snapshot.audioSourceLayout > 2)) { return false; }
    const values: number[] = [snapshot.operation, snapshot.filter, snapshot.frameRate, snapshot.bitrateMode,
      snapshot.keyFrame, snapshot.audioRate, snapshot.audioChannels, snapshot.audioBitrate];
    const limits: number[] = [1, 2, 4, 1, 3, 2, 2, 2];
    return values.every((value: number, index: number): boolean =>
      Number.isInteger(value) && value >= 0 && value <= limits[index]);
  }

  snapshot(): TranscodeQualitySnapshot {
    return { operation: this.operation, filter: this.filter, frameRate: this.frameRate,
      bitrateMode: this.bitrateMode, keyFrame: this.keyFrame, audioRate: this.audioRate,
      audioChannels: this.audioChannels, audioBitrate: this.audioBitrate, codecMode: this.codecMode,
      audioSourceLayout: this.audioSourceLayout,
      audioResampler: this.audioResampler,
      deepValidation: this.deepValidation,
      remuxAllAudioTracks: this.remuxAllAudioTracks };
  }

  restore(snapshot: TranscodeQualitySnapshot | undefined): void {
    this.operation = snapshot?.operation ?? 0; this.filter = snapshot?.filter ?? 0;
    this.frameRate = snapshot?.frameRate ?? 0; this.bitrateMode = snapshot?.bitrateMode ?? 0;
    this.keyFrame = snapshot?.keyFrame ?? 1; this.audioRate = snapshot?.audioRate ?? 0;
    this.audioChannels = snapshot?.audioChannels ?? 0; this.audioBitrate = snapshot?.audioBitrate ?? 1;
    this.audioSourceLayout = snapshot?.audioSourceLayout ?? 0;
    this.codecMode = snapshot?.codecMode ?? 0;
    this.audioResampler = snapshot?.audioResampler ?? 0;
    this.deepValidation = snapshot?.deepValidation ?? false;
    this.remuxAllAudioTracks = snapshot?.remuxAllAudioTracks ?? false;
  }
}
