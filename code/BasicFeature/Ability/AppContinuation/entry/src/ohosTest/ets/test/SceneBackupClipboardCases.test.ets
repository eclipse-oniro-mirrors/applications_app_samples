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
import { SceneBackupClipboard, SceneBackupCopyCode } from '../../../main/ets/learning/scene/SceneBackupClipboard';
import { SceneWorkspace, findScene } from '../../../main/ets/learning/scene/SceneModel';
import { SceneBackupCode, readSceneBackup } from '../../../main/ets/learning/scene/SceneWorkspaceBackupModel';
import { BackupClipboardPort, BackupFixture, backupRaw } from '../support/SceneBackupFixtures';

export default function sceneBackupClipboardCases(): void {
  describe('SceneBackupClipboardCases', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0100
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0001
     * @tc.desc 复制等待真实端口完成才返回成功，写入的是完整可解析root而非屏幕截断预览
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0001', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const raw = backupRaw('长正文'.repeat(300));
      const pending = copy.copy(raw); const written = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
      loggedExpect(findScene(written, 'note')?.state.note.body, 'SceneBackupClipboardCases.test.ets:A0001', BUNDLE + '_ContinuationBackupClipboard_0001').assertEqual('长正文'.repeat(300));
      loggedExpect(port.replies.length, 'SceneBackupClipboardCases.test.ets:A0002', BUNDLE + '_ContinuationBackupClipboard_0001').assertEqual(1);
      const competing = await copy.copy(backupRaw('另一个副本'));
      loggedExpect(competing.code, 'SceneBackupClipboardCases.test.ets:A0003', BUNDLE + '_ContinuationBackupClipboard_0001').assertEqual(SceneBackupCopyCode.BUSY);
      loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0004', BUNDLE + '_ContinuationBackupClipboard_0001').assertEqual(1);
      port.replies[0].succeed(); const result = await pending;
      loggedExpect(result.code, 'SceneBackupClipboardCases.test.ets:A0005', BUNDLE + '_ContinuationBackupClipboard_0001').assertEqual(SceneBackupCopyCode.COPIED);
      loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0006', BUNDLE + '_ContinuationBackupClipboard_0001').assertTrue();
      loggedExpect(result.message.indexOf('未加密') >= 0, 'SceneBackupClipboardCases.test.ets:A0007', BUNDLE + '_ContinuationBackupClipboard_0001').assertTrue();
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0200
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0002
     * @tc.desc 异步复制失败不回显平台携带的私密内容，并释放门禁以便再次主动复制
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0002', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const pending = copy.copy(backupRaw());
      port.replies[0].fail('13812345678 私密正文地址'); const failed = await pending;
      loggedExpect(failed.code, 'SceneBackupClipboardCases.test.ets:A0008', BUNDLE + '_ContinuationBackupClipboard_0002').assertEqual(SceneBackupCopyCode.FAILED);
      loggedExpect(failed.copied, 'SceneBackupClipboardCases.test.ets:A0009', BUNDLE + '_ContinuationBackupClipboard_0002').assertFalse();
      loggedExpect(failed.message.indexOf('13812345678'), 'SceneBackupClipboardCases.test.ets:A0010', BUNDLE + '_ContinuationBackupClipboard_0002').assertEqual(-1);
      const retry = copy.copy(backupRaw('第二次主动复制')); port.replies[1].succeed(); const completed = await retry;
      loggedExpect(completed.code, 'SceneBackupClipboardCases.test.ets:A0011', BUNDLE + '_ContinuationBackupClipboard_0002').assertEqual(SceneBackupCopyCode.COPIED); loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0012', BUNDLE + '_ContinuationBackupClipboard_0002').assertEqual(2);
      const root = readSceneBackup(port.writes[1]).workspace as SceneWorkspace;
      loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupClipboardCases.test.ets:A0013', BUNDLE + '_ContinuationBackupClipboard_0002').assertEqual('第二次主动复制');
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0300
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0003
     * @tc.desc 创建或提交剪贴板同步抛错也不能提前成功或永久占用复制门禁
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0003', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      port.throwBeforePromise = true;
      const failed = await copy.copy(backupRaw());
      loggedExpect(failed.code, 'SceneBackupClipboardCases.test.ets:A0014', BUNDLE + '_ContinuationBackupClipboard_0003').assertEqual(SceneBackupCopyCode.FAILED);
      loggedExpect(failed.message.indexOf('private clipboard'), 'SceneBackupClipboardCases.test.ets:A0015', BUNDLE + '_ContinuationBackupClipboard_0003').assertEqual(-1);
      port.throwBeforePromise = false;
      const retry = copy.copy(backupRaw('恢复复制'));
      port.replies[0].succeed();
      const result = await retry;
      loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0016', BUNDLE + '_ContinuationBackupClipboard_0003').assertTrue();
      loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0017', BUNDLE + '_ContinuationBackupClipboard_0003').assertEqual(2);
      loggedExpect(port.replies.length, 'SceneBackupClipboardCases.test.ets:A0018', BUNDLE + '_ContinuationBackupClipboard_0003').assertEqual(1);
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0400
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0004
     * @tc.desc 释放后迟到复制失败只返回弃用结果，不泄露平台错误中的业务内容或重新开放旧入口
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0004', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const pending = copy.copy(backupRaw());
      copy.dispose(); port.replies[0].fail('私密地址秘密电话 13812345678'); const abandoned = await pending;
      loggedExpect(abandoned.code, 'SceneBackupClipboardCases.test.ets:A0019', BUNDLE + '_ContinuationBackupClipboard_0004').assertEqual(SceneBackupCopyCode.ABANDONED); loggedExpect(abandoned.copied, 'SceneBackupClipboardCases.test.ets:A0020', BUNDLE + '_ContinuationBackupClipboard_0004').assertFalse();
      loggedExpect(abandoned.message.indexOf('13812345678'), 'SceneBackupClipboardCases.test.ets:A0021', BUNDLE + '_ContinuationBackupClipboard_0004').assertEqual(-1);
      loggedExpect(abandoned.message.indexOf('私密地址'), 'SceneBackupClipboardCases.test.ets:A0022', BUNDLE + '_ContinuationBackupClipboard_0004').assertEqual(-1);
      loggedExpect((await copy.copy(backupRaw())).code, 'SceneBackupClipboardCases.test.ets:A0023', BUNDLE + '_ContinuationBackupClipboard_0004').assertEqual(SceneBackupCopyCode.BLOCKED);
      loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0024', BUNDLE + '_ContinuationBackupClipboard_0004').assertEqual(1);
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0500
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0005
     * @tc.desc 不完整备份复制在触及剪贴板之前拒绝，不能把解析失败原文放进反馈
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0005', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const result = await copy.copy('{private-invalid-body');
      loggedExpect(result.code, 'SceneBackupClipboardCases.test.ets:A0025', BUNDLE + '_ContinuationBackupClipboard_0005').assertEqual(SceneBackupCopyCode.INVALID);
      loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0026', BUNDLE + '_ContinuationBackupClipboard_0005').assertEqual(0);
      loggedExpect(port.replies.length, 'SceneBackupClipboardCases.test.ets:A0027', BUNDLE + '_ContinuationBackupClipboard_0005').assertEqual(0);
      loggedExpect(result.message.indexOf('private-invalid-body'), 'SceneBackupClipboardCases.test.ets:A0028', BUNDLE + '_ContinuationBackupClipboard_0005').assertEqual(-1);
      loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0029', BUNDLE + '_ContinuationBackupClipboard_0005').assertFalse();
      copy.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0600
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0006
     * @tc.desc 已释放复制实例不可再写，但新的独立实例仍可通过同一端口主动复制
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0006', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const old = new SceneBackupClipboard(port);
      old.dispose();
      const blocked = await old.copy(backupRaw());
      loggedExpect(blocked.code, 'SceneBackupClipboardCases.test.ets:A0030', BUNDLE + '_ContinuationBackupClipboard_0006').assertEqual(SceneBackupCopyCode.BLOCKED); loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0031', BUNDLE + '_ContinuationBackupClipboard_0006').assertEqual(0);
      const current = new SceneBackupClipboard(port);
      const pending = current.copy(backupRaw('新实例副本'));
      port.replies[0].succeed();
      const result = await pending;
      loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0032', BUNDLE + '_ContinuationBackupClipboard_0006').assertTrue(); const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
      loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupClipboardCases.test.ets:A0033', BUNDLE + '_ContinuationBackupClipboard_0006').assertEqual('新实例副本');
      loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0034', BUNDLE + '_ContinuationBackupClipboard_0006').assertEqual(1);
      current.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0700
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0007
     * @tc.desc 页面释放后复制已经成功的事实不能谎称可撤回，迟到结果标为旧页面弃用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0007', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const copy = new SceneBackupClipboard(port);
      const pending = copy.copy(backupRaw('已交端口副本'));
      copy.dispose();
      port.replies[0].succeed();
      const result = await pending;
      loggedExpect(result.code, 'SceneBackupClipboardCases.test.ets:A0035', BUNDLE + '_ContinuationBackupClipboard_0007').assertEqual(SceneBackupCopyCode.ABANDONED);
      loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0036', BUNDLE + '_ContinuationBackupClipboard_0007').assertTrue();
      loggedExpect(result.message.indexOf('自行管理') >= 0, 'SceneBackupClipboardCases.test.ets:A0037', BUNDLE + '_ContinuationBackupClipboard_0007').assertTrue();
      loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0038', BUNDLE + '_ContinuationBackupClipboard_0007').assertEqual(1);
      const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
      loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupClipboardCases.test.ets:A0039', BUNDLE + '_ContinuationBackupClipboard_0007').assertEqual('已交端口副本');
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0800
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0008
     * @tc.desc 生成后发生业务编辑时复制旧快照被拒绝，当前草稿和保存基线保持各自版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0008', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const f = new BackupFixture(backupRaw('保存基线'), new SceneBackupClipboard(port));
      try {
        const exported = f.controller.sceneBackupSnapshot();
        f.controller.sceneWorkbench.editNote('新标题', '刚发生的编辑', 0, 2);
        const result = await f.controller.copySceneBackup(exported);
        loggedExpect(result.code, 'SceneBackupClipboardCases.test.ets:A0040', BUNDLE + '_ContinuationBackupClipboard_0008').assertEqual(SceneBackupCopyCode.BLOCKED); loggedExpect(port.writes.length, 'SceneBackupClipboardCases.test.ets:A0041', BUNDLE + '_ContinuationBackupClipboard_0008').assertEqual(0);
        loggedExpect(f.controller.sceneWorkbench.snapshot().noteBody, 'SceneBackupClipboardCases.test.ets:A0042', BUNDLE + '_ContinuationBackupClipboard_0008').assertEqual('刚发生的编辑');
        loggedExpect(f.controller.sceneWorkbench.snapshot().noteSavedBody, 'SceneBackupClipboardCases.test.ets:A0043', BUNDLE + '_ContinuationBackupClipboard_0008').assertEqual('保存基线');
        loggedExpect(f.store.putCalls, 'SceneBackupClipboardCases.test.ets:A0044', BUNDLE + '_ContinuationBackupClipboard_0008').assertEqual(0);
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_0900
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0009
     * @tc.desc scene冻结仍允许用户复制合法内存救援副本，但不得借复制修复磁盘或解冻写入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0009', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort(); const f = new BackupFixture('{损坏磁盘', new SceneBackupClipboard(port));
      try {
        f.controller.sceneWorkbench.editNote('救援', '仍在内存的正文', 0, 3);
        const exported = f.controller.sceneBackupSnapshot();
        const pending = f.controller.copySceneBackup(exported);
        port.replies[0].succeed();
        const result = await pending;
        const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
        loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0045', BUNDLE + '_ContinuationBackupClipboard_0009').assertTrue(); loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupClipboardCases.test.ets:A0046', BUNDLE + '_ContinuationBackupClipboard_0009').assertEqual('仍在内存的正文');
        loggedExpect(f.controller.previewSceneBackup(backupRaw()).code, 'SceneBackupClipboardCases.test.ets:A0047', BUNDLE + '_ContinuationBackupClipboard_0009').assertEqual(SceneBackupCode.FROZEN);
        loggedExpect(f.store.stored(), 'SceneBackupClipboardCases.test.ets:A0048', BUNDLE + '_ContinuationBackupClipboard_0009').assertEqual('{损坏磁盘'); loggedExpect(f.store.putCalls, 'SceneBackupClipboardCases.test.ets:A0049', BUNDLE + '_ContinuationBackupClipboard_0009').assertEqual(0);
      } finally {
        f.release();
      }
    });

    /**
     * @tc.number SUB_CONTINUATION_BACKUPCLIPBOARD_1000
     * @tc.name com.samples.appcontinuation_ContinuationBackupClipboard_0010
     * @tc.desc 复制等待期间业务变更不伪称副本最新，成功反馈应明确生成时快照与当前状态不同
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationBackupClipboard_0010', 0, async (): Promise<void> => {
      const port = new BackupClipboardPort();
      const f = new BackupFixture(backupRaw('生成时正文'), new SceneBackupClipboard(port));
      try {
        const exported = f.controller.sceneBackupSnapshot(); const pending = f.controller.copySceneBackup(exported);
        f.controller.sceneWorkbench.editNote('后来修改', '复制期间的新正文', 0, 2);
        port.replies[0].succeed();
        const result = await pending;
        loggedExpect(result.copied, 'SceneBackupClipboardCases.test.ets:A0050', BUNDLE + '_ContinuationBackupClipboard_0010').assertTrue(); loggedExpect(result.message.indexOf('当前工作区已有变化') >= 0, 'SceneBackupClipboardCases.test.ets:A0051', BUNDLE + '_ContinuationBackupClipboard_0010').assertTrue();
        const root = readSceneBackup(port.writes[0]).workspace as SceneWorkspace;
        loggedExpect(findScene(root, 'note')?.state.note.body, 'SceneBackupClipboardCases.test.ets:A0052', BUNDLE + '_ContinuationBackupClipboard_0010').assertEqual('生成时正文');
        loggedExpect(f.controller.sceneWorkbench.snapshot().noteBody, 'SceneBackupClipboardCases.test.ets:A0053', BUNDLE + '_ContinuationBackupClipboard_0010').assertEqual('复制期间的新正文');
        loggedExpect(f.store.putCalls, 'SceneBackupClipboardCases.test.ets:A0054', BUNDLE + '_ContinuationBackupClipboard_0010').assertEqual(0);
      } finally {
        f.release();
      }
    });
  });
}
