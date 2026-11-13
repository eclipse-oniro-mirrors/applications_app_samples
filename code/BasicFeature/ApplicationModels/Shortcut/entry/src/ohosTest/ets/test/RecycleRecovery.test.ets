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
import { BusinessStore, StoredData, decodeBusinessDocument } from '../../../main/ets/business/BusinessStore';
import { TrashEditDecision, NOTE_RECYCLE_RETENTION_MS } from '../../../main/ets/business/NoteRecyclePolicy';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { waitBusiness } from '../support/CoverageFixture';
import { Deferred } from '../support/ShortcutFixture';
import {
  RecycleBusinessStorage, RecycleWriteFault, recycleInput, openRecycle
} from '../support/RecycleBusinessFixture';

/** All new storage-stage scenarios are pending the final unified gate. */
export default function recycleRecoveryTests(): void {
  describe('RecycleRecovery', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0100
     * @tc.name testShortcutRecycleRecovery0001
     * @tc.desc 已知写前失败不会移走目标正文或编辑缓冲
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0001'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('失败时保持编辑'); io.failWrite = true;
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleRecovery', '0001'), 'RecycleRecovery.test.ets:A0001').assertFalse();
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleRecovery', '0001'), 'RecycleRecovery.test.ets:A0002').assertEqual('失败时保持编辑');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleRecovery', '0001'), 'RecycleRecovery.test.ets:A0003').assertEqual('正式正文0');
        expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleRecovery', '0001'), 'RecycleRecovery.test.ets:A0004').assertEqual(0);
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0001'), 'RecycleRecovery.test.ets:A0005').assertFalse();
        expect(io.value, caseName('ShortcutRecycleRecovery', '0001'), 'RecycleRecovery.test.ets:A0006').assertEqual(original);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0200
     * @tc.name testShortcutRecycleRecovery0002
     * @tc.desc 写入未完成时不先清编辑成功后才整体移入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0002'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('等待写入的编辑');
        io.writeGate = new Deferred<void>();
        const pending: Promise<boolean> = store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES);
        expect(store.snapshot().busy, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0007').assertTrue();
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0008').assertEqual('active-0');
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0009').assertEqual('正式正文0');
        expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0010').assertEqual(0);
        io.writeGate.resolve(undefined);
        expect(await pending, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0011').assertTrue();
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0012').assertEqual('');
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleRecovery', '0002'), 'RecycleRecovery.test.ets:A0013').assertEqual('等待写入的编辑');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0300
     * @tc.name testShortcutRecycleRecovery0003
     * @tc.desc 恢复写前失败不从回收站移除且不创建活动副本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0003'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io); io.failWrite = true;
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleRecovery', '0003'), 'RecycleRecovery.test.ets:A0014').assertFalse();
        expect(store.snapshot().notes.map((note): string => note.id).join(','), caseName('ShortcutRecycleRecovery', '0003'), 'RecycleRecovery.test.ets:A0015').assertEqual('active-0');
        expect(store.snapshot().recycledNotes[0].history[0].body, caseName('ShortcutRecycleRecovery', '0003'), 'RecycleRecovery.test.ets:A0016').assertEqual('回收旧正文0');
        expect(io.value, caseName('ShortcutRecycleRecovery', '0003'), 'RecycleRecovery.test.ets:A0017').assertEqual(original);
        expect(store.snapshot().busy, caseName('ShortcutRecycleRecovery', '0003'), 'RecycleRecovery.test.ets:A0018').assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0400
     * @tc.name testShortcutRecycleRecovery0004
     * @tc.desc 永久删除写前失败保留原回收项及其它历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0004'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const original: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io); io.failWrite = true;
        expect(await store.purgeTrashedNote('trash-1'), caseName('ShortcutRecycleRecovery', '0004'), 'RecycleRecovery.test.ets:A0019').assertFalse();
        expect(io.value, caseName('ShortcutRecycleRecovery', '0004'), 'RecycleRecovery.test.ets:A0020').assertEqual(original);
        expect(store.snapshot().recycledNotes.some((entry): boolean => entry.trashId === 'trash-1'), caseName('ShortcutRecycleRecovery', '0004'), 'RecycleRecovery.test.ets:A0021').assertTrue();
        expect(store.historyFor('active-0')[0].body, caseName('ShortcutRecycleRecovery', '0004'), 'RecycleRecovery.test.ets:A0022').assertEqual('旧正文0');
        expect(store.errorText(), caseName('ShortcutRecycleRecovery', '0004'), 'RecycleRecovery.test.ets:A0023').assertEqual('保存失败，请重试');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0500
     * @tc.name testShortcutRecycleRecovery0005
     * @tc.desc 过期清理写前失败不能报告已清数量且可显式重试
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0005'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const io: RecycleBusinessStorage = new RecycleBusinessStorage();
        io.value = JSON.stringify(recycleInput(1, 1, clock.now() - NOTE_RECYCLE_RETENTION_MS - 1));
        const store: BusinessStore = await openRecycle(scope, io, clock); io.failWrite = true;
        const failed = await store.purgeExpiredNotes();
        expect(failed.success, caseName('ShortcutRecycleRecovery', '0005'), 'RecycleRecovery.test.ets:A0024').assertFalse();
        expect(failed.removed, caseName('ShortcutRecycleRecovery', '0005'), 'RecycleRecovery.test.ets:A0025').assertEqual(0);
        expect(store.snapshot().expiredTrashCount, caseName('ShortcutRecycleRecovery', '0005'), 'RecycleRecovery.test.ets:A0026').assertEqual(1);
        io.failWrite = false;
        const retried = await store.purgeExpiredNotes();
        expect(retried.removed, caseName('ShortcutRecycleRecovery', '0005'), 'RecycleRecovery.test.ets:A0027').assertEqual(1);
        expect(store.snapshot().recycledNotes.length, caseName('ShortcutRecycleRecovery', '0005'), 'RecycleRecovery.test.ets:A0028').assertEqual(0);
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleRecovery', '0005'), 'RecycleRecovery.test.ets:A0029').assertEqual('active-0');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0600
     * @tc.name testShortcutRecycleRecovery0006
     * @tc.desc 写入已产生效果但响应失败时隔离内存并禁止盲目重放
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0006'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io); io.fault = RecycleWriteFault.UNKNOWN_AFTER;
        expect(await store.deleteNote('active-0'), caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0030').assertFalse();
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0031').assertTrue();
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0032').assertEqual('active-0');
        expect(decodeBusinessDocument(io.value).recycleBin[0].note.id, caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0033').assertEqual('active-0');
        expect(await store.deleteNote('active-1'), caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0034').assertFalse();
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0035').assertEqual(1);
        expect(store.hasUnsavedNoteWork(), caseName('ShortcutRecycleRecovery', '0006'), 'RecycleRecovery.test.ets:A0036').assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0700
     * @tc.name testShortcutRecycleRecovery0007
     * @tc.desc 重新读取精确候选后才应用已确认的编辑移入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0007'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('核对后保留的最终编辑');
        io.fault = RecycleWriteFault.UNKNOWN_AFTER;
        await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES);
        const candidate: string = io.value;
        expect(await store.recoverStorage(), caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0037').assertTrue();
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0038').assertFalse();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0039').assertEqual('核对后保留的最终编辑');
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0040').assertEqual('独立草稿正文');
        expect(io.value, caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0041').assertEqual(candidate);
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0042').assertEqual(1);
        expect(io.reloads, caseName('ShortcutRecycleRecovery', '0007'), 'RecycleRecovery.test.ets:A0043').assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0800
     * @tc.name testShortcutRecycleRecovery0008
     * @tc.desc 核对确认写入未生效时保留原编辑并允许用户重新操作
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0008'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        store.beginEditNote('active-0'); store.setDraftBody('写前未知失败的编辑');
        io.fault = RecycleWriteFault.UNKNOWN_BEFORE;
        await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES);
        expect(await store.recoverStorage(), caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0044').assertTrue();
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0045').assertFalse();
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0046').assertEqual('写前未知失败的编辑');
        expect(store.snapshot().editingNoteId, caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0047').assertEqual('active-0');
        io.fault = RecycleWriteFault.NONE;
        expect(await store.moveNoteToTrash('active-0', TrashEditDecision.KEEP_CHANGES), caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0048').assertTrue();
        expect(store.snapshot().recycledNotes[0].trashId, caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0049').assertEqual('trash-1');
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0008'), 'RecycleRecovery.test.ets:A0050').assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_0900
     * @tc.name testShortcutRecycleRecovery0009
     * @tc.desc 核对得到损坏原文仍保持隔离且不覆盖当前编辑
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0009'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io); io.fault = RecycleWriteFault.UNKNOWN_AFTER;
        await store.deleteNote('active-0'); io.value = '{corrupted';
        expect(await store.recoverStorage(), caseName('ShortcutRecycleRecovery', '0009'), 'RecycleRecovery.test.ets:A0051').assertFalse();
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0009'), 'RecycleRecovery.test.ets:A0052').assertTrue();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleRecovery', '0009'), 'RecycleRecovery.test.ets:A0053').assertEqual('正式正文0');
        expect(await store.toggleFavorite('reading'), caseName('ShortcutRecycleRecovery', '0009'), 'RecycleRecovery.test.ets:A0054').assertFalse();
        expect(io.value, caseName('ShortcutRecycleRecovery', '0009'), 'RecycleRecovery.test.ets:A0055').assertEqual('{corrupted');
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0009'), 'RecycleRecovery.test.ets:A0056').assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1000
     * @tc.name testShortcutRecycleRecovery0010
     * @tc.desc 核对第三方有效文档不能擅自认作本次候选或覆盖磁盘
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0010'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io); io.fault = RecycleWriteFault.UNKNOWN_AFTER;
        await store.deleteNote('active-0');
        const external: StoredData = recycleInput(1); external.notes[0].body = '其它来源的新正文';
        io.value = JSON.stringify(external); const third: string = io.value;
        expect(await store.recoverStorage(), caseName('ShortcutRecycleRecovery', '0010'), 'RecycleRecovery.test.ets:A0057').assertFalse();
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0010'), 'RecycleRecovery.test.ets:A0058').assertTrue();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleRecovery', '0010'), 'RecycleRecovery.test.ets:A0059').assertEqual('正式正文0');
        expect(io.value, caseName('ShortcutRecycleRecovery', '0010'), 'RecycleRecovery.test.ets:A0060').assertEqual(third);
        expect(store.errorText(), caseName('ShortcutRecycleRecovery', '0010'), 'RecycleRecovery.test.ets:A0061').assertEqual('存储出现其它更改，未覆盖；请保留当前编辑并核对');
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0010'), 'RecycleRecovery.test.ets:A0062').assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1100
     * @tc.name testShortcutRecycleRecovery0011
     * @tc.desc 核对读取失败后可再读精确候选而不再次执行写操作
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0011'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io); io.fault = RecycleWriteFault.UNKNOWN_AFTER;
        await store.deleteNote('active-0'); io.failReload = true;
        expect(await store.recoverStorage(), caseName('ShortcutRecycleRecovery', '0011'), 'RecycleRecovery.test.ets:A0063').assertFalse();
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0011'), 'RecycleRecovery.test.ets:A0064').assertTrue();
        io.failReload = false;
        expect(await store.recoverStorage(), caseName('ShortcutRecycleRecovery', '0011'), 'RecycleRecovery.test.ets:A0065').assertTrue();
        expect(store.snapshot().recycledNotes[0].note.id, caseName('ShortcutRecycleRecovery', '0011'), 'RecycleRecovery.test.ets:A0066').assertEqual('active-0');
        expect(io.reloads, caseName('ShortcutRecycleRecovery', '0011'), 'RecycleRecovery.test.ets:A0067').assertEqual(2);
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0011'), 'RecycleRecovery.test.ets:A0068').assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1200
     * @tc.name testShortcutRecycleRecovery0012
     * @tc.desc 同实例重初始化须等待旧物理写结束后再读取完整回收存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0012'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io); io.writeGate = new Deferred<void>();
        const old: Promise<boolean> = store.deleteNote('active-0');
        store.dispose(); store.initialize(getTestContext());
        expect(io.reads, caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0069').assertEqual(1);
        expect(store.snapshot().loading, caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0070').assertTrue();
        io.writeGate.resolve(undefined);
        expect(await old, caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0071').assertFalse();
        await waitBusiness(scope, store);
        expect(store.snapshot().notes.map((note): string => note.id).join(','), caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0072').assertEqual('active-1');
        expect(store.snapshot().recycledNotes[0].note.id, caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0073').assertEqual('active-0');
        expect(io.reads, caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0074').assertEqual(2);
        expect(store.snapshot().message, caseName('ShortcutRecycleRecovery', '0012'), 'RecycleRecovery.test.ets:A0075').assertEqual('');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1300
     * @tc.name testShortcutRecycleRecovery0013
     * @tc.desc 写操作在途时其它删除和恢复不会重复提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0013'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0013'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(2, 1));
        const store: BusinessStore = await openRecycle(scope, io); io.writeGate = new Deferred<void>();
        const first: Promise<boolean> = store.deleteNote('active-0');
        expect(await store.deleteNote('active-1'), caseName('ShortcutRecycleRecovery', '0013'), 'RecycleRecovery.test.ets:A0076').assertFalse();
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleRecovery', '0013'), 'RecycleRecovery.test.ets:A0077').assertFalse();
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0013'), 'RecycleRecovery.test.ets:A0078').assertEqual(1);
        io.writeGate.resolve(undefined);
        expect(await first, caseName('ShortcutRecycleRecovery', '0013'), 'RecycleRecovery.test.ets:A0079').assertTrue();
        expect(store.snapshot().notes[0].id, caseName('ShortcutRecycleRecovery', '0013'), 'RecycleRecovery.test.ets:A0080').assertEqual('active-1');
        expect(store.snapshot().recycledNotes.some((entry): boolean => entry.trashId === 'trash-1'), caseName('ShortcutRecycleRecovery', '0013'), 'RecycleRecovery.test.ets:A0081').assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1400
     * @tc.name testShortcutRecycleRecovery0014
     * @tc.desc 回收快照的嵌套正文和历史可修改但不能污染实际恢复数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0014'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0014'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        const snapshot = store.snapshot();
        snapshot.recycledNotes[0].note.body = '调用者篡改正文';
        snapshot.recycledNotes[0].history[0].body = '调用者篡改历史';
        snapshot.recycledNotes.length = 0;
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleRecovery', '0014'), 'RecycleRecovery.test.ets:A0082').assertEqual('回收正文0');
        expect(await store.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleRecovery', '0014'), 'RecycleRecovery.test.ets:A0083').assertTrue();
        expect(store.snapshot().notes[0].body, caseName('ShortcutRecycleRecovery', '0014'), 'RecycleRecovery.test.ets:A0084').assertEqual('回收正文0');
        expect(store.historyFor('recycled-0')[0].body, caseName('ShortcutRecycleRecovery', '0014'), 'RecycleRecovery.test.ets:A0085').assertEqual('回收旧正文0');
        expect(decodeBusinessDocument(io.value).notes[0].id, caseName('ShortcutRecycleRecovery', '0014'), 'RecycleRecovery.test.ets:A0086').assertEqual('recycled-0');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1500
     * @tc.name testShortcutRecycleRecovery0015
     * @tc.desc 收藏待办和独立草稿提交不能漏拷回收区且重开两侧均可用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0015'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0015'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 1));
        const store: BusinessStore = await openRecycle(scope, io);
        await store.toggleFavorite('reading');
        await store.setTodoDone(store.snapshot().todos[0].id, true);
        store.setDraftBody('交叉提交的新草稿'); await store.keepDraft(); store.dispose();
        const reopened: BusinessStore = await openRecycle(scope, io);
        expect(reopened.snapshot().favoriteIds.join(','), caseName('ShortcutRecycleRecovery', '0015'), 'RecycleRecovery.test.ets:A0087').assertEqual('reading');
        expect(reopened.snapshot().todos[0].done, caseName('ShortcutRecycleRecovery', '0015'), 'RecycleRecovery.test.ets:A0088').assertTrue();
        expect(reopened.snapshot().draftBody, caseName('ShortcutRecycleRecovery', '0015'), 'RecycleRecovery.test.ets:A0089').assertEqual('交叉提交的新草稿');
        expect(reopened.snapshot().recycledNotes[0].history[0].body, caseName('ShortcutRecycleRecovery', '0015'), 'RecycleRecovery.test.ets:A0090').assertEqual('回收旧正文0');
        expect(await reopened.restoreTrashedNote('trash-1'), caseName('ShortcutRecycleRecovery', '0015'), 'RecycleRecovery.test.ets:A0091').assertTrue();
        expect(reopened.snapshot().notes[0].body, caseName('ShortcutRecycleRecovery', '0015'), 'RecycleRecovery.test.ets:A0092').assertEqual('回收正文0');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLERECOVERY_1600
     * @tc.name testShortcutRecycleRecovery0016
     * @tc.desc 旧代次响应未知但已落盘时新代次从真实盘面恢复而不套用旧回调
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutRecycleRecovery', '0016'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutRecycleRecovery', '0016'), async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput());
        const store: BusinessStore = await openRecycle(scope, io);
        io.writeGate = new Deferred<void>(); io.fault = RecycleWriteFault.UNKNOWN_AFTER;
        const old: Promise<boolean> = store.deleteNote('active-0');
        store.dispose(); store.initialize(getTestContext()); io.writeGate.resolve(undefined);
        expect(await old, caseName('ShortcutRecycleRecovery', '0016'), 'RecycleRecovery.test.ets:A0093').assertFalse();
        await waitBusiness(scope, store);
        expect(store.snapshot().storageRecoveryRequired, caseName('ShortcutRecycleRecovery', '0016'), 'RecycleRecovery.test.ets:A0094').assertFalse();
        expect(store.snapshot().recycledNotes[0].note.body, caseName('ShortcutRecycleRecovery', '0016'), 'RecycleRecovery.test.ets:A0095').assertEqual('正式正文0');
        expect(store.snapshot().message, caseName('ShortcutRecycleRecovery', '0016'), 'RecycleRecovery.test.ets:A0096').assertEqual('');
        expect(store.snapshot().draftBody, caseName('ShortcutRecycleRecovery', '0016'), 'RecycleRecovery.test.ets:A0097').assertEqual('独立草稿正文');
        expect(io.writes, caseName('ShortcutRecycleRecovery', '0016'), 'RecycleRecovery.test.ets:A0098').assertEqual(1);
      });
    });
  });
}
