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
import { ON, UiTestSession, uiCase as loggedCase } from '../support/UiTestRuntime';
import { localize } from '../../../main/ets/common/LocaleStrings';
import { decodePayload } from '../../../main/ets/learning/LearningPayload';
import { FORM_STEPS, READING_CHAPTERS } from '../../../main/ets/learning/scene/SceneModel';
import { BUNDLE } from '../support/BoundedCase';
import { loggedExpect } from '../support/LoggedExpect';
import {
  currentFormalSceneUiQa, formalSceneUiQaClick, formalSceneUiQaInput,
  formalSceneUiQaNode, formalSceneUiQaSavedScene, formalSceneUiQaText, launchFormalSceneUiQa
} from '../support/FormalSceneUiQaSupport';

// Synthetic fixture data only; field comparisons log booleans, not personal text values.
const TEXT_VALUE: string = 'Formal UI synthetic text 42';
const NOTE_TITLE: string = 'Formal UI synthetic note';
const NOTE_BODY: string = 'Formal UI synthetic body 42';
const FORM_NAME: string = 'Formal QA User';
const FORM_PHONE: string = '10000000000';
const FORM_ADDRESS: string = 'Formal QA Address 42';

export default function formalSceneUiSmokeTests(): void {
  describe('FormalSceneUiSmoke', (): void => {

    /**
     * @tc.number SUB_CONTINUATION_FORMALSCENEUI_0100
     * @tc.name com.samples.appcontinuation_FormalSceneUiSmoke_0001
     * @tc.desc Driver edits the shared production TextArea and clicks Save; rendered text and durable text agree.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    loggedCase(BUNDLE + '_FormalSceneUiSmoke_0001', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchFormalSceneUiQa(session, 'text'));
      const fixture = currentFormalSceneUiQa();
      await session.guard(formalSceneUiQaInput(driver, 'ACTextEditor', TEXT_VALUE));
      loggedExpect(await formalSceneUiQaText(driver, 'ACTextEditor') === TEXT_VALUE,
        'FormalSceneUiSmoke:A0001', BUNDLE + '_FormalSceneUiSmoke_0001').assertTrue();
      loggedExpect(fixture.controller.snapshot().text === TEXT_VALUE,
        'FormalSceneUiSmoke:A0002', BUNDLE + '_FormalSceneUiSmoke_0001').assertTrue();
      loggedExpect(fixture.textStore.flushCalls,
        'FormalSceneUiSmoke:A0003', BUNDLE + '_FormalSceneUiSmoke_0001').assertEqual(0);
      await session.guard(formalSceneUiQaClick(driver, 'ACTextSave'));
      const persisted = decodePayload(fixture.textStore.stored()).value;
      if (persisted === undefined) { throw new Error('Formal text durable payload is missing or invalid'); }
      loggedExpect(await formalSceneUiQaText(driver, 'ACTextEditor') === TEXT_VALUE,
        'FormalSceneUiSmoke:A0004', BUNDLE + '_FormalSceneUiSmoke_0001').assertTrue();
      loggedExpect(await formalSceneUiQaText(driver, 'ACTextSavedState'),
        'FormalSceneUiSmoke:A0005', BUNDLE + '_FormalSceneUiSmoke_0001')
        .assertEqual(localize('ac_learningcontroller_175'));
      loggedExpect(persisted.text === TEXT_VALUE,
        'FormalSceneUiSmoke:A0006', BUNDLE + '_FormalSceneUiSmoke_0001').assertTrue();
      loggedExpect(persisted.revision,
        'FormalSceneUiSmoke:A0007', BUNDLE + '_FormalSceneUiSmoke_0001').assertEqual(1);
      loggedExpect(fixture.controller.snapshot().revision,
        'FormalSceneUiSmoke:A0008', BUNDLE + '_FormalSceneUiSmoke_0001').assertEqual(1);
      loggedExpect(persisted.documentId.length > 0 &&
        persisted.documentId === fixture.controller.snapshot().documentId,
        'FormalSceneUiSmoke:A0009', BUNDLE + '_FormalSceneUiSmoke_0001').assertTrue();
      loggedExpect(fixture.textStore.flushCalls,
        'FormalSceneUiSmoke:A0010', BUNDLE + '_FormalSceneUiSmoke_0001').assertEqual(1);
      loggedExpect(fixture.sceneStore.flushCalls,
        'FormalSceneUiSmoke:A0011', BUNDLE + '_FormalSceneUiSmoke_0001').assertEqual(0);
    });

    /**
     * @tc.number SUB_CONTINUATION_FORMALSCENEUI_0200
     * @tc.name com.samples.appcontinuation_FormalSceneUiSmoke_0002
     * @tc.desc Driver edits the production note title/body and saves a new revision with matching saved baselines.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    loggedCase(BUNDLE + '_FormalSceneUiSmoke_0002', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchFormalSceneUiQa(session, 'note'));
      const fixture = currentFormalSceneUiQa();
      const revision = fixture.controller.sceneSnapshot('note').revision;
      await session.guard(formalSceneUiQaInput(driver, 'ACNoteTitle', NOTE_TITLE));
      await session.guard(formalSceneUiQaInput(driver, 'ACNoteBody', NOTE_BODY));
      loggedExpect(await formalSceneUiQaText(driver, 'ACNoteTitle') === NOTE_TITLE,
        'FormalSceneUiSmoke:A0012', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(await formalSceneUiQaText(driver, 'ACNoteBody') === NOTE_BODY,
        'FormalSceneUiSmoke:A0013', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(fixture.controller.sceneSnapshot('note').noteDirty,
        'FormalSceneUiSmoke:A0014', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(fixture.sceneStore.flushCalls,
        'FormalSceneUiSmoke:A0015', BUNDLE + '_FormalSceneUiSmoke_0002').assertEqual(0);
      await session.guard(formalSceneUiQaClick(driver, 'ACNoteSave'));
      const saved = formalSceneUiQaSavedScene('note');
      loggedExpect(await formalSceneUiQaText(driver, 'ACNoteTitle') === NOTE_TITLE,
        'FormalSceneUiSmoke:A0016', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(await formalSceneUiQaText(driver, 'ACNoteBody') === NOTE_BODY,
        'FormalSceneUiSmoke:A0017', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(await formalSceneUiQaText(driver, 'ACNoteStatus'),
        'FormalSceneUiSmoke:A0018', BUNDLE + '_FormalSceneUiSmoke_0002')
        .assertEqual(localize('ac_sceneworkbench_015', ['note', String(revision + 1)]));
      loggedExpect(saved.revision,
        'FormalSceneUiSmoke:A0019', BUNDLE + '_FormalSceneUiSmoke_0002').assertEqual(revision + 1);
      loggedExpect(saved.state.note.title === NOTE_TITLE && saved.state.note.savedTitle === NOTE_TITLE,
        'FormalSceneUiSmoke:A0020', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(saved.state.note.body === NOTE_BODY && saved.state.note.savedBody === NOTE_BODY,
        'FormalSceneUiSmoke:A0021', BUNDLE + '_FormalSceneUiSmoke_0002').assertTrue();
      loggedExpect(fixture.controller.sceneSnapshot('note').noteDirty,
        'FormalSceneUiSmoke:A0022', BUNDLE + '_FormalSceneUiSmoke_0002').assertFalse();
      loggedExpect(fixture.sceneStore.flushCalls,
        'FormalSceneUiSmoke:A0023', BUNDLE + '_FormalSceneUiSmoke_0002').assertEqual(1);
      loggedExpect(fixture.textStore.flushCalls,
        'FormalSceneUiSmoke:A0024', BUNDLE + '_FormalSceneUiSmoke_0002').assertEqual(0);
    });

    /**
     * @tc.number SUB_CONTINUATION_FORMALSCENEUI_0300
     * @tc.name com.samples.appcontinuation_FormalSceneUiSmoke_0003
     * @tc.desc Driver changes chapters, bookmarks a rendered paragraph, leaves it and jumps back through the real bookmark.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    loggedCase(BUNDLE + '_FormalSceneUiSmoke_0003', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchFormalSceneUiQa(session, 'reading'));
      const fixture = currentFormalSceneUiQa();
      await session.guard(formalSceneUiQaClick(driver, 'ACReadingChapters'));
      await session.guard(formalSceneUiQaClick(driver, 'ACReadingChapter1'));
      loggedExpect(await formalSceneUiQaText(driver, 'ACReadingParagraph'),
        'FormalSceneUiSmoke:A0025', BUNDLE + '_FormalSceneUiSmoke_0003')
        .assertEqual(READING_CHAPTERS[1].paragraphs[0]);
      loggedExpect(fixture.controller.sceneSnapshot('reading').readingChapter,
        'FormalSceneUiSmoke:A0026', BUNDLE + '_FormalSceneUiSmoke_0003').assertEqual(1);
      await session.guard(formalSceneUiQaClick(driver, 'ACReadingBookmark'));
      loggedExpect(await formalSceneUiQaText(driver, 'ACReadingBookmarkCount'),
        'FormalSceneUiSmoke:A0027', BUNDLE + '_FormalSceneUiSmoke_0003')
        .assertEqual(localize('ac_readingscenepage_010', [1]));
      loggedExpect(fixture.controller.sceneSnapshot('reading').bookmarks.length,
        'FormalSceneUiSmoke:A0028', BUNDLE + '_FormalSceneUiSmoke_0003').assertEqual(1);
      await session.guard(formalSceneUiQaClick(driver, 'ACReadingChapter2'));
      loggedExpect(await formalSceneUiQaText(driver, 'ACReadingParagraph'),
        'FormalSceneUiSmoke:A0029', BUNDLE + '_FormalSceneUiSmoke_0003')
        .assertEqual(READING_CHAPTERS[2].paragraphs[0]);
      loggedExpect(fixture.controller.sceneSnapshot('reading').readingChapter,
        'FormalSceneUiSmoke:A0030', BUNDLE + '_FormalSceneUiSmoke_0003').assertEqual(2);
      await session.guard(formalSceneUiQaClick(driver, 'ACReadingBookmarkJump0'));
      loggedExpect(await formalSceneUiQaText(driver, 'ACReadingParagraph'),
        'FormalSceneUiSmoke:A0031', BUNDLE + '_FormalSceneUiSmoke_0003')
        .assertEqual(READING_CHAPTERS[1].paragraphs[0]);
      const returned = fixture.controller.sceneSnapshot('reading');
      loggedExpect(returned.readingChapter,
        'FormalSceneUiSmoke:A0032', BUNDLE + '_FormalSceneUiSmoke_0003').assertEqual(1);
      loggedExpect(returned.readingAnchor,
        'FormalSceneUiSmoke:A0033', BUNDLE + '_FormalSceneUiSmoke_0003').assertEqual(0);
      loggedExpect(returned.bookmarks[0].chapter === 1 && returned.bookmarks[0].anchor === 0,
        'FormalSceneUiSmoke:A0034', BUNDLE + '_FormalSceneUiSmoke_0003').assertTrue();
      loggedExpect(fixture.sceneStore.flushCalls,
        'FormalSceneUiSmoke:A0035', BUNDLE + '_FormalSceneUiSmoke_0003').assertEqual(0);
    });

    /**
     * @tc.number SUB_CONTINUATION_FORMALSCENEUI_0400
     * @tc.name com.samples.appcontinuation_FormalSceneUiSmoke_0004
     * @tc.desc Empty required fields block Next; Driver fills synthetic fields, reaches Address and saves a draft baseline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    loggedCase(BUNDLE + '_FormalSceneUiSmoke_0004', 0, async (session: UiTestSession): Promise<void> => {
      const driver = await session.guard(launchFormalSceneUiQa(session, 'form'));
      const fixture = currentFormalSceneUiQa();
      await session.guard(formalSceneUiQaClick(driver, 'ACFormNextStep'));
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormStepLabel'),
        'FormalSceneUiSmoke:A0036', BUNDLE + '_FormalSceneUiSmoke_0004')
        .assertEqual(localize('ac_formscenepage_003', [1, FORM_STEPS[0]]));
      loggedExpect(fixture.controller.sceneSnapshot('form').formStep,
        'FormalSceneUiSmoke:A0037', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(0);
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormIssues'),
        'FormalSceneUiSmoke:A0038', BUNDLE + '_FormalSceneUiSmoke_0004')
        .assertEqual(localize('ac_formscenepage_009', [
          [localize('ac_scenemodel_016'), localize('ac_scenemodel_018')].join('；')
        ]));
      loggedExpect(await (await formalSceneUiQaNode(driver, 'ACFormName')).isEnabled(),
        'FormalSceneUiSmoke:A0039', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      const blockedAddress = await session.guard(driver.findComponent(ON.id('ACFormAddress')));
      loggedExpect(blockedAddress === undefined || blockedAddress === null,
        'FormalSceneUiSmoke:A0040', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      loggedExpect(fixture.sceneStore.flushCalls,
        'FormalSceneUiSmoke:A0041', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(0);
      await session.guard(formalSceneUiQaInput(driver, 'ACFormName', FORM_NAME));
      await session.guard(formalSceneUiQaInput(driver, 'ACFormPhone', FORM_PHONE));
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormName') === FORM_NAME,
        'FormalSceneUiSmoke:A0042', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormPhone') === FORM_PHONE,
        'FormalSceneUiSmoke:A0043', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      await session.guard(formalSceneUiQaClick(driver, 'ACFormNextStep'));
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormStepLabel'),
        'FormalSceneUiSmoke:A0044', BUNDLE + '_FormalSceneUiSmoke_0004')
        .assertEqual(localize('ac_formscenepage_003', [2, FORM_STEPS[1]]));
      loggedExpect(fixture.controller.sceneSnapshot('form').formStep,
        'FormalSceneUiSmoke:A0045', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(1);
      await session.guard(formalSceneUiQaInput(driver, 'ACFormAddress', FORM_ADDRESS));
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormAddress') === FORM_ADDRESS,
        'FormalSceneUiSmoke:A0046', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      await session.guard(formalSceneUiQaClick(driver, 'ACFormSave'));
      const saved = formalSceneUiQaSavedScene('form');
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormAddress') === FORM_ADDRESS,
        'FormalSceneUiSmoke:A0047', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      loggedExpect(await formalSceneUiQaText(driver, 'ACFormStepLabel'),
        'FormalSceneUiSmoke:A0048', BUNDLE + '_FormalSceneUiSmoke_0004')
        .assertEqual(localize('ac_formscenepage_003', [2, FORM_STEPS[1]]));
      loggedExpect(saved.state.form.name === FORM_NAME && saved.state.form.phone === FORM_PHONE,
        'FormalSceneUiSmoke:A0049', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      loggedExpect(saved.state.form.address === FORM_ADDRESS,
        'FormalSceneUiSmoke:A0050', BUNDLE + '_FormalSceneUiSmoke_0004').assertTrue();
      loggedExpect(saved.state.form.step,
        'FormalSceneUiSmoke:A0051', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(1);
      loggedExpect(saved.state.form.savedStep,
        'FormalSceneUiSmoke:A0052', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(1);
      loggedExpect(saved.state.form.confirmed,
        'FormalSceneUiSmoke:A0053', BUNDLE + '_FormalSceneUiSmoke_0004').assertFalse();
      loggedExpect(saved.revision,
        'FormalSceneUiSmoke:A0054', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(1);
      loggedExpect(fixture.controller.sceneSnapshot('form').formDirty,
        'FormalSceneUiSmoke:A0055', BUNDLE + '_FormalSceneUiSmoke_0004').assertFalse();
      loggedExpect(fixture.sceneStore.flushCalls,
        'FormalSceneUiSmoke:A0056', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(1);
      loggedExpect(fixture.textStore.flushCalls,
        'FormalSceneUiSmoke:A0057', BUNDLE + '_FormalSceneUiSmoke_0004').assertEqual(0);
    });
  });
}
