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
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewBoundary]';

export default function previewBoundaryTest(): void {
  describe('PreviewBoundaryTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_BOUNDARY_0001
     * @tc.name      testPreviewBoundaryTest_001
     * @tc.desc      Verify that a two-character prefix triggers at the buffer start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewBoundaryTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_001 begin');
      // Preview ranges are anchored at the cursor before the overwrite.
      const harness: PreviewHarness = await createPreviewHarness('he');
      typeSequence(harness, 'l');
      // A confirmed preview must leave the committed buffer untouched.
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_BOUNDARY_0002
     * @tc.name      testPreviewBoundaryTest_002
     * @tc.desc      Verify that a trigger at the end of a long buffer computes its own range.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewBoundaryTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_002 begin');
      let initial: string = 'he';
      for (let i = 0; i < 98; i++) {
        initial = initial + 'x';
      }
      // A client switch must not leak the old preview into the new editor.
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, 'l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(98);
      expect(harness.client.previewCalls[0].end).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_BOUNDARY_0003
     * @tc.name      testPreviewBoundaryTest_003
     * @tc.desc      Verify that two enter calls finish the preview twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewBoundaryTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_BOUNDARY_0004
     * @tc.name      testPreviewBoundaryTest_004
     * @tc.desc      Verify that hiding a preview delays its finish until the next enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewBoundaryTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      // Preview ranges are cursor-based; the committed prefix decides the overwrite.
      expect(harness.client.finishCount).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewBoundaryTest_004 end');
      await yieldToEventLoop();
    });

  });

}
