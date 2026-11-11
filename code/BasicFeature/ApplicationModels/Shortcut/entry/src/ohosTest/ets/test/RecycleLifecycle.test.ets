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
import {
  BusinessStore, StoredData, NoteRevision, RecycledNote, decodeBusinessDocument
} from '../../../main/ets/business/BusinessStore';
import { TrashEditDecision, NOTE_RECYCLE_RETENTION_MS } from '../../../main/ets/business/NoteRecyclePolicy';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { RecycleBusinessStorage, recycleInput, openRecycle } from '../support/RecycleBusinessFixture';

/** Feature implementation batch: pending the final unified validation, no execution claim. */
export default function recycleLifecycleTests(): void {
  describe('RecycleLifecycle', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0100
     * @tc.name testShortcutRecycleLifecycle0001
     * @tc.desc 兼容删除入口真实软删除正文历史并在重开后恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = JSON.stringify(recycleInput());
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await openRecycle(scope, io, clock);
        expect(await store.deleteNote('active-0')).assertTrue();
        expect(store.snapshot().notes.map((note): string => note.id).join(',')).assertEqual('active-1');
        expect(store.historyFor('active-0').length).assertEqual(0);
        expect(store.snapshot().recycledNotes[0].history[0].body).assertEqual('旧正文0');
        const token: string = store.snapshot().recycledNotes[0].trashId;
        store.dispose();
        const reopened: BusinessStore = await openRecycle(scope, io, clock);
        expect(await reopened.restoreTrashedNote(token)).assertTrue();
        expect(reopened.snapshot().notes[0].body).assertEqual('正式正文0');
        expect(reopened.snapshot().notes[0].createdAt).assertEqual(1);
        expect(reopened.historyFor('active-0')[0].revisionId).assertEqual('active-history-0');
        expect(reopened.snapshot().recycledNotes.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0200
     * @tc.name testShortcutRecycleLifecycle0002
     * @tc.desc 当前目标有未处理编辑时默认删除拒绝且不触碰存储
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('未确认编辑');
        expect(await store.deleteNote('active-0')).assertFalse();
        expect(store.errorText()).assertEqual('请先选择保留或放弃目标便签的编辑');
        expect(store.snapshot().notes[0].body).assertEqual('正式正文0');
        expect(store.snapshot().editingNoteId).assertEqual('active-0');
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0300
     * @tc.name testShortcutRecycleLifecycle0003
     * @tc.desc 保留修改并移入在一个存档里保留新正文和修改前版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftTitle('  最新标题  '); store.setDraftBody(' 最新正文 ');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES)).assertTrue();
        const saved: StoredData = decodeBusinessDocument(io.value);
        expect(saved.recycleBin[0].note.title).assertEqual('最新标题');
        expect(saved.recycleBin[0].note.body).assertEqual('最新正文');
        expect(saved.recycleBin[0].history[0].body).assertEqual('正式正文0');
        expect(saved.recycleBin[0].history[0].action).assertEqual('edit');
        expect(saved.editNoteId).assertEqual('');
        expect(io.writes).assertEqual(1);
        expect(store.snapshot().draftBody).assertEqual('独立草稿正文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0400
     * @tc.name testShortcutRecycleLifecycle0004
     * @tc.desc 放弃目标编辑只回收正式正文而不删除独立新草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('放弃的编辑'); await store.keepEditDraft();
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.DISCARD_CHANGES)).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('正式正文0');
        expect(store.snapshot().recycledNotes[0].history.length).assertEqual(1);
        expect(store.snapshot().draftBody).assertEqual('独立草稿正文');
        expect(decodeBusinessDocument(io.value).editNoteId).assertEqual('');
        expect(store.snapshot().draftDirty).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0500
     * @tc.name testShortcutRecycleLifecycle0005
     * @tc.desc 已保留且dirty为假的编辑仍需要明确处理选择
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('持久编辑'); await store.keepEditDraft();
        const before: string = io.value; const writes: number = io.writes;
        expect(store.requiresTrashEditDecision('active-0')).assertTrue();
        expect(await store.deleteNote('active-0')).assertFalse();
        expect(store.snapshot().draftDirty).assertFalse();
        expect(io.writes).assertEqual(writes);
        expect(io.value).assertEqual(before);
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES)).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('持久编辑');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0600
     * @tc.name testShortcutRecycleLifecycle0006
     * @tc.desc 取消目标删除保留当前编辑和已保存历史不产生写入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0006', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('取消时保留');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.CANCEL)).assertFalse();
        expect(store.snapshot().draftBody).assertEqual('取消时保留');
        expect(store.historyFor('active-0')[0].body).assertEqual('旧正文0');
        expect(store.snapshot().recycledNotes.length).assertEqual(0);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0700
     * @tc.name testShortcutRecycleLifecycle0007
     * @tc.desc 删除其它便签不改变当前编辑的内存缓冲或持久草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0007', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-1'); store.setDraftBody('另一篇已保留'); await store.keepEditDraft();
        store.setDraftBody('另一篇内存中的后续编辑');
        expect(await store.deleteNote('active-0')).assertTrue();
        expect(store.snapshot().editingNoteId).assertEqual('active-1');
        expect(store.snapshot().draftBody).assertEqual('另一篇内存中的后续编辑');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        const saved: StoredData = decodeBusinessDocument(io.value);
        expect(saved.editBody).assertEqual('另一篇已保留');
        expect(saved.recycleBin[0].note.id).assertEqual('active-0');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0800
     * @tc.name testShortcutRecycleLifecycle0008
     * @tc.desc 保留空白编辑不能先移除正式便签或清除独立草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0008', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftTitle('  '); store.setDraftBody('\n');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES)).assertFalse();
        expect(store.errorText()).assertEqual('请输入标题或内容');
        expect(store.snapshot().notes[0].title).assertEqual('正式标题0');
        expect(store.snapshot().editingNoteId).assertEqual('active-0');
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_0900
     * @tc.name testShortcutRecycleLifecycle0009
     * @tc.desc 回收站已满时不自动淘汰未过期旧项且保留活动目标
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0009', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 50));
        const store: BusinessStore = await openRecycle(scope, io);
        const before: string = io.value;
        expect(await store.deleteNote('active-0')).assertFalse();
        expect(store.errorText()).assertEqual('回收站已满，请先清理');
        expect(store.snapshot().notes[0].id).assertEqual('active-0');
        expect(store.snapshot().recycledNotes.some(
          (entry: RecycledNote): boolean => entry.trashId === 'trash-1')).assertTrue();
        expect(io.value).assertEqual(before);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1000
     * @tc.name testShortcutRecycleLifecycle0010
     * @tc.desc 活动便签满额时恢复失败保留回收项并可释放名额再恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0010', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(50, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.restoreTrashedNote('trash-1')).assertFalse();
        expect(store.errorText()).assertEqual('便签已满，请先释放名额');
        expect(io.writes).assertEqual(0);
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('回收正文0');
        await store.deleteNote('active-0');
        expect(await store.restoreTrashedNote('trash-1')).assertTrue();
        expect(store.snapshot().notes[0].id).assertEqual('recycled-0');
        expect(store.snapshot().notes.length).assertEqual(50);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1100
     * @tc.name testShortcutRecycleLifecycle0011
     * @tc.desc 恢复再删除生成新标识使旧永久删除确认不能命中新回收项
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0011', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(0, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        await store.restoreTrashedNote('trash-1'); await store.deleteNote('recycled-0');
        expect(store.snapshot().recycledNotes[0].trashId).assertEqual('trash-2');
        const writes: number = io.writes;
        expect(await store.purgeTrashedNote('trash-1')).assertFalse();
        expect(await store.restoreTrashedNote('trash-1')).assertFalse();
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('回收正文0');
        expect(io.writes).assertEqual(writes);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1200
     * @tc.name testShortcutRecycleLifecycle0012
     * @tc.desc 永久删除仅移除选定回收项和历史而不影响其它业务
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0012', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.purgeTrashedNote('trash-1')).assertTrue();
        expect(store.snapshot().recycledNotes.map((entry: RecycledNote): string => entry.trashId).join(','))
          .assertEqual('trash-2');
        expect(store.snapshot().notes[0].body).assertEqual('正式正文0');
        expect(decodeBusinessDocument(io.value).recycleSequence).assertEqual(2);
        store.dispose();
        const reopened: BusinessStore = await openRecycle(scope, io);
        expect(await reopened.restoreTrashedNote('trash-1')).assertFalse();
        expect(reopened.snapshot().recycledNotes[0].history[0].noteId).assertEqual('recycled-1');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1300
     * @tc.name testShortcutRecycleLifecycle0013
     * @tc.desc 保留期恰好三十天仍可恢复严格超过才禁止
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0013', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(0, 2, clock.now() - NOTE_RECYCLE_RETENTION_MS);
        data.recycleBin[1].deletedAt--;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        expect(store.snapshot().expiredTrashCount).assertEqual(1);
        expect(await store.restoreTrashedNote('trash-1')).assertTrue();
        expect(await store.restoreTrashedNote('trash-2')).assertFalse();
        expect(store.errorText()).assertEqual('已超过30天保留期，不能恢复');
        expect(store.snapshot().notes[0].id).assertEqual('recycled-0');
        expect(store.snapshot().recycledNotes[0].trashId).assertEqual('trash-2');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1400
     * @tc.name testShortcutRecycleLifecycle0014
     * @tc.desc 设备时钟回拨不使未来删除时间的条目被误清理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0014', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = JSON.stringify(recycleInput(0, 1, clock.now() + NOTE_RECYCLE_RETENTION_MS));
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const result = await store.purgeExpiredNotes();
        expect(result.success).assertTrue();
        expect(result.removed).assertEqual(0);
        expect(io.writes).assertEqual(0);
        expect(await store.restoreTrashedNote('trash-1')).assertTrue();
        expect(store.snapshot().notes[0].body).assertEqual('回收正文0');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1500
     * @tc.name testShortcutRecycleLifecycle0015
     * @tc.desc 显式清理只清过期集合且报告实际数量
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0015', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(1, 3, clock.now());
        data.recycleBin[0].deletedAt = clock.now() - NOTE_RECYCLE_RETENTION_MS - 1;
        data.recycleBin[1].deletedAt = clock.now() - NOTE_RECYCLE_RETENTION_MS - 2000;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const result = await store.purgeExpiredNotes();
        expect(result.success).assertTrue();
        expect(result.removed).assertEqual(2);
        expect(store.snapshot().recycledNotes[0].trashId).assertEqual('trash-3');
        expect(store.snapshot().notes[0].title).assertEqual('正式标题0');
        expect(decodeBusinessDocument(io.value).recycleSequence).assertEqual(3);
        expect(io.writes).assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1600
     * @tc.name testShortcutRecycleLifecycle0016
     * @tc.desc 新建便签不复用回收区仍占用的同一时钟标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0016', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(0, 1);
        data.recycleBin[0].note.id = `${clock.now()}-1`;
        data.recycleBin[0].history[0].noteId = data.recycleBin[0].note.id;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        store.setDraftTitle('新建的另一篇'); store.setDraftBody('新内容');
        expect(await store.saveNote()).assertTrue();
        expect(store.snapshot().notes[0].id).assertEqual(`${clock.now()}-2`);
        expect(await store.restoreTrashedNote('trash-1')).assertTrue();
        expect(store.snapshot().notes.map((note): string => note.id).join(','))
          .assertEqual(`${clock.now()}-1,${clock.now()}-2`);
        expect(store.snapshot().notes[1].body).assertEqual('新内容');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1700
     * @tc.name testShortcutRecycleLifecycle0017
     * @tc.desc 回收编号达到安全整数上限时保留当前数据而非重复旧标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0017', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1); data.recycleSequence = Number.MAX_SAFE_INTEGER;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.deleteNote('active-0')).assertFalse();
        expect(store.errorText()).assertEqual('回收站编号已达上限');
        expect(store.snapshot().notes[0].id).assertEqual('active-0');
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1800
     * @tc.name testShortcutRecycleLifecycle0018
     * @tc.desc 全局一百条历史淘汰最早修订但不删除回收正文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0018', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1, 1);
        for (let index: number = 2; index <= 99; index++) {
          data.noteHistory.push(new NoteRevision(`older-${index}`, 'active-0', `历史${index}`, '历史正文', index, 'edit'));
        }
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('新增修订后的正文');
        expect(await store.saveNote()).assertTrue();
        const saved: StoredData = decodeBusinessDocument(io.value);
        expect(saved.noteHistory.length + saved.recycleBin[0].history.length).assertEqual(100);
        expect(saved.noteHistory.some(
          (revision: NoteRevision): boolean => revision.revisionId === 'active-history-0')).assertFalse();
        expect(saved.recycleBin[0].note.body).assertEqual('回收正文0');
        expect(saved.recycleBin[0].history[0].revisionId).assertEqual('recycled-history-0');
        expect(store.snapshot().notes[0].body).assertEqual('新增修订后的正文');
      });
    });
    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_1900
     * @tc.name testShortcutRecycleLifecycle0019
     * @tc.desc 保留编辑的空标题按正文首行生成回收标题而保留完整多行正文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0019', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftTitle('  '); store.setDraftBody(' 第一行保留\n第二行 ');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES)).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.title).assertEqual('第一行保留');
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('第一行保留\n第二行');
        expect(store.snapshot().recycledNotes[0].history[0].title).assertEqual('正式标题0');
        expect(store.snapshot().draftBody).assertEqual('独立草稿正文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_2000
     * @tc.name testShortcutRecycleLifecycle0020
     * @tc.desc 目标仅有持久编辑而当前编辑另一篇时保留正确目标缓冲
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0020', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('目标已保留内容'); await store.keepEditDraft();
        store.beginEditNote('active-1');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES)).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body).assertEqual('目标已保留内容');
        expect(store.snapshot().editingNoteId).assertEqual('active-1');
        expect(store.snapshot().draftBody).assertEqual('正式正文1');
        expect(decodeBusinessDocument(io.value).editNoteId).assertEqual('');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_2100
     * @tc.name testShortcutRecycleLifecycle0021
     * @tc.desc 恢复回收项不覆盖当前未保存的新便签输入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0021', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        store.setDraftTitle('正在写的新便签'); store.setDraftBody('不能被恢复操作覆盖');
        expect(await store.restoreTrashedNote('trash-1')).assertTrue();
        expect(store.snapshot().draftTitle).assertEqual('正在写的新便签');
        expect(store.snapshot().draftBody).assertEqual('不能被恢复操作覆盖');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        expect(decodeBusinessDocument(io.value).draftBody).assertEqual('独立草稿正文');
        expect(store.snapshot().notes[0].body).assertEqual('回收正文0');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_2200
     * @tc.name testShortcutRecycleLifecycle0022
     * @tc.desc 新修订编号同时避开回收历史中仍保留的相同时间标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0022', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(1, 1);
        data.recycleBin[0].history[0].revisionId = `${clock.now()}-r1`;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        store.beginEditNote('active-0'); store.setDraftBody('新的真实编辑');
        expect(await store.saveNote()).assertTrue();
        expect(store.historyFor('active-0')[0].revisionId).assertEqual(`${clock.now()}-r2`);
        expect(store.snapshot().recycledNotes[0].history[0].revisionId).assertEqual(`${clock.now()}-r1`);
        expect(store.snapshot().recycledNotes[0].history[0].body).assertEqual('回收旧正文0');
        expect(store.snapshot().notes[0].body).assertEqual('新的真实编辑');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_2300
     * @tc.name testShortcutRecycleLifecycle0023
     * @tc.desc 不存在的目标和活动标识不能被当成回收操作令牌
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0023', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const before: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.deleteNote('missing-note')).assertFalse();
        expect(await store.purgeTrashedNote('active-0')).assertFalse();
        expect(await store.restoreTrashedNote('recycled-0')).assertFalse();
        expect(store.snapshot().notes[0].id).assertEqual('active-0');
        expect(io.value).assertEqual(before);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLELIFECYCLE_2400
     * @tc.name testShortcutRecycleLifecycle0024
     * @tc.desc 初始读取失败时回收写入口全部安全拒绝不覆盖不可读原文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleLifecycle0024', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const original: string = io.value; io.failRead = true;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.deleteNote('active-0')).assertFalse();
        expect(await store.restoreTrashedNote('trash-1')).assertFalse();
        expect(await store.purgeTrashedNote('trash-1')).assertFalse();
        expect((await store.purgeExpiredNotes()).success).assertFalse();
        expect(io.value).assertEqual(original);
        expect(io.writes).assertEqual(0);
      });
    });
  });
}
