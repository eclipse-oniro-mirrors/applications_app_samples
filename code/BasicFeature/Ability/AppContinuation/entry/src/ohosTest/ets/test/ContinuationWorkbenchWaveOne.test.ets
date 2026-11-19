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
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0001
     * @tc.desc 仅选区改变也阻止切换，放弃后恢复保存的选区
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0001', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('标题', 'A😀BC', 1, 3); work.saveNote(); const raw = store.stored();
      work.editNote('标题', 'A😀BC', 3, 4);
      loggedExpect(work.snapshot().noteDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0001', BUNDLE + '_ContinuationWorkbenchWaveOne_0001').assertTrue(); loggedExpect(work.open('reading'), 'ContinuationWorkbenchWaveOne.test.ets:A0002', BUNDLE + '_ContinuationWorkbenchWaveOne_0001').assertFalse();
      work.discardNote();
      loggedExpect(work.snapshot().noteSelectionStart, 'ContinuationWorkbenchWaveOne.test.ets:A0003', BUNDLE + '_ContinuationWorkbenchWaveOne_0001').assertEqual(1);
      loggedExpect(work.snapshot().noteSelectionEnd, 'ContinuationWorkbenchWaveOne.test.ets:A0004', BUNDLE + '_ContinuationWorkbenchWaveOne_0001').assertEqual(3);
      loggedExpect(work.open('reading'), 'ContinuationWorkbenchWaveOne.test.ets:A0005', BUNDLE + '_ContinuationWorkbenchWaveOne_0001').assertTrue(); loggedExpect(store.stored(), 'ContinuationWorkbenchWaveOne.test.ets:A0006', BUNDLE + '_ContinuationWorkbenchWaveOne_0001').assertEqual(raw);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0200
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0002
     * @tc.desc 仅修改标题保存时保留正文选区并将前一标题写入历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0002', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('原题', 'A😀BC', 1, 3); work.saveNote();
      work.editNote('新题', 'A😀BC', 1, 3); const dirty = work.hasDirtyWork(); const saved = work.saveNote();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(dirty, 'ContinuationWorkbenchWaveOne.test.ets:A0007', BUNDLE + '_ContinuationWorkbenchWaveOne_0002').assertTrue(); loggedExpect(saved, 'ContinuationWorkbenchWaveOne.test.ets:A0008', BUNDLE + '_ContinuationWorkbenchWaveOne_0002').assertTrue(); loggedExpect(reopened.snapshot().noteTitle, 'ContinuationWorkbenchWaveOne.test.ets:A0009', BUNDLE + '_ContinuationWorkbenchWaveOne_0002').assertEqual('新题');
      loggedExpect(reopened.snapshot().noteSavedBody, 'ContinuationWorkbenchWaveOne.test.ets:A0010', BUNDLE + '_ContinuationWorkbenchWaveOne_0002').assertEqual('A😀BC');
      loggedExpect(reopened.snapshot().noteSelectionEnd, 'ContinuationWorkbenchWaveOne.test.ets:A0011', BUNDLE + '_ContinuationWorkbenchWaveOne_0002').assertEqual(3);
      loggedExpect(work.historyDocuments()[0].state.note.title, 'ContinuationWorkbenchWaveOne.test.ets:A0012', BUNDLE + '_ContinuationWorkbenchWaveOne_0002').assertEqual('原题');
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0300
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0003
     * @tc.desc 笔记非法标题正文和选区均不能部分覆盖正在编辑的版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0003', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('基线', '旧正文', 0, 2); work.saveNote(); const raw = store.stored();
      work.editNote('保留草稿', 'A😀BC', 1, 3);
      loggedExpect(work.editNote('x'.repeat(81), '替换正文', 0, 1), 'ContinuationWorkbenchWaveOne.test.ets:A0013', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertFalse();
      loggedExpect(work.editNote('坏正文', '\uD800', 0, 0), 'ContinuationWorkbenchWaveOne.test.ets:A0014', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertFalse();
      loggedExpect(work.editNote('坏选区', 'A😀BC', 2, 3), 'ContinuationWorkbenchWaveOne.test.ets:A0015', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertFalse();
      loggedExpect(work.snapshot().noteTitle, 'ContinuationWorkbenchWaveOne.test.ets:A0016', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertEqual('保留草稿'); loggedExpect(work.snapshot().noteSelectionStart, 'ContinuationWorkbenchWaveOne.test.ets:A0017', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertEqual(1);
      loggedExpect(store.stored(), 'ContinuationWorkbenchWaveOne.test.ets:A0018', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertEqual(raw); loggedExpect(work.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0019', BUNDLE + '_ContinuationWorkbenchWaveOne_0003').assertEqual(1);
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0400
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0004
     * @tc.desc 未知业务场景不切换，随后合法打开可以清除错误
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0004', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      loggedExpect(work.open('whiteboard'), 'ContinuationWorkbenchWaveOne.test.ets:A0020', BUNDLE + '_ContinuationWorkbenchWaveOne_0004').assertFalse(); loggedExpect(work.snapshot().active, 'ContinuationWorkbenchWaveOne.test.ets:A0021', BUNDLE + '_ContinuationWorkbenchWaveOne_0004').assertEqual('note');
      loggedExpect(work.snapshot().error, 'ContinuationWorkbenchWaveOne.test.ets:A0022', BUNDLE + '_ContinuationWorkbenchWaveOne_0004').assertEqual('未知场景');
      loggedExpect(work.open('form'), 'ContinuationWorkbenchWaveOne.test.ets:A0023', BUNDLE + '_ContinuationWorkbenchWaveOne_0004').assertTrue(); loggedExpect(work.snapshot().error, 'ContinuationWorkbenchWaveOne.test.ets:A0024', BUNDLE + '_ContinuationWorkbenchWaveOne_0004').assertEqual('');
      loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0025', BUNDLE + '_ContinuationWorkbenchWaveOne_0004').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0500
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0005
     * @tc.desc 阅读首尾拒绝越界而不隐式跨章，合法相邻移动可保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0005', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      loggedExpect(work.previousParagraph(), 'ContinuationWorkbenchWaveOne.test.ets:A0026', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertFalse(); loggedExpect(work.snapshot().readingAnchor, 'ContinuationWorkbenchWaveOne.test.ets:A0027', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertEqual(0);
      work.gotoParagraph(1, 2); loggedExpect(work.nextParagraph(), 'ContinuationWorkbenchWaveOne.test.ets:A0028', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertFalse();
      loggedExpect(work.snapshot().readingChapter, 'ContinuationWorkbenchWaveOne.test.ets:A0029', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertEqual(1); loggedExpect(work.previousParagraph(), 'ContinuationWorkbenchWaveOne.test.ets:A0030', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertTrue();
      work.saveReading(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().readingAnchor, 'ContinuationWorkbenchWaveOne.test.ets:A0031', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertEqual(1); loggedExpect(reopened.snapshot().readingDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0032', BUNDLE + '_ContinuationWorkbenchWaveOne_0005').assertFalse();
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0600
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0006
     * @tc.desc 返回已收藏位置不能重复添加书签或污染保存版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0006', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.gotoParagraph(1, 1); work.addBookmark(); work.saveReading(); const raw = store.stored();
      work.gotoParagraph(2, 0); work.gotoParagraph(1, 1);
      loggedExpect(work.addBookmark(), 'ContinuationWorkbenchWaveOne.test.ets:A0033', BUNDLE + '_ContinuationWorkbenchWaveOne_0006').assertFalse(); loggedExpect(work.snapshot().bookmarks.length, 'ContinuationWorkbenchWaveOne.test.ets:A0034', BUNDLE + '_ContinuationWorkbenchWaveOne_0006').assertEqual(1);
      loggedExpect(work.snapshot().error, 'ContinuationWorkbenchWaveOne.test.ets:A0035', BUNDLE + '_ContinuationWorkbenchWaveOne_0006').assertEqual('书签重复或已达上限'); loggedExpect(work.snapshot().readingDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0036', BUNDLE + '_ContinuationWorkbenchWaveOne_0006').assertFalse();
      loggedExpect(store.stored(), 'ContinuationWorkbenchWaveOne.test.ets:A0037', BUNDLE + '_ContinuationWorkbenchWaveOne_0006').assertEqual(raw); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0700
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0007
     * @tc.desc 删除中间书签保持两侧次序且重开后只保留剩余位置
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0007', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.addBookmark();
      work.gotoParagraph(1, 1);
      work.addBookmark();
      work.gotoParagraph(2, 2);
      work.addBookmark();
      work.saveReading();
      loggedExpect(work.removeBookmark(1), 'ContinuationWorkbenchWaveOne.test.ets:A0038', BUNDLE + '_ContinuationWorkbenchWaveOne_0007').assertTrue(); loggedExpect(work.snapshot().readingDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0039', BUNDLE + '_ContinuationWorkbenchWaveOne_0007').assertTrue();
      work.saveReading(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().bookmarks.length, 'ContinuationWorkbenchWaveOne.test.ets:A0040', BUNDLE + '_ContinuationWorkbenchWaveOne_0007').assertEqual(2);
      loggedExpect(reopened.snapshot().bookmarks[0].chapter, 'ContinuationWorkbenchWaveOne.test.ets:A0041', BUNDLE + '_ContinuationWorkbenchWaveOne_0007').assertEqual(0);
      loggedExpect(reopened.snapshot().bookmarks[1].chapter, 'ContinuationWorkbenchWaveOne.test.ets:A0042', BUNDLE + '_ContinuationWorkbenchWaveOne_0007').assertEqual(2);
      loggedExpect(work.historyDocuments()[0].state.reading.bookmarks.length, 'ContinuationWorkbenchWaveOne.test.ets:A0043', BUNDLE + '_ContinuationWorkbenchWaveOne_0007').assertEqual(3);
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0800
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0008
     * @tc.desc 非整数或越界书签索引不能删除，合法删除可清错并清空收藏
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0008', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.gotoParagraph(2, 1); work.addBookmark(); work.saveReading();
      loggedExpect(work.removeBookmark(-1), 'ContinuationWorkbenchWaveOne.test.ets:A0044', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertFalse();
      loggedExpect(work.removeBookmark(0.5), 'ContinuationWorkbenchWaveOne.test.ets:A0045', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertFalse();
      loggedExpect(work.removeBookmark(1), 'ContinuationWorkbenchWaveOne.test.ets:A0046', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertFalse();
      loggedExpect(work.snapshot().bookmarks[0].anchor, 'ContinuationWorkbenchWaveOne.test.ets:A0047', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertEqual(1); loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0048', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertEqual(1);
      loggedExpect(work.removeBookmark(0), 'ContinuationWorkbenchWaveOne.test.ets:A0049', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertTrue(); loggedExpect(work.snapshot().error, 'ContinuationWorkbenchWaveOne.test.ets:A0050', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertEqual('');
      work.saveReading(); const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().bookmarks.length, 'ContinuationWorkbenchWaveOne.test.ets:A0051', BUNDLE + '_ContinuationWorkbenchWaveOne_0008').assertEqual(0); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_0900
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0009
     * @tc.desc 阅读进度返回保存位置即恢复干净状态无需额外写入才能切换
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0009', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.gotoParagraph(1, 1); work.saveReading(); work.gotoParagraph(2, 2);
      loggedExpect(work.snapshot().readingDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0052', BUNDLE + '_ContinuationWorkbenchWaveOne_0009').assertTrue(); loggedExpect(work.open('note'), 'ContinuationWorkbenchWaveOne.test.ets:A0053', BUNDLE + '_ContinuationWorkbenchWaveOne_0009').assertFalse();
      work.gotoParagraph(1, 1); loggedExpect(work.hasDirtyWork(), 'ContinuationWorkbenchWaveOne.test.ets:A0054', BUNDLE + '_ContinuationWorkbenchWaveOne_0009').assertFalse(); loggedExpect(work.open('note'), 'ContinuationWorkbenchWaveOne.test.ets:A0055', BUNDLE + '_ContinuationWorkbenchWaveOne_0009').assertTrue();
      loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0056', BUNDLE + '_ContinuationWorkbenchWaveOne_0009').assertEqual(1); loggedExpect(work.document('reading').revision, 'ContinuationWorkbenchWaveOne.test.ets:A0057', BUNDLE + '_ContinuationWorkbenchWaveOne_0009').assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1000
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0010
     * @tc.desc 已确认表单修改字段后取消确认，保存为可继续编辑的草稿
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0010', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.confirmForm();
      loggedExpect(work.setFormField('address', '新地址二号'), 'ContinuationWorkbenchWaveOne.test.ets:A0058', BUNDLE + '_ContinuationWorkbenchWaveOne_0010').assertTrue(); loggedExpect(work.snapshot().formConfirmed, 'ContinuationWorkbenchWaveOne.test.ets:A0059', BUNDLE + '_ContinuationWorkbenchWaveOne_0010').assertFalse();
      loggedExpect(work.snapshot().formDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0060', BUNDLE + '_ContinuationWorkbenchWaveOne_0010').assertTrue(); work.saveForm();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().formAddress, 'ContinuationWorkbenchWaveOne.test.ets:A0061', BUNDLE + '_ContinuationWorkbenchWaveOne_0010').assertEqual('新地址二号');
      loggedExpect(reopened.snapshot().formConfirmed, 'ContinuationWorkbenchWaveOne.test.ets:A0062', BUNDLE + '_ContinuationWorkbenchWaveOne_0010').assertFalse();
      loggedExpect(work.historyDocuments()[0].state.form.confirmed, 'ContinuationWorkbenchWaveOne.test.ets:A0063', BUNDLE + '_ContinuationWorkbenchWaveOne_0010').assertTrue(); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1100
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0011
     * @tc.desc 撤销表单同意后不能再次确认，草稿持久化保留撤销状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0011', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.confirmForm();
      work.setFormAgreed(false); loggedExpect(work.confirmForm(), 'ContinuationWorkbenchWaveOne.test.ets:A0064', BUNDLE + '_ContinuationWorkbenchWaveOne_0011').assertFalse(); loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0065', BUNDLE + '_ContinuationWorkbenchWaveOne_0011').assertEqual(1);
      loggedExpect(work.snapshot().formStepIssues.join('|'), 'ContinuationWorkbenchWaveOne.test.ets:A0066', BUNDLE + '_ContinuationWorkbenchWaveOne_0011').assertEqual('需要确认信息无误'); work.saveForm();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().formAgreed, 'ContinuationWorkbenchWaveOne.test.ets:A0067', BUNDLE + '_ContinuationWorkbenchWaveOne_0011').assertFalse(); loggedExpect(reopened.snapshot().formConfirmed, 'ContinuationWorkbenchWaveOne.test.ets:A0068', BUNDLE + '_ContinuationWorkbenchWaveOne_0011').assertFalse();
      loggedExpect(reopened.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0069', BUNDLE + '_ContinuationWorkbenchWaveOne_0011').assertEqual(2); work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1200
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0012
     * @tc.desc 回到首步可修复后来清空的资料，向前时重新检查前置步骤
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0012', 0, (): void => {
      const work = new SceneWorkbench(new WaveSceneStore());
      work.open('form');
      fillWaveForm(work);
      work.saveForm();
      work.setFormField('name', '');
      loggedExpect(work.gotoFormStep(0), 'ContinuationWorkbenchWaveOne.test.ets:A0070', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertTrue();
      loggedExpect(work.nextFormStep(), 'ContinuationWorkbenchWaveOne.test.ets:A0071', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertFalse();
      loggedExpect(work.snapshot().formStep, 'ContinuationWorkbenchWaveOne.test.ets:A0072', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertEqual(0);
      work.setFormField('name', '重新填写');
      loggedExpect(work.gotoFormStep(2), 'ContinuationWorkbenchWaveOne.test.ets:A0073', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertTrue();
      loggedExpect(work.previousFormStep(), 'ContinuationWorkbenchWaveOne.test.ets:A0074', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertTrue();
      loggedExpect(work.snapshot().formStep, 'ContinuationWorkbenchWaveOne.test.ets:A0075', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertEqual(1);
      loggedExpect(work.snapshot().formName, 'ContinuationWorkbenchWaveOne.test.ets:A0076', BUNDLE + '_ContinuationWorkbenchWaveOne_0012').assertEqual('重新填写');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1300
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0013
     * @tc.desc 非法步骤不移动业务位置或写存储，合法后退仍可继续
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0013', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.saveForm();
      loggedExpect(work.gotoFormStep(-1), 'ContinuationWorkbenchWaveOne.test.ets:A0077', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertFalse();
      loggedExpect(work.gotoFormStep(1.5), 'ContinuationWorkbenchWaveOne.test.ets:A0078', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertFalse();
      loggedExpect(work.gotoFormStep(3), 'ContinuationWorkbenchWaveOne.test.ets:A0079', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertFalse();
      loggedExpect(work.snapshot().formStep, 'ContinuationWorkbenchWaveOne.test.ets:A0080', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertEqual(2); loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0081', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertEqual(1);
      loggedExpect(work.previousFormStep(), 'ContinuationWorkbenchWaveOne.test.ets:A0082', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertTrue();
      loggedExpect(work.snapshot().formStepLabel, 'ContinuationWorkbenchWaveOne.test.ets:A0083', BUNDLE + '_ContinuationWorkbenchWaveOne_0013').assertEqual('联系方式');
      work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1400
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0014
     * @tc.desc 非法字段和值不会将已确认表单变为草稿或修改有效内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0014', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      work.open('form');
      fillWaveForm(work);
      work.confirmForm();
      loggedExpect(work.setFormField('unknown', '误填'), 'ContinuationWorkbenchWaveOne.test.ets:A0084', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertFalse();
      loggedExpect(work.setFormField('phone', '1'.repeat(21)), 'ContinuationWorkbenchWaveOne.test.ets:A0085', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertFalse();
      loggedExpect(work.setFormField('address', '址'.repeat(101)), 'ContinuationWorkbenchWaveOne.test.ets:A0086', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertFalse();
      loggedExpect(work.setFormField('note', '\uDC00'), 'ContinuationWorkbenchWaveOne.test.ets:A0087', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertFalse();
      loggedExpect(work.snapshot().formConfirmed, 'ContinuationWorkbenchWaveOne.test.ets:A0088', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertTrue(); loggedExpect(work.snapshot().formPhone, 'ContinuationWorkbenchWaveOne.test.ets:A0089', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertEqual('13800138000');
      loggedExpect(work.snapshot().formDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0090', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertFalse(); loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0091', BUNDLE + '_ContinuationWorkbenchWaveOne_0014').assertEqual(1); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1500
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0015
     * @tc.desc 非法历史索引不能覆盖当前未保存编辑或制造新历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0015', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('甲', '甲正文', 0, 1); work.saveNote(); work.editNote('乙', '乙正文', 1, 2); work.saveNote();
      work.editNote('草稿', '待保留', 0, 2); const raw = store.stored();
      loggedExpect(work.restoreHistory(-1), 'ContinuationWorkbenchWaveOne.test.ets:A0092', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertFalse();
      loggedExpect(work.restoreHistory(0.5), 'ContinuationWorkbenchWaveOne.test.ets:A0093', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertFalse();
      loggedExpect(work.restoreHistory(1), 'ContinuationWorkbenchWaveOne.test.ets:A0094', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertFalse();
      loggedExpect(work.snapshot().noteBody, 'ContinuationWorkbenchWaveOne.test.ets:A0095', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertEqual('待保留');
      loggedExpect(work.historyDocuments()[0].state.note.body, 'ContinuationWorkbenchWaveOne.test.ets:A0096', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertEqual('甲正文');
      loggedExpect(store.stored(), 'ContinuationWorkbenchWaveOne.test.ets:A0097', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertEqual(raw); loggedExpect(work.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0098', BUNDLE + '_ContinuationWorkbenchWaveOne_0015').assertEqual(2); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1600
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0016
     * @tc.desc 业务文档历史和快照的外部嵌套修改不会污染真实工作区
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0016', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store); work.open('reading');
      work.addBookmark(); work.saveReading(); work.gotoParagraph(1, 1); work.addBookmark(); work.saveReading();
      const document = work.document('reading'); document.state.reading.bookmarks[0].chapter = 2;
      const history = work.historyDocuments(); history[0].state.reading.anchor = 2;
      const snapshot = work.snapshot(); snapshot.bookmarks.splice(0, 2);
      loggedExpect(work.document('reading').state.reading.bookmarks[0].chapter, 'ContinuationWorkbenchWaveOne.test.ets:A0099', BUNDLE + '_ContinuationWorkbenchWaveOne_0016').assertEqual(0);
      loggedExpect(work.historyDocuments()[0].state.reading.anchor, 'ContinuationWorkbenchWaveOne.test.ets:A0100', BUNDLE + '_ContinuationWorkbenchWaveOne_0016').assertEqual(0);
      loggedExpect(work.snapshot().bookmarks.length, 'ContinuationWorkbenchWaveOne.test.ets:A0101', BUNDLE + '_ContinuationWorkbenchWaveOne_0016').assertEqual(2);
      loggedExpect(work.hasDirtyWork(), 'ContinuationWorkbenchWaveOne.test.ets:A0102', BUNDLE + '_ContinuationWorkbenchWaveOne_0016').assertFalse(); loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0103', BUNDLE + '_ContinuationWorkbenchWaveOne_0016').assertEqual(2); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1700
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0017
     * @tc.desc 候选快照只展示远端笔记不会替换本机编辑身份或保存状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0017', 0, (): void => {
      const store = new WaveSceneStore(); const work = new SceneWorkbench(store);
      work.editNote('本机标题', '本机草稿', 0, 2); const local = work.document('note');
      const incoming = waveNote('preview-doc', 8, '远端保存正文');
      incoming.state.note.body = '远端未保存';
      incoming.state.note.selectionEnd = 2;
      const preview = work.snapshot(incoming);
      loggedExpect(preview.noteBody, 'ContinuationWorkbenchWaveOne.test.ets:A0104', BUNDLE + '_ContinuationWorkbenchWaveOne_0017').assertEqual('远端未保存');
      loggedExpect(preview.noteDirty, 'ContinuationWorkbenchWaveOne.test.ets:A0105', BUNDLE + '_ContinuationWorkbenchWaveOne_0017').assertTrue();
      loggedExpect(preview.revision, 'ContinuationWorkbenchWaveOne.test.ets:A0106', BUNDLE + '_ContinuationWorkbenchWaveOne_0017').assertEqual(8);
      loggedExpect(work.snapshot().noteTitle, 'ContinuationWorkbenchWaveOne.test.ets:A0107', BUNDLE + '_ContinuationWorkbenchWaveOne_0017').assertEqual('本机标题');
      loggedExpect(work.document('note').documentId, 'ContinuationWorkbenchWaveOne.test.ets:A0108', BUNDLE + '_ContinuationWorkbenchWaveOne_0017').assertEqual(local.documentId);
      loggedExpect(store.putCalls, 'ContinuationWorkbenchWaveOne.test.ets:A0109', BUNDLE + '_ContinuationWorkbenchWaveOne_0017').assertEqual(0); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1800
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0018
     * @tc.desc 同文档同修订同状态直接接收不产生冲突或重复历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0018', 0, (): void => {
      const root = stageScene(emptyWorkspace(), waveNote('same-doc', 2), 'note');
      const store = new WaveSceneStore(encodeWorkspace(root));
      const work = new SceneWorkbench(store);
      const incoming = work.document('note');
      incoming.transferId = 'new-delivery';
      loggedExpect(work.conflictReason(incoming), 'ContinuationWorkbenchWaveOne.test.ets:A0110', BUNDLE + '_ContinuationWorkbenchWaveOne_0018').assertEqual(''); loggedExpect(work.commitIncoming(incoming, false), 'ContinuationWorkbenchWaveOne.test.ets:A0111', BUNDLE + '_ContinuationWorkbenchWaveOne_0018').assertTrue();
      loggedExpect(work.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0112', BUNDLE + '_ContinuationWorkbenchWaveOne_0018').assertEqual(2); loggedExpect(work.historyDocuments().length, 'ContinuationWorkbenchWaveOne.test.ets:A0113', BUNDLE + '_ContinuationWorkbenchWaveOne_0018').assertEqual(0);
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.document('note').transferId, 'ContinuationWorkbenchWaveOne.test.ets:A0114', BUNDLE + '_ContinuationWorkbenchWaveOne_0018').assertEqual('new-delivery');
      loggedExpect(reopened.hasDirtyWork(), 'ContinuationWorkbenchWaveOne.test.ets:A0115', BUNDLE + '_ContinuationWorkbenchWaveOne_0018').assertFalse();
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_1900
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0019
     * @tc.desc 干净本机遇同文档旧修订不同状态需选择，接纳后沿本机修订递增
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0019', 0, (): void => {
      const root = stageScene(emptyWorkspace(), waveNote('old-doc', 7, '本机已保存'), 'note');
      const store = new WaveSceneStore(encodeWorkspace(root));
      const work = new SceneWorkbench(store);
      const incoming = waveNote('old-doc', 3, '远端旧正文');
      loggedExpect(work.conflictReason(incoming), 'ContinuationWorkbenchWaveOne.test.ets:A0116', BUNDLE + '_ContinuationWorkbenchWaveOne_0019').assertEqual('同文档旧修订或同号不同状态，需明确选择。');
      loggedExpect(work.commitIncoming(incoming, true), 'ContinuationWorkbenchWaveOne.test.ets:A0117', BUNDLE + '_ContinuationWorkbenchWaveOne_0019').assertTrue(); loggedExpect(work.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0118', BUNDLE + '_ContinuationWorkbenchWaveOne_0019').assertEqual(8);
      loggedExpect(work.snapshot().noteBody, 'ContinuationWorkbenchWaveOne.test.ets:A0119', BUNDLE + '_ContinuationWorkbenchWaveOne_0019').assertEqual('远端旧正文'); loggedExpect(work.historyDocuments()[0].revision, 'ContinuationWorkbenchWaveOne.test.ets:A0120', BUNDLE + '_ContinuationWorkbenchWaveOne_0019').assertEqual(7);
      loggedExpect(work.historyDocuments()[0].state.note.body, 'ContinuationWorkbenchWaveOne.test.ets:A0121', BUNDLE + '_ContinuationWorkbenchWaveOne_0019').assertEqual('本机已保存'); work.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_2000
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0020
     * @tc.desc 干净同文档新修订可直接提交，保留远端修订和真实本机历史
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0020', 0, (): void => {
      const root = stageScene(emptyWorkspace(), waveNote('newer-doc', 2, '本机基线'), 'note');
      const store = new WaveSceneStore(encodeWorkspace(root));
      const work = new SceneWorkbench(store);
      const incoming = waveNote('newer-doc', 9, '新修订内容');
      loggedExpect(work.conflictReason(incoming), 'ContinuationWorkbenchWaveOne.test.ets:A0122', BUNDLE + '_ContinuationWorkbenchWaveOne_0020').assertEqual(''); loggedExpect(work.commitIncoming(incoming, false), 'ContinuationWorkbenchWaveOne.test.ets:A0123', BUNDLE + '_ContinuationWorkbenchWaveOne_0020').assertTrue();
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0124', BUNDLE + '_ContinuationWorkbenchWaveOne_0020').assertEqual(9);
      loggedExpect(reopened.snapshot().noteSavedBody, 'ContinuationWorkbenchWaveOne.test.ets:A0125', BUNDLE + '_ContinuationWorkbenchWaveOne_0020').assertEqual('新修订内容');
      loggedExpect(reopened.historyDocuments()[0].revision, 'ContinuationWorkbenchWaveOne.test.ets:A0126', BUNDLE + '_ContinuationWorkbenchWaveOne_0020').assertEqual(2);
      loggedExpect(work.hasDirtyWork(), 'ContinuationWorkbenchWaveOne.test.ets:A0127', BUNDLE + '_ContinuationWorkbenchWaveOne_0020').assertFalse();
      work.dispose();
      reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_2100
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0021
     * @tc.desc 替换笔记身份只清除笔记历史而保留阅读文档及其旧版本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0021', 0, (): void => {
      let root = stageScene(emptyWorkspace(), waveNote('old-note', 1), 'note');
      root = stageScene(root, waveNote('old-note', 2), 'note');
      root = stageScene(root, waveReading('keep-reading', 1), 'reading');
      root = stageScene(root, waveReading('keep-reading', 2, 1, 1), 'reading');
      const store = new WaveSceneStore(encodeWorkspace(root)); const work = new SceneWorkbench(store);
      loggedExpect(work.commitIncoming(waveNote('replacement-note', 1, '独立文档'), true), 'ContinuationWorkbenchWaveOne.test.ets:A0128', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertTrue();
      loggedExpect(work.document('note').revision, 'ContinuationWorkbenchWaveOne.test.ets:A0129', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertEqual(2); loggedExpect(work.historyDocuments().length, 'ContinuationWorkbenchWaveOne.test.ets:A0130', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertEqual(1);
      loggedExpect(work.historyDocuments()[0].documentId, 'ContinuationWorkbenchWaveOne.test.ets:A0131', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertEqual('keep-reading');
      loggedExpect(work.document('reading').state.reading.anchor, 'ContinuationWorkbenchWaveOne.test.ets:A0132', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertEqual(1);
      const reopened = new SceneWorkbench(new WaveSceneStore(store.stored()));
      loggedExpect(reopened.document('note').documentId, 'ContinuationWorkbenchWaveOne.test.ets:A0133', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertEqual('replacement-note');
      loggedExpect(reopened.historyDocuments()[0].revision, 'ContinuationWorkbenchWaveOne.test.ets:A0134', BUNDLE + '_ContinuationWorkbenchWaveOne_0021').assertEqual(1);
      work.dispose(); reopened.dispose();
    });

    /**
     * @tc.number SUB_CONTINUATION_WORKBENCHWAVEONE_2200
     * @tc.name com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0022
     * @tc.desc 无冲突直接接收修订上限不提前加号，随后编辑保存仍保护远端存档
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(BUNDLE + '_ContinuationWorkbenchWaveOne_0022', 0, (): void => {
      const store = new WaveSceneStore();
      const work = new SceneWorkbench(store);
      const incoming = waveNote('limit-doc', REVISION_LIMIT, '上限正文');
      loggedExpect(work.commitIncoming(incoming, false), 'ContinuationWorkbenchWaveOne.test.ets:A0135', BUNDLE + '_ContinuationWorkbenchWaveOne_0022').assertTrue(); const raw = store.stored();
      work.editNote('上限后草稿', '仍可编辑', 0, 1); loggedExpect(work.saveNote(), 'ContinuationWorkbenchWaveOne.test.ets:A0136', BUNDLE + '_ContinuationWorkbenchWaveOne_0022').assertFalse();
      loggedExpect(work.snapshot().revision, 'ContinuationWorkbenchWaveOne.test.ets:A0137', BUNDLE + '_ContinuationWorkbenchWaveOne_0022').assertEqual(REVISION_LIMIT);
      loggedExpect(work.snapshot().noteSavedBody, 'ContinuationWorkbenchWaveOne.test.ets:A0138', BUNDLE + '_ContinuationWorkbenchWaveOne_0022').assertEqual('上限正文');
      loggedExpect(store.stored(), 'ContinuationWorkbenchWaveOne.test.ets:A0139', BUNDLE + '_ContinuationWorkbenchWaveOne_0022').assertEqual(raw); loggedExpect(work.snapshot().noteBody, 'ContinuationWorkbenchWaveOne.test.ets:A0140', BUNDLE + '_ContinuationWorkbenchWaveOne_0022').assertEqual('仍可编辑'); work.dispose();
    });
  });
}
