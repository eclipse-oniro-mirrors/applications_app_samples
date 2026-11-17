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

import { preferences } from '@kit.ArkData';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
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
    it(caseName('RecycleNativeQa', '0001'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0001'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const target: NoteItem = await f.save(store, '需要归回', '中文\n第二行 😀');
        const survivor: NoteItem = await f.save(store, '仍在列表', '未删除正文');
        const originalHistory: NoteRevision[] = store.historyFor(target.id);
        expect(await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0001').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.map((note: NoteItem): string => note.id).join(','), caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0002').assertEqual(survivor.id);
        expect(reopened.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0003').assertEqual('中文\n第二行 😀');
        expect(reopened.snapshot().recycledNotes[0].history[0].revisionId, caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0004').assertEqual(originalHistory[0].revisionId);
        expect(reopened.historyFor(target.id).length, caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0005').assertEqual(0);
        const disk: StoredData = await f.readDocument();
        expect(disk.recycleBin[0].note.id, caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0006').assertEqual(target.id);
        expect(disk.version, caseName('RecycleNativeQa', '0001'), 'RecycleNativeQa.test.ets:A0007').assertEqual(2);
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
    it(caseName('RecycleNativeQa', '0002'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0002'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const target: NoteItem = await f.save(store, '旧标题', '旧正文');
        f.time += 10;
        store.beginEditNote(target.id);
        store.setDraftTitle('修订标题');
        store.setDraftBody('保存过的第二版');
        expect(await store.saveNote(), caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0008').assertTrue();
        const historyIds: string = store.historyFor(target.id)
          .map((row: NoteRevision): string => row.revisionId).join(',');
        expect(await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0009').assertTrue();
        const middle: BusinessStore = await f.reopen();
        const trashId: string = middle.snapshot().recycledNotes[0].trashId;
        expect(await middle.restoreTrashedNote(trashId), caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0010').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes[0].body, caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0011').assertEqual('保存过的第二版');
        expect(reopened.historyFor(target.id).map((row: NoteRevision): string => row.revisionId).join(','), caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0012')
          .assertEqual(historyIds);
        expect(reopened.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0013').assertEqual(0);
        expect((await f.readDocument()).notes[0].id, caseName('RecycleNativeQa', '0002'), 'RecycleNativeQa.test.ets:A0014').assertEqual(target.id);
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
    it(caseName('RecycleNativeQa', '0003'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0003'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const first: NoteItem = await f.save(store, '永久删除目标', '只有它应消失');
        const second: NoteItem = await f.save(store, '仍可恢复', '保留关联历史');
        await store.toggleFavorite('planning');
        await store.addTodo('回收操作不影响待办');
        await store.moveNoteToTrash(first.id, TrashEditDecision.REQUIRE_DECISION);
        await store.moveNoteToTrash(second.id, TrashEditDecision.REQUIRE_DECISION);
        const firstTrash = store.snapshot().recycledNotes.find((row): boolean => row.note.id === first.id);
        if (firstTrash === undefined) { throw new Error('Target trash was not created'); }
        expect(await store.purgeTrashedNote(firstTrash.trashId), caseName('RecycleNativeQa', '0003'), 'RecycleNativeQa.test.ets:A0015').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes.map((row): string => row.note.id).join(','), caseName('RecycleNativeQa', '0003'), 'RecycleNativeQa.test.ets:A0016').assertEqual(second.id);
        expect(reopened.snapshot().recycledNotes[0].history[0].noteId, caseName('RecycleNativeQa', '0003'), 'RecycleNativeQa.test.ets:A0017').assertEqual(second.id);
        expect(reopened.snapshot().favoriteIds.join(','), caseName('RecycleNativeQa', '0003'), 'RecycleNativeQa.test.ets:A0018').assertEqual('planning');
        expect(reopened.snapshot().todos.some((row): boolean => row.title === '回收操作不影响待办'), caseName('RecycleNativeQa', '0003'), 'RecycleNativeQa.test.ets:A0019').assertTrue();
        expect(await reopened.restoreTrashedNote(firstTrash.trashId), caseName('RecycleNativeQa', '0003'), 'RecycleNativeQa.test.ets:A0020').assertFalse();
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
    it(caseName('RecycleNativeQa', '0004'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0004'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const expired: NoteItem = await f.save(store, '过期回收项', '应被显式清理');
        await store.moveNoteToTrash(expired.id, TrashEditDecision.REQUIRE_DECISION);
        f.time += NOTE_RECYCLE_RETENTION_MS;
        const boundary: NoteItem = await f.save(store, '边界新回收项', '不应被清理');
        await store.moveNoteToTrash(boundary.id, TrashEditDecision.REQUIRE_DECISION);
        f.time++;
        const loaded: BusinessStore = await f.reopen();
        expect(loaded.snapshot().expiredTrashCount, caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0021').assertEqual(1);
        expect(loaded.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0022').assertEqual(2);
        const result: TrashCleanupResult = await loaded.purgeExpiredNotes();
        expect(result.success, caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0023').assertTrue();
        expect(result.removed, caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0024').assertEqual(1);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.id, caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0025').assertEqual(boundary.id);
        expect(reopened.snapshot().expiredTrashCount, caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0026').assertEqual(0);
        expect((await f.readDocument()).noteHistory.some(
          (row: NoteRevision): boolean => row.noteId === expired.id), caseName('RecycleNativeQa', '0004'), 'RecycleNativeQa.test.ets:A0027').assertFalse();
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
    it(caseName('RecycleNativeQa', '0005'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0005'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '临界恢复', '保留完整正文');
        await store.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION);
        const deletedAt: number = f.time;
        f.time += NOTE_RECYCLE_RETENTION_MS;
        const boundary: BusinessStore = await f.reopen();
        expect(boundary.snapshot().expiredTrashCount, caseName('RecycleNativeQa', '0005'), 'RecycleNativeQa.test.ets:A0028').assertEqual(0);
        const cleanup: TrashCleanupResult = await boundary.purgeExpiredNotes();
        expect(cleanup.removed, caseName('RecycleNativeQa', '0005'), 'RecycleNativeQa.test.ets:A0029').assertEqual(0);
        f.time = deletedAt - 100;
        const backwards: BusinessStore = await f.reopen();
        expect(backwards.snapshot().expiredTrashCount, caseName('RecycleNativeQa', '0005'), 'RecycleNativeQa.test.ets:A0030').assertEqual(0);
        expect(await backwards.restoreTrashedNote(backwards.snapshot().recycledNotes[0].trashId), caseName('RecycleNativeQa', '0005'), 'RecycleNativeQa.test.ets:A0031').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes[0].body, caseName('RecycleNativeQa', '0005'), 'RecycleNativeQa.test.ets:A0032').assertEqual('保留完整正文');
        expect(reopened.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0005'), 'RecycleNativeQa.test.ets:A0033').assertEqual(0);
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
    it(caseName('RecycleNativeQa', '0006'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0006'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '保存正文', '基线');
        store.beginEditNote(note.id);
        store.setDraftTitle('删除时保留编辑');
        store.setDraftBody('尚未点保存的正文');
        await store.keepEditDraft();
        expect(await store.moveNoteToTrash(note.id, TrashEditDecision.KEEP_CHANGES), caseName('RecycleNativeQa', '0006'), 'RecycleNativeQa.test.ets:A0034').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0006'), 'RecycleNativeQa.test.ets:A0035').assertEqual('尚未点保存的正文');
        expect(reopened.snapshot().editingNoteId, caseName('RecycleNativeQa', '0006'), 'RecycleNativeQa.test.ets:A0036').assertEqual('');
        expect(reopened.snapshot().editDraftPersisted, caseName('RecycleNativeQa', '0006'), 'RecycleNativeQa.test.ets:A0037').assertFalse();
        expect(reopened.snapshot().recycledNotes[0].history.some((row: NoteRevision): boolean =>
          row.action === 'edit' && row.body === '基线'), caseName('RecycleNativeQa', '0006'), 'RecycleNativeQa.test.ets:A0038').assertTrue();
        expect((await f.readDocument()).notes.length, caseName('RecycleNativeQa', '0006'), 'RecycleNativeQa.test.ets:A0039').assertEqual(0);
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
    it(caseName('RecycleNativeQa', '0007'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0007'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '原始标题', '已保存原文');
        const revision: string = store.historyFor(note.id)[0].revisionId;
        store.beginEditNote(note.id);
        store.setDraftBody('明确放弃的编辑');
        await store.keepEditDraft();
        expect(await store.moveNoteToTrash(note.id, TrashEditDecision.DISCARD_CHANGES), caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0040').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0041').assertEqual('已保存原文');
        expect(reopened.snapshot().recycledNotes[0].history
          .map((row: NoteRevision): string => row.revisionId).join(','), caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0042').assertEqual(revision);
        expect(reopened.snapshot().editingNoteId, caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0043').assertEqual('');
        expect((await f.readDocument()).editBody, caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0044').assertEqual('');
        expect(await reopened.restoreTrashedNote(reopened.snapshot().recycledNotes[0].trashId), caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0045').assertTrue();
        const restored: BusinessStore = await f.reopen();
        expect(restored.snapshot().notes[0].body, caseName('RecycleNativeQa', '0007'), 'RecycleNativeQa.test.ets:A0046').assertEqual('已保存原文');
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
    it(caseName('RecycleNativeQa', '0008'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0008'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const note: NoteItem = await f.save(store, '取消回收目标', '原文');
        const before: string = await f.readRaw();
        store.beginEditNote(note.id);
        store.setDraftBody('取消之后继续编辑');
        expect(await store.moveNoteToTrash(note.id, TrashEditDecision.CANCEL), caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0047').assertFalse();
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0048').assertEqual(before);
        expect(store.snapshot().draftBody, caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0049').assertEqual('取消之后继续编辑');
        expect(store.snapshot().editingNoteId, caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0050').assertEqual(note.id);
        expect(await store.saveNote(), caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0051').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes[0].body, caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0052').assertEqual('取消之后继续编辑');
        expect(reopened.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0008'), 'RecycleNativeQa.test.ets:A0053').assertEqual(0);
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
    it(caseName('RecycleNativeQa', '0009'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0009'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const initial: BusinessStore = await f.open();
        const note: NoteItem = await f.save(initial, '旧存档便签', '旧用户正文');
        const document: StoredData = await f.readDocument();
        document.version = 1;
        const legacy: string = JSON.stringify(document);
        await f.seed(legacy);
        const migrated: BusinessStore = await f.open();
        expect(migrated.snapshot().notes[0].id, caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0054').assertEqual(note.id);
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0055').assertEqual(legacy);
        expect(migrated.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0056').assertEqual(0);
        expect(await migrated.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0057').assertTrue();
        const upgraded: StoredData = await f.readDocument();
        expect(upgraded.version, caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0058').assertEqual(2);
        expect(upgraded.recycleBin[0].note.body, caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0059').assertEqual('旧用户正文');
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].history[0].noteId, caseName('RecycleNativeQa', '0009'), 'RecycleNativeQa.test.ets:A0060').assertEqual(note.id);
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
    it(caseName('RecycleNativeQa', '0010'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0010'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const original: BusinessStore = await f.open();
        const note: NoteItem = await f.save(original, '升级应用的正文', '不可覆盖');
        const good: string = await f.readRaw();
        const futureDocument: StoredData = await f.readDocument();
        futureDocument.version = 999;
        const future: string = JSON.stringify(futureDocument);
        await f.seed(future);
        const rejected: BusinessStore = await f.open();
        expect(rejected.snapshot().ready, caseName('RecycleNativeQa', '0010'), 'RecycleNativeQa.test.ets:A0061').assertFalse();
        expect(await rejected.saveNote(), caseName('RecycleNativeQa', '0010'), 'RecycleNativeQa.test.ets:A0062').assertFalse();
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0010'), 'RecycleNativeQa.test.ets:A0063').assertEqual(future);
        expect(rejected.snapshot().notes.length, caseName('RecycleNativeQa', '0010'), 'RecycleNativeQa.test.ets:A0064').assertEqual(0);
        await f.seed(good);
        const recovered: BusinessStore = await f.open();
        expect(recovered.snapshot().ready, caseName('RecycleNativeQa', '0010'), 'RecycleNativeQa.test.ets:A0065').assertTrue();
        expect(recovered.snapshot().notes[0].id, caseName('RecycleNativeQa', '0010'), 'RecycleNativeQa.test.ets:A0066').assertEqual(note.id);
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
    it(caseName('RecycleNativeQa', '0011'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0011'), async (f: RecycleNativeQaFixture): Promise<void> => {
        await f.seed(42);
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('qa-sentinel', 'only-this-test');
        await nativeStore.flush();
        const store: BusinessStore = await f.open();
        expect(store.snapshot().ready, caseName('RecycleNativeQa', '0011'), 'RecycleNativeQa.test.ets:A0067').assertFalse();
        expect(await store.purgeTrashedNote('trash-1'), caseName('RecycleNativeQa', '0011'), 'RecycleNativeQa.test.ets:A0068').assertFalse();
        expect(await nativeStore.get('workspace', ''), caseName('RecycleNativeQa', '0011'), 'RecycleNativeQa.test.ets:A0069').assertEqual(42);
        expect(await nativeStore.get('qa-sentinel', ''), caseName('RecycleNativeQa', '0011'), 'RecycleNativeQa.test.ets:A0070').assertEqual('only-this-test');
        expect(store.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0011'), 'RecycleNativeQa.test.ets:A0071').assertEqual(0);
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
    it(caseName('RecycleNativeQa', '0012'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0012'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        const recycled: NoteItem = await f.save(store, '等待空位', '容量恢复正文');
        await store.moveNoteToTrash(recycled.id, TrashEditDecision.REQUIRE_DECISION);
        const trashId: string = store.snapshot().recycledNotes[0].trashId;
        for (let index: number = 0; index < MAX_ACTIVE_NOTES; index++) {
          f.time++;
          await f.save(store, `占用活跃槽位-${index}`, `各槽位独立正文-${index}`);
        }
        const fullRaw: string = await f.readRaw();
        expect(await store.restoreTrashedNote(trashId), caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0072').assertFalse();
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0073').assertEqual(fullRaw);
        expect(store.snapshot().recycledNotes[0].note.id, caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0074').assertEqual(recycled.id);
        const victimId: string = store.snapshot().notes[0].id;
        expect(await store.moveNoteToTrash(victimId, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0075').assertTrue();
        expect(await store.restoreTrashedNote(trashId), caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0076').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.some((row: NoteItem): boolean => row.id === recycled.id), caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0077').assertTrue();
        expect(reopened.snapshot().recycledNotes.map((row): string => row.note.id).join(','), caseName('RecycleNativeQa', '0012'), 'RecycleNativeQa.test.ets:A0078').assertEqual(victimId);
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
    it(caseName('RecycleNativeQa', '0013'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0013'), async (f: RecycleNativeQaFixture): Promise<void> => {
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
        expect(await store.moveNoteToTrash(pending.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0079').assertFalse();
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0080').assertEqual(before);
        expect(store.snapshot().notes[0].id, caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0081').assertEqual(pending.id);
        const staleId: string = store.snapshot().recycledNotes[0].trashId;
        expect(await store.purgeTrashedNote(staleId), caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0082').assertTrue();
        expect(await store.moveNoteToTrash(pending.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0083').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        expect(await reopened.restoreTrashedNote(staleId), caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0084').assertFalse();
        expect(reopened.snapshot().recycledNotes.some((row): boolean => row.note.id === pending.id), caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0085').assertTrue();
        expect(reopened.snapshot().notes.length, caseName('RecycleNativeQa', '0013'), 'RecycleNativeQa.test.ets:A0086').assertEqual(0);
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
    it(caseName('RecycleNativeQa', '0014'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0014'), async (left: RecycleNativeQaFixture): Promise<void> => {
        const a: BusinessStore = await left.open();
        const first: NoteItem = await left.save(a, '左命名空间', '只属于左侧');
        await a.moveNoteToTrash(first.id, TrashEditDecision.REQUIRE_DECISION);
        await withRecycleNativeQa(caseName('RecycleNativeQa', '0014'), async (right: RecycleNativeQaFixture): Promise<void> => {
          const b: BusinessStore = await right.open();
          expect(b.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0014'), 'RecycleNativeQa.test.ets:A0087').assertEqual(0);
          const second: NoteItem = await right.save(b, '右命名空间', '只属于右侧');
          await b.moveNoteToTrash(second.id, TrashEditDecision.REQUIRE_DECISION);
          await a.purgeTrashedNote(a.snapshot().recycledNotes[0].trashId);
          const reopenedRight: BusinessStore = await right.reopen();
          expect(reopenedRight.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0014'), 'RecycleNativeQa.test.ets:A0088').assertEqual('只属于右侧');
          expect((await left.readDocument()).recycleBin.length, caseName('RecycleNativeQa', '0014'), 'RecycleNativeQa.test.ets:A0089').assertEqual(0);
        });
        const reopenedLeft: BusinessStore = await left.reopen();
        expect(reopenedLeft.snapshot().recycledNotes.length, caseName('RecycleNativeQa', '0014'), 'RecycleNativeQa.test.ets:A0090').assertEqual(0);
        expect(reopenedLeft.snapshot().notes.length, caseName('RecycleNativeQa', '0014'), 'RecycleNativeQa.test.ets:A0091').assertEqual(0);
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
    it(caseName('RecycleNativeQa', '0015'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0015'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const adapter: PreferencesBusinessStorage = new PreferencesBusinessStorage(f.namespace);
        expect(await adapter.read(f.context), caseName('RecycleNativeQa', '0015'), 'RecycleNativeQa.test.ets:A0092').assertEqual('');
        await adapter.write('first-flushed-value');
        expect(await adapter.reload(f.context), caseName('RecycleNativeQa', '0015'), 'RecycleNativeQa.test.ets:A0093').assertEqual('first-flushed-value');
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('qa-unrelated-key', 'must-survive');
        await nativeStore.flush();
        await adapter.write('second-flushed-value');
        expect(await adapter.reload(f.context), caseName('RecycleNativeQa', '0015'), 'RecycleNativeQa.test.ets:A0094').assertEqual('second-flushed-value');
        const reopenedNative: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        expect(await reopenedNative.get('qa-unrelated-key', ''), caseName('RecycleNativeQa', '0015'), 'RecycleNativeQa.test.ets:A0095').assertEqual('must-survive');
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
    it(caseName('RecycleNativeQa', '0016'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0016'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const adapter: PreferencesBusinessStorage = new PreferencesBusinessStorage(f.namespace);
        await adapter.read(f.context);
        await adapter.write('confirmed-before-native-rejection');
        const failures: BusinessWriteError[] = [];
        try {
          await adapter.write('x'.repeat(preferences.MAX_VALUE_LENGTH + 1));
        } catch (error) {
          failures.push(error as BusinessWriteError);
        }
        expect(failures.length, caseName('RecycleNativeQa', '0016'), 'RecycleNativeQa.test.ets:A0096').assertEqual(1);
        expect(failures[0].uncertain, caseName('RecycleNativeQa', '0016'), 'RecycleNativeQa.test.ets:A0097').assertTrue();
        expect(await adapter.reload(f.context), caseName('RecycleNativeQa', '0016'), 'RecycleNativeQa.test.ets:A0098').assertEqual('confirmed-before-native-rejection');
        await adapter.write('confirmed-after-reload');
        expect(await adapter.reload(f.context), caseName('RecycleNativeQa', '0016'), 'RecycleNativeQa.test.ets:A0099').assertEqual('confirmed-after-reload');
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
    it(caseName('RecycleNativeQa', '0017'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0017'), async (f: RecycleNativeQaFixture): Promise<void> => {
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
        expect(rejected.snapshot().ready, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0100').assertFalse();
        // Compare every code unit, but do not make Hypium format two entire 8MiB values on success.
        expect((await f.readRaw()) === oversizedCurrent, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0101').assertTrue();
        f.mark('seventeen-current-preservation-asserted');
        document.version = 1;
        const oversizedLegacy: string = JSON.stringify(document) + padding;
        await f.seed(oversizedLegacy);
        f.mark('seventeen-legacy-seed-complete');
        const legacy: BusinessStore = await f.open();
        f.mark('seventeen-legacy-load-complete');
        expect(legacy.snapshot().notes[0].id, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0102').assertEqual(note.id);
        expect((await f.readRaw()) === oversizedLegacy, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0103').assertTrue();
        f.mark('seventeen-legacy-preservation-asserted');
        expect(await legacy.moveNoteToTrash(note.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0104').assertTrue();
        f.mark('seventeen-upgrade-committed');
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0105').assertEqual('真实正文而非填充内容');
        expect((await f.readDocument()).version, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0106').assertEqual(2);
        expect((await f.readRaw()).length < MAX_WORKSPACE_BYTES, caseName('RecycleNativeQa', '0017'), 'RecycleNativeQa.test.ets:A0107').assertTrue();
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
    it(caseName('RecycleNativeQa', '0018'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0018'), async (f: RecycleNativeQaFixture): Promise<void> => {
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
        expect(await loaded.saveNote(), caseName('RecycleNativeQa', '0018'), 'RecycleNativeQa.test.ets:A0108').assertTrue();
        const reopened: BusinessStore = await f.reopen();
        const disk: StoredData = await f.readDocument();
        expect(disk.noteHistory.length + disk.recycleBin[0].history.length, caseName('RecycleNativeQa', '0018'), 'RecycleNativeQa.test.ets:A0109').assertEqual(MAX_WORKSPACE_HISTORY);
        expect(disk.recycleBin[0].history.some((row: NoteRevision): boolean =>
          row.revisionId === `qa-bin-history-${MAX_WORKSPACE_HISTORY - 2}`), caseName('RecycleNativeQa', '0018'), 'RecycleNativeQa.test.ets:A0110').assertFalse();
        expect(reopened.historyFor(active.id).some((row: NoteRevision): boolean => row.body === '编辑前正文'), caseName('RecycleNativeQa', '0018'), 'RecycleNativeQa.test.ets:A0111').assertTrue();
        expect(reopened.snapshot().notes[0].body, caseName('RecycleNativeQa', '0018'), 'RecycleNativeQa.test.ets:A0112').assertEqual('新增修订后的正文');
        expect(reopened.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0018'), 'RecycleNativeQa.test.ets:A0113').assertEqual('回收正文仍要完整');
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
    it(caseName('RecycleNativeQa', '0019'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0019'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const store: BusinessStore = await f.open();
        store.setDraftTitle('离开时的真实写入');
        store.setDraftBody('等待Preferences实际flush后读取');
        f.mark('nineteen-save-start');
        const pending: Promise<boolean> = store.saveNote();
        store.dispose();
        f.mark('nineteen-disposed-with-write-pending');
        await store.whenStorageIdle();
        f.mark('nineteen-native-write-settled');
        expect(await pending, caseName('RecycleNativeQa', '0019'), 'RecycleNativeQa.test.ets:A0114').assertFalse();
        expect(store.snapshot().ready, caseName('RecycleNativeQa', '0019'), 'RecycleNativeQa.test.ets:A0115').assertFalse();
        expect(store.snapshot().notes.length, caseName('RecycleNativeQa', '0019'), 'RecycleNativeQa.test.ets:A0116').assertEqual(0);
        const reopened: BusinessStore = await f.reopen();
        f.mark('nineteen-cold-reopen-complete');
        expect(reopened.snapshot().notes[0].body, caseName('RecycleNativeQa', '0019'), 'RecycleNativeQa.test.ets:A0117').assertEqual('等待Preferences实际flush后读取');
        expect(reopened.snapshot().storageRecoveryRequired, caseName('RecycleNativeQa', '0019'), 'RecycleNativeQa.test.ets:A0118').assertFalse();
        expect((await f.readDocument()).notes[0].title, caseName('RecycleNativeQa', '0019'), 'RecycleNativeQa.test.ets:A0119').assertEqual('离开时的真实写入');
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
    it(caseName('RecycleNativeQa', '0020'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0020'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const fault: NativeCommitAcknowledgementFault = new NativeCommitAcknowledgementFault(f.namespace);
        const store: BusinessStore = await f.openUsing(fault);
        const target: NoteItem = await f.save(store, '结果不确定的移动', '磁盘已提交候选');
        const survivor: NoteItem = await f.save(store, '其它便签', '不可受影响');
        await store.toggleFavorite('reading');
        await store.addTodo('保留待办业务');
        fault.arm();
        expect(await store.moveNoteToTrash(target.id, TrashEditDecision.REQUIRE_DECISION), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0120').assertFalse();
        expect(store.snapshot().storageRecoveryRequired, caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0121').assertTrue();
        expect(store.snapshot().notes.some((row: NoteItem): boolean => row.id === target.id), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0122').assertTrue();
        expect((await f.readDocument()).recycleBin[0].note.id, caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0123').assertEqual(target.id);
        const writes: number = fault.writes;
        expect(await store.recoverStorage(), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0124').assertTrue();
        expect(store.snapshot().notes.map((row: NoteItem): string => row.id).join(','), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0125').assertEqual(survivor.id);
        expect(store.snapshot().favoriteIds.join(','), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0126').assertEqual('reading');
        expect(store.snapshot().todos.some((row): boolean => row.title === '保留待办业务'), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0127').assertTrue();
        expect(await store.recoverStorage(), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0128').assertTrue();
        expect(fault.reloads, caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0129').assertEqual(1);
        expect(fault.writes, caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0130').assertEqual(writes);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().recycledNotes.map((row): string => row.note.id).join(','), caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0131').assertEqual(target.id);
        expect(reopened.snapshot().storageRecoveryRequired, caseName('RecycleNativeQa', '0020'), 'RecycleNativeQa.test.ets:A0132').assertFalse();
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
    it(caseName('RecycleNativeQa', '0021'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0021'), async (f: RecycleNativeQaFixture): Promise<void> => {
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
        expect(await store.recoverStorage(), caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0133').assertFalse();
        expect(store.snapshot().storageRecoveryRequired, caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0134').assertTrue();
        expect(await store.purgeTrashedNote('trash-1'), caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0135').assertFalse();
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0136').assertEqual(foreignRaw);
        // recoverStorage invalidated the previous native handle; obtain a fresh one before each edit.
        const damagedStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await damagedStore.put('workspace', '{qa-broken-document');
        await damagedStore.flush();
        expect(await store.recoverStorage(), caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0137').assertFalse();
        expect(store.snapshot().notes[0].body, caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0138').assertEqual('原始正文');
        const repairedStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await repairedStore.put('workspace', candidate);
        await repairedStore.flush();
        expect(await store.recoverStorage(), caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0139').assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0140').assertEqual('原始正文');
        expect(fault.writes, caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0141').assertEqual(writes);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.length, caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0142').assertEqual(0);
        expect(reopened.snapshot().recycledNotes[0].note.id, caseName('RecycleNativeQa', '0021'), 'RecycleNativeQa.test.ets:A0143').assertEqual(target.id);
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
    it(caseName('RecycleNativeQa', '0022'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0022'), async (f: RecycleNativeQaFixture): Promise<void> => {
        const fault: NativeCommitAcknowledgementFault = new NativeCommitAcknowledgementFault(f.namespace);
        const store: BusinessStore = await f.openUsing(fault);
        const survivor: NoteItem = await f.save(store, '确认过的便签', '稳定原文');
        const before: string = await f.readRaw();
        store.setDraftTitle('等待显式重试');
        store.setDraftBody('核对旧文档不能清掉这个草稿');
        fault.arm();
        expect(await store.saveNote(), caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0144').assertFalse();
        const nativeStore: preferences.Preferences = await preferences.getPreferences(f.context,
          { name: f.namespace });
        await nativeStore.put('workspace', before);
        await nativeStore.flush();
        const writes: number = fault.writes;
        expect(await store.recoverStorage(), caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0145').assertTrue();
        expect(store.snapshot().notes.map((row: NoteItem): string => row.id).join(','), caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0146').assertEqual(survivor.id);
        expect(store.snapshot().draftBody, caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0147').assertEqual('核对旧文档不能清掉这个草稿');
        expect(store.snapshot().storageRecoveryRequired, caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0148').assertFalse();
        expect(fault.writes, caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0149').assertEqual(writes);
        expect(await store.saveNote(), caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0150').assertTrue();
        expect(fault.writes, caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0151').assertEqual(writes + 1);
        const reopened: BusinessStore = await f.reopen();
        expect(reopened.snapshot().notes.length, caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0152').assertEqual(2);
        expect(reopened.snapshot().notes.some((row: NoteItem): boolean => row.body === '核对旧文档不能清掉这个草稿'), caseName('RecycleNativeQa', '0022'), 'RecycleNativeQa.test.ets:A0153').assertTrue();
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
    it(caseName('RecycleNativeQa', '0023'), 0, async (): Promise<void> => {
      await withRecycleNativeQa(caseName('RecycleNativeQa', '0023'), async (f: RecycleNativeQaFixture): Promise<void> => {
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
        expect(rejected.snapshot().ready, caseName('RecycleNativeQa', '0023'), 'RecycleNativeQa.test.ets:A0154').assertFalse();
        expect((await rejected.purgeExpiredNotes()).success, caseName('RecycleNativeQa', '0023'), 'RecycleNativeQa.test.ets:A0155').assertFalse();
        expect(await f.readRaw(), caseName('RecycleNativeQa', '0023'), 'RecycleNativeQa.test.ets:A0156').assertEqual(badRaw);
        await f.seed(good);
        const recovered: BusinessStore = await f.open();
        expect(recovered.snapshot().notes[0].body, caseName('RecycleNativeQa', '0023'), 'RecycleNativeQa.test.ets:A0157').assertEqual('活跃原文');
        expect(recovered.snapshot().recycledNotes[0].note.body, caseName('RecycleNativeQa', '0023'), 'RecycleNativeQa.test.ets:A0158').assertEqual('回收原文');
        expect(recovered.snapshot().recycledNotes[0].history[0].noteId, caseName('RecycleNativeQa', '0023'), 'RecycleNativeQa.test.ets:A0159').assertEqual(recycled.id);
      });
    });
  });
}
