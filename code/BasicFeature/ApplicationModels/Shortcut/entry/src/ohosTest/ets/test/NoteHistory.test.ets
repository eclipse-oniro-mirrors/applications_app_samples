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

    it(caseName('NoteEditingAndHistory', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0001'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('第一版');
        store.setDraftBody('原始正文');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0001').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0002').assertEqual(1);
        expect(store.historyFor(id)[0].action, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0003').assertEqual('create');

        store.beginEditNote(id);
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0004').assertEqual(id);
        store.setDraftTitle('第二版');
        store.setDraftBody('更新正文');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0005').assertTrue();
        let state: BusinessSnapshot = store.snapshot();
        expect(state.notes[0].title, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0006').assertEqual('第二版');
        expect(state.notes[0].body, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0007').assertEqual('更新正文');
        expect(state.editingNoteId, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0008').assertEqual('');
        const history: NoteRevision[] = store.historyFor(id);
        expect(history.length, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0009').assertEqual(2);
        expect(history[0].action, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0010').assertEqual('edit');
        expect(history[0].title, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0011').assertEqual('第一版');
        expect(history[1].action, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0012').assertEqual('create');

        expect(await store.restoreRevision(id, history[0].revisionId), caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0013').assertTrue();
        state = store.snapshot();
        expect(state.notes[0].title, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0014').assertEqual('第一版');
        expect(state.notes[0].body, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0015').assertEqual('原始正文');
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0016').assertEqual(3);
        expect(store.historyFor(id)[0].action, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0017').assertEqual('restore');
        expect(store.historyFor(id)[0].title, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0018').assertEqual('第二版');

        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        const persisted: NoteRevision[] = reopened.historyFor(id);
        expect(persisted.length, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0019').assertEqual(3);
        expect(persisted[0].action, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0020').assertEqual('restore');
        reopened.beginEditNote(id);
        reopened.setDraftTitle('第三版');
        expect(await reopened.saveNote(), caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0021').assertTrue();
        expect(reopened.historyFor(id).length, caseName('NoteEditingAndHistory', '0001'), 'NoteHistory.test.ets:A0022').assertEqual(4);
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

    it(caseName('NoteEditingAndHistory', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0002'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('会议纪要');
        store.setDraftBody('周三评审结论');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0023').assertTrue();
        store.setDraftTitle('阅读笔记');
        store.setDraftBody('第一章摘录');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0024').assertTrue();
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0025').assertEqual(2);
        store.setNoteQuery('会议');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0026').assertEqual(1);
        expect(store.snapshot().visibleNotes[0].title, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0027').assertEqual('会议纪要');
        store.setNoteQuery('第一章');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0028').assertEqual(1);
        expect(store.snapshot().visibleNotes[0].title, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0029').assertEqual('阅读笔记');
        store.setNoteQuery('不存在');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0030').assertEqual(0);
        store.setNoteQuery('');
        expect(store.snapshot().visibleNotes.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0031').assertEqual(2);

        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0032').assertEqual(3);
        store.setCollectionCategory('效率');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0033').assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0034').assertEqual('planning');
        store.setCollectionCategory('全部');
        store.setCollectionQuery('模板');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0035').assertEqual(2);
        store.setCollectionQuery('会议');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0036').assertEqual(1);
        store.setCollectionQuery('');
        store.setCollectionCategory('全部');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0037').assertEqual(3);
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0002'), 'NoteHistory.test.ets:A0038').assertEqual(2);
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

    it(caseName('NoteEditingAndHistory', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0003'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('第一篇');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0039').assertTrue();
        store.setDraftTitle('第二篇');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0040').assertTrue();
        const snapshot: BusinessSnapshot = store.snapshot();
        const firstId: string = snapshot.notes[0].id;
        const secondId: string = snapshot.notes[1].id;

        store.beginEditNote(firstId);
        store.setDraftTitle('修改中');
        store.beginEditNote(secondId);
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0041').assertEqual(firstId);
        expect(store.snapshot().error.length > 0, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0042').assertTrue();
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0043').assertFalse();
        const writes: number = storage.writeCount;
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0044').assertTrue();
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0045').assertEqual(writes + 1);
        store.beginEditNote(firstId);
        const unchangedWrites: number = storage.writeCount;
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0046').assertTrue();
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0047').assertEqual(unchangedWrites);
        expect(store.snapshot().message, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0048').assertEqual('内容未变化');

        store.setDraftTitle('放弃的修改');
        store.cancelEdit();
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0049').assertEqual('');
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0050').assertEqual('');
        expect(store.snapshot().draftDirty, caseName('NoteEditingAndHistory', '0003'), 'NoteHistory.test.ets:A0051').assertFalse();
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

    it(caseName('NoteEditingAndHistory', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0004'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = '{"version":1,"notes":[{"id":"a","title":"t","body":"b","createdAt":1}],' +
          '"draftTitle":"","draftBody":"","todoDays":[],' +
          '"noteHistory":[{"revisionId":"r1","noteId":"missing","title":"t","body":"b","savedAt":1,"action":"edit"}]}';
        const broken = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(broken.snapshot().ready, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0052').assertFalse();
        expect(broken.snapshot().notes.length, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0053').assertEqual(0);
        expect(io.writes, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0054').assertEqual(0);

        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('待删');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0055').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('待删二');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0056').assertTrue();
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0057').assertEqual(2);
        expect(await store.deleteNote(id), caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0058').assertTrue();
        expect(store.snapshot().notes.length, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0059').assertEqual(0);
        expect(store.historyFor(id).length, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0060').assertEqual(0);
        expect(storage.value.indexOf('noteHistory') >= 0, caseName('NoteEditingAndHistory', '0004'), 'NoteHistory.test.ets:A0061').assertTrue();
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

    it(caseName('NoteEditingAndHistory', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0005'), async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = '{"version":1,"notes":[{"id":"legacy","title":"旧数据","body":"正文","createdAt":1}],' +
          '"draftTitle":"","draftBody":"","todoDays":[]}';
        const migrated = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(migrated.snapshot().ready, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0062').assertTrue();
        expect(migrated.snapshot().notes.length, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0063').assertEqual(1);
        expect(migrated.historyFor('legacy').length, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0064').assertEqual(0);
        migrated.beginEditNote('legacy');
        migrated.setDraftBody('修改后');
        expect(await migrated.saveNote(), caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0065').assertTrue();
        expect(migrated.historyFor('legacy').length, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0066').assertEqual(1);
        expect(io.writes, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0067').assertEqual(1);

        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('基础');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0068').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        for (let index = 0; index < 105; index++) {
          store.beginEditNote(id);
          store.setDraftBody(`版本 ${index}`);
          expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0069').assertTrue();
        }
        const history: NoteRevision[] = store.historyFor(id);
        expect(history.length, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0070').assertEqual(100);
        expect(history[0].body, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0071').assertEqual('版本 103');
        expect(history[99].body, caseName('NoteEditingAndHistory', '0005'), 'NoteHistory.test.ets:A0072').assertEqual('版本 4');
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

    it(caseName('NoteEditingAndHistory', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0006'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('离开测试');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0073').assertTrue();
        const id: string = store.snapshot().notes[0].id;

        store.beginEditNote(id);
        store.setDraftTitle('保存后离开');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0074').assertTrue();
        expect(await store.persistForLeave(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0075').assertTrue();
        expect(store.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0076').assertEqual('保存后离开');
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0077').assertEqual('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0078').assertFalse();

        store.beginEditNote(id);
        store.setDraftTitle('放弃的修改');
        expect(await store.discardForLeave(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0079').assertTrue();
        expect(store.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0080').assertEqual('保存后离开');
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0081').assertEqual('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0082').assertFalse();

        store.setDraftTitle('新草稿');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0083').assertTrue();
        expect(await store.persistForLeave(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0084').assertTrue();
        expect(store.snapshot().draftKept, caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0085').assertTrue();
        expect(store.snapshot().notes.length, caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0086').assertEqual(1);
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0006'), 'NoteHistory.test.ets:A0087').assertFalse();
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

    it(caseName('NoteEditingAndHistory', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0007'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0088').assertEqual(3);
        expect(await store.addTodo('  新增任务  '), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0089').assertTrue();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0090').assertEqual(4);
        const added = store.snapshot().todos[3];
        expect(added.title, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0091').assertEqual('新增任务');
        expect(await store.addTodo(''), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0092').assertFalse();
        expect(await store.addTodo('x'.repeat(61)), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0093').assertFalse();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0094').assertEqual(4);

        expect(await store.setTodoDone(added.id, true), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0095').assertTrue();
        store.setTodoFilter('已完成');
        expect(store.snapshot().visibleTodos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0096').assertEqual(1);
        expect(store.snapshot().visibleTodos[0].id, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0097').assertEqual(added.id);
        store.setTodoFilter('未完成');
        expect(store.snapshot().visibleTodos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0098').assertEqual(3);
        store.setTodoFilter('全部');
        expect(store.snapshot().visibleTodos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0099').assertEqual(4);

        expect(await store.updateTodo(added.id, '改后的任务'), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0100').assertTrue();
        expect(store.snapshot().todos[3].title, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0101').assertEqual('改后的任务');
        expect(await store.deleteTodo(added.id), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0102').assertTrue();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0103').assertEqual(3);
        expect(await store.deleteTodo(store.snapshot().todos[0].id), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0104').assertTrue();
        expect(await store.deleteTodo(store.snapshot().todos[0].id), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0105').assertTrue();
        expect(await store.deleteTodo(store.snapshot().todos[0].id), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0106').assertFalse();
        expect(store.snapshot().todos.length, caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0107').assertEqual(1);
        expect(store.errorText(), caseName('NoteEditingAndHistory', '0007'), 'NoteHistory.test.ets:A0108').assertEqual('至少保留一项待办');
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

    it(caseName('NoteEditingAndHistory', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0008'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(store.snapshot().favoriteIds.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0109').assertEqual(0);
        expect(await store.toggleFavorite('planning'), caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0110').assertTrue();
        expect(await store.toggleFavorite('reading'), caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0111').assertTrue();
        expect(store.snapshot().favoriteIds.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0112').assertEqual(2);
        store.setFavoritesOnly(true);
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0113').assertEqual(2);
        store.setCollectionCategory('效率');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0114').assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0115').assertEqual('planning');
        store.setCollectionCategory('全部');
        store.setCollectionQuery('摘录');
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0116').assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0117').assertEqual('reading');
        store.setCollectionQuery('');
        expect(await store.toggleFavorite('planning'), caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0118').assertTrue();
        expect(store.snapshot().visibleCollections.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0119').assertEqual(1);
        expect(await store.toggleFavorite('missing'), caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0120').assertFalse();
        expect(store.errorText(), caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0121').assertEqual('收藏内容不存在');

        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().favoriteIds.length, caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0122').assertEqual(1);
        expect(reopened.snapshot().favoriteIds[0], caseName('NoteEditingAndHistory', '0008'), 'NoteHistory.test.ets:A0123').assertEqual('reading');
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


    it(caseName('NoteEditingAndHistory', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0009'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('原便签');
        store.setDraftBody('正文');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0124').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立新草稿');
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0125').assertTrue();
        store.beginEditNote(id);
        store.setDraftBody('正文');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0126').assertFalse();
        store.setDraftTitle('独立新草稿');
        store.setDraftBody('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0127').assertTrue();
        store.setDraftTitle('原便签');
        store.setDraftBody('正文');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0128').assertFalse();
        store.setDraftTitle('已更新');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0129').assertTrue();
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0130').assertEqual('独立新草稿');
        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0131').assertEqual('独立新草稿');
        expect(reopened.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0009'), 'NoteHistory.test.ets:A0132').assertEqual('已更新');
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


    it(caseName('NoteEditingAndHistory', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0010'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('便签A');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0133').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立草稿B');
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0134').assertTrue();
        const writes: number = storage.writeCount;
        store.beginEditNote(id);
        expect(await store.discardDraft(), caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0135').assertTrue();
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0136').assertEqual(id);
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0137').assertEqual('');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0138').assertTrue();
        expect(store.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0139').assertEqual('便签A');
        expect(storage.writeCount, caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0140').assertEqual(writes);
        store.cancelEdit();
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0141').assertEqual('独立草稿B');
        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0010'), 'NoteHistory.test.ets:A0142').assertEqual('独立草稿B');
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

    it(caseName('NoteEditingAndHistory', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0011'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('可保存');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0011'), 'NoteHistory.test.ets:A0143').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        storage.failNextWrite = true;
        store.beginEditNote(id);
        store.setDraftTitle('保存失败');
        expect(await store.persistForLeave(), caseName('NoteEditingAndHistory', '0011'), 'NoteHistory.test.ets:A0144').assertFalse();
        expect(store.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0011'), 'NoteHistory.test.ets:A0145').assertEqual(id);
        expect(store.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0011'), 'NoteHistory.test.ets:A0146').assertEqual('保存失败');
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0011'), 'NoteHistory.test.ets:A0147').assertTrue();
        expect(store.errorText().length > 0, caseName('NoteEditingAndHistory', '0011'), 'NoteHistory.test.ets:A0148').assertTrue();
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


    it(caseName('NoteEditingAndHistory', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0012'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('原始');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0149').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('编辑中');
        expect(await store.keepEditDraft(), caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0150').assertTrue();
        expect(store.snapshot().editDraftPersisted, caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0151').assertTrue();
        expect(store.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0152').assertFalse();
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0153').assertEqual(id);
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0154').assertEqual('编辑中');
        expect(reopened.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0155').assertTrue();
        expect(reopened.snapshot().editDraftPersisted, caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0156').assertTrue();
        expect(await reopened.saveNote(), caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0157').assertTrue();
        expect(reopened.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0158').assertEqual('编辑中');
        expect(reopened.snapshot().editDraftPersisted, caseName('NoteEditingAndHistory', '0012'), 'NoteHistory.test.ets:A0159').assertFalse();
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


    it(caseName('NoteEditingAndHistory', '0013'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0013'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('便签A');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0160').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立草稿B');
        expect(await store.keepDraft(), caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0161').assertTrue();
        store.beginEditNote(id);
        store.setDraftTitle('A的编辑');
        expect(await store.keepEditDraft(), caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0162').assertTrue();
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0163').assertEqual(id);
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0164').assertEqual('A的编辑');
        expect(reopened.snapshot().notes[0].title, caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0165').assertEqual('便签A');
        reopened.cancelEdit();
        await scope.until(() => !reopened.snapshot().busy, (changed: () => void): (() => void) => {
          reopened.subscribe(changed); return (): void => { reopened.unsubscribe(changed); };
        });
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0013'), 'NoteHistory.test.ets:A0166').assertEqual('独立草稿B');
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


    it(caseName('NoteEditingAndHistory', '0014'), 0, async (): Promise<void> => {
      await runCase(caseName('NoteEditingAndHistory', '0014'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('要编辑');
        expect(await store.saveNote(), caseName('NoteEditingAndHistory', '0014'), 'NoteHistory.test.ets:A0167').assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('草稿');
        expect(await store.keepEditDraft(), caseName('NoteEditingAndHistory', '0014'), 'NoteHistory.test.ets:A0168').assertTrue();
        store.cancelEdit();
        await scope.until(() => !store.snapshot().busy, (changed: () => void): (() => void) => {
          store.subscribe(changed); return (): void => { store.unsubscribe(changed); };
        });
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId, caseName('NoteEditingAndHistory', '0014'), 'NoteHistory.test.ets:A0169').assertEqual('');
        expect(reopened.snapshot().draftTitle, caseName('NoteEditingAndHistory', '0014'), 'NoteHistory.test.ets:A0170').assertEqual('');
        expect(reopened.hasUnsavedNoteWork(), caseName('NoteEditingAndHistory', '0014'), 'NoteHistory.test.ets:A0171').assertFalse();
      });
    });
  });
}
