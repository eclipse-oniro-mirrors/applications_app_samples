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

import { common } from '@kit.AbilityKit';
import { ShortcutService } from '../../../main/ets/services/ShortcutService';
import { BatchSpan, BatchTelemetry } from '../../../main/ets/services/BatchTelemetry';
import { CaseScope, getTestContext } from './CaseScope';
import { Deferred } from './ShortcutFixture';
import { WaveJournalPort, WaveShortcutPort } from './ShortcutWaveFixture';

/** Real persisted input; no validation or state transitions are implemented here. */
export function waveTwoArchive(extra: string = ''): string {
  return '{"version":1,"notes":[{"id":"a","title":"正式标题","body":"正式正文","createdAt":1},' +
    '{"id":"b","title":"其它标题","body":"其它正文","createdAt":2}],"draftTitle":"独立草稿",' +
    '"draftBody":"独立新正文","todoDays":[],"noteHistory":[' +
    '{"revisionId":"ar","noteId":"a","title":"早期标题","body":"早期正文","savedAt":1,"action":"edit"},' +
    '{"revisionId":"br","noteId":"b","title":"其它早期","body":"其它旧正文","savedAt":2,"action":"create"}]' + extra + '}';
}

export class WaveTwoJournalPort extends WaveJournalPort {
  public writeGate: Deferred<void> | undefined = undefined;
  public holdAt: number = -1;
  public events: string[] = [];
  async read(context: common.ApplicationContext): Promise<string> {
    this.events.push('read');
    return super.read(context);
  }
  async write(value: string): Promise<void> {
    this.writes.push(value);
    const index: number = this.writes.length;
    this.events.push(`write-start-${index}`);
    if (index === this.holdAt && this.writeGate !== undefined) { await this.writeGate.promise; }
    if (this.failWrite) { throw new Error('controlled journal write failed'); }
    this.value = value;
    this.events.push(`write-end-${index}`);
  }
}

class QuietTelemetry implements BatchTelemetry {
  begin(stage: string): BatchSpan { const span: BatchSpan = new BatchSpan(); span.stage = stage; return span; }
  finish(_span: BatchSpan): void {}
}

export function createWaveTwoService(scope: CaseScope, api: WaveShortcutPort,
  io: WaveTwoJournalPort, timeout: number = 5000): ShortcutService {
  const service: ShortcutService = new ShortcutService(api, io, timeout, new QuietTelemetry());
  scope.cleanup((): void => { service.dispose(); io.writeGate?.resolve(undefined); io.readGate?.resolve(''); });
  service.initialize(getTestContext());
  return service;
}

export async function readyWaveTwoService(scope: CaseScope, service: ShortcutService): Promise<void> {
  await scope.until((): boolean => !service.snapshot().busy && !service.snapshot().batchLoading,
    (changed: () => void): (() => void) => {
      const id: number = service.subscribe(changed);
      return (): void => { service.unsubscribe(id); };
    });
}
