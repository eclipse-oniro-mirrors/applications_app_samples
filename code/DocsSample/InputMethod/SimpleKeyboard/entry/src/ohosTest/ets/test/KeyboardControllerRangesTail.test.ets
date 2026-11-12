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

export default function KeyboardControllerRangesTailTest(): void {
  describe('KeyboardControllerRangesTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0349
     * @tc.name      testKeyboardControllerRange0349
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2147.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0349 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2147 >= KeyCode.KEYCODE_0 && 2147 <= KeyCode.KEYCODE_9) ||
        (2147 >= KeyCode.KEYCODE_NUMPAD_0 && 2147 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2147)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2147)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0349 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0350
     * @tc.name      testKeyboardControllerRange0350
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0350 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2148 >= KeyCode.KEYCODE_0 && 2148 <= KeyCode.KEYCODE_9) ||
        (2148 >= KeyCode.KEYCODE_NUMPAD_0 && 2148 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2148)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2148)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0350 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0351
     * @tc.name      testKeyboardControllerRange0351
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2149.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0351 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2149 >= KeyCode.KEYCODE_0 && 2149 <= KeyCode.KEYCODE_9) ||
        (2149 >= KeyCode.KEYCODE_NUMPAD_0 && 2149 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2149)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2149)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0351 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0352
     * @tc.name      testKeyboardControllerRange0352
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2150.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0352 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2150 >= KeyCode.KEYCODE_0 && 2150 <= KeyCode.KEYCODE_9) ||
        (2150 >= KeyCode.KEYCODE_NUMPAD_0 && 2150 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2150)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2150)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0352 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0353
     * @tc.name      testKeyboardControllerRange0353
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2151.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0353 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2151 >= KeyCode.KEYCODE_0 && 2151 <= KeyCode.KEYCODE_9) ||
        (2151 >= KeyCode.KEYCODE_NUMPAD_0 && 2151 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2151)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2151)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0353 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0354
     * @tc.name      testKeyboardControllerRange0354
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2152.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0354 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2152 >= KeyCode.KEYCODE_0 && 2152 <= KeyCode.KEYCODE_9) ||
        (2152 >= KeyCode.KEYCODE_NUMPAD_0 && 2152 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2152)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2152)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0354 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0355
     * @tc.name      testKeyboardControllerRange0355
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2153.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0355 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2153 >= KeyCode.KEYCODE_0 && 2153 <= KeyCode.KEYCODE_9) ||
        (2153 >= KeyCode.KEYCODE_NUMPAD_0 && 2153 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2153)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2153)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0355 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0356
     * @tc.name      testKeyboardControllerRange0356
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2154.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0356 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2154 >= KeyCode.KEYCODE_0 && 2154 <= KeyCode.KEYCODE_9) ||
        (2154 >= KeyCode.KEYCODE_NUMPAD_0 && 2154 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2154)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2154)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0356 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0357
     * @tc.name      testKeyboardControllerRange0357
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2155.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0357 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2155 >= KeyCode.KEYCODE_0 && 2155 <= KeyCode.KEYCODE_9) ||
        (2155 >= KeyCode.KEYCODE_NUMPAD_0 && 2155 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2155)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2155)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0357 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0358
     * @tc.name      testKeyboardControllerRange0358
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2156.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0358 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2156 >= KeyCode.KEYCODE_0 && 2156 <= KeyCode.KEYCODE_9) ||
        (2156 >= KeyCode.KEYCODE_NUMPAD_0 && 2156 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2156)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2156)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0358 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0359
     * @tc.name      testKeyboardControllerRange0359
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2157.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0359 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2157 >= KeyCode.KEYCODE_0 && 2157 <= KeyCode.KEYCODE_9) ||
        (2157 >= KeyCode.KEYCODE_NUMPAD_0 && 2157 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2157)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2157)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0359 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0360
     * @tc.name      testKeyboardControllerRange0360
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2158.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0360 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2158 >= KeyCode.KEYCODE_0 && 2158 <= KeyCode.KEYCODE_9) ||
        (2158 >= KeyCode.KEYCODE_NUMPAD_0 && 2158 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2158)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2158)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0360 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0361
     * @tc.name      testKeyboardControllerRange0361
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2159.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0361 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2159 >= KeyCode.KEYCODE_0 && 2159 <= KeyCode.KEYCODE_9) ||
        (2159 >= KeyCode.KEYCODE_NUMPAD_0 && 2159 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2159)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2159)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0361 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0362
     * @tc.name      testKeyboardControllerRange0362
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2160.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0362 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2160 >= KeyCode.KEYCODE_0 && 2160 <= KeyCode.KEYCODE_9) ||
        (2160 >= KeyCode.KEYCODE_NUMPAD_0 && 2160 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2160)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2160)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0362 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0363
     * @tc.name      testKeyboardControllerRange0363
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0363 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 0;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0363 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0364
     * @tc.name      testKeyboardControllerRange0364
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0364 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 1;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0364 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0365
     * @tc.name      testKeyboardControllerRange0365
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0365 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 2;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0365 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0366
     * @tc.name      testKeyboardControllerRange0366
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0366 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 3;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0366 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0367
     * @tc.name      testKeyboardControllerRange0367
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0367 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 4;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0367 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0368
     * @tc.name      testKeyboardControllerRange0368
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0368 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 5;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0368 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0369
     * @tc.name      testKeyboardControllerRange0369
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0369 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 6;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0369 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0370
     * @tc.name      testKeyboardControllerRange0370
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0370 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 7;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0370 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0371
     * @tc.name      testKeyboardControllerRange0371
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0371 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 8;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0371 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0372
     * @tc.name      testKeyboardControllerRange0372
     * @tc.desc      isKeyCodeNumber accepts keypad digit index 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0372 begin');
      const controller: KeyboardController = new KeyboardController();
      const code: number = KeyCode.KEYCODE_NUMPAD_0 + 9;
      expect(controller.isKeyCodeNumber(code)).assertTrue();
      expect(code >= KeyCode.KEYCODE_NUMPAD_0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0372 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0373
     * @tc.name      testKeyboardControllerRange0373
     * @tc.desc      isKeyCodeAZ rejects out-of-range code -1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0373 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.isKeyCodeAZ(-1000)).assertFalse();
      expect(controller.isKeyCodeNumber(-1000)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0373 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0374
     * @tc.name      testKeyboardControllerRange0374
     * @tc.desc      isKeyCodeAZ rejects out-of-range code -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0374 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.isKeyCodeAZ(-1)).assertFalse();
      expect(controller.isKeyCodeNumber(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0374 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0375
     * @tc.name      testKeyboardControllerRange0375
     * @tc.desc      isKeyCodeAZ rejects out-of-range code 10000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0375 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.isKeyCodeAZ(10000)).assertFalse();
      expect(controller.isKeyCodeNumber(10000)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0375 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0376
     * @tc.name      testKeyboardControllerRange0376
     * @tc.desc      isKeyCodeAZ rejects out-of-range code 65535.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0376 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.isKeyCodeAZ(65535)).assertFalse();
      expect(controller.isKeyCodeNumber(65535)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0376 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0377
     * @tc.name      testKeyboardControllerRange0377
     * @tc.desc      isKeyCodeAZ rejects out-of-range code 999999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0377 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.isKeyCodeAZ(999999)).assertFalse();
      expect(controller.isKeyCodeNumber(999999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0377 end');
    })
  })
}
