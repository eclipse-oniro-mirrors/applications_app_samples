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
import { yieldToEventLoop } from '../support/AsyncSupport';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodEditorCommandTest]';

export default function EditorCommandTestTest(): void {
  describe('EditorCommandTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0001
     * @tc.name      testEditorCommandTest_001
     * @tc.desc      The CURSOR_UP caret move is forwarded exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditorCommandTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_001 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'direction request prepared');

      handler.moveCursor(inputMethodEngine.Direction.CURSOR_UP);

      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0002
     * @tc.name      testEditorCommandTest_002
     * @tc.desc      The SELECT_ALL edit action is forwarded exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditorCommandTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_002 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();

      handler.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);

      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0003
     * @tc.name      testEditorCommandTest_003
     * @tc.desc      Moving the caret to the begin emits the fixed boundary range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditorCommandTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_003 begin');

      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();

      handler.moveCursorToBegin();

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0004
     * @tc.name      testEditorCommandTest_004
     * @tc.desc      Selecting to the begin emits the cursor-derived range for every length class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditorCommandTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_004 begin');

      const initials: string[] = ["", "abc", "hello world", "0123456789"];
      const expectedIndex: number[] = [0, 2, 10, 9];

      for (let i = 0; i < initials.length; i++) {
        // Selection ranges derive from the cursor index, not from text length.
        const harness: PreviewHarness = await createPreviewHarness(initials[i]);
        const handler: InputHandler = InputHandler.getInstance();
        // The cursor index points at the last character; selection boundaries derive from it.
        await handler.selectToBegin();
        expect(harness.client.selectedRanges.length).assertEqual(1);
        expect(harness.client.selectedRanges[0].start).assertEqual(0);
        expect(harness.client.selectedRanges[0].end).assertEqual(expectedIndex[i]);
      }

      expect(initials.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0005
     * @tc.name      testEditorCommandTest_005
     * @tc.desc      Selecting to the end emits the cursor-derived range for every length class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditorCommandTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_005 begin');

      const initials: string[] = ["", "abc", "hello world", "0123456789"];
      const expectedIndex: number[] = [0, 2, 10, 9];

      for (let i = 0; i < initials.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness(initials[i]);
        const handler: InputHandler = InputHandler.getInstance();
        await handler.selectToEnd();
        expect(harness.client.selectedRanges.length).assertEqual(1);
        expect(harness.client.selectedRanges[0].start).assertEqual(expectedIndex[i]);
        expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      }

      expect(initials.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0006
     * @tc.name      testEditorCommandTest_006
     * @tc.desc      The enter key finishes the preview exactly once for both preview classes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_006 begin');

      const initials: string[] = ["", ""];
      const sequences: string[] = ["he", "hel"];
      const expectedPreview: number[] = [0, 1];

      for (let i = 0; i < initials.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness(initials[i]);
        typeSequence(harness, sequences[i]);
        const beforeBuffer: string = harness.client.buffer;
        InputHandler.getInstance().sendKeyFunction();
        expect(harness.client.previewCalls.length).assertEqual(expectedPreview[i]);
        expect(harness.client.keyFunctions.length).assertEqual(1);
        expect(harness.client.keyFunctions[0]).assertEqual(0);
        expect(harness.client.finishCount).assertEqual(1);
        expect(harness.client.buffer).assertEqual(beforeBuffer);
      }

      expect(initials.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0007
     * @tc.name      testEditorCommandTest_007
     * @tc.desc      Hiding the keyboard sends one hide request to the panel controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditorCommandTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_007 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");

      InputHandler.getInstance().hideKeyboardSelf();

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0008
     * @tc.name      testEditorCommandTest_008
     * @tc.desc      The factory keeps one handler instance across editor lookups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_008 begin');

      const first: InputHandler = InputHandler.getInstance();
      const second: InputHandler = InputHandler.getInstance();

      expect(first).assertEqual(second);
      expect(second).assertEqual(InputHandler.getInstance());

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0009
     * @tc.name      testEditorCommandTest_009
     * @tc.desc      Verify that every insert payload is forwarded once without starting a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_009 begin');
      const payloads: string[] = ["", "a", "ab", "xyz", "123", "HELLO", "@#", " "];
      const buffers: string[] = ["abc", "abca", "abcab", "abcxyz", "abc123", "abcHELLO", "abc@#", "abc "];

      // Each payload is inserted into a fresh editor; preview must stay untouched.
      for (let i = 0; i < payloads.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness("abc");
        InputHandler.getInstance().insertText(payloads[i]);
        expect(harness.client.insertedTexts.length).assertEqual(1);
        expect(harness.client.insertedTexts[0]).assertEqual(payloads[i]);
        expect(harness.client.previewCalls.length).assertEqual(0);
        expect(harness.client.buffer).assertEqual(buffers[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0010
     * @tc.name      testEditorCommandTest_010
     * @tc.desc      Verify that every backward deletion length is forwarded once with that exact length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_010 begin');
      const lengths: number[] = [0, 1, 2, 5, 10, 100];

      // Each length is sent to a fresh editor and must not leak into the other direction.
      for (let i = 0; i < lengths.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness("");
        InputHandler.getInstance().deleteBackward(lengths[i]);
        expect(harness.client.backwardLengths.length).assertEqual(1);
        expect(harness.client.backwardLengths[0]).assertEqual(lengths[i]);
        expect(harness.client.forwardLengths.length).assertEqual(0);
        expect(harness.client.insertedTexts.length).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0011
     * @tc.name      testEditorCommandTest_011
     * @tc.desc      The command sequence caret-left then delete-backward is forwarded in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_011 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();

      handler.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.deleteBackward(1);

      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.extendActions.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0012
     * @tc.name      testEditorCommandTest_012
     * @tc.desc      The command sequence select-up then select-all is forwarded in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_012 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();

      handler.selectByMovement(inputMethodEngine.Direction.CURSOR_UP);
      handler.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);

      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(1);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0013
     * @tc.name      testEditorCommandTest_013
     * @tc.desc      The command sequence caret-begin then select-begin is forwarded in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_013 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();

      handler.moveCursorToBegin();
      await handler.selectToBegin();

      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.extendActions.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0014
     * @tc.name      testEditorCommandTest_014
     * @tc.desc      The command sequence delete-backward twice is forwarded in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_014 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();

      handler.deleteBackward(1);
      handler.deleteBackward(1);

      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.extendActions.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(2);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_0015
     * @tc.name      testEditorCommandTest_015
     * @tc.desc      The command sequence delete-forward twice is forwarded in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorCommandTest_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_015 begin');

      const harness: PreviewHarness = await createPreviewHarness("abc");
      const handler: InputHandler = InputHandler.getInstance();

      handler.deleteForward(1);
      handler.deleteForward(1);

      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.extendActions.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandTest_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0001
     * @tc.name      testEditorCommandSet_001
     * @tc.desc      Verify that moving the caret to the end selects the fixed thousand boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');

      await InputHandler.getInstance().moveCursorToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0002
     * @tc.name      testEditorCommandSet_002
     * @tc.desc      Verify that end then begin records the two boundary ranges in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');

      await InputHandler.getInstance().moveCursorToEnd();
      await InputHandler.getInstance().moveCursorToBegin();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(0);
      expect(harness.client.extendActions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0003
     * @tc.name      testEditorCommandSet_003
     * @tc.desc      Verify that selecting to begin then to end covers the cursor index on both sides.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();

      await handler.selectToBegin();
      await handler.selectToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(3);
      expect(harness.client.selectedRanges[1].start).assertEqual(3);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0004
     * @tc.name      testEditorCommandSet_004
     * @tc.desc      Verify that left, right and down caret moves arrive as three, four and two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();

      handler.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      handler.moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);

      expect(harness.client.movedDirections.join(',')).assertEqual('3,4,2');
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0005
     * @tc.name      testEditorCommandSet_005
     * @tc.desc      Verify that two right selection movements stay in the movement channel only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();

      handler.selectByMovement(inputMethodEngine.Direction.CURSOR_RIGHT);
      handler.selectByMovement(inputMethodEngine.Direction.CURSOR_RIGHT);

      expect(harness.client.movementDirections.join(',')).assertEqual('4,4');
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abcd');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0006
     * @tc.name      testEditorCommandSet_006
     * @tc.desc      Verify that cut, copy and paste reach the action channel in that order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();

      handler.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handler.sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      handler.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);

      const expected: number[] = [
        inputMethodEngine.ExtendAction.CUT,
        inputMethodEngine.ExtendAction.COPY,
        inputMethodEngine.ExtendAction.PASTE
      ];
      expect(harness.client.extendActions.join(',')).assertEqual(expected.join(','));
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0007
     * @tc.name      testEditorCommandSet_007
     * @tc.desc      Verify that the debug refresh reads five characters on each side without editing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdefgh');

      InputHandler.getInstance().refreshInfo();

      expect(harness.client.forwardQueries.join(',')).assertEqual('5');
      expect(harness.client.backwardQueries.join(',')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('abcdefgh');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0008
     * @tc.name      testEditorCommandSet_008
     * @tc.desc      Verify that a repeated refresh appends a second five-character query on both sides.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdefgh');

      InputHandler.getInstance().refreshInfo();
      InputHandler.getInstance().refreshInfo();

      expect(harness.client.forwardQueries.length).assertEqual(2);
      expect(harness.client.backwardQueries.length).assertEqual(2);
      expect(harness.client.forwardQueries[1]).assertEqual(5);
      expect(harness.client.backwardQueries[1]).assertEqual(5);
      expect(harness.client.buffer).assertEqual('abcdefgh');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0009
     * @tc.name      testEditorCommandSet_009
     * @tc.desc      Verify that refreshing an empty editor still issues both five-character reads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().refreshInfo();

      expect(harness.client.forwardQueries.join(',')).assertEqual('5');
      expect(harness.client.backwardQueries.join(',')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('');
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0010
     * @tc.name      testEditorCommandSet_010
     * @tc.desc      Verify that an insertion after the caret-end boundary appends without another range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().insertText('z');

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('z');
      expect(harness.client.buffer).assertEqual('abcz');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0011
     * @tc.name      testEditorCommandSet_011
     * @tc.desc      Verify that a new attach redirects insertions while the old client stays frozen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_011 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('b');

      expect(first.client.insertedTexts.join('')).assertEqual('a');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(first.client.buffer).assertEqual('a');
      expect(second.client.buffer).assertEqual('b');
      expect(second.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0012
     * @tc.name      testEditorCommandSet_012
     * @tc.desc      Verify that hide requests follow the latest attached keyboard controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_012 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();

      expect(first.keyboard.hideCount).assertEqual(0);
      expect(second.keyboard.hideCount).assertEqual(2);
      expect(second.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0013
     * @tc.name      testEditorCommandSet_013
     * @tc.desc      Verify that the begin boundary and the select-all action occupy separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();

      await handler.moveCursorToBegin();
      handler.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0014
     * @tc.name      testEditorCommandSet_014
     * @tc.desc      Verify that a commit followed by refresh keeps the finish count and the read queries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().refreshInfo();

      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.join(',')).assertEqual('0');
      expect(harness.client.forwardQueries.join(',')).assertEqual('5');
      expect(harness.client.backwardQueries.join(',')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_SET_0015
     * @tc.name      testEditorCommandSet_015
     * @tc.desc      Verify that asking for the caret end twice records two independent boundary ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandSet_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');

      await InputHandler.getInstance().moveCursorToEnd();
      await InputHandler.getInstance().moveCursorToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      expect(harness.client.selectedRanges[0] === harness.client.selectedRanges[1]).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandSet_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_CURSOR_0001
     * @tc.name      testEditorCommandCursor_001
     * @tc.desc      Verify that a mid-text cursor index one selects from zero through one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandCursor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      harness.client.cursor = 1;

      await InputHandler.getInstance().selectToBegin();

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_CURSOR_0002
     * @tc.name      testEditorCommandCursor_002
     * @tc.desc      Verify that cursor zero in a non-empty editor falls back to the recorded x on both selections.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandCursor_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      harness.client.cursor = 0;
      InputHandler.getInstance().setCursorInfo({ x: 6, y: 0, height: 0 });

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();

      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(6);
      expect(harness.client.selectedRanges[1].start).assertEqual(6);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_CURSOR_0003
     * @tc.name      testEditorCommandCursor_003
     * @tc.desc      Verify that a negative cursor index in a non-empty editor selects from zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandCursor_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      harness.client.cursor = -1;

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_CURSOR_0004
     * @tc.name      testEditorCommandCursor_004
     * @tc.desc      Verify that two begin selections started before the first resolves both use cursor two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandCursor_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();
      harness.client.cursor = 2;

      const firstSelection: Promise<void> = handler.selectToBegin();
      const secondSelection: Promise<void> = handler.selectToBegin();
      await firstSelection;
      await secondSelection;

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].end).assertEqual(2);
      expect(harness.client.selectedRanges[1].end).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_CURSOR_0005
     * @tc.name      testEditorCommandCursor_005
     * @tc.desc      Verify that a pending begin selection records after a synchronous caret-begin range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandCursor_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      const handler: InputHandler = InputHandler.getInstance();
      harness.client.cursor = 2;

      const pendingSelection: Promise<void> = handler.selectToBegin();
      const pendingMove: Promise<void> = handler.moveCursorToBegin();
      await pendingSelection;
      await pendingMove;

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandCursor_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0001
     * @tc.name      testEditorCommandInterleave_001
     * @tc.desc      Verify that selecting to the end from a mid-text cursor one starts at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcd');
      harness.client.cursor = 1;

      await InputHandler.getInstance().selectToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(1);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0002
     * @tc.name      testEditorCommandInterleave_002
     * @tc.desc      Verify that a negative cursor with x four selects from zero to four and then to the boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      harness.client.cursor = -1;
      InputHandler.getInstance().setCursorInfo({ x: 4, y: 0, height: 0 });

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();

      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(4);
      expect(harness.client.selectedRanges[1].start).assertEqual(4);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0003
     * @tc.name      testEditorCommandInterleave_003
     * @tc.desc      Verify that a caret-end boundary followed by a begin selection records both in that order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      await InputHandler.getInstance().moveCursorToEnd();
      await InputHandler.getInstance().selectToBegin();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0004
     * @tc.name      testEditorCommandInterleave_004
     * @tc.desc      Verify that two caret-begin requests each record the zero boundary range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      await InputHandler.getInstance().moveCursorToBegin();
      await InputHandler.getInstance().moveCursorToBegin();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0005
     * @tc.name      testEditorCommandInterleave_005
     * @tc.desc      Verify that hiding then refreshing keeps one hide and two read queries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().refreshInfo();

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.forwardQueries.join(',')).assertEqual('5');
      expect(harness.client.backwardQueries.join(',')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0006
     * @tc.name      testEditorCommandInterleave_006
     * @tc.desc      Verify that an empty payload is forwarded once and leaves text and cursor unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().insertText('');

      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.cursor).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0007
     * @tc.name      testEditorCommandInterleave_007
     * @tc.desc      Verify that a configured enter type six is sent and one commit is counted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6);

      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.keyFunctions.join(',')).assertEqual('6');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0008
     * @tc.name      testEditorCommandInterleave_008
     * @tc.desc      Verify that left then up selection movements record three then one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();

      handler.selectByMovement(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.selectByMovement(inputMethodEngine.Direction.CURSOR_UP);

      expect(harness.client.movementDirections.join(',')).assertEqual('3,1');
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0009
     * @tc.name      testEditorCommandInterleave_009
     * @tc.desc      Verify that zero deletions in both directions and a refresh keep three independent counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().refreshInfo();

      expect(harness.client.backwardLengths.join(',')).assertEqual('0');
      expect(harness.client.forwardLengths.join(',')).assertEqual('0');
      expect(harness.client.forwardQueries.join(',')).assertEqual('5');
      expect(harness.client.backwardQueries.join(',')).assertEqual('5');
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0010
     * @tc.name      testEditorCommandInterleave_010
     * @tc.desc      Verify that hide and insertion after the caret-end boundary use their own channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('z');

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('z');
      expect(harness.client.buffer).assertEqual('abcz');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0011
     * @tc.name      testEditorCommandInterleave_011
     * @tc.desc      Verify that a begin selection then a caret-end boundary keep their range order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().moveCursorToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(2);
      expect(harness.client.selectedRanges[1].start).assertEqual(1000);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0012
     * @tc.name      testEditorCommandInterleave_012
     * @tc.desc      Verify that after one insertion at cursor zero the begin selection targets the zero boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('a');
      await InputHandler.getInstance().selectToBegin();

      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.cursor).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_INTERLEAVE_0013
     * @tc.name      testEditorCommandInterleave_013
     * @tc.desc      Verify that paste then a five-unit backward deletion keep action and deletion apart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandInterleave_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();

      handler.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      handler.deleteBackward(5);

      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.backwardLengths.join(',')).assertEqual('5');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandInterleave_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_COMMAND_BURST_0001
     * @tc.name      testEditorCommandBurst_001
     * @tc.desc      Verify that the begin selection after two insertions uses the advanced cursor index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorCommandBurst_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandBurst_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().insertText('b');
      await InputHandler.getInstance().selectToBegin();

      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.cursor).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorCommandBurst_001 end');
      await yieldToEventLoop();
    });

  });
}
