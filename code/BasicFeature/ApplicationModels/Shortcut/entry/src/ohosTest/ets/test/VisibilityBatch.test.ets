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

import { shortcutManager } from '@kit.AbilityKit';
import { describe, expect, it } from '@ohos/hypium';
import { ShortcutApi } from '../../../main/ets/services/ShortcutApi';
import { ShortcutService } from '../../../main/ets/services/ShortcutService';
import { BatchSpan, BatchTelemetry } from '../../../main/ets/services/BatchTelemetry';
import { BatchPlan, BatchPreview, decodeJournal } from '../../../main/ets/services/VisibilityBatch';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { Deferred, FixtureError, MemoryBatchStorage, shortcutInfo } from '../support/ShortcutFixture';

class BatchApi implements ShortcutApi {
  public infos: shortcutManager.ShortcutInfo[] = [shortcutInfo('a', true), shortcutInfo('b', false)];
  public calls: string[] = [];
  public queryCount: number = 0;
  public rejectBefore: number[] = [];
  public rejectAfter: number[] = [];
  public terminalAt: number[] = [];
  public omitAt: number[] = [];
  public failQueryAt: number[] = [];
  public delayedQueryAt: number = -1;
  public queryGate: Deferred<shortcutManager.ShortcutInfo[]> =
    new Deferred<shortcutManager.ShortcutInfo[]>();
  public writeGate: Deferred<void> | undefined = undefined;
  isShortcutSupported(): boolean { return true; }
  async getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]> {
    this.queryCount++;
    if (this.delayedQueryAt === this.queryCount) { return this.queryGate.promise; }
    if (this.failQueryAt.includes(this.queryCount)) { throw new FixtureError(350001, 'controlled read failure'); }
    return this.infos.map((info: shortcutManager.ShortcutInfo) => shortcutInfo(info.id,
      this.omitAt.includes(this.queryCount) ? undefined : info.visible));
  }
  async setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    this.calls.push(`${id}:${visible}`);
    const index: number = this.calls.length;
    if (this.writeGate !== undefined) { await this.writeGate.promise; }
    if (this.terminalAt.includes(index)) { throw new FixtureError(201, 'controlled permission'); }
    if (this.rejectBefore.includes(index)) { throw new FixtureError(350001, 'controlled write rejection'); }
    const item: shortcutManager.ShortcutInfo | undefined = this.infos.find(
      (entry: shortcutManager.ShortcutInfo) => entry.id === id);
    if (item === undefined) { throw new FixtureError(17700070, 'missing id'); }
    item.visible = visible;
    if (this.rejectAfter.includes(index)) { throw new FixtureError(350001, 'rejected after effect'); }
  }
}

class ControlledTelemetry implements BatchTelemetry {
  public begins: number = 0;
  public finishes: number = 0;
  public failBegin: boolean = false;
  public failFinish: boolean = false;
  begin(stage: string): BatchSpan {
    this.begins++;
    if (this.failBegin) { throw new Error('controlled trace begin'); }
    const span: BatchSpan = new BatchSpan();
    span.stage = stage;
    return span;
  }
  finish(_span: BatchSpan): void {
    this.finishes++;
    if (this.failFinish) { throw new Error('controlled event finish'); }
  }
}

async function start(scope: CaseScope, api: BatchApi = new BatchApi(),
  storage: MemoryBatchStorage = new MemoryBatchStorage(), timeoutMs: number = 5000,
  telemetry: ControlledTelemetry = new ControlledTelemetry()): Promise<ShortcutService> {
  const service: ShortcutService = new ShortcutService(api, storage, timeoutMs, telemetry);
  scope.cleanup(() => {
    service.dispose();
    api.writeGate?.resolve(undefined);
    api.queryGate.resolve([]);
  });
  service.initialize(getTestContext());
  await scope.until(() => !service.snapshot().busy && !service.snapshot().batchLoading,
    (changed: () => void) => {
      const token: number = service.subscribe(changed);
      return () => service.unsubscribe(token);
    });
  return service;
}
function preview(service: ShortcutService): BatchPreview {
  const result: BatchPreview | undefined = service.snapshot().batchPreview;
  if (result === undefined) { throw new Error('expected real production preview'); }
  return result;
}
function batch(service: ShortcutService): BatchPlan {
  const plans: BatchPlan[] = service.snapshot().batches;
  if (plans.length === 0) { throw new Error('expected persisted batch'); }
  return plans[0];
}
async function apply(service: ShortcutService, ids: string[], target: boolean): Promise<void> {
  await service.previewBatch(ids, target);
  await service.executeBatchPreview(preview(service).token);
}

