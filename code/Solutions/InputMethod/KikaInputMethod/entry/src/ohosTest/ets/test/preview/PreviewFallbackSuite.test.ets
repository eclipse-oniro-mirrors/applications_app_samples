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

import { Level, Size, TestType, describe, expect, it } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewSelectionFallback]';

export default function PreviewFallbackSuiteTest(): void {
  describe('PreviewFallbackSuite', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SELECTION_0001
     * @tc.name      testPreviewSelectionFallbackTest_001
     * @tc.desc      Verify that both selections use the preview cursor index and ignore x.
     */
    it('testPreviewSelectionFallbackTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSelectionFallbackTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().setCursorInfo({ x: 7, y: 0, height: 0 });
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(10);
      expect(harness.client.selectedRanges[1].start).assertEqual(10);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      expect(harness.client.buffer).assertEqual('hello world');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSelectionFallbackTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DOUBLE_0001
     * @tc.name      testPreviewDoubleFinishTest_001
     * @tc.desc      Verify that confirming two chained previews finishes once and keeps both texts.
     */
    it('testPreviewDoubleFinishTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDoubleFinishTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'helhel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDoubleFinishTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DOUBLE_0002
     * @tc.name      testPreviewDoubleFinishTest_002
     * @tc.desc      Verify that enter after a hide following confirmation raises the finish count again.
     */
    it('testPreviewDoubleFinishTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDoubleFinishTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDoubleFinishTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_REPEAT_0001
     * @tc.name      testPreviewRepeatTest_001
     * @tc.desc      Verify that a new trigger after confirmation opens a second preview.
     */
    it('testPreviewRepeatTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewRepeatTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'hel');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('hello worldhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewRepeatTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_REPEAT_0002
     * @tc.name      testPreviewRepeatTest_002
     * @tc.desc      Verify that ordinary typing after confirmation does not open another preview.
     */
    it('testPreviewRepeatTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewRepeatTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'x');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewRepeatTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_REPEAT_0003
     * @tc.name      testPreviewRepeatTest_003
     * @tc.desc      Verify that hiding a preview does not prevent a later second trigger.
     */
    it('testPreviewRepeatTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewRepeatTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      typeSequence(harness, 'hel');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('hello worldhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewRepeatTest_003 end');
      await yieldToEventLoop();
    });

  });
}
