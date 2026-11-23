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
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodFaultCombination]';

export default function faultCombinationTest(): void {
  describe('FaultCombinationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_COMBINATION_0001
     * @tc.name      testFaultCombination_001
     * @tc.desc      Verify that a preview fault leaves typed text while a finish fault still counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      harness.client.failFinish = true;
      InputHandler.getInstance().insertText('h');
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hel');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_COMBINATION_0002
     * @tc.name      testFaultCombination_002
     * @tc.desc      Verify that a private-command fault and a preview fault leave the buffer editable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('a');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_COMBINATION_0003
     * @tc.name      testFaultCombination_003
     * @tc.desc      Verify that a rejected hide does not prevent a later enter from finishing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.keyboard.failHide = true;
      InputHandler.getInstance().insertText('h');
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_COMBINATION_0004
     * @tc.name      testFaultCombination_004
     * @tc.desc      Verify that a new harness after a preview fault opens a normal preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_004 begin');
      const broken: PreviewHarness = await createPreviewHarness('');
      broken.client.failPreview = true;
      InputHandler.getInstance().insertText('h');
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      const healthy: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('h');
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      expect(broken.client.previewCalls.length).assertEqual(0);
      expect(healthy.client.previewCalls.length).assertEqual(1);
      expect(healthy.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_COMBINATION_0005
     * @tc.name      testFaultCombination_005
     * @tc.desc      Verify that two rejected finishes still count two enter requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.join('|')).assertEqual('4|4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_FAULT_COMBINATION_0006
     * @tc.name      testFaultCombination_006
     * @tc.desc      Verify that a rejected preview still permits a cursor range request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFaultCombination_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('h');
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      const cursorIndex: number = harness.client.cursor;
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(cursorIndex);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testFaultCombination_006 end');
      await yieldToEventLoop();
    });

  });
}
