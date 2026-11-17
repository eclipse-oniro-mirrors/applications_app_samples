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
import {
  FORM_STEPS, READING_CHAPTERS, REVISION_LIMIT, SCENE_LIMIT, ReadingBookmark, SceneDocument, SceneRead, SceneState,
  SceneWorkspace, copyScene, decodeScene, decodeWorkspace, emptyScene, emptyWorkspace, encodeScene,
  encodeWorkspace, findScene, formIssues, sceneLabel, selectionBoundary, stageScene, stepIssues,
  validFormStep, validReadingPosition, validUnicode
} from '../../../main/ets/learning/scene/SceneModel';

function noteDocument(revision: number = 1): SceneDocument {
  const state: SceneState = emptyScene('note');
  state.note.title = '接续笔记';
  state.note.body = '第一段正文😀';
  state.note.savedBody = '第一段正文';
  state.note.savedTitle = '接续笔记';
  state.note.selectionStart = 0;
  state.note.selectionEnd = 4;
  state.note.savedSelectionStart = 0;
  state.note.savedSelectionEnd = 4;
  return { transferId: 'tr-1', documentId: 'doc-1', revision: revision, state: state };
}

function readingDocument(): SceneDocument {
  const state: SceneState = emptyScene('reading');
  state.reading.chapter = 1;
  state.reading.anchor = 2;
  state.reading.bookmarks = [{ chapter: 0, anchor: 0 }, { chapter: 1, anchor: 1 }];
  return { transferId: 'tr-2', documentId: 'doc-2', revision: 3, state: state };
}

function formStateOf(): SceneState {
  const state: SceneState = emptyScene('form');
  state.form.step = 2;
  state.form.name = '张三';
  state.form.phone = '13800138000';
  state.form.address = '北京市海淀区中关村大街 1 号';
  state.form.note = '无';
  state.form.agreed = true;
  state.form.savedStep = 1;
  state.form.confirmed = false;
  return state;
}

