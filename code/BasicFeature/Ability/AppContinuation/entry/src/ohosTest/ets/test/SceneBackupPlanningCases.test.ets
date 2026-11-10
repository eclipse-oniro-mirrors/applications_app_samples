// 待集中验证：本批仅静态编写，未执行host、语法检查、构建或设备测试。
import { describe, expect, it } from '@ohos/hypium';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SCENE_WORKSPACE_LIMIT, SceneWorkspace, decodeWorkspace, encodeWorkspace, findScene } from '../../../main/ets/learning/scene/SceneModel';
import { SceneBackupCode, readSceneBackup, sceneBackupPreviewText } from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { BackupStore, backupRaw, backupRoot } from '../support/SceneBackupFixtures';
import { waveNote } from '../support/ContinuationWaveOneFixtures';

export default function sceneBackupPlanningCases(): void {
  describe('SceneBackupPlanningCases', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0100
     * @tc.name testContinuationBackupPlan0001
     * @tc.desc 生成备份保留当前业务编辑和笔记保存基线，不隐式保存或消耗修订
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0001', 0, (): void => {
      const store = new BackupStore(backupRaw()); const work = new SceneWorkbench(store);
      work.editNote('未保存标题', 'A😀未保存正文', 1, 3); work.gotoParagraph(2, 1); work.addBookmark(); work.setFormField('address', '未保存新地址');
      const exported = work.backupSnapshot(); const root = readSceneBackup(exported.raw).workspace as SceneWorkspace;
      expect(exported.ok).assertTrue(); expect(exported.containsDirty).assertTrue();
      expect(findScene(root, 'note')?.state.note.body).assertEqual('A😀未保存正文');
      expect(findScene(root, 'note')?.state.note.savedBody).assertEqual('备份笔记正文');
      expect(findScene(root, 'reading')?.state.reading.bookmarks[0].chapter).assertEqual(2);
      expect(findScene(root, 'form')?.state.form.address).assertEqual('未保存新地址');
      expect(work.document('note').revision).assertEqual(3); expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0200
     * @tc.name testContinuationBackupPlan0002
     * @tc.desc 损坏磁盘只能生成明确标注的内存救援副本，不能借导出解除冻结
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0002', 0, (): void => {
      const store = new BackupStore('{损坏原档'); const work = new SceneWorkbench(store); work.editNote('救援', '内存仍可保留', 0, 3);
      const exported = work.backupSnapshot(); const root = readSceneBackup(exported.raw).workspace as SceneWorkspace;
      expect(exported.ok).assertTrue(); expect(exported.frozen).assertTrue(); expect(exported.message.indexOf('救援') >= 0).assertTrue();
      expect(findScene(root, 'note')?.state.note.body).assertEqual('内存仍可保留'); expect(work.saveNote()).assertFalse();
      expect(store.stored()).assertEqual('{损坏原档'); expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0300
     * @tc.name testContinuationBackupPlan0003
     * @tc.desc 差异预览只显示字段类别和修订，不泄露笔记正文姓名电话地址或文档标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0003', 0, (): void => {
      const work = new SceneWorkbench(new BackupStore()); const incoming = backupRoot('机密正文暗号');
      const preview = work.previewBackup(encodeWorkspace(incoming)); const text = sceneBackupPreviewText(preview); const json = JSON.stringify(preview);
      expect(preview.ok).assertTrue(); expect(text.indexOf('正文') >= 0).assertTrue(); expect(text.indexOf('姓名') >= 0).assertTrue();
      expect(json.indexOf('机密正文暗号')).assertEqual(-1); expect(text.indexOf('13800138000')).assertEqual(-1);
      expect(json.indexOf('备份地址')).assertEqual(-1); expect(json.indexOf('backup-note')).assertEqual(-1);
      expect(work.snapshot().noteBody).assertEqual(''); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0400
     * @tc.name testContinuationBackupPlan0004
     * @tc.desc 预览在工作区之外计算完整计划，既不修改当前编辑也不修改粘贴源对象
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0004', 0, (): void => {
      const store = new BackupStore(backupRaw('本机正文', 5)); const work = new SceneWorkbench(store); work.setFormField('note', '本机临时备注');
      const source = backupRoot('备份旧正文', 2); const before = encodeWorkspace(source); const preview = work.previewBackup(before);
      expect(preview.scenes[0].restoreRevision).assertEqual(6); expect(preview.requiresDirtyConfirmation).assertTrue();
      expect(work.document('note').state.note.body).assertEqual('本机正文'); expect(work.document('form').state.form.note).assertEqual('本机临时备注');
      expect(encodeWorkspace(source)).assertEqual(before); expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0500
     * @tc.name testContinuationBackupPlan0005
     * @tc.desc 新的非法输入撤销旧预览令牌且不回显解析片段或覆盖当前业务
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0005', 0, (): void => {
      const store = new BackupStore(); const work = new SceneWorkbench(store); const old = work.previewBackup(backupRaw());
      const invalid = work.previewBackup('{"private-body-secret":'); const stale = work.restoreBackup(old.token, true);
      expect(invalid.code).assertEqual(SceneBackupCode.INVALID); expect(invalid.token).assertEqual('');
      expect(sceneBackupPreviewText(invalid).indexOf('private-body-secret')).assertEqual(-1);
      expect(stale.code).assertEqual(SceneBackupCode.STALE); expect(store.putCalls).assertEqual(0); expect(work.snapshot().noteBody).assertEqual(''); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0600
     * @tc.name testContinuationBackupPlan0006
     * @tc.desc 原始备份精确容量可校验，越限一个字符拒绝而不能截前缀恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0006', 0, (): void => {
      const store = new BackupStore(); const work = new SceneWorkbench(store); const raw = backupRaw();
      const edge = raw + ' '.repeat(SCENE_WORKSPACE_LIMIT - raw.length); const accepted = work.previewBackup(edge);
      const rejected = work.previewBackup(edge + ' ');
      expect(accepted.ok).assertTrue(); expect(rejected.ok).assertFalse(); expect(rejected.issues[0].message.indexOf('不会截断') >= 0).assertTrue();
      expect(work.restoreBackup(accepted.token, true).code).assertEqual(SceneBackupCode.STALE);
      expect(store.flushCalls).assertEqual(0); expect(work.document('reading').state.reading.chapter).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0700
     * @tc.name testContinuationBackupPlan0007
     * @tc.desc 导入委托正式场景校验，保存选区坏代理对不能因当前选区合法而放行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0007', 0, (): void => {
      const store = new BackupStore(backupRaw('本机仍在')); const work = new SceneWorkbench(store); const root = backupRoot();
      const note = findScene(root, 'note'); if (note === undefined) { throw new Error('fixture note missing'); }
      note.state.note.savedBody = '😀'; note.state.note.savedSelectionStart = 1; note.state.note.savedSelectionEnd = 2;
      const preview = work.previewBackup(encodeWorkspace(root));
      expect(preview.ok).assertFalse(); expect(preview.token).assertEqual(''); expect(work.snapshot().noteBody).assertEqual('本机仍在');
      expect(store.putCalls).assertEqual(0); expect(work.previewBackup(backupRaw()).ok).assertTrue(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0800
     * @tc.name testContinuationBackupPlan0008
     * @tc.desc 合法头部不能掩盖不归属该头部的历史，整root必须拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0008', 0, (): void => {
      const store = new BackupStore(backupRaw()); const work = new SceneWorkbench(store); const root = backupRoot();
      root.history.push(waveNote('foreign-history', 1, '不可归属的旧正文'));
      const preview = work.previewBackup(encodeWorkspace(root));
      expect(preview.code).assertEqual(SceneBackupCode.INVALID); expect(preview.scenes.length).assertEqual(0);
      expect(work.historyDocuments().length).assertEqual(0); expect(store.putCalls).assertEqual(0);
      expect(decodeWorkspace(work.backupSnapshot().raw) !== undefined).assertTrue(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0900
     * @tc.name testContinuationBackupPlan0009
     * @tc.desc 解析导出副本后的外部修改不改变后续导出或当前保存基线
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupPlan0009', 0, (): void => {
      const store = new BackupStore(backupRaw()); const work = new SceneWorkbench(store); const first = work.backupSnapshot();
      const detached = readSceneBackup(first.raw).workspace as SceneWorkspace; const note = findScene(detached, 'note');
      if (note === undefined) { throw new Error('fixture note missing'); } note.state.note.savedBody = '外部改写'; detached.history.push(waveNote('backup-note', 1));
      const second = readSceneBackup(work.backupSnapshot().raw).workspace as SceneWorkspace;
      expect(findScene(second, 'note')?.state.note.savedBody).assertEqual('备份笔记正文'); expect(second.history.length).assertEqual(0);
      expect(work.hasDirtyWork()).assertFalse(); expect(work.isBackupCurrent(first.epoch)).assertTrue(); expect(store.putCalls).assertEqual(0); work.dispose();
    });
  });
}
