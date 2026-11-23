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
import { KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { createKeyboardController, isAlphabetKeyCode, isNumberKeyCode } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputClassifierCount]';

export default function classifierCountTest(): void {
  describe('ClassifierCountTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFIER_COUNT_0100
     * @tc.name      testClassifierCount_001
     * @tc.desc      Verify that the alphabet range yields exactly twenty-six positive classifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassifierCount_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_001 begin');
      const controller: KeyboardController = createKeyboardController();
      let positives: number = 0;
      for (let code = 2017; code <= 2042; code++) {
        if (isAlphabetKeyCode(controller, code)) {
          positives = positives + 1;
        }
      }
      expect(positives).assertEqual(26);
      expect(positives * 2).assertEqual(52);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFIER_COUNT_0200
     * @tc.name      testClassifierCount_002
     * @tc.desc      Verify that the decimal range yields exactly ten number classifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassifierCount_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_002 begin');
      const controller: KeyboardController = createKeyboardController();
      let digits: number = 0;
      for (let code = 2000; code <= 2009; code++) {
        if (isNumberKeyCode(controller, code)) {
          digits = digits + 1;
        }
      }
      expect(digits).assertEqual(10);
      expect(isNumberKeyCode(controller, 2010)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFIER_COUNT_0300
     * @tc.name      testClassifierCount_003
     * @tc.desc      Verify that the numpad range also yields exactly ten number classifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassifierCount_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_003 begin');
      const controller: KeyboardController = createKeyboardController();
      let numpad: number = 0;
      for (let code = 2103; code <= 2112; code++) {
        if (isNumberKeyCode(controller, code)) {
          numpad = numpad + 1;
        }
      }
      expect(numpad).assertEqual(10);
      expect(isAlphabetKeyCode(controller, 2103)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFIER_COUNT_0400
     * @tc.name      testClassifierCount_004
     * @tc.desc      Verify that a gap window produces zero positives for both classifiers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassifierCount_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_004 begin');
      const controller: KeyboardController = createKeyboardController();
      let positives: number = 0;
      for (let code = 2051; code <= 2063; code++) {
        if (isAlphabetKeyCode(controller, code) || isNumberKeyCode(controller, code)) {
          positives = positives + 1;
        }
      }
      expect(positives).assertEqual(0);
      expect(isAlphabetKeyCode(controller, 2051) || isNumberKeyCode(controller, 2051)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFIER_COUNT_0500
     * @tc.name      testClassifierCount_005
     * @tc.desc      Verify that the alphabet neighbours add no positives outside the exact range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassifierCount_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_005 begin');
      const controller: KeyboardController = createKeyboardController();
      const window: number[] = [2016, 2017, 2042, 2043];
      let positives: number = 0;
      for (let i = 0; i < window.length; i++) {
        if (isAlphabetKeyCode(controller, window[i])) {
          positives = positives + 1;
        }
      }
      expect(positives).assertEqual(2);
      expect(positives + 2).assertEqual(window.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLASSIFIER_COUNT_0600
     * @tc.name      testClassifierCount_006
     * @tc.desc      Verify that a mixed window splits into its two exact class totals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testClassifierCount_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_006 begin');
      const controller: KeyboardController = createKeyboardController();
      let letters: number = 0;
      let numbers: number = 0;
      for (let code = 2000; code <= 2017; code++) {
        if (isAlphabetKeyCode(controller, code)) {
          letters = letters + 1;
        }
        if (isNumberKeyCode(controller, code)) {
          numbers = numbers + 1;
        }
      }
      expect(letters).assertEqual(1);
      expect(numbers).assertEqual(10);
      expect(letters + numbers).assertEqual(11);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClassifierCount_006 end');
      await yieldToEventLoop();
    });

  });
}
