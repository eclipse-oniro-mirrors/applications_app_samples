import { describe, expect, it } from '@ohos/hypium';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SceneWorkspace, decodeScene, decodeWorkspace, emptyWorkspace, encodeScene, encodeWorkspace, findScene } from '../../../main/ets/learning/scene/SceneModel';
import { WaveSceneStore, fillWaveForm, waveNote, waveReading } from '../support/ContinuationWaveOneFixtures';

interface ArchiveWire {
  version: number;
  active: string;
  documents: string[];
  history: string[];
}

/** Wire fixture for missing/corrupt properties; never substitutes any production validator. */
function wire(documents: string[], history: string[] = [], active: string = 'note'): string {
  const value: ArchiveWire = { version: 1, active: active, documents: documents, history: history };
  return JSON.stringify(value);
}

export default function continuationArchiveWaveOne(): void {
  describe('ContinuationArchiveWaveOne', (): void => {
    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0100
     * @tc.name testContinuationArchiveWaveOne0001
     * @tc.desc 旧笔记缺省保存标题和选区时可放弃草稿并继续保存重开
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0001', 0, (): void => {
      const document = waveNote('legacy-note', 4, '保存🌱'); document.state.note.body = '临时正文'; document.state.note.selectionEnd = 2;
      const legacy = encodeScene(document).replace(/,"savedTitle":"[^"]*"/, '').replace(/,"savedSelectionStart":\d+/, '').replace(/,"savedSelectionEnd":\d+/, '');
      const store = new WaveSceneStore(wire([legacy])); const work = new SceneWorkbench(store); work.discardNote();
      expect(work.snapshot().noteBody).assertEqual('保存🌱'); expect(work.snapshot().noteSelectionStart).assertEqual(4);
      expect(work.snapshot().noteSelectionEnd).assertEqual(4); expect(work.snapshot().noteDirty).assertFalse();
      expect(work.saveNote()).assertTrue(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().revision).assertEqual(5); expect(reopened.snapshot().noteTitle).assertEqual('保存标题'); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0200
     * @tc.name testContinuationArchiveWaveOne0002
     * @tc.desc 当前选区合法但保存选区截断代理对时拒绝整档且不覆盖原磁盘
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0002', 0, (): void => {
      const bad = waveNote('saved-selection', 2, '😀保存'); bad.state.note.body = '合法当前'; bad.state.note.selectionEnd = 2;
      bad.state.note.savedSelectionStart = 1; bad.state.note.savedSelectionEnd = 2;
      const raw = wire([encodeScene(bad)]); const store = new WaveSceneStore(raw); const work = new SceneWorkbench(store);
      expect(decodeScene(encodeScene(bad)).value === undefined).assertTrue(); expect(work.snapshot().storageFrozen).assertTrue();
      work.editNote('内存救援', '保留内容', 0, 2); expect(work.saveNote()).assertFalse();
      expect(work.snapshot().noteBody).assertEqual('保留内容'); expect(store.putCalls).assertEqual(0); expect(store.stored()).assertEqual(raw); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0300
     * @tc.name testContinuationArchiveWaveOne0003
     * @tc.desc 旧表单缺省保存步骤和确认标记时从当前步骤恢复并可继续编辑保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0003', 0, (): void => {
      const source = new SceneWorkbench(new WaveSceneStore()); fillWaveForm(source); const document = source.document('form'); document.revision = 3;
      const legacy = encodeScene(document).replace(/,"savedStep":\d+/, '').replace(/,"confirmed":false/, '');
      const store = new WaveSceneStore(wire([legacy], [], 'form')); const work = new SceneWorkbench(store);
      expect(work.document('form').state.form.savedStep).assertEqual(2); expect(work.snapshot().formConfirmed).assertFalse();
      expect(work.previousFormStep()).assertTrue(); work.saveForm(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      expect(reopened.snapshot().formStep).assertEqual(1); expect(reopened.document('form').state.form.savedStep).assertEqual(1);
      expect(reopened.snapshot().formName).assertEqual('接续用户'); expect(reopened.snapshot().revision).assertEqual(4);
      source.dispose(); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0400
     * @tc.name testContinuationArchiveWaveOne0004
     * @tc.desc 两个同场景文档头不能静默选取其一，原档保留且禁止重置覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0004', 0, (): void => {
      const raw = wire([encodeScene(waveNote('first-head', 1, '甲')), encodeScene(waveNote('second-head', 8, '乙'))]);
      const store = new WaveSceneStore(raw); const work = new SceneWorkbench(store);
      expect(decodeWorkspace(raw) === undefined).assertTrue(); expect(work.resetWorkspace()).assertFalse();
      expect(work.snapshot().noteBody).assertEqual(''); expect(work.snapshot().storageFrozen).assertTrue();
      expect(store.stored()).assertEqual(raw); expect(store.flushCalls).assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0500
     * @tc.name testContinuationArchiveWaveOne0005
     * @tc.desc 无文档头的孤立历史不能恢复，合法空工作区仍可新建保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0005', 0, (): void => {
      const raw = wire([], [encodeScene(waveReading('orphan-reading', 1, 1, 2))], 'text');
      const store = new WaveSceneStore(raw); const work = new SceneWorkbench(store); work.gotoParagraph(2, 0);
      expect(work.saveReading()).assertFalse(); expect(work.historyDocuments().length).assertEqual(0); expect(store.stored()).assertEqual(raw);
      const cleanStore = new WaveSceneStore(encodeWorkspace(emptyWorkspace())); const clean = new SceneWorkbench(cleanStore);
      expect(clean.saveReading()).assertTrue(); expect(clean.snapshot().storageFrozen).assertFalse(); expect(clean.document('reading').revision).assertEqual(1);
      work.dispose(); clean.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0600
     * @tc.name testContinuationArchiveWaveOne0006
     * @tc.desc 历史必须归属同场景当前身份，合法跨场景历史仍能独立读取
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0006', 0, (): void => {
      const note = waveNote('note-head', 4); const reading = waveReading('read-head', 3, 2, 1);
      const valid = wire([encodeScene(note), encodeScene(reading)], [encodeScene(waveNote('note-head', 1)), encodeScene(waveReading('read-head', 2))]);
      const accepted = decodeWorkspace(valid) as SceneWorkspace;
      expect(accepted.history.length).assertEqual(2); expect(findScene(accepted, 'reading')?.revision).assertEqual(3);
      const wrong = wire([encodeScene(note), encodeScene(reading)], [encodeScene(waveNote('foreign-note', 1)), encodeScene(waveReading('read-head', 2))]);
      const store = new WaveSceneStore(wrong); const work = new SceneWorkbench(store);
      expect(work.snapshot().storageFrozen).assertTrue(); expect(work.saveNote()).assertFalse(); expect(store.stored()).assertEqual(wrong);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0700
     * @tc.name testContinuationArchiveWaveOne0007
     * @tc.desc 同号或更高号历史均不能冒充旧版本，拒绝后内存不暴露伪历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0007', 0, (): void => {
      const head = encodeScene(waveNote('ordered-note', 3));
      const same = wire([head], [encodeScene(waveNote('ordered-note', 3, '伪同号'))]);
      const future = wire([head], [encodeScene(waveNote('ordered-note', 4, '伪未来'))]);
      expect(decodeWorkspace(same) === undefined).assertTrue(); expect(decodeWorkspace(future) === undefined).assertTrue();
      const store = new WaveSceneStore(future); const work = new SceneWorkbench(store);
      expect(work.historyDocuments().length).assertEqual(0); expect(work.restoreHistory(0)).assertFalse();
      expect(store.putCalls).assertEqual(0); expect(work.snapshot().storageFrozen).assertTrue(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0800
     * @tc.name testContinuationArchiveWaveOne0008
     * @tc.desc 外部存档单场景六条历史即使总量未超限也拒绝，五条可恢复最旧内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0008', 0, (): void => {
      const rows: string[] = [];
      for (let revision: number = 1; revision <= 5; revision++) { rows.push(encodeScene(waveNote('quota-note', revision, `正文${revision}`))); }
      const head = encodeScene(waveNote('quota-note', 7, '当前正文'));
      const valid = wire([head], rows); const store = new WaveSceneStore(valid); const work = new SceneWorkbench(store);
      expect(work.restoreHistory(0)).assertTrue(); expect(work.snapshot().noteBody).assertEqual('正文1'); expect(work.snapshot().revision).assertEqual(8);
      rows.push(encodeScene(waveNote('quota-note', 6, '第六历史')));
      expect(decodeWorkspace(wire([head], rows)) === undefined).assertTrue();
      expect(work.historyDocuments()[4].state.note.body).assertEqual('当前正文'); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0900
     * @tc.name testContinuationArchiveWaveOne0009
     * @tc.desc 表单可选元数据缺省兼容不表示非法保存步骤或确认类型可接受
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0009', 0, (): void => {
      const source = new SceneWorkbench(new WaveSceneStore()); fillWaveForm(source); source.confirmForm();
      const good = encodeScene(source.document('form'));
      const badStep = good.replace('"savedStep":2', '"savedStep":-1');
      const badConfirmed = good.replace('"confirmed":true', '"confirmed":"true"');
      expect(decodeScene(badStep).value === undefined).assertTrue(); expect(decodeScene(badConfirmed).value === undefined).assertTrue();
      const raw = wire([badStep], [], 'form'); const store = new WaveSceneStore(raw); const work = new SceneWorkbench(store);
      expect(work.snapshot().storageFrozen).assertTrue(); expect(work.saveForm()).assertFalse(); expect(store.stored()).assertEqual(raw);
      source.dispose(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_1000
     * @tc.name testContinuationArchiveWaveOne0010
     * @tc.desc 不同打包书籍版本的阅读进度不能加载或覆盖，当前书籍仍可恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContinuationArchiveWaveOne0010', 0, (): void => {
      const document = waveReading('book-progress', 4, 2, 1); const good = encodeScene(document);
      const foreign = good.replace('continuation-handbook-1', 'continuation-handbook-2');
      expect(decodeScene(foreign).value === undefined).assertTrue();
      const store = new WaveSceneStore(wire([foreign], [], 'reading')); const work = new SceneWorkbench(store);
      expect(work.saveReading()).assertFalse(); expect(store.putCalls).assertEqual(0);
      const current = new SceneWorkbench(new WaveSceneStore(wire([good], [], 'reading')));
      expect(current.snapshot().readingChapter).assertEqual(2); expect(current.snapshot().readingAnchor).assertEqual(1);
      expect(current.snapshot().readingDirty).assertFalse(); work.dispose(); current.dispose();
    });
  });
}
