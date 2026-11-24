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
const TAG: string = '[Sample_KikaInputMethodPreviewSupportFlag]';

export default function previewSupportFlagTest(): void {
  describe('PreviewSupportFlagTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FLAG_0001
     * @tc.name      testPreviewSupportFlagTest_001
     * @tc.desc      Verify that an editor without preview support still receives the trigger preview request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewSupportFlagTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);

      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].text).assertEqual('hello world');
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FLAG_0002
     * @tc.name      testPreviewSupportFlagTest_002
     * @tc.desc      Verify that the unsupported editor still finishes the preview on enter exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewSupportFlagTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FLAG_0003
     * @tc.name      testPreviewSupportFlagTest_003
     * @tc.desc      Verify that both support states produce the same preview text and overwrite range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewSupportFlagTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_003 begin');
      const flags: boolean[] = [true, false];
      const buffers: string[] = [];
      const starts: number[] = [];
      const ends: number[] = [];

      for (let i = 0; i < flags.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness('', 0, 0, flags[i]);
        typeSequence(harness, 'hel');
        expect(harness.client.previewCalls.length).assertEqual(1);
        buffers.push(harness.client.buffer);
        starts.push(harness.client.previewCalls[0].start);
        ends.push(harness.client.previewCalls[0].end);
      }
      expect(buffers[0]).assertEqual(buffers[1]);
      expect(starts[0]).assertEqual(starts[1]);
      expect(ends[0]).assertEqual(ends[1]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_FLAG_0004
     * @tc.name      testPreviewSupportFlagTest_004
     * @tc.desc      Verify that a non-trigger sequence on the unsupported editor opens no preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPreviewSupportFlagTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);

      typeSequence(harness, 'he');

      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('he');
      expect(harness.client.buffer).assertEqual('he');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSupportFlagTest_004 end');
      await yieldToEventLoop();
    });

  });

}
