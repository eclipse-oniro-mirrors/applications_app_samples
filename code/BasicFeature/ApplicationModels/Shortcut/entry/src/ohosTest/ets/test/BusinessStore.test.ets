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

    it('testBusinessStore0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const editor: BusinessStore = await startBusiness(scope, storage, clock);
        editor.setDraftTitle('  ');
        editor.setDraftBody('\n  ');
        expect(await editor.saveNote()).assertFalse();
        expect(editor.snapshot().notes.length).assertEqual(0);
        expect(editor.errorText().length > 0).assertTrue();
        expect(storage.writeCount).assertEqual(0);

        editor.setDraftTitle('旅行计划');
        editor.setDraftBody('周末去公园');
        editor.openNote();
        expect(editor.hasDraftChanges()).assertTrue();
        expect(editor.snapshot().draftTitle).assertEqual('旅行计划');
        expect(editor.snapshot().draftBody).assertEqual('周末去公园');
        expect(storage.writeCount).assertEqual(0);
        expect(await editor.keepDraft()).assertTrue();
        expect(editor.hasDraftChanges()).assertFalse();
        expect(editor.snapshot().draftKept).assertTrue();
        editor.dispose();

        const restored: BusinessStore = await startBusiness(scope, storage, clock);
        restored.openNote();
        expect(storage.readCount).assertEqual(2);
        expect(restored.snapshot().draftTitle).assertEqual('旅行计划');
        expect(restored.snapshot().draftBody).assertEqual('周末去公园');
        expect(restored.hasDraftChanges()).assertFalse();
        expect(await restored.saveNote()).assertTrue();
        let state: BusinessSnapshot = restored.snapshot();
        expect(state.notes.length).assertEqual(1);
        expect(state.notes[0].title).assertEqual('旅行计划');
        expect(state.notes[0].body).assertEqual('周末去公园');
        expect(state.notes[0].createdAt).assertEqual(clock.now());
        const savedId: string = state.notes[0].id;
        restored.openNote();
        state = restored.snapshot();
        expect(state.draftTitle).assertEqual('');
        expect(state.draftBody).assertEqual('');
        expect(state.draftDirty).assertFalse();
        expect(state.draftKept).assertFalse();

        restored.setDraftTitle('临时想法');
        restored.setDraftBody('稍后整理');
        const committed: string = storage.value;
        storage.failNextWrite = true;
        expect(await restored.saveNote()).assertFalse();
        state = restored.snapshot();
        expect(state.draftTitle).assertEqual('临时想法');
        expect(state.draftBody).assertEqual('稍后整理');
        expect(state.draftDirty).assertTrue();
        expect(state.busy).assertFalse();
        expect(state.error.length > 0).assertTrue();
        expect(state.notes.length).assertEqual(1);
        expect(state.notes[0].id).assertEqual(savedId);
        expect(state.notes[0].body).assertEqual('周末去公园');
        expect(storage.value).assertEqual(committed);
        storage.failNextWrite = true;
        expect(await restored.keepDraft()).assertFalse();
        expect(restored.snapshot().draftBody).assertEqual('稍后整理');
        expect(restored.hasDraftChanges()).assertTrue();
        expect(await restored.discardDraft()).assertTrue();
        expect(restored.snapshot().draftBody).assertEqual('');
        expect(restored.snapshot().notes.length).assertEqual(1);

        storage.failNextWrite = true;
        expect(await restored.deleteNote(savedId)).assertFalse();
        expect(restored.snapshot().notes.length).assertEqual(1);
        expect(await restored.deleteNote(savedId)).assertTrue();
        expect(restored.snapshot().notes.length).assertEqual(0);
        restored.dispose();
        const reopened: BusinessStore = await startBusiness(scope, storage, clock);
        reopened.openNote();
        expect(reopened.snapshot().notes.length).assertEqual(0);
        expect(reopened.snapshot().draftTitle).assertEqual('');
        expect(reopened.snapshot().draftBody).assertEqual('');
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

    it('testBusinessStore0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        let state: BusinessSnapshot = store.snapshot();
        expect(state.todoDate).assertEqual('2026-11-02');
        expect(state.todos.length).assertEqual(3);
        expect(state.todos.every((item: TodoItem) => !item.done)).assertTrue();
        const firstDayId: string = state.todos[0].id;
        expect(await store.setTodoDone(firstDayId, true)).assertTrue();
        expect(store.snapshot().todos[0].done).assertTrue();
        expect(await store.setTodoDone(firstDayId, false)).assertTrue();
        expect(store.snapshot().todos[0].done).assertFalse();
        expect(await store.setTodoDone(firstDayId, true)).assertTrue();

        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos()).assertTrue();
        state = store.snapshot();
        expect(state.todoDate).assertEqual('2026-11-03');
        expect(state.todos.length).assertEqual(3);
        expect(state.todos.every((item: TodoItem) => !item.done)).assertTrue();
        expect(state.todos[0].id === firstDayId).assertFalse();
        const secondDayId: string = state.todos[1].id;
        expect(await store.setTodoDone(secondDayId, true)).assertTrue();
        expect(store.snapshot().todos[1].done).assertTrue();

        clock.setDate(2026, 11, 2);
        expect(await store.refreshTodos()).assertTrue();
        state = store.snapshot();
        expect(state.todoDate).assertEqual('2026-11-02');
        expect(state.todos[0].id).assertEqual(firstDayId);
        expect(state.todos[0].done).assertTrue();
        expect(state.todos[1].done).assertFalse();
        expect(await store.resetToday()).assertTrue();
        state = store.snapshot();
        expect(state.todos.length).assertEqual(3);
        expect(state.todos.every((item: TodoItem) => !item.done)).assertTrue();

        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos()).assertTrue();
        state = store.snapshot();
        expect(state.todoDate).assertEqual('2026-11-03');
        expect(state.todos[1].id).assertEqual(secondDayId);
        expect(state.todos[1].done).assertTrue();
        expect(state.todos[0].done).assertFalse();
        store.dispose();
        const reopened: BusinessStore = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().todos[1].done).assertTrue();
        clock.setDate(2026, 11, 2);
        expect(await reopened.refreshTodos()).assertTrue();
        expect(reopened.snapshot().todoDate).assertEqual('2026-11-02');
        expect(reopened.snapshot().todos.every((item: TodoItem) => !item.done)).assertTrue();
      });
    });
  });
}
