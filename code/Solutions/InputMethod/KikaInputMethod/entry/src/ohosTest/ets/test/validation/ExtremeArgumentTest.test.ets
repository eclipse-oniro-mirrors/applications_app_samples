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
const TAG: string = '[Sample_KikaInputMethodExtremeArgument]';

export default function ExtremeArgumentTestTest(): void {
  describe('ExtremeArgumentTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0001
     * @tc.name      testExtremeArgument_001
     * @tc.desc      Verify that the maximum backward length during a preview keeps the preview open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteBackward(2147483647);
      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.backwardLengths[0]).assertEqual(2147483647);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0002
     * @tc.name      testExtremeArgument_002
     * @tc.desc      Verify that a negative forward length during a preview is forwarded unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().deleteForward(-2147483648);
      expect(harness.client.forwardLengths[0]).assertEqual(-2147483648);
      expect(harness.client.buffer.indexOf('z') >= 0).assertTrue();
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0003
     * @tc.name      testExtremeArgument_003
     * @tc.desc      Verify that an undocumented caret direction is forwarded once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().moveCursor(99 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.movedDirections.join('|')).assertEqual('1|99');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0004
     * @tc.name      testExtremeArgument_004
     * @tc.desc      Verify that an undocumented extend action is forwarded once without a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().sendExtendAction(99 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0005
     * @tc.name      testExtremeArgument_005
     * @tc.desc      Verify that a lone high surrogate is stored as one code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const lone: string = String.fromCharCode(55357);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().insertText(lone);
      expect(harness.client.buffer.length).assertEqual(2);
      expect(harness.client.buffer.charCodeAt(1)).assertEqual(55357);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0006
     * @tc.name      testExtremeArgument_006
     * @tc.desc      Verify that a ten-thousand-character insertion stays one buffer payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      for (let i = 0; i < 10000; i++) {
        payload = payload + 'L';
      }
      InputHandler.getInstance().insertText(payload);
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(10000);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0007
     * @tc.name      testExtremeArgument_007
     * @tc.desc      Verify that the maximum enter type finishes one preview and is forwarded.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_0008
     * @tc.name      testExtremeArgument_008
     * @tc.desc      Verify that five hides during a preview count five times and keep the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeArgument_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().moveCursorToBegin();
      for (let i = 0; i < 5; i++) {
        InputHandler.getInstance().hideKeyboardSelf();
      }
      expect(harness.keyboard.hideCount).assertEqual(5);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeArgument_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_NEG_0001
     * @tc.name      testNegativeDeletion_001
     * @tc.desc      Verify that a negative backward length is forwarded unchanged and leaves the buffer alone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNegativeDeletion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().deleteBackward(-1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('-1');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_NEG_0002
     * @tc.name      testNegativeDeletion_002
     * @tc.desc      Verify that a negative forward length is recorded on the forward channel only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNegativeDeletion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().deleteForward(-1);
      expect(harness.client.forwardLengths.join('|')).assertEqual('-1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_NEG_0003
     * @tc.name      testNegativeDeletion_003
     * @tc.desc      Verify that the lowest 32-bit integer passes both deletion directions without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testNegativeDeletion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('xy');
      InputHandler.getInstance().deleteBackward(-2147483648);
      InputHandler.getInstance().deleteForward(-2147483648);
      expect(harness.client.backwardLengths[0]).assertEqual(-2147483648);
      expect(harness.client.forwardLengths[0]).assertEqual(-2147483648);
      expect(harness.client.buffer).assertEqual('xy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_NEG_0004
     * @tc.name      testNegativeDeletion_004
     * @tc.desc      Verify that negative and positive backward lengths keep their issue order on one channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNegativeDeletion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(-2);
      InputHandler.getInstance().deleteForward(3);
      InputHandler.getInstance().deleteBackward(-4);
      expect(harness.client.backwardLengths.join('|')).assertEqual('-2|-4');
      expect(harness.client.forwardLengths.join('|')).assertEqual('3');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_NEG_0005
     * @tc.name      testNegativeDeletion_005
     * @tc.desc      Verify that a negative backward length during a preview does not close or shrink the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testNegativeDeletion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(-9);
      expect(harness.client.backwardLengths[0]).assertEqual(-9);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_NEG_0006
     * @tc.name      testNegativeDeletion_006
     * @tc.desc      Verify that opposite extreme forward lengths keep their issue order on the forward channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testNegativeDeletion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().deleteForward(-2147483647);
      InputHandler.getInstance().deleteForward(2147483647);
      expect(harness.client.forwardLengths.join('|')).assertEqual('-2147483647|2147483647');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegativeDeletion_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0001
     * @tc.name      testDirectionBoundary_001
     * @tc.desc      Verify that a negative caret direction reaches the caret channel and no selection range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDirectionBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().moveCursor(-1 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.join('|')).assertEqual('-1');
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0002
     * @tc.name      testDirectionBoundary_002
     * @tc.desc      Verify that the largest caret direction is forwarded as given.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDirectionBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().moveCursor(2147483647 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(2147483647);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0003
     * @tc.name      testDirectionBoundary_003
     * @tc.desc      Verify that a negative movement selection is recorded without a range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDirectionBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().selectByMovement(-1 as inputMethodEngine.Direction);
      expect(harness.client.movementDirections.join('|')).assertEqual('-1');
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0004
     * @tc.name      testDirectionBoundary_004
     * @tc.desc      Verify that the largest movement direction leaves the preview window and finish count intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDirectionBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(2147483647 as inputMethodEngine.Direction);
      expect(harness.client.movementDirections[0]).assertEqual(2147483647);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0005
     * @tc.name      testDirectionBoundary_005
     * @tc.desc      Verify that a negative edit action is forwarded with its literal value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDirectionBoundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('kept');
      InputHandler.getInstance().sendExtendAction(-1 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(-1);
      expect(harness.client.buffer).assertEqual('kept');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0006
     * @tc.name      testDirectionBoundary_006
     * @tc.desc      Verify that a zero edit action is recorded once and touches no text or deletion channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDirectionBoundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('kept');
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.join('|')).assertEqual('0');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('kept');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0007
     * @tc.name      testDirectionBoundary_007
     * @tc.desc      Verify that a negative caret direction and a maximal edit action stay on separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDirectionBoundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().moveCursor(-5 as inputMethodEngine.Direction);
      InputHandler.getInstance().sendExtendAction(2147483647 as inputMethodEngine.ExtendAction);
      expect(harness.client.movedDirections.join('|')).assertEqual('-5');
      expect(harness.client.extendActions[0]).assertEqual(2147483647);
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0008
     * @tc.name      testDirectionBoundary_008
     * @tc.desc      Verify that the lowest integer caret direction is forwarded without narrowing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDirectionBoundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().moveCursor(-2147483648 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(-2147483648);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_DIR_0009
     * @tc.name      testDirectionBoundary_009
     * @tc.desc      Verify that a maximal edit action leaves the text and both deletion channels untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDirectionBoundary_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('x');
      InputHandler.getInstance().sendExtendAction(2147483647 as inputMethodEngine.ExtendAction);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(2147483647);
      expect(harness.client.buffer).assertEqual('x');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDirectionBoundary_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ENTER_0001
     * @tc.name      testEnterTypeBoundary_001
     * @tc.desc      Verify that a negative enter type is sent and finished without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterTypeBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('x', -1);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('-1');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ENTER_0002
     * @tc.name      testEnterTypeBoundary_002
     * @tc.desc      Verify that a zero enter type is sent beside the maximum input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterTypeBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 2147483647);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('0');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2147483647);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ENTER_0003
     * @tc.name      testEnterTypeBoundary_003
     * @tc.desc      Verify that two enter requests repeat the maximum type and count two finishes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testEnterTypeBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('2147483647|2147483647');
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ENTER_0004
     * @tc.name      testEnterTypeBoundary_004
     * @tc.desc      Verify that a negative input pattern is published while a small enter type is sent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterTypeBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3, -1);
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-1);
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.privateCommandCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ENTER_0005
     * @tc.name      testEnterTypeBoundary_005
     * @tc.desc      Verify that the lowest integer enter type is stored and sent without narrowing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testEnterTypeBoundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', -2147483648);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(-2147483648);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(-2147483648);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterTypeBoundary_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0001
     * @tc.name      testPayloadBoundary_001
     * @tc.desc      Verify that a null character is stored as one unit with code zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const nullText: string = String.fromCharCode(0);
      InputHandler.getInstance().insertText(nullText);
      expect(harness.client.buffer.length).assertEqual(1);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0002
     * @tc.name      testPayloadBoundary_002
     * @tc.desc      Verify that a line break and a tab travel as one two-unit payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const controlText: string = String.fromCharCode(10) + String.fromCharCode(9);
      InputHandler.getInstance().insertText(controlText);
      expect(harness.client.buffer.length).assertEqual(2);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(10);
      expect(harness.client.buffer.charCodeAt(1)).assertEqual(9);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0003
     * @tc.name      testPayloadBoundary_003
     * @tc.desc      Verify that an emoji pair occupies two units with the high surrogate first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const emoji: string = String.fromCharCode(0xD83D, 0xDE00);
      InputHandler.getInstance().insertText(emoji);
      expect(harness.client.buffer.length).assertEqual(2);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(55357);
      expect(harness.client.buffer.charCodeAt(1)).assertEqual(56832);
      expect(harness.client.buffer).assertEqual(emoji);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0004
     * @tc.name      testPayloadBoundary_004
     * @tc.desc      Verify that a negative forward deletion between he and l does not prevent the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('he');
      InputHandler.getInstance().deleteForward(-1);
      InputHandler.getInstance().insertText('l');
      expect(harness.client.forwardLengths.join('|')).assertEqual('-1');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0005
     * @tc.name      testPayloadBoundary_005
     * @tc.desc      Verify that a two thousand forty-eight unit payload stays one insertion under a maximal forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      for (let i: number = 0; i < 2048; i++) {
        payload = payload + 'k';
      }
      InputHandler.getInstance().insertText(payload);
      InputHandler.getInstance().deleteForward(2147483647);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(2048);
      expect(harness.client.forwardLengths[0]).assertEqual(2147483647);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0006
     * @tc.name      testPayloadBoundary_006
     * @tc.desc      Verify that a large payload survives a zero backward and a negative forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let payload: string = '';
      for (let i: number = 0; i < 4096; i++) {
        payload = payload + 'r';
      }
      InputHandler.getInstance().insertText(payload);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(-3);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(4096);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.forwardLengths.join('|')).assertEqual('-3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0007
     * @tc.name      testPayloadBoundary_007
     * @tc.desc      Verify that two adjacent emoji pairs keep four units and a high surrogate at index two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pair: string = String.fromCharCode(0xD83D, 0xDE00);
      InputHandler.getInstance().insertText(pair + pair);
      expect(harness.client.buffer.length).assertEqual(4);
      expect(harness.client.buffer.charCodeAt(2)).assertEqual(55357);
      expect(harness.client.buffer.charCodeAt(3)).assertEqual(56832);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_PAYLOAD_0008
     * @tc.name      testPayloadBoundary_008
     * @tc.desc      Verify that three null characters occupy three units and the last code is zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPayloadBoundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const nullText: string = String.fromCharCode(0, 0, 0);
      InputHandler.getInstance().insertText(nullText);
      expect(harness.client.buffer.length).assertEqual(3);
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(0);
      expect(harness.client.buffer.charCodeAt(2)).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadBoundary_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ZERO_0001
     * @tc.name      testZeroBoundary_001
     * @tc.desc      Verify that a zero backward deletion on an empty editor records the literal zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ZERO_0002
     * @tc.name      testZeroBoundary_002
     * @tc.desc      Verify that begin selection on an empty editor records the zero range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ZERO_0003
     * @tc.name      testZeroBoundary_003
     * @tc.desc      Verify that end selection on an empty editor records the thousand range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.movementDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ZERO_0004
     * @tc.name      testZeroBoundary_004
     * @tc.desc      Verify that the two fixed caret helpers on an empty editor record zero and thousand.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testZeroBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const harness: PreviewHarness = await createPreviewHarness('');
      const starts: number[] = [];
      const ends: number[] = [];
      await InputHandler.getInstance().moveCursorToBegin();
      await InputHandler.getInstance().moveCursorToEnd();
      for (let i = 0; i < harness.client.selectedRanges.length; i++) {
        starts.push(harness.client.selectedRanges[i].start);
        ends.push(harness.client.selectedRanges[i].end);
      }
      expect(starts.join('|')).assertEqual('0|1000');
      expect(ends.join('|')).assertEqual('0|1000');
      expect(starts[0] - ends[1]).assertEqual(-1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_ZERO_0005
     * @tc.name      testZeroBoundary_005
     * @tc.desc      Verify that one hundred zero deletions accumulate in order without touching the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testZeroBoundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('hold');
      for (let i: number = 0; i < 100; i++) {
        InputHandler.getInstance().deleteBackward(0);
      }
      expect(harness.client.backwardLengths.length).assertEqual(100);
      expect(harness.client.backwardLengths[99]).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hold');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testZeroBoundary_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_SEQ_0001
     * @tc.name      testExtremeSequence_001
     * @tc.desc      Verify that alternating negative and positive backward lengths keep their exact order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeSequence_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(-1);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteBackward(-1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('-1|1|-1');
      expect(harness.client.backwardLengths.length).assertEqual(3);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_SEQ_0002
     * @tc.name      testExtremeSequence_002
     * @tc.desc      Verify that a zero deletion, a negative forward deletion, a negative caret and a zero action stay separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeSequence_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteForward(-1);
      InputHandler.getInstance().moveCursor(-2 as inputMethodEngine.Direction);
      InputHandler.getInstance().sendExtendAction(0 as inputMethodEngine.ExtendAction);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.join('|')).assertEqual('-1');
      expect(harness.client.movedDirections.join('|')).assertEqual('-2');
      expect(harness.client.extendActions.join('|')).assertEqual('0');
      expect(harness.client.selectedRanges.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_SEQ_0003
     * @tc.name      testExtremeSequence_003
     * @tc.desc      Verify that a minimal deletion before the first insertion leaves the new text reachable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeSequence_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(-2147483648);
      InputHandler.getInstance().insertText('q');
      expect(harness.client.backwardLengths[0]).assertEqual(-2147483648);
      expect(harness.client.buffer).assertEqual('q');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_FLAG_0001
     * @tc.name      testExtremeFlag_001
     * @tc.desc      Verify that a deferred attach settles a negative enter type and then sends it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeFlag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', -4, 0, true, true);
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(-4);
      expect(harness.client.finishCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(-4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_FLAG_0002
     * @tc.name      testExtremeFlag_002
     * @tc.desc      Verify that a negative deletion before a deferred settle is recorded on the pending client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeFlag_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc', 0, 0, true, true);
      InputHandler.getInstance().deleteBackward(-7);
      expect(harness.client.backwardLengths.join('|')).assertEqual('-7');
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_FLAG_0003
     * @tc.name      testExtremeFlag_003
     * @tc.desc      Verify that a rejected finish still sends a negative type and counts once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testExtremeFlag_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', -7);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('-7');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_FLAG_0004
     * @tc.name      testExtremeFlag_004
     * @tc.desc      Verify that a rejected preview leaves a thousand-unit payload fully inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeFlag_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      let payload: string = '';
      for (let i: number = 0; i < 1000; i++) {
        payload = payload + 'q';
      }
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(1000);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_FLAG_0005
     * @tc.name      testExtremeFlag_005
     * @tc.desc      Verify that an undocumented direction reaches an unsupported editor while its window stays open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeFlag_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(99 as inputMethodEngine.Direction);
      expect(harness.client.movedDirections.join('|')).assertEqual('99');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EXTREME_ARGUMENT_FLAG_0006
     * @tc.name      testExtremeFlag_006
     * @tc.desc      Verify that a rejected attach command still sends the maximum enter type on enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeFlag_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647, 0, true, false, true);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(harness.client.finishCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeFlag_006 end');
      await yieldToEventLoop();
    });

  });
}
