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

import { hiAppEvent, hilog, hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { DOMAIN, TAG, reportFailure } from './SampleLogger';

/** Only fixed operation/outcome codes and local correlation IDs cross this boundary. */
export interface StartupTelemetry {
  begin(operation: string, id: number): void;
  end(operation: string, id: number, outcome: string): void;
  event(operation: string, id: number, outcome: string): void;
}

export class SystemStartupTelemetry implements StartupTelemetry {
  private active: Set<string> = new Set<string>();
  begin(operation: string, id: number): void {
    try {
      hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL,
        operation, id, 'autostart');
      this.active.add(`${operation}:${id}`);
    } catch (_) { reportFailure('Trace begin'); }
  }
  end(operation: string, id: number, outcome: string): void {
    const key = `${operation}:${id}`;
    if (this.active.delete(key)) {
      try {
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, operation, id);
      } catch (_) { reportFailure('Trace end'); }
    }
    this.event(operation, id, outcome);
  }
  event(operation: string, id: number, outcome: string): void {
    try {
      hilog.info(DOMAIN, TAG, '%{public}s id=%{public}d outcome=%{public}s',
        operation, id, outcome);
      hiAppEvent.write({ domain: 'autostart', name: operation, eventType: hiAppEvent.EventType.BEHAVIOR,
        params: { request_id: id, outcome: outcome } }).catch((): void => reportFailure('Event write'));
    } catch (_) { reportFailure('Event collection'); }
  }
}

/** Even an injected/faulty collector is isolated at the business boundary. */
export function safeBegin(sink: StartupTelemetry, operation: string, id: number): void {
  try { sink.begin(operation, id); } catch (_) { reportFailure('Telemetry sink'); }
}
export function safeEnd(sink: StartupTelemetry, operation: string, id: number, outcome: string): void {
  try { sink.end(operation, id, outcome); } catch (_) { reportFailure('Telemetry sink'); }
}
export function safeEvent(sink: StartupTelemetry, operation: string, id: number, outcome: string): void {
  try { sink.event(operation, id, outcome); } catch (_) { reportFailure('Telemetry sink'); }
}
