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

import recorder, { RecorderDiagnostics } from 'librecorder.so';
import { LocalizedText } from '../common/LocalizedText';
import { RecorderLiveDiagnosticsModel } from '../model/RecorderLiveDiagnosticsModel';

export interface RecorderStorageEstimate {
  availableBytes: number;
  bytesPerSecond: number;
  remainingSeconds: number;
  shouldStop: boolean;
}

export class RecorderDiagnosticsController {
  private timer: number = -1;
  private stopRequested: boolean = false;
  private previousBytes: number = -1;
  private previousAt: number = 0;
  private rates: number[] = [];
  private startedAt: number = 0;
  private static readonly RESERVE_BYTES: number = 256 * 1048576;

  estimate(diagnostics: RecorderDiagnostics, dual: boolean, protect: boolean, now: number): RecorderStorageEstimate {
    const primary = diagnostics.primary;
    const secondary = diagnostics.secondary;
    // 双路可能位于不同卷；使用较小可用空间、合计增长，宁可少估，不重复累加共享卷的空间。
    const space: number = !dual ? primary.freeBytes :
      primary.freeBytes < 0 || secondary.freeBytes < 0 ? -1 : Math.min(primary.freeBytes, secondary.freeBytes);
    const dumpBytes: number = primary.dumpBytes + (dual ? secondary.dumpBytes : 0);
    const bytes: number = primary.fileBytes < 0 || (dual && secondary.fileBytes < 0) ? -1 :
      primary.fileBytes + (dual ? secondary.fileBytes : 0) + dumpBytes;
    if (this.startedAt === 0) { this.startedAt = now; }
    if (bytes >= 0 && this.previousBytes >= 0 && bytes >= this.previousBytes && now > this.previousAt) {
      this.rates.push((bytes - this.previousBytes) * 1000 / (now - this.previousAt));
      if (this.rates.length > 5) { this.rates.shift(); }
    }
    this.previousAt = now;
    this.previousBytes = bytes;
    const rate: number = this.rates.length >= 3 && now - this.startedAt >= 3000 ?
      this.rates.reduce((sum: number, sample: number): number => sum + sample, 0) / this.rates.length : -1;
    // 为正常 EOS / 容器尾部留固定空间，并给高码率录制至少 10 秒的收尾余量。
    const reserve: number = Math.max(RecorderDiagnosticsController.RESERVE_BYTES, rate > 0 ? rate * 10 : 0);
    const remaining: number = space >= 0 && rate > 0 ? Math.max(0, space - reserve) / rate : -1;
    return { availableBytes: space, bytesPerSecond: rate, remainingSeconds: remaining,
      shouldStop: protect && space >= 0 && space <= reserve };
  }

  start(dual: boolean, protect: boolean, onUpdate: (compact: string, details: string) => void,
    onLowSpace: () => void): void {
    this.stop();
    this.stopRequested = false;
    this.previousBytes = -1;
    this.previousAt = 0;
    this.rates = [];
    this.startedAt = 0;
    this.timer = setInterval((): void => {
      try {
        const diagnostics = recorder.getDiagnostics();
        const estimate = this.estimate(diagnostics, dual, protect, Date.now());
        const lines: string[] = [RecorderLiveDiagnosticsModel.compact(diagnostics.primary,
          LocalizedText.get($r('app.string.recorder_primary')), diagnostics.active)];
        if (dual) {
          lines.push(RecorderLiveDiagnosticsModel.compact(diagnostics.secondary,
            LocalizedText.get($r('app.string.recorder_secondary')), diagnostics.active));
        }
        lines.push(LocalizedText.get($r('app.string.rec_storage_remaining')) + ': ' +
          (estimate.remainingSeconds < 0 ? '--' : Math.floor(estimate.remainingSeconds) + ' s'));
        onUpdate(lines.join(String.fromCharCode(10)), RecorderLiveDiagnosticsModel.report(diagnostics, dual));
        if (!this.stopRequested && (!diagnostics.active || diagnostics.failure.stage.length > 0 || estimate.shouldStop)) {
          this.stopRequested = true;
          this.stop();
          onLowSpace();
        }
      } catch (_error) { /* 一次诊断读取失败不能停止录像或把空间当作零。 */ }
    }, 1000);
  }

  stop(): void { if (this.timer >= 0) { clearInterval(this.timer); this.timer = -1; } }
}
