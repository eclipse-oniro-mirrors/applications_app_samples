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

import { describe, expect, it } from '@ohos/hypium';
import { ShortcutService } from '../../../main/ets/services/ShortcutService';
import { BatchJournal, BatchPlan, BatchPreview, copyBatch } from '../../../main/ets/services/VisibilityBatch';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { Deferred, shortcutInfo } from '../support/ShortcutFixture';
import { WaveShortcutPort, waveJournal, waveSettle } from '../support/ShortcutWaveFixture';
import { WaveTwoJournalPort, createWaveTwoService, readyWaveTwoService } from '../support/ShortcutWaveTwoFixture';

function currentPreview(service: ShortcutService): BatchPreview {
  const value: BatchPreview | undefined = service.snapshot().batchPreview;
  if (value === undefined) { throw new Error('expected production preview'); }
  return value;
}
function currentBatch(service: ShortcutService): BatchPlan {
  const batches: BatchPlan[] = service.snapshot().batches;
  if (batches.length === 0) { throw new Error('expected production batch'); }
  return batches[0];
}
class RestoreHeldPort extends WaveShortcutPort {
  public restoreGate: Deferred<void> = new Deferred<void>();
  async setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    if (this.writes.length === 1) { await this.restoreGate.promise; }
    await super.setShortcutVisibleForSelf(id, visible);
  }
}

