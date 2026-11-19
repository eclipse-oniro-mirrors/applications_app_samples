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

import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import { SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  SceneDocument, decodeScene, emptyWorkspace, encodeWorkspace, stageScene, REVISION_LIMIT
} from '../../../main/ets/learning/scene/SceneModel';

/** Controlled cache/disk boundary only; all scene behavior uses production SceneWorkbench. */
class RecoveryStore implements SceneStorePort {
  public cache: string;
  public disk: string;
  public puts: number = 0;
  public deletes: number = 0;
  public failFlush: boolean = false;
  public failRead: boolean = false;
  public nonString: boolean = false;
  constructor(raw: string = '') { this.cache = raw; this.disk = raw; }
  public getSync(key: string, fallback: string): Object {
    if (this.failRead) { throw new Error('controlled read failure'); }
    return this.nonString ? 42 : this.cache;
  }
  public putSync(key: string, value: string): void { this.puts++; this.cache = value; }
  public deleteSync(key: string): void { this.deletes++; this.cache = ''; }
  public flushSync(): void {
    if (this.failFlush) { this.failFlush = false; throw new Error('controlled flush failure'); }
    this.disk = this.cache;
  }
}

export default function sceneRecoveryB2Test(): void {
  describe('SceneRecoveryB2', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0100
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0001
     * @tc.desc      锁定期间拒绝业务写入，解锁恢复原草稿
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0001', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('草稿', '待保存', 0, 2); work.setLocked(true);
      const edited = work.editNote('覆盖', '错误', 0, 1); const saved = work.saveNote();
      const switched = work.open('reading'); work.discardNote();
      work.setLocked(false); const resumed = work.saveNote();
      loggedExpect(edited, 'SceneRecoveryB2.test.ets:A0001', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertFalse(); loggedExpect(saved, 'SceneRecoveryB2.test.ets:A0002', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertFalse(); loggedExpect(switched, 'SceneRecoveryB2.test.ets:A0003', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertFalse();
      loggedExpect(resumed, 'SceneRecoveryB2.test.ets:A0004', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertTrue(); loggedExpect(store.puts, 'SceneRecoveryB2.test.ets:A0005', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertEqual(1);
      loggedExpect(work.snapshot().noteBody, 'SceneRecoveryB2.test.ets:A0006', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertEqual('待保存'); loggedExpect(work.snapshot().revision, 'SceneRecoveryB2.test.ets:A0007', BUNDLE + '_SceneRecoveryBatchTwo_0001').assertEqual(1);
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0200
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0002
     * @tc.desc      释放后拒绝接续提交并停止通知
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0002', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store); let calls: number = 0;
      work.subscribe((): void => { calls++; }); const incoming = work.document('reading');
      work.dispose(); work.setLocked(false); const accepted = work.commitIncoming(incoming, true);
      const reset = work.resetWorkspace(); const edited = work.gotoParagraph(1, 1);
      loggedExpect(accepted, 'SceneRecoveryB2.test.ets:A0008', BUNDLE + '_SceneRecoveryBatchTwo_0002').assertFalse(); loggedExpect(reset, 'SceneRecoveryB2.test.ets:A0009', BUNDLE + '_SceneRecoveryBatchTwo_0002').assertFalse(); loggedExpect(edited, 'SceneRecoveryB2.test.ets:A0010', BUNDLE + '_SceneRecoveryBatchTwo_0002').assertFalse();
      loggedExpect(calls, 'SceneRecoveryB2.test.ets:A0011', BUNDLE + '_SceneRecoveryBatchTwo_0002').assertEqual(0); loggedExpect(store.puts, 'SceneRecoveryB2.test.ets:A0012', BUNDLE + '_SceneRecoveryBatchTwo_0002').assertEqual(0);
      loggedExpect(work.snapshot().editable, 'SceneRecoveryB2.test.ets:A0013', BUNDLE + '_SceneRecoveryBatchTwo_0002').assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0300
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0003
     * @tc.desc      订阅异常不阻断其它监听且退订立即生效
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0003', 0, (): void => {
      const work = new SceneWorkbench(new RecoveryStore()); let calls: number = 0;
      const stopBad = work.subscribe((): void => { throw new Error('listener'); });
      const stop = work.subscribe((): void => { calls++; }); work.editNote('一', '正文', 0, 1);
      const first = calls; stop(); work.saveNote(); stopBad();
      let later: number = 0; work.subscribe((): void => { later++; }); work.discardNote();
      loggedExpect(first, 'SceneRecoveryB2.test.ets:A0014', BUNDLE + '_SceneRecoveryBatchTwo_0003').assertEqual(1); loggedExpect(calls, 'SceneRecoveryB2.test.ets:A0015', BUNDLE + '_SceneRecoveryBatchTwo_0003').assertEqual(1); loggedExpect(later, 'SceneRecoveryB2.test.ets:A0016', BUNDLE + '_SceneRecoveryBatchTwo_0003').assertEqual(1);
      loggedExpect(work.snapshot().revision, 'SceneRecoveryB2.test.ets:A0017', BUNDLE + '_SceneRecoveryBatchTwo_0003').assertEqual(1); loggedExpect(work.hasDirtyWork(), 'SceneRecoveryB2.test.ets:A0018', BUNDLE + '_SceneRecoveryBatchTwo_0003').assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0400
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0004
     * @tc.desc      非字符串存档冻结写入但保留内存编辑
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0004', 0, (): void => {
      const store = new RecoveryStore(); store.nonString = true; const work = new SceneWorkbench(store);
      work.setFormField('name', '可恢复草稿'); const saved = work.saveForm(); const reset = work.resetWorkspace();
      loggedExpect(work.snapshot().storageFrozen, 'SceneRecoveryB2.test.ets:A0019', BUNDLE + '_SceneRecoveryBatchTwo_0004').assertTrue(); loggedExpect(saved, 'SceneRecoveryB2.test.ets:A0020', BUNDLE + '_SceneRecoveryBatchTwo_0004').assertFalse(); loggedExpect(reset, 'SceneRecoveryB2.test.ets:A0021', BUNDLE + '_SceneRecoveryBatchTwo_0004').assertFalse();
      loggedExpect(store.puts, 'SceneRecoveryB2.test.ets:A0022', BUNDLE + '_SceneRecoveryBatchTwo_0004').assertEqual(0); loggedExpect(work.document('form').state.form.name, 'SceneRecoveryB2.test.ets:A0023', BUNDLE + '_SceneRecoveryBatchTwo_0004').assertEqual('可恢复草稿');
      loggedExpect(work.document('form').revision, 'SceneRecoveryB2.test.ets:A0024', BUNDLE + '_SceneRecoveryBatchTwo_0004').assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0500
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0005
     * @tc.desc      读取异常不触碰未知磁盘且业务草稿可导出
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0005', 0, (): void => {
      const store = new RecoveryStore(); store.failRead = true; const work = new SceneWorkbench(store);
      work.gotoParagraph(1, 1); const payload = decodeScene(work.payloadOf('reading')).value as SceneDocument;
      const saved = work.saveReading();
      loggedExpect(work.snapshot().storageFrozen, 'SceneRecoveryB2.test.ets:A0025', BUNDLE + '_SceneRecoveryBatchTwo_0005').assertTrue();
      loggedExpect(saved, 'SceneRecoveryB2.test.ets:A0026', BUNDLE + '_SceneRecoveryBatchTwo_0005').assertFalse();
      loggedExpect(store.puts, 'SceneRecoveryB2.test.ets:A0027', BUNDLE + '_SceneRecoveryBatchTwo_0005').assertEqual(0);
      loggedExpect(payload.state.reading.chapter, 'SceneRecoveryB2.test.ets:A0028', BUNDLE + '_SceneRecoveryBatchTwo_0005').assertEqual(1); loggedExpect(payload.state.reading.anchor, 'SceneRecoveryB2.test.ets:A0029', BUNDLE + '_SceneRecoveryBatchTwo_0005').assertEqual(1);
      loggedExpect(work.snapshot().readingDirty, 'SceneRecoveryB2.test.ets:A0030', BUNDLE + '_SceneRecoveryBatchTwo_0005').assertTrue();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0600
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0006
     * @tc.desc      首次保存失败删除缓存后可重试且不制造历史
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0006', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('首版', '正文', 0, 1); store.failFlush = true; const failed = work.saveNote();
      const afterFailure = store.disk; const deletes = store.deletes; const retried = work.saveNote();
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      loggedExpect(failed, 'SceneRecoveryB2.test.ets:A0031', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertFalse(); loggedExpect(afterFailure, 'SceneRecoveryB2.test.ets:A0032', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertEqual(''); loggedExpect(deletes, 'SceneRecoveryB2.test.ets:A0033', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertEqual(1);
      loggedExpect(retried, 'SceneRecoveryB2.test.ets:A0034', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertTrue(); loggedExpect(reopened.snapshot().revision, 'SceneRecoveryB2.test.ets:A0035', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertEqual(1);
      loggedExpect(reopened.snapshot().historyCount, 'SceneRecoveryB2.test.ets:A0036', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertEqual(0);
      loggedExpect(reopened.snapshot().noteSavedBody, 'SceneRecoveryB2.test.ets:A0037', BUNDLE + '_SceneRecoveryBatchTwo_0006').assertEqual('正文');
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0700
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0007
     * @tc.desc      重置清除多场景持久化并生成新文档身份
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0007', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('旧题', '旧文', 0, 1); work.saveNote(); const oldId = work.document('note').documentId;
      work.setFormField('name', '旧姓名'); work.saveForm(); const reset = work.resetWorkspace();
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      loggedExpect(reset, 'SceneRecoveryB2.test.ets:A0038', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertTrue(); loggedExpect(reopened.snapshot().active, 'SceneRecoveryB2.test.ets:A0039', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertEqual('note');
      loggedExpect(reopened.document('note').documentId !== oldId, 'SceneRecoveryB2.test.ets:A0040', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertTrue();
      loggedExpect(reopened.snapshot().noteBody, 'SceneRecoveryB2.test.ets:A0041', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertEqual('');
      loggedExpect(reopened.document('form').state.form.name, 'SceneRecoveryB2.test.ets:A0042', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertEqual(''); loggedExpect(reopened.hasDirtyWork(), 'SceneRecoveryB2.test.ets:A0043', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertFalse();
      loggedExpect(reopened.historyDocuments().length, 'SceneRecoveryB2.test.ets:A0044', BUNDLE + '_SceneRecoveryBatchTwo_0007').assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0800
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0008
     * @tc.desc      重置失败补偿旧存档并保留未保存内容
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0008', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('旧题', '已保存', 0, 1); work.saveNote(); const before = store.disk;
      work.editNote('新题', '未保存', 1, 2); store.failFlush = true; const reset = work.resetWorkspace();
      loggedExpect(reset, 'SceneRecoveryB2.test.ets:A0045', BUNDLE + '_SceneRecoveryBatchTwo_0008').assertFalse();
      loggedExpect(store.disk, 'SceneRecoveryB2.test.ets:A0046', BUNDLE + '_SceneRecoveryBatchTwo_0008').assertEqual(before);
      loggedExpect(work.snapshot().noteBody, 'SceneRecoveryB2.test.ets:A0047', BUNDLE + '_SceneRecoveryBatchTwo_0008').assertEqual('未保存');
      loggedExpect(work.snapshot().revision, 'SceneRecoveryB2.test.ets:A0048', BUNDLE + '_SceneRecoveryBatchTwo_0008').assertEqual(1); loggedExpect(work.snapshot().noteDirty, 'SceneRecoveryB2.test.ets:A0049', BUNDLE + '_SceneRecoveryBatchTwo_0008').assertTrue();
      loggedExpect(work.snapshot().storageFrozen, 'SceneRecoveryB2.test.ets:A0050', BUNDLE + '_SceneRecoveryBatchTwo_0008').assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0900
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0009
     * @tc.desc      保存阅读仅落盘阅读且保留其它场景未保存编辑
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0009', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('隔离笔记', '未落盘正文', 0, 2); work.setFormField('name', '未落盘姓名');
      work.gotoParagraph(1, 2);
      const saved = work.saveReading();
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      loggedExpect(saved, 'SceneRecoveryB2.test.ets:A0051', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertTrue(); loggedExpect(work.document('note').state.note.body, 'SceneRecoveryB2.test.ets:A0052', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertEqual('未落盘正文');
      loggedExpect(work.document('form').state.form.name, 'SceneRecoveryB2.test.ets:A0053', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertEqual('未落盘姓名'); loggedExpect(work.hasDirtyWork(), 'SceneRecoveryB2.test.ets:A0054', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertTrue();
      loggedExpect(reopened.document('note').state.note.body, 'SceneRecoveryB2.test.ets:A0055', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertEqual('');
      loggedExpect(reopened.document('form').state.form.name, 'SceneRecoveryB2.test.ets:A0056', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertEqual('');
      loggedExpect(reopened.document('reading').state.reading.anchor, 'SceneRecoveryB2.test.ets:A0057', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertEqual(2); loggedExpect(work.open('form'), 'SceneRecoveryB2.test.ets:A0058', BUNDLE + '_SceneRecoveryBatchTwo_0009').assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_1000
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0010
     * @tc.desc      接纳阅读版本不会覆盖本机其它场景草稿
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0010', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('本机', '不能覆盖', 0, 2); work.setFormField('address', '待保存地址');
      const source = new SceneWorkbench(new RecoveryStore()); source.gotoParagraph(2, 1);
      const incoming = source.document('reading'); incoming.revision = 4;
      const accepted = work.commitIncoming(incoming, true);
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      loggedExpect(accepted, 'SceneRecoveryB2.test.ets:A0059', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertTrue(); loggedExpect(work.document('reading').revision, 'SceneRecoveryB2.test.ets:A0060', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertEqual(5);
      loggedExpect(work.document('note').state.note.body, 'SceneRecoveryB2.test.ets:A0061', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertEqual('不能覆盖');
      loggedExpect(work.document('form').state.form.address, 'SceneRecoveryB2.test.ets:A0062', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertEqual('待保存地址');
      loggedExpect(reopened.document('reading').state.reading.chapter, 'SceneRecoveryB2.test.ets:A0063', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertEqual(2);
      loggedExpect(reopened.document('form').state.form.address, 'SceneRecoveryB2.test.ets:A0064', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertEqual('');
      loggedExpect(work.hasDirtyWork(), 'SceneRecoveryB2.test.ets:A0065', BUNDLE + '_SceneRecoveryBatchTwo_0010').assertTrue();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_1100
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0011
     * @tc.desc      恢复笔记历史不保存其它场景的临时修改
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0011', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('第一版', '甲正文', 0, 1); work.saveNote(); work.editNote('第二版', '乙正文', 1, 2); work.saveNote();
      work.gotoParagraph(1, 1); work.setFormField('note', '临时备注'); const restored = work.restoreHistory(0);
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      loggedExpect(restored, 'SceneRecoveryB2.test.ets:A0066', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertTrue();
      loggedExpect(work.snapshot().revision, 'SceneRecoveryB2.test.ets:A0067', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual(3);
      loggedExpect(work.snapshot().noteBody, 'SceneRecoveryB2.test.ets:A0068', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual('甲正文');
      loggedExpect(work.document('reading').state.reading.anchor, 'SceneRecoveryB2.test.ets:A0069', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual(1);
      loggedExpect(work.document('form').state.form.note, 'SceneRecoveryB2.test.ets:A0070', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual('临时备注');
      loggedExpect(reopened.document('reading').state.reading.chapter, 'SceneRecoveryB2.test.ets:A0071', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual(0);
      loggedExpect(reopened.document('form').state.form.note, 'SceneRecoveryB2.test.ets:A0072', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual('');
      loggedExpect(work.historyDocuments()[1].state.note.body, 'SceneRecoveryB2.test.ets:A0073', BUNDLE + '_SceneRecoveryBatchTwo_0011').assertEqual('乙正文');
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_1200
     * @tc.name      com.samples.appcontinuation_SceneRecoveryBatchTwo_0012
     * @tc.desc      修订上限拒绝保存与冲突接纳且不触碰存储
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneRecoveryBatchTwo_0012', 0, (): void => {
      const seed = new SceneWorkbench(new RecoveryStore()); const incoming = seed.document('note');
      incoming.revision = REVISION_LIMIT; const root = stageScene(emptyWorkspace(), incoming, 'note');
      const store = new RecoveryStore(encodeWorkspace(root)); const work = new SceneWorkbench(store);
      work.editNote('上限草稿', '保留编辑', 0, 2);
      const saved = work.saveNote();
      const accepted = work.commitIncoming(incoming, true);
      loggedExpect(saved, 'SceneRecoveryB2.test.ets:A0074', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertFalse(); loggedExpect(accepted, 'SceneRecoveryB2.test.ets:A0075', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertFalse(); loggedExpect(store.puts, 'SceneRecoveryB2.test.ets:A0076', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertEqual(0);
      loggedExpect(work.snapshot().revision, 'SceneRecoveryB2.test.ets:A0077', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertEqual(REVISION_LIMIT);
      loggedExpect(work.snapshot().noteTitle, 'SceneRecoveryB2.test.ets:A0078', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertEqual('上限草稿');
      loggedExpect(work.snapshot().noteDirty, 'SceneRecoveryB2.test.ets:A0079', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertTrue(); loggedExpect(work.historyDocuments().length, 'SceneRecoveryB2.test.ets:A0080', BUNDLE + '_SceneRecoveryBatchTwo_0012').assertEqual(0);
      work.dispose();
    });

  });
}
