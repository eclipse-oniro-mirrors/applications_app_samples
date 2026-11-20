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
import { keyboardController } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';
import { makeKeyEvent, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodKeyActionField]';

export default function keyActionFieldTest(): void {
  describe('KeyActionFieldTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_ACTION_FIELD_0001
     * @tc.name      testKeyActionField_001
     * @tc.desc      Verify that a key-down carrying an up action still inserts the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyActionField_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyActionField_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(keyboardController.onKeyDown(makeKeyEvent(2017, 3))).assertEqual(true);
      expect(harness.client.buffer).assertEqual('a');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      releaseHardKey(2017);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyActionField_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_ACTION_FIELD_0002
     * @tc.name      testKeyActionField_002
     * @tc.desc      Verify that a shift released with a down action still clears the hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyActionField_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyActionField_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      keyboardController.onKeyDown(makeKeyEvent(2047, 3));
      expect(isShiftHeld()).assertTrue();
      keyboardController.onKeyUp(makeKeyEvent(2047, 2));
      expect(isShiftHeld()).assertFalse();
      pressHardKey(2017);
      releaseHardKey(2017);
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyActionField_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_ACTION_FIELD_0003
     * @tc.name      testKeyActionField_003
     * @tc.desc      Verify that extreme key action values do not stop the key-down path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyActionField_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyActionField_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(keyboardController.onKeyDown(makeKeyEvent(2018, 99))).assertEqual(true);
      expect(keyboardController.onKeyDown(makeKeyEvent(2019, 0))).assertEqual(true);
      expect(harness.client.buffer).assertEqual('bc');
      expect(harness.client.insertedTexts.join('')).assertEqual('bc');
      releaseHardKey(2018);
      releaseHardKey(2019);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyActionField_003 end');
      await yieldToEventLoop();
    });

  });
}
