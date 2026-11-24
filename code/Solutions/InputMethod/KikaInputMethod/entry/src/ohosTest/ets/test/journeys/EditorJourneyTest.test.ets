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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodEditorJourney]';

export default function editorJourneyTest(): void {
  describe('EditorJourneyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0001
     * @tc.name      testEditorJourney_001
     * @tc.desc      Verify that a begin move, an insertion and enter complete one preview journey.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.buffer.charAt(harness.client.buffer.length - 1)).assertEqual('x');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0002
     * @tc.name      testEditorJourney_002
     * @tc.desc      Verify that cut, paste and an end selection precede one finishing enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.extendActions.join('|')).assertEqual('3|5');
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0003
     * @tc.name      testEditorJourney_003
     * @tc.desc      Verify that clearing a preview fault lets the same session resume previewing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('h');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer.indexOf('hello world') >= 0).assertTrue();
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0004
     * @tc.name      testEditorJourney_004
     * @tc.desc      Verify that a private-command fault, one hide and enter still each count once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      InputHandler.getInstance().insertText('j');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0005
     * @tc.name      testEditorJourney_005
     * @tc.desc      Verify that a caret-first move followed by begin selection keeps the range anchored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().moveCursorToEnd();
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0006
     * @tc.name      testEditorJourney_006
     * @tc.desc      Verify that diagnostics set during a preview remain in the refreshed summary after enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().setSelectInfo('SEL-preview');
      InputHandler.getInstance().setTextInfo('TXT-preview');
      InputHandler.getInstance().setInputInfo('INP-preview');
      InputHandler.getInstance().sendKeyFunction();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('SEL-preview') >= 0).assertTrue();
      expect(summary.indexOf('INP-preview') >= 0).assertTrue();
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0007
     * @tc.name      testEditorJourney_007
     * @tc.desc      Verify that a begin move, an insertion and an end selection precede one finishing enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().insertText('x');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].start).assertEqual(11);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      expect(harness.client.buffer.charAt(harness.client.buffer.length - 1)).assertEqual('x');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0008
     * @tc.name      testEditorJourney_008
     * @tc.desc      Verify that returning to the first editor routes its forward deletion and enter away from the second.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_008 begin');
      const first: PreviewHarness = await createPreviewHarness('abc');
      const second: PreviewHarness = await createPreviewHarness('');
      typeSequence(second, 'xyz');
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.forwardLengths.join('')).assertEqual('2');
      expect(second.client.forwardLengths.length).assertEqual(0);
      expect(first.client.finishCount).assertEqual(1);
      expect(second.client.finishCount).assertEqual(0);
      expect(second.client.buffer).assertEqual('xyz');
      expect(first.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0009
     * @tc.name      testEditorJourney_009
     * @tc.desc      Verify that a finish-fault journey counts its commit and the following journey commits once more.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_009 begin');
      const faulty: PreviewHarness = await createPreviewHarness('', 4);
      faulty.client.failFinish = true;
      typeSequence(faulty, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().sendKeyFunction();
      const smooth: PreviewHarness = await createPreviewHarness('', 6);
      typeSequence(smooth, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().sendKeyFunction();

      expect(faulty.client.finishCount).assertEqual(1);
      expect(smooth.client.finishCount).assertEqual(1);
      expect(faulty.client.keyFunctions[0]).assertEqual(4);
      expect(smooth.client.keyFunctions[0]).assertEqual(6);
      expect(faulty.client.selectedRanges[0].end).assertEqual(10);
      expect(smooth.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0010
     * @tc.name      testEditorJourney_010
     * @tc.desc      Verify that two refreshes around a commit keep the early select marker and add the later text marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      InputHandler.getInstance().setSelectInfo('SEL-journey');
      InputHandler.getInstance().insertText('c');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const beforeCommit: string = AppStorage.get<string>('showLog') ?? '';
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().setTextInfo('TXT-after');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const afterCommit: string = AppStorage.get<string>('showLog') ?? '';

      expect(beforeCommit.indexOf('SEL-journey') >= 0).assertTrue();
      expect(beforeCommit.indexOf('TXT-after')).assertEqual(-1);
      expect(afterCommit.indexOf('TXT-after') >= 0).assertTrue();
      expect(afterCommit.indexOf('before：[abc]') >= 0).assertTrue();
      expect(harness.client.forwardQueries.length).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0011
     * @tc.name      testEditorJourney_011
     * @tc.desc      Verify that begin and end selections around a short buffer record one-based and tail ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'ab');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      const starts: number[] = [harness.client.selectedRanges[0].start, harness.client.selectedRanges[1].start];
      const ends: number[] = [harness.client.selectedRanges[0].end, harness.client.selectedRanges[1].end];

      expect(starts.join('|')).assertEqual('0|1');
      expect(ends.join('|')).assertEqual('1|1000');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0012
     * @tc.name      testEditorJourney_012
     * @tc.desc      Verify that a cut on an empty editor is forwarded before the enter finishes the empty buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendKeyFunction();
      const actions: inputMethodEngine.ExtendAction[] = harness.client.extendActions;

      expect(actions.length).assertEqual(1);
      expect(actions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0013
     * @tc.name      testEditorJourney_013
     * @tc.desc      Verify that hiding the first editor leaves the second editor free to finish on enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_013 begin');
      const hidden: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const shown: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();

      expect(hidden.keyboard.hideCount).assertEqual(1);
      expect(hidden.client.finishCount).assertEqual(0);
      expect(shown.keyboard.hideCount).assertEqual(0);
      expect(shown.client.finishCount).assertEqual(1);
      expect(shown.client.keyFunctions[0]).assertEqual(2);
      expect(shown.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0014
     * @tc.name      testEditorJourney_014
     * @tc.desc      Verify that two direct caret moves reach the editor in issue order without touching the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('text');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      const directions: number[] = harness.client.movedDirections;

      expect(directions.length).assertEqual(2);
      expect(directions[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(directions[1]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.buffer).assertEqual('text');
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0015
     * @tc.name      testEditorJourney_015
     * @tc.desc      Verify that two selection movements are recorded as movements rather than range selections.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('move');
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_DOWN);

      expect(harness.client.movementDirections.length).assertEqual(2);
      expect(harness.client.movementDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.movementDirections[1]).assertEqual(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('move');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0016
     * @tc.name      testEditorJourney_016
     * @tc.desc      Verify that an insert, a backward delete, an insert and a forward delete all reach one session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_016 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().sendKeyFunction();
      const channels: string[] = [harness.client.insertedTexts.length.toString(),
        harness.client.backwardLengths.length.toString(), harness.client.forwardLengths.length.toString()];

      expect(channels.join('|')).assertEqual('2|1|1');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.buffer).assertEqual('ab');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0017
     * @tc.name      testEditorJourney_017
     * @tc.desc      Verify that a summary refreshed after a switch reads the new buffer and queries only the current client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_017 begin');
      const oldEditor: PreviewHarness = await createPreviewHarness('abc');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const oldSummary: string = AppStorage.get<string>('showLog') ?? '';
      const newEditor: PreviewHarness = await createPreviewHarness('xy');
      InputHandler.getInstance().insertText('z');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const newSummary: string = AppStorage.get<string>('showLog') ?? '';
      const queries: number[] = [oldEditor.client.forwardQueries.length, newEditor.client.forwardQueries.length];

      expect(oldSummary.indexOf('before：[abc]') >= 0).assertTrue();
      expect(newSummary.indexOf('before：[xyz]') >= 0).assertTrue();
      expect(newSummary.indexOf('abc')).assertEqual(-1);
      expect(queries.join('|')).assertEqual('1|1');
      expect(newEditor.client.insertedTexts.join('')).assertEqual('z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0018
     * @tc.name      testEditorJourney_018
     * @tc.desc      Verify that a paste issued after a committed preview is forwarded without reopening the preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_018 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);

      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0019
     * @tc.name      testEditorJourney_019
     * @tc.desc      Verify that three sessions with one editorial verb each keep their channels isolated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_019 begin');
      const writer: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('n');
      const eraser: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(3);
      const selector: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();

      expect(writer.client.insertedTexts.join('')).assertEqual('n');
      expect(writer.client.backwardLengths.length).assertEqual(0);
      expect(eraser.client.backwardLengths.join('')).assertEqual('3');
      expect(eraser.client.insertedTexts.length).assertEqual(0);
      expect(selector.client.selectedRanges[0].end).assertEqual(1000);
      expect(selector.client.finishCount).assertEqual(1);
      expect(writer.client.buffer).assertEqual('n');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0020
     * @tc.name      testEditorJourney_020
     * @tc.desc      Verify that a journey on a session with a rejected private command still previews, commits and counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_020 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4, 0, true, false, true);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const successor: PreviewHarness = await createPreviewHarness('');

      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(successor.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0021
     * @tc.name      testEditorJourney_021
     * @tc.desc      Verify that a pending attribute still lets a preview, two range requests and one commit complete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_021 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 1, 0, true, true);
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().moveCursorToBegin();
      await InputHandler.getInstance().selectToEnd();
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].start).assertEqual(10);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0022
     * @tc.name      testEditorJourney_022
     * @tc.desc      Verify that the newest text diagnostic overwrites the older one in the refreshed summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_022 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().setTextInfo('TXT-stale');
      InputHandler.getInstance().setTextInfo('TXT-fresh');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';

      expect(summary.indexOf('TXT-fresh') >= 0).assertTrue();
      expect(summary.indexOf('TXT-stale')).assertEqual(-1);
      expect(summary.indexOf('before：[abc]') >= 0).assertTrue();
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0023
     * @tc.name      testEditorJourney_023
     * @tc.desc      Verify that two hides followed by an enter keep the hide channel at two and the finish at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_023 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(5);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0024
     * @tc.name      testEditorJourney_024
     * @tc.desc      Verify that a cut, paste, cut sequence records three actions in the order issued.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_024 begin');
      const harness: PreviewHarness = await createPreviewHarness('clip');
      const handler: InputHandler = InputHandler.getInstance();
      handler.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handler.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      handler.sendExtendAction(inputMethodEngine.ExtendAction.CUT);

      expect(harness.client.extendActions.length).assertEqual(3);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions[2]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.buffer).assertEqual('clip');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0025
     * @tc.name      testEditorJourney_025
     * @tc.desc      Verify that a preview, a begin selection and an enter leave one range anchored at the preview cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_025 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(10);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0026
     * @tc.name      testEditorJourney_026
     * @tc.desc      Verify that a journey after attach publishes the configured pattern and still commits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_026 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 7);
      typeSequence(harness, 'ab');
      InputHandler.getInstance().sendKeyFunction();

      expect(AppStorage.get<number>('inputPattern')).assertEqual(7);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0027
     * @tc.name      testEditorJourney_027
     * @tc.desc      Verify that an enter, one insertion and another enter produce two commits around one character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_027 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.keyFunctions[1]).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('z');
      expect(harness.client.buffer).assertEqual('z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0028
     * @tc.name      testEditorJourney_028
     * @tc.desc      Verify that one backward and one forward deletion precede an enter without extra commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_028 begin');
      const harness: PreviewHarness = await createPreviewHarness('sample');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.forwardLengths.join('')).assertEqual('2');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0029
     * @tc.name      testEditorJourney_029
     * @tc.desc      Verify that one begin move then two insertions keeps a single zero-anchored range and doubles the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_029 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().insertText('p');
      InputHandler.getInstance().insertText('q');

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('pq');
      expect(harness.client.buffer).assertEqual('pq');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0030
     * @tc.name      testEditorJourney_030
     * @tc.desc      Verify that two hidden preview sessions precede a third session that finishes once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_030 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      const second: PreviewHarness = await createPreviewHarness('');
      typeSequence(second, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      const third: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(third, 'hel');
      InputHandler.getInstance().sendKeyFunction();

      expect(first.keyboard.hideCount).assertEqual(1);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(third.keyboard.hideCount).assertEqual(0);
      expect(first.client.finishCount + second.client.finishCount).assertEqual(0);
      expect(third.client.finishCount).assertEqual(1);
      expect(third.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0031
     * @tc.name      testEditorJourney_031
     * @tc.desc      Verify that a failed trigger recovers when the next unrelated character completes the prefix window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_031 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0032
     * @tc.name      testEditorJourney_032
     * @tc.desc      Verify that a debug refresh after a deletion reports five characters on both sides of the cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_032 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdef');
      InputHandler.getInstance().deleteBackward(2);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';

      expect(summary.indexOf('before：[abcde]') >= 0).assertTrue();
      expect(summary.indexOf('after：[bcdef]') >= 0).assertTrue();
      expect(harness.client.forwardQueries.length).assertEqual(1);
      expect(harness.client.backwardQueries.length).assertEqual(1);
      expect(harness.client.backwardQueries[0]).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0033
     * @tc.name      testEditorJourney_033
     * @tc.desc      Verify that a preview committed with an unusual enter type forwards that type unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_033 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 12);
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.keyFunctions[0]).assertEqual(12);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(10);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0034
     * @tc.name      testEditorJourney_034
     * @tc.desc      Verify that two preview sessions each record a begin range and a tail range at the same cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_034 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      const second: PreviewHarness = await createPreviewHarness('');
      typeSequence(second, 'hel');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();

      expect(first.client.selectedRanges.length).assertEqual(2);
      expect(second.client.selectedRanges.length).assertEqual(2);
      expect(first.client.selectedRanges[1].start).assertEqual(10);
      expect(second.client.selectedRanges[1].start).assertEqual(10);
      expect(second.client.selectedRanges[0].end).assertEqual(10);
      expect(first.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0035
     * @tc.name      testEditorJourney_035
     * @tc.desc      Verify that one multi-character insertion followed by a two-unit deletion records both as single calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_035 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('pq');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('pq');
      expect(harness.client.backwardLengths.join('')).assertEqual('2');
      expect(harness.client.buffer).assertEqual('pq');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0036
     * @tc.name      testEditorJourney_036
     * @tc.desc      Verify that a rejected hide in the first session does not stop its typing and enter journey.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_036 begin');
      const faulty: PreviewHarness = await createPreviewHarness('', 1);
      faulty.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();
      const healthy: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();

      expect(faulty.keyboard.hideCount).assertEqual(1);
      expect(healthy.keyboard.hideCount).assertEqual(1);
      expect(faulty.client.buffer).assertEqual('a');
      expect(faulty.client.finishCount).assertEqual(1);
      expect(faulty.client.keyFunctions[0]).assertEqual(1);
      expect(healthy.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0037
     * @tc.name      testEditorJourney_037
     * @tc.desc      Verify that an insertion, a begin selection, a forward deletion and an enter share one session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_037 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.forwardLengths.join('')).assertEqual('1');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0038
     * @tc.name      testEditorJourney_038
     * @tc.desc      Verify that plain letters typed after a commit open no preview while a second enter still finishes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_038 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'xyz');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(13);
      expect(harness.client.buffer).assertEqual('hello worldxyz');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_038 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0039
     * @tc.name      testEditorJourney_039
     * @tc.desc      Verify that a paste on a fresh editor is forwarded and the enter commits the empty buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_039 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.buffer).assertEqual('');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_039 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0040
     * @tc.name      testEditorJourney_040
     * @tc.desc      Verify that four sessions accept one distinct letter each and a mid-run checkpoint totals two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_040 begin');
      let inserted: number = 0;
      let checkpoint: number = 0;
      const buffers: string[] = [];
      for (let round = 0; round < 4; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        InputHandler.getInstance().insertText(String.fromCharCode(97 + round));
        inserted = inserted + harness.client.insertedTexts.length;
        buffers.push(harness.client.buffer);
        if (round === 1) {
          checkpoint = inserted;
        }
      }

      expect(checkpoint).assertEqual(2);
      expect(inserted).assertEqual(4);
      expect(buffers.join('')).assertEqual('abcd');
      expect(buffers.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_040 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0041
     * @tc.name      testEditorJourney_041
     * @tc.desc      Verify that two begin moves around one insertion both anchor at the zero origin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_041 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().insertText('k');
      await InputHandler.getInstance().moveCursorToBegin();
      const starts: number[] = [harness.client.selectedRanges[0].start, harness.client.selectedRanges[1].start];
      const ends: number[] = [harness.client.selectedRanges[0].end, harness.client.selectedRanges[1].end];

      expect(starts.join('|')).assertEqual('0|0');
      expect(ends.join('|')).assertEqual('0|0');
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('k');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_041 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0042
     * @tc.name      testEditorJourney_042
     * @tc.desc      Verify that a zero backward deletion then an insertion leaves the deletion and commit on one session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_042 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('u');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('u');
      expect(harness.client.buffer).assertEqual('u');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_042 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0043
     * @tc.name      testEditorJourney_043
     * @tc.desc      Verify that a cut, a tail selection, a deletion and an enter each occupy one channel on an empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_043 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const harness: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().sendKeyFunction();
      const channels: number[] = [harness.client.extendActions.length, harness.client.selectedRanges.length,
        harness.client.backwardLengths.length, harness.client.finishCount];

      expect(channels.join('|')).assertEqual('1|1|1|1');
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_043 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_JOURNEY_0044
     * @tc.name      testEditorJourney_044
     * @tc.desc      Verify that a select diagnostic survives a hide and a commit and appears in the refreshed summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorJourney_044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_044 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      InputHandler.getInstance().setSelectInfo('SEL-held');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';

      expect(summary.indexOf('SEL-held') >= 0).assertTrue();
      expect(summary.indexOf('before：[ab]') >= 0).assertTrue();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.forwardQueries.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorJourney_044 end');
      await yieldToEventLoop();
    });

  });
}
