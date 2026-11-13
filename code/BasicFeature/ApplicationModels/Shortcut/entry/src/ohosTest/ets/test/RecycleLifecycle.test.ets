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
    it(caseName('ShortcutRecycleLifecycle', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0001'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = JSON.stringify(recycleInput());
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await openRecycle(scope, io, clock);
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0001')).assertTrue();
        expect(store.snapshot().notes.map((note): string => note.id).join(','), caseName('ShortcutRecycleLifecycle', '0001')).assertEqual('active-1');
        expect(store.historyFor('active-0').length, caseName('ShortcutRecycleLifecycle', '0001')).assertEqual(0);
        expect(store.snapshot().recycledNotes[0].history[0].body, caseName('ShortcutRecycleLifecycle', '0001')).assertEqual('旧正文0');
        const token: string = store.snapshot().recycledNotes[0].trashId;
        store.dispose();
        const reopened: BusinessStore = await openRecycle(scope, io, clock);
        expect(await reopened.restoreTrashedNote(token), caseName('ShortcutRecycleLifecycle', '0001')).assertTrue();
        expect(reopened.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0001')).assertEqual('正式正文0');
        expect(reopened.snapshot().notes[0].createdAt, caseName('ShortcutRecycleLifecycle', '0001')).assertEqual(1);
        expect(reopened.historyFor('active-0')[0].revisionId, caseName('ShortcutRecycleLifecycle', '0001')).assertEqual('active-history-0');
        expect(reopened.snapshot().recycledNotes.length, caseName('ShortcutRecycleLifecycle', '0001')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0002'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('未确认编辑');
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0002')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleLifecycle', '0002')).assertEqual('请先选择保留或放弃目标便签的编辑');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0002')).assertEqual('正式正文0');
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleLifecycle', '0002')).assertEqual('active-0');
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0002')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0003'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftTitle('  最新标题  '); store.setDraftBody(' 最新正文 ');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleLifecycle', '0003')).assertTrue();
        const saved: StoredData = decodeBusinessDocument(io.value);
        expect(saved.recycleBin[0].note.title, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual('最新标题');
        expect(saved.recycleBin[0].note.body, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual('最新正文');
        expect(saved.recycleBin[0].history[0].body, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual('正式正文0');
        expect(saved.recycleBin[0].history[0].action, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual('edit');
        expect(saved.editNoteId, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual('');
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual(1);
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0003')).assertEqual('独立草稿正文');
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
    it(caseName('ShortcutRecycleLifecycle', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0004'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('放弃的编辑'); await store.keepEditDraft();
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.DISCARD_CHANGES), caseName('ShortcutRecycleLifecycle', '0004')).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleLifecycle', '0004')).assertEqual('正式正文0');
        expect(store.snapshot().recycledNotes[0].history.length, caseName('ShortcutRecycleLifecycle', '0004')).assertEqual(1);
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0004')).assertEqual('独立草稿正文');
        expect(decodeBusinessDocument(io.value).editNoteId, caseName('ShortcutRecycleLifecycle', '0004')).assertEqual('');
        expect(store.snapshot().draftDirty, caseName('ShortcutRecycleLifecycle', '0004')).assertFalse();
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
    it(caseName('ShortcutRecycleLifecycle', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0005'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('持久编辑'); await store.keepEditDraft();
        const before: string = io.value; const writes: number = io.writes;
        expect(store.requiresTrashEditDecision('active-0'), caseName('ShortcutRecycleLifecycle', '0005')).assertTrue();
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0005')).assertFalse();
        expect(store.snapshot().draftDirty, caseName('ShortcutRecycleLifecycle', '0005')).assertFalse();
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0005')).assertEqual(writes);
        expect(io.value, caseName('ShortcutRecycleLifecycle', '0005')).assertEqual(before);
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleLifecycle', '0005')).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleLifecycle', '0005')).assertEqual('持久编辑');
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
    it(caseName('ShortcutRecycleLifecycle', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0006'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('取消时保留');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.CANCEL), caseName('ShortcutRecycleLifecycle', '0006')).assertFalse();
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0006')).assertEqual('取消时保留');
        expect(store.historyFor('active-0')[0].body, caseName('ShortcutRecycleLifecycle', '0006')).assertEqual('旧正文0');
        expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleLifecycle', '0006')).assertEqual(0);
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0006')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0007'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-1'); store.setDraftBody('另一篇已保留'); await store.keepEditDraft();
        store.setDraftBody('另一篇内存中的后续编辑');
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0007')).assertTrue();
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleLifecycle', '0007')).assertEqual('active-1');
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0007')).assertEqual('另一篇内存中的后续编辑');
        expect(store.hasUnsavedNoteWork(), caseName('ShortcutRecycleLifecycle', '0007')).assertTrue();
        const saved: StoredData = decodeBusinessDocument(io.value);
        expect(saved.editBody, caseName('ShortcutRecycleLifecycle', '0007')).assertEqual('另一篇已保留');
        expect(saved.recycleBin[0].note.id, caseName('ShortcutRecycleLifecycle', '0007')).assertEqual('active-0');
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
    it(caseName('ShortcutRecycleLifecycle', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0008'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftTitle('  '); store.setDraftBody('\n');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleLifecycle', '0008')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleLifecycle', '0008')).assertEqual('请输入标题或内容');
        expect(store.snapshot().notes[0].title, caseName('ShortcutRecycleLifecycle', '0008')).assertEqual('正式标题0');
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleLifecycle', '0008')).assertEqual('active-0');
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0008')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0009'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 50));
        const store: BusinessStore = await openRecycle(scope, io);
        const before: string = io.value;
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0009')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleLifecycle', '0009')).assertEqual('回收站已满，请先清理');
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleLifecycle', '0009')).assertEqual('active-0');
        expect(store.snapshot().recycledNotes.some(
          (entry: RecycledNote): boolean => entry.trashId === 'trash-1'), caseName('ShortcutRecycleLifecycle', '0009')).assertTrue();
        expect(io.value, caseName('ShortcutRecycleLifecycle', '0009')).assertEqual(before);
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0009')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0010'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(50, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0010')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleLifecycle', '0010')).assertEqual('便签已满，请先释放名额');
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0010')).assertEqual(0);
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleLifecycle', '0010')).assertEqual('回收正文0');
        await store.deleteNote('active-0');
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0010')).assertTrue();
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleLifecycle', '0010')).assertEqual('recycled-0');
        expect(store.snapshot().notes.length, caseName('ShortcutRecycleLifecycle', '0010')).assertEqual(50);
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
    it(caseName('ShortcutRecycleLifecycle', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0011'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(0, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        await store.restoreTrashedNote('trash-1'); await store.deleteNote('recycled-0');
        expect(store.snapshot().recycledNotes[0].trashId, caseName('ShortcutRecycleLifecycle', '0011')).assertEqual('trash-2');
        const writes: number = io.writes;
        expect(await store.purgeTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0011')).assertFalse();
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0011')).assertFalse();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleLifecycle', '0011')).assertEqual('回收正文0');
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0011')).assertEqual(writes);
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
    it(caseName('ShortcutRecycleLifecycle', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0012'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.purgeTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0012')).assertTrue();
        expect(store.snapshot().recycledNotes.map((entry: RecycledNote): string => entry.trashId).join(','), caseName('ShortcutRecycleLifecycle', '0012'))
          .assertEqual('trash-2');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0012')).assertEqual('正式正文0');
        expect(decodeBusinessDocument(io.value).recycleSequence, caseName('ShortcutRecycleLifecycle', '0012')).assertEqual(2);
        store.dispose();
        const reopened: BusinessStore = await openRecycle(scope, io);
        expect(await reopened.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0012')).assertFalse();
        expect(reopened.snapshot().recycledNotes[0].history[0].noteId, caseName('ShortcutRecycleLifecycle', '0012')).assertEqual('recycled-1');
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
    it(caseName('ShortcutRecycleLifecycle', '0013'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0013'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(0, 2, clock.now() - NOTE_RECYCLE_RETENTION_MS);
        data.recycleBin[1].deletedAt--;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        expect(store.snapshot().expiredTrashCount, caseName('ShortcutRecycleLifecycle', '0013')).assertEqual(1);
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0013')).assertTrue();
        expect(await store.restoreTrashedNote('trash-2'), caseName('ShortcutRecycleLifecycle', '0013')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleLifecycle', '0013')).assertEqual('已超过30天保留期，不能恢复');
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleLifecycle', '0013')).assertEqual('recycled-0');
        expect(store.snapshot().recycledNotes[0].trashId, caseName('ShortcutRecycleLifecycle', '0013')).assertEqual('trash-2');
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
    it(caseName('ShortcutRecycleLifecycle', '0014'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0014'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = JSON.stringify(recycleInput(0, 1, clock.now() + NOTE_RECYCLE_RETENTION_MS));
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const result = await store.purgeExpiredNotes();
        expect(result.success, caseName('ShortcutRecycleLifecycle', '0014')).assertTrue();
        expect(result.removed, caseName('ShortcutRecycleLifecycle', '0014')).assertEqual(0);
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0014')).assertEqual(0);
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0014')).assertTrue();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0014')).assertEqual('回收正文0');
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
    it(caseName('ShortcutRecycleLifecycle', '0015'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0015'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(1, 3, clock.now());
        data.recycleBin[0].deletedAt = clock.now() - NOTE_RECYCLE_RETENTION_MS - 1;
        data.recycleBin[1].deletedAt = clock.now() - NOTE_RECYCLE_RETENTION_MS - 2000;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const result = await store.purgeExpiredNotes();
        expect(result.success, caseName('ShortcutRecycleLifecycle', '0015')).assertTrue();
        expect(result.removed, caseName('ShortcutRecycleLifecycle', '0015')).assertEqual(2);
        expect(store.snapshot().recycledNotes[0].trashId, caseName('ShortcutRecycleLifecycle', '0015')).assertEqual('trash-3');
        expect(store.snapshot().notes[0].title, caseName('ShortcutRecycleLifecycle', '0015')).assertEqual('正式标题0');
        expect(decodeBusinessDocument(io.value).recycleSequence, caseName('ShortcutRecycleLifecycle', '0015')).assertEqual(3);
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0015')).assertEqual(1);
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
    it(caseName('ShortcutRecycleLifecycle', '0016'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0016'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(0, 1);
        data.recycleBin[0].note.id = `${clock.now()}-1`;
        data.recycleBin[0].history[0].noteId = data.recycleBin[0].note.id;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        store.setDraftTitle('新建的另一篇'); store.setDraftBody('新内容');
        expect(await store.saveNote(), caseName('ShortcutRecycleLifecycle', '0016')).assertTrue();
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleLifecycle', '0016')).assertEqual(`${clock.now()}-2`);
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0016')).assertTrue();
        expect(store.snapshot().notes.map((note): string => note.id).join(','), caseName('ShortcutRecycleLifecycle', '0016'))
          .assertEqual(`${clock.now()}-1,${clock.now()}-2`);
        expect(store.snapshot().notes[1].body, caseName('ShortcutRecycleLifecycle', '0016')).assertEqual('新内容');
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
    it(caseName('ShortcutRecycleLifecycle', '0017'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0017'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1); data.recycleSequence = Number.MAX_SAFE_INTEGER;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0017')).assertFalse();
        expect(store.errorText(), caseName('ShortcutRecycleLifecycle', '0017')).assertEqual('回收站编号已达上限');
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleLifecycle', '0017')).assertEqual('active-0');
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0017')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0018'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0018'), async (scope: CaseScope): Promise<void> => {
        const data: StoredData = recycleInput(1, 1);
        for (let index: number = 2; index <= 99; index++) {
          data.noteHistory.push(new NoteRevision(`older-${index}`, 'active-0', `历史${index}`, '历史正文', index, 'edit'));
        }
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('新增修订后的正文');
        expect(await store.saveNote(), caseName('ShortcutRecycleLifecycle', '0018')).assertTrue();
        const saved: StoredData = decodeBusinessDocument(io.value);
        expect(saved.noteHistory.length + saved.recycleBin[0].history.length, caseName('ShortcutRecycleLifecycle', '0018')).assertEqual(100);
        expect(saved.noteHistory.some(
          (revision: NoteRevision): boolean => revision.revisionId === 'active-history-0'), caseName('ShortcutRecycleLifecycle', '0018')).assertFalse();
        expect(saved.recycleBin[0].note.body, caseName('ShortcutRecycleLifecycle', '0018')).assertEqual('回收正文0');
        expect(saved.recycleBin[0].history[0].revisionId, caseName('ShortcutRecycleLifecycle', '0018')).assertEqual('recycled-history-0');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0018')).assertEqual('新增修订后的正文');
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
    it(caseName('ShortcutRecycleLifecycle', '0019'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0019'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftTitle('  '); store.setDraftBody(' 第一行保留\n第二行 ');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleLifecycle', '0019')).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.title, caseName('ShortcutRecycleLifecycle', '0019')).assertEqual('第一行保留');
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleLifecycle', '0019')).assertEqual('第一行保留\n第二行');
        expect(store.snapshot().recycledNotes[0].history[0].title, caseName('ShortcutRecycleLifecycle', '0019')).assertEqual('正式标题0');
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0019')).assertEqual('独立草稿正文');
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
    it(caseName('ShortcutRecycleLifecycle', '0020'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0020'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('目标已保留内容'); await store.keepEditDraft();
        store.beginEditNote('active-1');
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleLifecycle', '0020')).assertTrue();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleLifecycle', '0020')).assertEqual('目标已保留内容');
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleLifecycle', '0020')).assertEqual('active-1');
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0020')).assertEqual('正式正文1');
        expect(decodeBusinessDocument(io.value).editNoteId, caseName('ShortcutRecycleLifecycle', '0020')).assertEqual('');
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
    it(caseName('ShortcutRecycleLifecycle', '0021'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0021'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        store.setDraftTitle('正在写的新便签'); store.setDraftBody('不能被恢复操作覆盖');
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0021')).assertTrue();
        expect(store.snapshot().draftTitle, caseName('ShortcutRecycleLifecycle', '0021')).assertEqual('正在写的新便签');
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleLifecycle', '0021')).assertEqual('不能被恢复操作覆盖');
        expect(store.hasUnsavedNoteWork(), caseName('ShortcutRecycleLifecycle', '0021')).assertTrue();
        expect(decodeBusinessDocument(io.value).draftBody, caseName('ShortcutRecycleLifecycle', '0021')).assertEqual('独立草稿正文');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0021')).assertEqual('回收正文0');
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
    it(caseName('ShortcutRecycleLifecycle', '0022'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0022'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(1, 1);
        data.recycleBin[0].history[0].revisionId = `${clock.now()}-r1`;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        store.beginEditNote('active-0'); store.setDraftBody('新的真实编辑');
        expect(await store.saveNote(), caseName('ShortcutRecycleLifecycle', '0022')).assertTrue();
        expect(store.historyFor('active-0')[0].revisionId, caseName('ShortcutRecycleLifecycle', '0022')).assertEqual(`${clock.now()}-r2`);
        expect(store.snapshot().recycledNotes[0].history[0].revisionId, caseName('ShortcutRecycleLifecycle', '0022')).assertEqual(`${clock.now()}-r1`);
        expect(store.snapshot().recycledNotes[0].history[0].body, caseName('ShortcutRecycleLifecycle', '0022')).assertEqual('回收旧正文0');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleLifecycle', '0022')).assertEqual('新的真实编辑');
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
    it(caseName('ShortcutRecycleLifecycle', '0023'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0023'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const before: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.deleteNote('missing-note'), caseName('ShortcutRecycleLifecycle', '0023')).assertFalse();
        expect(await store.purgeTrashedNote('active-0'), caseName('ShortcutRecycleLifecycle', '0023')).assertFalse();
        expect(await store.restoreTrashedNote('recycled-0'), caseName('ShortcutRecycleLifecycle', '0023')).assertFalse();
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleLifecycle', '0023')).assertEqual('active-0');
        expect(io.value, caseName('ShortcutRecycleLifecycle', '0023')).assertEqual(before);
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0023')).assertEqual(0);
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
    it(caseName('ShortcutRecycleLifecycle', '0024'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleLifecycle', '0024'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const original: string = io.value; io.failRead = true;
        const store: BusinessStore = await openRecycle(scope, io);
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleLifecycle', '0024')).assertFalse();
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0024')).assertFalse();
        expect(await store.purgeTrashedNote('trash-1'), caseName('ShortcutRecycleLifecycle', '0024')).assertFalse();
        expect((await store.purgeExpiredNotes()).success, caseName('ShortcutRecycleLifecycle', '0024')).assertFalse();
        expect(io.value, caseName('ShortcutRecycleLifecycle', '0024')).assertEqual(original);
        expect(io.writes, caseName('ShortcutRecycleLifecycle', '0024')).assertEqual(0);
      });
    });
  });
}
