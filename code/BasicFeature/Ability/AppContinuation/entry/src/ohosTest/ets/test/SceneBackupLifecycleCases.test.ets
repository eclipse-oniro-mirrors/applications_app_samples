// 待集中验证：本批仅静态编写，未执行host、语法检查、构建或设备测试。
import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name testContinuationBackupLifecycle0001
     * @tc.desc 第二次有效预览替代旧候选，旧确认不能覆盖后来选择的新备份
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0001', 0, (): void => {
      const store = new BackupStore();
      const work = new SceneWorkbench(store);
      const first = work.previewBackup(backupRaw('第一份'));
      const second = work.previewBackup(backupRaw('第二份')); const stale = work.restoreBackup(first.token, true);
      expect(stale.code).assertEqual(SceneBackupCode.STALE); expect(store.putCalls).assertEqual(0);
      expect(work.restoreBackup(second.token, true).ok).assertTrue();
      expect(work.document('note').state.note.body).assertEqual('第二份');
      expect(work.document('form').state.form.name).assertEqual('备份用户'); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0200
     * @tc.name testContinuationBackupLifecycle0002
     * @tc.desc 页面返回预览被外部修改时不能篡改内部将恢复的root或修订计划
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0002', 0, (): void => {
      const store = new BackupStore(backupRaw('本机', 3));
      const work = new SceneWorkbench(store);
      const view = work.previewBackup(backupRaw('正式候选', 2));
      const token = view.token;
      view.token = 'tampered-token'; view.scenes[0].restoreRevision = 999; view.willClearKinds.push('note');
      expect(work.restoreBackup(view.token, true).code).assertEqual(SceneBackupCode.STALE);
      expect(store.putCalls).assertEqual(0);
      expect(work.restoreBackup(token, true).ok).assertTrue(); expect(work.document('note').revision).assertEqual(4);
      expect(work.document('note').state.note.body).assertEqual('正式候选');
      expect(work.document('form').state.form.name).assertEqual('备份用户');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0300
     * @tc.name testContinuationBackupLifecycle0003
     * @tc.desc 预览后业务编辑使确认和旧导出一起过期，不能丢掉刚输入的新草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0003', 0, (): void => {
      const store = new BackupStore(backupRaw('已保存'));
      const work = new SceneWorkbench(store);
      const exported = work.backupSnapshot();
      const preview = work.previewBackup(backupRaw('旧候选'));
      work.editNote('最新草稿', '刚输入不能丢', 0, 3); const result = work.restoreBackup(preview.token, true);
      expect(result.code).assertEqual(SceneBackupCode.STALE);
      expect(work.isBackupCurrent(exported.epoch)).assertFalse();
      expect(work.snapshot().noteBody).assertEqual('刚输入不能丢');
      expect(work.snapshot().noteSavedBody).assertEqual('已保存'); expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0400
     * @tc.name testContinuationBackupLifecycle0004
     * @tc.desc 系统接续开始会关闭本地恢复门控，不吞掉系统轮次且结束后仍需重新预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0004', 0, (): void => {
      const f = new BackupFixture();
      try {
        const preview = f.controller.previewSceneBackup(backupRaw()); f.controller.handleLaunch({} as Want, 10);
        expect(f.controller.restoreSceneBackup(preview.token, true).code).assertEqual(SceneBackupCode.BLOCKED);
        expect(f.controller.previewSceneBackup(backupRaw()).code).assertEqual(SceneBackupCode.BLOCKED);
        expect(f.controller.snapshot().sessionActive).assertTrue(); expect(f.native.onCallbacks.length).assertEqual(1);
        f.controller.stopLocalWait();
        expect(f.controller.restoreSceneBackup(preview.token, true).code).assertEqual(SceneBackupCode.STALE);
        expect(f.store.putCalls).assertEqual(0);
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0500
     * @tc.name testContinuationBackupLifecycle0005
     * @tc.desc 明确取消预览只撤销能力令牌，不改变未保存笔记或磁盘版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0005', 0, (): void => {
      const raw = backupRaw('保存基线');
      const store = new BackupStore(raw);
      const work = new SceneWorkbench(store);
      work.editNote('草稿', '取消后还在', 0, 2);
      const preview = work.previewBackup(backupRaw('不要恢复'));
      work.cancelBackupPreview();
      const result = work.restoreBackup(preview.token, true);
      expect(result.code).assertEqual(SceneBackupCode.STALE);
      expect(work.snapshot().noteBody).assertEqual('取消后还在');
      expect(work.snapshot().noteDirty).assertTrue();
      expect(store.stored()).assertEqual(raw); expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0600
     * @tc.name testContinuationBackupLifecycle0006
     * @tc.desc 不同Ability工作区的预览令牌不能跨实例使用，即使业务内容和epoch相同
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0006', 0, (): void => {
      const aStore = new BackupStore();
      const bStore = new BackupStore();
      const a = new SceneWorkbench(aStore);
      const b = new SceneWorkbench(bStore);
      const first = a.previewBackup(backupRaw('A候选')); const second = b.previewBackup(backupRaw('B候选'));
      expect(b.restoreBackup(first.token, true).code).assertEqual(SceneBackupCode.STALE);
      expect(bStore.putCalls).assertEqual(0);
      expect(b.restoreBackup(second.token, true).ok).assertTrue();
      expect(b.document('note').state.note.body).assertEqual('B候选');
      expect(a.document('note').state.note.body).assertEqual('');
      expect(aStore.putCalls).assertEqual(0);
      a.dispose();
      b.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0700
     * @tc.name testContinuationBackupLifecycle0007
     * @tc.desc 控制器销毁后迟到确认不能写入或再次通知旧页面，导出也不返回敏感副本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0007', 0, (): void => {
      const f = new BackupFixture(backupRaw('本机私密内容')); let calls: number = 0;
      f.controller.subscribe((): void => {
        calls++;
      });
      const preview = f.controller.previewSceneBackup(backupRaw('候选'));
      const before = calls;
      f.release();
      const result = f.controller.restoreSceneBackup(preview.token, true);
      const exported = f.controller.sceneBackupSnapshot();
      expect(result.code).assertEqual(SceneBackupCode.BLOCKED);
      expect(exported.ok).assertFalse();
      expect(exported.raw).assertEqual('');
      expect(calls).assertEqual(before);
      expect(f.store.putCalls).assertEqual(0);
      expect(f.controller.sceneWorkbench.document('note').state.note.body).assertEqual('本机私密内容');
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0800
     * @tc.name testContinuationBackupLifecycle0008
     * @tc.desc 文本学习区有未保存编辑时恢复scene不清dirty或覆盖其持久身份，也不伪造系统提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0008', 0, (): void => {
      const f = new BackupFixture();
      try {
        f.controller.updateText('文本已保存');
        f.controller.saveText();
        const disk = f.store.stored(STORE_KEY);
        const id = f.controller.snapshot().documentId;
        f.controller.updateText('文本未保存编辑');
        const preview = f.controller.previewSceneBackup(backupRaw());
        const result = f.controller.restoreSceneBackup(preview.token, true);
        expect(result.ok).assertTrue();
        expect(f.controller.snapshot().text).assertEqual('文本未保存编辑');
        expect(f.controller.snapshot().documentId).assertEqual(id);
        expect(f.store.stored(STORE_KEY)).assertEqual(disk);
        expect(f.controller.snapshot().committed).assertFalse();
        expect(f.controller.snapshot().sessionActive).assertFalse();
        expect(f.native.onCallbacks.length).assertEqual(0);
        expect(f.controller.sceneWorkbench.document('form').state.form.address).assertEqual('备份地址');
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_0900
     * @tc.name testContinuationBackupLifecycle0009
     * @tc.desc 活动业务恢复更新业务身份但返回原文本时仍使用原文本自己的身份和修订
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0009', 0, (): void => {
      const f = new BackupFixture();
      try {
        f.controller.updateText('原文本身份正文');
        f.controller.saveText();
        const textId = f.controller.snapshot().documentId;
        f.controller.openScene('note');
        const preview = f.controller.previewSceneBackup(backupRaw());
        f.controller.restoreSceneBackup(preview.token, true);
        expect(f.controller.snapshot().documentId).assertEqual('backup-note');
        expect(f.controller.snapshot().revision).assertEqual(3);
        f.controller.activateText(); const parameters: Record<string, Object> = {};
        expect(f.controller.buildContinuation(parameters)).assertEqual(AbilityConstant.OnContinueResult.AGREE);
        const payload = JSON.parse(parameters[TEXT_PAYLOAD_KEY] as string) as Record<string, Object>;
        expect(payload['documentId']).assertEqual(textId);
        expect(payload['revision']).assertEqual(1);
        expect(payload['text']).assertEqual('原文本身份正文');
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_1000
     * @tc.name testContinuationBackupLifecycle0010
     * @tc.desc scene冻结不扩散到原文本存储，救援导出保留内存而本地恢复继续拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0010', 0, (): void => {
      const f = new BackupFixture('{坏scene原档');
      try {
        f.controller.sceneWorkbench.editNote('救援题', '内存救援正文', 0, 3);
        const exported = f.controller.sceneBackupSnapshot();
        expect(exported.ok).assertTrue();
        expect(exported.frozen).assertTrue();
        expect(f.controller.previewSceneBackup(backupRaw()).code).assertEqual(SceneBackupCode.FROZEN);
        f.controller.updateText('文本仍可独立保存');
        f.controller.saveText();
        const text = JSON.parse(f.store.stored(STORE_KEY) as string) as Record<string, Object>;
        expect(text['text']).assertEqual('文本仍可独立保存'); expect(f.store.stored()).assertEqual('{坏scene原档');
        expect(f.controller.sceneWorkbench.snapshot().storageFrozen).assertTrue();
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPLIFECYCLE_1100
     * @tc.name testContinuationBackupLifecycle0011
     * @tc.desc 最终状态通知内重入同一确认只得到过期结果，不能重复写入或追加历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupLifecycle0011', 0, (): void => {
      const store = new BackupStore(backupRaw('本机', 3));
      const work = new SceneWorkbench(store);
      const preview = work.previewBackup(backupRaw('恢复', 2));
      const nested: SceneBackupCode[] = [];
      const stop = work.subscribe((): void => {
        nested.push(work.restoreBackup(preview.token, true).code);
      });
      const result = work.restoreBackup(preview.token, true); stop();
      expect(result.ok).assertTrue();
      expect(nested[0]).assertEqual(SceneBackupCode.STALE);
      expect(store.putCalls).assertEqual(1);
      expect(work.document('note').revision).assertEqual(4);
      expect(work.historyDocuments('note').length).assertEqual(1);
      expect(work.snapshot().noteBody).assertEqual('恢复');
      work.dispose();
    });
  });
}
