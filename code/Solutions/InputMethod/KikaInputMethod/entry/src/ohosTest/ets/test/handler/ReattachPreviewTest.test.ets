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
const TAG: string = '[Sample_KikaInputMethodReattachPreview]';

export default function reattachPreviewTest(): void {
  describe('ReattachPreviewTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REATTACH_PREVIEW_0001
     * @tc.name      testReattachPreviewTest_001
     * @tc.desc      Verify that enter after a mid-preview switch finishes the new client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachPreviewTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachPreviewTest_001 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('xyz');
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.finishCount).assertEqual(1);
      expect(first.client.finishCount).assertEqual(0);
      expect(second.client.buffer).assertEqual('xyz');
      expect(first.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachPreviewTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REATTACH_PREVIEW_0002
     * @tc.name      testReattachPreviewTest_002
     * @tc.desc      Verify that typing after a mid-preview switch reaches the new client without a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachPreviewTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachPreviewTest_002 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('xyz');
      InputHandler.getInstance().insertText('q');
      expect(second.client.insertedTexts.join('')).assertEqual('q');
      expect(second.client.buffer).assertEqual('xyzq');
      expect(second.client.previewCalls.length).assertEqual(0);
      expect(first.client.insertedTexts.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachPreviewTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_REATTACH_PREVIEW_0003
     * @tc.name      testReattachPreviewTest_003
     * @tc.desc      Verify that a hide after a mid-preview switch reaches the new controller only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testReattachPreviewTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachPreviewTest_003 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('xyz');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(first.keyboard.hideCount).assertEqual(0);
      expect(first.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReattachPreviewTest_003 end');
      await yieldToEventLoop();
    });

  });

}
