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
import { SceneBackupClipboard, SceneBackupCopyCode } from '../../../main/ets/learning/scene/SceneBackupClipboard';
import { SceneWorkspace, findScene } from '../../../main/ets/learning/scene/SceneModel';
import { SceneBackupCode, readSceneBackup } from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { BackupClipboardPort, BackupFixture, backupRaw } from '../support/SceneBackupFixtures';

export default function sceneBackupClipboardCases(): void {
  describe('SceneBackupClipboardCases', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0100
     * @tc.name testContinuationBackupClipboard0001
     * @tc.desc 复制等待真实端口完成才返回成功，写入的是完整可解析root而非屏幕截断预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0001', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const raw = backupRaw('长正文'.repeat(300));
      const pending = copy.copy(raw); const written = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
      expect(findScene(written, 'note')?.state.note.body).assertEqual('长正文'.repeat(300));
      expect(port.replies.length).assertEqual(1);
      const competing = await copy.copy(backupRaw('另一个副本'));
      expect(competing.code).assertEqual(SceneBackupCopyCode.BUSY);
      expect(port.writes.length).assertEqual(1);
      port.replies[0].succeed(); const result = await pending;
      expect(result.code).assertEqual(SceneBackupCopyCode.COPIED);
      expect(result.copied).assertTrue();
      expect(result.message.indexOf('未加密') >= 0).assertTrue();
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0200
     * @tc.name testContinuationBackupClipboard0002
     * @tc.desc 异步复制失败不回显平台携带的私密内容，并释放门禁以便再次主动复制
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0002', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const pending = copy.copy(backupRaw());
      port.replies[0].fail('13812345678 私密正文地址'); const failed = await pending;
      expect(failed.code).assertEqual(SceneBackupCopyCode.FAILED);
      expect(failed.copied).assertFalse();
      expect(failed.message.indexOf('13812345678')).assertEqual(-1);
      const retry = copy.copy(backupRaw('第二次主动复制')); port.replies[1].succeed(); const completed = await retry;
      expect(completed.code).assertEqual(SceneBackupCopyCode.COPIED); expect(port.writes.length).assertEqual(2);
      const root = readSceneBackup(port.writes[1]).workspace as SceneWorkspace;
      expect(findScene(root, 'note')?.state.note.body).assertEqual('第二次主动复制');
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0300
     * @tc.name testContinuationBackupClipboard0003
     * @tc.desc 创建或提交剪贴板同步抛错也不能提前成功或永久占用复制门禁
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0003', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      port.throwBeforePromise = true;
      const failed = await copy.copy(backupRaw());
      expect(failed.code).assertEqual(SceneBackupCopyCode.FAILED);
      expect(failed.message.indexOf('private clipboard')).assertEqual(-1);
      port.throwBeforePromise = false;
      const retry = copy.copy(backupRaw('恢复复制'));
      port.replies[0].succeed();
      const result = await retry;
      expect(result.copied).assertTrue();
      expect(port.writes.length).assertEqual(2);
      expect(port.replies.length).assertEqual(1);
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0400
     * @tc.name testContinuationBackupClipboard0004
     * @tc.desc 释放后迟到复制失败只返回弃用结果，不泄露平台错误中的业务内容或重新开放旧入口
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0004', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const pending = copy.copy(backupRaw());
      copy.dispose(); port.replies[0].fail('私密地址秘密电话 13812345678'); const abandoned = await pending;
      expect(abandoned.code).assertEqual(SceneBackupCopyCode.ABANDONED); expect(abandoned.copied).assertFalse();
      expect(abandoned.message.indexOf('13812345678')).assertEqual(-1);
      expect(abandoned.message.indexOf('私密地址')).assertEqual(-1);
      expect((await copy.copy(backupRaw())).code).assertEqual(SceneBackupCopyCode.BLOCKED);
      expect(port.writes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0500
     * @tc.name testContinuationBackupClipboard0005
     * @tc.desc 不完整备份复制在触及剪贴板之前拒绝，不能把解析失败原文放进反馈
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0005', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const result = await copy.copy('{private-invalid-body');
      expect(result.code).assertEqual(SceneBackupCopyCode.INVALID);
      expect(port.writes.length).assertEqual(0);
      expect(port.replies.length).assertEqual(0);
      expect(result.message.indexOf('private-invalid-body')).assertEqual(-1);
      expect(result.copied).assertFalse();
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0600
     * @tc.name testContinuationBackupClipboard0006
     * @tc.desc 已释放复制实例不可再写，但新的独立实例仍可通过同一端口主动复制
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0006', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const old = new SceneBackupClipboard(port);
      old.dispose();
      const blocked = await old.copy(backupRaw());
      expect(blocked.code).assertEqual(SceneBackupCopyCode.BLOCKED); expect(port.writes.length).assertEqual(0);
      const current = new SceneBackupClipboard(port);
      const pending = current.copy(backupRaw('新实例副本'));
      port.replies[0].succeed();
      const result = await pending;
      expect(result.copied).assertTrue(); const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
      expect(findScene(root, 'note')?.state.note.body).assertEqual('新实例副本');
      expect(port.writes.length).assertEqual(1);
      current.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0700
     * @tc.name testContinuationBackupClipboard0007
     * @tc.desc 页面释放后复制已经成功的事实不能谎称可撤回，迟到结果标为旧页面弃用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0007', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const pending = copy.copy(backupRaw('已交端口副本'));
      copy.dispose();
      port.replies[0].succeed();
      const result = await pending;
      expect(result.code).assertEqual(SceneBackupCopyCode.ABANDONED);
      expect(result.copied).assertTrue();
      expect(result.message.indexOf('自行管理') >= 0).assertTrue();
      expect(port.writes.length).assertEqual(1);
      const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
      expect(findScene(root, 'note')?.state.note.body).assertEqual('已交端口副本');
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0800
     * @tc.name testContinuationBackupClipboard0008
     * @tc.desc 生成后发生业务编辑时复制旧快照被拒绝，当前草稿和保存基线保持各自版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0008', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const f = new BackupFixture(backupRaw('保存基线'), new SceneBackupClipboard(port));
      try {
        const exported = f.controller.sceneBackupSnapshot();
        f.controller.sceneWorkbench.editNote('新标题', '刚发生的编辑', 0, 2);
        const result = await f.controller.copySceneBackup(exported);
        expect(result.code).assertEqual(SceneBackupCopyCode.BLOCKED); expect(port.writes.length).assertEqual(0);
        expect(f.controller.sceneWorkbench.snapshot().noteBody).assertEqual('刚发生的编辑');
        expect(f.controller.sceneWorkbench.snapshot().noteSavedBody).assertEqual('保存基线');
        expect(f.store.putCalls).assertEqual(0);
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0900
     * @tc.name testContinuationBackupClipboard0009
     * @tc.desc scene冻结仍允许用户复制合法内存救援副本，但不得借复制修复磁盘或解冻写入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0009', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort(); const f = new BackupFixture('{损坏磁盘', new SceneBackupClipboard(port));
      try {
        f.controller.sceneWorkbench.editNote('救援', '仍在内存的正文', 0, 3);
        const exported = f.controller.sceneBackupSnapshot();
        const pending = f.controller.copySceneBackup(exported);
        port.replies[0].succeed();
        const result = await pending;
        const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
        expect(result.copied).assertTrue(); expect(findScene(root, 'note')?.state.note.body).assertEqual('仍在内存的正文');
        expect(f.controller.previewSceneBackup(backupRaw()).code).assertEqual(SceneBackupCode.FROZEN);
        expect(f.store.stored()).assertEqual('{损坏磁盘'); expect(f.store.putCalls).assertEqual(0);
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_1000
     * @tc.name testContinuationBackupClipboard0010
     * @tc.desc 复制等待期间业务变更不伪称副本最新，成功反馈应明确生成时快照与当前状态不同
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationBackupClipboard0010', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const f = new BackupFixture(backupRaw('生成时正文'), new SceneBackupClipboard(port));
      try {
        const exported = f.controller.sceneBackupSnapshot(); const pending = f.controller.copySceneBackup(exported);
        f.controller.sceneWorkbench.editNote('后来修改', '复制期间的新正文', 0, 2);
        port.replies[0].succeed();
        const result = await pending;
        expect(result.copied).assertTrue(); expect(result.message.indexOf('当前工作区已有变化') >= 0).assertTrue();
        const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
        expect(findScene(root, 'note')?.state.note.body).assertEqual('生成时正文');
        expect(f.controller.sceneWorkbench.snapshot().noteBody).assertEqual('复制期间的新正文');
        expect(f.store.putCalls).assertEqual(0);
      } finally {
        f.release();
      }
    });
  });
}
