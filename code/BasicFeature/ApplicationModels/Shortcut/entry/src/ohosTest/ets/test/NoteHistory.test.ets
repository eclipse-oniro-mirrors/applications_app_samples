import { describe, expect, it } from '@ohos/hypium';
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

    it('testNoteEditingAndHistory0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('第一版');
        store.setDraftBody('原始正文');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        expect(store.historyFor(id).length).assertEqual(1);
        expect(store.historyFor(id)[0].action).assertEqual('create');

        store.beginEditNote(id);
        expect(store.snapshot().editingNoteId).assertEqual(id);
        store.setDraftTitle('第二版');
        store.setDraftBody('更新正文');
        expect(await store.saveNote()).assertTrue();
        let state: BusinessSnapshot = store.snapshot();
        expect(state.notes[0].title).assertEqual('第二版');
        expect(state.notes[0].body).assertEqual('更新正文');
        expect(state.editingNoteId).assertEqual('');
        const history: NoteRevision[] = store.historyFor(id);
        expect(history.length).assertEqual(2);
        expect(history[0].action).assertEqual('edit');
        expect(history[0].title).assertEqual('第一版');
        expect(history[1].action).assertEqual('create');

        expect(await store.restoreRevision(id, history[0].revisionId)).assertTrue();
        state = store.snapshot();
        expect(state.notes[0].title).assertEqual('第一版');
        expect(state.notes[0].body).assertEqual('原始正文');
        expect(store.historyFor(id).length).assertEqual(3);
        expect(store.historyFor(id)[0].action).assertEqual('restore');
        expect(store.historyFor(id)[0].title).assertEqual('第二版');

        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        const persisted: NoteRevision[] = reopened.historyFor(id);
        expect(persisted.length).assertEqual(3);
        expect(persisted[0].action).assertEqual('restore');
        reopened.beginEditNote(id);
        reopened.setDraftTitle('第三版');
        expect(await reopened.saveNote()).assertTrue();
        expect(reopened.historyFor(id).length).assertEqual(4);
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

    it('testNoteEditingAndHistory0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('会议纪要');
        store.setDraftBody('周三评审结论');
        expect(await store.saveNote()).assertTrue();
        store.setDraftTitle('阅读笔记');
        store.setDraftBody('第一章摘录');
        expect(await store.saveNote()).assertTrue();
        expect(store.snapshot().visibleNotes.length).assertEqual(2);
        store.setNoteQuery('会议');
        expect(store.snapshot().visibleNotes.length).assertEqual(1);
        expect(store.snapshot().visibleNotes[0].title).assertEqual('会议纪要');
        store.setNoteQuery('第一章');
        expect(store.snapshot().visibleNotes.length).assertEqual(1);
        expect(store.snapshot().visibleNotes[0].title).assertEqual('阅读笔记');
        store.setNoteQuery('不存在');
        expect(store.snapshot().visibleNotes.length).assertEqual(0);
        store.setNoteQuery('');
        expect(store.snapshot().visibleNotes.length).assertEqual(2);

        expect(store.snapshot().visibleCollections.length).assertEqual(3);
        store.setCollectionCategory('效率');
        expect(store.snapshot().visibleCollections.length).assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id).assertEqual('planning');
        store.setCollectionCategory('全部');
        store.setCollectionQuery('模板');
        expect(store.snapshot().visibleCollections.length).assertEqual(2);
        store.setCollectionQuery('会议');
        expect(store.snapshot().visibleCollections.length).assertEqual(1);
        store.setCollectionQuery('');
        store.setCollectionCategory('全部');
        expect(store.snapshot().visibleCollections.length).assertEqual(3);
        expect(storage.writeCount).assertEqual(2);
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

    it('testNoteEditingAndHistory0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('第一篇');
        expect(await store.saveNote()).assertTrue();
        store.setDraftTitle('第二篇');
        expect(await store.saveNote()).assertTrue();
        const snapshot: BusinessSnapshot = store.snapshot();
        const firstId: string = snapshot.notes[0].id;
        const secondId: string = snapshot.notes[1].id;

        store.beginEditNote(firstId);
        store.setDraftTitle('修改中');
        store.beginEditNote(secondId);
        expect(store.snapshot().editingNoteId).assertEqual(firstId);
        expect(store.snapshot().error.length > 0).assertTrue();
        expect(await store.keepDraft()).assertFalse();
        const writes: number = storage.writeCount;
        expect(await store.saveNote()).assertTrue();
        expect(storage.writeCount).assertEqual(writes + 1);
        store.beginEditNote(firstId);
        const unchangedWrites: number = storage.writeCount;
        expect(await store.saveNote()).assertTrue();
        expect(storage.writeCount).assertEqual(unchangedWrites);
        expect(store.snapshot().message).assertEqual('内容未变化');

        store.setDraftTitle('放弃的修改');
        store.cancelEdit();
        expect(store.snapshot().editingNoteId).assertEqual('');
        expect(store.snapshot().draftTitle).assertEqual('');
        expect(store.snapshot().draftDirty).assertFalse();
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

    it('testNoteEditingAndHistory0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = '{"version":1,"notes":[{"id":"a","title":"t","body":"b","createdAt":1}],' +
          '"draftTitle":"","draftBody":"","todoDays":[],' +
          '"noteHistory":[{"revisionId":"r1","noteId":"missing","title":"t","body":"b","savedAt":1,"action":"edit"}]}';
        const broken = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(broken.snapshot().ready).assertFalse();
        expect(broken.snapshot().notes.length).assertEqual(0);
        expect(io.writes).assertEqual(0);

        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('待删');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('待删二');
        expect(await store.saveNote()).assertTrue();
        expect(store.historyFor(id).length).assertEqual(2);
        expect(await store.deleteNote(id)).assertTrue();
        expect(store.snapshot().notes.length).assertEqual(0);
        expect(store.historyFor(id).length).assertEqual(0);
        expect(storage.value.indexOf('noteHistory') >= 0).assertTrue();
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

    it('testNoteEditingAndHistory0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = '{"version":1,"notes":[{"id":"legacy","title":"旧数据","body":"正文","createdAt":1}],' +
          '"draftTitle":"","draftBody":"","todoDays":[]}';
        const migrated = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(migrated.snapshot().ready).assertTrue();
        expect(migrated.snapshot().notes.length).assertEqual(1);
        expect(migrated.historyFor('legacy').length).assertEqual(0);
        migrated.beginEditNote('legacy');
        migrated.setDraftBody('修改后');
        expect(await migrated.saveNote()).assertTrue();
        expect(migrated.historyFor('legacy').length).assertEqual(1);
        expect(io.writes).assertEqual(1);

        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('基础');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        for (let index = 0; index < 105; index++) {
          store.beginEditNote(id);
          store.setDraftBody(`版本 ${index}`);
          expect(await store.saveNote()).assertTrue();
        }
        const history: NoteRevision[] = store.historyFor(id);
        expect(history.length).assertEqual(100);
        expect(history[0].body).assertEqual('版本 103');
        expect(history[99].body).assertEqual('版本 4');
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

    it('testNoteEditingAndHistory0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('离开测试');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;

        store.beginEditNote(id);
        store.setDraftTitle('保存后离开');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        expect(await store.persistForLeave()).assertTrue();
        expect(store.snapshot().notes[0].title).assertEqual('保存后离开');
        expect(store.snapshot().editingNoteId).assertEqual('');
        expect(store.hasUnsavedNoteWork()).assertFalse();

        store.beginEditNote(id);
        store.setDraftTitle('放弃的修改');
        expect(await store.discardForLeave()).assertTrue();
        expect(store.snapshot().notes[0].title).assertEqual('保存后离开');
        expect(store.snapshot().editingNoteId).assertEqual('');
        expect(store.hasUnsavedNoteWork()).assertFalse();

        store.setDraftTitle('新草稿');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        expect(await store.persistForLeave()).assertTrue();
        expect(store.snapshot().draftKept).assertTrue();
        expect(store.snapshot().notes.length).assertEqual(1);
        expect(store.hasUnsavedNoteWork()).assertFalse();
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

    it('testNoteEditingAndHistory0007', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(store.snapshot().todos.length).assertEqual(3);
        expect(await store.addTodo('  新增任务  ')).assertTrue();
        expect(store.snapshot().todos.length).assertEqual(4);
        const added = store.snapshot().todos[3];
        expect(added.title).assertEqual('新增任务');
        expect(await store.addTodo('')).assertFalse();
        expect(await store.addTodo('x'.repeat(61))).assertFalse();
        expect(store.snapshot().todos.length).assertEqual(4);

        expect(await store.setTodoDone(added.id, true)).assertTrue();
        store.setTodoFilter('已完成');
        expect(store.snapshot().visibleTodos.length).assertEqual(1);
        expect(store.snapshot().visibleTodos[0].id).assertEqual(added.id);
        store.setTodoFilter('未完成');
        expect(store.snapshot().visibleTodos.length).assertEqual(3);
        store.setTodoFilter('全部');
        expect(store.snapshot().visibleTodos.length).assertEqual(4);

        expect(await store.updateTodo(added.id, '改后的任务')).assertTrue();
        expect(store.snapshot().todos[3].title).assertEqual('改后的任务');
        expect(await store.deleteTodo(added.id)).assertTrue();
        expect(store.snapshot().todos.length).assertEqual(3);
        expect(await store.deleteTodo(store.snapshot().todos[0].id)).assertTrue();
        expect(await store.deleteTodo(store.snapshot().todos[0].id)).assertTrue();
        expect(await store.deleteTodo(store.snapshot().todos[0].id)).assertFalse();
        expect(store.snapshot().todos.length).assertEqual(1);
        expect(store.errorText()).assertEqual('至少保留一项待办');
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

    it('testNoteEditingAndHistory0008', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(store.snapshot().favoriteIds.length).assertEqual(0);
        expect(await store.toggleFavorite('planning')).assertTrue();
        expect(await store.toggleFavorite('reading')).assertTrue();
        expect(store.snapshot().favoriteIds.length).assertEqual(2);
        store.setFavoritesOnly(true);
        expect(store.snapshot().visibleCollections.length).assertEqual(2);
        store.setCollectionCategory('效率');
        expect(store.snapshot().visibleCollections.length).assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id).assertEqual('planning');
        store.setCollectionCategory('全部');
        store.setCollectionQuery('摘录');
        expect(store.snapshot().visibleCollections.length).assertEqual(1);
        expect(store.snapshot().visibleCollections[0].id).assertEqual('reading');
        store.setCollectionQuery('');
        expect(await store.toggleFavorite('planning')).assertTrue();
        expect(store.snapshot().visibleCollections.length).assertEqual(1);
        expect(await store.toggleFavorite('missing')).assertFalse();
        expect(store.errorText()).assertEqual('收藏内容不存在');

        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().favoriteIds.length).assertEqual(1);
        expect(reopened.snapshot().favoriteIds[0]).assertEqual('reading');
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


    it('testNoteEditingAndHistory0009', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('原便签');
        store.setDraftBody('正文');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立新草稿');
        expect(await store.keepDraft()).assertTrue();
        store.beginEditNote(id);
        store.setDraftBody('正文');
        expect(store.hasUnsavedNoteWork()).assertFalse();
        store.setDraftTitle('独立新草稿');
        store.setDraftBody('');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        store.setDraftTitle('原便签');
        store.setDraftBody('正文');
        expect(store.hasUnsavedNoteWork()).assertFalse();
        store.setDraftTitle('已更新');
        expect(await store.saveNote()).assertTrue();
        expect(store.snapshot().draftTitle).assertEqual('独立新草稿');
        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().draftTitle).assertEqual('独立新草稿');
        expect(reopened.snapshot().notes[0].title).assertEqual('已更新');
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


    it('testNoteEditingAndHistory0010', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('便签A');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立草稿B');
        expect(await store.keepDraft()).assertTrue();
        const writes: number = storage.writeCount;
        store.beginEditNote(id);
        expect(await store.discardDraft()).assertTrue();
        expect(store.snapshot().editingNoteId).assertEqual(id);
        expect(store.snapshot().draftTitle).assertEqual('');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        expect(store.snapshot().notes[0].title).assertEqual('便签A');
        expect(storage.writeCount).assertEqual(writes);
        store.cancelEdit();
        expect(store.snapshot().draftTitle).assertEqual('独立草稿B');
        store.dispose();
        const reopened = await startBusiness(scope, storage, new FixedBusinessClock());
        expect(reopened.snapshot().draftTitle).assertEqual('独立草稿B');
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

    it('testNoteEditingAndHistory0011', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('可保存');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        storage.failNextWrite = true;
        store.beginEditNote(id);
        store.setDraftTitle('保存失败');
        expect(await store.persistForLeave()).assertFalse();
        expect(store.snapshot().editingNoteId).assertEqual(id);
        expect(store.snapshot().draftTitle).assertEqual('保存失败');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        expect(store.errorText().length > 0).assertTrue();
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


    it('testNoteEditingAndHistory0012', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('原始');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('编辑中');
        expect(await store.keepEditDraft()).assertTrue();
        expect(store.snapshot().editDraftPersisted).assertTrue();
        expect(store.hasUnsavedNoteWork()).assertFalse();
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId).assertEqual(id);
        expect(reopened.snapshot().draftTitle).assertEqual('编辑中');
        expect(reopened.hasUnsavedNoteWork()).assertTrue();
        expect(reopened.snapshot().editDraftPersisted).assertTrue();
        expect(await reopened.saveNote()).assertTrue();
        expect(reopened.snapshot().notes[0].title).assertEqual('编辑中');
        expect(reopened.snapshot().editDraftPersisted).assertFalse();
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


    it('testNoteEditingAndHistory0013', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('便签A');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.setDraftTitle('独立草稿B');
        expect(await store.keepDraft()).assertTrue();
        store.beginEditNote(id);
        store.setDraftTitle('A的编辑');
        expect(await store.keepEditDraft()).assertTrue();
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId).assertEqual(id);
        expect(reopened.snapshot().draftTitle).assertEqual('A的编辑');
        expect(reopened.snapshot().notes[0].title).assertEqual('便签A');
        reopened.cancelEdit();
        await scope.until(() => !reopened.snapshot().busy, (changed: () => void): (() => void) => {
          reopened.subscribe(changed); return (): void => { reopened.unsubscribe(changed); };
        });
        expect(reopened.snapshot().draftTitle).assertEqual('独立草稿B');
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


    it('testNoteEditingAndHistory0014', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store = await startBusiness(scope, storage, clock);
        store.setDraftTitle('要编辑');
        expect(await store.saveNote()).assertTrue();
        const id: string = store.snapshot().notes[0].id;
        store.beginEditNote(id);
        store.setDraftTitle('草稿');
        expect(await store.keepEditDraft()).assertTrue();
        store.cancelEdit();
        await scope.until(() => !store.snapshot().busy, (changed: () => void): (() => void) => {
          store.subscribe(changed); return (): void => { store.unsubscribe(changed); };
        });
        store.dispose();
        const reopened = await startBusiness(scope, storage, clock);
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect(reopened.snapshot().draftTitle).assertEqual('');
        expect(reopened.hasUnsavedNoteWork()).assertFalse();
      });
    });
  });
}
