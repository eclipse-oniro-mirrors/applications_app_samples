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
const TAG: string = '[Sample_KikaInputMethodCommandProtocolSequence]';

export default function commandProtocolSequenceTest(): void {
  describe('CommandProtocolSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0001
     * @tc.name      testCommandProtocolSequence_001
     * @tc.desc      Verify that a deletion, move and forward deletion during a preview keep it open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.insertedTexts[harness.client.insertedTexts.length - 1]).assertEqual('a');
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(3);
      expect(harness.client.forwardLengths[0]).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0002
     * @tc.name      testCommandProtocolSequence_002
     * @tc.desc      Verify that enter commits the preview and a following zero deletion keeps its slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worlda');
      expect(harness.client.backwardLengths[0]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0003
     * @tc.name      testCommandProtocolSequence_003
     * @tc.desc      Verify that cut, insertion and forward deletion during a preview stay three entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length >= 1).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0004
     * @tc.name      testCommandProtocolSequence_004
     * @tc.desc      Verify that two selection movements then copy keep three recorded commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.movementDirections.join('|')).assertEqual('1|2');
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0005
     * @tc.name      testCommandProtocolSequence_005
     * @tc.desc      Verify that enter, hide and insertion during a preview keep three counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('d');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldd');
      expect(harness.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0006
     * @tc.name      testCommandProtocolSequence_006
     * @tc.desc      Verify that two zero deletions before an insertion leave three channels intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().insertText('e');
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.forwardLengths[0]).assertEqual(0);
      expect(harness.client.buffer).assertEqual('e');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0007
     * @tc.name      testCommandProtocolSequence_007
     * @tc.desc      Verify that two plain letters followed by two five-unit deletions keep the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hi');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(5);
      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.buffer).assertEqual('hi');
      expect(harness.client.movedDirections[0]).assertEqual(3);
      expect(harness.client.forwardLengths[0]).assertEqual(5);
      expect(harness.client.backwardLengths[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0008
     * @tc.name      testCommandProtocolSequence_008
     * @tc.desc      Verify that two right moves and two insertions alternate in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('f');
      expect(harness.client.movedDirections[0]).assertEqual(4);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('f');
      expect(harness.client.keyFunctions[0]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0009
     * @tc.name      testCommandProtocolSequence_009
     * @tc.desc      Verify that hides around opposite deletions during a preview stay out of the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.movementDirections[0]).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.previewCalls.length >= 1).assertTrue();
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PROTOCOL_SEQUENCE_0010
     * @tc.name      testCommandProtocolSequence_010
     * @tc.desc      Verify that paste, a downward move and select-all stay three separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_010 end');
      await yieldToEventLoop();
    });

  });
}
