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
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SceneBackupCode } from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';
import { BackupFixture, BackupStore, backupRaw } from '../support/SceneBackupFixtures';
import { STORE_KEY } from '../support/LearningFixtures';

export default function sceneBackupLifecycleCases(): void {
  describe('SceneBackupLifecycleCases', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0100
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0001
     * @tc.desc 第二次有效预览替代旧候选，旧确认不能覆盖后来选择的新备份
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0001', 0, (): void => {
      const store = new BackupStore();
      const work = new SceneWorkbench(store);
      const first = work.previewBackup(backupRaw('第一份'));
      const second = work.previewBackup(backupRaw('第二份')); const stale = work.restoreBackup(first.token, true);
      loggedExpect(stale.code, 'SceneBackupLifecycleCases.test.ets:A0001', BUNDLE + '_ContinuationBackupLifecycle_0001').assertEqual(SceneBackupCode.STALE); loggedExpect(store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0002', BUNDLE + '_ContinuationBackupLifecycle_0001').assertEqual(0);
      loggedExpect(work.restoreBackup(second.token, true).ok, 'SceneBackupLifecycleCases.test.ets:A0003', BUNDLE + '_ContinuationBackupLifecycle_0001').assertTrue();
      loggedExpect(work.document('note').state.note.body, 'SceneBackupLifecycleCases.test.ets:A0004', BUNDLE + '_ContinuationBackupLifecycle_0001').assertEqual('第二份');
      loggedExpect(work.document('form').state.form.name, 'SceneBackupLifecycleCases.test.ets:A0005', BUNDLE + '_ContinuationBackupLifecycle_0001').assertEqual('备份用户'); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0200
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0002
     * @tc.desc 页面返回预览被外部修改时不能篡改内部将恢复的root或修订计划
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0002', 0, (): void => {
      const store = new BackupStore(backupRaw('本机', 3));
      const work = new SceneWorkbench(store);
      const view = work.previewBackup(backupRaw('正式候选', 2));
      const token = view.token;
      view.token = 'tampered-token'; view.scenes[0].restoreRevision = 999; view.willClearKinds.push('note');
      loggedExpect(work.restoreBackup(view.token, true).code, 'SceneBackupLifecycleCases.test.ets:A0006', BUNDLE + '_ContinuationBackupLifecycle_0002').assertEqual(SceneBackupCode.STALE);
      loggedExpect(store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0007', BUNDLE + '_ContinuationBackupLifecycle_0002').assertEqual(0);
      loggedExpect(work.restoreBackup(token, true).ok, 'SceneBackupLifecycleCases.test.ets:A0008', BUNDLE + '_ContinuationBackupLifecycle_0002').assertTrue(); loggedExpect(work.document('note').revision, 'SceneBackupLifecycleCases.test.ets:A0009', BUNDLE + '_ContinuationBackupLifecycle_0002').assertEqual(4);
      loggedExpect(work.document('note').state.note.body, 'SceneBackupLifecycleCases.test.ets:A0010', BUNDLE + '_ContinuationBackupLifecycle_0002').assertEqual('正式候选');
      loggedExpect(work.document('form').state.form.name, 'SceneBackupLifecycleCases.test.ets:A0011', BUNDLE + '_ContinuationBackupLifecycle_0002').assertEqual('备份用户');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0300
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0003
     * @tc.desc 预览后业务编辑使确认和旧导出一起过期，不能丢掉刚输入的新草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0003', 0, (): void => {
      const store = new BackupStore(backupRaw('已保存'));
      const work = new SceneWorkbench(store);
      const exported = work.backupSnapshot();
      const preview = work.previewBackup(backupRaw('旧候选'));
      work.editNote('最新草稿', '刚输入不能丢', 0, 3); const result = work.restoreBackup(preview.token, true);
      loggedExpect(result.code, 'SceneBackupLifecycleCases.test.ets:A0012', BUNDLE + '_ContinuationBackupLifecycle_0003').assertEqual(SceneBackupCode.STALE);
      loggedExpect(work.isBackupCurrent(exported.epoch), 'SceneBackupLifecycleCases.test.ets:A0013', BUNDLE + '_ContinuationBackupLifecycle_0003').assertFalse();
      loggedExpect(work.snapshot().noteBody, 'SceneBackupLifecycleCases.test.ets:A0014', BUNDLE + '_ContinuationBackupLifecycle_0003').assertEqual('刚输入不能丢');
      loggedExpect(work.snapshot().noteSavedBody, 'SceneBackupLifecycleCases.test.ets:A0015', BUNDLE + '_ContinuationBackupLifecycle_0003').assertEqual('已保存'); loggedExpect(store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0016', BUNDLE + '_ContinuationBackupLifecycle_0003').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0400
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0004
     * @tc.desc 系统接续开始会关闭本地恢复门控，不吞掉系统轮次且结束后仍需重新预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0004', 0, (): void => {
      const f = new BackupFixture();
      try {
        const preview = f.controller.previewSceneBackup(backupRaw()); f.controller.handleLaunch({} as Want, 10);
        loggedExpect(f.controller.restoreSceneBackup(preview.token, true).code, 'SceneBackupLifecycleCases.test.ets:A0017', BUNDLE + '_ContinuationBackupLifecycle_0004').assertEqual(SceneBackupCode.BLOCKED);
        loggedExpect(f.controller.previewSceneBackup(backupRaw()).code, 'SceneBackupLifecycleCases.test.ets:A0018', BUNDLE + '_ContinuationBackupLifecycle_0004').assertEqual(SceneBackupCode.BLOCKED);
        loggedExpect(f.controller.snapshot().sessionActive, 'SceneBackupLifecycleCases.test.ets:A0019', BUNDLE + '_ContinuationBackupLifecycle_0004').assertTrue(); loggedExpect(f.native.onCallbacks.length, 'SceneBackupLifecycleCases.test.ets:A0020', BUNDLE + '_ContinuationBackupLifecycle_0004').assertEqual(1);
        f.controller.stopLocalWait();
        loggedExpect(f.controller.restoreSceneBackup(preview.token, true).code, 'SceneBackupLifecycleCases.test.ets:A0021', BUNDLE + '_ContinuationBackupLifecycle_0004').assertEqual(SceneBackupCode.STALE);
        loggedExpect(f.store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0022', BUNDLE + '_ContinuationBackupLifecycle_0004').assertEqual(0);
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0500
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0005
     * @tc.desc 明确取消预览只撤销能力令牌，不改变未保存笔记或磁盘版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0005', 0, (): void => {
      const raw = backupRaw('保存基线');
      const store = new BackupStore(raw);
      const work = new SceneWorkbench(store);
      work.editNote('草稿', '取消后还在', 0, 2);
      const preview = work.previewBackup(backupRaw('不要恢复'));
      work.cancelBackupPreview();
      const result = work.restoreBackup(preview.token, true);
      loggedExpect(result.code, 'SceneBackupLifecycleCases.test.ets:A0023', BUNDLE + '_ContinuationBackupLifecycle_0005').assertEqual(SceneBackupCode.STALE);
      loggedExpect(work.snapshot().noteBody, 'SceneBackupLifecycleCases.test.ets:A0024', BUNDLE + '_ContinuationBackupLifecycle_0005').assertEqual('取消后还在');
      loggedExpect(work.snapshot().noteDirty, 'SceneBackupLifecycleCases.test.ets:A0025', BUNDLE + '_ContinuationBackupLifecycle_0005').assertTrue();
      loggedExpect(store.stored(), 'SceneBackupLifecycleCases.test.ets:A0026', BUNDLE + '_ContinuationBackupLifecycle_0005').assertEqual(raw); loggedExpect(store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0027', BUNDLE + '_ContinuationBackupLifecycle_0005').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0600
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0006
     * @tc.desc 不同Ability工作区的预览令牌不能跨实例使用，即使业务内容和epoch相同
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0006', 0, (): void => {
      const aStore = new BackupStore();
      const bStore = new BackupStore();
      const a = new SceneWorkbench(aStore);
      const b = new SceneWorkbench(bStore);
      const first = a.previewBackup(backupRaw('A候选')); const second = b.previewBackup(backupRaw('B候选'));
      loggedExpect(b.restoreBackup(first.token, true).code, 'SceneBackupLifecycleCases.test.ets:A0028', BUNDLE + '_ContinuationBackupLifecycle_0006').assertEqual(SceneBackupCode.STALE);
      loggedExpect(bStore.putCalls, 'SceneBackupLifecycleCases.test.ets:A0029', BUNDLE + '_ContinuationBackupLifecycle_0006').assertEqual(0);
      loggedExpect(b.restoreBackup(second.token, true).ok, 'SceneBackupLifecycleCases.test.ets:A0030', BUNDLE + '_ContinuationBackupLifecycle_0006').assertTrue();
      loggedExpect(b.document('note').state.note.body, 'SceneBackupLifecycleCases.test.ets:A0031', BUNDLE + '_ContinuationBackupLifecycle_0006').assertEqual('B候选');
      loggedExpect(a.document('note').state.note.body, 'SceneBackupLifecycleCases.test.ets:A0032', BUNDLE + '_ContinuationBackupLifecycle_0006').assertEqual('');
      loggedExpect(aStore.putCalls, 'SceneBackupLifecycleCases.test.ets:A0033', BUNDLE + '_ContinuationBackupLifecycle_0006').assertEqual(0);
      a.dispose();
      b.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0700
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0007
     * @tc.desc 控制器销毁后迟到确认不能写入或再次通知旧页面，导出也不返回敏感副本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0007', 0, (): void => {
      const f = new BackupFixture(backupRaw('本机私密内容')); let calls: number = 0;
      f.controller.subscribe((): void => {
        calls++;
      });
      const preview = f.controller.previewSceneBackup(backupRaw('候选'));
      const before = calls;
      f.release();
      const result = f.controller.restoreSceneBackup(preview.token, true);
      const exported = f.controller.sceneBackupSnapshot();
      loggedExpect(result.code, 'SceneBackupLifecycleCases.test.ets:A0034', BUNDLE + '_ContinuationBackupLifecycle_0007').assertEqual(SceneBackupCode.BLOCKED);
      loggedExpect(exported.ok, 'SceneBackupLifecycleCases.test.ets:A0035', BUNDLE + '_ContinuationBackupLifecycle_0007').assertFalse();
      loggedExpect(exported.raw, 'SceneBackupLifecycleCases.test.ets:A0036', BUNDLE + '_ContinuationBackupLifecycle_0007').assertEqual('');
      loggedExpect(calls, 'SceneBackupLifecycleCases.test.ets:A0037', BUNDLE + '_ContinuationBackupLifecycle_0007').assertEqual(before);
      loggedExpect(f.store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0038', BUNDLE + '_ContinuationBackupLifecycle_0007').assertEqual(0);
      loggedExpect(f.controller.sceneWorkbench.document('note').state.note.body, 'SceneBackupLifecycleCases.test.ets:A0039', BUNDLE + '_ContinuationBackupLifecycle_0007').assertEqual('本机私密内容');
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0800
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0008
     * @tc.desc 文本学习区有未保存编辑时恢复scene不清dirty或覆盖其持久身份，也不伪造系统提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0008', 0, (): void => {
      const f = new BackupFixture();
      try {
        f.controller.updateText('文本已保存');
        f.controller.saveText();
        const disk = f.store.stored(STORE_KEY);
        const id = f.controller.snapshot().documentId;
        f.controller.updateText('文本未保存编辑');
        const preview = f.controller.previewSceneBackup(backupRaw());
        const result = f.controller.restoreSceneBackup(preview.token, true);
        loggedExpect(result.ok, 'SceneBackupLifecycleCases.test.ets:A0040', BUNDLE + '_ContinuationBackupLifecycle_0008').assertTrue();
        loggedExpect(f.controller.snapshot().text, 'SceneBackupLifecycleCases.test.ets:A0041', BUNDLE + '_ContinuationBackupLifecycle_0008').assertEqual('文本未保存编辑');
        loggedExpect(f.controller.snapshot().documentId, 'SceneBackupLifecycleCases.test.ets:A0042', BUNDLE + '_ContinuationBackupLifecycle_0008').assertEqual(id);
        loggedExpect(f.store.stored(STORE_KEY), 'SceneBackupLifecycleCases.test.ets:A0043', BUNDLE + '_ContinuationBackupLifecycle_0008').assertEqual(disk);
        loggedExpect(f.controller.snapshot().committed, 'SceneBackupLifecycleCases.test.ets:A0044', BUNDLE + '_ContinuationBackupLifecycle_0008').assertFalse();
        loggedExpect(f.controller.snapshot().sessionActive, 'SceneBackupLifecycleCases.test.ets:A0045', BUNDLE + '_ContinuationBackupLifecycle_0008').assertFalse();
        loggedExpect(f.native.onCallbacks.length, 'SceneBackupLifecycleCases.test.ets:A0046', BUNDLE + '_ContinuationBackupLifecycle_0008').assertEqual(0);
        loggedExpect(f.controller.sceneWorkbench.document('form').state.form.address, 'SceneBackupLifecycleCases.test.ets:A0047', BUNDLE + '_ContinuationBackupLifecycle_0008').assertEqual('备份地址');
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0900
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0009
     * @tc.desc 活动业务恢复更新业务身份但返回原文本时仍使用原文本自己的身份和修订
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0009', 0, (): void => {
      const f = new BackupFixture();
      try {
        f.controller.updateText('原文本身份正文');
        f.controller.saveText();
        const textId = f.controller.snapshot().documentId;
        f.controller.openScene('note');
        const preview = f.controller.previewSceneBackup(backupRaw());
        f.controller.restoreSceneBackup(preview.token, true);
        loggedExpect(f.controller.snapshot().documentId, 'SceneBackupLifecycleCases.test.ets:A0048', BUNDLE + '_ContinuationBackupLifecycle_0009').assertEqual('backup-note');
        loggedExpect(f.controller.snapshot().revision, 'SceneBackupLifecycleCases.test.ets:A0049', BUNDLE + '_ContinuationBackupLifecycle_0009').assertEqual(3);
        f.controller.activateText(); const parameters: Record<string, Object> = {};
        loggedExpect(f.controller.buildContinuation(parameters), 'SceneBackupLifecycleCases.test.ets:A0050', BUNDLE + '_ContinuationBackupLifecycle_0009').assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const payload = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        loggedExpect(payload['documentId'], 'SceneBackupLifecycleCases.test.ets:A0051', BUNDLE + '_ContinuationBackupLifecycle_0009').assertEqual(textId);
        loggedExpect(payload['revision'], 'SceneBackupLifecycleCases.test.ets:A0052', BUNDLE + '_ContinuationBackupLifecycle_0009').assertEqual(1);
        loggedExpect(payload['text'], 'SceneBackupLifecycleCases.test.ets:A0053', BUNDLE + '_ContinuationBackupLifecycle_0009').assertEqual('原文本身份正文');
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_1000
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0010
     * @tc.desc scene冻结不扩散到原文本存储，救援导出保留内存而本地恢复继续拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0010', 0, (): void => {
      const f = new BackupFixture('{坏scene原档');
      try {
        f.controller.sceneWorkbench.editNote('救援题', '内存救援正文', 0, 3);
        const exported = f.controller.sceneBackupSnapshot();
        loggedExpect(exported.ok, 'SceneBackupLifecycleCases.test.ets:A0054', BUNDLE + '_ContinuationBackupLifecycle_0010').assertTrue();
        loggedExpect(exported.frozen, 'SceneBackupLifecycleCases.test.ets:A0055', BUNDLE + '_ContinuationBackupLifecycle_0010').assertTrue();
        loggedExpect(f.controller.previewSceneBackup(backupRaw()).code, 'SceneBackupLifecycleCases.test.ets:A0056', BUNDLE + '_ContinuationBackupLifecycle_0010').assertEqual(SceneBackupCode.FROZEN);
        f.controller.updateText('文本仍可独立保存');
        f.controller.saveText();
        const text = JSON.parse(f.store.stored(STORE_KEY) as string) as Record<string, Object>;
        loggedExpect(text['text'], 'SceneBackupLifecycleCases.test.ets:A0057', BUNDLE + '_ContinuationBackupLifecycle_0010').assertEqual('文本仍可独立保存'); loggedExpect(f.store.stored(), 'SceneBackupLifecycleCases.test.ets:A0058', BUNDLE + '_ContinuationBackupLifecycle_0010').assertEqual('{坏scene原档');
        loggedExpect(f.controller.sceneWorkbench.snapshot().storageFrozen, 'SceneBackupLifecycleCases.test.ets:A0059', BUNDLE + '_ContinuationBackupLifecycle_0010').assertTrue();
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_1100
     * @tc.name com.samples.appcontinuation_ContinuationBackupLifecycle_0011
     * @tc.desc 最终状态通知内重入同一确认只得到过期结果，不能重复写入或追加历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupLifecycle_0011', 0, (): void => {
      const store = new BackupStore(backupRaw('本机', 3));
      const work = new SceneWorkbench(store);
      const preview = work.previewBackup(backupRaw('恢复', 2));
      const nested: SceneBackupCode[] = [];
      const stop = work.subscribe((): void => {
        nested.push(work.restoreBackup(preview.token, true).code);
      });
      const result = work.restoreBackup(preview.token, true); stop();
      loggedExpect(result.ok, 'SceneBackupLifecycleCases.test.ets:A0060', BUNDLE + '_ContinuationBackupLifecycle_0011').assertTrue();
      loggedExpect(nested[0], 'SceneBackupLifecycleCases.test.ets:A0061', BUNDLE + '_ContinuationBackupLifecycle_0011').assertEqual(SceneBackupCode.STALE);
      loggedExpect(store.putCalls, 'SceneBackupLifecycleCases.test.ets:A0062', BUNDLE + '_ContinuationBackupLifecycle_0011').assertEqual(1);
      loggedExpect(work.document('note').revision, 'SceneBackupLifecycleCases.test.ets:A0063', BUNDLE + '_ContinuationBackupLifecycle_0011').assertEqual(4);
      loggedExpect(work.historyDocuments('note').length, 'SceneBackupLifecycleCases.test.ets:A0064', BUNDLE + '_ContinuationBackupLifecycle_0011').assertEqual(1);
      loggedExpect(work.snapshot().noteBody, 'SceneBackupLifecycleCases.test.ets:A0065', BUNDLE + '_ContinuationBackupLifecycle_0011').assertEqual('恢复');
      work.dispose();
    });
  });
}
