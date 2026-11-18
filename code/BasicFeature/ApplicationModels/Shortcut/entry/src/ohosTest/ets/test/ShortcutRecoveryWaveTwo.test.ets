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
import { BusinessStore, TodoFilter } from '../../../main/ets/business/BusinessStore';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness, waitBusiness } from '../support/CoverageFixture';
import { waveTwoArchive } from '../support/ShortcutWaveTwoFixture';

export default function shortcutRecoveryWaveTwoTests(): void {
  describe('ShortcutRecoveryWaveTwo', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0100
     * @tc.name testShortcutRecoveryWaveTwo0001
     * @tc.desc 已保留编辑回到正式原文后再次保留不能在重启时复活旧修改
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecoveryWaveTwo', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecoveryWaveTwo', '0001'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('a');
        store.setDraftBody('曾经保留的修改');
        await store.keepEditDraft();
        store.setDraftBody('正式正文');
        expect(await store.keepEditDraft(), caseName('ShortcutRecoveryWaveTwo', '0001'), 'ShortcutRecoveryWaveTwo.test.ets:A0001').assertTrue();
        expect(store.snapshot().editDraftPersisted, caseName('ShortcutRecoveryWaveTwo', '0001'), 'ShortcutRecoveryWaveTwo.test.ets:A0002').assertFalse();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecoveryWaveTwo', '0001'), 'ShortcutRecoveryWaveTwo.test.ets:A0003').assertEqual('正式正文');
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editingNoteId, caseName('ShortcutRecoveryWaveTwo', '0001'), 'ShortcutRecoveryWaveTwo.test.ets:A0004').assertEqual('');
        expect(reopened.snapshot().draftBody, caseName('ShortcutRecoveryWaveTwo', '0001'), 'ShortcutRecoveryWaveTwo.test.ets:A0005').assertEqual('独立新正文');
        expect(reopened.historyFor('a')[0].revisionId, caseName('ShortcutRecoveryWaveTwo', '0001'), 'ShortcutRecoveryWaveTwo.test.ets:A0006').assertEqual('ar');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0200
     * @tc.name testShortcutRecoveryWaveTwo0002
     * @tc.desc 恢复历史成功后重启不能用旧持久编辑覆盖已恢复的正文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecoveryWaveTwo', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecoveryWaveTwo', '0002'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('a');
        store.setDraftBody('恢复之前保留的旧编辑');
        await store.keepEditDraft();
        expect(await store.restoreRevision('a', 'ar'), caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0007').assertTrue();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0008').assertEqual('早期正文');
        expect(store.snapshot().editDraftPersisted, caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0009').assertFalse();
        expect(store.snapshot().editBaseRevision, caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0010').assertEqual(store.historyFor('a')[0].revisionId);
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().draftBody, caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0011').assertEqual('独立新正文');
        expect(reopened.snapshot().notes[0].title, caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0012').assertEqual('早期标题');
        expect(reopened.historyFor('a')[0].body, caseName('ShortcutRecoveryWaveTwo', '0002'), 'ShortcutRecoveryWaveTwo.test.ets:A0013').assertEqual('正式正文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0300
     * @tc.name testShortcutRecoveryWaveTwo0003
     * @tc.desc 保存仅有首尾空白差异的编辑会解除脏状态且不创建重复版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecoveryWaveTwo', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecoveryWaveTwo', '0003'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.beginEditNote('a');
        store.setDraftTitle('  正式标题  ');
        store.setDraftBody('\n正式正文\n');
        expect(await store.saveNote(), caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0014').assertTrue();
        expect(store.hasUnsavedNoteWork(), caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0015').assertFalse();
        expect(store.snapshot().draftTitle, caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0016').assertEqual('正式标题');
        expect(store.snapshot().draftBody, caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0017').assertEqual('正式正文');
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0018').assertEqual('a');
        expect(store.historyFor('a').length, caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0019').assertEqual(1);
        expect(io.writes, caseName('ShortcutRecoveryWaveTwo', '0003'), 'ShortcutRecoveryWaveTwo.test.ets:A0020').assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0400
     * @tc.name testShortcutRecoveryWaveTwo0004
     * @tc.desc 同一业务实例重新初始化后不继承历史浏览筛选和旧编辑基线
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecoveryWaveTwo', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecoveryWaveTwo', '0004'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.selectTodoDate('2026-11-01');
        store.setTodoFilter(TodoFilter.DONE);
        store.setFavoritesOnly(true);
        store.beginEditNote('a');
        store.dispose();
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        expect(store.snapshot().todoFollowToday, caseName('ShortcutRecoveryWaveTwo', '0004'), 'ShortcutRecoveryWaveTwo.test.ets:A0021').assertTrue();
        expect(store.snapshot().todoFilter, caseName('ShortcutRecoveryWaveTwo', '0004'),
          'ShortcutRecoveryWaveTwo.test.ets:A0022').assertEqual('todo_all');
        expect(store.snapshot().favoritesOnly, caseName('ShortcutRecoveryWaveTwo', '0004'), 'ShortcutRecoveryWaveTwo.test.ets:A0023').assertFalse();
        expect(store.snapshot().editBaseRevision, caseName('ShortcutRecoveryWaveTwo', '0004'), 'ShortcutRecoveryWaveTwo.test.ets:A0024').assertEqual('');
        const oldId: string = store.snapshot().todos[0].id;
        clock.setDate(2026, 11, 3);
        expect(await store.setTodoDone(oldId, true), caseName('ShortcutRecoveryWaveTwo', '0004'), 'ShortcutRecoveryWaveTwo.test.ets:A0025').assertFalse();
        expect(store.snapshot().todoDate, caseName('ShortcutRecoveryWaveTwo', '0004'), 'ShortcutRecoveryWaveTwo.test.ets:A0026').assertEqual('2026-11-03');
        expect(store.snapshot().todos[0].done, caseName('ShortcutRecoveryWaveTwo', '0004'), 'ShortcutRecoveryWaveTwo.test.ets:A0027').assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0500
     * @tc.name testShortcutRecoveryWaveTwo0005
     * @tc.desc 存档中格式正确但日历不存在的待办日期被原子拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecoveryWaveTwo', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecoveryWaveTwo', '0005'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive().replace('"todoDays":[]',
          '"todoDays":[{"date":"2026-02-30","items":[{"id":"impossible","title":"历史任务","done":false}]}]');
        const original: string = io.value;
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready, caseName('ShortcutRecoveryWaveTwo', '0005'), 'ShortcutRecoveryWaveTwo.test.ets:A0028').assertFalse();
        expect(store.snapshot().notes.length, caseName('ShortcutRecoveryWaveTwo', '0005'), 'ShortcutRecoveryWaveTwo.test.ets:A0029').assertEqual(0);
        expect(io.value, caseName('ShortcutRecoveryWaveTwo', '0005'), 'ShortcutRecoveryWaveTwo.test.ets:A0030').assertEqual(original);
        expect(io.writes, caseName('ShortcutRecoveryWaveTwo', '0005'), 'ShortcutRecoveryWaveTwo.test.ets:A0031').assertEqual(0);
        io.value = original.replace('2026-02-30', '2026-02-28');
        store.retry();
        await waitBusiness(scope, store);
        expect(store.selectTodoDate('2026-02-28'), caseName('ShortcutRecoveryWaveTwo', '0005'), 'ShortcutRecoveryWaveTwo.test.ets:A0032').assertTrue();
        expect(store.snapshot().todos[0].title, caseName('ShortcutRecoveryWaveTwo', '0005'), 'ShortcutRecoveryWaveTwo.test.ets:A0033').assertEqual('历史任务');
      });
    });
  });
}
