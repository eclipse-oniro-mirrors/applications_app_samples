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
import { BusinessSnapshot, BusinessStore, TodoItem } from '../../../main/ets/business/BusinessStore';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock, MemoryBusinessStorage, startBusiness } from '../support/BusinessFixture';

export default function businessStoreTests(): void {
  describe('BusinessStore', () => {
    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSSTORE_0100
     * @tc.name      testBusinessStore0001
     * @tc.desc      Verify 便签草稿恢复保存删除与写失败保护
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BusinessStore', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessStore', '0001'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const editor: BusinessStore = await startBusiness(scope, storage, clock);
        editor.setDraftTitle('  ');
        editor.setDraftBody('\n  ');
        expect(await editor.saveNote(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0001').assertFalse();
        expect(editor.snapshot().notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0002').assertEqual(0);
        expect(editor.errorText().length > 0, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0003').assertTrue();
        expect(storage.writeCount, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0004').assertEqual(0);

        editor.setDraftTitle('旅行计划');
        editor.setDraftBody('周末去公园');
        editor.openNote();
        expect(editor.hasDraftChanges(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0005').assertTrue();
        expect(editor.snapshot().draftTitle, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0006').assertEqual('旅行计划');
        expect(editor.snapshot().draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0007').assertEqual('周末去公园');
        expect(storage.writeCount, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0008').assertEqual(0);
        expect(await editor.keepDraft(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0009').assertTrue();
        expect(editor.hasDraftChanges(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0010').assertFalse();
        expect(editor.snapshot().draftKept, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0011').assertTrue();
        editor.dispose();

        const restored: BusinessStore = await startBusiness(scope, storage, clock);
        restored.openNote();
        expect(storage.readCount, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0012').assertEqual(2);
        expect(restored.snapshot().draftTitle, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0013').assertEqual('旅行计划');
        expect(restored.snapshot().draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0014').assertEqual('周末去公园');
        expect(restored.hasDraftChanges(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0015').assertFalse();
        expect(await restored.saveNote(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0016').assertTrue();
        let state: BusinessSnapshot = restored.snapshot();
        expect(state.notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0017').assertEqual(1);
        expect(state.notes[0].title, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0018').assertEqual('旅行计划');
        expect(state.notes[0].body, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0019').assertEqual('周末去公园');
        expect(state.notes[0].createdAt, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0020').assertEqual(clock.now());
        const savedId: string = state.notes[0].id;
        restored.openNote();
        state = restored.snapshot();
        expect(state.draftTitle, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0021').assertEqual('');
        expect(state.draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0022').assertEqual('');
        expect(state.draftDirty, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0023').assertFalse();
        expect(state.draftKept, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0024').assertFalse();

        restored.setDraftTitle('临时想法');
        restored.setDraftBody('稍后整理');
        const committed: string = storage.value;
        storage.failNextWrite = true;
        expect(await restored.saveNote(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0025').assertFalse();
        state = restored.snapshot();
        expect(state.draftTitle, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0026').assertEqual('临时想法');
        expect(state.draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0027').assertEqual('稍后整理');
        expect(state.draftDirty, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0028').assertTrue();
        expect(state.busy, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0029').assertFalse();
        expect(state.error.length > 0, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0030').assertTrue();
        expect(state.notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0031').assertEqual(1);
        expect(state.notes[0].id, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0032').assertEqual(savedId);
        expect(state.notes[0].body, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0033').assertEqual('周末去公园');
        expect(storage.value, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0034').assertEqual(committed);
        storage.failNextWrite = true;
        expect(await restored.keepDraft(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0035').assertFalse();
        expect(restored.snapshot().draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0036').assertEqual('稍后整理');
        expect(restored.hasDraftChanges(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0037').assertTrue();
        expect(await restored.discardDraft(), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0038').assertTrue();
        expect(restored.snapshot().draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0039').assertEqual('');
        expect(restored.snapshot().notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0040').assertEqual(1);

        storage.failNextWrite = true;
        expect(await restored.deleteNote(savedId), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0041').assertFalse();
        expect(restored.snapshot().notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0042').assertEqual(1);
        expect(await restored.deleteNote(savedId), caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0043').assertTrue();
        expect(restored.snapshot().notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0044').assertEqual(0);
        restored.dispose();
        const reopened: BusinessStore = await startBusiness(scope, storage, clock);
        reopened.openNote();
        expect(reopened.snapshot().notes.length, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0045').assertEqual(0);
        expect(reopened.snapshot().draftTitle, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0046').assertEqual('');
        expect(reopened.snapshot().draftBody, caseName('BusinessStore', '0001'), 'BusinessStore.test.ets:A0047').assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUSINESSSTORE_0200
     * @tc.name      testBusinessStore0002
     * @tc.desc      Verify 待办完成恢复与本地日期隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BusinessStore', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('BusinessStore', '0002'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        let state: BusinessSnapshot = store.snapshot();
        expect(state.todoDate, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0048').assertEqual('2026-11-02');
        expect(state.todos.length, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0049').assertEqual(3);
        expect(state.todos.every((item: TodoItem) => !item.done), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0050').assertTrue();
        const firstDayId: string = state.todos[0].id;
        expect(await store.setTodoDone(firstDayId, true), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0051').assertTrue();
        expect(store.snapshot().todos[0].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0052').assertTrue();
        expect(await store.setTodoDone(firstDayId, false), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0053').assertTrue();
        expect(store.snapshot().todos[0].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0054').assertFalse();
        expect(await store.setTodoDone(firstDayId, true), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0055').assertTrue();

        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos(), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0056').assertTrue();
        state = store.snapshot();
        expect(state.todoDate, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0057').assertEqual('2026-11-03');
        expect(state.todos.length, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0058').assertEqual(3);
        expect(state.todos.every((item: TodoItem) => !item.done), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0059').assertTrue();
        expect(state.todos[0].id === firstDayId, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0060').assertFalse();
        const secondDayId: string = state.todos[1].id;
        expect(await store.setTodoDone(secondDayId, true), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0061').assertTrue();
        expect(store.snapshot().todos[1].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0062').assertTrue();

        clock.setDate(2026, 11, 2);
        expect(await store.refreshTodos(), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0063').assertTrue();
        state = store.snapshot();
        expect(state.todoDate, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0064').assertEqual('2026-11-02');
        expect(state.todos[0].id, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0065').assertEqual(firstDayId);
        expect(state.todos[0].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0066').assertTrue();
        expect(state.todos[1].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0067').assertFalse();
        expect(await store.resetToday(), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0068').assertTrue();
        state = store.snapshot();
        expect(state.todos.length, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0069').assertEqual(3);
        expect(state.todos.every((item: TodoItem) => !item.done), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0070').assertTrue();

        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos(), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0071').assertTrue();
        state = store.snapshot();
        expect(state.todoDate, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0072').assertEqual('2026-11-03');
        expect(state.todos[1].id, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0073').assertEqual(secondDayId);
        expect(state.todos[1].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0074').assertTrue();
        expect(state.todos[0].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0075').assertFalse();
        store.dispose();
        const reopened: BusinessStore = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().todos[1].done, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0076').assertTrue();
        clock.setDate(2026, 11, 2);
        expect(await reopened.refreshTodos(), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0077').assertTrue();
        expect(reopened.snapshot().todoDate, caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0078').assertEqual('2026-11-02');
        expect(reopened.snapshot().todos.every((item: TodoItem) => !item.done), caseName('BusinessStore', '0002'), 'BusinessStore.test.ets:A0079').assertTrue();
      });
    });
  });
}
