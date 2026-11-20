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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewFailureSessionExpansion]';

export default function previewFailureSessionExpansionTest(): void {
  describe('PreviewFailureSessionExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FAILURE_SESSION_0001
     * @tc.name      testPreviewFailureSessionExpansion_001
     * @tc.desc      Verify that hide and enter still work on an editor without preview support.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewFailureSessionExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FAILURE_SESSION_0002
     * @tc.name      testPreviewFailureSessionExpansion_002
     * @tc.desc      Verify that two select-to-begin calls during a preview repeat the same cursor range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewFailureSessionExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const cursorIndex: number = harness.client.cursor;

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[1].end).assertEqual(cursorIndex);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FAILURE_SESSION_0003
     * @tc.name      testPreviewFailureSessionExpansion_003
     * @tc.desc      Verify that caret-end and a zero backward deletion leave the preview call untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewFailureSessionExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FAILURE_SESSION_0004
     * @tc.name      testPreviewFailureSessionExpansion_004
     * @tc.desc      Verify that two enter requests count two finishes even when finish is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewFailureSessionExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      harness.client.failFinish = true;
      typeSequence(harness, 'hel');
      const previewBuffer: string = harness.client.buffer;

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.buffer).assertEqual(previewBuffer);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FAILURE_SESSION_0005
     * @tc.name      testPreviewFailureSessionExpansion_005
     * @tc.desc      Verify that two hides during a preview still allow a following caret-begin range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewFailureSessionExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FAILURE_SESSION_0006
     * @tc.name      testPreviewFailureSessionExpansion_006
     * @tc.desc      Verify that a rejected preview keeps the typed text and still finishes on enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewFailureSessionExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 1);
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hel');

      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFailureSessionExpansion_006 end');
      await yieldToEventLoop();
    });

  });
}
