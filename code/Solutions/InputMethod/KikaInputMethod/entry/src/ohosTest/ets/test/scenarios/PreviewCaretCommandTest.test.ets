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
const TAG: string = '[Sample_KikaInputMethodPreviewCaretCommand]';

export default function previewCaretCommandTest(): void {
  describe('PreviewCaretCommandTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0001
     * @tc.name      testPreviewCaretCommandTest_001
     * @tc.desc      Verify that caret-begin during a preview selects the fixed origin and keeps the preview open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0002
     * @tc.name      testPreviewCaretCommandTest_002
     * @tc.desc      Verify that caret-end during a preview selects the fixed tail and leaves the buffer intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const previewText: string = harness.client.buffer;

      await InputHandler.getInstance().moveCursorToEnd();
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.buffer).assertEqual(previewText);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0003
     * @tc.name      testPreviewCaretCommandTest_003
     * @tc.desc      Verify that select-to-begin uses the live preview cursor as its range end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const cursorIndex: number = harness.client.cursor;

      await InputHandler.getInstance().selectToBegin();
      expect(cursorIndex > 0).assertTrue();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(cursorIndex);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0004
     * @tc.name      testPreviewCaretCommandTest_004
     * @tc.desc      Verify that select-to-end starts at the live preview cursor and reaches the fixed tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const cursorIndex: number = harness.client.cursor;

      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(cursorIndex);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0005
     * @tc.name      testPreviewCaretCommandTest_005
     * @tc.desc      Verify that a cut action during a preview is forwarded without finishing it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0006
     * @tc.name      testPreviewCaretCommandTest_006
     * @tc.desc      Verify that select-all during a preview preserves both the buffer and the preview call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const previewBuffer: string = harness.client.buffer;

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.buffer).assertEqual(previewBuffer);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0007
     * @tc.name      testPreviewCaretCommandTest_007
     * @tc.desc      Verify that a hide during a preview still allows the next caret-begin selection.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewCaretCommandTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().hideKeyboardSelf();
      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CARET_0008
     * @tc.name      testPreviewCaretCommandTest_008
     * @tc.desc      Verify that enter finishes the preview and a following caret-begin still selects the origin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewCaretCommandTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().sendKeyFunction();
      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.client.keyFunctions.join('')).assertEqual('7');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCaretCommandTest_008 end');
      await yieldToEventLoop();
    });

  });
}
