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
import { BusinessSnapshot, NoteRevision } from '../../../main/ets/business/BusinessStore';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock, MemoryBusinessStorage, startBusiness } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness } from '../support/CoverageFixture';

export default function noteHistoryTests(): void {
  describe('NoteEditingAndHistory', () => {
    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0100
     * @tc.name      testNoteEditingAndHistory0001
     * @tc.desc      Verify edit saves revision and restores older version across reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0001'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0001'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('第一版');
        store.setDraftBody('原始正文');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0001')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0001')).assertEqual(1);
        expect(store.historyFor(id)[0].action, caseName('NoteEditingAndHistory', '0001')).assertEqual('create');

        store.beginEditNote(id);
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0001')).assertEqual(id);
        store.setDraftTitle('第二版');
        store.setDraftBody('更新正文');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0001')).assertTrue();
        let state: BusinessSnapshot = store.snapshot();
        expect(state.notes[0].title, caseName('NoteEditingAndHistory', '0001')).assertEqual('第二版');
        expect(state.notes[0].body, caseName('NoteEditingAndHistory', '0001')).assertEqual('更新正文');
        expect(state.editingNoteId, caseName('NoteEditingAndHistory', '0001')).assertEqual('');
        const history: NoteRevision[] = store.historyFor(id);
        expect(history.length, caseName('NoteEditingAndHistory', '0001')).assertEqual(2);
        expect(history[0].action, caseName('NoteEditingAndHistory', '0001')).assertEqual('edit');
        expect(history[0].title, caseName('NoteEditingAndHistory', '0001')).assertEqual('第一版');
        expect(history[1].action, caseName('NoteEditingAndHistory', '0001')).assertEqual('create');

        expect(await store.restoreRevision(id, history[0].revisionId), caseName('NoteEditingAndHistory', '0001')).assertTrue();
        state = store.snapshot();
        expect(state.notes[0].title, caseName('NoteEditingAndHistory', '0001')).assertEqual('第一版');
        expect(state.notes[0].body, caseName('NoteEditingAndHistory', '0001')).assertEqual('原始正文');
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0001')).assertEqual(3);
        expect(store.historyFor(id)[0].action, caseName('NoteEditingAndHistory', '0001')).assertEqual('restore');
        expect(store.historyFor(id)[0].title, caseName('NoteEditingAndHistory', '0001')).assertEqual('第二版');

        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        const persisted: NoteRevision[] = reopened.historyFor(id);
        expect(persisted.length, caseName('NoteEditingAndHistory', '0001')).assertEqual(3);
        expect(persisted[0].action, caseName('NoteEditingAndHistory', '0001')).assertEqual('restore');
        reopened.beginEditNote(id);
        reopened.setDraftTitle('第三版');
        expect(await reopened.saveNote(), caseName('NoteEditingAndHistory', '0001')).assertTrue();
        expect(reopened.historyFor(id).length, caseName('NoteEditingAndHistory', '0001')).assertEqual(4);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0200
     * @tc.name      testNoteEditingAndHistory0002
     * @tc.desc      Verify search filters notes and collections without touching storage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0002'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0002'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('会议纪要');
        store.setDraftBody('周三评审结论');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0002')).assertTrue();
        store.setDraftTitle('阅读笔记');
        store.setDraftBody('第一章摘录');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0002')).assertTrue();
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(2);
        store.setNoteQuery('会议');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(1);
        expect(store.snapshot().visibleNotes[0].title, caseName('NoteEditingAndHistory', '0002')).assertEqual('会议纪要');
        store.setNoteQuery('第一章');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(1);
        expect(store.snapshot().visibleNotes[0].title, caseName('NoteEditingAndHistory', '0002')).assertEqual('阅读笔记');
        store.setNoteQuery('不存在');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(0);
        store.setNoteQuery('');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(2);

        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(3);
        store.setCollectionCategory('效率');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id, caseName('NoteEditingAndHistory', '0002')).assertEqual('planning');
        store.setCollectionCategory('全部');
        store.setCollectionQuery('模板');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(2);
        store.setCollectionQuery('会议');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(1);
        store.setCollectionQuery('');
        store.setCollectionCategory('全部');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002')).assertEqual(3);
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0002')).assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0300
     * @tc.name      testNoteEditingAndHistory0003
     * @tc.desc      Verify editing guards dirty draft unchanged save and cancel
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0003'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0003'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('第一篇');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003')).assertTrue();
        store.setDraftTitle('第二篇');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003')).assertTrue();
        const snapshot: BusinessSnapshot = store.snapshot();
        const firstId: string = snapshot.notes[0].id;
        const secondId: string = snapshot.notes[1].id;

        store.beginEditNote(firstId);
        store.setDraftTitle('修改中');
        store.beginEditNote(secondId);
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0003')).assertEqual(firstId);
        expect(store.snapshot().error.length > 0, caseName('NoteEditingAndHistory', '0003')).assertTrue();
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0003')).assertFalse();
        const writes: number = storage.writeCount;
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003')).assertTrue();
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0003')).assertEqual(writes + 1);
        store.beginEditNote(firstId);
        const unchangedWrites: number = storage.writeCount;
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003')).assertTrue();
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0003')).assertEqual(unchangedWrites);
        expect(store.snapshot().message, caseName('NoteEditingAndHistory', '0003')).assertEqual('内容未变化');

        store.setDraftTitle('放弃的修改');
        store.cancelEdit();
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0003')).assertEqual('');
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0003')).assertEqual('');
        expect(store.snapshot().draftDirty, caseName('NoteEditingAndHistory', '0003')).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0400
     * @tc.name      testNoteEditingAndHistory0004
     * @tc.desc      Verify invalid history rejects archive and delete removes revisions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0004'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0004'), async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = '{"version":1,"notes":[{"id":"a","title":"t","body":"b","createdAt":1}],' +
          '"draftTitle":"","draftBody":"","todoDays":[],' +
          '"noteHistory":[{"revisionId":"r1","noteId":"missing","title":"t","body":"b","savedAt":1,"action":"edit"}]}';
        const broken = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(broken.snapshot().ready, caseName('NoteEditingAndHistory', '0004')).assertFalse();
        expect(broken.snapshot().notes.length, caseName('NoteEditingAndHistory', '0004')).assertEqual(0);
        expect(io.writes, caseName('NoteEditingAndHistory', '0004')).assertEqual(0);

        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('待删');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0004')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('待删二');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0004')).assertTrue();
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0004')).assertEqual(2);
        expect(await store.deleteNote(id), caseName('NoteEditingAndHistory', '0004')).assertTrue();
        expect(store.snapshot().notes.length, caseName('NoteEditingAndHistory', '0004')).assertEqual(0);
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0004')).assertEqual(0);
        expect(storage.value.indexOf('noteHistory') >= 0, caseName('NoteEditingAndHistory', '0004')).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0500
     * @tc.name      testNoteEditingAndHistory0005
     * @tc.desc      Verify legacy archive migrates and history is bounded to one hundred
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0005'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0005'), async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = '{"version":1,"notes":[{"id":"legacy","title":"旧数据","body":"正文","createdAt":1}],' +
          '"draftTitle":"","draftBody":"","todoDays":[]}';
        const migrated = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(migrated.snapshot().ready, caseName('NoteEditingAndHistory', '0005')).assertTrue();
        expect(migrated.snapshot().notes.length, caseName('NoteEditingAndHistory', '0005')).assertEqual(1);
        expect(migrated.historyFor('legacy').length, caseName('NoteEditingAndHistory', '0005')).assertEqual(0);
        migrated.beginEditNote('legacy');
        migrated.setDraftBody('修改后');
        expect(await migrated.saveNote(), caseName('NoteEditingAndHistory', '0005')).assertTrue();
        expect(migrated.historyFor('legacy').length, caseName('NoteEditingAndHistory', '0005')).assertEqual(1);
        expect(io.writes, caseName('NoteEditingAndHistory', '0005')).assertEqual(1);

        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('基础');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0005')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        for (let index = 0; index < 105; index++) {
          store.beginEditNote(id);
          store.setDraftBody(`版本 ${index}`);
          expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0005')).assertTrue();
        }
        const history: NoteRevision[] = store.historyFor(id);
        expect(history.length, caseName('NoteEditingAndHistory', '0005')).assertEqual(100);
        expect(history[0].body, caseName('NoteEditingAndHistory', '0005')).assertEqual('版本 103');
        expect(history[99].body, caseName('NoteEditingAndHistory', '0005')).assertEqual('版本 4');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0600
     * @tc.name      testNoteEditingAndHistory0006
     * @tc.desc      Verify leave confirmation saves existing note keeps draft and discards edits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0006'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0006'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('离开测试');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0006')).assertTrue();
        const id: string = store.snapshot().notes[0].id;

        store.beginEditNote(id);
        store.setDraftTitle('保存后离开');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006')).assertTrue();
        expect(await store.persistForLeave(), caseName('NoteEditingAndHistory', '0006')).assertTrue();
        expect(store.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0006')).assertEqual('保存后离开');
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0006')).assertEqual('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006')).assertFalse();

        store.beginEditNote(id);
        store.setDraftTitle('放弃的修改');
        expect(await store.discardForLeave(), caseName('NoteEditingAndHistory', '0006')).assertTrue();
        expect(store.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0006')).assertEqual('保存后离开');
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0006')).assertEqual('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006')).assertFalse();

        store.setDraftTitle('新草稿');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006')).assertTrue();
        expect(await store.persistForLeave(), caseName('NoteEditingAndHistory', '0006')).assertTrue();
        expect(store.snapshot().draftKept, caseName('NoteEditingAndHistory', '0006')).assertTrue();
        expect(store.snapshot().notes.length, caseName('NoteEditingAndHistory', '0006')).assertEqual(1);
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006')).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0700
     * @tc.name      testNoteEditingAndHistory0007
     * @tc.desc      Verify todo crud and filters respect daily limits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0007'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0007'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(3);
        expect(await store.addTodo('  新增任务  '), caseName('NoteEditingAndHistory', '0007')).assertTrue();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(4);
        const added = store.snapshot().todos[3];
        expect(added.title, caseName('NoteEditingAndHistory', '0007')).assertEqual('新增任务');
        expect(await store.addTodo(''), caseName('NoteEditingAndHistory', '0007')).assertFalse();
        expect(await store.addTodo('x'.repeat(61)), caseName('NoteEditingAndHistory', '0007')).assertFalse();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(4);

        expect(await store.setTodoDone(added.id, true), caseName('NoteEditingAndHistory', '0007')).assertTrue();
        store.setTodoFilter('已完成');
        expect(store.snapshot().visibleTodos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(1);
        expect(store.snapshot().visibleTodos[0].id, caseName('NoteEditingAndHistory', '0007')).assertEqual(added.id);
        store.setTodoFilter('未完成');
        expect(store.snapshot().visibleTodos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(3);
        store.setTodoFilter('全部');
        expect(store.snapshot().visibleTodos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(4);

        expect(await store.updateTodo(added.id, '改后的任务'), caseName('NoteEditingAndHistory', '0007')).assertTrue();
        expect(store.snapshot().todos[3].title, caseName('NoteEditingAndHistory', '0007')).assertEqual('改后的任务');
        expect(await store.deleteTodo(added.id), caseName('NoteEditingAndHistory', '0007')).assertTrue();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(3);
        expect(await store.deleteTodo(store.snapshot().todos[0].id), caseName('NoteEditingAndHistory', '0007')).assertTrue();
        expect(await store.deleteTodo(store.snapshot().todos[0].id), caseName('NoteEditingAndHistory', '0007')).assertTrue();
        expect(await store.deleteTodo(store.snapshot().todos[0].id), caseName('NoteEditingAndHistory', '0007')).assertFalse();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007')).assertEqual(1);
        expect(store.errorText(), caseName('NoteEditingAndHistory', '0007')).assertEqual('至少保留一项待办');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0800
     * @tc.name      testNoteEditingAndHistory0008
     * @tc.desc      Verify favorites persist and compose with category search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0008'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0008'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(store.snapshot().favoriteIds.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(0);
        expect(await store.toggleFavorite('planning'), caseName('NoteEditingAndHistory', '0008')).assertTrue();
        expect(await store.toggleFavorite('reading'), caseName('NoteEditingAndHistory', '0008')).assertTrue();
        expect(store.snapshot().favoriteIds.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(2);
        store.setFavoritesOnly(true);
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(2);
        store.setCollectionCategory('效率');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id, caseName('NoteEditingAndHistory', '0008')).assertEqual('planning');
        store.setCollectionCategory('全部');
        store.setCollectionQuery('摘录');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id, caseName('NoteEditingAndHistory', '0008')).assertEqual('reading');
        store.setCollectionQuery('');
        expect(await store.toggleFavorite('planning'), caseName('NoteEditingAndHistory', '0008')).assertTrue();
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(1);
        expect(await store.toggleFavorite('missing'), caseName('NoteEditingAndHistory', '0008')).assertFalse();
        expect(store.errorText(), caseName('NoteEditingAndHistory', '0008')).assertEqual('收藏内容不存在');

        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().favoriteIds.length, caseName('NoteEditingAndHistory', '0008')).assertEqual(1);
        expect(reopened.snapshot().favoriteIds[0], caseName('NoteEditingAndHistory', '0008')).assertEqual('reading');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0900
     * @tc.name      testNoteEditingAndHistory0009
     * @tc.desc      Verify edit dirty uses original note and save protects independent draft
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('NoteEditingAndHistory', '0009'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0009'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('原便签');
        store.setDraftBody('正文');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0009')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立新草稿');
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0009')).assertTrue();
        store.beginEditNote(id);
        store.setDraftBody('正文');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0009')).assertFalse();
        store.setDraftTitle('独立新草稿');
        store.setDraftBody('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0009')).assertTrue();
        store.setDraftTitle('原便签');
        store.setDraftBody('正文');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0009')).assertFalse();
        store.setDraftTitle('已更新');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0009')).assertTrue();
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0009')).assertEqual('独立新草稿');
        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0009')).assertEqual('独立新草稿');
        expect(reopened.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0009')).assertEqual('已更新');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1000
     * @tc.name      testNoteEditingAndHistory0010
     * @tc.desc      Verify clearing existing note editor preserves independent draft across reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('NoteEditingAndHistory', '0010'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0010'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('便签A');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0010')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立草稿B');
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0010')).assertTrue();
        const writes: number = storage.writeCount;
        store.beginEditNote(id);
        expect(await store.discardDraft(), caseName('NoteEditingAndHistory', '0010')).assertTrue();
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0010')).assertEqual(id);
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0010')).assertEqual('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0010')).assertTrue();
        expect(store.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0010')).assertEqual('便签A');
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0010')).assertEqual(writes);
        store.cancelEdit();
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0010')).assertEqual('独立草稿B');
        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0010')).assertEqual('独立草稿B');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1100
     * @tc.name      testNoteEditingAndHistory0011
     * @tc.desc      Verify leave save failure keeps editing state for retry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteEditingAndHistory', '0011'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0011'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('可保存');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0011')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        storage.failNextWrite = true;
        store.beginEditNote(id);
        store.setDraftTitle('保存失败');
        expect(await store.persistForLeave(), caseName('NoteEditingAndHistory', '0011')).assertFalse();
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0011')).assertEqual(id);
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0011')).assertEqual('保存失败');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0011')).assertTrue();
        expect(store.errorText().length > 0, caseName('NoteEditingAndHistory', '0011')).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1200
     * @tc.name      testNoteEditingAndHistory0012
     * @tc.desc      Verify edit draft survives reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('NoteEditingAndHistory', '0012'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0012'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('原始');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0012')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('编辑中');
        expect(await store.keepEditDraft(), caseName('NoteEditingAndHistory', '0012')).assertTrue();
        expect(store.snapshot().editDraftPersisted, caseName('NoteEditingAndHistory', '0012')).assertTrue();
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0012')).assertFalse();
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0012')).assertEqual(id);
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0012')).assertEqual('编辑中');
        expect(reopened.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0012')).assertTrue();
        expect(reopened.snapshot().editDraftPersisted, caseName('NoteEditingAndHistory', '0012')).assertTrue();
        expect(await reopened.saveNote(), caseName('NoteEditingAndHistory', '0012')).assertTrue();
        expect(reopened.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0012')).assertEqual('编辑中');
        expect(reopened.snapshot().editDraftPersisted, caseName('NoteEditingAndHistory', '0012')).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1300
     * @tc.name      testNoteEditingAndHistory0013
     * @tc.desc      Verify edit draft keeps independent new draft
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('NoteEditingAndHistory', '0013'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0013'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('便签A');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0013')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立草稿B');
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0013')).assertTrue();
        store.beginEditNote(id);
        store.setDraftTitle('A的编辑');
        expect(await store.keepEditDraft(), caseName('NoteEditingAndHistory', '0013')).assertTrue();
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0013')).assertEqual(id);
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0013')).assertEqual('A的编辑');
        expect(reopened.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0013')).assertEqual('便签A');
        reopened.cancelEdit();
        await scope.until(() => !reopened.snapshot().busy, (changed: () => void): (() => void) => {
          reopened.subscribe(changed); return (): void => { reopened.unsubscribe(changed); };
        });
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0013')).assertEqual('独立草稿B');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1400
     * @tc.name      testNoteEditingAndHistory0014
     * @tc.desc      Verify cancel clears persisted edit draft
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('NoteEditingAndHistory', '0014'), 0, async () => {
      await runCase(caseName('NoteEditingAndHistory', '0014'), async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('要编辑');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0014')).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('草稿');
        expect(await store.keepEditDraft(), caseName('NoteEditingAndHistory', '0014')).assertTrue();
        store.cancelEdit();
        await scope.until(() => !store.snapshot().busy, (changed: () => void): (() => void) => {
          store.subscribe(changed); return (): void => { store.unsubscribe(changed); };
        });
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0014')).assertEqual('');
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0014')).assertEqual('');
        expect(reopened.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0014')).assertFalse();
      });
    });
  });
}
