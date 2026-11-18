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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { KeyCode } from '@kit.InputKit';
import { KeyboardController } from '../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyboardControllerRanges]';

export default function KeyboardControllerRangesAdvancedTest(): void {
  describe('KeyboardControllerRangesAdvancedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0236
     * @tc.name      testKeyboardControllerRange0236
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0236 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2034 >= KeyCode.KEYCODE_0 && 2034 <= KeyCode.KEYCODE_9) ||
        (2034 >= KeyCode.KEYCODE_NUMPAD_0 && 2034 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2034)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2034)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0236 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0237
     * @tc.name      testKeyboardControllerRange0237
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2035.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0237 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2035 >= KeyCode.KEYCODE_0 && 2035 <= KeyCode.KEYCODE_9) ||
        (2035 >= KeyCode.KEYCODE_NUMPAD_0 && 2035 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2035)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2035)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0237 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0238
     * @tc.name      testKeyboardControllerRange0238
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0238 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2036 >= KeyCode.KEYCODE_0 && 2036 <= KeyCode.KEYCODE_9) ||
        (2036 >= KeyCode.KEYCODE_NUMPAD_0 && 2036 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2036)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2036)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0238 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0239
     * @tc.name      testKeyboardControllerRange0239
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2037.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0239 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2037 >= KeyCode.KEYCODE_0 && 2037 <= KeyCode.KEYCODE_9) ||
        (2037 >= KeyCode.KEYCODE_NUMPAD_0 && 2037 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2037)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2037)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0239 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0240
     * @tc.name      testKeyboardControllerRange0240
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2038.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0240 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2038 >= KeyCode.KEYCODE_0 && 2038 <= KeyCode.KEYCODE_9) ||
        (2038 >= KeyCode.KEYCODE_NUMPAD_0 && 2038 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2038)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2038)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0240 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0241
     * @tc.name      testKeyboardControllerRange0241
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2039.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0241 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2039 >= KeyCode.KEYCODE_0 && 2039 <= KeyCode.KEYCODE_9) ||
        (2039 >= KeyCode.KEYCODE_NUMPAD_0 && 2039 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2039)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2039)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0241 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0242
     * @tc.name      testKeyboardControllerRange0242
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2040.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0242 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2040 >= KeyCode.KEYCODE_0 && 2040 <= KeyCode.KEYCODE_9) ||
        (2040 >= KeyCode.KEYCODE_NUMPAD_0 && 2040 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2040)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2040)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0242 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0243
     * @tc.name      testKeyboardControllerRange0243
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2041.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0243 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2041 >= KeyCode.KEYCODE_0 && 2041 <= KeyCode.KEYCODE_9) ||
        (2041 >= KeyCode.KEYCODE_NUMPAD_0 && 2041 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2041)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2041)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0243 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0244
     * @tc.name      testKeyboardControllerRange0244
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2042.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0244 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2042 >= KeyCode.KEYCODE_0 && 2042 <= KeyCode.KEYCODE_9) ||
        (2042 >= KeyCode.KEYCODE_NUMPAD_0 && 2042 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2042)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2042)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0244 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0245
     * @tc.name      testKeyboardControllerRange0245
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2043.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0245 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2043 >= KeyCode.KEYCODE_0 && 2043 <= KeyCode.KEYCODE_9) ||
        (2043 >= KeyCode.KEYCODE_NUMPAD_0 && 2043 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2043)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2043)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0245 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0246
     * @tc.name      testKeyboardControllerRange0246
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2044.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0246 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2044 >= KeyCode.KEYCODE_0 && 2044 <= KeyCode.KEYCODE_9) ||
        (2044 >= KeyCode.KEYCODE_NUMPAD_0 && 2044 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2044)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2044)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0246 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0247
     * @tc.name      testKeyboardControllerRange0247
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0247 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2045 >= KeyCode.KEYCODE_0 && 2045 <= KeyCode.KEYCODE_9) ||
        (2045 >= KeyCode.KEYCODE_NUMPAD_0 && 2045 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2045)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2045)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0247 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0248
     * @tc.name      testKeyboardControllerRange0248
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2046.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0248 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2046 >= KeyCode.KEYCODE_0 && 2046 <= KeyCode.KEYCODE_9) ||
        (2046 >= KeyCode.KEYCODE_NUMPAD_0 && 2046 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2046)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2046)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0248 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0249
     * @tc.name      testKeyboardControllerRange0249
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0249 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2047 >= KeyCode.KEYCODE_0 && 2047 <= KeyCode.KEYCODE_9) ||
        (2047 >= KeyCode.KEYCODE_NUMPAD_0 && 2047 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2047)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2047)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0249 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0250
     * @tc.name      testKeyboardControllerRange0250
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0250 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2048 >= KeyCode.KEYCODE_0 && 2048 <= KeyCode.KEYCODE_9) ||
        (2048 >= KeyCode.KEYCODE_NUMPAD_0 && 2048 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2048)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2048)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0250 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0251
     * @tc.name      testKeyboardControllerRange0251
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2049.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0251 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2049 >= KeyCode.KEYCODE_0 && 2049 <= KeyCode.KEYCODE_9) ||
        (2049 >= KeyCode.KEYCODE_NUMPAD_0 && 2049 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2049)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2049)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0251 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0252
     * @tc.name      testKeyboardControllerRange0252
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2050.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0252 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2050 >= KeyCode.KEYCODE_0 && 2050 <= KeyCode.KEYCODE_9) ||
        (2050 >= KeyCode.KEYCODE_NUMPAD_0 && 2050 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2050)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2050)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0252 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0253
     * @tc.name      testKeyboardControllerRange0253
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2051.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0253 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2051 >= KeyCode.KEYCODE_0 && 2051 <= KeyCode.KEYCODE_9) ||
        (2051 >= KeyCode.KEYCODE_NUMPAD_0 && 2051 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2051)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2051)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0253 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0254
     * @tc.name      testKeyboardControllerRange0254
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2052.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0254 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2052 >= KeyCode.KEYCODE_0 && 2052 <= KeyCode.KEYCODE_9) ||
        (2052 >= KeyCode.KEYCODE_NUMPAD_0 && 2052 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2052)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2052)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0254 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0255
     * @tc.name      testKeyboardControllerRange0255
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2053.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0255 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2053 >= KeyCode.KEYCODE_0 && 2053 <= KeyCode.KEYCODE_9) ||
        (2053 >= KeyCode.KEYCODE_NUMPAD_0 && 2053 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2053)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2053)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0255 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0256
     * @tc.name      testKeyboardControllerRange0256
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2054.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0256 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2054 >= KeyCode.KEYCODE_0 && 2054 <= KeyCode.KEYCODE_9) ||
        (2054 >= KeyCode.KEYCODE_NUMPAD_0 && 2054 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2054)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2054)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0256 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0257
     * @tc.name      testKeyboardControllerRange0257
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0257 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2055 >= KeyCode.KEYCODE_0 && 2055 <= KeyCode.KEYCODE_9) ||
        (2055 >= KeyCode.KEYCODE_NUMPAD_0 && 2055 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2055)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2055)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0257 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0258
     * @tc.name      testKeyboardControllerRange0258
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2056.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0258 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2056 >= KeyCode.KEYCODE_0 && 2056 <= KeyCode.KEYCODE_9) ||
        (2056 >= KeyCode.KEYCODE_NUMPAD_0 && 2056 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2056)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2056)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0258 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0259
     * @tc.name      testKeyboardControllerRange0259
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2057.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0259 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2057 >= KeyCode.KEYCODE_0 && 2057 <= KeyCode.KEYCODE_9) ||
        (2057 >= KeyCode.KEYCODE_NUMPAD_0 && 2057 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2057)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2057)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0259 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0260
     * @tc.name      testKeyboardControllerRange0260
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2058.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0260 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2058 >= KeyCode.KEYCODE_0 && 2058 <= KeyCode.KEYCODE_9) ||
        (2058 >= KeyCode.KEYCODE_NUMPAD_0 && 2058 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2058)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2058)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0260 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0261
     * @tc.name      testKeyboardControllerRange0261
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2059.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0261 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2059 >= KeyCode.KEYCODE_0 && 2059 <= KeyCode.KEYCODE_9) ||
        (2059 >= KeyCode.KEYCODE_NUMPAD_0 && 2059 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2059)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2059)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0261 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0262
     * @tc.name      testKeyboardControllerRange0262
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2060.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0262 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2060 >= KeyCode.KEYCODE_0 && 2060 <= KeyCode.KEYCODE_9) ||
        (2060 >= KeyCode.KEYCODE_NUMPAD_0 && 2060 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2060)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2060)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0262 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0263
     * @tc.name      testKeyboardControllerRange0263
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2061.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0263 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2061 >= KeyCode.KEYCODE_0 && 2061 <= KeyCode.KEYCODE_9) ||
        (2061 >= KeyCode.KEYCODE_NUMPAD_0 && 2061 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2061)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2061)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0263 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0264
     * @tc.name      testKeyboardControllerRange0264
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2062.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0264 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2062 >= KeyCode.KEYCODE_0 && 2062 <= KeyCode.KEYCODE_9) ||
        (2062 >= KeyCode.KEYCODE_NUMPAD_0 && 2062 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2062)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2062)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0264 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0265
     * @tc.name      testKeyboardControllerRange0265
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2063.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0265 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2063 >= KeyCode.KEYCODE_0 && 2063 <= KeyCode.KEYCODE_9) ||
        (2063 >= KeyCode.KEYCODE_NUMPAD_0 && 2063 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2063)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2063)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0265 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0266
     * @tc.name      testKeyboardControllerRange0266
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2064.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0266 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2064 >= KeyCode.KEYCODE_0 && 2064 <= KeyCode.KEYCODE_9) ||
        (2064 >= KeyCode.KEYCODE_NUMPAD_0 && 2064 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2064)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2064)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0266 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0267
     * @tc.name      testKeyboardControllerRange0267
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2065.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0267 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2065 >= KeyCode.KEYCODE_0 && 2065 <= KeyCode.KEYCODE_9) ||
        (2065 >= KeyCode.KEYCODE_NUMPAD_0 && 2065 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2065)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2065)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0267 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0268
     * @tc.name      testKeyboardControllerRange0268
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2066.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0268 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2066 >= KeyCode.KEYCODE_0 && 2066 <= KeyCode.KEYCODE_9) ||
        (2066 >= KeyCode.KEYCODE_NUMPAD_0 && 2066 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2066)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2066)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0268 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0269
     * @tc.name      testKeyboardControllerRange0269
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2067.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0269 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2067 >= KeyCode.KEYCODE_0 && 2067 <= KeyCode.KEYCODE_9) ||
        (2067 >= KeyCode.KEYCODE_NUMPAD_0 && 2067 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2067)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2067)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0269 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0270
     * @tc.name      testKeyboardControllerRange0270
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2068.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0270 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2068 >= KeyCode.KEYCODE_0 && 2068 <= KeyCode.KEYCODE_9) ||
        (2068 >= KeyCode.KEYCODE_NUMPAD_0 && 2068 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2068)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2068)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0270 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0271
     * @tc.name      testKeyboardControllerRange0271
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2069.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0271 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2069 >= KeyCode.KEYCODE_0 && 2069 <= KeyCode.KEYCODE_9) ||
        (2069 >= KeyCode.KEYCODE_NUMPAD_0 && 2069 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2069)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2069)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0271 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0272
     * @tc.name      testKeyboardControllerRange0272
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2070.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0272 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2070 >= KeyCode.KEYCODE_0 && 2070 <= KeyCode.KEYCODE_9) ||
        (2070 >= KeyCode.KEYCODE_NUMPAD_0 && 2070 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2070)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2070)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0272 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0273
     * @tc.name      testKeyboardControllerRange0273
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2071.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0273 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2071 >= KeyCode.KEYCODE_0 && 2071 <= KeyCode.KEYCODE_9) ||
        (2071 >= KeyCode.KEYCODE_NUMPAD_0 && 2071 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2071)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2071)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0273 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0274
     * @tc.name      testKeyboardControllerRange0274
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2072.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0274 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2072 >= KeyCode.KEYCODE_0 && 2072 <= KeyCode.KEYCODE_9) ||
        (2072 >= KeyCode.KEYCODE_NUMPAD_0 && 2072 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2072)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2072)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0274 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0275
     * @tc.name      testKeyboardControllerRange0275
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2073.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0275 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2073 >= KeyCode.KEYCODE_0 && 2073 <= KeyCode.KEYCODE_9) ||
        (2073 >= KeyCode.KEYCODE_NUMPAD_0 && 2073 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2073)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2073)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0275 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0276
     * @tc.name      testKeyboardControllerRange0276
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2074.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0276 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2074 >= KeyCode.KEYCODE_0 && 2074 <= KeyCode.KEYCODE_9) ||
        (2074 >= KeyCode.KEYCODE_NUMPAD_0 && 2074 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2074)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2074)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0276 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0277
     * @tc.name      testKeyboardControllerRange0277
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2075.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0277 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2075 >= KeyCode.KEYCODE_0 && 2075 <= KeyCode.KEYCODE_9) ||
        (2075 >= KeyCode.KEYCODE_NUMPAD_0 && 2075 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2075)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2075)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0277 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0278
     * @tc.name      testKeyboardControllerRange0278
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2076.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0278 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2076 >= KeyCode.KEYCODE_0 && 2076 <= KeyCode.KEYCODE_9) ||
        (2076 >= KeyCode.KEYCODE_NUMPAD_0 && 2076 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2076)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2076)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0278 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0279
     * @tc.name      testKeyboardControllerRange0279
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2077.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0279 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2077 >= KeyCode.KEYCODE_0 && 2077 <= KeyCode.KEYCODE_9) ||
        (2077 >= KeyCode.KEYCODE_NUMPAD_0 && 2077 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2077)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2077)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0279 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0280
     * @tc.name      testKeyboardControllerRange0280
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2078.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0280 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2078 >= KeyCode.KEYCODE_0 && 2078 <= KeyCode.KEYCODE_9) ||
        (2078 >= KeyCode.KEYCODE_NUMPAD_0 && 2078 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2078)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2078)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0280 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0281
     * @tc.name      testKeyboardControllerRange0281
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2079.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0281 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2079 >= KeyCode.KEYCODE_0 && 2079 <= KeyCode.KEYCODE_9) ||
        (2079 >= KeyCode.KEYCODE_NUMPAD_0 && 2079 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2079)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2079)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0281 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0282
     * @tc.name      testKeyboardControllerRange0282
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0282 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2080 >= KeyCode.KEYCODE_0 && 2080 <= KeyCode.KEYCODE_9) ||
        (2080 >= KeyCode.KEYCODE_NUMPAD_0 && 2080 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2080)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2080)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0282 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0283
     * @tc.name      testKeyboardControllerRange0283
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2081.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0283 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2081 >= KeyCode.KEYCODE_0 && 2081 <= KeyCode.KEYCODE_9) ||
        (2081 >= KeyCode.KEYCODE_NUMPAD_0 && 2081 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2081)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2081)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0283 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0284
     * @tc.name      testKeyboardControllerRange0284
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2082.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0284 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2082 >= KeyCode.KEYCODE_0 && 2082 <= KeyCode.KEYCODE_9) ||
        (2082 >= KeyCode.KEYCODE_NUMPAD_0 && 2082 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2082)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2082)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0284 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0285
     * @tc.name      testKeyboardControllerRange0285
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2083.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0285 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2083 >= KeyCode.KEYCODE_0 && 2083 <= KeyCode.KEYCODE_9) ||
        (2083 >= KeyCode.KEYCODE_NUMPAD_0 && 2083 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2083)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2083)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0285 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0286
     * @tc.name      testKeyboardControllerRange0286
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2084.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0286 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2084 >= KeyCode.KEYCODE_0 && 2084 <= KeyCode.KEYCODE_9) ||
        (2084 >= KeyCode.KEYCODE_NUMPAD_0 && 2084 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2084)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2084)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0286 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0287
     * @tc.name      testKeyboardControllerRange0287
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2085.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0287 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2085 >= KeyCode.KEYCODE_0 && 2085 <= KeyCode.KEYCODE_9) ||
        (2085 >= KeyCode.KEYCODE_NUMPAD_0 && 2085 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2085)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2085)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0287 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0288
     * @tc.name      testKeyboardControllerRange0288
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2086.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0288 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2086 >= KeyCode.KEYCODE_0 && 2086 <= KeyCode.KEYCODE_9) ||
        (2086 >= KeyCode.KEYCODE_NUMPAD_0 && 2086 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2086)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2086)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0288 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0289
     * @tc.name      testKeyboardControllerRange0289
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2087.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0289 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2087 >= KeyCode.KEYCODE_0 && 2087 <= KeyCode.KEYCODE_9) ||
        (2087 >= KeyCode.KEYCODE_NUMPAD_0 && 2087 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2087)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2087)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0289 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0290
     * @tc.name      testKeyboardControllerRange0290
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2088.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0290 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2088 >= KeyCode.KEYCODE_0 && 2088 <= KeyCode.KEYCODE_9) ||
        (2088 >= KeyCode.KEYCODE_NUMPAD_0 && 2088 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2088)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2088)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0290 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0291
     * @tc.name      testKeyboardControllerRange0291
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2089.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0291 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2089 >= KeyCode.KEYCODE_0 && 2089 <= KeyCode.KEYCODE_9) ||
        (2089 >= KeyCode.KEYCODE_NUMPAD_0 && 2089 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2089)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2089)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0291 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0292
     * @tc.name      testKeyboardControllerRange0292
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2090.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0292 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2090 >= KeyCode.KEYCODE_0 && 2090 <= KeyCode.KEYCODE_9) ||
        (2090 >= KeyCode.KEYCODE_NUMPAD_0 && 2090 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2090)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2090)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0292 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0293
     * @tc.name      testKeyboardControllerRange0293
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2091.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0293 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2091 >= KeyCode.KEYCODE_0 && 2091 <= KeyCode.KEYCODE_9) ||
        (2091 >= KeyCode.KEYCODE_NUMPAD_0 && 2091 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2091)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2091)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0293 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0294
     * @tc.name      testKeyboardControllerRange0294
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2092.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0294 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2092 >= KeyCode.KEYCODE_0 && 2092 <= KeyCode.KEYCODE_9) ||
        (2092 >= KeyCode.KEYCODE_NUMPAD_0 && 2092 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2092)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2092)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0294 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0295
     * @tc.name      testKeyboardControllerRange0295
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2093.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0295 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2093 >= KeyCode.KEYCODE_0 && 2093 <= KeyCode.KEYCODE_9) ||
        (2093 >= KeyCode.KEYCODE_NUMPAD_0 && 2093 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2093)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2093)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0295 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0296
     * @tc.name      testKeyboardControllerRange0296
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2094.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0296 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2094 >= KeyCode.KEYCODE_0 && 2094 <= KeyCode.KEYCODE_9) ||
        (2094 >= KeyCode.KEYCODE_NUMPAD_0 && 2094 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2094)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2094)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0296 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0297
     * @tc.name      testKeyboardControllerRange0297
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2095.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0297 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2095 >= KeyCode.KEYCODE_0 && 2095 <= KeyCode.KEYCODE_9) ||
        (2095 >= KeyCode.KEYCODE_NUMPAD_0 && 2095 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2095)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2095)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0297 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0298
     * @tc.name      testKeyboardControllerRange0298
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2096.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0298 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2096 >= KeyCode.KEYCODE_0 && 2096 <= KeyCode.KEYCODE_9) ||
        (2096 >= KeyCode.KEYCODE_NUMPAD_0 && 2096 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2096)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2096)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0298 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0299
     * @tc.name      testKeyboardControllerRange0299
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2097.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0299 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2097 >= KeyCode.KEYCODE_0 && 2097 <= KeyCode.KEYCODE_9) ||
        (2097 >= KeyCode.KEYCODE_NUMPAD_0 && 2097 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2097)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2097)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0299 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0300
     * @tc.name      testKeyboardControllerRange0300
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2098.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0300 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2098 >= KeyCode.KEYCODE_0 && 2098 <= KeyCode.KEYCODE_9) ||
        (2098 >= KeyCode.KEYCODE_NUMPAD_0 && 2098 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2098)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2098)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0300 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0301
     * @tc.name      testKeyboardControllerRange0301
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2099.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0301 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2099 >= KeyCode.KEYCODE_0 && 2099 <= KeyCode.KEYCODE_9) ||
        (2099 >= KeyCode.KEYCODE_NUMPAD_0 && 2099 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2099)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2099)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0301 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0302
     * @tc.name      testKeyboardControllerRange0302
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0302 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2100 >= KeyCode.KEYCODE_0 && 2100 <= KeyCode.KEYCODE_9) ||
        (2100 >= KeyCode.KEYCODE_NUMPAD_0 && 2100 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2100)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2100)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0302 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0303
     * @tc.name      testKeyboardControllerRange0303
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2101.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0303 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2101 >= KeyCode.KEYCODE_0 && 2101 <= KeyCode.KEYCODE_9) ||
        (2101 >= KeyCode.KEYCODE_NUMPAD_0 && 2101 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2101)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2101)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0303 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0304
     * @tc.name      testKeyboardControllerRange0304
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2102.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0304 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2102 >= KeyCode.KEYCODE_0 && 2102 <= KeyCode.KEYCODE_9) ||
        (2102 >= KeyCode.KEYCODE_NUMPAD_0 && 2102 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2102)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2102)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0304 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0305
     * @tc.name      testKeyboardControllerRange0305
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2103.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0305 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2103 >= KeyCode.KEYCODE_0 && 2103 <= KeyCode.KEYCODE_9) ||
        (2103 >= KeyCode.KEYCODE_NUMPAD_0 && 2103 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2103)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2103)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0305 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0306
     * @tc.name      testKeyboardControllerRange0306
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2104.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0306 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2104 >= KeyCode.KEYCODE_0 && 2104 <= KeyCode.KEYCODE_9) ||
        (2104 >= KeyCode.KEYCODE_NUMPAD_0 && 2104 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2104)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2104)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0306 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0307
     * @tc.name      testKeyboardControllerRange0307
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2105.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0307 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2105 >= KeyCode.KEYCODE_0 && 2105 <= KeyCode.KEYCODE_9) ||
        (2105 >= KeyCode.KEYCODE_NUMPAD_0 && 2105 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2105)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2105)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0307 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0308
     * @tc.name      testKeyboardControllerRange0308
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2106.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0308 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2106 >= KeyCode.KEYCODE_0 && 2106 <= KeyCode.KEYCODE_9) ||
        (2106 >= KeyCode.KEYCODE_NUMPAD_0 && 2106 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2106)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2106)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0308 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0309
     * @tc.name      testKeyboardControllerRange0309
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2107.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0309 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2107 >= KeyCode.KEYCODE_0 && 2107 <= KeyCode.KEYCODE_9) ||
        (2107 >= KeyCode.KEYCODE_NUMPAD_0 && 2107 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2107)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2107)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0309 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0310
     * @tc.name      testKeyboardControllerRange0310
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2108.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0310 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2108 >= KeyCode.KEYCODE_0 && 2108 <= KeyCode.KEYCODE_9) ||
        (2108 >= KeyCode.KEYCODE_NUMPAD_0 && 2108 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2108)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2108)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0310 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0311
     * @tc.name      testKeyboardControllerRange0311
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2109.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0311 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2109 >= KeyCode.KEYCODE_0 && 2109 <= KeyCode.KEYCODE_9) ||
        (2109 >= KeyCode.KEYCODE_NUMPAD_0 && 2109 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2109)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2109)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0311 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0312
     * @tc.name      testKeyboardControllerRange0312
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2110.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0312 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2110 >= KeyCode.KEYCODE_0 && 2110 <= KeyCode.KEYCODE_9) ||
        (2110 >= KeyCode.KEYCODE_NUMPAD_0 && 2110 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2110)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2110)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0312 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0313
     * @tc.name      testKeyboardControllerRange0313
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0313 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2111 >= KeyCode.KEYCODE_0 && 2111 <= KeyCode.KEYCODE_9) ||
        (2111 >= KeyCode.KEYCODE_NUMPAD_0 && 2111 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2111)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2111)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0313 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0314
     * @tc.name      testKeyboardControllerRange0314
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2112.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0314 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2112 >= KeyCode.KEYCODE_0 && 2112 <= KeyCode.KEYCODE_9) ||
        (2112 >= KeyCode.KEYCODE_NUMPAD_0 && 2112 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2112)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2112)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0314 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0315
     * @tc.name      testKeyboardControllerRange0315
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2113.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0315 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2113 >= KeyCode.KEYCODE_0 && 2113 <= KeyCode.KEYCODE_9) ||
        (2113 >= KeyCode.KEYCODE_NUMPAD_0 && 2113 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2113)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2113)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0315 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0316
     * @tc.name      testKeyboardControllerRange0316
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2114.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0316 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2114 >= KeyCode.KEYCODE_0 && 2114 <= KeyCode.KEYCODE_9) ||
        (2114 >= KeyCode.KEYCODE_NUMPAD_0 && 2114 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2114)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2114)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0316 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0317
     * @tc.name      testKeyboardControllerRange0317
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2115.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0317 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2115 >= KeyCode.KEYCODE_0 && 2115 <= KeyCode.KEYCODE_9) ||
        (2115 >= KeyCode.KEYCODE_NUMPAD_0 && 2115 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2115)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2115)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0317 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0318
     * @tc.name      testKeyboardControllerRange0318
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2116.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0318 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2116 >= KeyCode.KEYCODE_0 && 2116 <= KeyCode.KEYCODE_9) ||
        (2116 >= KeyCode.KEYCODE_NUMPAD_0 && 2116 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2116)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2116)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0318 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0319
     * @tc.name      testKeyboardControllerRange0319
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2117.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0319 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2117 >= KeyCode.KEYCODE_0 && 2117 <= KeyCode.KEYCODE_9) ||
        (2117 >= KeyCode.KEYCODE_NUMPAD_0 && 2117 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2117)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2117)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0319 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0320
     * @tc.name      testKeyboardControllerRange0320
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2118.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0320 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2118 >= KeyCode.KEYCODE_0 && 2118 <= KeyCode.KEYCODE_9) ||
        (2118 >= KeyCode.KEYCODE_NUMPAD_0 && 2118 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2118)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2118)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0320 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0321
     * @tc.name      testKeyboardControllerRange0321
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2119.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0321 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2119 >= KeyCode.KEYCODE_0 && 2119 <= KeyCode.KEYCODE_9) ||
        (2119 >= KeyCode.KEYCODE_NUMPAD_0 && 2119 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2119)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2119)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0321 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0322
     * @tc.name      testKeyboardControllerRange0322
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0322 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2120 >= KeyCode.KEYCODE_0 && 2120 <= KeyCode.KEYCODE_9) ||
        (2120 >= KeyCode.KEYCODE_NUMPAD_0 && 2120 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2120)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2120)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0322 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0323
     * @tc.name      testKeyboardControllerRange0323
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2121.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0323 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2121 >= KeyCode.KEYCODE_0 && 2121 <= KeyCode.KEYCODE_9) ||
        (2121 >= KeyCode.KEYCODE_NUMPAD_0 && 2121 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2121)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2121)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0323 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0324
     * @tc.name      testKeyboardControllerRange0324
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2122.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0324 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2122 >= KeyCode.KEYCODE_0 && 2122 <= KeyCode.KEYCODE_9) ||
        (2122 >= KeyCode.KEYCODE_NUMPAD_0 && 2122 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2122)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2122)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0324 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0325
     * @tc.name      testKeyboardControllerRange0325
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2123.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0325 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2123 >= KeyCode.KEYCODE_0 && 2123 <= KeyCode.KEYCODE_9) ||
        (2123 >= KeyCode.KEYCODE_NUMPAD_0 && 2123 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2123)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2123)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0325 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0326
     * @tc.name      testKeyboardControllerRange0326
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2124.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0326 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2124 >= KeyCode.KEYCODE_0 && 2124 <= KeyCode.KEYCODE_9) ||
        (2124 >= KeyCode.KEYCODE_NUMPAD_0 && 2124 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2124)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2124)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0326 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0327
     * @tc.name      testKeyboardControllerRange0327
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0327 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2125 >= KeyCode.KEYCODE_0 && 2125 <= KeyCode.KEYCODE_9) ||
        (2125 >= KeyCode.KEYCODE_NUMPAD_0 && 2125 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2125)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2125)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0327 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0328
     * @tc.name      testKeyboardControllerRange0328
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2126.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0328 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2126 >= KeyCode.KEYCODE_0 && 2126 <= KeyCode.KEYCODE_9) ||
        (2126 >= KeyCode.KEYCODE_NUMPAD_0 && 2126 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2126)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2126)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0328 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0329
     * @tc.name      testKeyboardControllerRange0329
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2127.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0329 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2127 >= KeyCode.KEYCODE_0 && 2127 <= KeyCode.KEYCODE_9) ||
        (2127 >= KeyCode.KEYCODE_NUMPAD_0 && 2127 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2127)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2127)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0329 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0330
     * @tc.name      testKeyboardControllerRange0330
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0330 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2128 >= KeyCode.KEYCODE_0 && 2128 <= KeyCode.KEYCODE_9) ||
        (2128 >= KeyCode.KEYCODE_NUMPAD_0 && 2128 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2128)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2128)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0330 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0331
     * @tc.name      testKeyboardControllerRange0331
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2129.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0331 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2129 >= KeyCode.KEYCODE_0 && 2129 <= KeyCode.KEYCODE_9) ||
        (2129 >= KeyCode.KEYCODE_NUMPAD_0 && 2129 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2129)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2129)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0331 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0332
     * @tc.name      testKeyboardControllerRange0332
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2130.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0332 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2130 >= KeyCode.KEYCODE_0 && 2130 <= KeyCode.KEYCODE_9) ||
        (2130 >= KeyCode.KEYCODE_NUMPAD_0 && 2130 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2130)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2130)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0332 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0333
     * @tc.name      testKeyboardControllerRange0333
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2131.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0333 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2131 >= KeyCode.KEYCODE_0 && 2131 <= KeyCode.KEYCODE_9) ||
        (2131 >= KeyCode.KEYCODE_NUMPAD_0 && 2131 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2131)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2131)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0333 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0334
     * @tc.name      testKeyboardControllerRange0334
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2132.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0334 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2132 >= KeyCode.KEYCODE_0 && 2132 <= KeyCode.KEYCODE_9) ||
        (2132 >= KeyCode.KEYCODE_NUMPAD_0 && 2132 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2132)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2132)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0334 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0335
     * @tc.name      testKeyboardControllerRange0335
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2133.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0335 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2133 >= KeyCode.KEYCODE_0 && 2133 <= KeyCode.KEYCODE_9) ||
        (2133 >= KeyCode.KEYCODE_NUMPAD_0 && 2133 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2133)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2133)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0335 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0336
     * @tc.name      testKeyboardControllerRange0336
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2134.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0336 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2134 >= KeyCode.KEYCODE_0 && 2134 <= KeyCode.KEYCODE_9) ||
        (2134 >= KeyCode.KEYCODE_NUMPAD_0 && 2134 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2134)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2134)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0336 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0337
     * @tc.name      testKeyboardControllerRange0337
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0337 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2135 >= KeyCode.KEYCODE_0 && 2135 <= KeyCode.KEYCODE_9) ||
        (2135 >= KeyCode.KEYCODE_NUMPAD_0 && 2135 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2135)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2135)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0337 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0338
     * @tc.name      testKeyboardControllerRange0338
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2136.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0338 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2136 >= KeyCode.KEYCODE_0 && 2136 <= KeyCode.KEYCODE_9) ||
        (2136 >= KeyCode.KEYCODE_NUMPAD_0 && 2136 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2136)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2136)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0338 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0339
     * @tc.name      testKeyboardControllerRange0339
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2137.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0339 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2137 >= KeyCode.KEYCODE_0 && 2137 <= KeyCode.KEYCODE_9) ||
        (2137 >= KeyCode.KEYCODE_NUMPAD_0 && 2137 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2137)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2137)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0339 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0340
     * @tc.name      testKeyboardControllerRange0340
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2138.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0340 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2138 >= KeyCode.KEYCODE_0 && 2138 <= KeyCode.KEYCODE_9) ||
        (2138 >= KeyCode.KEYCODE_NUMPAD_0 && 2138 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2138)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2138)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0340 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0341
     * @tc.name      testKeyboardControllerRange0341
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2139.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0341 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2139 >= KeyCode.KEYCODE_0 && 2139 <= KeyCode.KEYCODE_9) ||
        (2139 >= KeyCode.KEYCODE_NUMPAD_0 && 2139 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2139)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2139)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0341 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0342
     * @tc.name      testKeyboardControllerRange0342
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0342 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2140 >= KeyCode.KEYCODE_0 && 2140 <= KeyCode.KEYCODE_9) ||
        (2140 >= KeyCode.KEYCODE_NUMPAD_0 && 2140 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2140)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2140)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0342 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0343
     * @tc.name      testKeyboardControllerRange0343
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2141.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0343 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2141 >= KeyCode.KEYCODE_0 && 2141 <= KeyCode.KEYCODE_9) ||
        (2141 >= KeyCode.KEYCODE_NUMPAD_0 && 2141 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2141)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2141)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0343 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0344
     * @tc.name      testKeyboardControllerRange0344
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2142.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0344 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2142 >= KeyCode.KEYCODE_0 && 2142 <= KeyCode.KEYCODE_9) ||
        (2142 >= KeyCode.KEYCODE_NUMPAD_0 && 2142 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2142)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2142)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0344 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0345
     * @tc.name      testKeyboardControllerRange0345
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2143.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0345 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2143 >= KeyCode.KEYCODE_0 && 2143 <= KeyCode.KEYCODE_9) ||
        (2143 >= KeyCode.KEYCODE_NUMPAD_0 && 2143 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2143)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2143)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0345 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0346
     * @tc.name      testKeyboardControllerRange0346
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2144.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0346 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2144 >= KeyCode.KEYCODE_0 && 2144 <= KeyCode.KEYCODE_9) ||
        (2144 >= KeyCode.KEYCODE_NUMPAD_0 && 2144 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2144)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2144)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0346 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0347
     * @tc.name      testKeyboardControllerRange0347
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2145.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0347 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2145 >= KeyCode.KEYCODE_0 && 2145 <= KeyCode.KEYCODE_9) ||
        (2145 >= KeyCode.KEYCODE_NUMPAD_0 && 2145 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2145)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2145)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0347 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0348
     * @tc.name      testKeyboardControllerRange0348
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2146.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0348 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2146 >= KeyCode.KEYCODE_0 && 2146 <= KeyCode.KEYCODE_9) ||
        (2146 >= KeyCode.KEYCODE_NUMPAD_0 && 2146 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2146)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2146)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0348 end');
    })
  })
}
