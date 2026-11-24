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
const TAG: string = '[Sample_KikaInputMethodAttributeWindow]';

export default function attributeWindowTest(): void {
  describe('AttributeWindowTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_WINDOW_0001
     * @tc.name      testAttributeWindowTest_001
     * @tc.desc      Verify that a negative enter type is stored and forwarded without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeWindowTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', -5);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(-5);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_WINDOW_0002
     * @tc.name      testAttributeWindowTest_002
     * @tc.desc      Verify that the largest positive enter type survives storage and forwarding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttributeWindowTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_WINDOW_0003
     * @tc.name      testAttributeWindowTest_003
     * @tc.desc      Verify that an extreme input pattern is published without changing the enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttributeWindowTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4, 2147483647);
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2147483647);
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_WINDOW_0004
     * @tc.name      testAttributeWindowTest_004
     * @tc.desc      Verify that three small enter types keep their attach order in storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeWindowTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_004 begin');
      const values: number[] = [1, 3, 6];
      for (let i = 0; i < values.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness('', values[i]);
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(values[i]);
        expect(harness.client.editorAttributeCount).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_WINDOW_0005
     * @tc.name      testAttributeWindowTest_005
     * @tc.desc      Verify that a restart swaps both stored values while the old client keeps its own type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeWindowTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_005 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1, 2);
      InputHandler.getInstance().sendKeyFunction();
      const second: PreviewHarness = await createPreviewHarness('', 7, 5);
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions[0]).assertEqual(1);
      expect(second.client.keyFunctions[0]).assertEqual(7);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(7);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeWindowTest_005 end');
      await yieldToEventLoop();
    });

  });

}
