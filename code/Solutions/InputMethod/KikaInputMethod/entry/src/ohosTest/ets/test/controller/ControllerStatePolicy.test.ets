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
import { pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodControllerStatePolicy]';

export default function controllerStatePolicy(): void {
  describe('ControllerStatePolicy', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CTRL_STATE_POLICY_0001
     * @tc.name      testControllerStatePolicy_001
     * @tc.desc      Fresh singleton reports no shift hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStatePolicy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_001 begin');

      const expected: boolean = false;

      const actual: boolean = isShiftHeld();
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CTRL_STATE_POLICY_0002
     * @tc.name      testControllerStatePolicy_002
     * @tc.desc      Verify that both shift keys are remembered as the leading hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStatePolicy_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_002 begin');
      const shifts: number[] = [2047, 2048];

      // Left and right shift share the same leading-hold path.
      for (let i = 0; i < shifts.length; i++) {
        pressHardKey(shifts[i]);
        expect(isShiftHeld()).assertEqual(true);
        releaseHardKey(shifts[i]);
        expect(isShiftHeld()).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CTRL_STATE_POLICY_0003
     * @tc.name      testControllerStatePolicy_003
     * @tc.desc      Releasing an unheld shift does not create a hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStatePolicy_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_003 begin');

      releaseHardKey(2047);
      const expected: boolean = false;

      const actual: boolean = isShiftHeld();
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CTRL_STATE_POLICY_0004
     * @tc.name      testControllerStatePolicy_004
     * @tc.desc      Verify that an unmapped code blocks the next letter until every key is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStatePolicy_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_004 begin');
      const harness: PreviewHarness = await createPreviewHarness("");

      expect(pressHardKey(2049)).assertFalse();
      expect(pressHardKey(2017)).assertFalse();
      expect(releaseHardKey(2017)).assertFalse();
      expect(releaseHardKey(2049)).assertFalse();
      expect(pressHardKey(2017)).assertTrue();
      expect(releaseHardKey(2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStatePolicy_004 end');
      await yieldToEventLoop();
    });

  });

}
