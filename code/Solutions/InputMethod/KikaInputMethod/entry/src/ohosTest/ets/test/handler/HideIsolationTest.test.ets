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
const TAG: string = '[Sample_KikaInputMethodHideIsolation]';

export default function hideIsolationTest(): void {
  describe('HideIsolationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_ISOLATION_0001
     * @tc.name      testHideIsolationTest_001
     * @tc.desc      Verify that hiding the keyboard emits only the panel request and no editor command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideIsolationTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().hideKeyboardSelf();

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('abc');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_ISOLATION_0002
     * @tc.name      testHideIsolationTest_002
     * @tc.desc      Verify that the editor remains reachable after a hide request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideIsolationTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('d');

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('d');
      expect(harness.client.buffer).assertEqual('abcd');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_ISOLATION_0003
     * @tc.name      testHideIsolationTest_003
     * @tc.desc      Verify that two hides followed by enter keep the hide and finish counts separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideIsolationTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HIDE_ISOLATION_0004
     * @tc.name      testHideIsolationTest_004
     * @tc.desc      Verify that a hide does not prevent the next trigger sequence from opening a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideIsolationTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().hideKeyboardSelf();
      typeSequence(harness, 'hel');

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideIsolationTest_004 end');
      await yieldToEventLoop();
    });

  });

}
