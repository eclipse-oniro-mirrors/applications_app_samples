import { describe, expect, it } from '@ohos/hypium';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  REVISION_LIMIT,
  emptyWorkspace,
  encodeWorkspace,
  stageScene
} from '../../../main/ets/learning/scene/SceneModel';
import { WaveSceneStore, fillWaveForm, waveNote, waveReading } from '../support/ContinuationWaveOneFixtures';

export default function continuationWorkbenchWaveOne(): void {
  describe('ContinuationWorkbenchWaveOne', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0100
     * @tc.name testContinuationWorkbenchWaveOne0001
     * @tc.desc 仅选区改变也阻止切换，放弃后恢复保存的选区
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0001', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('标题', 'A😀BC', 1, 3); work.saveNote(); const raw = store.stored();
      work.editNote('标题', 'A😀BC', 3, 4);
      expect(work.snapshot().noteDirty).assertTrue(); expect(work.open('reading')).assertFalse();
      work.discardNote();
      expect(work.snapshot().noteSelectionStart).assertEqual(1);
      expect(work.snapshot().noteSelectionEnd).assertEqual(3);
      expect(work.open('reading')).assertTrue(); expect(store.stored()).assertEqual(raw);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0200
     * @tc.name testContinuationWorkbenchWaveOne0002
     * @tc.desc 仅修改标题保存时保留正文选区并将前一标题写入历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0002', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('原题', 'A😀BC', 1, 3); work.saveNote();
      work.editNote('新题', 'A😀BC', 1, 3); const dirty = work.hasDirtyWork(); const saved = work.saveNote();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(dirty).assertTrue(); expect(saved).assertTrue(); expect(reopened.snapshot().noteTitle).assertEqual('新题');
      expect(reopened.snapshot().noteSavedBody).assertEqual('A😀BC');
      expect(reopened.snapshot().noteSelectionEnd).assertEqual(3);
      expect(work.historyDocuments()[0].state.note.title).assertEqual('原题');
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0300
     * @tc.name testContinuationWorkbenchWaveOne0003
     * @tc.desc 笔记非法标题正文和选区均不能部分覆盖正在编辑的版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0003', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('基线', '旧正文', 0, 2); work.saveNote(); const raw = store.stored();
      work.editNote('保留草稿', 'A😀BC', 1, 3);
      expect(work.editNote('x'.repeat(81), '替换正文', 0, 1)).assertFalse();
      expect(work.editNote('坏正文', '\uD800', 0, 0)).assertFalse();
      expect(work.editNote('坏选区', 'A😀BC', 2, 3)).assertFalse();
      expect(work.snapshot().noteTitle).assertEqual('保留草稿'); expect(work.snapshot().noteSelectionStart).assertEqual(1);
      expect(store.stored()).assertEqual(raw); expect(work.snapshot().revision).assertEqual(1);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0400
     * @tc.name testContinuationWorkbenchWaveOne0004
     * @tc.desc 未知业务场景不切换，随后合法打开可以清除错误
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0004', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      expect(work.open('whiteboard')).assertFalse(); expect(work.snapshot().active).assertEqual('note');
      expect(work.snapshot().error).assertEqual('未知场景');
      expect(work.open('form')).assertTrue(); expect(work.snapshot().error).assertEqual('');
      expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0500
     * @tc.name testContinuationWorkbenchWaveOne0005
     * @tc.desc 阅读首尾拒绝越界而不隐式跨章，合法相邻移动可保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0005', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      expect(work.previousParagraph()).assertFalse(); expect(work.snapshot().readingAnchor).assertEqual(0);
      work.gotoParagraph(1, 2); expect(work.nextParagraph()).assertFalse();
      expect(work.snapshot().readingChapter).assertEqual(1); expect(work.previousParagraph()).assertTrue();
      work.saveReading(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().readingAnchor).assertEqual(1); expect(reopened.snapshot().readingDirty).assertFalse();
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0600
     * @tc.name testContinuationWorkbenchWaveOne0006
     * @tc.desc 返回已收藏位置不能重复添加书签或污染保存版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0006', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.gotoParagraph(1, 1); work.addBookmark(); work.saveReading(); const raw = store.stored();
      work.gotoParagraph(2, 0); work.gotoParagraph(1, 1);
      expect(work.addBookmark()).assertFalse(); expect(work.snapshot().bookmarks.length).assertEqual(1);
      expect(work.snapshot().error).assertEqual('书签重复或已达上限'); expect(work.snapshot().readingDirty).assertFalse();
      expect(store.stored()).assertEqual(raw); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0700
     * @tc.name testContinuationWorkbenchWaveOne0007
     * @tc.desc 删除中间书签保持两侧次序且重开后只保留剩余位置
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0007', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.addBookmark();
      work.gotoParagraph(1, 1);
      work.addBookmark();
      work.gotoParagraph(2, 2);
      work.addBookmark();
      work.saveReading();
      expect(work.removeBookmark(1)).assertTrue(); expect(work.snapshot().readingDirty).assertTrue();
      work.saveReading(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().bookmarks.length).assertEqual(2);
      expect(reopened.snapshot().bookmarks[0].chapter).assertEqual(0);
      expect(reopened.snapshot().bookmarks[1].chapter).assertEqual(2);
      expect(work.historyDocuments()[0].state.reading.bookmarks.length).assertEqual(3);
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0800
     * @tc.name testContinuationWorkbenchWaveOne0008
     * @tc.desc 非整数或越界书签索引不能删除，合法删除可清错并清空收藏
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0008', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.gotoParagraph(2, 1); work.addBookmark(); work.saveReading();
      expect(work.removeBookmark(-1)).assertFalse();
      expect(work.removeBookmark(0.5)).assertFalse();
      expect(work.removeBookmark(1)).assertFalse();
      expect(work.snapshot().bookmarks[0].anchor).assertEqual(1); expect(store.putCalls).assertEqual(1);
      expect(work.removeBookmark(0)).assertTrue(); expect(work.snapshot().error).assertEqual('');
      work.saveReading(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().bookmarks.length).assertEqual(0); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0900
     * @tc.name testContinuationWorkbenchWaveOne0009
     * @tc.desc 阅读进度返回保存位置即恢复干净状态无需额外写入才能切换
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0009', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.gotoParagraph(1, 1); work.saveReading(); work.gotoParagraph(2, 2);
      expect(work.snapshot().readingDirty).assertTrue(); expect(work.open('note')).assertFalse();
      work.gotoParagraph(1, 1); expect(work.hasDirtyWork()).assertFalse(); expect(work.open('note')).assertTrue();
      expect(store.putCalls).assertEqual(1); expect(work.document('reading').revision).assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1000
     * @tc.name testContinuationWorkbenchWaveOne0010
     * @tc.desc 已确认表单修改字段后取消确认，保存为可继续编辑的草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0010', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.confirmForm();
      expect(work.setFormField('address', '新地址二号')).assertTrue(); expect(work.snapshot().formConfirmed).assertFalse();
      expect(work.snapshot().formDirty).assertTrue(); work.saveForm();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().formAddress).assertEqual('新地址二号');
      expect(reopened.snapshot().formConfirmed).assertFalse();
      expect(work.historyDocuments()[0].state.form.confirmed).assertTrue(); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1100
     * @tc.name testContinuationWorkbenchWaveOne0011
     * @tc.desc 撤销表单同意后不能再次确认，草稿持久化保留撤销状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0011', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.confirmForm();
      work.setFormAgreed(false); expect(work.confirmForm()).assertFalse(); expect(store.putCalls).assertEqual(1);
      expect(work.snapshot().formStepIssues.join('|')).assertEqual('需要确认信息无误'); work.saveForm();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().formAgreed).assertFalse(); expect(reopened.snapshot().formConfirmed).assertFalse();
      expect(reopened.snapshot().revision).assertEqual(2); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1200
     * @tc.name testContinuationWorkbenchWaveOne0012
     * @tc.desc 回到首步可修复后来清空的资料，向前时重新检查前置步骤
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0012', 0, (): void => {
      const work = new SceneWorkbench(new WaveSceneStore());
      work.open('form');
      fillWaveForm(work);
      work.saveForm();
      work.setFormField('name', '');
      expect(work.gotoFormStep(0)).assertTrue();
      expect(work.nextFormStep()).assertFalse();
      expect(work.snapshot().formStep).assertEqual(0);
      work.setFormField('name', '重新填写');
      expect(work.gotoFormStep(2)).assertTrue();
      expect(work.previousFormStep()).assertTrue();
      expect(work.snapshot().formStep).assertEqual(1);
      expect(work.snapshot().formName).assertEqual('重新填写');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1300
     * @tc.name testContinuationWorkbenchWaveOne0013
     * @tc.desc 非法步骤不移动业务位置或写存储，合法后退仍可继续
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0013', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.saveForm();
      expect(work.gotoFormStep(-1)).assertFalse();
      expect(work.gotoFormStep(1.5)).assertFalse();
      expect(work.gotoFormStep(3)).assertFalse();
      expect(work.snapshot().formStep).assertEqual(2); expect(store.putCalls).assertEqual(1);
      expect(work.previousFormStep()).assertTrue();
      expect(work.snapshot().formStepLabel).assertEqual('联系方式');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1400
     * @tc.name testContinuationWorkbenchWaveOne0014
     * @tc.desc 非法字段和值不会将已确认表单变为草稿或修改有效内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0014', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.confirmForm();
      expect(work.setFormField('unknown', '误填')).assertFalse();
      expect(work.setFormField('phone', '1'.repeat(21))).assertFalse();
      expect(work.setFormField('address', '址'.repeat(101))).assertFalse();
      expect(work.setFormField('note', '\uDC00')).assertFalse();
      expect(work.snapshot().formConfirmed).assertTrue(); expect(work.snapshot().formPhone).assertEqual('13800138000');
      expect(work.snapshot().formDirty).assertFalse(); expect(store.putCalls).assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1500
     * @tc.name testContinuationWorkbenchWaveOne0015
     * @tc.desc 非法历史索引不能覆盖当前未保存编辑或制造新历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0015', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('甲', '甲正文', 0, 1); work.saveNote(); work.editNote('乙', '乙正文', 1, 2); work.saveNote();
      work.editNote('草稿', '待保留', 0, 2); const raw = store.stored();
      expect(work.restoreHistory(-1)).assertFalse();
      expect(work.restoreHistory(0.5)).assertFalse();
      expect(work.restoreHistory(1)).assertFalse();
      expect(work.snapshot().noteBody).assertEqual('待保留');
      expect(work.historyDocuments()[0].state.note.body).assertEqual('甲正文');
      expect(store.stored()).assertEqual(raw); expect(work.snapshot().revision).assertEqual(2); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1600
     * @tc.name testContinuationWorkbenchWaveOne0016
     * @tc.desc 业务文档历史和快照的外部嵌套修改不会污染真实工作区
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0016', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.addBookmark(); work.saveReading(); work.gotoParagraph(1, 1); work.addBookmark(); work.saveReading();
      const document = work.document('reading'); document.state.reading.bookmarks[0].chapter = 2;
      const history = work.historyDocuments(); history[0].state.reading.anchor = 2;
      const snapshot = work.snapshot(); snapshot.bookmarks.splice(0, 2);
      expect(work.document('reading').state.reading.bookmarks[0].chapter).assertEqual(0);
      expect(work.historyDocuments()[0].state.reading.anchor).assertEqual(0);
      expect(work.snapshot().bookmarks.length).assertEqual(2);
      expect(work.hasDirtyWork()).assertFalse(); expect(store.putCalls).assertEqual(2); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1700
     * @tc.name testContinuationWorkbenchWaveOne0017
     * @tc.desc 候选快照只展示远端笔记不会替换本机编辑身份或保存状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0017', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('本机标题', '本机草稿', 0, 2); const local = work.document('note');
      const incoming = waveNote('preview-doc', 8, '远端保存正文');
      incoming.state.note.body = '远端未保存';
      incoming.state.note.selectionEnd = 2;
      const preview = work.snapshot(incoming);
      expect(preview.noteBody).assertEqual('远端未保存');
      expect(preview.noteDirty).assertTrue();
      expect(preview.revision).assertEqual(8);
      expect(work.snapshot().noteTitle).assertEqual('本机标题');
      expect(work.document('note').documentId).assertEqual(local.documentId);
      expect(store.putCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1800
     * @tc.name testContinuationWorkbenchWaveOne0018
     * @tc.desc 同文档同修订同状态直接接收不产生冲突或重复历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0018', 0, (): void => {
      const root = stageScene(emptyWorkspace(), waveNote('same-doc', 2), 'note');
      const store = new WaveSceneStore(encodeWorkspace(root));
      const work = new SceneWorkbench(store);
      const incoming = work.document('note');
      incoming.transferId = 'new-delivery';
      expect(work.conflictReason(incoming)).assertEqual(''); expect(work.commitIncoming(incoming, false)).assertTrue();
      expect(work.snapshot().revision).assertEqual(2); expect(work.historyDocuments().length).assertEqual(0);
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.document('note').transferId).assertEqual('new-delivery');
      expect(reopened.hasDirtyWork()).assertFalse();
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1900
     * @tc.name testContinuationWorkbenchWaveOne0019
     * @tc.desc 干净本机遇同文档旧修订不同状态需选择，接纳后沿本机修订递增
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0019', 0, (): void => {
      const root = stageScene(emptyWorkspace(), waveNote('old-doc', 7, '本机已保存'), 'note');
      const store = new WaveSceneStore(encodeWorkspace(root));
      const work = new SceneWorkbench(store);
      const incoming = waveNote('old-doc', 3, '远端旧正文');
      expect(work.conflictReason(incoming)).assertEqual('同文档旧修订或同号不同状态，需明确选择。');
      expect(work.commitIncoming(incoming, true)).assertTrue(); expect(work.snapshot().revision).assertEqual(8);
      expect(work.snapshot().noteBody).assertEqual('远端旧正文'); expect(work.historyDocuments()[0].revision).assertEqual(7);
      expect(work.historyDocuments()[0].state.note.body).assertEqual('本机已保存'); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_2000
     * @tc.name testContinuationWorkbenchWaveOne0020
     * @tc.desc 干净同文档新修订可直接提交，保留远端修订和真实本机历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0020', 0, (): void => {
      const root = stageScene(emptyWorkspace(), waveNote('newer-doc', 2, '本机基线'), 'note');
      const store = new WaveSceneStore(encodeWorkspace(root));
      const work = new SceneWorkbench(store);
      const incoming = waveNote('newer-doc', 9, '新修订内容');
      expect(work.conflictReason(incoming)).assertEqual(''); expect(work.commitIncoming(incoming, false)).assertTrue();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().revision).assertEqual(9);
      expect(reopened.snapshot().noteSavedBody).assertEqual('新修订内容');
      expect(reopened.historyDocuments()[0].revision).assertEqual(2);
      expect(work.hasDirtyWork()).assertFalse();
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_2100
     * @tc.name testContinuationWorkbenchWaveOne0021
     * @tc.desc 替换笔记身份只清除笔记历史而保留阅读文档及其旧版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0021', 0, (): void => {
      let root = stageScene(emptyWorkspace(), waveNote('old-note', 1), 'note');
      root = stageScene(root, waveNote('old-note', 2), 'note');
      root = stageScene(root, waveReading('keep-reading', 1), 'reading');
      root = stageScene(root, waveReading('keep-reading', 2, 1, 1), 'reading');
      const store = new WaveSceneStore(encodeWorkspace(root)); const work = new SceneWorkbench(store);
      expect(work.commitIncoming(waveNote('replacement-note', 1, '独立文档'), true)).assertTrue();
      expect(work.document('note').revision).assertEqual(2); expect(work.historyDocuments().length).assertEqual(1);
      expect(work.historyDocuments()[0].documentId).assertEqual('keep-reading');
      expect(work.document('reading').state.reading.anchor).assertEqual(1);
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.document('note').documentId).assertEqual('replacement-note');
      expect(reopened.historyDocuments()[0].revision).assertEqual(1);
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_2200
     * @tc.name testContinuationWorkbenchWaveOne0022
     * @tc.desc 无冲突直接接收修订上限不提前加号，随后编辑保存仍保护远端存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationWorkbenchWaveOne0022', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      const incoming = waveNote('limit-doc', REVISION_LIMIT, '上限正文');
      expect(work.commitIncoming(incoming, false)).assertTrue(); const raw = store.stored();
      work.editNote('上限后草稿', '仍可编辑', 0, 1); expect(work.saveNote()).assertFalse();
      expect(work.snapshot().revision).assertEqual(REVISION_LIMIT);
      expect(work.snapshot().noteSavedBody).assertEqual('上限正文');
      expect(store.stored()).assertEqual(raw); expect(work.snapshot().noteBody).assertEqual('仍可编辑'); work.dispose();
    });
  });
}
