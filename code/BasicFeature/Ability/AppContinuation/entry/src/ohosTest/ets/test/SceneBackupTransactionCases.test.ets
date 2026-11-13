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
  REVISION_LIMIT,
  SCENE_STORE_KEY,
  SceneWorkspace,
  emptyWorkspace,
  encodeWorkspace,
  findScene,
  stageScene
} from '../../../main/ets/learning/scene/SceneModel';
import { SceneBackupCode, readSceneBackup } from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { BackupStore, backupRaw, backupRoot, reopenedBackup } from '../support/SceneBackupFixtures';
import { waveNote } from '../support/ContinuationWaveOneFixtures';

export default function sceneBackupTransactionCases(): void {
  describe('SceneBackupTransactionCases', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0100
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0001
     * @tc.desc 整root恢复只有一次put和flush，flush返回前仍能观察旧业务而非部分恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0001', 0, (): void => {
      const store = new BackupStore();
      const work = new SceneWorkbench(store);
      const observed: string[] = [];
      const chapters: number[] = [];
      store.onFlush = (): void => {
        observed.push(work.document('note').state.note.body);
        chapters.push(work.document('reading').state.reading.chapter);
      };
      const preview = work.previewBackup(backupRaw());
      const result = work.restoreBackup(preview.token, true);
      const reopened = reopenedBackup(store);
      loggedExpect(result.code, 'SceneBackupTransactionCases.test.ets:A0001', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual(SceneBackupCode.RESTORED);
      loggedExpect(observed[0], 'SceneBackupTransactionCases.test.ets:A0002', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual('');
      loggedExpect(chapters[0], 'SceneBackupTransactionCases.test.ets:A0003', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual(0);
      loggedExpect(reopened.document('note').state.note.body, 'SceneBackupTransactionCases.test.ets:A0004', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual('备份笔记正文');
      loggedExpect(reopened.document('reading').state.reading.anchor, 'SceneBackupTransactionCases.test.ets:A0005', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual(2);
      loggedExpect(reopened.document('form').state.form.name, 'SceneBackupTransactionCases.test.ets:A0006', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual('备份用户');
      loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0007', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual(1);
      loggedExpect(store.flushCalls, 'SceneBackupTransactionCases.test.ets:A0008', BUNDLE + '_ContinuationBackupTransaction_0001').assertEqual(1);
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0200
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0002
     * @tc.desc 同身份恢复旧备份按本机较高修订加一，并整份替换而不混合两套历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0002', 0, (): void => {
      const local = backupRoot('本机新正文', 5); local.history.push(waveNote('backup-note', 4, '本机历史'));
      const incoming = backupRoot('备份旧正文', 2); incoming.history.push(waveNote('backup-note', 1, '备份更早正文'));
      const store = new BackupStore(encodeWorkspace(local));
      const work = new SceneWorkbench(store);
      const preview = work.previewBackup(encodeWorkspace(incoming));
      const result = work.restoreBackup(preview.token, false); const history = work.historyDocuments('note');
      loggedExpect(result.ok, 'SceneBackupTransactionCases.test.ets:A0009', BUNDLE + '_ContinuationBackupTransaction_0002').assertTrue();
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0010', BUNDLE + '_ContinuationBackupTransaction_0002').assertEqual(6);
      loggedExpect(work.document('note').state.note.body, 'SceneBackupTransactionCases.test.ets:A0011', BUNDLE + '_ContinuationBackupTransaction_0002').assertEqual('备份旧正文');
      loggedExpect(history.map((row): number => row.revision).join(','), 'SceneBackupTransactionCases.test.ets:A0012', BUNDLE + '_ContinuationBackupTransaction_0002').assertEqual('1,2');
      loggedExpect(history[0].state.note.body, 'SceneBackupTransactionCases.test.ets:A0013', BUNDLE + '_ContinuationBackupTransaction_0002').assertEqual('备份更早正文');
      loggedExpect(history[1].state.note.body, 'SceneBackupTransactionCases.test.ets:A0014', BUNDLE + '_ContinuationBackupTransaction_0002').assertEqual('备份旧正文'); loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0015', BUNDLE + '_ContinuationBackupTransaction_0002').assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0300
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0003
     * @tc.desc 备份同身份修订比本机更高时也生成其下一版，不在导入后复用备份头号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0003', 0, (): void => {
      const store = new BackupStore(backupRaw('本机旧正文', 2)); const work = new SceneWorkbench(store);
      const preview = work.previewBackup(backupRaw('备份更新正文', 8));
      const result = work.restoreBackup(preview.token, false);
      const reopened = reopenedBackup(store);
      loggedExpect(preview.scenes[0].restoreRevision, 'SceneBackupTransactionCases.test.ets:A0016', BUNDLE + '_ContinuationBackupTransaction_0003').assertEqual(9);
      loggedExpect(result.changed, 'SceneBackupTransactionCases.test.ets:A0017', BUNDLE + '_ContinuationBackupTransaction_0003').assertTrue();
      loggedExpect(reopened.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0018', BUNDLE + '_ContinuationBackupTransaction_0003').assertEqual(9);
      loggedExpect(reopened.historyDocuments('note')[0].revision, 'SceneBackupTransactionCases.test.ets:A0019', BUNDLE + '_ContinuationBackupTransaction_0003').assertEqual(8);
      loggedExpect(reopened.historyDocuments('note')[0].state.note.body, 'SceneBackupTransactionCases.test.ets:A0020', BUNDLE + '_ContinuationBackupTransaction_0003').assertEqual('备份更新正文');
      loggedExpect(work.historyDocuments('note').some((row): boolean => row.revision === 2), 'SceneBackupTransactionCases.test.ets:A0021', BUNDLE + '_ContinuationBackupTransaction_0003').assertFalse();
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0400
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0004
     * @tc.desc 不同身份恢复保留备份自己的修订，不携入无关本机的上限号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0004', 0, (): void => {
      const store = new BackupStore(backupRaw('本机上限', REVISION_LIMIT));
      const work = new SceneWorkbench(store);
      const root = backupRoot('独立备份', 1);
      const note = findScene(root, 'note');
      if (note === undefined) {
        throw new Error('fixture note missing');
      }
      note.documentId = 'independent-note';
      const preview = work.previewBackup(encodeWorkspace(root));
      const result = work.restoreBackup(preview.token, false);
      loggedExpect(preview.ok, 'SceneBackupTransactionCases.test.ets:A0022', BUNDLE + '_ContinuationBackupTransaction_0004').assertTrue();
      loggedExpect(result.ok, 'SceneBackupTransactionCases.test.ets:A0023', BUNDLE + '_ContinuationBackupTransaction_0004').assertTrue();
      loggedExpect(work.document('note').documentId, 'SceneBackupTransactionCases.test.ets:A0024', BUNDLE + '_ContinuationBackupTransaction_0004').assertEqual('independent-note');
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0025', BUNDLE + '_ContinuationBackupTransaction_0004').assertEqual(1);
      loggedExpect(work.historyDocuments('note').length, 'SceneBackupTransactionCases.test.ets:A0026', BUNDLE + '_ContinuationBackupTransaction_0004').assertEqual(0);
      work.editNote('继续编辑', '新的本地编辑', 0, 2);
      loggedExpect(work.saveNote(), 'SceneBackupTransactionCases.test.ets:A0027', BUNDLE + '_ContinuationBackupTransaction_0004').assertTrue();
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0028', BUNDLE + '_ContinuationBackupTransaction_0004').assertEqual(2);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0500
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0005
     * @tc.desc 仅替换同一头部的历史时不虚增业务修订，历史来源仍严格采用备份
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0005', 0, (): void => {
      const local = backupRoot('相同头部', 3); local.history.push(waveNote('backup-note', 1, '本机旧历史'));
      const incoming = backupRoot('相同头部', 3); incoming.history.push(waveNote('backup-note', 2, '备份旧历史'));
      const store = new BackupStore(encodeWorkspace(local));
      const work = new SceneWorkbench(store);
      const preview = work.previewBackup(encodeWorkspace(incoming));
      loggedExpect(preview.changed, 'SceneBackupTransactionCases.test.ets:A0029', BUNDLE + '_ContinuationBackupTransaction_0005').assertTrue();
      loggedExpect(work.restoreBackup(preview.token, false).ok, 'SceneBackupTransactionCases.test.ets:A0030', BUNDLE + '_ContinuationBackupTransaction_0005').assertTrue();
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0031', BUNDLE + '_ContinuationBackupTransaction_0005').assertEqual(3);
      loggedExpect(work.historyDocuments('note')[0].revision, 'SceneBackupTransactionCases.test.ets:A0032', BUNDLE + '_ContinuationBackupTransaction_0005').assertEqual(2);
      loggedExpect(work.historyDocuments('note')[0].state.note.body, 'SceneBackupTransactionCases.test.ets:A0033', BUNDLE + '_ContinuationBackupTransaction_0005').assertEqual('备份旧历史');
      loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0034', BUNDLE + '_ContinuationBackupTransaction_0005').assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0600
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0006
     * @tc.desc 同一业务root即使传输标签和头部排列不同也无需写入，令牌仍只能消费一次
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0006', 0, (): void => {
      const store = new BackupStore(backupRaw()); const work = new SceneWorkbench(store);
      const same = readSceneBackup(work.backupSnapshot().raw).workspace as SceneWorkspace;
      same.documents.reverse();
      same.documents.forEach((document): void => {
        document.transferId = 'other-delivery-tag';
      });
      const preview = work.previewBackup(encodeWorkspace(same));
      const result = work.restoreBackup(preview.token, false);
      const repeated = work.restoreBackup(preview.token, false);
      loggedExpect(preview.changed, 'SceneBackupTransactionCases.test.ets:A0035', BUNDLE + '_ContinuationBackupTransaction_0006').assertFalse();
      loggedExpect(result.code, 'SceneBackupTransactionCases.test.ets:A0036', BUNDLE + '_ContinuationBackupTransaction_0006').assertEqual(SceneBackupCode.UNCHANGED);
      loggedExpect(repeated.code, 'SceneBackupTransactionCases.test.ets:A0037', BUNDLE + '_ContinuationBackupTransaction_0006').assertEqual(SceneBackupCode.STALE);
      loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0038', BUNDLE + '_ContinuationBackupTransaction_0006').assertEqual(0);
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0039', BUNDLE + '_ContinuationBackupTransaction_0006').assertEqual(3);
      loggedExpect(work.historyDocuments().length, 'SceneBackupTransactionCases.test.ets:A0040', BUNDLE + '_ContinuationBackupTransaction_0006').assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0700
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0007
     * @tc.desc 合法旧备份缺少阅读表单时明确清空这些场景而不是悄悄保留本机数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0007', 0, (): void => {
      const store = new BackupStore(backupRaw());
      const work = new SceneWorkbench(store);
      const oldReading = work.document('reading').documentId;
      const incoming = stageScene(emptyWorkspace(), waveNote('only-note', 2, '只保留备份笔记'), 'note');
      const preview = work.previewBackup(encodeWorkspace(incoming));
      const result = work.restoreBackup(preview.token, false);
      const reopened = reopenedBackup(store);
      loggedExpect(preview.willClearKinds.join(','), 'SceneBackupTransactionCases.test.ets:A0041', BUNDLE + '_ContinuationBackupTransaction_0007').assertEqual('reading,form'); loggedExpect(result.ok, 'SceneBackupTransactionCases.test.ets:A0042', BUNDLE + '_ContinuationBackupTransaction_0007').assertTrue();
      loggedExpect(reopened.document('reading').state.reading.chapter, 'SceneBackupTransactionCases.test.ets:A0043', BUNDLE + '_ContinuationBackupTransaction_0007').assertEqual(0);
      loggedExpect(reopened.document('reading').documentId !== oldReading, 'SceneBackupTransactionCases.test.ets:A0044', BUNDLE + '_ContinuationBackupTransaction_0007').assertTrue();
      loggedExpect(reopened.document('form').state.form.name, 'SceneBackupTransactionCases.test.ets:A0045', BUNDLE + '_ContinuationBackupTransaction_0007').assertEqual('');
      loggedExpect(reopened.document('note').state.note.body, 'SceneBackupTransactionCases.test.ets:A0046', BUNDLE + '_ContinuationBackupTransaction_0007').assertEqual('只保留备份笔记');
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0800
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0008
     * @tc.desc 未确认dirty替换时保留当前编辑，明确确认后同一有效计划才可提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0008', 0, (): void => {
      const store = new BackupStore(backupRaw('本机已保存'));
      const work = new SceneWorkbench(store);
      work.editNote('当前草稿', '不能静默覆盖', 0, 3);
      const preview = work.previewBackup(backupRaw('明确恢复内容')); const refused = work.restoreBackup(preview.token, false);
      loggedExpect(refused.code, 'SceneBackupTransactionCases.test.ets:A0047', BUNDLE + '_ContinuationBackupTransaction_0008').assertEqual(SceneBackupCode.DIRTY_REQUIRED);
      loggedExpect(work.snapshot().noteBody, 'SceneBackupTransactionCases.test.ets:A0048', BUNDLE + '_ContinuationBackupTransaction_0008').assertEqual('不能静默覆盖');
      loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0049', BUNDLE + '_ContinuationBackupTransaction_0008').assertEqual(0);
      loggedExpect(work.restoreBackup(preview.token, true).ok, 'SceneBackupTransactionCases.test.ets:A0050', BUNDLE + '_ContinuationBackupTransaction_0008').assertTrue();
      loggedExpect(work.snapshot().noteBody, 'SceneBackupTransactionCases.test.ets:A0051', BUNDLE + '_ContinuationBackupTransaction_0008').assertEqual('明确恢复内容');
      loggedExpect(work.snapshot().noteDirty, 'SceneBackupTransactionCases.test.ets:A0052', BUNDLE + '_ContinuationBackupTransaction_0008').assertFalse();
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0900
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0009
     * @tc.desc 恢复备份中的未保存笔记优先使笔记可进入，保存基线仍能用于放弃
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0009', 0, (): void => {
      const store = new BackupStore(); const work = new SceneWorkbench(store); const incoming = backupRoot('备份保存基线');
      const note = findScene(incoming, 'note');
      if (note === undefined) {
        throw new Error('fixture note missing');
      }
      note.state.note.body = '备份未保存正文'; note.state.note.selectionEnd = 3; incoming.active = 'form';
      const preview = work.previewBackup(encodeWorkspace(incoming)); work.restoreBackup(preview.token, true);
      loggedExpect(preview.active, 'SceneBackupTransactionCases.test.ets:A0053', BUNDLE + '_ContinuationBackupTransaction_0009').assertEqual('note');
      loggedExpect(work.open('note'), 'SceneBackupTransactionCases.test.ets:A0054', BUNDLE + '_ContinuationBackupTransaction_0009').assertTrue();
      loggedExpect(work.snapshot().noteDirty, 'SceneBackupTransactionCases.test.ets:A0055', BUNDLE + '_ContinuationBackupTransaction_0009').assertTrue();
      loggedExpect(work.open('reading'), 'SceneBackupTransactionCases.test.ets:A0056', BUNDLE + '_ContinuationBackupTransaction_0009').assertFalse();
      work.discardNote();
      loggedExpect(work.snapshot().noteBody, 'SceneBackupTransactionCases.test.ets:A0057', BUNDLE + '_ContinuationBackupTransaction_0009').assertEqual('备份保存基线');
      loggedExpect(work.open('reading'), 'SceneBackupTransactionCases.test.ets:A0058', BUNDLE + '_ContinuationBackupTransaction_0009').assertTrue();
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1000
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0010
     * @tc.desc put在修改缓存后抛错时使用durable原串补偿，不提交计划中的编辑和历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0010', 0, (): void => {
      const original = backupRaw('原磁盘正文', 5);
      const store = new BackupStore(original);
      const work = new SceneWorkbench(store);
      work.editNote('本机草稿', '保留未保存编辑', 0, 2);
      const preview = work.previewBackup(backupRaw('新备份正文', 2));
      store.failPutCalls = [1];
      const result = work.restoreBackup(preview.token, true);
      loggedExpect(result.code, 'SceneBackupTransactionCases.test.ets:A0059', BUNDLE + '_ContinuationBackupTransaction_0010').assertEqual(SceneBackupCode.WRITE_FAILED);
      loggedExpect(store.stored(), 'SceneBackupTransactionCases.test.ets:A0060', BUNDLE + '_ContinuationBackupTransaction_0010').assertEqual(original);
      loggedExpect(store.getSync(SCENE_STORE_KEY, ''), 'SceneBackupTransactionCases.test.ets:A0061', BUNDLE + '_ContinuationBackupTransaction_0010').assertEqual(original);
      loggedExpect(work.snapshot().noteBody, 'SceneBackupTransactionCases.test.ets:A0062', BUNDLE + '_ContinuationBackupTransaction_0010').assertEqual('保留未保存编辑');
      loggedExpect(work.snapshot().revision, 'SceneBackupTransactionCases.test.ets:A0063', BUNDLE + '_ContinuationBackupTransaction_0010').assertEqual(5);
      loggedExpect(work.historyDocuments().length, 'SceneBackupTransactionCases.test.ets:A0064', BUNDLE + '_ContinuationBackupTransaction_0010').assertEqual(0);
      loggedExpect(work.snapshot().storageFrozen, 'SceneBackupTransactionCases.test.ets:A0065', BUNDLE + '_ContinuationBackupTransaction_0010').assertFalse(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1100
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0011
     * @tc.desc flush失败补偿成功后重新预览仍只生成一次新修订，不消耗失败计划的号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0011', 0, (): void => {
      const original = backupRaw('旧正文', 3);
      const store = new BackupStore(original);
      const work = new SceneWorkbench(store);
      const first = work.previewBackup(backupRaw('新正文', 2));
      store.failFlushCalls = [1]; const failed = work.restoreBackup(first.token, false);
      loggedExpect(failed.ok, 'SceneBackupTransactionCases.test.ets:A0066', BUNDLE + '_ContinuationBackupTransaction_0011').assertFalse();
      loggedExpect(store.stored(), 'SceneBackupTransactionCases.test.ets:A0067', BUNDLE + '_ContinuationBackupTransaction_0011').assertEqual(original);
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0068', BUNDLE + '_ContinuationBackupTransaction_0011').assertEqual(3);
      loggedExpect(work.restoreBackup(first.token, false).code, 'SceneBackupTransactionCases.test.ets:A0069', BUNDLE + '_ContinuationBackupTransaction_0011').assertEqual(SceneBackupCode.STALE);
      const retry = work.previewBackup(backupRaw('新正文', 2));
      loggedExpect(work.restoreBackup(retry.token, false).ok, 'SceneBackupTransactionCases.test.ets:A0070', BUNDLE + '_ContinuationBackupTransaction_0011').assertTrue();
      loggedExpect(work.document('note').revision, 'SceneBackupTransactionCases.test.ets:A0071', BUNDLE + '_ContinuationBackupTransaction_0011').assertEqual(4);
      loggedExpect(work.historyDocuments('note')[0].revision, 'SceneBackupTransactionCases.test.ets:A0072', BUNDLE + '_ContinuationBackupTransaction_0011').assertEqual(2);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1200
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0012
     * @tc.desc 首次恢复无旧key时失败须删除缓存并补偿flush，不制造伪空成功档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0012', 0, (): void => {
      const store = new BackupStore();
      const work = new SceneWorkbench(store);
      const originalId = work.document('note').documentId;
      const preview = work.previewBackup(backupRaw());
      store.failFlushCalls = [1];
      const result = work.restoreBackup(preview.token, true);
      loggedExpect(result.ok, 'SceneBackupTransactionCases.test.ets:A0073', BUNDLE + '_ContinuationBackupTransaction_0012').assertFalse(); loggedExpect(store.deleteCalls, 'SceneBackupTransactionCases.test.ets:A0074', BUNDLE + '_ContinuationBackupTransaction_0012').assertEqual(1); loggedExpect(store.stored(), 'SceneBackupTransactionCases.test.ets:A0075', BUNDLE + '_ContinuationBackupTransaction_0012').assertEqual('');
      loggedExpect(work.document('note').documentId, 'SceneBackupTransactionCases.test.ets:A0076', BUNDLE + '_ContinuationBackupTransaction_0012').assertEqual(originalId);
      loggedExpect(work.document('form').state.form.name, 'SceneBackupTransactionCases.test.ets:A0077', BUNDLE + '_ContinuationBackupTransaction_0012').assertEqual('');
      loggedExpect(work.snapshot().storageFrozen, 'SceneBackupTransactionCases.test.ets:A0078', BUNDLE + '_ContinuationBackupTransaction_0012').assertFalse(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1300
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0013
     * @tc.desc 保存和补偿同时失败冻结scene后停止写入，但保留原内存供救援导出
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0013', 0, (): void => {
      const store = new BackupStore(backupRaw('原保存内容'));
      const work = new SceneWorkbench(store);
      work.editNote('草稿', '内存救援内容', 0, 2);
      const preview = work.previewBackup(backupRaw('要导入内容'));
      store.failPutCalls = [1, 2];
      const failed = work.restoreBackup(preview.token, true);
      const writes = store.putCalls;
      loggedExpect(failed.code, 'SceneBackupTransactionCases.test.ets:A0079', BUNDLE + '_ContinuationBackupTransaction_0013').assertEqual(SceneBackupCode.FROZEN);
      loggedExpect(work.saveNote(), 'SceneBackupTransactionCases.test.ets:A0080', BUNDLE + '_ContinuationBackupTransaction_0013').assertFalse();
      loggedExpect(work.resetWorkspace(), 'SceneBackupTransactionCases.test.ets:A0081', BUNDLE + '_ContinuationBackupTransaction_0013').assertFalse();
      loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0082', BUNDLE + '_ContinuationBackupTransaction_0013').assertEqual(writes);
      const exported = work.backupSnapshot();
      loggedExpect(exported.ok, 'SceneBackupTransactionCases.test.ets:A0083', BUNDLE + '_ContinuationBackupTransaction_0013').assertTrue();
      loggedExpect(exported.frozen, 'SceneBackupTransactionCases.test.ets:A0084', BUNDLE + '_ContinuationBackupTransaction_0013').assertTrue();
      loggedExpect(work.snapshot().noteBody, 'SceneBackupTransactionCases.test.ets:A0085', BUNDLE + '_ContinuationBackupTransaction_0013').assertEqual('内存救援内容');
      loggedExpect(work.previewBackup(backupRaw()).code, 'SceneBackupTransactionCases.test.ets:A0086', BUNDLE + '_ContinuationBackupTransaction_0013').assertEqual(SceneBackupCode.FROZEN); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1400
     * @tc.name com.samples.appcontinuation_ContinuationBackupTransaction_0014
     * @tc.desc 任一同身份修订到上限都阻止整个root恢复，不先提交其它阅读或表单
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupTransaction_0014', 0, (): void => {
      const store = new BackupStore(backupRaw('上限本机', REVISION_LIMIT));
      const work = new SceneWorkbench(store);
      const root = backupRoot('旧备份', 1);
      const reading = findScene(root, 'reading');
      if (reading === undefined) {
        throw new Error('fixture reading missing');
      }
      reading.state.reading.chapter = 2;
      const preview = work.previewBackup(encodeWorkspace(root));
      loggedExpect(preview.code, 'SceneBackupTransactionCases.test.ets:A0087', BUNDLE + '_ContinuationBackupTransaction_0014').assertEqual(SceneBackupCode.REVISION_LIMIT);
      loggedExpect(preview.token, 'SceneBackupTransactionCases.test.ets:A0088', BUNDLE + '_ContinuationBackupTransaction_0014').assertEqual('');
      loggedExpect(preview.issues[0].path, 'SceneBackupTransactionCases.test.ets:A0089', BUNDLE + '_ContinuationBackupTransaction_0014').assertEqual('documents.note.revision');
      loggedExpect(work.document('note').state.note.body, 'SceneBackupTransactionCases.test.ets:A0090', BUNDLE + '_ContinuationBackupTransaction_0014').assertEqual('上限本机');
      loggedExpect(work.document('reading').state.reading.chapter, 'SceneBackupTransactionCases.test.ets:A0091', BUNDLE + '_ContinuationBackupTransaction_0014').assertEqual(1);
      loggedExpect(store.putCalls, 'SceneBackupTransactionCases.test.ets:A0092', BUNDLE + '_ContinuationBackupTransaction_0014').assertEqual(0);
      work.dispose();
    });
  });
}
