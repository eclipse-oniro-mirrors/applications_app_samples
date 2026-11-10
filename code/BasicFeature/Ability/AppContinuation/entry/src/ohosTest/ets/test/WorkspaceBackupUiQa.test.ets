// 待集中验证：当前仅静态对齐正式组件/SDK，未执行本套件或任何中间门禁。
import { afterEach, describe, expect, it } from '@ohos/hypium';
import { ON } from '@kit.TestKit';
import { decodeWorkspace, emptyWorkspace, encodeWorkspace, findScene } from '../../../main/ets/learning/scene/SceneModel';
import { backupQaClick, backupQaDialog, backupQaInput, backupQaNode, backupQaText,
  currentWorkspaceBackupUiQa, finishWorkspaceBackupUiQa, launchWorkspaceBackupUiQa } from '../support/WorkspaceBackupUiQaSupport';

export default function workspaceBackupUiQaTests(): void {
  describe('WorkspaceBackupUiQa', (): void => {
    afterEach(async (): Promise<void> => { await finishWorkspaceBackupUiQa(); });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0100
     * @tc.name testWorkspaceBackupUiQa0001
     * @tc.desc The real collapsed entry reveals gated controls without generating or writing a backup implicitly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0001', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const collapsedInput = await driver.findComponent(ON.id('ACBackupImportText'));
      expect(collapsedInput === undefined || collapsedInput === null).assertTrue();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertFalse();
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('准备就绪。');
      const fixture = currentWorkspaceBackupUiQa();
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0200
     * @tc.name testWorkspaceBackupUiQa0002
     * @tc.desc Invalid text is rejected through the actual TextArea and cannot enable restore or mutate the current workspace.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0002', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, '{broken-backup');
      await backupQaClick(driver, 'ACBackupPreview');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('备份格式或业务状态无效。');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      const fixture = currentWorkspaceBackupUiQa();
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('本机原正文');
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0300
     * @tc.name testWorkspaceBackupUiQa0003
     * @tc.desc Generating a dirty workspace exposes a bounded export preview but never persists or clears the unsaved note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0003', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('dirty');
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupGenerate');
      const fixture = currentWorkspaceBackupUiQa();
      expect(await backupQaText(driver, 'ACBackupExportText')).assertEqual(fixture.controller.sceneBackupSnapshot().raw.slice(0, 512));
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertTrue();
      expect(fixture.controller.sceneSnapshot('note').noteDirty).assertTrue();
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes);
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0400
     * @tc.name testWorkspaceBackupUiQa0004
     * @tc.desc The real preview excludes private body values and cancelling clears input and authorization without losing local edits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0004', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('dirty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      const summary = await backupQaText(driver, 'ACBackupSummary');
      expect(summary.indexOf('qa-private-backup-body')).assertEqual(-1);
      expect(summary.indexOf('导入私密标题')).assertEqual(-1);
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertTrue();
      await backupQaClick(driver, 'ACBackupCancel');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('已取消恢复预览。');
      expect(await backupQaText(driver, 'ACBackupImportText')).assertEqual('');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('本机未保存正文');
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0500
     * @tc.name testWorkspaceBackupUiQa0005
     * @tc.desc Cancelling the actual system confirmation leaves the validated preview available and does not commit a scene root.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0005', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupApply');
      await backupQaDialog(driver, '取消');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('已取消。');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertTrue();
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes);
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('本机原正文');
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0600
     * @tc.name testWorkspaceBackupUiQa0006
     * @tc.desc Confirmed restoration commits the production root and updates note plus reading state instead of fabricating a UI success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0006', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupApply');
      await backupQaDialog(driver, '确认');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('本地业务工作区已恢复。');
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('qa-private-backup-body');
      const restored = decodeWorkspace(fixture.store.stored());
      if (restored === undefined) { throw new Error('Restored durable root was invalid'); }
      const reading = findScene(restored, 'reading');
      if (reading === undefined) { throw new Error('Durable reading scene was missing'); }
      expect(reading.state.reading.chapter).assertEqual(1);
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes + 1);
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(fixture.controller.snapshot().sessionActive).assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0700
     * @tc.name testWorkspaceBackupUiQa0007
     * @tc.desc A scene edit while the confirmation is open invalidates its captured token and preserves the newer local draft.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0007', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupApply');
      fixture.controller.sceneWorkbench.editNote('较新编辑', '确认期间的新正文', 0, 1);
      await backupQaDialog(driver, '确认');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('恢复预览已过期，请重新校验并预览。');
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('确认期间的新正文');
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0800
     * @tc.name testWorkspaceBackupUiQa0008
     * @tc.desc A failed flush is compensated by the real transaction and the panel consumes the failed preview instead of claiming recovery.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0008', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('writeFailure');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupApply');
      await backupQaDialog(driver, '确认');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('场景保存失败，已补偿回原存档；编辑、修订与历史保持原样');
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('本机原正文');
      expect(fixture.controller.sceneWorkbench.snapshot().storageFrozen).assertFalse();
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0900
     * @tc.name testWorkspaceBackupUiQa0009
     * @tc.desc Frozen storage permits a memory rescue export but gates preview and restore without overwriting corrupt bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0009', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('frozen');
      await backupQaClick(driver, 'ACBackupPanelToggle');
      expect(await (await backupQaNode(driver, 'ACBackupGenerate')).isEnabled()).assertTrue();
      expect(await (await backupQaNode(driver, 'ACBackupPreview')).isEnabled()).assertFalse();
      await backupQaClick(driver, 'ACBackupGenerate');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('已生成当前内存救援副本；原存档仍冻结，未修复或覆盖磁盘。');
      expect(currentWorkspaceBackupUiQa().store.stored()).assertEqual('{');
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertTrue();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1000
     * @tc.name testWorkspaceBackupUiQa0010
     * @tc.desc Editing input after a valid preview revokes authorization before the user attempts a restore.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0010', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaInput(driver, '{}');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(await backupQaText(driver, 'ACBackupSummary')).assertEqual('尚未预览；校验和取消均不会写入业务存储。');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('导入文本已变更，请校验并预览后再恢复。');
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1100
     * @tc.name testWorkspaceBackupUiQa0011
     * @tc.desc Collapsing and reopening clears sensitive export and import buffers without clearing the real workspace.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0011', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupGenerate');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupPanelToggle');
      expect(await backupQaText(driver, 'ACBackupImportText')).assertEqual('');
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertFalse();
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('本机原正文');
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1200
     * @tc.name testWorkspaceBackupUiQa0012
     * @tc.desc Cancelling the production privacy dialog never invokes even the isolated clipboard and preserves the generated export.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0012', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupGenerate');
      await backupQaClick(driver, 'ACBackupCopy');
      await backupQaDialog(driver, '取消', '复制未加密业务备份？');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('已取消。');
      expect(fixture.clipboard.texts.length).assertEqual(0);
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertTrue();
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1300
     * @tc.name testWorkspaceBackupUiQa0013
     * @tc.desc Confirmed copy awaits the actual model clipboard promise, gates input and sends the complete export rather than its short preview.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0013', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('copyPending');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupGenerate');
      const exported = fixture.controller.sceneBackupSnapshot().raw;
      await backupQaClick(driver, 'ACBackupCopy');
      await backupQaDialog(driver, '确认', '复制未加密业务备份？');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('正在等待本机剪贴板复制结果…');
      expect(await (await backupQaNode(driver, 'ACBackupImportText')).isEnabled()).assertFalse();
      expect(await (await backupQaNode(driver, 'ACBackupGenerate')).isEnabled()).assertFalse();
      expect(fixture.clipboard.texts[0]).assertEqual(exported);
      fixture.clipboard.release();
      const feedback = await driver.waitForComponent(ON.text('业务备份已复制到本机剪贴板；内容未加密，请妥善保管。'), 3000);
      if (feedback === undefined || feedback === null) { throw new Error('Backup clipboard acknowledgment not rendered'); }
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertTrue();
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1400
     * @tc.name testWorkspaceBackupUiQa0014
     * @tc.desc A clipboard rejection is redacted by the production model, leaves input intact and re-enables retry without a scene write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0014', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('copyFailure');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupGenerate');
      await backupQaClick(driver, 'ACBackupCopy');
      await backupQaDialog(driver, '确认', '复制未加密业务备份？');
      const feedback = await driver.waitForComponent(ON.text('备份复制失败；业务数据和输入保持不变。'), 3000);
      if (feedback === undefined || feedback === null) { throw new Error('Backup copy rejection was not rendered'); }
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('备份复制失败；业务数据和输入保持不变。');
      expect(await backupQaText(driver, 'ACBackupImportText')).assertEqual(fixture.incomingRaw);
      expect(await (await backupQaNode(driver, 'ACBackupCopy')).isEnabled()).assertTrue();
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1500
     * @tc.name testWorkspaceBackupUiQa0015
     * @tc.desc Deselecting every real scope checkbox gates only import operations and never disables a safe full export.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0015', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupScopeNote');
      await backupQaClick(driver, 'ACBackupScopeReading');
      await backupQaClick(driver, 'ACBackupScopeForm');
      expect(await (await backupQaNode(driver, 'ACBackupPreview')).isEnabled()).assertFalse();
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(await (await backupQaNode(driver, 'ACBackupGenerate')).isEnabled()).assertTrue();
      const fixture = currentWorkspaceBackupUiQa();
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
      await backupQaClick(driver, 'ACBackupScopeNote');
      expect(await (await backupQaNode(driver, 'ACBackupPreview')).isEnabled()).assertTrue();
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1600
     * @tc.name testWorkspaceBackupUiQa0016
     * @tc.desc Note-only restoration preserves unselected reading/form edits in memory without silently persisting those dirty values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0016', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('scopePreserve');
      const fixture = currentWorkspaceBackupUiQa();
      const before = decodeWorkspace(fixture.baseline);
      if (before === undefined) { throw new Error('Local saved baselines were invalid'); }
      const beforeReading = findScene(before, 'reading');
      const beforeForm = findScene(before, 'form');
      if (beforeReading === undefined || beforeForm === undefined) { throw new Error('Saved unselected scenes missing'); }
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupScopeReading');
      await backupQaClick(driver, 'ACBackupScopeForm');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupApply');
      await backupQaDialog(driver, '确认');
      const stored = decodeWorkspace(fixture.store.stored());
      if (stored === undefined) { throw new Error('Selective restore produced an invalid durable root'); }
      const reading = findScene(stored, 'reading');
      const form = findScene(stored, 'form');
      if (reading === undefined || form === undefined) { throw new Error('Selective restore discarded an unselected scene'); }
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('qa-private-backup-body');
      expect(fixture.controller.sceneSnapshot('reading').readingChapter).assertEqual(2);
      expect(fixture.controller.sceneSnapshot('form').formName).assertEqual('本机未保存姓名');
      expect(JSON.stringify(reading)).assertEqual(JSON.stringify(beforeReading));
      expect(JSON.stringify(form)).assertEqual(JSON.stringify(beforeForm));
      expect(fixture.controller.sceneWorkbench.snapshot().active).assertEqual('form');
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes + 1);
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1700
     * @tc.name testWorkspaceBackupUiQa0017
     * @tc.desc Changing scope revokes an already valid preview while retaining source input for an explicit new review.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0017', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('empty');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupScopeForm');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('恢复范围已变更，请重新校验并预览。');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
      expect(await backupQaText(driver, 'ACBackupImportText')).assertEqual(fixture.incomingRaw);
      expect(await (await backupQaNode(driver, 'ACBackupScopeForm')).isChecked()).assertFalse();
      expect(fixture.store.flushCalls).assertEqual(fixture.baselineFlushes);
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1800
     * @tc.name testWorkspaceBackupUiQa0018
     * @tc.desc A selected scene absent from a valid backup is explicitly cleared, while unselected dirty scenes and their saved roots survive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0018', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('scopePreserve');
      const fixture = currentWorkspaceBackupUiQa();
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupScopeReading');
      await backupQaClick(driver, 'ACBackupScopeForm');
      await backupQaInput(driver, encodeWorkspace(emptyWorkspace()));
      await backupQaClick(driver, 'ACBackupPreview');
      expect((await backupQaText(driver, 'ACBackupSummary')).indexOf('清空') >= 0).assertTrue();
      await backupQaClick(driver, 'ACBackupApply');
      await backupQaDialog(driver, '确认');
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('');
      expect(fixture.controller.sceneSnapshot('form').formName).assertEqual('本机未保存姓名');
      expect(fixture.controller.sceneSnapshot('reading').readingDirty).assertTrue();
      const stored = decodeWorkspace(fixture.store.stored());
      if (stored === undefined) { throw new Error('Selective clear produced an invalid root'); }
      const savedForm = findScene(stored, 'form');
      if (savedForm === undefined) { throw new Error('Selective clear lost the saved form'); }
      expect(savedForm.state.form.name).assertEqual('本机已保存姓名');
      expect(fixture.controller.sceneWorkbench.snapshot().active).assertEqual('form');
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1900
     * @tc.name testWorkspaceBackupUiQa0019
     * @tc.desc A selective transaction failure compensates the saved root and preserves both selected original data and unselected volatile edits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWorkspaceBackupUiQa0019', 0, async (): Promise<void> => {
      const driver = await launchWorkspaceBackupUiQa('scopePreserve');
      const fixture = currentWorkspaceBackupUiQa();
      fixture.store.failNextFlush = true;
      await backupQaClick(driver, 'ACBackupPanelToggle');
      await backupQaClick(driver, 'ACBackupScopeReading');
      await backupQaClick(driver, 'ACBackupScopeForm');
      await backupQaInput(driver, fixture.incomingRaw);
      await backupQaClick(driver, 'ACBackupPreview');
      await backupQaClick(driver, 'ACBackupApply');
      await backupQaDialog(driver, '确认');
      expect(await backupQaText(driver, 'ACBackupStatus')).assertEqual('场景保存失败，已补偿回原存档；编辑、修订与历史保持原样');
      expect(fixture.store.stored()).assertEqual(fixture.baseline);
      expect(fixture.controller.sceneSnapshot('note').noteBody).assertEqual('本机原正文');
      expect(fixture.controller.sceneSnapshot('reading').readingChapter).assertEqual(2);
      expect(fixture.controller.sceneSnapshot('form').formName).assertEqual('本机未保存姓名');
      expect(await (await backupQaNode(driver, 'ACBackupApply')).isEnabled()).assertFalse();
    });
  });
}
