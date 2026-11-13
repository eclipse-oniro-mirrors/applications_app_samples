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
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { ShortcutService } from '../../../main/ets/services/ShortcutService';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness } from '../support/CoverageFixture';
import { Deferred } from '../support/ShortcutFixture';
import {
  waveTwoArchive, WaveTwoJournalPort, createWaveTwoService, readyWaveTwoService
} from '../support/ShortcutWaveTwoFixture';
import { WaveShortcutPort, waveJournal, waveSettle } from '../support/ShortcutWaveFixture';

/** Written after the execution freeze: all cases await the final unified gate. */
export default function shortcutResidualSafetyTests(): void {
  describe('ShortcutResidualSafety', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RESIDUALSAFETY_0100
     * @tc.name testShortcutResidualSafety0001
     * @tc.desc 选择已是当前内容的历史版本不隐式丢弃已保留编辑
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutResidualSafety', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutResidualSafety', '0001'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive().replace('"title":"早期标题","body":"早期正文"',
          '"title":"正式标题","body":"正式正文"');
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.beginEditNote('a');
        store.setDraftBody('用户已保留、未覆盖正式正文的编辑');
        await store.keepEditDraft();
        const before: string = io.value;
        const writes: number = io.writes;
        expect(await store.restoreRevision('a', 'ar'), caseName('ShortcutResidualSafety', '0001')).assertTrue();
        expect(store.snapshot().message, caseName('ShortcutResidualSafety', '0001')).assertEqual('已是该历史版本');
        expect(store.snapshot().draftBody, caseName('ShortcutResidualSafety', '0001')).assertEqual('用户已保留、未覆盖正式正文的编辑');
        expect(store.snapshot().editDraftPersisted, caseName('ShortcutResidualSafety', '0001')).assertTrue();
        expect(io.value, caseName('ShortcutResidualSafety', '0001')).assertEqual(before);
        expect(io.writes, caseName('ShortcutResidualSafety', '0001')).assertEqual(writes);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RESIDUALSAFETY_0200
     * @tc.name testShortcutResidualSafety0002
     * @tc.desc 清除旧持久编辑写前失败时保留缓冲和可重试原文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutResidualSafety', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutResidualSafety', '0002'), async (scope: CaseScope): Promise<void> => {
        for (const normalized of [false, true]) {
          const io: ControlledBusinessStorage = new ControlledBusinessStorage();
          io.value = waveTwoArchive();
          const clock: FixedBusinessClock = new FixedBusinessClock();
          const store: BusinessStore = await loadBusiness(scope, io, clock.now);
          store.beginEditNote('a');
          store.setDraftBody('先前保留的内容');
          await store.keepEditDraft();
          store.setDraftBody(normalized ? ' 正式正文 ' : '正式正文');
          const before: string = io.value;
          io.failWrite = true;
          const failed: boolean = normalized ? await store.saveNote() : await store.keepEditDraft();
          expect(failed, caseName('ShortcutResidualSafety', '0002')).assertFalse();
          expect(store.snapshot().editDraftPersisted, caseName('ShortcutResidualSafety', '0002')).assertTrue();
          expect(io.value, caseName('ShortcutResidualSafety', '0002')).assertEqual(before);
          expect(store.snapshot().draftBody, caseName('ShortcutResidualSafety', '0002')).assertEqual(normalized ? ' 正式正文 ' : '正式正文');
          io.failWrite = false;
          const retried: boolean = normalized ? await store.saveNote() : await store.keepEditDraft();
          expect(retried, caseName('ShortcutResidualSafety', '0002')).assertTrue();
          store.dispose();
          const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
          expect(reopened.snapshot().draftBody, caseName('ShortcutResidualSafety', '0002')).assertEqual('独立新正文');
          expect(reopened.snapshot().notes[0].body, caseName('ShortcutResidualSafety', '0002')).assertEqual('正式正文');
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RESIDUALSAFETY_0300
     * @tc.name testShortcutResidualSafety0003
     * @tc.desc 旧批次存档写失败后同实例重新初始化从旧盘面恢复而不重放
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutResidualSafety', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutResidualSafety', '0003'), async (scope: CaseScope): Promise<void> => {
        const io: WaveTwoJournalPort = new WaveTwoJournalPort();
        io.value = JSON.stringify(waveJournal());
        const original: string = io.value;
        const api: WaveShortcutPort = new WaveShortcutPort();
        const service: ShortcutService = createWaveTwoService(scope, api, io);
        await readyWaveTwoService(scope, service);
        io.holdAt = 1;
        io.writeGate = new Deferred<void>();
        io.failWrite = true;
        const writing: Promise<void> = service.previewBatch(['b'], true);
        await waveSettle();
        service.dispose();
        service.initialize(getTestContext());
        expect(io.reads, caseName('ShortcutResidualSafety', '0003')).assertEqual(1);
        io.writeGate.resolve(undefined);
        await writing;
        await readyWaveTwoService(scope, service);
        expect(service.snapshot().batchReady, caseName('ShortcutResidualSafety', '0003')).assertTrue();
        expect(service.snapshot().batches[0].batchId, caseName('ShortcutResidualSafety', '0003')).assertEqual('batch-1');
        expect(io.value, caseName('ShortcutResidualSafety', '0003')).assertEqual(original);
        expect(api.writes.length, caseName('ShortcutResidualSafety', '0003')).assertEqual(0);
        io.failWrite = false;
        await service.previewBatch(['b'], true);
        expect(service.snapshot().batches[0].batchId, caseName('ShortcutResidualSafety', '0003')).assertEqual('batch-2');
      });
    });
  });
}