export default function visibilityBatchTests(): void {
  describe('VisibilityBatchProductionService', () => {
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0100
     * @tc.name      testVisibilityBatchProductionService0001
     * @tc.desc      Verify preview has no sdk writes and confirmation token is single use
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        const service = await start(scope, api);
        await service.previewBatch(['a', 'b'], false);
        const plan: BatchPlan = batch(service);
        expect(plan.items[0].originalVisible).assertTrue();
        expect(plan.items[1].originalVisible).assertFalse();
        expect(api.calls.length).assertEqual(0);
        const token: number = preview(service).token;
        await service.executeBatchPreview(token);
        expect(api.calls.join(',')).assertEqual('a:false,b:false');
        expect(batch(service).items.every((item) => item.result === 'confirmed')).assertTrue();
        await service.executeBatchPreview(token);
        expect(api.calls.length).assertEqual(2);
        plan.items[0].originalVisible = false;
        expect(batch(service).items[0].originalVisible).assertTrue();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0200
     * @tc.name      testVisibilityBatchProductionService0002
     * @tc.desc      Verify rejected write that already applied is confirmed by readback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.rejectAfter = [1];
        const service = await start(scope, api);
        await apply(service, ['a'], false);
        expect(batch(service).items[0].result).assertEqual('confirmed');
        await service.previewBatchRetry(batch(service).batchId);
        expect(preview(service).items.length).assertEqual(0);
        expect(api.calls.length).assertEqual(1);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0300
     * @tc.name      testVisibilityBatchProductionService0003
     * @tc.desc      Verify second item failure retries only failed item
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.infos[1].visible = true;
        api.rejectBefore = [2];
        const service = await start(scope, api);
        await apply(service, ['a', 'b'], false);
        expect(batch(service).items[0].result).assertEqual('confirmed');
        expect(batch(service).items[1].result).assertEqual('failed');
        await service.previewBatchRetry(batch(service).batchId);
        expect(preview(service).items.map((row) => row.id).join(',')).assertEqual('b');
        await service.executeBatchPreview(preview(service).token);
        expect(api.calls.join(',')).assertEqual('a:false,b:false,b:false');
        expect(batch(service).items[0].attempt).assertEqual(1);
        expect(batch(service).items[1].attempt).assertEqual(2);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0400
     * @tc.name      testVisibilityBatchProductionService0004
     * @tc.desc      Verify missing visible remains unknown until explicit reconcile
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.omitAt = [4];
        const service = await start(scope, api);
        await apply(service, ['a'], false);
        expect(batch(service).items[0].result).assertEqual('unknown');
        await service.previewBatchRetry(batch(service).batchId);
        expect(preview(service).items.length).assertEqual(0);
        await service.reconcileBatch(batch(service).batchId);
        expect(batch(service).items[0].result).assertEqual('confirmed');
        expect(api.calls.length).assertEqual(1);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0500
     * @tc.name      testVisibilityBatchProductionService0005
     * @tc.desc      Verify compensation restores mixed original state not all visible
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        const service = await start(scope, api);
        await apply(service, ['a', 'b'], true);
        await service.previewBatchRestore(batch(service).batchId);
        const restore: BatchPreview = preview(service);
        expect(restore.items[0].eligible).assertFalse();
        expect(restore.items[1].target).assertFalse();
        await service.executeBatchPreview(restore.token);
        expect(api.infos[0].visible).assertTrue();
        expect(api.infos[1].visible).assertFalse();
        expect(batch(service).items[1].restoreResult).assertEqual('confirmed');
        expect(api.calls.join(',')).assertEqual('a:true,b:true,b:false');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0600
     * @tc.name      testVisibilityBatchProductionService0006
     * @tc.desc      Verify failed compensation remains partial and can be previewed again
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        const service = await start(scope, api);
        await apply(service, ['a'], false);
        api.rejectBefore = [2];
        await service.previewBatchRestore(batch(service).batchId);
        await service.executeBatchPreview(preview(service).token);
        expect(batch(service).items[0].result).assertEqual('confirmed');
        expect(batch(service).items[0].restoreResult).assertEqual('failed');
        await service.previewBatchRestore(batch(service).batchId);
        await service.executeBatchPreview(preview(service).token);
        expect(batch(service).items[0].restoreResult).assertEqual('confirmed');
        expect(api.calls.join(',')).assertEqual('a:false,a:true,a:true');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0700
     * @tc.name      testVisibilityBatchProductionService0007
     * @tc.desc      Verify unknown original never compensates to assumed default
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0007', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.omitAt = [2, 3];
        const service = await start(scope, api);
        await apply(service, ['a'], false);
        expect(batch(service).items[0].originalKnown).assertFalse();
        await service.previewBatchRestore(batch(service).batchId);
        expect(preview(service).items[0].eligible).assertFalse();
        await service.executeBatchPreview(preview(service).token, true);
        expect(api.calls.length).assertEqual(1);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0800
     * @tc.name      testVisibilityBatchProductionService0008
     * @tc.desc      Verify external change requires choice and post confirm change invalidates preview
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0008', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.omitAt = [4];
        const service = await start(scope, api);
        await apply(service, ['a'], false);
        await service.previewBatchRestore(batch(service).batchId);
        expect(preview(service).items[0].externalChange).assertTrue();
        await service.executeBatchPreview(preview(service).token, false);
        expect(api.calls.length).assertEqual(1);
        await service.previewBatchRestore(batch(service).batchId);
        await service.executeBatchPreview(preview(service).token, true);
        expect(api.calls.length).assertEqual(2);
        await service.previewBatch(['a'], false);
        api.infos[0].visible = false;
        await service.executeBatchPreview(preview(service).token);
        expect(api.calls.length).assertEqual(2);
        expect(service.snapshot().batchMessage.includes('状态变化')).assertTrue();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0900
     * @tc.name      testVisibilityBatchProductionService0009
     * @tc.desc      Verify reopen never replays and sequence cannot reuse stored id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0009', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        const storage: MemoryBatchStorage = new MemoryBatchStorage();
        const service = await start(scope, api, storage);
        await apply(service, ['a'], false);
        const id: string = batch(service).batchId;
        service.dispose();
        const reopened = await start(scope, api, storage);
        expect(reopened.snapshot().batchPreview).assertUndefined();
        expect(batch(reopened).interrupted).assertTrue();
        await reopened.executeBatchPreview(1);
        expect(api.calls.length).assertEqual(1);
        await reopened.previewBatch(['b'], true);
        expect(batch(reopened).batchId === id).assertFalse();
        let rejected: boolean = false;
        try { decodeJournal(storage.value.replace('"sequence":2', '"sequence":0')); } catch (_) { rejected = true; }
        expect(rejected).assertTrue();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1000
     * @tc.name      testVisibilityBatchProductionService0010
     * @tc.desc      Verify storage failure stops before sdk or leaves durable unknown marker
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0010', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        for (const failAt of [2, 3]) {
          const api: BatchApi = new BatchApi();
          const storage: MemoryBatchStorage = new MemoryBatchStorage();
          storage.failAtWrite = failAt;
          const service = await start(scope, api, storage);
          await apply(service, ['a'], false);
          expect(api.calls.length).assertEqual(failAt === 2 ? 0 : 1);
          expect(service.snapshot().batchReady).assertFalse();
          expect(service.snapshot().batchError.length > 0).assertTrue();
          service.dispose();
          const reopened = await start(scope, api, storage);
          expect(batch(reopened).items[0].result).assertEqual(failAt === 2 ? 'not-run' : 'unknown');
          expect(reopened.snapshot().batchPreview).assertUndefined();
        }
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1100
     * @tc.name      testVisibilityBatchProductionService0011
     * @tc.desc      Verify old generation write cannot commit results into reopened service
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0011', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        const storage: MemoryBatchStorage = new MemoryBatchStorage();
        const service = await start(scope, api, storage);
        await service.previewBatch(['a'], false);
        api.writeGate = new Deferred<void>();
        const running: Promise<void> = service.executeBatchPreview(preview(service).token);
        for (let n = 0; n < 20; n++) { await Promise.resolve(); }
        expect(api.calls.length).assertEqual(1);
        service.dispose();
        const reopened = await start(scope, api, storage);
        const writes: number = storage.writes;
        api.writeGate.resolve(undefined);
        await running;
        expect(storage.writes).assertEqual(writes);
        expect(batch(reopened).items[0].result).assertEqual('unknown');
        expect(reopened.snapshot().busy).assertFalse();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1200
     * @tc.name      testVisibilityBatchProductionService0012
     * @tc.desc      Verify readback timeout is unknown and late result does not overwrite
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0012', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.delayedQueryAt = 4;
        const service = await start(scope, api, new MemoryBatchStorage(), 5);
        await apply(service, ['a'], false);
        expect(batch(service).items[0].result).assertEqual('unknown');
        api.queryGate.resolve([shortcutInfo('a', false)]);
        await Promise.resolve();
        expect(batch(service).items[0].result).assertEqual('unknown');
        await service.reconcileBatch(batch(service).batchId);
        expect(batch(service).items[0].result).assertEqual('confirmed');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1300
     * @tc.name      testVisibilityBatchProductionService0013
     * @tc.desc      Verify terminal permission failure cannot loop in failed retry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0013', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.terminalAt = [1];
        const service = await start(scope, api);
        await apply(service, ['a'], false);
        expect(batch(service).items[0].retryBlocked).assertTrue();
        expect(batch(service).items[0].result).assertEqual('failed');
        await service.previewBatchRetry(batch(service).batchId);
        expect(preview(service).items.length).assertEqual(0);
        expect(api.calls.length).assertEqual(1);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1400
     * @tc.name      testVisibilityBatchProductionService0014
     * @tc.desc      Verify corrupt journal preserved and history bounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0014', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBatchStorage = new MemoryBatchStorage();
        storage.value = '{bad';
        const broken = await start(scope, new BatchApi(), storage);
        await broken.previewBatch(['a'], false);
        expect(storage.value).assertEqual('{bad');
        expect(storage.writes).assertEqual(0);
        const service = await start(scope);
        for (let n = 0; n < 7; n++) { await service.previewBatch(['a'], n % 2 === 0); }
        expect(service.snapshot().batches.length).assertEqual(5);
        expect(batch(service).batchId).assertEqual('batch-7');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1500
     * @tc.name      testVisibilityBatchProductionService0015
     * @tc.desc      Verify write timeout never retries while original call is still in flight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0015', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const api: BatchApi = new BatchApi();
        api.writeGate = new Deferred<void>();
        const service = await start(scope, api, new MemoryBatchStorage(), 5);
        await apply(service, ['a'], false);
        expect(batch(service).items[0].result).assertEqual('unknown');
        await service.reconcileBatch(batch(service).batchId);
        expect(batch(service).items[0].result).assertEqual('unknown');
        await service.previewBatchRetry(batch(service).batchId);
        expect(preview(service).items.length).assertEqual(0);
        await service.setVisible('a', false);
        expect(api.calls.length).assertEqual(1);
        api.writeGate.resolve(undefined);
        for (let n = 0; n < 8; n++) { await Promise.resolve(); }
        await service.reconcileBatch(batch(service).batchId);
        expect(batch(service).items[0].result).assertEqual('confirmed');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1600
     * @tc.name      testVisibilityBatchProductionService0016
     * @tc.desc      Verify telemetry failure does not change business and successful begins are finished
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testVisibilityBatchProductionService0016', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        for (const failBegin of [false, true]) {
          const telemetry: ControlledTelemetry = new ControlledTelemetry();
          telemetry.failBegin = failBegin;
          telemetry.failFinish = true;
          const service = await start(scope, new BatchApi(), new MemoryBatchStorage(), 5000, telemetry);
          await apply(service, ['a'], false);
          expect(batch(service).items[0].result).assertEqual('confirmed');
          expect(telemetry.begins > 0).assertTrue();
          expect(telemetry.finishes).assertEqual(failBegin ? 0 : telemetry.begins);
        }
      });
    });
  });
}
