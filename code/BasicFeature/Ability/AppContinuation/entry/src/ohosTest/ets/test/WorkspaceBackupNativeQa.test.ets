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
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import { describe } from '@ohos/hypium';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SCENE_STORE_KEY, SCENE_WORKSPACE_LIMIT, SceneWorkspace, emptyWorkspace,
  encodeWorkspace, stageScene } from '../../../main/ets/learning/scene/SceneModel';
import {
  SceneBackupCode, SceneBackupExport, SceneBackupPreview
} from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { NativeSceneAcknowledgementFault, WorkspaceBackupNativeQaFixture,
  nativeSceneBackup, withWorkspaceBackupNativeQa } from '../support/WorkspaceBackupNativeQaSupport';

// NativeOnly: no context, Driver or SDK call occurs at module scope.
export default function workspaceBackupNativeQaTests(): void {
  describe('WorkspaceBackupNativeQa', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0100
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0001
     * @tc.desc 三场景实际写入后清除SDK缓存重开可恢复完整root且只读初始化不改原文
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0001', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        f.populate(f.workbench(), '跨场景持久化');
        const before: string = f.raw();
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0001', BUNDLE + '_WorkspaceBackupNativeQa_0001').assertEqual('跨场景持久化😀\n真实正文');
        loggedExpect(reopened.document('reading').state.reading.bookmarks[0].anchor, 'WorkspaceBackupNativeQa.test.ets:A0002', BUNDLE + '_WorkspaceBackupNativeQa_0001').assertEqual(2);
        loggedExpect(reopened.document('form').state.form.address, 'WorkspaceBackupNativeQa.test.ets:A0003', BUNDLE + '_WorkspaceBackupNativeQa_0001').assertEqual('跨场景持久化地址');
        loggedExpect(reopened.snapshot().active, 'WorkspaceBackupNativeQa.test.ets:A0004', BUNDLE + '_WorkspaceBackupNativeQa_0001').assertEqual('form');
        loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0005', BUNDLE + '_WorkspaceBackupNativeQa_0001').assertEqual(before);
        loggedExpect(reopened.hasDirtyWork(), 'WorkspaceBackupNativeQa.test.ets:A0006', BUNDLE + '_WorkspaceBackupNativeQa_0001').assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0200
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0002
     * @tc.desc 正式Controller使用两个真实专用adapter恢复业务备份不改变独立文本存档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0002', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('来自另一私有库');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const controller: LearningController = f.controller();
        controller.updateText('独立文本原文😀');
        controller.updateSelection(0, 4);
        controller.saveText();
        const textBefore: string = f.allText();
        const preview: SceneBackupPreview = controller.previewSceneBackup(incoming);
        loggedExpect(controller.restoreSceneBackup(preview.token, true).ok, 'WorkspaceBackupNativeQa.test.ets:A0007', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertTrue();
        loggedExpect(f.allText(), 'WorkspaceBackupNativeQa.test.ets:A0008', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertEqual(textBefore);
        const reopened: LearningController = await f.reopenController();
        loggedExpect(reopened.snapshot().text, 'WorkspaceBackupNativeQa.test.ets:A0009', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertEqual('独立文本原文😀');
        loggedExpect(reopened.sceneSnapshot('note').noteBody, 'WorkspaceBackupNativeQa.test.ets:A0010', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertEqual('来自另一私有库😀\n真实正文');
        loggedExpect(reopened.sceneSnapshot('reading').bookmarks[0].chapter, 'WorkspaceBackupNativeQa.test.ets:A0011', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertEqual(1);
        loggedExpect(reopened.snapshot().committed, 'WorkspaceBackupNativeQa.test.ets:A0012', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertFalse();
        loggedExpect(f.allText(), 'WorkspaceBackupNativeQa.test.ets:A0013', BUNDLE + '_WorkspaceBackupNativeQa_0002').assertEqual(textBefore);
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0300
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0003
     * @tc.desc 导出未保存草稿不写磁盘而恢复该副本后草稿与保存基线一并真实持久化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0003', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        f.populate(work, '保存基线');
        const before: string = f.raw();
        work.open('note');
        work.editNote('未保存标题', 'A😀B\n未保存', 1, 3);
        const exported: SceneBackupExport = work.backupSnapshot();
        loggedExpect(exported.containsDirty, 'WorkspaceBackupNativeQa.test.ets:A0014', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertTrue();
        loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0015', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertEqual(before);
        const clean: SceneWorkbench = await f.reopen();
        loggedExpect(clean.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0016', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertEqual('保存基线😀\n真实正文');
        const preview: SceneBackupPreview = clean.previewBackup(exported.raw);
        loggedExpect(clean.restoreBackup(preview.token, true).ok, 'WorkspaceBackupNativeQa.test.ets:A0017', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertTrue();
        const restored: SceneWorkbench = await f.reopen();
        loggedExpect(restored.document('note').state.note.selectionStart, 'WorkspaceBackupNativeQa.test.ets:A0018', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertEqual(1);
        loggedExpect(restored.document('note').state.note.selectionEnd, 'WorkspaceBackupNativeQa.test.ets:A0019', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertEqual(3);
        loggedExpect(restored.snapshot().noteDirty, 'WorkspaceBackupNativeQa.test.ets:A0020', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertTrue();
        restored.discardNote();
        loggedExpect(restored.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0021', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertEqual('保存基线😀\n真实正文');
        loggedExpect(f.workspace().documents.some((document): boolean =>
          document.state.kind === 'note' && document.state.note.body === 'A😀B\n未保存'), 'WorkspaceBackupNativeQa.test.ets:A0022', BUNDLE + '_WorkspaceBackupNativeQa_0003').assertTrue();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0400
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0004
     * @tc.desc 原生相同root恢复不调用put或flush且已消费token在冷重开实例仍不可重用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0004', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        f.populate(work, '完全相同的root');
        const puts: number = fault.puts;
        const flushes: number = fault.flushes;
        const raw: string = f.raw();
        const preview: SceneBackupPreview = work.previewBackup(work.backupSnapshot().raw);
        loggedExpect(work.restoreBackup(preview.token, false).code, 'WorkspaceBackupNativeQa.test.ets:A0023', BUNDLE + '_WorkspaceBackupNativeQa_0004').assertEqual(SceneBackupCode.UNCHANGED);
        loggedExpect(fault.puts, 'WorkspaceBackupNativeQa.test.ets:A0024', BUNDLE + '_WorkspaceBackupNativeQa_0004').assertEqual(puts);
        loggedExpect(fault.flushes, 'WorkspaceBackupNativeQa.test.ets:A0025', BUNDLE + '_WorkspaceBackupNativeQa_0004').assertEqual(flushes);
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.restoreBackup(preview.token, true).code, 'WorkspaceBackupNativeQa.test.ets:A0026', BUNDLE + '_WorkspaceBackupNativeQa_0004').assertEqual(SceneBackupCode.STALE);
        loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0027', BUNDLE + '_WorkspaceBackupNativeQa_0004').assertEqual(raw);
        loggedExpect(reopened.document('form').state.form.name, 'WorkspaceBackupNativeQa.test.ets:A0028', BUNDLE + '_WorkspaceBackupNativeQa_0004').assertEqual('完全相同的root姓名');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0500
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0005
     * @tc.desc 真实保存新版本后恢复同身份旧备份产生更高修订并采用备份历史而非本机历史
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0005', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        work.editNote('同身份旧备份', '备份正文', 0, 2);
        work.saveNote();
        const oldRaw: string = work.backupSnapshot().raw;
        const identity: string = work.document('note').documentId;
        work.editNote('本机较新修订', '本机后来正文', 0, 3);
        work.saveNote();
        const preview: SceneBackupPreview = work.previewBackup(oldRaw);
        loggedExpect(work.restoreBackup(preview.token, false).ok, 'WorkspaceBackupNativeQa.test.ets:A0029', BUNDLE + '_WorkspaceBackupNativeQa_0005').assertTrue();
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.document('note').documentId, 'WorkspaceBackupNativeQa.test.ets:A0030', BUNDLE + '_WorkspaceBackupNativeQa_0005').assertEqual(identity);
        loggedExpect(reopened.document('note').revision, 'WorkspaceBackupNativeQa.test.ets:A0031', BUNDLE + '_WorkspaceBackupNativeQa_0005').assertEqual(3);
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0032', BUNDLE + '_WorkspaceBackupNativeQa_0005').assertEqual('备份正文');
        loggedExpect(reopened.historyDocuments('note').map((document): number => document.revision).join(','), 'WorkspaceBackupNativeQa.test.ets:A0033', BUNDLE + '_WorkspaceBackupNativeQa_0005')
          .assertEqual('1');
        loggedExpect(reopened.historyDocuments('note').some((document): boolean =>
          document.state.note.body === '本机后来正文'), 'WorkspaceBackupNativeQa.test.ets:A0034', BUNDLE + '_WorkspaceBackupNativeQa_0005').assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0600
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0006
     * @tc.desc 缺少场景的root恢复清除相应业务数据但保留同Preferences内无关键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0006', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        f.populate(work, '恢复前完整内容');
        const incoming: SceneWorkspace = stageScene(emptyWorkspace(), work.document('note'), 'note');
        const nativeStore: preferences.Preferences = preferences.getPreferencesSync(
          f.context, { name: f.sceneNamespace });
        nativeStore.putSync('qa-unrelated-key', '不属于场景root');
        nativeStore.flushSync();
        const preview: SceneBackupPreview = work.previewBackup(encodeWorkspace(incoming));
        loggedExpect(preview.willClearKinds.join(','), 'WorkspaceBackupNativeQa.test.ets:A0035', BUNDLE + '_WorkspaceBackupNativeQa_0006').assertEqual('reading,form');
        loggedExpect(work.restoreBackup(preview.token, true).ok, 'WorkspaceBackupNativeQa.test.ets:A0036', BUNDLE + '_WorkspaceBackupNativeQa_0006').assertTrue();
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.document('reading').state.reading.bookmarks.length, 'WorkspaceBackupNativeQa.test.ets:A0037', BUNDLE + '_WorkspaceBackupNativeQa_0006').assertEqual(0);
        loggedExpect(reopened.document('form').state.form.address, 'WorkspaceBackupNativeQa.test.ets:A0038', BUNDLE + '_WorkspaceBackupNativeQa_0006').assertEqual('');
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0039', BUNDLE + '_WorkspaceBackupNativeQa_0006').assertEqual('恢复前完整内容😀\n真实正文');
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.sceneNamespace });
        loggedExpect(cold.getSync('qa-unrelated-key', ''), 'WorkspaceBackupNativeQa.test.ets:A0040', BUNDLE + '_WorkspaceBackupNativeQa_0006').assertEqual('不属于场景root');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0700
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0007
     * @tc.desc 真实flush已成功后注入失败正式补偿必须把旧整root重新flush到磁盘
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0007', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('候选曾实际落盘');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        f.populate(work, '应补偿回的旧内容');
        const before: string = f.raw();
        const previousFlushes: number = fault.flushes;
        fault.afterFlushFailures = 1;
        const preview: SceneBackupPreview = work.previewBackup(incoming);
        loggedExpect(work.restoreBackup(preview.token, true).code, 'WorkspaceBackupNativeQa.test.ets:A0041', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertEqual(SceneBackupCode.WRITE_FAILED);
        loggedExpect(fault.flushes, 'WorkspaceBackupNativeQa.test.ets:A0042', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertEqual(previousFlushes + 2);
        loggedExpect(work.snapshot().storageFrozen, 'WorkspaceBackupNativeQa.test.ets:A0043', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertFalse();
        loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0044', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertEqual(before);
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0045', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertEqual('应补偿回的旧内容😀\n真实正文');
        loggedExpect(reopened.document('reading').state.reading.bookmarks.length, 'WorkspaceBackupNativeQa.test.ets:A0046', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertEqual(1);
        loggedExpect(reopened.document('form').state.form.address, 'WorkspaceBackupNativeQa.test.ets:A0047', BUNDLE + '_WorkspaceBackupNativeQa_0007').assertEqual('应补偿回的旧内容地址');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0800
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0008
     * @tc.desc 无旧场景键时提交后故障补偿真正删除新键而非写入空伪存档且保留旁路键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0008', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('空库恢复候选');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const nativeStore: preferences.Preferences = preferences.getPreferencesSync(
          f.context, { name: f.sceneNamespace });
        nativeStore.putSync('qa-existing-key', '空场景库中的其它数据');
        nativeStore.flushSync();
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        fault.afterFlushFailures = 1;
        loggedExpect(work.restoreBackup(work.previewBackup(incoming).token, true).code, 'WorkspaceBackupNativeQa.test.ets:A0048', BUNDLE + '_WorkspaceBackupNativeQa_0008')
          .assertEqual(SceneBackupCode.WRITE_FAILED);
        await f.invalidate();
        const cold: preferences.Preferences = preferences.getPreferencesSync(f.context, { name: f.sceneNamespace });
        loggedExpect(cold.hasSync(SCENE_STORE_KEY), 'WorkspaceBackupNativeQa.test.ets:A0049', BUNDLE + '_WorkspaceBackupNativeQa_0008').assertFalse();
        loggedExpect(cold.getSync('qa-existing-key', ''), 'WorkspaceBackupNativeQa.test.ets:A0050', BUNDLE + '_WorkspaceBackupNativeQa_0008').assertEqual('空场景库中的其它数据');
        const reopened: SceneWorkbench = f.workbench();
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0051', BUNDLE + '_WorkspaceBackupNativeQa_0008').assertEqual('');
        loggedExpect(reopened.snapshot().storageFrozen, 'WorkspaceBackupNativeQa.test.ets:A0052', BUNDLE + '_WorkspaceBackupNativeQa_0008').assertFalse();
        loggedExpect(fault.flushes, 'WorkspaceBackupNativeQa.test.ets:A0053', BUNDLE + '_WorkspaceBackupNativeQa_0008').assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0900
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0009
     * @tc.desc 已落盘候选且补偿put故障时冻结旧内存禁止继续覆盖冷重开显示真实磁盘候选
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0009', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('磁盘真实候选');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const fault: NativeSceneAcknowledgementFault = new NativeSceneAcknowledgementFault(f.adapter());
        const work: SceneWorkbench = f.workbench(fault);
        f.populate(work, '补偿失败前旧内存');
        fault.afterFlushFailures = 1;
        fault.rejectPut = fault.puts + 2;
        loggedExpect(work.restoreBackup(work.previewBackup(incoming).token, true).code, 'WorkspaceBackupNativeQa.test.ets:A0054', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertEqual(SceneBackupCode.FROZEN);
        loggedExpect(work.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0055', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertEqual('补偿失败前旧内存😀\n真实正文');
        const uncertainRaw: string = f.raw();
        loggedExpect(work.saveNote(), 'WorkspaceBackupNativeQa.test.ets:A0056', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertFalse();
        loggedExpect(work.resetWorkspace(), 'WorkspaceBackupNativeQa.test.ets:A0057', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertFalse();
        loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0058', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertEqual(uncertainRaw);
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0059', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertEqual('磁盘真实候选😀\n真实正文');
        loggedExpect(reopened.document('form').state.form.name, 'WorkspaceBackupNativeQa.test.ets:A0060', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertEqual('磁盘真实候选姓名');
        loggedExpect(reopened.snapshot().storageFrozen, 'WorkspaceBackupNativeQa.test.ets:A0061', BUNDLE + '_WorkspaceBackupNativeQa_0009').assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1000
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0010
     * @tc.desc 未来版本及超预算合法JSON均保留原生原值冻结恢复不会自动重置
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0010', 0, async (): Promise<void> => {
      const good: string = await nativeSceneBackup('受保护原文');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const future: SceneWorkspace = JSON.parse(good) as SceneWorkspace;
        future.version = 99;
        const invalidValues: string[] = [JSON.stringify(future), good + ' '.repeat(SCENE_WORKSPACE_LIMIT)];
        for (const invalid of invalidValues) {
          await f.seed(invalid);
          const work: SceneWorkbench = f.workbench();
          loggedExpect(work.snapshot().storageFrozen, 'WorkspaceBackupNativeQa.test.ets:A0062', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertTrue();
          loggedExpect(work.previewBackup(good).code, 'WorkspaceBackupNativeQa.test.ets:A0063', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertEqual(SceneBackupCode.FROZEN);
          loggedExpect(work.resetWorkspace(), 'WorkspaceBackupNativeQa.test.ets:A0064', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertFalse();
          loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0065', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertEqual(invalid);
          loggedExpect(work.backupSnapshot().frozen, 'WorkspaceBackupNativeQa.test.ets:A0066', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertTrue();
        }
        await f.seed(good);
        const recovered: SceneWorkbench = f.workbench();
        loggedExpect(recovered.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0067', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertEqual('受保护原文😀\n真实正文');
        loggedExpect(recovered.snapshot().storageFrozen, 'WorkspaceBackupNativeQa.test.ets:A0068', BUNDLE + '_WorkspaceBackupNativeQa_0010').assertFalse();
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1100
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0011
     * @tc.desc 预览后真实保存新修订使旧token失效旧备份不能覆盖已flush的新正文
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0011', 0, async (): Promise<void> => {
      const incoming: string = await nativeSceneBackup('已过期的备份');
      await withWorkspaceBackupNativeQa(async (f: WorkspaceBackupNativeQaFixture): Promise<void> => {
        const work: SceneWorkbench = f.workbench();
        f.populate(work, '预览时的内容');
        const preview: SceneBackupPreview = work.previewBackup(incoming);
        work.editNote('预览后的保存', '真实提交的新正文', 0, 3);
        loggedExpect(work.saveNote(), 'WorkspaceBackupNativeQa.test.ets:A0069', BUNDLE + '_WorkspaceBackupNativeQa_0011').assertTrue();
        const afterSave: string = f.raw();
        loggedExpect(work.restoreBackup(preview.token, true).code, 'WorkspaceBackupNativeQa.test.ets:A0070', BUNDLE + '_WorkspaceBackupNativeQa_0011').assertEqual(SceneBackupCode.STALE);
        loggedExpect(f.raw(), 'WorkspaceBackupNativeQa.test.ets:A0071', BUNDLE + '_WorkspaceBackupNativeQa_0011').assertEqual(afterSave);
        const reopened: SceneWorkbench = await f.reopen();
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0072', BUNDLE + '_WorkspaceBackupNativeQa_0011').assertEqual('真实提交的新正文');
        loggedExpect(reopened.document('note').revision, 'WorkspaceBackupNativeQa.test.ets:A0073', BUNDLE + '_WorkspaceBackupNativeQa_0011').assertEqual(2);
        loggedExpect(reopened.document('form').state.form.name, 'WorkspaceBackupNativeQa.test.ets:A0074', BUNDLE + '_WorkspaceBackupNativeQa_0011').assertEqual('预览时的内容姓名');
      });
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1200
     * @tc.name com.samples.appcontinuation_WorkspaceBackupNativeQa_0012
     * @tc.desc 私有工作区之间同键隔离一方reset及最终删除均不损害另一方实际存档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupNativeQa_0012', 0, async (): Promise<void> => {
      await withWorkspaceBackupNativeQa(async (left: WorkspaceBackupNativeQaFixture): Promise<void> => {
        left.populate(left.workbench(), '保留的左侧');
        const before: string = left.raw();
        await withWorkspaceBackupNativeQa(async (right: WorkspaceBackupNativeQaFixture): Promise<void> => {
          const work: SceneWorkbench = right.workbench();
          loggedExpect(work.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0075', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertEqual('');
          right.populate(work, '可删除的右侧');
          loggedExpect(work.resetWorkspace(), 'WorkspaceBackupNativeQa.test.ets:A0076', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertTrue();
          loggedExpect(left.raw(), 'WorkspaceBackupNativeQa.test.ets:A0077', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertEqual(before);
          loggedExpect(right.workspace().documents.length, 'WorkspaceBackupNativeQa.test.ets:A0078', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertEqual(0);
        });
        const reopened: SceneWorkbench = await left.reopen();
        loggedExpect(reopened.document('note').state.note.body, 'WorkspaceBackupNativeQa.test.ets:A0079', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertEqual('保留的左侧😀\n真实正文');
        loggedExpect(reopened.document('form').state.form.address, 'WorkspaceBackupNativeQa.test.ets:A0080', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertEqual('保留的左侧地址');
        loggedExpect(left.raw(), 'WorkspaceBackupNativeQa.test.ets:A0081', BUNDLE + '_WorkspaceBackupNativeQa_0012').assertEqual(before);
      });
    });
  });
}
