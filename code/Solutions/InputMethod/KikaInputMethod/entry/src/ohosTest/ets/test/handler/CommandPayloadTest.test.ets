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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodCommandPayload]';

export default function commandPayloadTest(): void {
  describe('CommandPayloadTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0001
     * @tc.name      testCommandPayloadTest_001
     * @tc.desc      Verify that an empty insertion is forwarded once and leaves the editor text unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().insertText('');

      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('');
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0002
     * @tc.name      testCommandPayloadTest_002
     * @tc.desc      Verify that space, tab and line-break payloads survive insertion byte for byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const payloads: string[] = [' ', '  ', '\t', '\n'];

      for (let i = 0; i < payloads.length; i++) {
        InputHandler.getInstance().insertText(payloads[i]);
        expect(harness.client.insertedTexts[i]).assertEqual(payloads[i]);
      }
      expect(harness.client.insertedTexts.length).assertEqual(payloads.length);
      expect(harness.client.buffer).assertEqual('   \t\n');
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0003
     * @tc.name      testCommandPayloadTest_003
     * @tc.desc      Verify that CJK, emoji and mixed payloads are forwarded without a preview request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const payloads: string[] = ['输入', '😀', 'a😀b'];

      for (let i = 0; i < payloads.length; i++) {
        InputHandler.getInstance().insertText(payloads[i]);
        expect(harness.client.insertedTexts[i]).assertEqual(payloads[i]);
      }
      expect(harness.client.buffer).assertEqual('输入😀a😀b');
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0004
     * @tc.name      testCommandPayloadTest_004
     * @tc.desc      Verify that a 1024-character insertion is delivered as one payload and grows the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('start');
      let payload: string = '';
      for (let i = 0; i < 1024; i++) {
        payload = payload + 'a';
      }

      InputHandler.getInstance().insertText(payload);

      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(1024);
      expect(harness.client.buffer.length).assertEqual(1029);
      expect(harness.client.buffer.substring(0, 5)).assertEqual('start');
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0005
     * @tc.name      testCommandPayloadTest_005
     * @tc.desc      Verify that zero, short and oversized deletion lengths reach the editor unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const lengths: number[] = [0, 2, 5, 1024];

      for (let i = 0; i < lengths.length; i++) {
        InputHandler.getInstance().deleteBackward(lengths[i]);
      }
      expect(harness.client.backwardLengths.length).assertEqual(lengths.length);
      for (let i = 0; i < lengths.length; i++) {
        expect(harness.client.backwardLengths[i]).assertEqual(lengths[i]);
      }
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0006
     * @tc.name      testCommandPayloadTest_006
     * @tc.desc      Verify that all four caret directions are forwarded once in issue order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const directions: inputMethodEngine.Direction[] = [
        inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT,
        inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN
      ];

      for (let i = 0; i < directions.length; i++) {
        InputHandler.getInstance().moveCursor(directions[i]);
      }
      expect(harness.client.movedDirections.length).assertEqual(4);
      for (let i = 0; i < directions.length; i++) {
        expect(harness.client.movedDirections[i]).assertEqual(directions[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0007
     * @tc.name      testCommandPayloadTest_007
     * @tc.desc      Verify that cut, copy and paste edit actions keep their declared order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const actions: inputMethodEngine.ExtendAction[] = [
        inputMethodEngine.ExtendAction.CUT,
        inputMethodEngine.ExtendAction.COPY,
        inputMethodEngine.ExtendAction.PASTE
      ];

      for (let i = 0; i < actions.length; i++) {
        InputHandler.getInstance().sendExtendAction(actions[i]);
      }
      expect(harness.client.extendActions.length).assertEqual(3);
      for (let i = 0; i < actions.length; i++) {
        expect(harness.client.extendActions[i]).assertEqual(actions[i]);
      }
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0008
     * @tc.name      testCommandPayloadTest_008
     * @tc.desc      Verify that three consecutive hide requests each reach the panel controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      for (let i = 0; i < 3; i++) {
        InputHandler.getInstance().hideKeyboardSelf();
      }
      expect(harness.keyboard.hideCount).assertEqual(3);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0009
     * @tc.name      testCommandPayloadTest_009
     * @tc.desc      Verify that two enter requests send the type twice and finish preview twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.keyFunctions[1]).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0010
     * @tc.name      testCommandPayloadTest_010
     * @tc.desc      Verify that the insert channel records both payloads without touching delete or caret channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();

      handler.insertText('a');
      handler.insertText('bc');

      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0011
     * @tc.name      testCommandPayloadTest_011
     * @tc.desc      Verify that three backward lengths keep their order and never reach the forward channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteBackward(5);

      expect(harness.client.backwardLengths.join(',')).assertEqual('0,1,5');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0012
     * @tc.name      testCommandPayloadTest_012
     * @tc.desc      Verify that two forward lengths keep their order and never reach the backward channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().deleteForward(3);

      expect(harness.client.forwardLengths.join(',')).assertEqual('2,3');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_PAYLOAD_0013
     * @tc.name      testCommandPayloadTest_013
     * @tc.desc      Verify that left then right caret moves appear once each and in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandPayloadTest_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();

      handler.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);

      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movedDirections[1]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandPayloadTest_013 end');
      await yieldToEventLoop();
    });

  });

}
