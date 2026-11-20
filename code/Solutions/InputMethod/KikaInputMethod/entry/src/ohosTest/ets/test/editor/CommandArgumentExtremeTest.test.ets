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
const TAG: string = '[Sample_KikaInputMethodCommandArgumentExtreme]';

export default function commandArgumentExtremeTest(): void {
  describe('CommandArgumentExtremeTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_ARGUMENT_0001
     * @tc.name      testCommandArgumentExtremeTest_001
     * @tc.desc      Verify that a negative backward length is forwarded without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandArgumentExtremeTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandArgumentExtremeTest_001 begin');
      // Delete lengths are forwarded verbatim; the fake editor keeps its buffer.
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().deleteBackward(-1);
      // The fake editor keeps its buffer, which isolates forwarding from editing.
      expect(harness.client.backwardLengths[0]).assertEqual(-1);
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandArgumentExtremeTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_ARGUMENT_0002
     * @tc.name      testCommandArgumentExtremeTest_002
     * @tc.desc      Verify that the largest integer deletion length is forwarded unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandArgumentExtremeTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandArgumentExtremeTest_002 begin');
      // Command channels are independent, so each array is asserted separately.
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().deleteBackward(2147483647);
      expect(harness.client.backwardLengths[0]).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandArgumentExtremeTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMAND_ARGUMENT_0003
     * @tc.name      testCommandArgumentExtremeTest_003
     * @tc.desc      Verify that alternating negative and positive lengths keep their order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandArgumentExtremeTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandArgumentExtremeTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(-2);
      InputHandler.getInstance().deleteForward(4);
      InputHandler.getInstance().deleteBackward(6);
      expect(harness.client.backwardLengths.join(',')).assertEqual('-2,6');
      expect(harness.client.forwardLengths.join(',')).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandArgumentExtremeTest_003 end');
      await yieldToEventLoop();
    });

  });

}
