import { preferences } from '@kit.ArkData';
import { describe, expect, it } from '@ohos/hypium';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SCENE_STORE_KEY, SCENE_WORKSPACE_LIMIT, SceneWorkspace, emptyWorkspace,
  encodeWorkspace, stageScene } from '../../../main/ets/learning/scene/SceneModel';
import { SceneBackupCode, SceneBackupExport, SceneBackupPreview } from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { NativeSceneAcknowledgementFault, WorkspaceBackupNativeQaFixture,
  nativeSceneBackup, withWorkspaceBackupNativeQa } from '../support/WorkspaceBackupNativeQaSupport';

// NativeOnly: no context, Driver or SDK call occurs at module scope.
export default function workspaceBackupNativeQaTests(): void {
  describe('WorkspaceBackupNativeQa', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0100
     * @tc.name testWorkspaceBackupNativeQa0001
     * @tc.desc 三场景实际写入后清除SDK缓存重开可恢复完整root且只读初始化不改原文
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0001', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        f.populate(f.workbench(), '跨场景持久化');
        const before: string = f.raw();
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.document('note').state.note.body).assertEqual('跨场景持久化😀\n真实正文');
        expect(reopened.document('reading').state.reading.bookmarks[0].anchor).assertEqual(2);
        expect(reopened.document('form').state.form.address).assertEqual('跨场景持久化地址');
        expect(reopened.snapshot().active).assertEqual('form');
        expect(f.raw()).assertEqual(before);
        expect(reopened.hasDirtyWork()).assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0200
     * @tc.name testWorkspaceBackupNativeQa0002
     * @tc.desc 正式Controller使用两个真实专用adapter恢复业务备份不改变独立文本存档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0002', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('来自另一私有库');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const controller: LearningController = f.controller();
        controller.updateText('独立文本原文😀');
        controller.updateSelection(0, 4);
        controller.saveText();
        const textBefore: string = f.allText();
        const preview: SceneBackupPreview = controller.previewSceneBackup(incoming);
        expect(controller.restoreSceneBackup(preview.token, true).ok).assertTrue();
        expect(f.allText()).assertEqual(textBefore);
        const reopened: LearningController = await f.reopenController();
        expect(reopened.snapshot().text).assertEqual('独立文本原文😀');
        expect(reopened.sceneSnapshot('note').noteBody).assertEqual('来自另一私有库😀\n真实正文');
        expect(reopened.sceneSnapshot('reading').bookmarks[0].chapter).assertEqual(1);
        expect(reopened.snapshot().committed).assertFalse();
        expect(f.allText()).assertEqual(textBefore);
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0300
     * @tc.name testWorkspaceBackupNativeQa0003
     * @tc.desc 导出未保存草稿不写磁盘而恢复该副本后草稿与保存基线一并真实持久化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0003', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        f.populate(work, '保存基线');
        const before: string = f.raw();
        work.open('note');
        work.editNote('未保存标题', 'A😀B\n未保存', 1, 3);
        const exported: SceneBackupExport = work.backupSnapshot();
        expect(exported.containsDirty).assertTrue();
        expect(f.raw()).assertEqual(before);
        const clean: SceneWorkbench = await f.reopen();
        expect(clean.document('note').state.note.body).assertEqual('保存基线😀\n真实正文');
        const preview: SceneBackupPreview = clean.previewBackup(exported.raw);
        expect(clean.restoreBackup(preview.token, true).ok).assertTrue();
        const restored: SceneWorkbench = await f.reopen();
        expect(restored.document('note').state.note.selectionStart).assertEqual(1);
        expect(restored.document('note').state.note.selectionEnd).assertEqual(3);
        expect(restored.snapshot().noteDirty).assertTrue();
        restored.discardNote();
        expect(restored.document('note').state.note.body).assertEqual('保存基线😀\n真实正文');
        expect(f.workspace().documents.some((document): boolean =>
          document.state.kind === 'note' && document.state.note.body === 'A😀B\n未保存')).assertTrue();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0400
     * @tc.name testWorkspaceBackupNativeQa0004
     * @tc.desc 原生相同root恢复不调用put或flush且已消费token在冷重开实例仍不可重用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0004', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        f.populate(work, '完全相同的root');
        const puts: number = fault.puts;
        const flushes: number = fault.flushes;
        const raw: string = f.raw();
        const preview: SceneBackupPreview = work.previewBackup(work.backupSnapshot().raw);
        expect(work.restoreBackup(preview.token, false).code).assertEqual(SceneBackupCode.UNCHANGED);
        expect(fault.puts).assertEqual(puts);
        expect(fault.flushes).assertEqual(flushes);
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.restoreBackup(preview.token, true).code).assertEqual(SceneBackupCode.STALE);
        expect(f.raw()).assertEqual(raw);
        expect(reopened.document('form').state.form.name).assertEqual('完全相同的root姓名');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0500
     * @tc.name testWorkspaceBackupNativeQa0005
     * @tc.desc 真实保存新版本后恢复同身份旧备份产生更高修订并采用备份历史而非本机历史
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0005', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        work.editNote('同身份旧备份', '备份正文', 0, 2);
        work.saveNote();
        const oldRaw: string = work.backupSnapshot().raw;
        const identity: string = work.document('note').documentId;
        work.editNote('本机较新修订', '本机后来正文', 0, 3);
        work.saveNote();
        const preview: SceneBackupPreview = work.previewBackup(oldRaw);
        expect(work.restoreBackup(preview.token, false).ok).assertTrue();
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.document('note').documentId).assertEqual(identity);
        expect(reopened.document('note').revision).assertEqual(3);
        expect(reopened.document('note').state.note.body).assertEqual('备份正文');
        expect(reopened.historyDocuments('note').map((document): number => document.revision).join(',')).assertEqual('1');
        expect(reopened.historyDocuments('note').some((document): boolean => document.state.note.body === '本机后来正文')).assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0600
     * @tc.name testWorkspaceBackupNativeQa0006
     * @tc.desc 缺少场景的root恢复清除相应业务数据但保留同Preferences内无关键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0006', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        f.populate(work, '恢复前完整内容');
        const incoming: SceneWorkspace = stageScene(emptyWorkspace(), work.document('note'), 'note');
        const nativeStore: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.sceneNamespace });
        nativeStore.putSync('qa-unrelated-key', '不属于场景root');
        nativeStore.flushSync();
        const preview: SceneBackupPreview = work.previewBackup(encodeWorkspace(incoming));
        expect(preview.willClearKinds.join(',')).assertEqual('reading,form');
        expect(work.restoreBackup(preview.token, true).ok).assertTrue();
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.document('reading').state.reading.bookmarks.length).assertEqual(0);
        expect(reopened.document('form').state.form.address).assertEqual('');
        expect(reopened.document('note').state.note.body).assertEqual('恢复前完整内容😀\n真实正文');
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.sceneNamespace });
        expect(cold.getSync('qa-unrelated-key', '')).assertEqual('不属于场景root');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0700
     * @tc.name testWorkspaceBackupNativeQa0007
     * @tc.desc 真实flush已成功后注入失败正式补偿必须把旧整root重新flush到磁盘
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWorkspaceBackupNativeQa0007', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('候选曾实际落盘');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        f.populate(work, '应补偿回的旧内容');
        const before: string = f.raw();
        const previousFlushes: number = fault.flushes;
        fault.afterFlushFailures = 1;
        const preview: SceneBackupPreview = work.previewBackup(incoming);
        expect(work.restoreBackup(preview.token, true).code).assertEqual(SceneBackupCode.WRITE_FAILED);
        expect(fault.flushes).assertEqual(previousFlushes + 2);
        expect(work.snapshot().storageFrozen).assertFalse();
        expect(f.raw()).assertEqual(before);
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.document('note').state.note.body).assertEqual('应补偿回的旧内容😀\n真实正文');
        expect(reopened.document('reading').state.reading.bookmarks.length).assertEqual(1);
        expect(reopened.document('form').state.form.address).assertEqual('应补偿回的旧内容地址');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0800
     * @tc.name testWorkspaceBackupNativeQa0008
     * @tc.desc 无旧场景键时提交后故障补偿真正删除新键而非写入空伪存档且保留旁路键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWorkspaceBackupNativeQa0008', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('空库恢复候选');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const nativeStore: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.sceneNamespace });
        nativeStore.putSync('qa-existing-key', '空场景库中的其它数据');
        nativeStore.flushSync();
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        fault.afterFlushFailures = 1;
        expect(work.restoreBackup(work.previewBackup(incoming).token, true).code).assertEqual(SceneBackupCode.WRITE_FAILED);
        await f.invalidate();
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.sceneNamespace });
        expect(cold.hasSync(SCENE_STORE_KEY)).assertFalse();
        expect(cold.getSync('qa-existing-key', '')).assertEqual('空场景库中的其它数据');
        const reopened: SceneWorkbench = f.workbench();
        expect(reopened.document('note').state.note.body).assertEqual('');
        expect(reopened.snapshot().storageFrozen).assertFalse();
        expect(fault.flushes).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0900
     * @tc.name testWorkspaceBackupNativeQa0009
     * @tc.desc 已落盘候选且补偿put故障时冻结旧内存禁止继续覆盖冷重开显示真实磁盘候选
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWorkspaceBackupNativeQa0009', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('磁盘真实候选');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        f.populate(work, '补偿失败前旧内存');
        fault.afterFlushFailures = 1;
        fault.rejectPut = fault.puts + 2;
        expect(work.restoreBackup(work.previewBackup(incoming).token, true).code).assertEqual(SceneBackupCode.FROZEN);
        expect(work.document('note').state.note.body).assertEqual('补偿失败前旧内存😀\n真实正文');
        const uncertainRaw: string = f.raw();
        expect(work.saveNote()).assertFalse();
        expect(work.resetWorkspace()).assertFalse();
        expect(f.raw()).assertEqual(uncertainRaw);
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.document('note').state.note.body).assertEqual('磁盘真实候选😀\n真实正文');
        expect(reopened.document('form').state.form.name).assertEqual('磁盘真实候选姓名');
        expect(reopened.snapshot().storageFrozen).assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1000
     * @tc.name testWorkspaceBackupNativeQa0010
     * @tc.desc 未来版本及超预算合法JSON均保留原生原值冻结恢复不会自动重置
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0010', 0, async (): Promise<void> => {
      const good: string = await nativeSceneBackup('受保护原文');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const future: SceneWorkspace = JSON.parse(good) as SceneWorkspace;
        future.version = 99;
        const invalidValues: string[] = [JSON.stringify(future), good + ' '.repeat(SCENE_WORKSPACE_LIMIT)];
        for (const invalid of invalidValues) {
          await f.seed(invalid);
          const work: SceneWorkbench = f.workbench();
          expect(work.snapshot().storageFrozen).assertTrue();
          expect(work.previewBackup(good).code).assertEqual(SceneBackupCode.FROZEN);
          expect(work.resetWorkspace()).assertFalse();
          expect(f.raw()).assertEqual(invalid);
          expect(work.backupSnapshot().frozen).assertTrue();
        }
        await f.seed(good);
        const recovered: SceneWorkbench = f.workbench();
        expect(recovered.document('note').state.note.body).assertEqual('受保护原文😀\n真实正文');
        expect(recovered.snapshot().storageFrozen).assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1100
     * @tc.name testWorkspaceBackupNativeQa0011
     * @tc.desc 预览后真实保存新修订使旧token失效旧备份不能覆盖已flush的新正文
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0011', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('已过期的备份');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        f.populate(work, '预览时的内容');
        const preview: SceneBackupPreview = work.previewBackup(incoming);
        work.editNote('预览后的保存', '真实提交的新正文', 0, 3);
        expect(work.saveNote()).assertTrue();
        const afterSave: string = f.raw();
        expect(work.restoreBackup(preview.token, true).code).assertEqual(SceneBackupCode.STALE);
        expect(f.raw()).assertEqual(afterSave);
        const reopened: SceneWorkbench = await f.reopen();
        expect(reopened.document('note').state.note.body).assertEqual('真实提交的新正文');
        expect(reopened.document('note').revision).assertEqual(2);
        expect(reopened.document('form').state.form.name).assertEqual('预览时的内容姓名');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1200
     * @tc.name testWorkspaceBackupNativeQa0012
     * @tc.desc 私有工作区之间同键隔离一方reset及最终删除均不损害另一方实际存档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupNativeQa0012', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (left: WorkspaceBackupNativeQaFixture): Promise<void> => {
        left.populate(left.workbench(), '保留的左侧');
        const before: string = left.raw();
        await withWorkspaceBackupNativeQa(async (right: WorkspaceBackupNativeQaFixture): Promise<void> => {
          const work: SceneWorkbench = right.workbench();
          expect(work.document('note').state.note.body).assertEqual('');
          right.populate(work, '可删除的右侧');
          expect(work.resetWorkspace()).assertTrue();
          expect(left.raw()).assertEqual(before);
          expect(right.workspace().documents.length).assertEqual(0);
        });
        const reopened: SceneWorkbench = await left.reopen();
        expect(reopened.document('note').state.note.body).assertEqual('保留的左侧😀\n真实正文');
        expect(reopened.document('form').state.form.address).assertEqual('保留的左侧地址');
        expect(left.raw()).assertEqual(before);
      });
    });
  });
}
