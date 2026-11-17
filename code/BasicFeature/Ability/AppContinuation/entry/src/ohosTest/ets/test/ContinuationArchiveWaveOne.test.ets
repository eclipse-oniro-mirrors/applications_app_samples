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
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  SceneWorkspace,
  decodeScene,
  decodeWorkspace,
  emptyWorkspace,
  encodeScene,
  encodeWorkspace,
  findScene
} from '../../../main/ets/learning/scene/SceneModel';
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
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0001
     * @tc.desc 旧笔记缺省保存标题和选区时可放弃草稿并继续保存重开
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0001', 0, (): void => {
      const document = waveNote('legacy-note', 4, '保存🌱');
      document.state.note.body = '临时正文';
      document.state.note.selectionEnd = 2;
      const legacy = encodeScene(document)
        .replace(/,"savedTitle":"[^"]*"/, '')
        .replace(/,"savedSelectionStart":\d+/, '')
        .replace(/,"savedSelectionEnd":\d+/, '');
      const store = new WaveSceneStore(wire([legacy])); const work = new SceneWorkbench(store); work.discardNote();
      loggedExpect(work.snapshot().noteBody, 'ContinuationArchiveWaveOne.test.ets:A0001', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertEqual('保存🌱'); loggedExpect(work.snapshot().noteSelectionStart, 'ContinuationArchiveWaveOne.test.ets:A0002', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertEqual(4);
      loggedExpect(work.snapshot().noteSelectionEnd, 'ContinuationArchiveWaveOne.test.ets:A0003', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertEqual(4); loggedExpect(work.snapshot().noteDirty, 'ContinuationArchiveWaveOne.test.ets:A0004', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertFalse();
      loggedExpect(work.saveNote(), 'ContinuationArchiveWaveOne.test.ets:A0005', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertTrue(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().revision, 'ContinuationArchiveWaveOne.test.ets:A0006', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertEqual(5);
      loggedExpect(reopened.snapshot().noteTitle, 'ContinuationArchiveWaveOne.test.ets:A0007', BUNDLE + '_ContinuationArchiveWaveOne_0001').assertEqual('保存标题');
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0200
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0002
     * @tc.desc 当前选区合法但保存选区截断代理对时拒绝整档且不覆盖原磁盘
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0002', 0, (): void => {
      const bad = waveNote('saved-selection', 2, '😀保存'); bad.state.note.body = '合法当前'; bad.state.note.selectionEnd = 2;
      bad.state.note.savedSelectionStart = 1; bad.state.note.savedSelectionEnd = 2;
      const raw = wire([encodeScene(bad)]);
      const store = new WaveSceneStore(raw);
      const work = new SceneWorkbench(store);
      loggedExpect(decodeScene(encodeScene(bad)).value === undefined, 'ContinuationArchiveWaveOne.test.ets:A0008', BUNDLE + '_ContinuationArchiveWaveOne_0002').assertTrue();
      loggedExpect(work.snapshot().storageFrozen, 'ContinuationArchiveWaveOne.test.ets:A0009', BUNDLE + '_ContinuationArchiveWaveOne_0002').assertTrue();
      work.editNote('内存救援', '保留内容', 0, 2); loggedExpect(work.saveNote(), 'ContinuationArchiveWaveOne.test.ets:A0010', BUNDLE + '_ContinuationArchiveWaveOne_0002').assertFalse();
      loggedExpect(work.snapshot().noteBody, 'ContinuationArchiveWaveOne.test.ets:A0011', BUNDLE + '_ContinuationArchiveWaveOne_0002').assertEqual('保留内容');
      loggedExpect(store.putCalls, 'ContinuationArchiveWaveOne.test.ets:A0012', BUNDLE + '_ContinuationArchiveWaveOne_0002').assertEqual(0);
      loggedExpect(store.stored(), 'ContinuationArchiveWaveOne.test.ets:A0013', BUNDLE + '_ContinuationArchiveWaveOne_0002').assertEqual(raw);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0300
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0003
     * @tc.desc 旧表单缺省保存步骤和确认标记时从当前步骤恢复并可继续编辑保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0003', 0, (): void => {
      const source = new SceneWorkbench(new WaveSceneStore());
      fillWaveForm(source);
      const document = source.document('form');
      document.revision = 3;
      const legacy = encodeScene(document).replace(/,"savedStep":\d+/, '').replace(/,"confirmed":false/, '');
      const store = new WaveSceneStore(wire([legacy], [], 'form')); const work = new SceneWorkbench(store);
      loggedExpect(work.document('form').state.form.savedStep, 'ContinuationArchiveWaveOne.test.ets:A0014', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertEqual(2);
      loggedExpect(work.snapshot().formConfirmed, 'ContinuationArchiveWaveOne.test.ets:A0015', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertFalse();
      loggedExpect(work.previousFormStep(), 'ContinuationArchiveWaveOne.test.ets:A0016', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertTrue();
      work.saveForm();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().formStep, 'ContinuationArchiveWaveOne.test.ets:A0017', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertEqual(1);
      loggedExpect(reopened.document('form').state.form.savedStep, 'ContinuationArchiveWaveOne.test.ets:A0018', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertEqual(1);
      loggedExpect(reopened.snapshot().formName, 'ContinuationArchiveWaveOne.test.ets:A0019', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertEqual('接续用户'); loggedExpect(reopened.snapshot().revision, 'ContinuationArchiveWaveOne.test.ets:A0020', BUNDLE + '_ContinuationArchiveWaveOne_0003').assertEqual(4);
      source.dispose(); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0400
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0004
     * @tc.desc 两个同场景文档头不能静默选取其一，原档保留且禁止重置覆盖
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0004', 0, (): void => {
      const raw = wire([encodeScene(waveNote('first-head', 1, '甲')), encodeScene(waveNote('second-head', 8, '乙'))]);
      const store = new WaveSceneStore(raw); const work = new SceneWorkbench(store);
      loggedExpect(decodeWorkspace(raw) === undefined, 'ContinuationArchiveWaveOne.test.ets:A0021', BUNDLE + '_ContinuationArchiveWaveOne_0004').assertTrue(); loggedExpect(work.resetWorkspace(), 'ContinuationArchiveWaveOne.test.ets:A0022', BUNDLE + '_ContinuationArchiveWaveOne_0004').assertFalse();
      loggedExpect(work.snapshot().noteBody, 'ContinuationArchiveWaveOne.test.ets:A0023', BUNDLE + '_ContinuationArchiveWaveOne_0004').assertEqual(''); loggedExpect(work.snapshot().storageFrozen, 'ContinuationArchiveWaveOne.test.ets:A0024', BUNDLE + '_ContinuationArchiveWaveOne_0004').assertTrue();
      loggedExpect(store.stored(), 'ContinuationArchiveWaveOne.test.ets:A0025', BUNDLE + '_ContinuationArchiveWaveOne_0004').assertEqual(raw); loggedExpect(store.flushCalls, 'ContinuationArchiveWaveOne.test.ets:A0026', BUNDLE + '_ContinuationArchiveWaveOne_0004').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0500
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0005
     * @tc.desc 无文档头的孤立历史不能恢复，合法空工作区仍可新建保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0005', 0, (): void => {
      const raw = wire([], [encodeScene(waveReading('orphan-reading', 1, 1, 2))], 'text');
      const store = new WaveSceneStore(raw); const work = new SceneWorkbench(store); work.gotoParagraph(2, 0);
      loggedExpect(work.saveReading(), 'ContinuationArchiveWaveOne.test.ets:A0027', BUNDLE + '_ContinuationArchiveWaveOne_0005').assertFalse();
      loggedExpect(work.historyDocuments().length, 'ContinuationArchiveWaveOne.test.ets:A0028', BUNDLE + '_ContinuationArchiveWaveOne_0005').assertEqual(0);
      loggedExpect(store.stored(), 'ContinuationArchiveWaveOne.test.ets:A0029', BUNDLE + '_ContinuationArchiveWaveOne_0005').assertEqual(raw);
      const cleanStore = new WaveSceneStore(encodeWorkspace(emptyWorkspace()));
      const clean = new SceneWorkbench(cleanStore);
      loggedExpect(clean.saveReading(), 'ContinuationArchiveWaveOne.test.ets:A0030', BUNDLE + '_ContinuationArchiveWaveOne_0005').assertTrue();
      loggedExpect(clean.snapshot().storageFrozen, 'ContinuationArchiveWaveOne.test.ets:A0031', BUNDLE + '_ContinuationArchiveWaveOne_0005').assertFalse();
      loggedExpect(clean.document('reading').revision, 'ContinuationArchiveWaveOne.test.ets:A0032', BUNDLE + '_ContinuationArchiveWaveOne_0005').assertEqual(1);
      work.dispose(); clean.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0600
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0006
     * @tc.desc 历史必须归属同场景当前身份，合法跨场景历史仍能独立读取
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0006', 0, (): void => {
      const note = waveNote('note-head', 4); const reading = waveReading('read-head', 3, 2, 1);
      const valid = wire(
        [encodeScene(note), encodeScene(reading)],
        [encodeScene(waveNote('note-head', 1)), encodeScene(waveReading('read-head', 2))]
      );
      const accepted = decodeWorkspace(valid) as SceneWorkspace;
      loggedExpect(accepted.history.length, 'ContinuationArchiveWaveOne.test.ets:A0033', BUNDLE + '_ContinuationArchiveWaveOne_0006').assertEqual(2); loggedExpect(findScene(accepted, 'reading')?.revision, 'ContinuationArchiveWaveOne.test.ets:A0034', BUNDLE + '_ContinuationArchiveWaveOne_0006').assertEqual(3);
      const wrong = wire(
        [encodeScene(note), encodeScene(reading)],
        [encodeScene(waveNote('foreign-note', 1)), encodeScene(waveReading('read-head', 2))]
      );
      const store = new WaveSceneStore(wrong); const work = new SceneWorkbench(store);
      loggedExpect(work.snapshot().storageFrozen, 'ContinuationArchiveWaveOne.test.ets:A0035', BUNDLE + '_ContinuationArchiveWaveOne_0006').assertTrue();
      loggedExpect(work.saveNote(), 'ContinuationArchiveWaveOne.test.ets:A0036', BUNDLE + '_ContinuationArchiveWaveOne_0006').assertFalse();
      loggedExpect(store.stored(), 'ContinuationArchiveWaveOne.test.ets:A0037', BUNDLE + '_ContinuationArchiveWaveOne_0006').assertEqual(wrong);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0700
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0007
     * @tc.desc 同号或更高号历史均不能冒充旧版本，拒绝后内存不暴露伪历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0007', 0, (): void => {
      const head = encodeScene(waveNote('ordered-note', 3));
      const same = wire([head], [encodeScene(waveNote('ordered-note', 3, '伪同号'))]);
      const future = wire([head], [encodeScene(waveNote('ordered-note', 4, '伪未来'))]);
      loggedExpect(decodeWorkspace(same) === undefined, 'ContinuationArchiveWaveOne.test.ets:A0038', BUNDLE + '_ContinuationArchiveWaveOne_0007').assertTrue();
      loggedExpect(decodeWorkspace(future) === undefined, 'ContinuationArchiveWaveOne.test.ets:A0039', BUNDLE + '_ContinuationArchiveWaveOne_0007').assertTrue();
      const store = new WaveSceneStore(future); const work = new SceneWorkbench(store);
      loggedExpect(work.historyDocuments().length, 'ContinuationArchiveWaveOne.test.ets:A0040', BUNDLE + '_ContinuationArchiveWaveOne_0007').assertEqual(0); loggedExpect(work.restoreHistory(0), 'ContinuationArchiveWaveOne.test.ets:A0041', BUNDLE + '_ContinuationArchiveWaveOne_0007').assertFalse();
      loggedExpect(store.putCalls, 'ContinuationArchiveWaveOne.test.ets:A0042', BUNDLE + '_ContinuationArchiveWaveOne_0007').assertEqual(0); loggedExpect(work.snapshot().storageFrozen, 'ContinuationArchiveWaveOne.test.ets:A0043', BUNDLE + '_ContinuationArchiveWaveOne_0007').assertTrue(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0800
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0008
     * @tc.desc 外部存档单场景六条历史即使总量未超限也拒绝，五条可恢复最旧内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0008', 0, (): void => {
      const rows: string[] = [];
      for (let revision: number = 1; revision <= 5; revision++) {
        rows.push(encodeScene(waveNote('quota-note', revision, `正文${revision}`)));
      }
      const head = encodeScene(waveNote('quota-note', 7, '当前正文'));
      const valid = wire([head], rows); const store = new WaveSceneStore(valid); const work = new SceneWorkbench(store);
      loggedExpect(work.restoreHistory(0), 'ContinuationArchiveWaveOne.test.ets:A0044', BUNDLE + '_ContinuationArchiveWaveOne_0008').assertTrue();
      loggedExpect(work.snapshot().noteBody, 'ContinuationArchiveWaveOne.test.ets:A0045', BUNDLE + '_ContinuationArchiveWaveOne_0008').assertEqual('正文1');
      loggedExpect(work.snapshot().revision, 'ContinuationArchiveWaveOne.test.ets:A0046', BUNDLE + '_ContinuationArchiveWaveOne_0008').assertEqual(8);
      rows.push(encodeScene(waveNote('quota-note', 6, '第六历史')));
      loggedExpect(decodeWorkspace(wire([head], rows)) === undefined, 'ContinuationArchiveWaveOne.test.ets:A0047', BUNDLE + '_ContinuationArchiveWaveOne_0008').assertTrue();
      loggedExpect(work.historyDocuments()[4].state.note.body, 'ContinuationArchiveWaveOne.test.ets:A0048', BUNDLE + '_ContinuationArchiveWaveOne_0008').assertEqual('当前正文'); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_0900
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0009
     * @tc.desc 表单可选元数据缺省兼容不表示非法保存步骤或确认类型可接受
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0009', 0, (): void => {
      const source = new SceneWorkbench(new WaveSceneStore()); fillWaveForm(source); source.confirmForm();
      const good = encodeScene(source.document('form'));
      const badStep = good.replace('"savedStep":2', '"savedStep":-1');
      const badConfirmed = good.replace('"confirmed":true', '"confirmed":"true"');
      loggedExpect(decodeScene(badStep).value === undefined, 'ContinuationArchiveWaveOne.test.ets:A0049', BUNDLE + '_ContinuationArchiveWaveOne_0009').assertTrue();
      loggedExpect(decodeScene(badConfirmed).value === undefined, 'ContinuationArchiveWaveOne.test.ets:A0050', BUNDLE + '_ContinuationArchiveWaveOne_0009').assertTrue();
      const raw = wire([badStep], [], 'form');
      const store = new WaveSceneStore(raw);
      const work = new SceneWorkbench(store);
      loggedExpect(work.snapshot().storageFrozen, 'ContinuationArchiveWaveOne.test.ets:A0051', BUNDLE + '_ContinuationArchiveWaveOne_0009').assertTrue();
      loggedExpect(work.saveForm(), 'ContinuationArchiveWaveOne.test.ets:A0052', BUNDLE + '_ContinuationArchiveWaveOne_0009').assertFalse();
      loggedExpect(store.stored(), 'ContinuationArchiveWaveOne.test.ets:A0053', BUNDLE + '_ContinuationArchiveWaveOne_0009').assertEqual(raw);
      source.dispose(); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_ARCHIVEWAVEONE_1000
     * @tc.name com.samples.appcontinuation_ContinuationArchiveWaveOne_0010
     * @tc.desc 不同打包书籍版本的阅读进度不能加载或覆盖，当前书籍仍可恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationArchiveWaveOne_0010', 0, (): void => {
      const document = waveReading('book-progress', 4, 2, 1); const good = encodeScene(document);
      const foreign = good.replace('continuation-handbook-1', 'continuation-handbook-2');
      loggedExpect(decodeScene(foreign).value === undefined, 'ContinuationArchiveWaveOne.test.ets:A0054', BUNDLE + '_ContinuationArchiveWaveOne_0010').assertTrue();
      const store = new WaveSceneStore(wire([foreign], [], 'reading')); const work = new SceneWorkbench(store);
      loggedExpect(work.saveReading(), 'ContinuationArchiveWaveOne.test.ets:A0055', BUNDLE + '_ContinuationArchiveWaveOne_0010').assertFalse(); loggedExpect(store.putCalls, 'ContinuationArchiveWaveOne.test.ets:A0056', BUNDLE + '_ContinuationArchiveWaveOne_0010').assertEqual(0);
      const current = new SceneWorkbench(new WaveSceneStore(wire([good], [], 'reading')));
      loggedExpect(current.snapshot().readingChapter, 'ContinuationArchiveWaveOne.test.ets:A0057', BUNDLE + '_ContinuationArchiveWaveOne_0010').assertEqual(2); loggedExpect(current.snapshot().readingAnchor, 'ContinuationArchiveWaveOne.test.ets:A0058', BUNDLE + '_ContinuationArchiveWaveOne_0010').assertEqual(1);
      loggedExpect(current.snapshot().readingDirty, 'ContinuationArchiveWaveOne.test.ets:A0059', BUNDLE + '_ContinuationArchiveWaveOne_0010').assertFalse(); work.dispose(); current.dispose();
    });
  });
}
