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
const TAG: string = '[Sample_KikaInputMethodZeroCommand]';

export default function ZeroCommandTestTest(): void {
  describe('ZeroCommandTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_COMMAND_0001
     * @tc.name      testZeroCommand_001
     * @tc.desc      Verify that a zero-length backward deletion is forwarded as the literal zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroCommand_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_COMMAND_0002
     * @tc.name      testZeroCommand_002
     * @tc.desc      Verify that a zero-length forward deletion leaves the buffer and finish count alone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroCommand_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.forwardLengths[0]).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.indexOf('hello world') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_COMMAND_0003
     * @tc.name      testZeroCommand_003
     * @tc.desc      Verify that a zero deletion followed by a two-unit deletion records both lengths in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroCommand_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0|2');
      expect(harness.client.backwardLengths.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_COMMAND_0004
     * @tc.name      testZeroCommand_004
     * @tc.desc      Verify that two begin selections both report the fixed zero-based range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroCommand_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[1].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(harness.client.selectedRanges[0].end);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_COMMAND_0005
     * @tc.name      testZeroCommand_005
     * @tc.desc      Verify that a movement selection with the zero direction is forwarded unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroCommand_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(0 as inputMethodEngine.Direction);
      expect(harness.client.movementDirections.length).assertEqual(1);
      expect(harness.client.movementDirections[0]).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_COMMAND_0006
     * @tc.name      testZeroCommand_006
     * @tc.desc      Verify that zero deletions on both sides leave the preview open for a later commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroCommand_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.finishCount).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroCommand_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0001
     * @tc.name      testZeroSelection_001
     * @tc.desc      Verify that begin selection on an empty editor uses the cursor fallback of zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroSelection_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToBegin();
      const range: inputMethodEngine.Range = harness.client.selectedRanges[0];
      expect(range.start + range.end).assertEqual(0);
      expect(range.start - range.end).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0002
     * @tc.name      testZeroSelection_002
     * @tc.desc      Verify that end selection on an empty editor uses the cursor fallback of zero with a thousand end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroSelection_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0003
     * @tc.name      testZeroSelection_003
     * @tc.desc      Verify that the fixed begin and end helpers record the zero and thousand ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroSelection_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().moveCursorToBegin();
      await InputHandler.getInstance().moveCursorToEnd();
      const firstRange: number = harness.client.selectedRanges[0].end - harness.client.selectedRanges[0].start;
      const lastRange: number = harness.client.selectedRanges[1].end - harness.client.selectedRanges[1].start;
      expect(firstRange).assertEqual(0);
      expect(lastRange).assertEqual(0);
      expect(harness.client.selectedRanges.length * 500).assertEqual(1000);
      expect(harness.client.selectedRanges[1].start - harness.client.selectedRanges[0].start).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0004
     * @tc.name      testZeroSelection_004
     * @tc.desc      Verify that two begin selections on a committed preview both end at the preview cursor index ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroSelection_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(10);
      expect(harness.client.selectedRanges[1].end).assertEqual(10);
      expect(harness.client.movedDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0005
     * @tc.name      testZeroSelection_005
     * @tc.desc      Verify that a zero movement selection after a trigger adds no range and no finish.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroSelection_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(0 as inputMethodEngine.Direction);
      expect(harness.client.movementDirections.join('|')).assertEqual('0');
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0006
     * @tc.name      testZeroSelection_006
     * @tc.desc      Verify that end selection after a trigger starts at the preview cursor index ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroSelection_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(10);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.previewCalls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_SELECTION_0007
     * @tc.name      testZeroSelection_007
     * @tc.desc      Verify that a zero movement on a three-letter editor still lets begin selection end at two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroSelection_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().selectByMovement(0 as inputMethodEngine.Direction);
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.movementDirections.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroSelection_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_DELETION_0001
     * @tc.name      testZeroDeletion_001
     * @tc.desc      Verify that a zero forward deletion on an empty editor is recorded once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroDeletion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.forwardLengths.join('|')).assertEqual('0');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_DELETION_0002
     * @tc.name      testZeroDeletion_002
     * @tc.desc      Verify that two zero backward deletions keep two entries and one shared channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroDeletion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0|0');
      expect(harness.client.backwardLengths.length).assertEqual(2);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_DELETION_0003
     * @tc.name      testZeroDeletion_003
     * @tc.desc      Verify that a zero deletion on each side lands on separate channels in issue order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroDeletion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('stable');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.forwardLengths.join('|')).assertEqual('0');
      expect(harness.client.buffer).assertEqual('stable');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_DELETION_0004
     * @tc.name      testZeroDeletion_004
     * @tc.desc      Verify that both zero deletions after a trigger leave the window open for the enter finish.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroDeletion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.finishCount).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(5);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_DELETION_0005
     * @tc.name      testZeroDeletion_005
     * @tc.desc      Verify that a zero deletion after a switch reaches only the replacement client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroDeletion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_005 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      expect(first.client.backwardLengths.length).assertEqual(0);
      expect(second.client.backwardLengths.join('|')).assertEqual('0');
      expect(second.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_DELETION_0006
     * @tc.name      testZeroDeletion_006
     * @tc.desc      Verify that a zero backward deletion on a three-letter editor leaves the cursor at two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroDeletion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(2);
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroDeletion_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PAYLOAD_0001
     * @tc.name      testZeroPayload_001
     * @tc.desc      Verify that an empty insertion after a trigger re-requests the full window without changing the text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroPayload_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(0);
      expect(harness.client.previewCalls[1].end).assertEqual(11);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PAYLOAD_0002
     * @tc.name      testZeroPayload_002
     * @tc.desc      Verify that two empty insertions on a short editor are both recorded and open no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroPayload_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc', 0, 0, true, true);
      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('|')).assertEqual('|');
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PAYLOAD_0003
     * @tc.name      testZeroPayload_003
     * @tc.desc      Verify that an empty insertion between he and l does not break the first-position window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroPayload_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('he');
      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PAYLOAD_0004
     * @tc.name      testZeroPayload_004
     * @tc.desc      Verify that an empty insertion on a one-letter editor keeps that letter and still allows enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroPayload_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('z', 1);
      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('z');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('1');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPayload_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ACTION_0001
     * @tc.name      testZeroAction_001
     * @tc.desc      Verify that a zero edit action is recorded once and changes no text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroAction_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('kept');
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.join('|')).assertEqual('0');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('kept');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ACTION_0002
     * @tc.name      testZeroAction_002
     * @tc.desc      Verify that a zero caret move is recorded on the caret channel only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroAction_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().moveCursor(0 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.join('|')).assertEqual('0');
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ACTION_0003
     * @tc.name      testZeroAction_003
     * @tc.desc      Verify that a zero movement selection on an empty editor adds no range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroAction_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().selectByMovement(0 as inputMethodEngine.Direction);
      expect(harness.client.movementDirections.length).assertEqual(1);
      expect(harness.client.movementDirections[0]).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ACTION_0004
     * @tc.name      testZeroAction_004
     * @tc.desc      Verify that a zero action after a trigger leaves the window and finish count untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroAction_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.join('|')).assertEqual('0');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ACTION_0005
     * @tc.name      testZeroAction_005
     * @tc.desc      Verify that an empty insertion and a zero action each record one entry on separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroAction_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('xy');
      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('xy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroAction_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ORDER_0001
     * @tc.name      testZeroOrder_001
     * @tc.desc      Verify that four zero commands each land on their own channel exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroOrder_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().moveCursor(0 as inputMethodEngine.Direction);
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ORDER_0002
     * @tc.name      testZeroOrder_002
     * @tc.desc      Verify that zero, five and zero backward lengths keep the middle value in place.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroOrder_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteBackward(5);
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0|5|0');
      expect(harness.client.backwardLengths[1]).assertEqual(5);
      expect(harness.client.backwardLengths.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ORDER_0003
     * @tc.name      testZeroOrder_003
     * @tc.desc      Verify that three zero commands leave the cursor at its previous index of one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroOrder_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'ab');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(1);
      expect(harness.client.buffer).assertEqual('ab');
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ORDER_0004
     * @tc.name      testZeroOrder_004
     * @tc.desc      Verify that a zero movement and a zero deletion before enter keep the finish and type intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroOrder_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      InputHandler.getInstance().selectByMovement(0 as inputMethodEngine.Direction);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.movementDirections.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_ORDER_0005
     * @tc.name      testZeroOrder_005
     * @tc.desc      Verify that three zero backward deletions followed by enter keep three lengths and one finish.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroOrder_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.backwardLengths.length).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('|')).assertEqual('2');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroOrder_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_FLAG_0001
     * @tc.name      testZeroFlag_001
     * @tc.desc      Verify that a rejected finish still sends the zero enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroFlag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('0');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_FLAG_0002
     * @tc.name      testZeroFlag_002
     * @tc.desc      Verify that a rejected hide counts once while a zero deletion is still recorded.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroFlag_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_FLAG_0003
     * @tc.name      testZeroFlag_003
     * @tc.desc      Verify that a rejected preview leaves a zero movement recorded and the raw prefix visible.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroFlag_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(0 as inputMethodEngine.Direction);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.movementDirections.join('|')).assertEqual('0');
      expect(harness.client.buffer).assertEqual('hel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_FLAG_0004
     * @tc.name      testZeroFlag_004
     * @tc.desc      Verify that zero commands before a deferred settle stay on the pending client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroFlag_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.forwardLengths.join('|')).assertEqual('0');
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_FLAG_0005
     * @tc.name      testZeroFlag_005
     * @tc.desc      Verify that a rejected hide with a zero deletion still leaves the enter finish and type intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroFlag_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3);
      harness.keyboard.failHide = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.keyFunctions.join('|')).assertEqual('3');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_FLAG_0006
     * @tc.name      testZeroFlag_006
     * @tc.desc      Verify that a zero deletion on a pending client survives the settle and precedes one finish.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroFlag_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4, 0, true, true);
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.editorAttributeCount).assertEqual(1);
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.keyFunctions.join('|')).assertEqual('4');
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroFlag_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PREVIEW_0001
     * @tc.name      testZeroPreview_001
     * @tc.desc      Verify that a zero backward deletion after a trigger followed by x appends without a new window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroPreview_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPreview_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('x');
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPreview_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PREVIEW_0002
     * @tc.name      testZeroPreview_002
     * @tc.desc      Verify that a zero forward deletion after a trigger keeps the letter l able to open a second window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroPreview_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPreview_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().insertText('l');
      expect(harness.client.forwardLengths.join('|')).assertEqual('0');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(9);
      expect(harness.client.previewCalls[1].end).assertEqual(12);
      expect(harness.client.buffer).assertEqual('hello worhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPreview_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ZERO_PREVIEW_0003
     * @tc.name      testZeroPreview_003
     * @tc.desc      Verify that a zero edit action after a trigger leaves the committed window and finish untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroPreview_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPreview_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroPreview_003 end');
      await yieldToEventLoop();
    });

  });
}
