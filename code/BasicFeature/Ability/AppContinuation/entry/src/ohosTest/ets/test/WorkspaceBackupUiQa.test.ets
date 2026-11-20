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

// Exercise production behavior with isolated data and explicit lifecycle cleanup.
import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE } from '../support/BoundedCase';
import { ON, UiTestSession, uiCase as it } from '../support/UiTestRuntime';
import {
  decodeWorkspace, emptyWorkspace, encodeWorkspace, findScene
} from '../../../main/ets/learning/scene/SceneModel';
import {
  backupQaClick,
  backupQaDialog,
  backupQaInput,
  backupQaNode,
  backupQaText,
  currentWorkspaceBackupUiQa,
  launchWorkspaceBackupUiQa
} from '../support/WorkspaceBackupUiQaSupport';

export default function workspaceBackupUiQaTests(): void {
  describe('WorkspaceBackupUiQa', (): void => {

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0100
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0001
     * @tc.desc The real collapsed entry reveals gated controls without generating or writing a backup implicitly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0001', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const collapsedInput = await session.guard(driver.findComponent(ON.id('ACBackupImportText')));
      loggedExpect(collapsedInput === undefined || collapsedInput === null, 'WorkspaceBackupUiQa.test.ets:A0001', BUNDLE + '_WorkspaceBackupUiQa_0001').assertTrue();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0002', BUNDLE + '_WorkspaceBackupUiQa_0001').assertFalse();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0003', BUNDLE + '_WorkspaceBackupUiQa_0001').assertFalse();
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0004', BUNDLE + '_WorkspaceBackupUiQa_0001').assertEqual('准备就绪。');
      const fixture = currentWorkspaceBackupUiQa();
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0005', BUNDLE + '_WorkspaceBackupUiQa_0001').assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0200
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0002
     * @tc.desc Invalid text is rejected through the actual TextArea and cannot enable restore
     * or mutate the current workspace.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0002', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, '{broken-backup'));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0006', BUNDLE + '_WorkspaceBackupUiQa_0002').assertEqual('备份格式或业务状态无效。');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0007', BUNDLE + '_WorkspaceBackupUiQa_0002').assertFalse();
      const fixture = currentWorkspaceBackupUiQa();
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0008', BUNDLE + '_WorkspaceBackupUiQa_0002').assertEqual(fixture.baseline);
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0009', BUNDLE + '_WorkspaceBackupUiQa_0002').assertEqual('本机原正文');
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0300
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0003
     * @tc.desc Generating a dirty workspace exposes a bounded export preview but never persists
     * or clears the unsaved note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0003', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'dirty'));
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupGenerate'));
      const fixture = currentWorkspaceBackupUiQa();
      loggedExpect(await backupQaText(driver, 'ACBackupExportText'), 'WorkspaceBackupUiQa.test.ets:A0010', BUNDLE + '_WorkspaceBackupUiQa_0003')
        .assertEqual(fixture.controller.sceneBackupSnapshot().raw.slice(0, 512));
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0011', BUNDLE + '_WorkspaceBackupUiQa_0003').assertTrue();
      loggedExpect(fixture.controller.sceneSnapshot('note').noteDirty, 'WorkspaceBackupUiQa.test.ets:A0012', BUNDLE + '_WorkspaceBackupUiQa_0003').assertTrue();
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0013', BUNDLE + '_WorkspaceBackupUiQa_0003').assertEqual(fixture.baselineFlushes);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0014', BUNDLE + '_WorkspaceBackupUiQa_0003').assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0400
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0004
     * @tc.desc The real preview excludes private body values and cancelling clears input and authorization
     * without losing local edits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0004', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'dirty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      const summary = await session.guard(backupQaText(driver, 'ACBackupSummary'));
      loggedExpect(summary.indexOf('qa-private-backup-body'), 'WorkspaceBackupUiQa.test.ets:A0015', BUNDLE + '_WorkspaceBackupUiQa_0004').assertEqual(-1);
      loggedExpect(summary.indexOf('导入私密标题'), 'WorkspaceBackupUiQa.test.ets:A0016', BUNDLE + '_WorkspaceBackupUiQa_0004').assertEqual(-1);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0017', BUNDLE + '_WorkspaceBackupUiQa_0004').assertTrue();
      await session.guard(backupQaClick(driver, 'ACBackupCancel'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0018', BUNDLE + '_WorkspaceBackupUiQa_0004').assertEqual('已取消恢复预览。');
      loggedExpect(await backupQaText(driver, 'ACBackupImportText'), 'WorkspaceBackupUiQa.test.ets:A0019', BUNDLE + '_WorkspaceBackupUiQa_0004').assertEqual('');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0020', BUNDLE + '_WorkspaceBackupUiQa_0004').assertFalse();
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0021', BUNDLE + '_WorkspaceBackupUiQa_0004').assertEqual('本机未保存正文');
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0022', BUNDLE + '_WorkspaceBackupUiQa_0004').assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0500
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0005
     * @tc.desc Cancelling the actual system confirmation leaves the validated preview available
     * and does not commit a scene root.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0005', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      await session.guard(backupQaDialog(driver, '取消'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0023', BUNDLE + '_WorkspaceBackupUiQa_0005').assertEqual('已取消。');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0024', BUNDLE + '_WorkspaceBackupUiQa_0005').assertTrue();
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0025', BUNDLE + '_WorkspaceBackupUiQa_0005').assertEqual(fixture.baselineFlushes);
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0026', BUNDLE + '_WorkspaceBackupUiQa_0005').assertEqual('本机原正文');
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0600
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0006
     * @tc.desc Confirmed restoration commits the production root and updates note plus reading state
     * instead of fabricating a UI success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0006', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      await session.guard(backupQaDialog(driver, '确认'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0027', BUNDLE + '_WorkspaceBackupUiQa_0006').assertEqual('本地业务工作区已恢复。');
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0028', BUNDLE + '_WorkspaceBackupUiQa_0006').assertEqual('qa-private-backup-body');
      const restored = decodeWorkspace(fixture.store.stored());
      if (restored === undefined) {
        throw new Error('Restored durable root was invalid');
      }
      const reading = findScene(restored, 'reading');
      if (reading === undefined) {
        throw new Error('Durable reading scene was missing');
      }
      loggedExpect(reading.state.reading.chapter, 'WorkspaceBackupUiQa.test.ets:A0029', BUNDLE + '_WorkspaceBackupUiQa_0006').assertEqual(1);
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0030', BUNDLE + '_WorkspaceBackupUiQa_0006').assertEqual(fixture.baselineFlushes + 1);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0031', BUNDLE + '_WorkspaceBackupUiQa_0006').assertFalse();
      loggedExpect(fixture.controller.snapshot().sessionActive, 'WorkspaceBackupUiQa.test.ets:A0032', BUNDLE + '_WorkspaceBackupUiQa_0006').assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0700
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0007
     * @tc.desc A scene edit while the confirmation is open invalidates its captured token
     * and preserves the newer local draft.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0007', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      fixture.controller.sceneWorkbench.editNote('较新编辑', '确认期间的新正文', 0, 1);
      await session.guard(backupQaDialog(driver, '确认'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0033', BUNDLE + '_WorkspaceBackupUiQa_0007').assertEqual('恢复预览已过期，请重新校验并预览。');
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0034', BUNDLE + '_WorkspaceBackupUiQa_0007').assertEqual('确认期间的新正文');
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0035', BUNDLE + '_WorkspaceBackupUiQa_0007').assertEqual(fixture.baseline);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0036', BUNDLE + '_WorkspaceBackupUiQa_0007').assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0800
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0008
     * @tc.desc A failed flush is compensated by the real transaction and the panel consumes the failed preview
     * instead of claiming recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0008', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'writeFailure'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      await session.guard(backupQaDialog(driver, '确认'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0037', BUNDLE + '_WorkspaceBackupUiQa_0008').assertEqual('场景保存失败，已补偿回原存档；编辑、修订与历史保持原样');
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0038', BUNDLE + '_WorkspaceBackupUiQa_0008').assertEqual(fixture.baseline);
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0039', BUNDLE + '_WorkspaceBackupUiQa_0008').assertEqual('本机原正文');
      loggedExpect(fixture.controller.sceneWorkbench.snapshot().storageFrozen, 'WorkspaceBackupUiQa.test.ets:A0040', BUNDLE + '_WorkspaceBackupUiQa_0008').assertFalse();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0041', BUNDLE + '_WorkspaceBackupUiQa_0008').assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0900
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0009
     * @tc.desc Frozen storage permits a memory rescue export but gates preview and restore
     * without overwriting corrupt bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0009', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'frozen'));
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      loggedExpect(await (await backupQaNode(driver, 'ACBackupGenerate')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0042', BUNDLE + '_WorkspaceBackupUiQa_0009').assertTrue();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupPreview')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0043', BUNDLE + '_WorkspaceBackupUiQa_0009').assertFalse();
      await session.guard(backupQaClick(driver, 'ACBackupGenerate'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0044', BUNDLE + '_WorkspaceBackupUiQa_0009').assertEqual('已生成当前内存救援副本；原存档仍冻结，未修复或覆盖磁盘。');
      loggedExpect(currentWorkspaceBackupUiQa().store.stored(), 'WorkspaceBackupUiQa.test.ets:A0045', BUNDLE + '_WorkspaceBackupUiQa_0009').assertEqual('{');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0046', BUNDLE + '_WorkspaceBackupUiQa_0009').assertTrue();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1000
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0010
     * @tc.desc Editing input after a valid preview revokes authorization before the user attempts a restore.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0010', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaInput(driver, '{}'));
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0047', BUNDLE + '_WorkspaceBackupUiQa_0010').assertFalse();
      loggedExpect(await backupQaText(driver, 'ACBackupSummary'), 'WorkspaceBackupUiQa.test.ets:A0048', BUNDLE + '_WorkspaceBackupUiQa_0010').assertEqual('尚未预览；校验和取消均不会写入业务存储。');
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0049', BUNDLE + '_WorkspaceBackupUiQa_0010').assertEqual('导入文本已变更，请校验并预览后再恢复。');
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0050', BUNDLE + '_WorkspaceBackupUiQa_0010').assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1100
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0011
     * @tc.desc Collapsing and reopening clears sensitive export and import buffers without clearing the real workspace.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0011', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupGenerate'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      loggedExpect(await backupQaText(driver, 'ACBackupImportText'), 'WorkspaceBackupUiQa.test.ets:A0051', BUNDLE + '_WorkspaceBackupUiQa_0011').assertEqual('');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0052', BUNDLE + '_WorkspaceBackupUiQa_0011').assertFalse();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0053', BUNDLE + '_WorkspaceBackupUiQa_0011').assertFalse();
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0054', BUNDLE + '_WorkspaceBackupUiQa_0011').assertEqual('本机原正文');
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0055', BUNDLE + '_WorkspaceBackupUiQa_0011').assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1200
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0012
     * @tc.desc Cancelling the production privacy dialog never invokes even the isolated clipboard
     * and preserves the generated export.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0012', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupGenerate'));
      await session.guard(backupQaClick(driver, 'ACBackupCopy'));
      await session.guard(backupQaDialog(driver, '取消', '复制未加密业务备份？'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0056', BUNDLE + '_WorkspaceBackupUiQa_0012').assertEqual('已取消。');
      loggedExpect(fixture.clipboard.texts.length, 'WorkspaceBackupUiQa.test.ets:A0057', BUNDLE + '_WorkspaceBackupUiQa_0012').assertEqual(0);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0058', BUNDLE + '_WorkspaceBackupUiQa_0012').assertTrue();
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0059', BUNDLE + '_WorkspaceBackupUiQa_0012').assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1300
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0013
     * @tc.desc Confirmed copy awaits the actual model clipboard promise, gates input and sends the complete export
     * rather than its short preview.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0013', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'copyPending'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupGenerate'));
      const exported = fixture.controller.sceneBackupSnapshot().raw;
      await session.guard(backupQaClick(driver, 'ACBackupCopy'));
      await session.guard(backupQaDialog(driver, '确认', '复制未加密业务备份？'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0060', BUNDLE + '_WorkspaceBackupUiQa_0013').assertEqual('正在等待本机剪贴板复制结果…');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupImportText')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0061', BUNDLE + '_WorkspaceBackupUiQa_0013').assertFalse();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupGenerate')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0062', BUNDLE + '_WorkspaceBackupUiQa_0013').assertFalse();
      loggedExpect(fixture.clipboard.texts[0], 'WorkspaceBackupUiQa.test.ets:A0063', BUNDLE + '_WorkspaceBackupUiQa_0013').assertEqual(exported);
      fixture.clipboard.release();
      const feedback = await session.guard(driver.waitForComponent(ON.text('业务备份已复制到本机剪贴板；内容未加密，请妥善保管。'), 3000));
      if (feedback === undefined || feedback === null) {
        throw new Error('Backup clipboard acknowledgment not rendered');
      }
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0064', BUNDLE + '_WorkspaceBackupUiQa_0013').assertTrue();
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0065', BUNDLE + '_WorkspaceBackupUiQa_0013').assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1400
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0014
     * @tc.desc A clipboard rejection is redacted by the production model, leaves input intact
     * and re-enables retry without a scene write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0014', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'copyFailure'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupGenerate'));
      await session.guard(backupQaClick(driver, 'ACBackupCopy'));
      await session.guard(backupQaDialog(driver, '确认', '复制未加密业务备份？'));
      const feedback = await session.guard(driver.waitForComponent(ON.text('备份复制失败；业务数据和输入保持不变。'), 3000));
      if (feedback === undefined || feedback === null) {
        throw new Error('Backup copy rejection was not rendered');
      }
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0066', BUNDLE + '_WorkspaceBackupUiQa_0014').assertEqual('备份复制失败；业务数据和输入保持不变。');
      loggedExpect(await backupQaText(driver, 'ACBackupImportText'), 'WorkspaceBackupUiQa.test.ets:A0067', BUNDLE + '_WorkspaceBackupUiQa_0014').assertEqual(fixture.incomingRaw);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0068', BUNDLE + '_WorkspaceBackupUiQa_0014').assertTrue();
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0069', BUNDLE + '_WorkspaceBackupUiQa_0014').assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1500
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0015
     * @tc.desc Deselecting every real scope checkbox gates only import operations
     * and never disables a safe full export.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0015', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeNote'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeReading'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeForm'));
      loggedExpect(await (await backupQaNode(driver, 'ACBackupPreview')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0070', BUNDLE + '_WorkspaceBackupUiQa_0015').assertFalse();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0071', BUNDLE + '_WorkspaceBackupUiQa_0015').assertFalse();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupGenerate')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0072', BUNDLE + '_WorkspaceBackupUiQa_0015').assertTrue();
      const fixture = currentWorkspaceBackupUiQa();
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0073', BUNDLE + '_WorkspaceBackupUiQa_0015').assertEqual(fixture.baseline);
      await session.guard(backupQaClick(driver, 'ACBackupScopeNote'));
      loggedExpect(await (await backupQaNode(driver, 'ACBackupPreview')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0074', BUNDLE + '_WorkspaceBackupUiQa_0015').assertTrue();
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0075', BUNDLE + '_WorkspaceBackupUiQa_0015').assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1600
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0016
     * @tc.desc Note-only restoration preserves unselected reading/form edits in memory
     * without silently persisting those dirty values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0016', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'scopePreserve'));
      const fixture = currentWorkspaceBackupUiQa();
      const before = decodeWorkspace(fixture.baseline);
      if (before === undefined) {
        throw new Error('Local saved baselines were invalid');
      }
      const beforeReading = findScene(before, 'reading');
      const beforeForm = findScene(before, 'form');
      if (beforeReading === undefined || beforeForm === undefined) {
        throw new Error('Saved unselected scenes missing');
      }
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeReading'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeForm'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      await session.guard(backupQaDialog(driver, '确认'));
      const stored = decodeWorkspace(fixture.store.stored());
      if (stored === undefined) {
        throw new Error('Selective restore produced an invalid durable root');
      }
      const reading = findScene(stored, 'reading');
      const form = findScene(stored, 'form');
      if (reading === undefined || form === undefined) {
        throw new Error('Selective restore discarded an unselected scene');
      }
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0076', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual('qa-private-backup-body');
      loggedExpect(fixture.controller.sceneSnapshot('reading').readingChapter, 'WorkspaceBackupUiQa.test.ets:A0077', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual(2);
      loggedExpect(fixture.controller.sceneSnapshot('form').formName, 'WorkspaceBackupUiQa.test.ets:A0078', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual('本机未保存姓名');
      loggedExpect(JSON.stringify(reading), 'WorkspaceBackupUiQa.test.ets:A0079', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual(JSON.stringify(beforeReading));
      loggedExpect(JSON.stringify(form), 'WorkspaceBackupUiQa.test.ets:A0080', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual(JSON.stringify(beforeForm));
      loggedExpect(fixture.controller.sceneWorkbench.snapshot().active, 'WorkspaceBackupUiQa.test.ets:A0081', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual('form');
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0082', BUNDLE + '_WorkspaceBackupUiQa_0016').assertEqual(fixture.baselineFlushes + 1);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0083', BUNDLE + '_WorkspaceBackupUiQa_0016').assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1700
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0017
     * @tc.desc Changing scope revokes an already valid preview while retaining source input for an explicit new review.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0017', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'empty'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeForm'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0084', BUNDLE + '_WorkspaceBackupUiQa_0017').assertEqual('恢复范围已变更，请重新校验并预览。');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0085', BUNDLE + '_WorkspaceBackupUiQa_0017').assertFalse();
      loggedExpect(await backupQaText(driver, 'ACBackupImportText'), 'WorkspaceBackupUiQa.test.ets:A0086', BUNDLE + '_WorkspaceBackupUiQa_0017').assertEqual(fixture.incomingRaw);
      loggedExpect(await (await backupQaNode(driver, 'ACBackupScopeForm')).isChecked(), 'WorkspaceBackupUiQa.test.ets:A0087', BUNDLE + '_WorkspaceBackupUiQa_0017').assertFalse();
      loggedExpect(fixture.store.flushCalls, 'WorkspaceBackupUiQa.test.ets:A0088', BUNDLE + '_WorkspaceBackupUiQa_0017').assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1800
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0018
     * @tc.desc A selected scene absent from a valid backup is explicitly cleared,
     * while unselected dirty scenes and their saved roots survive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0018', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'scopePreserve'));
      const fixture = currentWorkspaceBackupUiQa();
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeReading'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeForm'));
      await session.guard(backupQaInput(driver, encodeWorkspace(emptyWorkspace())));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      loggedExpect((await backupQaText(driver, 'ACBackupSummary')).indexOf('清空') >= 0, 'WorkspaceBackupUiQa.test.ets:A0089', BUNDLE + '_WorkspaceBackupUiQa_0018').assertTrue();
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      await session.guard(backupQaDialog(driver, '确认'));
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0090', BUNDLE + '_WorkspaceBackupUiQa_0018').assertEqual('');
      loggedExpect(fixture.controller.sceneSnapshot('form').formName, 'WorkspaceBackupUiQa.test.ets:A0091', BUNDLE + '_WorkspaceBackupUiQa_0018').assertEqual('本机未保存姓名');
      loggedExpect(fixture.controller.sceneSnapshot('reading').readingDirty, 'WorkspaceBackupUiQa.test.ets:A0092', BUNDLE + '_WorkspaceBackupUiQa_0018').assertTrue();
      const stored = decodeWorkspace(fixture.store.stored());
      if (stored === undefined) {
        throw new Error('Selective clear produced an invalid root');
      }
      const savedForm = findScene(stored, 'form');
      if (savedForm === undefined) {
        throw new Error('Selective clear lost the saved form');
      }
      loggedExpect(savedForm.state.form.name, 'WorkspaceBackupUiQa.test.ets:A0093', BUNDLE + '_WorkspaceBackupUiQa_0018').assertEqual('本机已保存姓名');
      loggedExpect(fixture.controller.sceneWorkbench.snapshot().active, 'WorkspaceBackupUiQa.test.ets:A0094', BUNDLE + '_WorkspaceBackupUiQa_0018').assertEqual('form');
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1900
     * @tc.name com.samples.appcontinuation_WorkspaceBackupUiQa_0019
     * @tc.desc A selective transaction failure compensates the saved root and preserves both selected original data
     * and unselected volatile edits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_WorkspaceBackupUiQa_0019', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchWorkspaceBackupUiQa(session, 'scopePreserve'));
      const fixture = currentWorkspaceBackupUiQa();
      fixture.store.failNextFlush = true;
      await session.guard(backupQaClick(driver, 'ACBackupPanelToggle'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeReading'));
      await session.guard(backupQaClick(driver, 'ACBackupScopeForm'));
      await session.guard(backupQaInput(driver, fixture.incomingRaw));
      await session.guard(backupQaClick(driver, 'ACBackupPreview'));
      await session.guard(backupQaClick(driver, 'ACBackupApply'));
      await session.guard(backupQaDialog(driver, '确认'));
      loggedExpect(await backupQaText(driver, 'ACBackupStatus'), 'WorkspaceBackupUiQa.test.ets:A0095', BUNDLE + '_WorkspaceBackupUiQa_0019').assertEqual('场景保存失败，已补偿回原存档；编辑、修订与历史保持原样');
      loggedExpect(fixture.store.stored(), 'WorkspaceBackupUiQa.test.ets:A0096', BUNDLE + '_WorkspaceBackupUiQa_0019').assertEqual(fixture.baseline);
      loggedExpect(fixture.controller.sceneSnapshot('note').noteBody, 'WorkspaceBackupUiQa.test.ets:A0097', BUNDLE + '_WorkspaceBackupUiQa_0019').assertEqual('本机原正文');
      loggedExpect(fixture.controller.sceneSnapshot('reading').readingChapter, 'WorkspaceBackupUiQa.test.ets:A0098', BUNDLE + '_WorkspaceBackupUiQa_0019').assertEqual(2);
      loggedExpect(fixture.controller.sceneSnapshot('form').formName, 'WorkspaceBackupUiQa.test.ets:A0099', BUNDLE + '_WorkspaceBackupUiQa_0019').assertEqual('本机未保存姓名');
      loggedExpect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled(), 'WorkspaceBackupUiQa.test.ets:A0100', BUNDLE + '_WorkspaceBackupUiQa_0019').assertFalse();
    });
  });
}
