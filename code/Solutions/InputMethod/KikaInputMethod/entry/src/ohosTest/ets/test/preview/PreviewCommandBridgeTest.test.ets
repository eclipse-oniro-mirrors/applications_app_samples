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
const TAG: string = '[Sample_KikaInputMethodPreviewCommandBridge]';

/**
 * A second command family issued while a preview is shown. These cases pin how
 * enter, hide, caret movement and boundary selection interact with the preview
 * buffer; the preview matrix only covers typing.
 */

export default function previewCommandBridgeTest(): void {
  describe('PreviewCommandBridgeTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMAND_BRIDGE_0001
     * @tc.name      testPreviewCommandBridgeTest_001
     * @tc.desc      Verify that the enter command finishes an active preview once and keeps its buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCommandBridgeTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness("");
      typeSequence(harness, "hel");
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual("hello world");

      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.privateCommandCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMAND_BRIDGE_0002
     * @tc.name      testPreviewCommandBridgeTest_002
     * @tc.desc      Verify that hiding the keyboard during a preview leaves the preview buffer untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCommandBridgeTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness("");
      typeSequence(harness, "hel");
      InputHandler.getInstance().hideKeyboardSelf();

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual("hello world");
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMAND_BRIDGE_0003
     * @tc.name      testPreviewCommandBridgeTest_003
     * @tc.desc      Verify that each caret direction issued during a preview keeps the buffer unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewCommandBridgeTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_003 begin');
      const directions: number[] = [inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT, inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN];

      for (let i = 0; i < directions.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness("");
        typeSequence(harness, "hel");
        InputHandler.getInstance().moveCursor(directions[i]);
        expect(harness.client.movedDirections.length).assertEqual(1);
        expect(harness.client.movedDirections[0]).assertEqual(directions[i]);
        expect(harness.client.buffer).assertEqual("hello world");
        expect(harness.client.previewCalls.length).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMAND_BRIDGE_0004
     * @tc.name      testPreviewCommandBridgeTest_004
     * @tc.desc      Verify that selecting to either boundary after a preview uses the preview cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewCommandBridgeTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_004 begin');
      const toEnd: boolean[] = [true, false];

      for (let i = 0; i < toEnd.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness("");
        typeSequence(harness, "hel");
        if (toEnd[i]) {
          await InputHandler.getInstance().selectToEnd();
        } else {
          await InputHandler.getInstance().selectToBegin();
        }
        expect(harness.client.selectedRanges.length).assertEqual(1);
        if (toEnd[i]) {
          expect(harness.client.selectedRanges[0].start).assertEqual(10);
          expect(harness.client.selectedRanges[0].end).assertEqual(1000);
        } else {
          expect(harness.client.selectedRanges[0].start).assertEqual(0);
          expect(harness.client.selectedRanges[0].end).assertEqual(10);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommandBridgeTest_004 end');
      await yieldToEventLoop();
    });

  });

}