export default function sceneModelMatrixTest(): void {
  describe('SceneModelMatrixCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0100
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0001
     * @tc.desc      Verify validUnicode accepts plain and paired text and rejects lone surrogates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0001', 0, (): void => {
      loggedExpect(validUnicode('abc'), 'SceneModelMatrix.test.ets:A0001', BUNDLE + '_SceneModelMatrix_0001').assertTrue();
      loggedExpect(validUnicode('中文'), 'SceneModelMatrix.test.ets:A0002', BUNDLE + '_SceneModelMatrix_0001').assertTrue();
      loggedExpect(validUnicode('\uD83D\uDE00'), 'SceneModelMatrix.test.ets:A0003', BUNDLE + '_SceneModelMatrix_0001').assertTrue();
      loggedExpect(validUnicode('\uD83D'), 'SceneModelMatrix.test.ets:A0004', BUNDLE + '_SceneModelMatrix_0001').assertFalse();
      loggedExpect(validUnicode('\uDE00'), 'SceneModelMatrix.test.ets:A0005', BUNDLE + '_SceneModelMatrix_0001').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0200
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0002
     * @tc.desc      Verify selectionBoundary rejects out-of-range and surrogate-splitting offsets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0002', 0, (): void => {
      const text: string = '😀a';
      loggedExpect(selectionBoundary(text, 0), 'SceneModelMatrix.test.ets:A0006', BUNDLE + '_SceneModelMatrix_0002').assertTrue();
      loggedExpect(selectionBoundary(text, text.length), 'SceneModelMatrix.test.ets:A0007', BUNDLE + '_SceneModelMatrix_0002').assertTrue();
      loggedExpect(selectionBoundary(text, -1), 'SceneModelMatrix.test.ets:A0008', BUNDLE + '_SceneModelMatrix_0002').assertFalse();
      loggedExpect(selectionBoundary(text, text.length + 1), 'SceneModelMatrix.test.ets:A0009', BUNDLE + '_SceneModelMatrix_0002').assertFalse();
      loggedExpect(selectionBoundary(text, 0.5), 'SceneModelMatrix.test.ets:A0010', BUNDLE + '_SceneModelMatrix_0002').assertFalse();
      loggedExpect(selectionBoundary(text, 1), 'SceneModelMatrix.test.ets:A0011', BUNDLE + '_SceneModelMatrix_0002').assertFalse();
      loggedExpect(selectionBoundary(text, 2), 'SceneModelMatrix.test.ets:A0012', BUNDLE + '_SceneModelMatrix_0002').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0300
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0003
     * @tc.desc      Verify reading positions follow the bundled chapter and paragraph ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0003', 0, (): void => {
      loggedExpect(validReadingPosition(0, 0), 'SceneModelMatrix.test.ets:A0013', BUNDLE + '_SceneModelMatrix_0003').assertTrue();
      loggedExpect(validReadingPosition(READING_CHAPTERS.length - 1,
        READING_CHAPTERS[READING_CHAPTERS.length - 1].paragraphs.length - 1), 'SceneModelMatrix.test.ets:A0014', BUNDLE + '_SceneModelMatrix_0003').assertTrue();
      loggedExpect(validReadingPosition(READING_CHAPTERS.length, 0), 'SceneModelMatrix.test.ets:A0015', BUNDLE + '_SceneModelMatrix_0003').assertFalse();
      loggedExpect(validReadingPosition(0, -1), 'SceneModelMatrix.test.ets:A0016', BUNDLE + '_SceneModelMatrix_0003').assertFalse();
      loggedExpect(validReadingPosition(-1, 0), 'SceneModelMatrix.test.ets:A0017', BUNDLE + '_SceneModelMatrix_0003').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0400
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0004
     * @tc.desc      Verify form step validation only accepts the three declared steps
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0004', 0, (): void => {
      loggedExpect(FORM_STEPS.length, 'SceneModelMatrix.test.ets:A0018', BUNDLE + '_SceneModelMatrix_0004').assertEqual(3);
      loggedExpect(validFormStep(0), 'SceneModelMatrix.test.ets:A0019', BUNDLE + '_SceneModelMatrix_0004').assertTrue();
      loggedExpect(validFormStep(2), 'SceneModelMatrix.test.ets:A0020', BUNDLE + '_SceneModelMatrix_0004').assertTrue();
      loggedExpect(validFormStep(3), 'SceneModelMatrix.test.ets:A0021', BUNDLE + '_SceneModelMatrix_0004').assertFalse();
      loggedExpect(validFormStep(-1), 'SceneModelMatrix.test.ets:A0022', BUNDLE + '_SceneModelMatrix_0004').assertFalse();
      loggedExpect(validFormStep(1.5), 'SceneModelMatrix.test.ets:A0023', BUNDLE + '_SceneModelMatrix_0004').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0500
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0005
     * @tc.desc      Verify first-step issues list missing name and malformed phone together
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0005', 0, (): void => {
      const form = emptyScene('form').form;
      const issues: string[] = stepIssues(form, 0);
      loggedExpect(issues.length, 'SceneModelMatrix.test.ets:A0024', BUNDLE + '_SceneModelMatrix_0005').assertEqual(2);
      loggedExpect(issues[0], 'SceneModelMatrix.test.ets:A0025', BUNDLE + '_SceneModelMatrix_0005').assertEqual('请填写姓名');
      loggedExpect(issues[1].indexOf('手机号') >= 0, 'SceneModelMatrix.test.ets:A0026', BUNDLE + '_SceneModelMatrix_0005').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0600
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0006
     * @tc.desc      Verify the first step accepts a legal name and phone and flags only length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0006', 0, (): void => {
      const form = emptyScene('form').form;
      form.name = '张三';
      form.phone = '13800138000';
      loggedExpect(stepIssues(form, 0).length, 'SceneModelMatrix.test.ets:A0027', BUNDLE + '_SceneModelMatrix_0006').assertEqual(0);
      form.name = 'x'.repeat(41);
      const issues: string[] = stepIssues(form, 0);
      loggedExpect(issues.length, 'SceneModelMatrix.test.ets:A0028', BUNDLE + '_SceneModelMatrix_0006').assertEqual(1);
      loggedExpect(issues[0], 'SceneModelMatrix.test.ets:A0029', BUNDLE + '_SceneModelMatrix_0006').assertEqual('姓名最多 40 字');
      form.name = 'x'.repeat(40);
      loggedExpect(stepIssues(form, 0).length, 'SceneModelMatrix.test.ets:A0030', BUNDLE + '_SceneModelMatrix_0006').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0700
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0007
     * @tc.desc      Verify the address step enforces emptiness and the 100 character limit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0007', 0, (): void => {
      const form = emptyScene('form').form;
      loggedExpect(stepIssues(form, 1)[0], 'SceneModelMatrix.test.ets:A0031', BUNDLE + '_SceneModelMatrix_0007').assertEqual('请填写地址');
      form.address = 'a'.repeat(101);
      loggedExpect(stepIssues(form, 1)[0], 'SceneModelMatrix.test.ets:A0032', BUNDLE + '_SceneModelMatrix_0007').assertEqual('地址最多 100 字');
      form.address = 'a'.repeat(100);
      loggedExpect(stepIssues(form, 1).length, 'SceneModelMatrix.test.ets:A0033', BUNDLE + '_SceneModelMatrix_0007').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0800
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0008
     * @tc.desc      Verify the confirmation step requires consent and a bounded note
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0008', 0, (): void => {
      const form = emptyScene('form').form;
      loggedExpect(stepIssues(form, 2)[0], 'SceneModelMatrix.test.ets:A0034', BUNDLE + '_SceneModelMatrix_0008').assertEqual('需要确认信息无误');
      form.agreed = true;
      form.note = 'n'.repeat(201);
      loggedExpect(stepIssues(form, 2)[0], 'SceneModelMatrix.test.ets:A0035', BUNDLE + '_SceneModelMatrix_0008').assertEqual('备注最多 200 字');
      form.note = 'n'.repeat(200);
      loggedExpect(stepIssues(form, 2).length, 'SceneModelMatrix.test.ets:A0036', BUNDLE + '_SceneModelMatrix_0008').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0900
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0009
     * @tc.desc      Verify full-form validation prefixes each issue with its step label
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0009', 0, (): void => {
      const issues: string[] = formIssues(emptyScene('form').form);
      loggedExpect(issues.length, 'SceneModelMatrix.test.ets:A0037', BUNDLE + '_SceneModelMatrix_0009').assertEqual(4);
      loggedExpect(issues[0].startsWith('基本信息：'), 'SceneModelMatrix.test.ets:A0038', BUNDLE + '_SceneModelMatrix_0009').assertTrue();
      loggedExpect(issues[1].startsWith('基本信息：'), 'SceneModelMatrix.test.ets:A0039', BUNDLE + '_SceneModelMatrix_0009').assertTrue();
      loggedExpect(issues[2].startsWith('联系方式：'), 'SceneModelMatrix.test.ets:A0040', BUNDLE + '_SceneModelMatrix_0009').assertTrue();
      loggedExpect(issues[3].startsWith('确认提交：'), 'SceneModelMatrix.test.ets:A0041', BUNDLE + '_SceneModelMatrix_0009').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1000
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0010
     * @tc.desc      Verify scene labels cover all four business kinds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0010', 0, (): void => {
      loggedExpect(sceneLabel('note'), 'SceneModelMatrix.test.ets:A0042', BUNDLE + '_SceneModelMatrix_0010').assertEqual('笔记草稿');
      loggedExpect(sceneLabel('reading'), 'SceneModelMatrix.test.ets:A0043', BUNDLE + '_SceneModelMatrix_0010').assertEqual('阅读进度');
      loggedExpect(sceneLabel('form'), 'SceneModelMatrix.test.ets:A0044', BUNDLE + '_SceneModelMatrix_0010').assertEqual('表单草稿');
      loggedExpect(sceneLabel('text'), 'SceneModelMatrix.test.ets:A0045', BUNDLE + '_SceneModelMatrix_0010').assertEqual('原文本');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1100
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0011
     * @tc.desc      Verify a note scene survives encode and decode with selection intact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0011', 0, (): void => {
      const decoded: SceneRead = decodeScene(encodeScene(noteDocument(5)));
      loggedExpect(decoded.value !== undefined, 'SceneModelMatrix.test.ets:A0046', BUNDLE + '_SceneModelMatrix_0011').assertTrue();
      loggedExpect(decoded.value?.documentId, 'SceneModelMatrix.test.ets:A0047', BUNDLE + '_SceneModelMatrix_0011').assertEqual('doc-1');
      loggedExpect(decoded.value?.revision, 'SceneModelMatrix.test.ets:A0048', BUNDLE + '_SceneModelMatrix_0011').assertEqual(5);
      loggedExpect(decoded.value?.state.note.title, 'SceneModelMatrix.test.ets:A0049', BUNDLE + '_SceneModelMatrix_0011').assertEqual('接续笔记');
      loggedExpect(decoded.value?.state.note.selectionEnd, 'SceneModelMatrix.test.ets:A0050', BUNDLE + '_SceneModelMatrix_0011').assertEqual(4);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1200
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0012
     * @tc.desc      Verify a reading scene keeps chapter, anchor and bookmark order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0012', 0, (): void => {
      const decoded: SceneRead = decodeScene(encodeScene(readingDocument()));
      loggedExpect(decoded.value?.state.kind, 'SceneModelMatrix.test.ets:A0051', BUNDLE + '_SceneModelMatrix_0012').assertEqual('reading');
      loggedExpect(decoded.value?.state.reading.chapter, 'SceneModelMatrix.test.ets:A0052', BUNDLE + '_SceneModelMatrix_0012').assertEqual(1);
      loggedExpect(decoded.value?.state.reading.anchor, 'SceneModelMatrix.test.ets:A0053', BUNDLE + '_SceneModelMatrix_0012').assertEqual(2);
      loggedExpect(decoded.value?.state.reading.bookmarks.length, 'SceneModelMatrix.test.ets:A0054', BUNDLE + '_SceneModelMatrix_0012').assertEqual(2);
      loggedExpect(decoded.value?.state.reading.bookmarks[1].anchor, 'SceneModelMatrix.test.ets:A0055', BUNDLE + '_SceneModelMatrix_0012').assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1300
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0013
     * @tc.desc      Verify a form scene defaults the saved step to the current step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0013', 0, (): void => {
      const state: SceneState = formStateOf();
      state.form.savedStep = 2;
      const document: SceneDocument = { transferId: 'tr-3', documentId: 'doc-3', revision: 1, state: state };
      const decoded: SceneRead = decodeScene(encodeScene(document));
      loggedExpect(decoded.value?.state.form.step, 'SceneModelMatrix.test.ets:A0056', BUNDLE + '_SceneModelMatrix_0013').assertEqual(2);
      loggedExpect(decoded.value?.state.form.savedStep, 'SceneModelMatrix.test.ets:A0057', BUNDLE + '_SceneModelMatrix_0013').assertEqual(2);
      loggedExpect(decoded.value?.state.form.agreed, 'SceneModelMatrix.test.ets:A0058', BUNDLE + '_SceneModelMatrix_0013').assertTrue();
      loggedExpect(decoded.value?.state.form.confirmed, 'SceneModelMatrix.test.ets:A0059', BUNDLE + '_SceneModelMatrix_0013').assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1400
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0014
     * @tc.desc      Verify decode rejects empty, malformed and oversized payloads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0014', 0, (): void => {
      loggedExpect(decodeScene('').value === undefined, 'SceneModelMatrix.test.ets:A0060', BUNDLE + '_SceneModelMatrix_0014').assertTrue();
      loggedExpect(decodeScene('{').value === undefined, 'SceneModelMatrix.test.ets:A0061', BUNDLE + '_SceneModelMatrix_0014').assertTrue();
      loggedExpect(decodeScene('x'.repeat(SCENE_LIMIT + 1)).value === undefined, 'SceneModelMatrix.test.ets:A0062', BUNDLE + '_SceneModelMatrix_0014').assertTrue();
      loggedExpect(decodeScene(undefined).value === undefined, 'SceneModelMatrix.test.ets:A0063', BUNDLE + '_SceneModelMatrix_0014').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1500
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0015
     * @tc.desc      Verify protocol, version, identity and revision guards reject bad documents
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0015', 0, (): void => {
      const good: string = encodeScene(noteDocument(1));
      loggedExpect(decodeScene(good.replace('appcontinuation.scene', 'other.scene')).value === undefined, 'SceneModelMatrix.test.ets:A0064', BUNDLE + '_SceneModelMatrix_0015').assertTrue();
      loggedExpect(decodeScene(good.replace('"version":1', '"version":2')).value === undefined, 'SceneModelMatrix.test.ets:A0065', BUNDLE + '_SceneModelMatrix_0015').assertTrue();
      loggedExpect(decodeScene(good.replace('"transferId":"tr-1"', '"transferId":"bad id!"')).value === undefined, 'SceneModelMatrix.test.ets:A0066', BUNDLE + '_SceneModelMatrix_0015')
        .assertTrue();
      loggedExpect(decodeScene(good.replace('"revision":1', `"revision":${REVISION_LIMIT + 1}`)).value === undefined, 'SceneModelMatrix.test.ets:A0067', BUNDLE + '_SceneModelMatrix_0015')
        .assertTrue();
      loggedExpect(decodeScene(good.replace('"documentId":"doc-1"', '"documentId":""')).value === undefined, 'SceneModelMatrix.test.ets:A0068', BUNDLE + '_SceneModelMatrix_0015').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1600
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0016
     * @tc.desc      Verify an unknown scene kind is rejected before any adapter runs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0016', 0, (): void => {
      const good: string = encodeScene(noteDocument(1));
      const unknown: string = good.replace('"scene":"note"', '"scene":"whiteboard"');
      loggedExpect(decodeScene(unknown).value === undefined, 'SceneModelMatrix.test.ets:A0069', BUNDLE + '_SceneModelMatrix_0016').assertTrue();
      loggedExpect(decodeScene(unknown).reason.length > 0, 'SceneModelMatrix.test.ets:A0070', BUNDLE + '_SceneModelMatrix_0016').assertTrue();
      loggedExpect(decodeScene(good).value !== undefined, 'SceneModelMatrix.test.ets:A0071', BUNDLE + '_SceneModelMatrix_0016').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1700
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0017
     * @tc.desc      Verify a reversed or surrogate-splitting note selection is refused
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0017', 0, (): void => {
      const reversed: SceneDocument = noteDocument(1);
      reversed.state.note.selectionStart = 5;
      reversed.state.note.selectionEnd = 2;
      const splitting: SceneDocument = noteDocument(1);
      splitting.state.note.body = '😀正文';
      splitting.state.note.selectionStart = 1;
      splitting.state.note.selectionEnd = 2;
      loggedExpect(decodeScene(encodeScene(reversed)).value === undefined, 'SceneModelMatrix.test.ets:A0072', BUNDLE + '_SceneModelMatrix_0017').assertTrue();
      loggedExpect(decodeScene(encodeScene(splitting)).value === undefined, 'SceneModelMatrix.test.ets:A0073', BUNDLE + '_SceneModelMatrix_0017').assertTrue();
      loggedExpect(decodeScene(encodeScene(noteDocument(1))).value !== undefined, 'SceneModelMatrix.test.ets:A0074', BUNDLE + '_SceneModelMatrix_0017').assertTrue();
      loggedExpect(decodeScene(encodeScene(noteDocument(1))).value !== undefined, 'SceneModelMatrix.test.ets:A0075', BUNDLE + '_SceneModelMatrix_0017').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1800
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0018
     * @tc.desc      Verify reading decode rejects a foreign book, duplicate bookmarks and overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0018', 0, (): void => {
      const foreign: SceneDocument = readingDocument();
      const duplicated: SceneDocument = readingDocument();
      duplicated.state.reading.bookmarks = [{ chapter: 0, anchor: 0 }, { chapter: 0, anchor: 0 }];
      const overflow: SceneDocument = readingDocument();
      const bookmarks: ReadingBookmark[] = [];
      for (let index: number = 0; index < 21; index++) {
        bookmarks.push({ chapter: 0, anchor: 0 });
      }
      overflow.state.reading.bookmarks = bookmarks;
      loggedExpect(decodeScene(encodeScene(foreign)).value !== undefined, 'SceneModelMatrix.test.ets:A0076', BUNDLE + '_SceneModelMatrix_0018').assertTrue();
      loggedExpect(decodeScene(encodeScene(duplicated)).value === undefined, 'SceneModelMatrix.test.ets:A0077', BUNDLE + '_SceneModelMatrix_0018').assertTrue();
      loggedExpect(decodeScene(encodeScene(overflow)).value === undefined, 'SceneModelMatrix.test.ets:A0078', BUNDLE + '_SceneModelMatrix_0018').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1900
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0019
     * @tc.desc      Verify a confirmed form is refused while it still has validation issues
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0019', 0, (): void => {
      const broken: SceneDocument = { transferId: 'tr-4', documentId: 'doc-4', revision: 1,
        state: emptyScene('form') };
      broken.state.form.confirmed = true;
      const valid: SceneDocument = { transferId: 'tr-5', documentId: 'doc-5', revision: 1,
        state: formStateOf() };
      valid.state.form.confirmed = true;
      loggedExpect(decodeScene(encodeScene(broken)).value === undefined, 'SceneModelMatrix.test.ets:A0079', BUNDLE + '_SceneModelMatrix_0019').assertTrue();
      const accepted: SceneRead = decodeScene(encodeScene(valid));
      loggedExpect(accepted.value !== undefined, 'SceneModelMatrix.test.ets:A0080', BUNDLE + '_SceneModelMatrix_0019').assertTrue();
      loggedExpect(accepted.value?.state.form.confirmed, 'SceneModelMatrix.test.ets:A0081', BUNDLE + '_SceneModelMatrix_0019').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2000
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0020
     * @tc.desc      Verify empty scene defaults and deep copying stay independent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0020', 0, (): void => {
      const scene: SceneState = emptyScene('note');
      loggedExpect(scene.kind, 'SceneModelMatrix.test.ets:A0082', BUNDLE + '_SceneModelMatrix_0020').assertEqual('note');
      loggedExpect(scene.note.title, 'SceneModelMatrix.test.ets:A0083', BUNDLE + '_SceneModelMatrix_0020').assertEqual('');
      loggedExpect(scene.reading.chapter, 'SceneModelMatrix.test.ets:A0084', BUNDLE + '_SceneModelMatrix_0020').assertEqual(0);
      loggedExpect(scene.form.agreed, 'SceneModelMatrix.test.ets:A0085', BUNDLE + '_SceneModelMatrix_0020').assertFalse();
      const copy: SceneState = copyScene(scene);
      copy.note.title = '改动';
      loggedExpect(scene.note.title, 'SceneModelMatrix.test.ets:A0086', BUNDLE + '_SceneModelMatrix_0020').assertEqual('');
      loggedExpect(copy.note.title, 'SceneModelMatrix.test.ets:A0087', BUNDLE + '_SceneModelMatrix_0020').assertEqual('改动');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2100
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0021
     * @tc.desc      Verify staging replaces the same kind and keeps only five older revisions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0021', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      loggedExpect(workspace.documents.length, 'SceneModelMatrix.test.ets:A0088', BUNDLE + '_SceneModelMatrix_0021').assertEqual(1);
      loggedExpect(workspace.active, 'SceneModelMatrix.test.ets:A0089', BUNDLE + '_SceneModelMatrix_0021').assertEqual('note');
      for (let revision: number = 2; revision <= 8; revision++) {
        workspace = stageScene(workspace, noteDocument(revision), 'note');
      }
      loggedExpect(workspace.documents.length, 'SceneModelMatrix.test.ets:A0090', BUNDLE + '_SceneModelMatrix_0021').assertEqual(1);
      loggedExpect(workspace.documents[0].revision, 'SceneModelMatrix.test.ets:A0091', BUNDLE + '_SceneModelMatrix_0021').assertEqual(8);
      loggedExpect(workspace.history.length, 'SceneModelMatrix.test.ets:A0092', BUNDLE + '_SceneModelMatrix_0021').assertEqual(5);
      loggedExpect(workspace.history[0].revision, 'SceneModelMatrix.test.ets:A0093', BUNDLE + '_SceneModelMatrix_0021').assertEqual(3);
      loggedExpect(workspace.history[4].revision, 'SceneModelMatrix.test.ets:A0094', BUNDLE + '_SceneModelMatrix_0021').assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2200
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0022
     * @tc.desc      Verify a different document id clears that kind's history
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0022', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      workspace = stageScene(workspace, noteDocument(2), 'note');
      loggedExpect(workspace.history.length, 'SceneModelMatrix.test.ets:A0095', BUNDLE + '_SceneModelMatrix_0022').assertEqual(1);
      const replaced: SceneDocument = noteDocument(3);
      replaced.documentId = 'doc-other';
      workspace = stageScene(workspace, replaced, 'note');
      loggedExpect(workspace.documents.length, 'SceneModelMatrix.test.ets:A0096', BUNDLE + '_SceneModelMatrix_0022').assertEqual(1);
      loggedExpect(workspace.documents[0].documentId, 'SceneModelMatrix.test.ets:A0097', BUNDLE + '_SceneModelMatrix_0022').assertEqual('doc-other');
      loggedExpect(workspace.history.length, 'SceneModelMatrix.test.ets:A0098', BUNDLE + '_SceneModelMatrix_0022').assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2300
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0023
     * @tc.desc      Verify a workspace round-trips through encode and decode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0023', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      workspace = stageScene(workspace, noteDocument(2), 'note');
      workspace = stageScene(workspace, readingDocument(), 'reading');
      const decoded: SceneWorkspace | undefined = decodeWorkspace(encodeWorkspace(workspace));
      loggedExpect(decoded !== undefined, 'SceneModelMatrix.test.ets:A0099', BUNDLE + '_SceneModelMatrix_0023').assertTrue();
      loggedExpect(decoded?.documents.length, 'SceneModelMatrix.test.ets:A0100', BUNDLE + '_SceneModelMatrix_0023').assertEqual(2);
      loggedExpect(decoded?.history.length, 'SceneModelMatrix.test.ets:A0101', BUNDLE + '_SceneModelMatrix_0023').assertEqual(1);
      loggedExpect(decoded?.active, 'SceneModelMatrix.test.ets:A0102', BUNDLE + '_SceneModelMatrix_0023').assertEqual('reading');
      loggedExpect(findScene(decoded as SceneWorkspace, 'reading')?.documentId, 'SceneModelMatrix.test.ets:A0103', BUNDLE + '_SceneModelMatrix_0023').assertEqual('doc-2');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2400
     * @tc.name      com.samples.appcontinuation_SceneModelMatrix_0024
     * @tc.desc      Verify workspace decode guards active kind, document limits and history order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(BUNDLE + '_SceneModelMatrix_0024', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      const encoded: string = encodeWorkspace(workspace);
      loggedExpect(decodeWorkspace(encoded.replace('"active":"note"', '"active":"unknown"')) === undefined, 'SceneModelMatrix.test.ets:A0104', BUNDLE + '_SceneModelMatrix_0024').assertTrue();
      loggedExpect(decodeWorkspace('') === undefined, 'SceneModelMatrix.test.ets:A0105', BUNDLE + '_SceneModelMatrix_0024').assertTrue();
      loggedExpect(decodeWorkspace('{') === undefined, 'SceneModelMatrix.test.ets:A0106', BUNDLE + '_SceneModelMatrix_0024').assertTrue();
      const badActive: SceneWorkspace | undefined = decodeWorkspace(
        encoded.replace('"active":"note"', '"active":"reading"'));
      loggedExpect(badActive === undefined, 'SceneModelMatrix.test.ets:A0107', BUNDLE + '_SceneModelMatrix_0024').assertTrue();
    });
  });
}