export default function shortcutBatchWaveTwoTests(): void {
  describe('ShortcutBatchWaveTwo', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVETWO_0100
     * @tc.name testShortcutBatchWaveTwo0001
     * @tc.desc 批次存档写入期间同实例重新初始化不永久卡在旧设置忙状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutBatchWaveTwo0001', 0, async (): Promise<void> => {
      const observations: number[] = [];
      const traces: string[][] = [];
      await runCase(async (scope: CaseScope): Promise<void> => {
        const api: WaveShortcutPort = new WaveShortcutPort();
        const io: WaveTwoJournalPort = new WaveTwoJournalPort();
        const service: ShortcutService = createWaveTwoService(scope, api, io);
        traces.push(io.events);
        await readyWaveTwoService(scope, service);
        io.holdAt = 1;
        io.writeGate = new Deferred<void>();
        const oldPreview: Promise<void> = service.previewBatch(['a'], false);
        await waveSettle();
        service.dispose();
        service.initialize(getTestContext());
        observations.push(io.reads);
        await service.previewBatch(['b'], true);
        observations.push(io.writes.length);
        io.writeGate.resolve(undefined);
        await oldPreview;
        await waveSettle();
        expect(service.snapshot().busy).assertFalse();
        expect(service.snapshot().batchReady).assertTrue();
        expect(currentBatch(service).items[0].id).assertEqual('a');
        expect(service.snapshot().batchPreview).assertUndefined();
        await service.previewBatch(['b'], true);
        expect(currentBatch(service).batchId).assertEqual('batch-2');
        expect(service.snapshot().batches[1].items[0].id).assertEqual('a');
        io.holdAt = 3;
        io.writeGate = new Deferred<void>();
        const oldExecution: Promise<void> = service.executeBatchPreview(currentPreview(service).token);
        await waveSettle();
        service.dispose();
        service.initialize(getTestContext());
        observations.push(io.reads);
        await service.previewBatch(['a'], false);
        observations.push(io.writes.length);
        io.writeGate.resolve(undefined);
        await oldExecution;
        await waveSettle();
        observations.push(service.snapshot().batchReady ? 1 : 0);
        observations.push(currentBatch(service).items[0].attempt);
        traces.push([currentBatch(service).items[0].result]);
        await service.previewBatch(['a'], false);
        observations.push(Number(currentBatch(service).batchId.substring(6)));
        expect(api.writes.length).assertEqual(0);
      });
      expect(observations.join(',')).assertEqual('1,1,2,3,1,1,3');
      expect(traces[0].join(',')).assertEqual(
        'read,write-start-1,write-end-1,read,write-start-2,write-end-2,' +
        'write-start-3,write-end-3,read,write-start-4,write-end-4');
      expect(traces[1].join(',')).assertEqual('unknown');
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVETWO_0200
     * @tc.name testShortcutBatchWaveTwo0002
     * @tc.desc 权限能力错误封闭的计划不能通过补偿入口绕开限制
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutBatchWaveTwo0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const api: WaveShortcutPort = new WaveShortcutPort();
        api.infos = [shortcutInfo('a', false)];
        const io: WaveTwoJournalPort = new WaveTwoJournalPort();
        const journal: BatchJournal = waveJournal();
        journal.batches[0].items[0].retryBlocked = true;
        io.value = JSON.stringify(journal);
        const service: ShortcutService = createWaveTwoService(scope, api, io);
        await readyWaveTwoService(scope, service);
        await service.previewBatchRestore('batch-1');
        expect(currentPreview(service).items[0].eligible).assertFalse();
        expect(currentPreview(service).items[0].reason).assertEqual('权限/能力/无效ID错误已封闭重试，请修正条件后创建新预览');
        await service.executeBatchPreview(currentPreview(service).token, true);
        expect(api.writes.length).assertEqual(0);
        expect(currentBatch(service).items[0].restoreAttempt).assertEqual(0);
        expect(io.writes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVETWO_0300
     * @tc.name testShortcutBatchWaveTwo0003
     * @tc.desc 补偿写超时尚在途时不能重放且完成后可通过核对确认原态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutBatchWaveTwo0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const api: RestoreHeldPort = new RestoreHeldPort();
        scope.cleanup((): void => { api.restoreGate.resolve(undefined); });
        const io: WaveTwoJournalPort = new WaveTwoJournalPort();
        const service: ShortcutService = createWaveTwoService(scope, api, io, 5);
        await readyWaveTwoService(scope, service);
        await service.previewBatch(['a'], false);
        await service.executeBatchPreview(currentPreview(service).token);
        await service.previewBatchRestore('batch-1');
        await service.executeBatchPreview(currentPreview(service).token);
        expect(currentBatch(service).items[0].restoreResult).assertEqual('unknown');
        await service.reconcileBatch('batch-1');
        expect(currentBatch(service).items[0].result).assertEqual('unknown');
        await service.previewBatchRestore('batch-1');
        expect(currentPreview(service).items[0].eligible).assertFalse();
        await service.executeBatchPreview(currentPreview(service).token, true);
        expect(api.writes.length).assertEqual(1);
        api.restoreGate.resolve(undefined);
        await waveSettle();
        await service.reconcileBatch('batch-1');
        expect(currentBatch(service).items[0].restoreResult).assertEqual('confirmed');
        expect(currentBatch(service).items[0].restoreAttempt).assertEqual(1);
        expect(api.writes.join(',')).assertEqual('a:false,a:true');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVETWO_0400
     * @tc.name testShortcutBatchWaveTwo0004
     * @tc.desc 批次文档结构或标识重复不能部分载入或自动覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutBatchWaveTwo0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const duplicateBatch: BatchJournal = waveJournal();
        duplicateBatch.batches.push(copyBatch(duplicateBatch.batches[0]));
        const duplicateItem: BatchJournal = waveJournal();
        duplicateItem.batches[0].items.push(duplicateItem.batches[0].items[0]);
        const invalid: string[] = ['{"version":1,"sequence":0,"batches":null}',
          JSON.stringify(duplicateBatch), JSON.stringify(duplicateItem)];
        for (const raw of invalid) {
          const io: WaveTwoJournalPort = new WaveTwoJournalPort();
          io.value = raw;
          const api: WaveShortcutPort = new WaveShortcutPort();
          const service: ShortcutService = createWaveTwoService(scope, api, io);
          await readyWaveTwoService(scope, service);
          expect(service.snapshot().batchReady).assertFalse();
          expect(service.snapshot().batches.length).assertEqual(0);
          expect(io.value).assertEqual(raw);
          expect(io.writes.length).assertEqual(0);
          expect(api.writes.length).assertEqual(0);
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVETWO_0500
     * @tc.name testShortcutBatchWaveTwo0005
     * @tc.desc 超过一百次或零尝试却记结果的存档不会获得执行能力
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutBatchWaveTwo0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        for (let mode: number = 0; mode < 4; mode++) {
          const journal: BatchJournal = waveJournal();
          if (mode === 0) { journal.batches[0].items[0].attempt = 101; }
          if (mode === 1) { journal.batches[0].items[0].attempt = 0; }
          if (mode === 2) { journal.batches[0].items[0].restoreAttempt = 101; }
          if (mode === 3) { journal.batches[0].items[0].restoreResult = 'failed'; }
          const io: WaveTwoJournalPort = new WaveTwoJournalPort();
          io.value = JSON.stringify(journal);
          const raw: string = io.value;
          const api: WaveShortcutPort = new WaveShortcutPort();
          const service: ShortcutService = createWaveTwoService(scope, api, io);
          await readyWaveTwoService(scope, service);
          await service.previewBatchRetry('batch-1');
          expect(service.snapshot().batchReady).assertFalse();
          expect(service.snapshot().batchPreview).assertUndefined();
          expect(io.value).assertEqual(raw);
          expect(io.writes.length).assertEqual(0);
          expect(api.writes.length).assertEqual(0);
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVETWO_0600
     * @tc.name testShortcutBatchWaveTwo0006
     * @tc.desc 原始可见性未知却存在补偿尝试的存档拒绝读取且可修正重读
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutBatchWaveTwo0006', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const journal: BatchJournal = waveJournal();
        journal.batches[0].items[0].originalKnown = false;
        journal.batches[0].items[0].restoreAttempt = 1;
        journal.batches[0].items[0].restoreResult = 'unknown';
        const io: WaveTwoJournalPort = new WaveTwoJournalPort();
        io.value = JSON.stringify(journal);
        const api: WaveShortcutPort = new WaveShortcutPort();
        const service: ShortcutService = createWaveTwoService(scope, api, io);
        await readyWaveTwoService(scope, service);
        expect(service.snapshot().batchReady).assertFalse();
        expect(service.snapshot().batchError).assertEqual('批次存档读取失败；不会覆盖或重放，请重试读取');
        expect(io.writes.length).assertEqual(0);
        journal.batches[0].items[0].restoreAttempt = 0;
        journal.batches[0].items[0].restoreResult = 'not-run';
        io.value = JSON.stringify(journal);
        await service.loadBatches();
        expect(service.snapshot().batchReady).assertTrue();
        expect(currentBatch(service).items[0].originalKnown).assertFalse();
        expect(api.writes.length).assertEqual(0);
      });
    });
  });
}
