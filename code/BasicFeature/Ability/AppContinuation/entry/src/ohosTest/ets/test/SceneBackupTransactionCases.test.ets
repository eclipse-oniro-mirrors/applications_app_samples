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

// 待集中验证：本批仅静态编写，未执行host、语法检查、构建或设备测试。
import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name testContinuationBackupTransaction0001
     * @tc.desc 整root恢复只有一次put和flush，flush返回前仍能观察旧业务而非部分恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0001', 0, (): void => {
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
      expect(result.code).assertEqual(SceneBackupCode.RESTORED);
      expect(observed[0]).assertEqual('');
      expect(chapters[0]).assertEqual(0);
      expect(reopened.document('note').state.note.body).assertEqual('备份笔记正文');
      expect(reopened.document('reading').state.reading.anchor).assertEqual(2);
      expect(reopened.document('form').state.form.name).assertEqual('备份用户');
      expect(store.putCalls).assertEqual(1);
      expect(store.flushCalls).assertEqual(1);
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0200
     * @tc.name testContinuationBackupTransaction0002
     * @tc.desc 同身份恢复旧备份按本机较高修订加一，并整份替换而不混合两套历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0002', 0, (): void => {
      const local = backupRoot('本机新正文', 5); local.history.push(waveNote('backup-note', 4, '本机历史'));
      const incoming = backupRoot('备份旧正文', 2); incoming.history.push(waveNote('backup-note', 1, '备份更早正文'));
      const store = new BackupStore(encodeWorkspace(local));
      const work = new SceneWorkbench(store);
      const preview = work.previewBackup(encodeWorkspace(incoming));
      const result = work.restoreBackup(preview.token, false); const history = work.historyDocuments('note');
      expect(result.ok).assertTrue();
      expect(work.document('note').revision).assertEqual(6);
      expect(work.document('note').state.note.body).assertEqual('备份旧正文');
      expect(history.map((row): number => row.revision).join(',')).assertEqual('1,2');
      expect(history[0].state.note.body).assertEqual('备份更早正文');
      expect(history[1].state.note.body).assertEqual('备份旧正文'); expect(store.putCalls).assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0300
     * @tc.name testContinuationBackupTransaction0003
     * @tc.desc 备份同身份修订比本机更高时也生成其下一版，不在导入后复用备份头号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0003', 0, (): void => {
      const store = new BackupStore(backupRaw('本机旧正文', 2)); const work = new SceneWorkbench(store);
      const preview = work.previewBackup(backupRaw('备份更新正文', 8));
      const result = work.restoreBackup(preview.token, false);
      const reopened = reopenedBackup(store);
      expect(preview.scenes[0].restoreRevision).assertEqual(9);
      expect(result.changed).assertTrue();
      expect(reopened.document('note').revision).assertEqual(9);
      expect(reopened.historyDocuments('note')[0].revision).assertEqual(8);
      expect(reopened.historyDocuments('note')[0].state.note.body).assertEqual('备份更新正文');
      expect(work.historyDocuments('note').some((row): boolean => row.revision === 2)).assertFalse();
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0400
     * @tc.name testContinuationBackupTransaction0004
     * @tc.desc 不同身份恢复保留备份自己的修订，不携入无关本机的上限号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0004', 0, (): void => {
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
      expect(preview.ok).assertTrue();
      expect(result.ok).assertTrue();
      expect(work.document('note').documentId).assertEqual('independent-note');
      expect(work.document('note').revision).assertEqual(1);
      expect(work.historyDocuments('note').length).assertEqual(0);
      work.editNote('继续编辑', '新的本地编辑', 0, 2);
      expect(work.saveNote()).assertTrue();
      expect(work.document('note').revision).assertEqual(2);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0500
     * @tc.name testContinuationBackupTransaction0005
     * @tc.desc 仅替换同一头部的历史时不虚增业务修订，历史来源仍严格采用备份
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0005', 0, (): void => {
      const local = backupRoot('相同头部', 3); local.history.push(waveNote('backup-note', 1, '本机旧历史'));
      const incoming = backupRoot('相同头部', 3); incoming.history.push(waveNote('backup-note', 2, '备份旧历史'));
      const store = new BackupStore(encodeWorkspace(local));
      const work = new SceneWorkbench(store);
      const preview = work.previewBackup(encodeWorkspace(incoming));
      expect(preview.changed).assertTrue();
      expect(work.restoreBackup(preview.token, false).ok).assertTrue();
      expect(work.document('note').revision).assertEqual(3);
      expect(work.historyDocuments('note')[0].revision).assertEqual(2);
      expect(work.historyDocuments('note')[0].state.note.body).assertEqual('备份旧历史');
      expect(store.putCalls).assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0600
     * @tc.name testContinuationBackupTransaction0006
     * @tc.desc 同一业务root即使传输标签和头部排列不同也无需写入，令牌仍只能消费一次
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0006', 0, (): void => {
      const store = new BackupStore(backupRaw()); const work = new SceneWorkbench(store);
      const same = readSceneBackup(work.backupSnapshot().raw).workspace as SceneWorkspace;
      same.documents.reverse();
      same.documents.forEach((document): void => {
        document.transferId = 'other-delivery-tag';
      });
      const preview = work.previewBackup(encodeWorkspace(same));
      const result = work.restoreBackup(preview.token, false);
      const repeated = work.restoreBackup(preview.token, false);
      expect(preview.changed).assertFalse();
      expect(result.code).assertEqual(SceneBackupCode.UNCHANGED);
      expect(repeated.code).assertEqual(SceneBackupCode.STALE);
      expect(store.putCalls).assertEqual(0);
      expect(work.document('note').revision).assertEqual(3);
      expect(work.historyDocuments().length).assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0700
     * @tc.name testContinuationBackupTransaction0007
     * @tc.desc 合法旧备份缺少阅读表单时明确清空这些场景而不是悄悄保留本机数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0007', 0, (): void => {
      const store = new BackupStore(backupRaw());
      const work = new SceneWorkbench(store);
      const oldReading = work.document('reading').documentId;
      const incoming = stageScene(emptyWorkspace(), waveNote('only-note', 2, '只保留备份笔记'), 'note');
      const preview = work.previewBackup(encodeWorkspace(incoming));
      const result = work.restoreBackup(preview.token, false);
      const reopened = reopenedBackup(store);
      expect(preview.willClearKinds.join(',')).assertEqual('reading,form'); expect(result.ok).assertTrue();
      expect(reopened.document('reading').state.reading.chapter).assertEqual(0);
      expect(reopened.document('reading').documentId !== oldReading).assertTrue();
      expect(reopened.document('form').state.form.name).assertEqual('');
      expect(reopened.document('note').state.note.body).assertEqual('只保留备份笔记');
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0800
     * @tc.name testContinuationBackupTransaction0008
     * @tc.desc 未确认dirty替换时保留当前编辑，明确确认后同一有效计划才可提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0008', 0, (): void => {
      const store = new BackupStore(backupRaw('本机已保存'));
      const work = new SceneWorkbench(store);
      work.editNote('当前草稿', '不能静默覆盖', 0, 3);
      const preview = work.previewBackup(backupRaw('明确恢复内容')); const refused = work.restoreBackup(preview.token, false);
      expect(refused.code).assertEqual(SceneBackupCode.DIRTY_REQUIRED);
      expect(work.snapshot().noteBody).assertEqual('不能静默覆盖');
      expect(store.putCalls).assertEqual(0);
      expect(work.restoreBackup(preview.token, true).ok).assertTrue();
      expect(work.snapshot().noteBody).assertEqual('明确恢复内容');
      expect(work.snapshot().noteDirty).assertFalse();
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_0900
     * @tc.name testContinuationBackupTransaction0009
     * @tc.desc 恢复备份中的未保存笔记优先使笔记可进入，保存基线仍能用于放弃
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0009', 0, (): void => {
      const store = new BackupStore(); const work = new SceneWorkbench(store); const incoming = backupRoot('备份保存基线');
      const note = findScene(incoming, 'note');
      if (note === undefined) {
        throw new Error('fixture note missing');
      }
      note.state.note.body = '备份未保存正文'; note.state.note.selectionEnd = 3; incoming.active = 'form';
      const preview = work.previewBackup(encodeWorkspace(incoming)); work.restoreBackup(preview.token, true);
      expect(preview.active).assertEqual('note');
      expect(work.open('note')).assertTrue();
      expect(work.snapshot().noteDirty).assertTrue();
      expect(work.open('reading')).assertFalse();
      work.discardNote();
      expect(work.snapshot().noteBody).assertEqual('备份保存基线');
      expect(work.open('reading')).assertTrue();
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1000
     * @tc.name testContinuationBackupTransaction0010
     * @tc.desc put在修改缓存后抛错时使用durable原串补偿，不提交计划中的编辑和历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0010', 0, (): void => {
      const original = backupRaw('原磁盘正文', 5);
      const store = new BackupStore(original);
      const work = new SceneWorkbench(store);
      work.editNote('本机草稿', '保留未保存编辑', 0, 2);
      const preview = work.previewBackup(backupRaw('新备份正文', 2));
      store.failPutCalls = [1];
      const result = work.restoreBackup(preview.token, true);
      expect(result.code).assertEqual(SceneBackupCode.WRITE_FAILED);
      expect(store.stored()).assertEqual(original);
      expect(store.getSync(SCENE_STORE_KEY, '')).assertEqual(original);
      expect(work.snapshot().noteBody).assertEqual('保留未保存编辑');
      expect(work.snapshot().revision).assertEqual(5);
      expect(work.historyDocuments().length).assertEqual(0);
      expect(work.snapshot().storageFrozen).assertFalse(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1100
     * @tc.name testContinuationBackupTransaction0011
     * @tc.desc flush失败补偿成功后重新预览仍只生成一次新修订，不消耗失败计划的号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0011', 0, (): void => {
      const original = backupRaw('旧正文', 3);
      const store = new BackupStore(original);
      const work = new SceneWorkbench(store);
      const first = work.previewBackup(backupRaw('新正文', 2));
      store.failFlushCalls = [1]; const failed = work.restoreBackup(first.token, false);
      expect(failed.ok).assertFalse();
      expect(store.stored()).assertEqual(original);
      expect(work.document('note').revision).assertEqual(3);
      expect(work.restoreBackup(first.token, false).code).assertEqual(SceneBackupCode.STALE);
      const retry = work.previewBackup(backupRaw('新正文', 2));
      expect(work.restoreBackup(retry.token, false).ok).assertTrue();
      expect(work.document('note').revision).assertEqual(4);
      expect(work.historyDocuments('note')[0].revision).assertEqual(2);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1200
     * @tc.name testContinuationBackupTransaction0012
     * @tc.desc 首次恢复无旧key时失败须删除缓存并补偿flush，不制造伪空成功档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0012', 0, (): void => {
      const store = new BackupStore();
      const work = new SceneWorkbench(store);
      const originalId = work.document('note').documentId;
      const preview = work.previewBackup(backupRaw());
      store.failFlushCalls = [1];
      const result = work.restoreBackup(preview.token, true);
      expect(result.ok).assertFalse(); expect(store.deleteCalls).assertEqual(1); expect(store.stored()).assertEqual('');
      expect(work.document('note').documentId).assertEqual(originalId);
      expect(work.document('form').state.form.name).assertEqual('');
      expect(work.snapshot().storageFrozen).assertFalse(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1300
     * @tc.name testContinuationBackupTransaction0013
     * @tc.desc 保存和补偿同时失败冻结scene后停止写入，但保留原内存供救援导出
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0013', 0, (): void => {
      const store = new BackupStore(backupRaw('原保存内容'));
      const work = new SceneWorkbench(store);
      work.editNote('草稿', '内存救援内容', 0, 2);
      const preview = work.previewBackup(backupRaw('要导入内容'));
      store.failPutCalls = [1, 2];
      const failed = work.restoreBackup(preview.token, true);
      const writes = store.putCalls;
      expect(failed.code).assertEqual(SceneBackupCode.FROZEN);
      expect(work.saveNote()).assertFalse();
      expect(work.resetWorkspace()).assertFalse();
      expect(store.putCalls).assertEqual(writes);
      const exported = work.backupSnapshot();
      expect(exported.ok).assertTrue();
      expect(exported.frozen).assertTrue();
      expect(work.snapshot().noteBody).assertEqual('内存救援内容');
      expect(work.previewBackup(backupRaw()).code).assertEqual(SceneBackupCode.FROZEN); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPTRANSACTION_1400
     * @tc.name testContinuationBackupTransaction0014
     * @tc.desc 任一同身份修订到上限都阻止整个root恢复，不先提交其它阅读或表单
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupTransaction0014', 0, (): void => {
      const store = new BackupStore(backupRaw('上限本机', REVISION_LIMIT));
      const work = new SceneWorkbench(store);
      const root = backupRoot('旧备份', 1);
      const reading = findScene(root, 'reading');
      if (reading === undefined) {
        throw new Error('fixture reading missing');
      }
      reading.state.reading.chapter = 2;
      const preview = work.previewBackup(encodeWorkspace(root));
      expect(preview.code).assertEqual(SceneBackupCode.REVISION_LIMIT);
      expect(preview.token).assertEqual('');
      expect(preview.issues[0].path).assertEqual('documents.note.revision');
      expect(work.document('note').state.note.body).assertEqual('上限本机');
      expect(work.document('reading').state.reading.chapter).assertEqual(1);
      expect(store.putCalls).assertEqual(0);
      work.dispose();
    });
  });
}
