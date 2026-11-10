import { describe, expect, it } from '@ohos/hypium';
import { SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SceneDocument, decodeScene, emptyWorkspace, encodeWorkspace, stageScene, REVISION_LIMIT } from '../../../main/ets/learning/scene/SceneModel';

/** Controlled cache/disk boundary only; all scene behavior uses production SceneWorkbench. */
class RecoveryStore implements SceneStorePort {
  cache: string;
  disk: string;
  puts: number = 0;
  deletes: number = 0;
  failFlush: boolean = false;
  failRead: boolean = false;
  nonString: boolean = false;
  constructor(raw: string = '') { this.cache = raw; this.disk = raw; }
  getSync(key: string, fallback: string): Object {
    if (this.failRead) { throw new Error('controlled read failure'); }
    return this.nonString ? 42 : this.cache;
  }
  putSync(key: string, value: string): void { this.puts++; this.cache = value; }
  deleteSync(key: string): void { this.deletes++; this.cache = ''; }
  flushSync(): void {
    if (this.failFlush) { this.failFlush = false; throw new Error('controlled flush failure'); }
    this.disk = this.cache;
  }
}

export default function sceneRecoveryB2Test(): void {
  describe('SceneRecoveryB2', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0100
     * @tc.name      testSceneRecoveryBatchTwo0001
     * @tc.desc      锁定期间拒绝业务写入，解锁恢复原草稿
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0001', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('草稿', '待保存', 0, 2); work.setLocked(true);
      const edited = work.editNote('覆盖', '错误', 0, 1); const saved = work.saveNote();
      const switched = work.open('reading'); work.discardNote();
      work.setLocked(false); const resumed = work.saveNote();
      expect(edited).assertFalse(); expect(saved).assertFalse(); expect(switched).assertFalse();
      expect(resumed).assertTrue(); expect(store.puts).assertEqual(1);
      expect(work.snapshot().noteBody).assertEqual('待保存'); expect(work.snapshot().revision).assertEqual(1);
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0200
     * @tc.name      testSceneRecoveryBatchTwo0002
     * @tc.desc      释放后拒绝接续提交并停止通知
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0002', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store); let calls: number = 0;
      work.subscribe((): void => { calls++; }); const incoming = work.document('reading');
      work.dispose(); work.setLocked(false); const accepted = work.commitIncoming(incoming, true);
      const reset = work.resetWorkspace(); const edited = work.gotoParagraph(1, 1);
      expect(accepted).assertFalse(); expect(reset).assertFalse(); expect(edited).assertFalse();
      expect(calls).assertEqual(0); expect(store.puts).assertEqual(0);
      expect(work.snapshot().editable).assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0300
     * @tc.name      testSceneRecoveryBatchTwo0003
     * @tc.desc      订阅异常不阻断其它监听且退订立即生效
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0003', 0, (): void => {
      const work = new SceneWorkbench(new RecoveryStore()); let calls: number = 0;
      const stopBad = work.subscribe((): void => { throw new Error('listener'); });
      const stop = work.subscribe((): void => { calls++; }); work.editNote('一', '正文', 0, 1);
      const first = calls; stop(); work.saveNote(); stopBad();
      let later: number = 0; work.subscribe((): void => { later++; }); work.discardNote();
      expect(first).assertEqual(1); expect(calls).assertEqual(1); expect(later).assertEqual(1);
      expect(work.snapshot().revision).assertEqual(1); expect(work.hasDirtyWork()).assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0400
     * @tc.name      testSceneRecoveryBatchTwo0004
     * @tc.desc      非字符串存档冻结写入但保留内存编辑
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0004', 0, (): void => {
      const store = new RecoveryStore(); store.nonString = true; const work = new SceneWorkbench(store);
      work.setFormField('name', '可恢复草稿'); const saved = work.saveForm(); const reset = work.resetWorkspace();
      expect(work.snapshot().storageFrozen).assertTrue(); expect(saved).assertFalse(); expect(reset).assertFalse();
      expect(store.puts).assertEqual(0); expect(work.document('form').state.form.name).assertEqual('可恢复草稿');
      expect(work.document('form').revision).assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0500
     * @tc.name      testSceneRecoveryBatchTwo0005
     * @tc.desc      读取异常不触碰未知磁盘且业务草稿可导出
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0005', 0, (): void => {
      const store = new RecoveryStore(); store.failRead = true; const work = new SceneWorkbench(store);
      work.gotoParagraph(1, 1); const payload = decodeScene(work.payloadOf('reading')).value as SceneDocument;
      const saved = work.saveReading();
      expect(work.snapshot().storageFrozen).assertTrue(); expect(saved).assertFalse(); expect(store.puts).assertEqual(0);
      expect(payload.state.reading.chapter).assertEqual(1); expect(payload.state.reading.anchor).assertEqual(1);
      expect(work.snapshot().readingDirty).assertTrue();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0600
     * @tc.name      testSceneRecoveryBatchTwo0006
     * @tc.desc      首次保存失败删除缓存后可重试且不制造历史
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0006', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('首版', '正文', 0, 1); store.failFlush = true; const failed = work.saveNote();
      const afterFailure = store.disk; const deletes = store.deletes; const retried = work.saveNote();
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      expect(failed).assertFalse(); expect(afterFailure).assertEqual(''); expect(deletes).assertEqual(1);
      expect(retried).assertTrue(); expect(reopened.snapshot().revision).assertEqual(1);
      expect(reopened.snapshot().historyCount).assertEqual(0); expect(reopened.snapshot().noteSavedBody).assertEqual('正文');
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0700
     * @tc.name      testSceneRecoveryBatchTwo0007
     * @tc.desc      重置清除多场景持久化并生成新文档身份
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0007', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('旧题', '旧文', 0, 1); work.saveNote(); const oldId = work.document('note').documentId;
      work.setFormField('name', '旧姓名'); work.saveForm(); const reset = work.resetWorkspace();
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      expect(reset).assertTrue(); expect(reopened.snapshot().active).assertEqual('note');
      expect(reopened.document('note').documentId !== oldId).assertTrue(); expect(reopened.snapshot().noteBody).assertEqual('');
      expect(reopened.document('form').state.form.name).assertEqual(''); expect(reopened.hasDirtyWork()).assertFalse();
      expect(reopened.historyDocuments().length).assertEqual(0);
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0800
     * @tc.name      testSceneRecoveryBatchTwo0008
     * @tc.desc      重置失败补偿旧存档并保留未保存内容
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0008', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('旧题', '已保存', 0, 1); work.saveNote(); const before = store.disk;
      work.editNote('新题', '未保存', 1, 2); store.failFlush = true; const reset = work.resetWorkspace();
      expect(reset).assertFalse(); expect(store.disk).assertEqual(before); expect(work.snapshot().noteBody).assertEqual('未保存');
      expect(work.snapshot().revision).assertEqual(1); expect(work.snapshot().noteDirty).assertTrue();
      expect(work.snapshot().storageFrozen).assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_0900
     * @tc.name      testSceneRecoveryBatchTwo0009
     * @tc.desc      保存阅读仅落盘阅读且保留其它场景未保存编辑
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0009', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('隔离笔记', '未落盘正文', 0, 2); work.setFormField('name', '未落盘姓名');
      work.gotoParagraph(1, 2); const saved = work.saveReading(); const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      expect(saved).assertTrue(); expect(work.document('note').state.note.body).assertEqual('未落盘正文');
      expect(work.document('form').state.form.name).assertEqual('未落盘姓名'); expect(work.hasDirtyWork()).assertTrue();
      expect(reopened.document('note').state.note.body).assertEqual(''); expect(reopened.document('form').state.form.name).assertEqual('');
      expect(reopened.document('reading').state.reading.anchor).assertEqual(2); expect(work.open('form')).assertFalse();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_1000
     * @tc.name      testSceneRecoveryBatchTwo0010
     * @tc.desc      接纳阅读版本不会覆盖本机其它场景草稿
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0010', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('本机', '不能覆盖', 0, 2); work.setFormField('address', '待保存地址');
      const source = new SceneWorkbench(new RecoveryStore()); source.gotoParagraph(2, 1);
      const incoming = source.document('reading'); incoming.revision = 4;
      const accepted = work.commitIncoming(incoming, true); const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      expect(accepted).assertTrue(); expect(work.document('reading').revision).assertEqual(5);
      expect(work.document('note').state.note.body).assertEqual('不能覆盖'); expect(work.document('form').state.form.address).assertEqual('待保存地址');
      expect(reopened.document('reading').state.reading.chapter).assertEqual(2); expect(reopened.document('form').state.form.address).assertEqual('');
      expect(work.hasDirtyWork()).assertTrue();
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_1100
     * @tc.name      testSceneRecoveryBatchTwo0011
     * @tc.desc      恢复笔记历史不保存其它场景的临时修改
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0011', 0, (): void => {
      const store = new RecoveryStore(); const work = new SceneWorkbench(store);
      work.editNote('第一版', '甲正文', 0, 1); work.saveNote(); work.editNote('第二版', '乙正文', 1, 2); work.saveNote();
      work.gotoParagraph(1, 1); work.setFormField('note', '临时备注'); const restored = work.restoreHistory(0);
      const reopened = new SceneWorkbench(new RecoveryStore(store.disk));
      expect(restored).assertTrue(); expect(work.snapshot().revision).assertEqual(3); expect(work.snapshot().noteBody).assertEqual('甲正文');
      expect(work.document('reading').state.reading.anchor).assertEqual(1); expect(work.document('form').state.form.note).assertEqual('临时备注');
      expect(reopened.document('reading').state.reading.chapter).assertEqual(0); expect(reopened.document('form').state.form.note).assertEqual('');
      expect(work.historyDocuments()[1].state.note.body).assertEqual('乙正文');
      work.dispose();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENERECOVERYB2_1200
     * @tc.name      testSceneRecoveryBatchTwo0012
     * @tc.desc      修订上限拒绝保存与冲突接纳且不触碰存储
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneRecoveryBatchTwo0012', 0, (): void => {
      const seed = new SceneWorkbench(new RecoveryStore()); const incoming = seed.document('note');
      incoming.revision = REVISION_LIMIT; const root = stageScene(emptyWorkspace(), incoming, 'note');
      const store = new RecoveryStore(encodeWorkspace(root)); const work = new SceneWorkbench(store);
      work.editNote('上限草稿', '保留编辑', 0, 2); const saved = work.saveNote(); const accepted = work.commitIncoming(incoming, true);
      expect(saved).assertFalse(); expect(accepted).assertFalse(); expect(store.puts).assertEqual(0);
      expect(work.snapshot().revision).assertEqual(REVISION_LIMIT); expect(work.snapshot().noteTitle).assertEqual('上限草稿');
      expect(work.snapshot().noteDirty).assertTrue(); expect(work.historyDocuments().length).assertEqual(0);
      work.dispose();
    });

  });
}
