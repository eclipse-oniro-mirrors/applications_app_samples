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
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  SCENE_WORKSPACE_LIMIT,
  SceneWorkspace,
  decodeWorkspace,
  encodeWorkspace,
  findScene
} from '../../../main/ets/learning/scene/SceneModel';
import {
  SceneBackupCode, readSceneBackup, sceneBackupPreviewText
} from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { BackupStore, backupRaw, backupRoot } from '../support/SceneBackupFixtures';
import { waveNote } from '../support/ContinuationWaveOneFixtures';

export default function sceneBackupPlanningCases(): void {
  describe('SceneBackupPlanningCases', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0100
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0001
     * @tc.desc 生成备份保留当前业务编辑和笔记保存基线，不隐式保存或消耗修订
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0001', 0, (): void => {
      const store = new BackupStore(backupRaw());
      const work = new SceneWorkbench(store);
      work.editNote('未保存标题', 'A😀未保存正文', 1, 3);
      work.gotoParagraph(2, 1);
      work.addBookmark();
      work.setFormField('address', '未保存新地址');
      const exported = work.backupSnapshot();
      const root = readSceneBackup(exported.raw).workspace as SceneWorkspace;
      loggedExpect(exported.ok, 'SceneBackupPlanningCases.test.ets:A0001', BUNDLE + '_ContinuationBackupPlan_0001').assertTrue();
      loggedExpect(exported.containsDirty, 'SceneBackupPlanningCases.test.ets:A0002', BUNDLE + '_ContinuationBackupPlan_0001').assertTrue();
      loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupPlanningCases.test.ets:A0003', BUNDLE + '_ContinuationBackupPlan_0001').assertEqual('A😀未保存正文');
      loggedExpect(findScene(root, 'note')?.state.note.savedBody, 'SceneBackupPlanningCases.test.ets:A0004', BUNDLE + '_ContinuationBackupPlan_0001').assertEqual('备份笔记正文');
      loggedExpect(findScene(root, 'reading')?.state.reading.bookmarks[0].chapter, 'SceneBackupPlanningCases.test.ets:A0005', BUNDLE + '_ContinuationBackupPlan_0001').assertEqual(2);
      loggedExpect(findScene(root, 'form')?.state.form.address, 'SceneBackupPlanningCases.test.ets:A0006', BUNDLE + '_ContinuationBackupPlan_0001').assertEqual('未保存新地址');
      loggedExpect(work.document('note').revision, 'SceneBackupPlanningCases.test.ets:A0007', BUNDLE + '_ContinuationBackupPlan_0001').assertEqual(3); loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0008', BUNDLE + '_ContinuationBackupPlan_0001').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0200
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0002
     * @tc.desc 损坏磁盘只能生成明确标注的内存救援副本，不能借导出解除冻结
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0002', 0, (): void => {
      const store = new BackupStore('{损坏原档');
      const work = new SceneWorkbench(store);
      work.editNote('救援', '内存仍可保留', 0, 3);
      const exported = work.backupSnapshot();
      const root = readSceneBackup(exported.raw).workspace as SceneWorkspace;
      loggedExpect(exported.ok, 'SceneBackupPlanningCases.test.ets:A0009', BUNDLE + '_ContinuationBackupPlan_0002').assertTrue();
      loggedExpect(exported.frozen, 'SceneBackupPlanningCases.test.ets:A0010', BUNDLE + '_ContinuationBackupPlan_0002').assertTrue();
      loggedExpect(exported.message.indexOf('救援') >= 0, 'SceneBackupPlanningCases.test.ets:A0011', BUNDLE + '_ContinuationBackupPlan_0002').assertTrue();
      loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupPlanningCases.test.ets:A0012', BUNDLE + '_ContinuationBackupPlan_0002').assertEqual('内存仍可保留');
      loggedExpect(work.saveNote(), 'SceneBackupPlanningCases.test.ets:A0013', BUNDLE + '_ContinuationBackupPlan_0002').assertFalse();
      loggedExpect(store.stored(), 'SceneBackupPlanningCases.test.ets:A0014', BUNDLE + '_ContinuationBackupPlan_0002').assertEqual('{损坏原档');
      loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0015', BUNDLE + '_ContinuationBackupPlan_0002').assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0300
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0003
     * @tc.desc 差异预览只显示字段类别和修订，不泄露笔记正文姓名电话地址或文档标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0003', 0, (): void => {
      const work = new SceneWorkbench(new BackupStore());
      const incoming = backupRoot('机密正文暗号');
      const preview = work.previewBackup(encodeWorkspace(incoming));
      const text = sceneBackupPreviewText(preview);
      const json = JSON.stringify(preview);
      loggedExpect(preview.ok, 'SceneBackupPlanningCases.test.ets:A0016', BUNDLE + '_ContinuationBackupPlan_0003').assertTrue();
      loggedExpect(text.indexOf('正文') >= 0, 'SceneBackupPlanningCases.test.ets:A0017', BUNDLE + '_ContinuationBackupPlan_0003').assertTrue();
      loggedExpect(text.indexOf('姓名') >= 0, 'SceneBackupPlanningCases.test.ets:A0018', BUNDLE + '_ContinuationBackupPlan_0003').assertTrue();
      loggedExpect(json.indexOf('机密正文暗号'), 'SceneBackupPlanningCases.test.ets:A0019', BUNDLE + '_ContinuationBackupPlan_0003').assertEqual(-1); loggedExpect(text.indexOf('13800138000'), 'SceneBackupPlanningCases.test.ets:A0020', BUNDLE + '_ContinuationBackupPlan_0003').assertEqual(-1);
      loggedExpect(json.indexOf('备份地址'), 'SceneBackupPlanningCases.test.ets:A0021', BUNDLE + '_ContinuationBackupPlan_0003').assertEqual(-1); loggedExpect(json.indexOf('backup-note'), 'SceneBackupPlanningCases.test.ets:A0022', BUNDLE + '_ContinuationBackupPlan_0003').assertEqual(-1);
      loggedExpect(work.snapshot().noteBody, 'SceneBackupPlanningCases.test.ets:A0023', BUNDLE + '_ContinuationBackupPlan_0003').assertEqual(''); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0400
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0004
     * @tc.desc 预览在工作区之外计算完整计划，既不修改当前编辑也不修改粘贴源对象
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0004', 0, (): void => {
      const store = new BackupStore(backupRaw('本机正文', 5));
      const work = new SceneWorkbench(store);
      work.setFormField('note', '本机临时备注');
      const source = backupRoot('备份旧正文', 2);
      const before = encodeWorkspace(source);
      const preview = work.previewBackup(before);
      loggedExpect(preview.scenes[0].restoreRevision, 'SceneBackupPlanningCases.test.ets:A0024', BUNDLE + '_ContinuationBackupPlan_0004').assertEqual(6); loggedExpect(preview.requiresDirtyConfirmation, 'SceneBackupPlanningCases.test.ets:A0025', BUNDLE + '_ContinuationBackupPlan_0004').assertTrue();
      loggedExpect(work.document('note').state.note.body, 'SceneBackupPlanningCases.test.ets:A0026', BUNDLE + '_ContinuationBackupPlan_0004').assertEqual('本机正文');
      loggedExpect(work.document('form').state.form.note, 'SceneBackupPlanningCases.test.ets:A0027', BUNDLE + '_ContinuationBackupPlan_0004').assertEqual('本机临时备注');
      loggedExpect(encodeWorkspace(source), 'SceneBackupPlanningCases.test.ets:A0028', BUNDLE + '_ContinuationBackupPlan_0004').assertEqual(before); loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0029', BUNDLE + '_ContinuationBackupPlan_0004').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0500
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0005
     * @tc.desc 新的非法输入撤销旧预览令牌且不回显解析片段或覆盖当前业务
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0005', 0, (): void => {
      const store = new BackupStore();
      const work = new SceneWorkbench(store);
      const old = work.previewBackup(backupRaw());
      const invalid = work.previewBackup('{"private-body-secret":'); const stale = work.restoreBackup(old.token, true);
      loggedExpect(invalid.code, 'SceneBackupPlanningCases.test.ets:A0030', BUNDLE + '_ContinuationBackupPlan_0005').assertEqual(SceneBackupCode.INVALID); loggedExpect(invalid.token, 'SceneBackupPlanningCases.test.ets:A0031', BUNDLE + '_ContinuationBackupPlan_0005').assertEqual('');
      loggedExpect(sceneBackupPreviewText(invalid).indexOf('private-body-secret'), 'SceneBackupPlanningCases.test.ets:A0032', BUNDLE + '_ContinuationBackupPlan_0005').assertEqual(-1);
      loggedExpect(stale.code, 'SceneBackupPlanningCases.test.ets:A0033', BUNDLE + '_ContinuationBackupPlan_0005').assertEqual(SceneBackupCode.STALE);
      loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0034', BUNDLE + '_ContinuationBackupPlan_0005').assertEqual(0);
      loggedExpect(work.snapshot().noteBody, 'SceneBackupPlanningCases.test.ets:A0035', BUNDLE + '_ContinuationBackupPlan_0005').assertEqual('');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0600
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0006
     * @tc.desc 原始备份精确容量可校验，越限一个字符拒绝而不能截前缀恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0006', 0, (): void => {
      const store = new BackupStore(); const work = new SceneWorkbench(store); const raw = backupRaw();
      const edge = raw + ' '.repeat(SCENE_WORKSPACE_LIMIT - raw.length); const accepted = work.previewBackup(edge);
      const rejected = work.previewBackup(edge + ' ');
      loggedExpect(accepted.ok, 'SceneBackupPlanningCases.test.ets:A0036', BUNDLE + '_ContinuationBackupPlan_0006').assertTrue();
      loggedExpect(rejected.ok, 'SceneBackupPlanningCases.test.ets:A0037', BUNDLE + '_ContinuationBackupPlan_0006').assertFalse();
      loggedExpect(rejected.issues[0].message.indexOf('不会截断') >= 0, 'SceneBackupPlanningCases.test.ets:A0038', BUNDLE + '_ContinuationBackupPlan_0006').assertTrue();
      loggedExpect(work.restoreBackup(accepted.token, true).code, 'SceneBackupPlanningCases.test.ets:A0039', BUNDLE + '_ContinuationBackupPlan_0006').assertEqual(SceneBackupCode.STALE);
      loggedExpect(store.flushCalls, 'SceneBackupPlanningCases.test.ets:A0040', BUNDLE + '_ContinuationBackupPlan_0006').assertEqual(0);
      loggedExpect(work.document('reading').state.reading.chapter, 'SceneBackupPlanningCases.test.ets:A0041', BUNDLE + '_ContinuationBackupPlan_0006').assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0700
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0007
     * @tc.desc 导入委托正式场景校验，保存选区坏代理对不能因当前选区合法而放行
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0007', 0, (): void => {
      const store = new BackupStore(backupRaw('本机仍在'));
      const work = new SceneWorkbench(store);
      const root = backupRoot();
      const note = findScene(root, 'note');
      if (note === undefined) {
        throw new Error('fixture note missing');
      }
      note.state.note.savedBody = '😀'; note.state.note.savedSelectionStart = 1; note.state.note.savedSelectionEnd = 2;
      const preview = work.previewBackup(encodeWorkspace(root));
      loggedExpect(preview.ok, 'SceneBackupPlanningCases.test.ets:A0042', BUNDLE + '_ContinuationBackupPlan_0007').assertFalse();
      loggedExpect(preview.token, 'SceneBackupPlanningCases.test.ets:A0043', BUNDLE + '_ContinuationBackupPlan_0007').assertEqual('');
      loggedExpect(work.snapshot().noteBody, 'SceneBackupPlanningCases.test.ets:A0044', BUNDLE + '_ContinuationBackupPlan_0007').assertEqual('本机仍在');
      loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0045', BUNDLE + '_ContinuationBackupPlan_0007').assertEqual(0); loggedExpect(work.previewBackup(backupRaw()).ok, 'SceneBackupPlanningCases.test.ets:A0046', BUNDLE + '_ContinuationBackupPlan_0007').assertTrue(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0800
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0008
     * @tc.desc 合法头部不能掩盖不归属该头部的历史，整root必须拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0008', 0, (): void => {
      const store = new BackupStore(backupRaw()); const work = new SceneWorkbench(store); const root = backupRoot();
      root.history.push(waveNote('foreign-history', 1, '不可归属的旧正文'));
      const preview = work.previewBackup(encodeWorkspace(root));
      loggedExpect(preview.code, 'SceneBackupPlanningCases.test.ets:A0047', BUNDLE + '_ContinuationBackupPlan_0008').assertEqual(SceneBackupCode.INVALID); loggedExpect(preview.scenes.length, 'SceneBackupPlanningCases.test.ets:A0048', BUNDLE + '_ContinuationBackupPlan_0008').assertEqual(0);
      loggedExpect(work.historyDocuments().length, 'SceneBackupPlanningCases.test.ets:A0049', BUNDLE + '_ContinuationBackupPlan_0008').assertEqual(0); loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0050', BUNDLE + '_ContinuationBackupPlan_0008').assertEqual(0);
      loggedExpect(decodeWorkspace(work.backupSnapshot().raw) !== undefined, 'SceneBackupPlanningCases.test.ets:A0051', BUNDLE + '_ContinuationBackupPlan_0008').assertTrue(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPPLAN_0900
     * @tc.name com.samples.appcontinuation_ContinuationBackupPlan_0009
     * @tc.desc 解析导出副本后的外部修改不改变后续导出或当前保存基线
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupPlan_0009', 0, (): void => {
      const store = new BackupStore(backupRaw());
      const work = new SceneWorkbench(store);
      const first = work.backupSnapshot();
      const detached = readSceneBackup(first.raw).workspace as SceneWorkspace; const note = findScene(detached, 'note');
      if (note === undefined) {
        throw new Error('fixture note missing');
      }
      note.state.note.savedBody = '外部改写';
      detached.history.push(waveNote('backup-note', 1));
      const second = readSceneBackup(work.backupSnapshot().raw).workspace as SceneWorkspace;
      loggedExpect(findScene(second, 'note')?.state.note.savedBody, 'SceneBackupPlanningCases.test.ets:A0052', BUNDLE + '_ContinuationBackupPlan_0009').assertEqual('备份笔记正文');
      loggedExpect(second.history.length, 'SceneBackupPlanningCases.test.ets:A0053', BUNDLE + '_ContinuationBackupPlan_0009').assertEqual(0);
      loggedExpect(work.hasDirtyWork(), 'SceneBackupPlanningCases.test.ets:A0054', BUNDLE + '_ContinuationBackupPlan_0009').assertFalse();
      loggedExpect(work.isBackupCurrent(first.epoch), 'SceneBackupPlanningCases.test.ets:A0055', BUNDLE + '_ContinuationBackupPlan_0009').assertTrue();
      loggedExpect(store.putCalls, 'SceneBackupPlanningCases.test.ets:A0056', BUNDLE + '_ContinuationBackupPlan_0009').assertEqual(0);
      work.dispose();
    });
  });
}
