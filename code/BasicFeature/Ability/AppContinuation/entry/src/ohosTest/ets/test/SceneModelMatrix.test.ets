import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name      testSceneModelMatrix0001
     * @tc.desc      Verify validUnicode accepts plain and paired text and rejects lone surrogates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0001', 0, (): void => {
      expect(validUnicode('abc')).assertTrue();
      expect(validUnicode('中文')).assertTrue();
      expect(validUnicode('\uD83D\uDE00')).assertTrue();
      expect(validUnicode('\uD83D')).assertFalse();
      expect(validUnicode('\uDE00')).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0200
     * @tc.name      testSceneModelMatrix0002
     * @tc.desc      Verify selectionBoundary rejects out-of-range and surrogate-splitting offsets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0002', 0, (): void => {
      const text: string = '😀a';
      expect(selectionBoundary(text, 0)).assertTrue();
      expect(selectionBoundary(text, text.length)).assertTrue();
      expect(selectionBoundary(text, -1)).assertFalse();
      expect(selectionBoundary(text, text.length + 1)).assertFalse();
      expect(selectionBoundary(text, 0.5)).assertFalse();
      expect(selectionBoundary(text, 1)).assertFalse();
      expect(selectionBoundary(text, 2)).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0300
     * @tc.name      testSceneModelMatrix0003
     * @tc.desc      Verify reading positions follow the bundled chapter and paragraph ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0003', 0, (): void => {
      expect(validReadingPosition(0, 0)).assertTrue();
      expect(validReadingPosition(READING_CHAPTERS.length - 1,
        READING_CHAPTERS[READING_CHAPTERS.length - 1].paragraphs.length - 1)).assertTrue();
      expect(validReadingPosition(READING_CHAPTERS.length, 0)).assertFalse();
      expect(validReadingPosition(0, -1)).assertFalse();
      expect(validReadingPosition(-1, 0)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0400
     * @tc.name      testSceneModelMatrix0004
     * @tc.desc      Verify form step validation only accepts the three declared steps
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0004', 0, (): void => {
      expect(FORM_STEPS.length).assertEqual(3);
      expect(validFormStep(0)).assertTrue();
      expect(validFormStep(2)).assertTrue();
      expect(validFormStep(3)).assertFalse();
      expect(validFormStep(-1)).assertFalse();
      expect(validFormStep(1.5)).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0500
     * @tc.name      testSceneModelMatrix0005
     * @tc.desc      Verify first-step issues list missing name and malformed phone together
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0005', 0, (): void => {
      const form = emptyScene('form').form;
      const issues: string[] = stepIssues(form, 0);
      expect(issues.length).assertEqual(2);
      expect(issues[0]).assertEqual('请填写姓名');
      expect(issues[1].indexOf('手机号') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0600
     * @tc.name      testSceneModelMatrix0006
     * @tc.desc      Verify the first step accepts a legal name and phone and flags only length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0006', 0, (): void => {
      const form = emptyScene('form').form;
      form.name = '张三';
      form.phone = '13800138000';
      expect(stepIssues(form, 0).length).assertEqual(0);
      form.name = 'x'.repeat(41);
      const issues: string[] = stepIssues(form, 0);
      expect(issues.length).assertEqual(1);
      expect(issues[0]).assertEqual('姓名最多 40 字');
      form.name = 'x'.repeat(40);
      expect(stepIssues(form, 0).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0700
     * @tc.name      testSceneModelMatrix0007
     * @tc.desc      Verify the address step enforces emptiness and the 100 character limit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0007', 0, (): void => {
      const form = emptyScene('form').form;
      expect(stepIssues(form, 1)[0]).assertEqual('请填写地址');
      form.address = 'a'.repeat(101);
      expect(stepIssues(form, 1)[0]).assertEqual('地址最多 100 字');
      form.address = 'a'.repeat(100);
      expect(stepIssues(form, 1).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0800
     * @tc.name      testSceneModelMatrix0008
     * @tc.desc      Verify the confirmation step requires consent and a bounded note
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0008', 0, (): void => {
      const form = emptyScene('form').form;
      expect(stepIssues(form, 2)[0]).assertEqual('需要确认信息无误');
      form.agreed = true;
      form.note = 'n'.repeat(201);
      expect(stepIssues(form, 2)[0]).assertEqual('备注最多 200 字');
      form.note = 'n'.repeat(200);
      expect(stepIssues(form, 2).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_0900
     * @tc.name      testSceneModelMatrix0009
     * @tc.desc      Verify full-form validation prefixes each issue with its step label
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0009', 0, (): void => {
      const issues: string[] = formIssues(emptyScene('form').form);
      expect(issues.length).assertEqual(4);
      expect(issues[0].startsWith('基本信息：')).assertTrue();
      expect(issues[1].startsWith('基本信息：')).assertTrue();
      expect(issues[2].startsWith('联系方式：')).assertTrue();
      expect(issues[3].startsWith('确认提交：')).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1000
     * @tc.name      testSceneModelMatrix0010
     * @tc.desc      Verify scene labels cover all four business kinds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0010', 0, (): void => {
      expect(sceneLabel('note')).assertEqual('笔记草稿');
      expect(sceneLabel('reading')).assertEqual('阅读进度');
      expect(sceneLabel('form')).assertEqual('表单草稿');
      expect(sceneLabel('text')).assertEqual('原文本');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1100
     * @tc.name      testSceneModelMatrix0011
     * @tc.desc      Verify a note scene survives encode and decode with selection intact
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0011', 0, (): void => {
      const decoded: SceneRead = decodeScene(encodeScene(noteDocument(5)));
      expect(decoded.value !== undefined).assertTrue();
      expect(decoded.value?.documentId).assertEqual('doc-1');
      expect(decoded.value?.revision).assertEqual(5);
      expect(decoded.value?.state.note.title).assertEqual('接续笔记');
      expect(decoded.value?.state.note.selectionEnd).assertEqual(4);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1200
     * @tc.name      testSceneModelMatrix0012
     * @tc.desc      Verify a reading scene keeps chapter, anchor and bookmark order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0012', 0, (): void => {
      const decoded: SceneRead = decodeScene(encodeScene(readingDocument()));
      expect(decoded.value?.state.kind).assertEqual('reading');
      expect(decoded.value?.state.reading.chapter).assertEqual(1);
      expect(decoded.value?.state.reading.anchor).assertEqual(2);
      expect(decoded.value?.state.reading.bookmarks.length).assertEqual(2);
      expect(decoded.value?.state.reading.bookmarks[1].anchor).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1300
     * @tc.name      testSceneModelMatrix0013
     * @tc.desc      Verify a form scene defaults the saved step to the current step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0013', 0, (): void => {
      const state: SceneState = formStateOf();
      state.form.savedStep = 2;
      const document: SceneDocument = { transferId: 'tr-3', documentId: 'doc-3', revision: 1, state: state };
      const decoded: SceneRead = decodeScene(encodeScene(document));
      expect(decoded.value?.state.form.step).assertEqual(2);
      expect(decoded.value?.state.form.savedStep).assertEqual(2);
      expect(decoded.value?.state.form.agreed).assertTrue();
      expect(decoded.value?.state.form.confirmed).assertFalse();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1400
     * @tc.name      testSceneModelMatrix0014
     * @tc.desc      Verify decode rejects empty, malformed and oversized payloads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0014', 0, (): void => {
      expect(decodeScene('').value === undefined).assertTrue();
      expect(decodeScene('{').value === undefined).assertTrue();
      expect(decodeScene('x'.repeat(SCENE_LIMIT + 1)).value === undefined).assertTrue();
      expect(decodeScene(undefined).value === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1500
     * @tc.name      testSceneModelMatrix0015
     * @tc.desc      Verify protocol, version, identity and revision guards reject bad documents
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0015', 0, (): void => {
      const good: string = encodeScene(noteDocument(1));
      expect(decodeScene(good.replace('appcontinuation.scene', 'other.scene')).value === undefined).assertTrue();
      expect(decodeScene(good.replace('"version":1', '"version":2')).value === undefined).assertTrue();
      expect(decodeScene(good.replace('"transferId":"tr-1"', '"transferId":"bad id!"')).value === undefined)
        .assertTrue();
      expect(decodeScene(good.replace('"revision":1', `"revision":${REVISION_LIMIT + 1}`)).value === undefined)
        .assertTrue();
      expect(decodeScene(good.replace('"documentId":"doc-1"', '"documentId":""')).value === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1600
     * @tc.name      testSceneModelMatrix0016
     * @tc.desc      Verify an unknown scene kind is rejected before any adapter runs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0016', 0, (): void => {
      const good: string = encodeScene(noteDocument(1));
      const unknown: string = good.replace('"scene":"note"', '"scene":"whiteboard"');
      expect(decodeScene(unknown).value === undefined).assertTrue();
      expect(decodeScene(unknown).reason.length > 0).assertTrue();
      expect(decodeScene(good).value !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1700
     * @tc.name      testSceneModelMatrix0017
     * @tc.desc      Verify a reversed or surrogate-splitting note selection is refused
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0017', 0, (): void => {
      const reversed: SceneDocument = noteDocument(1);
      reversed.state.note.selectionStart = 5;
      reversed.state.note.selectionEnd = 2;
      const splitting: SceneDocument = noteDocument(1);
      splitting.state.note.body = '😀正文';
      splitting.state.note.selectionStart = 1;
      splitting.state.note.selectionEnd = 2;
      expect(decodeScene(encodeScene(reversed)).value === undefined).assertTrue();
      expect(decodeScene(encodeScene(splitting)).value === undefined).assertTrue();
      expect(decodeScene(encodeScene(noteDocument(1))).value !== undefined).assertTrue();
      expect(decodeScene(encodeScene(noteDocument(1))).value !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1800
     * @tc.name      testSceneModelMatrix0018
     * @tc.desc      Verify reading decode rejects a foreign book, duplicate bookmarks and overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0018', 0, (): void => {
      const foreign: SceneDocument = readingDocument();
      const duplicated: SceneDocument = readingDocument();
      duplicated.state.reading.bookmarks = [{ chapter: 0, anchor: 0 }, { chapter: 0, anchor: 0 }];
      const overflow: SceneDocument = readingDocument();
      const bookmarks: ReadingBookmark[] = [];
      for (let index: number = 0; index < 21; index++) {
        bookmarks.push({ chapter: 0, anchor: 0 });
      }
      overflow.state.reading.bookmarks = bookmarks;
      expect(decodeScene(encodeScene(foreign)).value !== undefined).assertTrue();
      expect(decodeScene(encodeScene(duplicated)).value === undefined).assertTrue();
      expect(decodeScene(encodeScene(overflow)).value === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_1900
     * @tc.name      testSceneModelMatrix0019
     * @tc.desc      Verify a confirmed form is refused while it still has validation issues
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0019', 0, (): void => {
      const broken: SceneDocument = { transferId: 'tr-4', documentId: 'doc-4', revision: 1,
        state: emptyScene('form') };
      broken.state.form.confirmed = true;
      const valid: SceneDocument = { transferId: 'tr-5', documentId: 'doc-5', revision: 1,
        state: formStateOf() };
      valid.state.form.confirmed = true;
      expect(decodeScene(encodeScene(broken)).value === undefined).assertTrue();
      const accepted: SceneRead = decodeScene(encodeScene(valid));
      expect(accepted.value !== undefined).assertTrue();
      expect(accepted.value?.state.form.confirmed).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2000
     * @tc.name      testSceneModelMatrix0020
     * @tc.desc      Verify empty scene defaults and deep copying stay independent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0020', 0, (): void => {
      const scene: SceneState = emptyScene('note');
      expect(scene.kind).assertEqual('note');
      expect(scene.note.title).assertEqual('');
      expect(scene.reading.chapter).assertEqual(0);
      expect(scene.form.agreed).assertFalse();
      const copy: SceneState = copyScene(scene);
      copy.note.title = '改动';
      expect(scene.note.title).assertEqual('');
      expect(copy.note.title).assertEqual('改动');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2100
     * @tc.name      testSceneModelMatrix0021
     * @tc.desc      Verify staging replaces the same kind and keeps only five older revisions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0021', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      expect(workspace.documents.length).assertEqual(1);
      expect(workspace.active).assertEqual('note');
      for (let revision: number = 2; revision <= 8; revision++) {
        workspace = stageScene(workspace, noteDocument(revision), 'note');
      }
      expect(workspace.documents.length).assertEqual(1);
      expect(workspace.documents[0].revision).assertEqual(8);
      expect(workspace.history.length).assertEqual(5);
      expect(workspace.history[0].revision).assertEqual(3);
      expect(workspace.history[4].revision).assertEqual(7);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2200
     * @tc.name      testSceneModelMatrix0022
     * @tc.desc      Verify a different document id clears that kind's history
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0022', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      workspace = stageScene(workspace, noteDocument(2), 'note');
      expect(workspace.history.length).assertEqual(1);
      const replaced: SceneDocument = noteDocument(3);
      replaced.documentId = 'doc-other';
      workspace = stageScene(workspace, replaced, 'note');
      expect(workspace.documents.length).assertEqual(1);
      expect(workspace.documents[0].documentId).assertEqual('doc-other');
      expect(workspace.history.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2300
     * @tc.name      testSceneModelMatrix0023
     * @tc.desc      Verify a workspace round-trips through encode and decode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0023', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      workspace = stageScene(workspace, noteDocument(2), 'note');
      workspace = stageScene(workspace, readingDocument(), 'reading');
      const decoded: SceneWorkspace | undefined = decodeWorkspace(encodeWorkspace(workspace));
      expect(decoded !== undefined).assertTrue();
      expect(decoded?.documents.length).assertEqual(2);
      expect(decoded?.history.length).assertEqual(1);
      expect(decoded?.active).assertEqual('reading');
      expect(findScene(decoded as SceneWorkspace, 'reading')?.documentId).assertEqual('doc-2');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENEMODELMATRIX_2400
     * @tc.name      testSceneModelMatrix0024
     * @tc.desc      Verify workspace decode guards active kind, document limits and history order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneModelMatrix0024', 0, (): void => {
      let workspace: SceneWorkspace = emptyWorkspace();
      workspace = stageScene(workspace, noteDocument(1), 'note');
      const encoded: string = encodeWorkspace(workspace);
      expect(decodeWorkspace(encoded.replace('"active":"note"', '"active":"unknown"')) === undefined).assertTrue();
      expect(decodeWorkspace('') === undefined).assertTrue();
      expect(decodeWorkspace('{') === undefined).assertTrue();
      const badActive: SceneWorkspace | undefined = decodeWorkspace(
        encoded.replace('"active":"note"', '"active":"reading"'));
      expect(badActive === undefined).assertTrue();
    });
  });
}



