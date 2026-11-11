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
import { BusinessStore, StoredData } from '../../../main/ets/business/BusinessStore';
import { RecycleBatchAction, RecycleBatchPreview } from '../../../main/ets/business/RecycleBatch';
import { NOTE_RECYCLE_RETENTION_MS } from '../../../main/ets/business/NoteRecyclePolicy';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { waitBusiness } from '../support/CoverageFixture';
import { Deferred } from '../support/ShortcutFixture';
import { RecycleBusinessStorage, recycleInput, openRecycle } from '../support/RecycleBusinessFixture';

/** Pending unified validation; preview is an actual session-bound capability, never persisted. */
export default function recycleBatchPreviewTests(): void {
  describe('RecycleBatchPreview', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0100
     * @tc.name testShortcutRecycleBatchPreview0001
     * @tc.desc 预览给出真实目标历史与容量且不改盘面或活动列表
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 3));
        const before: string = io.value;
        const store: BusinessStore = await openRecycle(scope, io);
        const preview: RecycleBatchPreview = store.previewRecycleBatch(
          ['trash-3', 'trash-1'], RecycleBatchAction.RESTORE);
        expect(preview.eligible).assertTrue();
        expect(preview.rows.map((row): string => row.noteId).join(',')).assertEqual('recycled-2,recycled-0');
        expect(preview.rows[0].historyCount).assertEqual(1);
        expect(preview.availableSlots).assertEqual(49);
        expect(preview.resultingActiveCount).assertEqual(3);
        expect(preview.resultingTrashCount).assertEqual(1);
        expect(io.value).assertEqual(before);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0200
     * @tc.name testShortcutRecycleBatchPreview0002
     * @tc.desc 空选择及超过五十项选择整体无效不隐式截取目标
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 3));
        const store: BusinessStore = await openRecycle(scope, io);
        const excessive: string[] = [];
        for (let index: number = 1; index <= 51; index++) { excessive.push(`trash-${index}`); }
        for (const selection of [[], excessive]) {
          const preview = store.previewRecycleBatch(selection, RecycleBatchAction.PURGE);
          expect(preview.eligible).assertFalse();
          expect(preview.errors.includes('请选择1至50个回收项')).assertTrue();
          expect((await store.applyRecycleBatch(preview.token)).affected).assertEqual(0);
          expect(io.writes).assertEqual(0);
        }
        expect(store.snapshot().recycledNotes.length).assertEqual(3);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0300
     * @tc.name testShortcutRecycleBatchPreview0003
     * @tc.desc 重复标识不会被静默去重后执行部分选择
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const preview = store.previewRecycleBatch(['trash-1', 'trash-1'], RecycleBatchAction.RESTORE);
        expect(preview.errors.includes('选择含重复回收标识')).assertTrue();
        const result = await store.applyRecycleBatch(preview.token);
        expect(result.success).assertFalse();
        expect(result.affected).assertEqual(0);
        expect(store.snapshot().notes[0].id).assertEqual('active-0');
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0400
     * @tc.name testShortcutRecycleBatchPreview0004
     * @tc.desc 有效项与缺失项混选时审查显示缺口且全体拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const preview = store.previewRecycleBatch(['trash-1', 'trash-99'], RecycleBatchAction.RESTORE);
        expect(preview.rows[0].eligible).assertTrue();
        expect(preview.rows[1].reason).assertEqual('条目不存在或已变化');
        expect((await store.applyRecycleBatch(preview.token)).success).assertFalse();
        expect(store.snapshot().recycledNotes.some((entry): boolean => entry.trashId === 'trash-1')).assertTrue();
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0500
     * @tc.name testShortcutRecycleBatchPreview0005
     * @tc.desc 已过期项阻止整批恢复但不阻止明确永久删除的预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const data: StoredData = recycleInput(1, 2);
        data.recycleBin[1].deletedAt = clock.now() - NOTE_RECYCLE_RETENTION_MS - 1;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const restore = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE);
        expect(restore.eligible).assertFalse();
        expect(restore.rows[1].reason).assertEqual('超过30天保留期');
        expect((await store.applyRecycleBatch(restore.token)).affected).assertEqual(0);
        const purge = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.PURGE);
        expect(purge.eligible).assertTrue();
        expect(purge.resultingTrashCount).assertEqual(0);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0600
     * @tc.name testShortcutRecycleBatchPreview0006
     * @tc.desc 每项单独可恢复但总名额不足时整批不部分恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0006', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(49, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const preview = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE);
        expect(preview.rows.every((row): boolean => row.eligible)).assertTrue();
        expect(preview.errors.includes('活动便签名额不足：需要2，可用1')).assertTrue();
        expect((await store.applyRecycleBatch(preview.token)).affected).assertEqual(0);
        expect(store.snapshot().notes.length).assertEqual(49);
        expect(store.snapshot().recycledNotes.length).assertEqual(2);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0700
     * @tc.name testShortcutRecycleBatchPreview0007
     * @tc.desc 活动容量已满不影响批量永久删除回收项预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0007', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(50, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const preview = store.previewRecycleBatch(['trash-2', 'trash-1'], RecycleBatchAction.PURGE);
        expect(preview.eligible).assertTrue();
        expect(preview.availableSlots).assertEqual(0);
        expect(preview.resultingActiveCount).assertEqual(50);
        expect(preview.resultingTrashCount).assertEqual(0);
        expect(preview.resultingHistoryCount).assertEqual(50);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0800
     * @tc.name testShortcutRecycleBatchPreview0008
     * @tc.desc 修改调用者选择数组或返回预览不能改变私有确认目标
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0008', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 3));
        const store: BusinessStore = await openRecycle(scope, io);
        const ids: string[] = ['trash-1', 'trash-2'];
        const preview = store.previewRecycleBatch(ids, RecycleBatchAction.RESTORE);
        ids[0] = 'trash-3';
        preview.rows[0].trashId = 'trash-3';
        preview.rows[0].title = '篡改';
        preview.errors.push('注入');
        const owned = store.snapshot().recycleBatchPreview;
        if (owned === undefined) { throw new Error('missing owned preview'); }
        expect(owned.rows[0].trashId).assertEqual('trash-1');
        expect(owned.rows[0].title).assertEqual('回收标题0');
        expect((await store.applyRecycleBatch(preview.token)).affected).assertEqual(2);
        expect(store.snapshot().notes.map((note): string => note.id).join(','))
          .assertEqual('recycled-0,recycled-1,active-0');
        expect(store.snapshot().recycledNotes[0].trashId).assertEqual('trash-3');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0900
     * @tc.name testShortcutRecycleBatchPreview0009
     * @tc.desc 未加载和写入在途时预览不会授予可执行令牌
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0009', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = new BusinessStore(io, new FixedBusinessClock().now);
        scope.cleanup((): void => { store.dispose(); io.release(); });
        const cold = store.previewRecycleBatch(['trash-1'], RecycleBatchAction.PURGE);
        expect(cold.token).assertEqual('');
        expect(cold.errors.includes('存储尚未就绪')).assertTrue();
        store.initialize(getTestContext()); await waitBusiness(scope, store);
        io.writeGate = new Deferred<void>(); const writing: Promise<boolean> = store.deleteNote('active-0');
        const busy = store.previewRecycleBatch(['trash-1'], RecycleBatchAction.PURGE);
        expect(busy.token).assertEqual('');
        expect(busy.errors.includes('正在保存，请稍候')).assertTrue();
        expect(io.writes).assertEqual(1);
        io.writeGate.resolve(undefined); expect(await writing).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1000
     * @tc.name testShortcutRecycleBatchPreview0010
     * @tc.desc 取消只销毁会话令牌不执行任何回收变更
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0010', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const before: string = io.value; const store: BusinessStore = await openRecycle(scope, io);
        const preview = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.PURGE);
        store.cancelRecycleBatchPreview(preview.token);
        expect(store.snapshot().recycleBatchPreview).assertUndefined();
        expect((await store.applyRecycleBatch(preview.token)).success).assertFalse();
        expect(io.value).assertEqual(before);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1100
     * @tc.name testShortcutRecycleBatchPreview0011
     * @tc.desc 新预览替换旧令牌且旧确认不能取消或执行新选择
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0011', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const old = store.previewRecycleBatch(['trash-1'], RecycleBatchAction.RESTORE);
        const next = store.previewRecycleBatch(['trash-2'], RecycleBatchAction.PURGE);
        store.cancelRecycleBatchPreview(old.token);
        expect((await store.applyRecycleBatch(old.token)).success).assertFalse();
        expect((await store.applyRecycleBatch(next.token)).success).assertTrue();
        expect(store.snapshot().recycledNotes[0].trashId).assertEqual('trash-1');
        expect(store.snapshot().notes[0].id).assertEqual('active-0');
        expect(io.writes).assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1200
     * @tc.name testShortcutRecycleBatchPreview0012
     * @tc.desc 收藏等其它root提交后旧回收预览必须重新审查
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0012', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const old = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE);
        await store.toggleFavorite('reading'); const writes: number = io.writes;
        expect((await store.applyRecycleBatch(old.token)).success).assertFalse();
        expect(store.snapshot().favoriteIds.join(',')).assertEqual('reading');
        expect(store.snapshot().recycledNotes.length).assertEqual(2);
        expect(io.writes).assertEqual(writes);
        const next = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE);
        expect(next.rootRevision > old.rootRevision).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1300
     * @tc.name testShortcutRecycleBatchPreview0013
     * @tc.desc 未落盘但真实root新增今日分区时完整root绑定仍拒绝旧预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0013', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const old = store.previewRecycleBatch(['trash-1'], RecycleBatchAction.RESTORE);
        clock.setDate(2026, 11, 3); store.applyEntryFilter('todayOpen');
        const result = await store.applyRecycleBatch(old.token);
        expect(result.success).assertFalse();
        expect(result.message).assertEqual('数据已变化，请重新预览');
        expect(store.snapshot().todoDate).assertEqual('2026-11-03');
        expect(store.snapshot().recycledNotes.length).assertEqual(2);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1400
     * @tc.name testShortcutRecycleBatchPreview0014
     * @tc.desc 相同盘面重新初始化也不能恢复上一会话预览令牌
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0014', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const old = store.previewRecycleBatch(['trash-1'], RecycleBatchAction.PURGE);
        store.dispose(); store.initialize(getTestContext()); await waitBusiness(scope, store);
        expect((await store.applyRecycleBatch(old.token)).affected).assertEqual(0);
        const next = store.previewRecycleBatch(['trash-1'], RecycleBatchAction.PURGE);
        expect(next.token === old.token).assertFalse();
        expect(next.epoch > old.epoch).assertTrue();
        expect(io.writes).assertEqual(0);
        expect(store.snapshot().recycledNotes.length).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1500
     * @tc.name testShortcutRecycleBatchPreview0015
     * @tc.desc 另一隔离实例的令牌不能碰巧命中本实例相同root预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0015', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const leftIo: RecycleBusinessStorage = new RecycleBusinessStorage();
        leftIo.value = JSON.stringify(recycleInput(1, 2));
        const rightIo: RecycleBusinessStorage = new RecycleBusinessStorage(); rightIo.value = leftIo.value;
        const left: BusinessStore = await openRecycle(scope, leftIo);
        const right: BusinessStore = await openRecycle(scope, rightIo);
        const a = left.previewRecycleBatch(['trash-1'], RecycleBatchAction.RESTORE);
        const b = right.previewRecycleBatch(['trash-1'], RecycleBatchAction.RESTORE);
        expect((await right.applyRecycleBatch(a.token)).success).assertFalse();
        expect((await right.applyRecycleBatch(b.token)).success).assertTrue();
        expect(leftIo.writes).assertEqual(0);
        expect(rightIo.writes).assertEqual(1);
        expect(left.snapshot().recycledNotes.length).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1600
     * @tc.name testShortcutRecycleBatchPreview0016
     * @tc.desc 已知写失败仍消费一次性令牌重试必须新预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0016', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(recycleInput(1, 2));
        const store: BusinessStore = await openRecycle(scope, io);
        const old = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE); io.failWrite = true;
        expect((await store.applyRecycleBatch(old.token)).success).assertFalse();
        io.failWrite = false;
        expect((await store.applyRecycleBatch(old.token)).affected).assertEqual(0);
        expect(io.writes).assertEqual(1);
        const next = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE);
        expect((await store.applyRecycleBatch(next.token)).affected).assertEqual(2);
        expect(io.writes).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1700
     * @tc.name testShortcutRecycleBatchPreview0017
     * @tc.desc 预览后跨过保留期即使root未变也需全体拒绝恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecycleBatchPreview0017', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock(); const data: StoredData = recycleInput(0, 2);
        data.recycleBin[0].deletedAt = clock.now() - NOTE_RECYCLE_RETENTION_MS;
        const io: RecycleBusinessStorage = new RecycleBusinessStorage(); io.value = JSON.stringify(data);
        const store: BusinessStore = await openRecycle(scope, io, clock);
        const preview = store.previewRecycleBatch(['trash-1', 'trash-2'], RecycleBatchAction.RESTORE);
        expect(preview.eligible).assertTrue(); clock.setDate(2026, 11, 3);
        const result = await store.applyRecycleBatch(preview.token);
        expect(result.success).assertFalse();
        expect(result.message.includes('超过30天保留期')).assertTrue();
        expect(store.snapshot().notes.length).assertEqual(0);
        expect(store.snapshot().recycledNotes.length).assertEqual(2);
        expect(io.writes).assertEqual(0);
      });
    });
  });
}
