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

import { systemDateTime } from '@kit.BasicServicesKit';
import { hiAppEvent, hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { logInfo, logWarning } from './Logger';

export class BatchSpan {
  public id: number = 0;
  public stage: string = '';
  public startedAt: number = -1;
  public traceStarted: boolean = false;
}
export interface BatchTelemetry {
  begin(stage: string): BatchSpan;
  finish(span: BatchSpan): void;
}

/** Fixed stages + generated correlation only. No shortcut ID, Want, title, body, or path leaves the process. */
export class PlatformBatchTelemetry implements BatchTelemetry {
  private sequence: number = 0;
  begin(stage: string): BatchSpan {
    const span: BatchSpan = new BatchSpan();
    span.id = ++this.sequence;
    span.stage = stage;
    try { span.startedAt = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false); } catch (_) { logWarning('Optional batch telemetry is unavailable'); }
    try {
      hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, `ShortcutBatch_${stage}`,
        span.id, 'ShortcutBatch');
      span.traceStarted = true;
    } catch (_) { logWarning('Optional batch telemetry is unavailable'); }
    return span;
  }
  finish(span: BatchSpan): void {
    let elapsed: number = 0;
    try {
      if (span.startedAt >= 0) {
        elapsed = Math.max(0, systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - span.startedAt);
      }
    } catch (_) { logWarning('Optional batch telemetry is unavailable'); }
    try {
      if (span.traceStarted) {
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, `ShortcutBatch_${span.stage}`, span.id);
      }
    } catch (_) { logWarning('Optional batch telemetry is unavailable'); }
    logInfo(`batch id=${span.id} stage=${span.stage} elapsedMs=${elapsed}`);
    try {
      void hiAppEvent.write({ domain: 'SHORTCUT_BATCH', name: 'STAGE_END', eventType: hiAppEvent.EventType.BEHAVIOR,
        params: { correlation: span.id, stage: span.stage, elapsed_ms: elapsed } }).catch(() => { logWarning('Batch event write failed'); });
    } catch (_) { logWarning('Optional batch telemetry is unavailable'); }
  }
}
