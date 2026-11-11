import { preferences } from '@kit.ArkData';
import { describe, expect, it } from '@ohos/hypium';
import { BusinessStore, NoteItem, NoteRevision, StoredData } from '../../../main/ets/business/BusinessStore';
import { BusinessWriteError, PreferencesBusinessStorage } from '../../../main/ets/business/BusinessStorage';
import { MAX_ACTIVE_NOTES, MAX_RECYCLED_NOTES, MAX_WORKSPACE_BYTES, MAX_WORKSPACE_HISTORY,
  NOTE_RECYCLE_RETENTION_MS,
  TrashCleanupResult, TrashEditDecision } from '../../../main/ets/business/NoteRecyclePolicy';
import {
  NativeCommitAcknowledgementFault, RecycleNativeQaFixture, withRecycleNativeQa
} from '../support/RecycleNativeQaSupport';

// NativeOnly: the owner must skip this suite before invoking its describe callback on host.
export default function recycleNativeQaTests(): void {
  describe('RecycleNativeQa', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0100
     * @tc.name testRecycleNativeQa0001
     * @tc.desc 回收移动真实flush后重新打开同时保留另一便签与原便签修订
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0001', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const target: NoteItem = await f.save(store, '需要归回', '中文\n第二行 😀');
        const survivor: NoteItem = await f.save(store, '仍在列表', '未删除正文');
        const originalHistory: NoteRevision[] = store.historyFor(target.id);
        expect(await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.map((note: NoteItem): string => note.id).join(',')).assertEqual(survivor.id);
        expect(reopened.snapshot().recycledNotes[0].note.body).assertEqual('中文\n第二行 😀');
        expect(reopened.snapshot().recycledNotes[0].history[0].revisionId).assertEqual(originalHistory[0].revisionId);
        expect(reopened.historyFor(target.id).length).assertEqual(0);
        const disk: StoredData = await f.readDocument();
        expect(disk.recycleBin[0].note.id).assertEqual(target.id);
        expect(disk.version).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0200
     * @tc.name testRecycleNativeQa0002
     * @tc.desc 回收后重开恢复正文及编辑历史并将恢复结果再次持久化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0002', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const target: NoteItem = await f.save(store, '旧标题', '旧正文');
        f.time += 10;
        store.beginEditNote(target.id);
        store.setDraftTitle('修订标题');
        store.setDraftBody('保存过的第二版');
        expect(await store.saveNote()).assertTrue();
        const historyIds: string = store.historyFor(target.id)
          .map((row: NoteRevision): string => row.revisionId).join(',');
        expect(await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION)).assertTrue();
        const middle: BusinessStore = await f.reopen();
        const trashId: string = middle.snapshot().recycledNotes[0].trashId;
        expect(await middle.restoreTrashedNote(trashId)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes[0].body).assertEqual('保存过的第二版');
        expect(reopened.historyFor(target.id).map((row: NoteRevision): string => row.revisionId).join(','))
          .assertEqual(historyIds);
        expect(reopened.snapshot().recycledNotes.length).assertEqual(0);
        expect((await f.readDocument()).notes[0].id).assertEqual(target.id);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0300
     * @tc.name testRecycleNativeQa0003
     * @tc.desc 永久删除仅清除指定回收项不删除另一回收项与收藏待办
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0003', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const first: NoteItem = await f.save(store, '永久删除目标', '只有它应消失');
        const second: NoteItem = await f.save(store, '仍可恢复', '保留关联历史');
        await store.toggleFavorite('planning');
        await store.addTodo('回收操作不影响待办');
        await store.moveNoteToTrash(first.id, TrashEditDecision.REQUIRE_DECISION);
        await store.moveNoteToTrash(second.id, TrashEditDecision.REQUIRE_DECISION);
        const firstTrash = store.snapshot().recycledNotes.find((row): boolean => row.note.id === first.id);
        if (firstTrash === undefined) { throw new Error('Target trash was not created'); }
        expect(await store.purgeTrashedNote(firstTrash.trashId)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes.map((row): string => row.note.id).join(',')).assertEqual(second.id);
        expect(reopened.snapshot().recycledNotes[0].history[0].noteId).assertEqual(second.id);
        expect(reopened.snapshot().favoriteIds.join(',')).assertEqual('planning');
        expect(reopened.snapshot().todos.some((row): boolean => row.title === '回收操作不影响待办')).assertTrue();
        expect(await reopened.restoreTrashedNote(firstTrash.trashId)).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0400
     * @tc.name testRecycleNativeQa0004
     * @tc.desc 显式过期清理只删除超过期限的项且清理提交在重开后可见
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0004', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const expired: NoteItem = await f.save(store, '过期回收项', '应被显式清理');
        await store.moveNoteToTrash(expired.id, TrashEditDecision.REQUIRE_DECISION);
        f.time += NOTE_RECYCLE_RETENTION_MS;
        const boundary: NoteItem = await f.save(store, '边界新回收项', '不应被清理');
        await store.moveNoteToTrash(boundary.id, TrashEditDecision.REQUIRE_DECISION);
        f.time++;
        const loaded: BusinessStore = await f.reopen();
        expect(loaded.snapshot().expiredTrashCount).assertEqual(1);
        expect(loaded.snapshot().recycledNotes.length).assertEqual(2);
        const result: TrashCleanupResult = await loaded.purgeExpiredNotes();
        expect(result.success).assertTrue();
        expect(result.removed).assertEqual(1);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.id).assertEqual(boundary.id);
        expect(reopened.snapshot().expiredTrashCount).assertEqual(0);
        expect((await f.readDocument()).noteHistory.some(
          (row: NoteRevision): boolean => row.noteId === expired.id)).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0500
     * @tc.name testRecycleNativeQa0005
     * @tc.desc 期限恰好相等仍可恢复并且时钟回退不会把新回收项判过期
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0005', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '临界恢复', '保留完整正文');
        await store.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION);
        const deletedAt: number = f.time;
        f.time += NOTE_RECYCLE_RETENTION_MS;
        const boundary: BusinessStore = await f.reopen();
        expect(boundary.snapshot().expiredTrashCount).assertEqual(0);
        const cleanup: TrashCleanupResult = await boundary.purgeExpiredNotes();
        expect(cleanup.removed).assertEqual(0);
        f.time = deletedAt - 100;
        const backwards: BusinessStore = await f.reopen();
        expect(backwards.snapshot().expiredTrashCount).assertEqual(0);
        expect(await backwards.restoreTrashedNote(backwards.snapshot().recycledNotes[0].trashId)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes[0].body).assertEqual('保留完整正文');
        expect(reopened.snapshot().recycledNotes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0600
     * @tc.name testRecycleNativeQa0006
     * @tc.desc 编辑便签选择保留修改再回收会落盘编辑内容并清除恢复编辑指针
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0006', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '保存正文', '基线');
        store.beginEditNote(note.id);
        store.setDraftTitle('删除时保留编辑');
        store.setDraftBody('尚未点保存的正文');
        await store.keepEditDraft();
        expect(await store.moveNoteToTrash(note.id, TrashEditDecision.KEEP_CHANGES)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.body).assertEqual('尚未点保存的正文');
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect(reopened.snapshot().editDraftPersisted).assertFalse();
        expect(reopened.snapshot().recycledNotes[0].history.some((row: NoteRevision): boolean =>
          row.action === 'edit' && row.body === '基线')).assertTrue();
        expect((await f.readDocument()).notes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0700
     * @tc.name testRecycleNativeQa0007
     * @tc.desc 放弃编辑回收保留旧正文且重开不会复活已保留的编辑草稿
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0007', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '原始标题', '已保存原文');
        const revision: string = store.historyFor(note.id)[0].revisionId;
        store.beginEditNote(note.id);
        store.setDraftBody('明确放弃的编辑');
        await store.keepEditDraft();
        expect(await store.moveNoteToTrash(note.id, TrashEditDecision.DISCARD_CHANGES)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.body).assertEqual('已保存原文');
        expect(reopened.snapshot().recycledNotes[0].history
          .map((row: NoteRevision): string => row.revisionId).join(',')).assertEqual(revision);
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect((await f.readDocument()).editBody).assertEqual('');
        expect(await reopened.restoreTrashedNote(reopened.snapshot().recycledNotes[0].trashId)).assertTrue();
        const restored: BusinessStore = await f.reopen();
        expect(restored.snapshot().notes[0].body).assertEqual('已保存原文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0800
     * @tc.name testRecycleNativeQa0008
     * @tc.desc 取消回收不改变真实存档且未保存的编辑仍可继续保存
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0008', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '取消回收目标', '原文');
        const before: string = await f.readRaw();
        store.beginEditNote(note.id);
        store.setDraftBody('取消之后继续编辑');
        expect(await store.moveNoteToTrash(note.id, TrashEditDecision.CANCEL)).assertFalse();
        expect(await f.readRaw()).assertEqual(before);
        expect(store.snapshot().draftBody).assertEqual('取消之后继续编辑');
        expect(store.snapshot().editingNoteId).assertEqual(note.id);
        expect(await store.saveNote()).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes[0].body).assertEqual('取消之后继续编辑');
        expect(reopened.snapshot().recycledNotes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_0900
     * @tc.name testRecycleNativeQa0009
     * @tc.desc 合法旧版本真实读取不重写而首次回收原子写成完整新版本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0009', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const initial: BusinessStore = await f.open();
        const note: NoteItem = await f.save(initial, '旧存档便签', '旧用户正文');
        const document: StoredData = await f.readDocument();
        document.version = 1;
        const legacy: string = JSON.stringify(document);
        await f.seed(legacy);
        const migrated: BusinessStore = await f.open();
        expect(migrated.snapshot().notes[0].id).assertEqual(note.id);
        expect(await f.readRaw()).assertEqual(legacy);
        expect(migrated.snapshot().recycledNotes.length).assertEqual(0);
        expect(await migrated.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION)).assertTrue();
        const upgraded: StoredData = await f.readDocument();
        expect(upgraded.version).assertEqual(2);
        expect(upgraded.recycleBin[0].note.body).assertEqual('旧用户正文');
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].history[0].noteId).assertEqual(note.id);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1000
     * @tc.name testRecycleNativeQa0010
     * @tc.desc 未来schema拒绝初始化和写入并原样保留直到合法存档被显式恢复
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0010', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const original: BusinessStore = await f.open();
        const note: NoteItem = await f.save(original, '升级应用的正文', '不可覆盖');
        const good: string = await f.readRaw();
        const futureDocument: StoredData = await f.readDocument();
        futureDocument.version = 999;
        const future: string = JSON.stringify(futureDocument);
        await f.seed(future);
        const rejected: BusinessStore = await f.open();
        expect(rejected.snapshot().ready).assertFalse();
        expect(await rejected.saveNote()).assertFalse();
        expect(await f.readRaw()).assertEqual(future);
        expect(rejected.snapshot().notes.length).assertEqual(0);
        await f.seed(good);
        const recovered: BusinessStore = await f.open();
        expect(recovered.snapshot().ready).assertTrue();
        expect(recovered.snapshot().notes[0].id).assertEqual(note.id);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1100
     * @tc.name testRecycleNativeQa0011
     * @tc.desc 原生workspace类型异常保留原值与同命名空间旁路键不静默重置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0011', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        await f.seed(42);
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('qa-sentinel', 'only-this-test');
        await nativeStore.flush();
        const store: BusinessStore = await f.open();
        expect(store.snapshot().ready).assertFalse();
        expect(await store.purgeTrashedNote('trash-1')).assertFalse();
        expect(await nativeStore.get('workspace', '')).assertEqual(42);
        expect(await nativeStore.get('qa-sentinel', '')).assertEqual('only-this-test');
        expect(store.snapshot().recycledNotes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1200
     * @tc.name testRecycleNativeQa0012
     * @tc.desc 活跃容量已满时恢复不丢回收项释放槽位后可真正恢复并重开
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0012', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const recycled: NoteItem = await f.save(store, '等待空位', '容量恢复正文');
        await store.moveNoteToTrash(recycled.id, TrashEditDecision.REQUIRE_DECISION);
        const trashId: string = store.snapshot().recycledNotes[0].trashId;
        for (let index: number = 0; index < MAX_ACTIVE_NOTES; index++) {
          f.time++;
          await f.save(store, `占用活跃槽位-${index}`, `各槽位独立正文-${index}`);
        }
        const fullRaw: string = await f.readRaw();
        expect(await store.restoreTrashedNote(trashId)).assertFalse();
        expect(await f.readRaw()).assertEqual(fullRaw);
        expect(store.snapshot().recycledNotes[0].note.id).assertEqual(recycled.id);
        const victimId: string = store.snapshot().notes[0].id;
        expect(await store.moveNoteToTrash(victimId, TrashEditDecision.REQUIRE_DECISION)).assertTrue();
        expect(await store.restoreTrashedNote(trashId)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.some((row: NoteItem): boolean => row.id === recycled.id)).assertTrue();
        expect(reopened.snapshot().recycledNotes.map((row): string => row.note.id).join(',')).assertEqual(victimId);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1300
     * @tc.name testRecycleNativeQa0013
     * @tc.desc 回收容量满时移动不挤出旧项清理一个后可继续且token不复用
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0013', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        for (let index: number = 0; index < MAX_RECYCLED_NOTES; index++) {
          f.time++;
          const note: NoteItem = await f.save(store, `占用回收槽位-${index}`, `仍可恢复-${index}`);
          if (!await store.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION)) {
            throw new Error('Failed to populate the real recycle capacity');
          }
        }
        const pending: NoteItem = await f.save(store, '容量拒绝目标', '不可静默丢弃');
        const before: string = await f.readRaw();
        expect(await store.moveNoteToTrash(pending.id, TrashEditDecision.REQUIRE_DECISION)).assertFalse();
        expect(await f.readRaw()).assertEqual(before);
        expect(store.snapshot().notes[0].id).assertEqual(pending.id);
        const staleId: string = store.snapshot().recycledNotes[0].trashId;
        expect(await store.purgeTrashedNote(staleId)).assertTrue();
        expect(await store.moveNoteToTrash(pending.id, TrashEditDecision.REQUIRE_DECISION)).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(await reopened.restoreTrashedNote(staleId)).assertFalse();
        expect(reopened.snapshot().recycledNotes.some((row): boolean => row.note.id === pending.id)).assertTrue();
        expect(reopened.snapshot().notes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1400
     * @tc.name testRecycleNativeQa0014
     * @tc.desc 两个专用命名空间回收清理互不影响且一方删除不影响另一方重开
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0014', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (left: RecycleNativeQaFixture): Promise<void> => {
        const a: BusinessStore = await left.open();
        const first: NoteItem = await left.save(a, '左命名空间', '只属于左侧');
        await a.moveNoteToTrash(first.id, TrashEditDecision.REQUIRE_DECISION);
        await withRecycleNativeQa(async (right: RecycleNativeQaFixture): Promise<void> => {
          const b: BusinessStore = await right.open();
          expect(b.snapshot().recycledNotes.length).assertEqual(0);
          const second: NoteItem = await right.save(b, '右命名空间', '只属于右侧');
          await b.moveNoteToTrash(second.id, TrashEditDecision.REQUIRE_DECISION);
          await a.purgeTrashedNote(a.snapshot().recycledNotes[0].trashId);
          const reopenedRight: BusinessStore = await right.reopen();
          expect(reopenedRight.snapshot().recycledNotes[0].note.body).assertEqual('只属于右侧');
          expect((await left.readDocument()).recycleBin.length).assertEqual(0);
        });
        const reopenedLeft: BusinessStore = await left.reopen();
        expect(reopenedLeft.snapshot().recycledNotes.length).assertEqual(0);
        expect(reopenedLeft.snapshot().notes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1500
     * @tc.name testRecycleNativeQa0015
     * @tc.desc reload重新绑定真实缓存实例后继续写入并保留同空间无关键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0015', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const adapter: PreferencesBusinessStorage = new PreferencesBusinessStorage(f.namespace);
        expect(await adapter.read(f.context)).assertEqual('');
        await adapter.write('first-flushed-value');
        expect(await adapter.reload(f.context)).assertEqual('first-flushed-value');
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('qa-unrelated-key', 'must-survive');
        await nativeStore.flush();
        await adapter.write('second-flushed-value');
        expect(await adapter.reload(f.context)).assertEqual('second-flushed-value');
        const reopenedNative: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        expect(await reopenedNative.get('qa-unrelated-key', '')).assertEqual('must-survive');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1600
     * @tc.name testRecycleNativeQa0016
     * @tc.desc SDK真实拒绝超长值后正式adapter标记不确定且reload可继续有效写入
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0016', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const adapter: PreferencesBusinessStorage = new PreferencesBusinessStorage(f.namespace);
        await adapter.read(f.context);
        await adapter.write('confirmed-before-native-rejection');
        const failures: BusinessWriteError[] = [];
        try {
          await adapter.write('x'.repeat(preferences.MAX_VALUE_LENGTH + 1));
        } catch (error) {
          failures.push(error as BusinessWriteError);
        }
        expect(failures.length).assertEqual(1);
        expect(failures[0].uncertain).assertTrue();
        expect(await adapter.reload(f.context)).assertEqual('confirmed-before-native-rejection');
        await adapter.write('confirmed-after-reload');
        expect(await adapter.reload(f.context)).assertEqual('confirmed-after-reload');
      });
    });
    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1700
     * @tc.name testRecycleNativeQa0017
     * @tc.desc 超预算原文的新版本只读拒绝旧版本可读且实际回收后压实升级不丢正文
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0017', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const original: BusinessStore = await f.open();
        const note: NoteItem = await f.save(original, '大原文兼容', '真实正文而非填充内容');
        const document: StoredData = await f.readDocument();
        const padding: string = ' '.repeat(MAX_WORKSPACE_BYTES);
        const oversizedCurrent: string = JSON.stringify(document) + padding;
        f.mark('seventeen-current-seed-start');
        await f.seed(oversizedCurrent);
        f.mark('seventeen-current-seed-complete');
        const rejected: BusinessStore = await f.open();
        f.mark('seventeen-current-load-complete');
        expect(rejected.snapshot().ready).assertFalse();
        // Compare every code unit, but do not make Hypium format two entire 8MiB values on success.
        expect((await f.readRaw()) === oversizedCurrent).assertTrue();
        f.mark('seventeen-current-preservation-asserted');
        document.version = 1;
        const oversizedLegacy: string = JSON.stringify(document) + padding;
        await f.seed(oversizedLegacy);
        f.mark('seventeen-legacy-seed-complete');
        const legacy: BusinessStore = await f.open();
        f.mark('seventeen-legacy-load-complete');
        expect(legacy.snapshot().notes[0].id).assertEqual(note.id);
        expect((await f.readRaw()) === oversizedLegacy).assertTrue();
        f.mark('seventeen-legacy-preservation-asserted');
        expect(await legacy.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION)).assertTrue();
        f.mark('seventeen-upgrade-committed');
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.body).assertEqual('真实正文而非填充内容');
        expect((await f.readDocument()).version).assertEqual(2);
        expect((await f.readRaw()).length < MAX_WORKSPACE_BYTES).assertTrue();
        f.mark('seventeen-cold-reopen-validated');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1800
     * @tc.name testRecycleNativeQa0018
     * @tc.desc 活跃加回收历史共用容量实际编辑仅淘汰最老回收修订并持久保留全部便签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0018', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const original: BusinessStore = await f.open();
        const archived: NoteItem = await f.save(original, '拥有旧修订的回收项', '回收正文仍要完整');
        await original.moveNoteToTrash(archived.id, TrashEditDecision.REQUIRE_DECISION);
        const active: NoteItem = await f.save(original, '仍在编辑的便签', '编辑前正文');
        const document: StoredData = await f.readDocument();
        document.recycleBin[0].history = [];
        for (let index: number = 0; index < MAX_WORKSPACE_HISTORY - 1; index++) {
          document.recycleBin[0].history.push(new NoteRevision(`qa-bin-history-${index}`, archived.id,
            `既有修订-${index}`, `可恢复的历史正文-${index}`, f.time - index - 1, 'edit'));
        }
        await f.seed(JSON.stringify(document));
        const loaded: BusinessStore = await f.open();
        f.time += 100;
        loaded.beginEditNote(active.id);
        loaded.setDraftBody('新增修订后的正文');
        expect(await loaded.saveNote()).assertTrue();
        const reopened: BusinessStore = await f.reopen();
        const disk: StoredData = await f.readDocument();
        expect(disk.noteHistory.length + disk.recycleBin[0].history.length).assertEqual(MAX_WORKSPACE_HISTORY);
        expect(disk.recycleBin[0].history.some((row: NoteRevision): boolean =>
          row.revisionId === `qa-bin-history-${MAX_WORKSPACE_HISTORY - 2}`)).assertFalse();
        expect(reopened.historyFor(active.id).some((row: NoteRevision): boolean => row.body === '编辑前正文')).assertTrue();
        expect(reopened.snapshot().notes[0].body).assertEqual('新增修订后的正文');
        expect(reopened.snapshot().recycledNotes[0].note.body).assertEqual('回收正文仍要完整');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_1900
     * @tc.name testRecycleNativeQa0019
     * @tc.desc dispose不发布旧代次保存结果但实际原生写结算后新实例能恢复已提交正文
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0019', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        store.setDraftTitle('离开时的真实写入');
        store.setDraftBody('等待Preferences实际flush后读取');
        f.mark('nineteen-save-start');
        const pending: Promise<boolean> = store.saveNote();
        store.dispose();
        f.mark('nineteen-disposed-with-write-pending');
        await store.whenStorageIdle();
        f.mark('nineteen-native-write-settled');
        expect(await pending).assertFalse();
        expect(store.snapshot().ready).assertFalse();
        expect(store.snapshot().notes.length).assertEqual(0);
        const reopened: BusinessStore = await f.reopen();
        f.mark('nineteen-cold-reopen-complete');
        expect(reopened.snapshot().notes[0].body).assertEqual('等待Preferences实际flush后读取');
        expect(reopened.snapshot().storageRecoveryRequired).assertFalse();
        expect((await f.readDocument()).notes[0].title).assertEqual('离开时的真实写入');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_2000
     * @tc.name testRecycleNativeQa0020
     * @tc.desc 真实flush后故障注入仅重读确认回收候选一次不盲目重放也不污染其它业务
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0020', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const fault: NativeCommitAcknowledgementFault = new NativeCommitAcknowledgementFault(f.namespace);
        const store: BusinessStore = await f.openUsing(fault);
        const target: NoteItem = await f.save(store, '结果不确定的移动', '磁盘已提交候选');
        const survivor: NoteItem = await f.save(store, '其它便签', '不可受影响');
        await store.toggleFavorite('reading');
        await store.addTodo('保留待办业务');
        fault.arm();
        expect(await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION)).assertFalse();
        expect(store.snapshot().storageRecoveryRequired).assertTrue();
        expect(store.snapshot().notes.some((row: NoteItem): boolean => row.id === target.id)).assertTrue();
        expect((await f.readDocument()).recycleBin[0].note.id).assertEqual(target.id);
        const writes: number = fault.writes;
        expect(await store.recoverStorage()).assertTrue();
        expect(store.snapshot().notes.map((row: NoteItem): string => row.id).join(',')).assertEqual(survivor.id);
        expect(store.snapshot().favoriteIds.join(',')).assertEqual('reading');
        expect(store.snapshot().todos.some((row): boolean => row.title === '保留待办业务')).assertTrue();
        expect(await store.recoverStorage()).assertTrue();
        expect(fault.reloads).assertEqual(1);
        expect(fault.writes).assertEqual(writes);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes.map((row): string => row.note.id).join(',')).assertEqual(target.id);
        expect(reopened.snapshot().storageRecoveryRequired).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_2100
     * @tc.name testRecycleNativeQa0021
     * @tc.desc 提交后故障注入遇其它有效或损坏文档保持隔离只有精确候选重现才恢复
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0021', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const fault: NativeCommitAcknowledgementFault = new NativeCommitAcknowledgementFault(f.namespace);
        const store: BusinessStore = await f.openUsing(fault);
        const target: NoteItem = await f.save(store, '故障后待核对', '原始正文');
        fault.arm();
        await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION);
        const candidate: string = await f.readRaw();
        const foreign: StoredData = await f.readDocument();
        foreign.recycleBin[0].note.body = '另一个写入者的正文';
        const foreignRaw: string = JSON.stringify(foreign);
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('workspace', foreignRaw);
        await nativeStore.flush();
        const writes: number = fault.writes;
        expect(await store.recoverStorage()).assertFalse();
        expect(store.snapshot().storageRecoveryRequired).assertTrue();
        expect(await store.purgeTrashedNote('trash-1')).assertFalse();
        expect(await f.readRaw()).assertEqual(foreignRaw);
        // recoverStorage invalidated the previous native handle; obtain a fresh one before each edit.
        const damagedStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await damagedStore.put('workspace', '{qa-broken-document');
        await damagedStore.flush();
        expect(await store.recoverStorage()).assertFalse();
        expect(store.snapshot().notes[0].body).assertEqual('原始正文');
        const repairedStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await repairedStore.put('workspace', candidate);
        await repairedStore.flush();
        expect(await store.recoverStorage()).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('原始正文');
        expect(fault.writes).assertEqual(writes);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.length).assertEqual(0);
        expect(reopened.snapshot().recycledNotes[0].note.id).assertEqual(target.id);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_2200
     * @tc.name testRecycleNativeQa0022
     * @tc.desc 提交后故障与专用原文回退注入核对旧版本仅解除隔离保留草稿待显式重试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testRecycleNativeQa0022', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const fault: NativeCommitAcknowledgementFault = new NativeCommitAcknowledgementFault(f.namespace);
        const store: BusinessStore = await f.openUsing(fault);
        const survivor: NoteItem = await f.save(store, '确认过的便签', '稳定原文');
        const before: string = await f.readRaw();
        store.setDraftTitle('等待显式重试');
        store.setDraftBody('核对旧文档不能清掉这个草稿');
        fault.arm();
        expect(await store.saveNote()).assertFalse();
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('workspace', before);
        await nativeStore.flush();
        const writes: number = fault.writes;
        expect(await store.recoverStorage()).assertTrue();
        expect(store.snapshot().notes.map((row: NoteItem): string => row.id).join(',')).assertEqual(survivor.id);
        expect(store.snapshot().draftBody).assertEqual('核对旧文档不能清掉这个草稿');
        expect(store.snapshot().storageRecoveryRequired).assertFalse();
        expect(fault.writes).assertEqual(writes);
        expect(await store.saveNote()).assertTrue();
        expect(fault.writes).assertEqual(writes + 1);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.length).assertEqual(2);
        expect(reopened.snapshot().notes.some((row: NoteItem): boolean => row.body === '核对旧文档不能清掉这个草稿')).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLE_NATIVE_QA_2300
     * @tc.name testRecycleNativeQa0023
     * @tc.desc 活跃与回收项标识冲突的损坏存档整体拒绝不自作主张丢弃任意一方
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecycleNativeQa0023', 0, async (): Promise<void> => {
      await withRecycleNativeQa(async (f: RecycleNativeQaFixture): Promise<void> => {
        const original: BusinessStore = await f.open();
        const recycled: NoteItem = await f.save(original, '回收内容不可丢', '回收原文');
        await original.moveNoteToTrash(recycled.id, TrashEditDecision.REQUIRE_DECISION);
        const active: NoteItem = await f.save(original, '活跃内容不可丢', '活跃原文');
        const good: string = await f.readRaw();
        const broken: StoredData = await f.readDocument();
        broken.recycleBin[0].note.id = active.id;
        broken.recycleBin[0].history.forEach((row: NoteRevision): void => { row.noteId = active.id; });
        const badRaw: string = JSON.stringify(broken);
        await f.seed(badRaw);
        const rejected: BusinessStore = await f.open();
        expect(rejected.snapshot().ready).assertFalse();
        expect((await rejected.purgeExpiredNotes()).success).assertFalse();
        expect(await f.readRaw()).assertEqual(badRaw);
        await f.seed(good);
        const recovered: BusinessStore = await f.open();
        expect(recovered.snapshot().notes[0].body).assertEqual('活跃原文');
        expect(recovered.snapshot().recycledNotes[0].note.body).assertEqual('回收原文');
        expect(recovered.snapshot().recycledNotes[0].history[0].noteId).assertEqual(recycled.id);
      });
    });
  });
}
