import { describe, expect, it } from '@ohos/hypium';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness, waitBusiness } from '../support/CoverageFixture';
import { waveTwoArchive } from '../support/ShortcutWaveTwoFixture';

export default function shortcutRecoveryWaveTwoTests(): void {
  describe('ShortcutRecoveryWaveTwo', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0100
     * @tc.name testShortcutRecoveryWaveTwo0001
     * @tc.desc 已保留编辑回到正式原文后再次保留不能在重启时复活旧修改
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecoveryWaveTwo0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('a');
        store.setDraftBody('曾经保留的修改');
        await store.keepEditDraft();
        store.setDraftBody('正式正文');
        expect(await store.keepEditDraft()).assertTrue();
        expect(store.snapshot().editDraftPersisted).assertFalse();
        expect(store.snapshot().notes[0].body).assertEqual('正式正文');
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect(reopened.snapshot().draftBody).assertEqual('独立新正文');
        expect(reopened.historyFor('a')[0].revisionId).assertEqual('ar');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0200
     * @tc.name testShortcutRecoveryWaveTwo0002
     * @tc.desc 恢复历史成功后重启不能用旧持久编辑覆盖已恢复的正文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecoveryWaveTwo0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('a');
        store.setDraftBody('恢复之前保留的旧编辑');
        await store.keepEditDraft();
        expect(await store.restoreRevision('a', 'ar')).assertTrue();
        expect(store.snapshot().notes[0].body).assertEqual('早期正文');
        expect(store.snapshot().editDraftPersisted).assertFalse();
        expect(store.snapshot().editBaseRevision).assertEqual(store.historyFor('a')[0].revisionId);
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().draftBody).assertEqual('独立新正文');
        expect(reopened.snapshot().notes[0].title).assertEqual('早期标题');
        expect(reopened.historyFor('a')[0].body).assertEqual('正式正文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0300
     * @tc.name testShortcutRecoveryWaveTwo0003
     * @tc.desc 保存仅有首尾空白差异的编辑会解除脏状态且不创建重复版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecoveryWaveTwo0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        store.beginEditNote('a');
        store.setDraftTitle('  正式标题  ');
        store.setDraftBody('\n正式正文\n');
        expect(await store.saveNote()).assertTrue();
        expect(store.hasUnsavedNoteWork()).assertFalse();
        expect(store.snapshot().draftTitle).assertEqual('正式标题');
        expect(store.snapshot().draftBody).assertEqual('正式正文');
        expect(store.snapshot().editingNoteId).assertEqual('a');
        expect(store.historyFor('a').length).assertEqual(1);
        expect(io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0400
     * @tc.name testShortcutRecoveryWaveTwo0004
     * @tc.desc 同一业务实例重新初始化后不继承历史浏览筛选和旧编辑基线
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecoveryWaveTwo0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        store.selectTodoDate('2026-11-01');
        store.setTodoFilter('已完成');
        store.setFavoritesOnly(true);
        store.beginEditNote('a');
        store.dispose();
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        expect(store.snapshot().todoFollowToday).assertTrue();
        expect(store.snapshot().todoFilter).assertEqual('全部');
        expect(store.snapshot().favoritesOnly).assertFalse();
        expect(store.snapshot().editBaseRevision).assertEqual('');
        const oldId: string = store.snapshot().todos[0].id;
        clock.setDate(2026, 11, 3);
        expect(await store.setTodoDone(oldId, true)).assertFalse();
        expect(store.snapshot().todoDate).assertEqual('2026-11-03');
        expect(store.snapshot().todos[0].done).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_RECOVERYWAVETWO_0500
     * @tc.name testShortcutRecoveryWaveTwo0005
     * @tc.desc 存档中格式正确但日历不存在的待办日期被原子拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutRecoveryWaveTwo0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.value = waveTwoArchive().replace('"todoDays":[]',
          '"todoDays":[{"date":"2026-02-30","items":[{"id":"impossible","title":"历史任务","done":false}]}]');
        const original: string = io.value;
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        expect(store.snapshot().ready).assertFalse();
        expect(store.snapshot().notes.length).assertEqual(0);
        expect(io.value).assertEqual(original);
        expect(io.writes).assertEqual(0);
        io.value = original.replace('2026-02-30', '2026-02-28');
        store.retry();
        await waitBusiness(scope, store);
        expect(store.selectTodoDate('2026-02-28')).assertTrue();
        expect(store.snapshot().todos[0].title).assertEqual('历史任务');
      });
    });
  });
}
