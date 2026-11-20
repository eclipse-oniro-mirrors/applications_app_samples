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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSelectionFallback]';

export default function selectionCursorFallbackTest(): void {
  describe('SelectionCursorFallbackTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SELECTION_FALLBACK_0001
     * @tc.name      testSelectionCursorFallbackTest_001
     * @tc.desc      Verify that a non-zero cursor index wins over the recorded x coordinate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSelectionCursorFallbackTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectionCursorFallbackTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().setCursorInfo({ x: 7, y: 0, height: 0 });

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(2);
      expect(harness.client.selectedRanges[1].start).assertEqual(2);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);

      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectionCursorFallbackTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SELECTION_FALLBACK_0002
     * @tc.name      testSelectionCursorFallbackTest_002
     * @tc.desc      Verify that a single-character editor with cursor zero still uses the recorded x value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSelectionCursorFallbackTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectionCursorFallbackTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      InputHandler.getInstance().setCursorInfo({ x: 9, y: 0, height: 0 });

      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();

      expect(harness.client.selectedRanges.length).assertEqual(2);
      const bounds: number[] = [
        harness.client.selectedRanges[0].start, harness.client.selectedRanges[0].end,
        harness.client.selectedRanges[1].start, harness.client.selectedRanges[1].end
      ];
      expect(bounds.join(',')).assertEqual('0,9,9,1000');
      expect(harness.client.buffer).assertEqual('a');

      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectionCursorFallbackTest_002 end');
      await yieldToEventLoop();
    });

  });

}
