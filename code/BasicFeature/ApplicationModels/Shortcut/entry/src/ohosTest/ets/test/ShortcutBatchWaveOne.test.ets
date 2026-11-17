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

import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { BatchJournal } from '../../../main/ets/services/VisibilityBatch';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { Deferred, shortcutInfo } from '../support/ShortcutFixture';
import { WaveBatchHarness, waveJournal, waveSettle } from '../support/ShortcutWaveFixture';

export default function shortcutBatchWaveOneTests(): void {
  describe('ShortcutBatchWaveOne', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0100
     * @tc.name testShortcutBatchWaveOne0001
     * @tc.desc 非法批量选择在读取和存档前拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0001'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        const excess: string[] = [];
        for (let i: number = 0; i < 21; i++) { excess.push(`entry-${i}`); }
        await h.service.previewBatch([], false);
        await h.service.previewBatch(['a', 'a'], false);
        await h.service.previewBatch(excess, true);
        expect(h.api.queries, caseName('ShortcutBatchWaveOne', '0001'), 'ShortcutBatchWaveOne.test.ets:A0001').assertEqual(1);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0001'), 'ShortcutBatchWaveOne.test.ets:A0002').assertEqual(0);
        expect(h.service.snapshot().batchPreview, caseName('ShortcutBatchWaveOne', '0001'), 'ShortcutBatchWaveOne.test.ets:A0003').assertUndefined();
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0001'), 'ShortcutBatchWaveOne.test.ets:A0004').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0200
     * @tc.name testShortcutBatchWaveOne0002
     * @tc.desc 预览重新查询发现选择入口消失时不保存半份计划
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0002'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        await h.service.previewBatch(['a', 'removed'], false);
        expect(h.service.snapshot().batchMessage, caseName('ShortcutBatchWaveOne', '0002'), 'ShortcutBatchWaveOne.test.ets:A0005').assertEqual('所选入口已变化，请重新选择');
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0002'), 'ShortcutBatchWaveOne.test.ets:A0006').assertEqual(0);
        expect(h.service.snapshot().batches.length, caseName('ShortcutBatchWaveOne', '0002'), 'ShortcutBatchWaveOne.test.ets:A0007').assertEqual(0);
        expect(h.service.snapshot().batchPreview, caseName('ShortcutBatchWaveOne', '0002'), 'ShortcutBatchWaveOne.test.ets:A0008').assertUndefined();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0300
     * @tc.name testShortcutBatchWaveOne0003
     * @tc.desc 批次编号到安全整数上限时不产生重复编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0003'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const journal: BatchJournal = waveJournal();
        journal.sequence = Number.MAX_SAFE_INTEGER;
        h.io.value = JSON.stringify(journal);
        const original: string = h.io.value;
        await h.start();
        await h.service.previewBatch(['b'], true);
        expect(h.service.snapshot().batchMessage, caseName('ShortcutBatchWaveOne', '0003'), 'ShortcutBatchWaveOne.test.ets:A0009').assertEqual('批次编号已达上限，未执行');
        expect(h.io.value, caseName('ShortcutBatchWaveOne', '0003'), 'ShortcutBatchWaveOne.test.ets:A0010').assertEqual(original);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0003'), 'ShortcutBatchWaveOne.test.ets:A0011').assertEqual(0);
        expect(h.plan().batchId, caseName('ShortcutBatchWaveOne', '0003'), 'ShortcutBatchWaveOne.test.ets:A0012').assertEqual('batch-1');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0400
     * @tc.name testShortcutBatchWaveOne0004
     * @tc.desc 首次预览存档失败关闭执行能力且不触发系统修改
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0004'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        h.io.failWrite = true;
        await h.service.previewBatch(['a'], false);
        expect(h.service.snapshot().batchReady, caseName('ShortcutBatchWaveOne', '0004'), 'ShortcutBatchWaveOne.test.ets:A0013').assertFalse();
        expect(h.service.snapshot().batchError, caseName('ShortcutBatchWaveOne', '0004'), 'ShortcutBatchWaveOne.test.ets:A0014').assertEqual('批次存档写入失败，已停止；先重新读取/核对，禁止盲目重试');
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0004'), 'ShortcutBatchWaveOne.test.ets:A0015').assertEqual(0);
        expect(h.io.value, caseName('ShortcutBatchWaveOne', '0004'), 'ShortcutBatchWaveOne.test.ets:A0016').assertEqual('');
        expect(h.service.snapshot().batchPreview, caseName('ShortcutBatchWaveOne', '0004'), 'ShortcutBatchWaveOne.test.ets:A0017').assertUndefined();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0500
     * @tc.name testShortcutBatchWaveOne0005
     * @tc.desc 取消预览撤销会话令牌但保留未执行历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0005'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        await h.service.previewBatch(['a'], false);
        const token: number = h.preview().token;
        h.service.cancelBatchPreview();
        await h.service.executeBatchPreview(token);
        expect(h.service.snapshot().batchPreview, caseName('ShortcutBatchWaveOne', '0005'), 'ShortcutBatchWaveOne.test.ets:A0018').assertUndefined();
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0005'), 'ShortcutBatchWaveOne.test.ets:A0019').assertEqual(0);
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0005'), 'ShortcutBatchWaveOne.test.ets:A0020').assertEqual('not-run');
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0005'), 'ShortcutBatchWaveOne.test.ets:A0021').assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0600
     * @tc.name testShortcutBatchWaveOne0006
     * @tc.desc 新预览替换旧令牌且只执行新选择的目标
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0006'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        await h.service.previewBatch(['a'], false);
        const oldToken: number = h.preview().token;
        await h.service.previewBatch(['b'], true);
        await h.service.executeBatchPreview(oldToken);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0006'), 'ShortcutBatchWaveOne.test.ets:A0022').assertEqual(0);
        expect(h.preview().items[0].id, caseName('ShortcutBatchWaveOne', '0006'), 'ShortcutBatchWaveOne.test.ets:A0023').assertEqual('b');
        await h.service.executeBatchPreview(h.preview().token);
        expect(h.api.writes.join(','), caseName('ShortcutBatchWaveOne', '0006'), 'ShortcutBatchWaveOne.test.ets:A0024').assertEqual('b:true');
        expect(h.service.snapshot().batches[1].items[0].result, caseName('ShortcutBatchWaveOne', '0006'), 'ShortcutBatchWaveOne.test.ets:A0025').assertEqual('not-run');
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0006'), 'ShortcutBatchWaveOne.test.ets:A0026').assertEqual('confirmed');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0700
     * @tc.name testShortcutBatchWaveOne0007
     * @tc.desc 预览新查询失败不改写已有批次历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0007'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        h.io.value = JSON.stringify(waveJournal());
        await h.start();
        h.api.failQuery = true;
        await h.service.previewBatch(['b'], true);
        expect(h.service.snapshot().queryError, caseName('ShortcutBatchWaveOne', '0007'), 'ShortcutBatchWaveOne.test.ets:A0027').assertEqual('code=350001；query unavailable');
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0007'), 'ShortcutBatchWaveOne.test.ets:A0028').assertEqual('failed');
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0007'), 'ShortcutBatchWaveOne.test.ets:A0029').assertEqual(0);
        expect(h.service.snapshot().batchPreview, caseName('ShortcutBatchWaveOne', '0007'), 'ShortcutBatchWaveOne.test.ets:A0030').assertUndefined();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0800
     * @tc.name testShortcutBatchWaveOne0008
     * @tc.desc 批次读取失败可显式重读恢复而不自动重放系统设置
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0008'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        h.io.value = JSON.stringify(waveJournal());
        h.io.failRead = true;
        await h.start();
        expect(h.service.snapshot().batchReady, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0031').assertFalse();
        expect(h.service.snapshot().batchError, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0032').assertEqual('批次存档读取失败；不会覆盖或重放，请重试读取');
        h.io.failRead = false;
        await h.service.loadBatches();
        expect(h.service.snapshot().batchReady, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0033').assertTrue();
        expect(h.service.snapshot().batchError, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0034').assertEqual('');
        expect(h.plan().interrupted, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0035').assertTrue();
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0036').assertEqual(0);
        expect(h.io.reads, caseName('ShortcutBatchWaveOne', '0008'), 'ShortcutBatchWaveOne.test.ets:A0037').assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_0900
     * @tc.name testShortcutBatchWaveOne0009
     * @tc.desc 旧会话批次读取迟到不覆盖重新初始化后的存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0009'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const oldRead: Deferred<string> = new Deferred<string>();
        h.io.readGate = oldRead;
        h.service.initialize(getTestContext());
        await waveSettle();
        h.service.dispose();
        h.io.readGate = undefined;
        const current: BatchJournal = waveJournal();
        current.batches[0].items[0].id = 'b';
        h.io.value = JSON.stringify(current);
        await h.start();
        oldRead.resolve(JSON.stringify(waveJournal()));
        await waveSettle();
        expect(h.plan().items[0].id, caseName('ShortcutBatchWaveOne', '0009'), 'ShortcutBatchWaveOne.test.ets:A0038').assertEqual('b');
        expect(h.service.snapshot().batchReady, caseName('ShortcutBatchWaveOne', '0009'), 'ShortcutBatchWaveOne.test.ets:A0039').assertTrue();
        expect(h.io.reads, caseName('ShortcutBatchWaveOne', '0009'), 'ShortcutBatchWaveOne.test.ets:A0040').assertEqual(2);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0009'), 'ShortcutBatchWaveOne.test.ets:A0041').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1000
     * @tc.name testShortcutBatchWaveOne0010
     * @tc.desc 确认前核对失败消费令牌但不增加尝试次数
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0010'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        await h.service.previewBatch(['a'], false);
        h.api.failQuery = true;
        await h.service.executeBatchPreview(h.preview().token);
        expect(h.plan().items[0].attempt, caseName('ShortcutBatchWaveOne', '0010'), 'ShortcutBatchWaveOne.test.ets:A0042').assertEqual(0);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0010'), 'ShortcutBatchWaveOne.test.ets:A0043').assertEqual(0);
        expect(h.service.snapshot().batchPreview, caseName('ShortcutBatchWaveOne', '0010'), 'ShortcutBatchWaveOne.test.ets:A0044').assertUndefined();
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0010'), 'ShortcutBatchWaveOne.test.ets:A0045').assertEqual(1);
        expect(h.service.snapshot().queryError, caseName('ShortcutBatchWaveOne', '0010'), 'ShortcutBatchWaveOne.test.ets:A0046').assertEqual('code=350001；query unavailable');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1100
     * @tc.name testShortcutBatchWaveOne0011
     * @tc.desc 确认后入口被删除时拒绝使用旧列表执行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0011'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        await h.service.previewBatch(['a'], false);
        h.api.infos = [shortcutInfo('b', false)];
        await h.service.executeBatchPreview(h.preview().token);
        expect(h.service.snapshot().batchMessage, caseName('ShortcutBatchWaveOne', '0011'), 'ShortcutBatchWaveOne.test.ets:A0047').assertEqual('确认后状态变化，未执行；请重新预览');
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0011'), 'ShortcutBatchWaveOne.test.ets:A0048').assertEqual(0);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0011'), 'ShortcutBatchWaveOne.test.ets:A0049').assertEqual(1);
        expect(h.plan().items[0].attempt, caseName('ShortcutBatchWaveOne', '0011'), 'ShortcutBatchWaveOne.test.ets:A0050').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1200
     * @tc.name testShortcutBatchWaveOne0012
     * @tc.desc 失败项已被外部改到目标时重试预览只核对不重写
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0012'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        h.io.value = JSON.stringify(waveJournal());
        h.api.infos = [shortcutInfo('a', false)];
        await h.start();
        await h.service.previewBatchRetry('batch-1');
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0012'), 'ShortcutBatchWaveOne.test.ets:A0051').assertEqual('confirmed');
        expect(h.preview().items.length, caseName('ShortcutBatchWaveOne', '0012'), 'ShortcutBatchWaveOne.test.ets:A0052').assertEqual(0);
        expect(h.plan().items[0].attempt, caseName('ShortcutBatchWaveOne', '0012'), 'ShortcutBatchWaveOne.test.ets:A0053').assertEqual(1);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0012'), 'ShortcutBatchWaveOne.test.ets:A0054').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1300
     * @tc.name testShortcutBatchWaveOne0013
     * @tc.desc 重试预览入口缺失时降为未知而不是盲目重放
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0013'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0013'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        h.io.value = JSON.stringify(waveJournal());
        h.api.infos = [];
        await h.start();
        await h.service.previewBatchRetry('batch-1');
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0013'), 'ShortcutBatchWaveOne.test.ets:A0055').assertEqual('unknown');
        expect(h.preview().items.length, caseName('ShortcutBatchWaveOne', '0013'), 'ShortcutBatchWaveOne.test.ets:A0056').assertEqual(0);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0013'), 'ShortcutBatchWaveOne.test.ets:A0057').assertEqual(0);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0013'), 'ShortcutBatchWaveOne.test.ets:A0058').assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1400
     * @tc.name testShortcutBatchWaveOne0014
     * @tc.desc 已保存但从未执行的计划不能发起补偿写入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0014'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0014'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        await h.start();
        await h.service.previewBatch(['a'], false);
        await h.service.previewBatchRestore(h.plan().batchId);
        expect(h.preview().items[0].reason, caseName('ShortcutBatchWaveOne', '0014'), 'ShortcutBatchWaveOne.test.ets:A0059').assertEqual('原批次未执行，不补偿');
        expect(h.preview().items[0].eligible, caseName('ShortcutBatchWaveOne', '0014'), 'ShortcutBatchWaveOne.test.ets:A0060').assertFalse();
        await h.service.executeBatchPreview(h.preview().token, true);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0014'), 'ShortcutBatchWaveOne.test.ets:A0061').assertEqual(0);
        expect(h.plan().items[0].restoreAttempt, caseName('ShortcutBatchWaveOne', '0014'), 'ShortcutBatchWaveOne.test.ets:A0062').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1500
     * @tc.name testShortcutBatchWaveOne0015
     * @tc.desc 当前可见性未知时即使原态已知也不执行补偿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0015'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0015'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        h.io.value = JSON.stringify(waveJournal());
        h.api.infos = [shortcutInfo('a')];
        await h.start();
        await h.service.previewBatchRestore('batch-1');
        expect(h.preview().items[0].reason, caseName('ShortcutBatchWaveOne', '0015'), 'ShortcutBatchWaveOne.test.ets:A0063').assertEqual('当前visible未知，先核对，不重放');
        expect(h.preview().items[0].target, caseName('ShortcutBatchWaveOne', '0015'), 'ShortcutBatchWaveOne.test.ets:A0064').assertTrue();
        await h.service.executeBatchPreview(h.preview().token, true);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0015'), 'ShortcutBatchWaveOne.test.ets:A0065').assertEqual(0);
        expect(h.plan().items[0].restoreAttempt, caseName('ShortcutBatchWaveOne', '0015'), 'ShortcutBatchWaveOne.test.ets:A0066').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1600
     * @tc.name testShortcutBatchWaveOne0016
     * @tc.desc 重试已达一百次时不会增加尝试或写入系统
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0016'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0016'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const journal: BatchJournal = waveJournal();
        journal.batches[0].items[0].attempt = 100;
        h.io.value = JSON.stringify(journal);
        await h.start();
        await h.service.previewBatchRetry('batch-1');
        const writes: number = h.io.writes.length;
        await h.service.executeBatchPreview(h.preview().token);
        expect(h.plan().items[0].attempt, caseName('ShortcutBatchWaveOne', '0016'), 'ShortcutBatchWaveOne.test.ets:A0067').assertEqual(100);
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0016'), 'ShortcutBatchWaveOne.test.ets:A0068').assertEqual(0);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0016'), 'ShortcutBatchWaveOne.test.ets:A0069').assertEqual(writes);
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0016'), 'ShortcutBatchWaveOne.test.ets:A0070').assertEqual('failed');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1700
     * @tc.name testShortcutBatchWaveOne0017
     * @tc.desc 补偿已达一百次时不会突破存档允许的次数上限
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0017'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0017'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const journal: BatchJournal = waveJournal();
        journal.batches[0].items[0].restoreAttempt = 100;
        journal.batches[0].items[0].restoreResult = 'failed';
        h.io.value = JSON.stringify(journal);
        h.api.infos = [shortcutInfo('a', false)];
        await h.start();
        await h.service.previewBatchRestore('batch-1');
        await h.service.executeBatchPreview(h.preview().token);
        expect(h.plan().items[0].restoreAttempt, caseName('ShortcutBatchWaveOne', '0017'), 'ShortcutBatchWaveOne.test.ets:A0071').assertEqual(100);
        expect(h.plan().items[0].restoreResult, caseName('ShortcutBatchWaveOne', '0017'), 'ShortcutBatchWaveOne.test.ets:A0072').assertEqual('failed');
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0017'), 'ShortcutBatchWaveOne.test.ets:A0073').assertEqual(0);
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0017'), 'ShortcutBatchWaveOne.test.ets:A0074').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1800
     * @tc.name testShortcutBatchWaveOne0018
     * @tc.desc 核对时入口消失同时使正向和补偿的旧结果失去确认
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0018'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0018'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const journal: BatchJournal = waveJournal();
        journal.batches[0].items[0].result = 'confirmed';
        journal.batches[0].items[0].restoreAttempt = 1;
        journal.batches[0].items[0].restoreResult = 'confirmed';
        h.io.value = JSON.stringify(journal);
        h.api.infos = [];
        await h.start();
        await h.service.reconcileBatch('batch-1');
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0018'), 'ShortcutBatchWaveOne.test.ets:A0075').assertEqual('unknown');
        expect(h.plan().items[0].restoreResult, caseName('ShortcutBatchWaveOne', '0018'), 'ShortcutBatchWaveOne.test.ets:A0076').assertEqual('unknown');
        expect(h.plan().interrupted, caseName('ShortcutBatchWaveOne', '0018'), 'ShortcutBatchWaveOne.test.ets:A0077').assertFalse();
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0018'), 'ShortcutBatchWaveOne.test.ets:A0078').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_1900
     * @tc.name testShortcutBatchWaveOne0019
     * @tc.desc 补偿失败后的核对识别外部恢复原态而不重写
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0019'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0019'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const journal: BatchJournal = waveJournal();
        journal.batches[0].items[0].result = 'confirmed';
        journal.batches[0].items[0].restoreAttempt = 1;
        journal.batches[0].items[0].restoreResult = 'failed';
        h.io.value = JSON.stringify(journal);
        await h.start();
        await h.service.reconcileBatch('batch-1');
        expect(h.plan().items[0].restoreResult, caseName('ShortcutBatchWaveOne', '0019'), 'ShortcutBatchWaveOne.test.ets:A0079').assertEqual('confirmed');
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0019'), 'ShortcutBatchWaveOne.test.ets:A0080').assertEqual('confirmed');
        expect(h.plan().items[0].lastVisible, caseName('ShortcutBatchWaveOne', '0019'), 'ShortcutBatchWaveOne.test.ets:A0081').assertFalse();
        expect(h.api.writes.length, caseName('ShortcutBatchWaveOne', '0019'), 'ShortcutBatchWaveOne.test.ets:A0082').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BATCHWAVEONE_2000
     * @tc.name testShortcutBatchWaveOne0020
     * @tc.desc 系统设置调用之前未知标记已持久化完成
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutBatchWaveOne', '0020'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutBatchWaveOne', '0020'), async (scope: CaseScope): Promise<void> => {
        const h: WaveBatchHarness = new WaveBatchHarness(scope);
        const atSdk: BatchJournal[] = [];
        h.api.onWrite = (): void => { atSdk.push(JSON.parse(h.io.value) as BatchJournal); };
        await h.start();
        await h.service.previewBatch(['a'], false);
        await h.service.executeBatchPreview(h.preview().token);
        expect(atSdk[0].batches[0].items[0].result, caseName('ShortcutBatchWaveOne', '0020'), 'ShortcutBatchWaveOne.test.ets:A0083').assertEqual('unknown');
        expect(atSdk[0].batches[0].items[0].attempt, caseName('ShortcutBatchWaveOne', '0020'), 'ShortcutBatchWaveOne.test.ets:A0084').assertEqual(1);
        expect(atSdk[0].batches[0].interrupted, caseName('ShortcutBatchWaveOne', '0020'), 'ShortcutBatchWaveOne.test.ets:A0085').assertTrue();
        expect(h.plan().interrupted, caseName('ShortcutBatchWaveOne', '0020'), 'ShortcutBatchWaveOne.test.ets:A0086').assertFalse();
        expect(h.plan().items[0].result, caseName('ShortcutBatchWaveOne', '0020'), 'ShortcutBatchWaveOne.test.ets:A0087').assertEqual('confirmed');
        expect(h.io.writes.length, caseName('ShortcutBatchWaveOne', '0020'), 'ShortcutBatchWaveOne.test.ets:A0088').assertEqual(3);
      });
    });
  });
}
