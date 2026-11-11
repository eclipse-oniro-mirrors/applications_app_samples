import { describe, expect, it } from '@ohos/hypium';
import { BusinessStore, NoteItem } from '../../../main/ets/business/BusinessStore';
import { TrashEditDecision } from '../../../main/ets/business/NoteRecyclePolicy';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness } from '../support/CoverageFixture';
import { Deferred } from '../support/ShortcutFixture';

export default function businessRecoveryB2Tests(): void {
  describe('BusinessRecoveryB2', () => {
    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0100
     * @tc.name testBusinessRecoveryBatchTwo0001
     * @tc.desc 放弃编辑时写失败应阻止离开并保留可重试缓冲
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        io.failWrite = true;
        const saved = io.value;
        expect(await store.discardForLeave()).assertFalse();
        expect(store.snapshot().editingNoteId).assertEqual(id);
        expect(store.snapshot().draftBody).assertEqual('编辑正文');
        expect(io.value).assertEqual(saved);
        expect(store.errorText()).assertEqual('保存失败，请重试');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0200
     * @tc.name testBusinessRecoveryBatchTwo0002
     * @tc.desc 放弃编辑等待磁盘完成期间保持编辑上下文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        const gate = new Deferred<void>();
        io.writeGate = gate;
        const pending = store.discardForLeave();
        expect(store.snapshot().busy).assertTrue();
        expect(store.snapshot().editingNoteId).assertEqual(id);
        expect(store.snapshot().draftBody).assertEqual('编辑正文');
        gate.resolve(undefined);
        expect(await pending).assertTrue();
        expect(store.snapshot().editDraftPersisted).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0300
     * @tc.name testBusinessRecoveryBatchTwo0003
     * @tc.desc 放弃已保留编辑后重开恢复独立草稿而非被放弃编辑
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        expect(await store.discardForLeave()).assertTrue();
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect(reopened.snapshot().draftTitle).assertEqual('独立草稿');
        expect(reopened.snapshot().notes[0].body).assertEqual('原正文');
        expect(reopened.snapshot().editDraftPersisted).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0400
     * @tc.name testBusinessRecoveryBatchTwo0004
     * @tc.desc 第二次保留失败后重开只恢复上次成功编辑草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        store.setDraftBody('未落盘正文');
        io.failWrite = true;
        expect(await store.keepEditDraft()).assertFalse();
        expect(store.hasUnsavedNoteWork()).assertTrue();
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().draftBody).assertEqual('编辑正文');
        expect(reopened.snapshot().notes[0].body).assertEqual('原正文');
        expect(reopened.snapshot().editingNoteId).assertEqual(id);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0500
     * @tc.name testBusinessRecoveryBatchTwo0005
     * @tc.desc 收藏提交不丢失已保留编辑与独立新草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        await store.toggleFavorite('reading');
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().draftBody).assertEqual('编辑正文');
        expect(reopened.snapshot().favoriteIds.join(',')).assertEqual('reading');
        expect(reopened.snapshot().editBaseRevision).assertEqual(base);
        await reopened.discardForLeave();
        expect(reopened.snapshot().draftTitle).assertEqual('独立草稿');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0600
     * @tc.name testBusinessRecoveryBatchTwo0006
     * @tc.desc 待办提交后重开保留编辑基线且正式正文不变
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        const task = store.snapshot().todos[0].id;
        await store.setTodoDone(task, true);
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().todos[0].done).assertTrue();
        expect(reopened.snapshot().draftBody).assertEqual('编辑正文');
        expect(reopened.snapshot().editBaseRevision).assertEqual(base);
        expect(reopened.snapshot().notes[0].body).assertEqual('原正文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0700
     * @tc.name testBusinessRecoveryBatchTwo0007
     * @tc.desc 删除其它便签不会清除当前编辑恢复信息
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0007', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        await store.deleteNote('other');
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().notes.map((note: NoteItem): string => note.id).join(',')).assertEqual(id);
        expect(reopened.snapshot().editingNoteId).assertEqual(id);
        expect(reopened.snapshot().draftBody).assertEqual('编辑正文');
        expect(reopened.historyFor('other').length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0800
     * @tc.name testBusinessRecoveryBatchTwo0008
     * @tc.desc 删除当前编辑目标同时清除持久编辑但保留独立草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0008', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        await store.moveNoteToTrash(id, TrashEditDecision.DISCARD_CHANGES);
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect(reopened.snapshot().draftTitle).assertEqual('独立草稿');
        expect(reopened.snapshot().notes.map((note: NoteItem): string => note.id).join(',')).assertEqual('other');
        expect(reopened.historyFor(id).length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_0900
     * @tc.name testBusinessRecoveryBatchTwo0009
     * @tc.desc 删除目标写失败后重开仍能恢复编辑与历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0009', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        io.failWrite = true;
        expect(await store.moveNoteToTrash(id, TrashEditDecision.DISCARD_CHANGES)).assertFalse();
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editingNoteId).assertEqual(id);
        expect(reopened.snapshot().draftBody).assertEqual('编辑正文');
        expect(reopened.historyFor(id)[0].revisionId).assertEqual(base);
        expect(reopened.snapshot().notes[0].body).assertEqual('原正文');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_1000
     * @tc.name testBusinessRecoveryBatchTwo0010
     * @tc.desc 恢复历史写失败不替换已保留编辑及正式正文
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0010', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        const before = io.value;
        io.failWrite = true;
        expect(await store.restoreRevision(id, 'older')).assertFalse();
        expect(io.value).assertEqual(before);
        expect(store.snapshot().draftBody).assertEqual('编辑正文');
        expect(store.snapshot().notes[0].body).assertEqual('原正文');
        expect(store.historyFor(id).length).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_1100
     * @tc.name testBusinessRecoveryBatchTwo0011
     * @tc.desc 写入期间释放实例不应用旧编辑回调但成功存档可恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0011', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        store.setDraftBody('最终保留');
        const gate = new Deferred<void>();
        io.writeGate = gate;
        const pending = store.keepEditDraft();
        store.dispose();
        gate.resolve(undefined);
        expect(await pending).assertFalse();
        expect(store.snapshot().editingNoteId).assertEqual('');
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().draftBody).assertEqual('最终保留');
        expect(reopened.snapshot().notes[0].body).assertEqual('原正文');
        expect(reopened.hasUnsavedNoteWork()).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_1200
     * @tc.name testBusinessRecoveryBatchTwo0012
     * @tc.desc 保留编辑失败解除忙状态后可重试并恢复最新内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0012', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1},' +
          '{"id":"other","title":"其它","body":"其它正文","createdAt":2}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[],"noteHistory":[' +
          '{"revisionId":"base","noteId":"target","title":"原标题",' +
          '"body":"原正文","savedAt":2,"action":"edit"},' +
          '{"revisionId":"older","noteId":"target","title":"旧标题",' +
          '"body":"旧正文","savedAt":1,"action":"create"}]}';
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const id: string = 'target';
        const base: string = 'base';
        store.beginEditNote(id);
        store.setDraftBody('编辑正文');
        await store.keepEditDraft();
        store.setDraftTitle('重试标题');
        io.failWrite = true;
        expect(await store.keepEditDraft()).assertFalse();
        expect(store.snapshot().busy).assertFalse();
        io.failWrite = false;
        expect(await store.keepEditDraft()).assertTrue();
        expect(store.errorText()).assertEqual('');
        store.dispose();
        const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().draftTitle).assertEqual('重试标题');
        expect(reopened.snapshot().draftBody).assertEqual('编辑正文');
        expect(reopened.snapshot().notes[0].title).assertEqual('原标题');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_1300
     * @tc.name testBusinessRecoveryBatchTwo0013
     * @tc.desc 页面取消编辑清盘失败后保留编辑上下文并可重试
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0013', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[]}';
        const store = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('target'); store.setDraftBody('取消前的编辑');
        await store.keepEditDraft(); const before = io.value;
        io.failWrite = true; store.cancelEdit();
        await scope.until(() => !store.snapshot().busy, (changed: () => void): (() => void) => {
          store.subscribe(changed); return (): void => { store.unsubscribe(changed); };
        });
        expect(store.snapshot().editingNoteId).assertEqual('target');
        expect(store.snapshot().draftBody).assertEqual('取消前的编辑');
        expect(io.value).assertEqual(before);
        expect(store.errorText()).assertEqual('保存失败，请重试');
        io.failWrite = false; store.cancelEdit();
        await scope.until(() => !store.snapshot().busy, (changed: () => void): (() => void) => {
          store.subscribe(changed); return (): void => { store.unsubscribe(changed); };
        });
        expect(store.snapshot().editingNoteId).assertEqual('');
        expect(store.snapshot().draftTitle).assertEqual('独立草稿');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_BUSINESSRECOVERYB2_1400
     * @tc.name testBusinessRecoveryBatchTwo0014
     * @tc.desc 页面取消编辑等待磁盘完成后才清除缓冲且重启不复活
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBusinessRecoveryBatchTwo0014', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io = new ControlledBusinessStorage();
        const clock = new FixedBusinessClock();
        io.value = '{"version":1,"notes":[' +
          '{"id":"target","title":"原标题","body":"原正文","createdAt":1}],' +
          '"draftTitle":"独立草稿","draftBody":"独立正文","todoDays":[]}';
        const store = await loadBusiness(scope, io, clock.now);
        store.beginEditNote('target'); store.setDraftBody('待取消编辑'); await store.keepEditDraft();
        const gate = new Deferred<void>(); io.writeGate = gate;
        scope.cleanup(() => gate.resolve(undefined));
        store.cancelEdit();
        expect(store.snapshot().editingNoteId).assertEqual('target');
        expect(store.snapshot().draftBody).assertEqual('待取消编辑');
        expect(store.snapshot().busy).assertTrue();
        gate.resolve(undefined);
        await scope.until(() => !store.snapshot().busy, (changed: () => void): (() => void) => {
          store.subscribe(changed); return (): void => { store.unsubscribe(changed); };
        });
        store.dispose(); const reopened = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().editingNoteId).assertEqual('');
        expect(reopened.snapshot().notes[0].body).assertEqual('原正文');
        expect(reopened.snapshot().draftTitle).assertEqual('独立草稿');
      });
    });
  });
}
