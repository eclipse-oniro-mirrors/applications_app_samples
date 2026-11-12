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

export default function KeyboardControllerRangesExtendedTest(): void {
  describe('KeyboardControllerRangesExtendedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0121
     * @tc.name      testKeyboardControllerRange0121
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2110.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0121 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2110 >= KeyCode.KEYCODE_A && 2110 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2110)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2110)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0122
     * @tc.name      testKeyboardControllerRange0122
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0122 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2111 >= KeyCode.KEYCODE_A && 2111 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2111)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2111)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0123
     * @tc.name      testKeyboardControllerRange0123
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2112.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0123 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2112 >= KeyCode.KEYCODE_A && 2112 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2112)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2112)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0124
     * @tc.name      testKeyboardControllerRange0124
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2113.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0124 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2113 >= KeyCode.KEYCODE_A && 2113 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2113)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2113)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0125
     * @tc.name      testKeyboardControllerRange0125
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2114.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0125 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2114 >= KeyCode.KEYCODE_A && 2114 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2114)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2114)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0126
     * @tc.name      testKeyboardControllerRange0126
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2115.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0126 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2115 >= KeyCode.KEYCODE_A && 2115 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2115)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2115)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0127
     * @tc.name      testKeyboardControllerRange0127
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2116.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0127 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2116 >= KeyCode.KEYCODE_A && 2116 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2116)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2116)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0128
     * @tc.name      testKeyboardControllerRange0128
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2117.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0128 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2117 >= KeyCode.KEYCODE_A && 2117 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2117)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2117)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0128 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0129
     * @tc.name      testKeyboardControllerRange0129
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2118.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0129 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2118 >= KeyCode.KEYCODE_A && 2118 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2118)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2118)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0129 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0130
     * @tc.name      testKeyboardControllerRange0130
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2119.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0130 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2119 >= KeyCode.KEYCODE_A && 2119 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2119)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2119)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0130 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0131
     * @tc.name      testKeyboardControllerRange0131
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0131 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2120 >= KeyCode.KEYCODE_A && 2120 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2120)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2120)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0131 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0132
     * @tc.name      testKeyboardControllerRange0132
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2121.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0132 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2121 >= KeyCode.KEYCODE_A && 2121 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2121)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2121)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0132 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0133
     * @tc.name      testKeyboardControllerRange0133
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2122.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0133 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2122 >= KeyCode.KEYCODE_A && 2122 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2122)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2122)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0133 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0134
     * @tc.name      testKeyboardControllerRange0134
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2123.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0134 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2123 >= KeyCode.KEYCODE_A && 2123 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2123)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2123)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0134 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0135
     * @tc.name      testKeyboardControllerRange0135
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2124.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0135 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2124 >= KeyCode.KEYCODE_A && 2124 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2124)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2124)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0136
     * @tc.name      testKeyboardControllerRange0136
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0136 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2125 >= KeyCode.KEYCODE_A && 2125 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2125)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2125)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0137
     * @tc.name      testKeyboardControllerRange0137
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2126.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0137 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2126 >= KeyCode.KEYCODE_A && 2126 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2126)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2126)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0138
     * @tc.name      testKeyboardControllerRange0138
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2127.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0138 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2127 >= KeyCode.KEYCODE_A && 2127 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2127)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2127)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0139
     * @tc.name      testKeyboardControllerRange0139
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0139 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2128 >= KeyCode.KEYCODE_A && 2128 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2128)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2128)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0140
     * @tc.name      testKeyboardControllerRange0140
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2129.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0140 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2129 >= KeyCode.KEYCODE_A && 2129 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2129)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2129)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0141
     * @tc.name      testKeyboardControllerRange0141
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2130.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0141 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2130 >= KeyCode.KEYCODE_A && 2130 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2130)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2130)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0142
     * @tc.name      testKeyboardControllerRange0142
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2131.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0142 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2131 >= KeyCode.KEYCODE_A && 2131 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2131)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2131)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0143
     * @tc.name      testKeyboardControllerRange0143
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2132.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0143 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2132 >= KeyCode.KEYCODE_A && 2132 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2132)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2132)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0144
     * @tc.name      testKeyboardControllerRange0144
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2133.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0144 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2133 >= KeyCode.KEYCODE_A && 2133 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2133)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2133)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0145
     * @tc.name      testKeyboardControllerRange0145
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2134.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0145 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2134 >= KeyCode.KEYCODE_A && 2134 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2134)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2134)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0146
     * @tc.name      testKeyboardControllerRange0146
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0146 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2135 >= KeyCode.KEYCODE_A && 2135 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2135)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2135)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0147
     * @tc.name      testKeyboardControllerRange0147
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2136.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0147 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2136 >= KeyCode.KEYCODE_A && 2136 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2136)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2136)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0148
     * @tc.name      testKeyboardControllerRange0148
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2137.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0148 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2137 >= KeyCode.KEYCODE_A && 2137 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2137)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2137)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0149
     * @tc.name      testKeyboardControllerRange0149
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2138.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0149 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2138 >= KeyCode.KEYCODE_A && 2138 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2138)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2138)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0150
     * @tc.name      testKeyboardControllerRange0150
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2139.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0150 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2139 >= KeyCode.KEYCODE_A && 2139 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2139)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2139)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0151
     * @tc.name      testKeyboardControllerRange0151
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0151 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2140 >= KeyCode.KEYCODE_A && 2140 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2140)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2140)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0152
     * @tc.name      testKeyboardControllerRange0152
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2141.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0152 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2141 >= KeyCode.KEYCODE_A && 2141 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2141)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2141)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0153
     * @tc.name      testKeyboardControllerRange0153
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2142.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0153 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2142 >= KeyCode.KEYCODE_A && 2142 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2142)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2142)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0154
     * @tc.name      testKeyboardControllerRange0154
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2143.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0154 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2143 >= KeyCode.KEYCODE_A && 2143 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2143)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2143)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0155
     * @tc.name      testKeyboardControllerRange0155
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2144.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0155 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2144 >= KeyCode.KEYCODE_A && 2144 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2144)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2144)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0156
     * @tc.name      testKeyboardControllerRange0156
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2145.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0156 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2145 >= KeyCode.KEYCODE_A && 2145 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2145)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2145)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0157
     * @tc.name      testKeyboardControllerRange0157
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2146.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0157 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2146 >= KeyCode.KEYCODE_A && 2146 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2146)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2146)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0158
     * @tc.name      testKeyboardControllerRange0158
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2147.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0158 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2147 >= KeyCode.KEYCODE_A && 2147 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2147)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2147)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0159
     * @tc.name      testKeyboardControllerRange0159
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0159 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2148 >= KeyCode.KEYCODE_A && 2148 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2148)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2148)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0160
     * @tc.name      testKeyboardControllerRange0160
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2149.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0160 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2149 >= KeyCode.KEYCODE_A && 2149 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2149)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2149)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0161
     * @tc.name      testKeyboardControllerRange0161
     * @tc.desc      isKeyCodeAZ reports the expected boundary result for code 2150.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0161 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = 2150 >= KeyCode.KEYCODE_A && 2150 <= KeyCode.KEYCODE_Z;
      expect(controller.isKeyCodeAZ(2150)).assertEqual(expected);
      expect(typeof controller.isKeyCodeAZ(2150)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0162
     * @tc.name      testKeyboardControllerRange0162
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1960.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0162 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1960 >= KeyCode.KEYCODE_0 && 1960 <= KeyCode.KEYCODE_9) ||
        (1960 >= KeyCode.KEYCODE_NUMPAD_0 && 1960 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1960)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1960)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0163
     * @tc.name      testKeyboardControllerRange0163
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1961.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0163 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1961 >= KeyCode.KEYCODE_0 && 1961 <= KeyCode.KEYCODE_9) ||
        (1961 >= KeyCode.KEYCODE_NUMPAD_0 && 1961 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1961)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1961)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0164
     * @tc.name      testKeyboardControllerRange0164
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1962.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0164 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1962 >= KeyCode.KEYCODE_0 && 1962 <= KeyCode.KEYCODE_9) ||
        (1962 >= KeyCode.KEYCODE_NUMPAD_0 && 1962 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1962)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1962)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0165
     * @tc.name      testKeyboardControllerRange0165
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1963.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0165 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1963 >= KeyCode.KEYCODE_0 && 1963 <= KeyCode.KEYCODE_9) ||
        (1963 >= KeyCode.KEYCODE_NUMPAD_0 && 1963 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1963)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1963)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0166
     * @tc.name      testKeyboardControllerRange0166
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1964.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0166 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1964 >= KeyCode.KEYCODE_0 && 1964 <= KeyCode.KEYCODE_9) ||
        (1964 >= KeyCode.KEYCODE_NUMPAD_0 && 1964 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1964)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1964)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0167
     * @tc.name      testKeyboardControllerRange0167
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1965.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0167 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1965 >= KeyCode.KEYCODE_0 && 1965 <= KeyCode.KEYCODE_9) ||
        (1965 >= KeyCode.KEYCODE_NUMPAD_0 && 1965 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1965)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1965)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0168
     * @tc.name      testKeyboardControllerRange0168
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1966.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0168 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1966 >= KeyCode.KEYCODE_0 && 1966 <= KeyCode.KEYCODE_9) ||
        (1966 >= KeyCode.KEYCODE_NUMPAD_0 && 1966 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1966)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1966)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0169
     * @tc.name      testKeyboardControllerRange0169
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1967.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0169 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1967 >= KeyCode.KEYCODE_0 && 1967 <= KeyCode.KEYCODE_9) ||
        (1967 >= KeyCode.KEYCODE_NUMPAD_0 && 1967 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1967)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1967)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0170
     * @tc.name      testKeyboardControllerRange0170
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1968.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0170 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1968 >= KeyCode.KEYCODE_0 && 1968 <= KeyCode.KEYCODE_9) ||
        (1968 >= KeyCode.KEYCODE_NUMPAD_0 && 1968 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1968)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1968)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0171
     * @tc.name      testKeyboardControllerRange0171
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1969.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0171 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1969 >= KeyCode.KEYCODE_0 && 1969 <= KeyCode.KEYCODE_9) ||
        (1969 >= KeyCode.KEYCODE_NUMPAD_0 && 1969 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1969)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1969)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0172
     * @tc.name      testKeyboardControllerRange0172
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1970.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0172 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1970 >= KeyCode.KEYCODE_0 && 1970 <= KeyCode.KEYCODE_9) ||
        (1970 >= KeyCode.KEYCODE_NUMPAD_0 && 1970 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1970)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1970)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0173
     * @tc.name      testKeyboardControllerRange0173
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1971.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0173 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1971 >= KeyCode.KEYCODE_0 && 1971 <= KeyCode.KEYCODE_9) ||
        (1971 >= KeyCode.KEYCODE_NUMPAD_0 && 1971 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1971)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1971)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0174
     * @tc.name      testKeyboardControllerRange0174
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1972.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0174 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1972 >= KeyCode.KEYCODE_0 && 1972 <= KeyCode.KEYCODE_9) ||
        (1972 >= KeyCode.KEYCODE_NUMPAD_0 && 1972 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1972)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1972)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0175
     * @tc.name      testKeyboardControllerRange0175
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1973.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0175 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1973 >= KeyCode.KEYCODE_0 && 1973 <= KeyCode.KEYCODE_9) ||
        (1973 >= KeyCode.KEYCODE_NUMPAD_0 && 1973 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1973)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1973)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0176
     * @tc.name      testKeyboardControllerRange0176
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1974.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0176 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1974 >= KeyCode.KEYCODE_0 && 1974 <= KeyCode.KEYCODE_9) ||
        (1974 >= KeyCode.KEYCODE_NUMPAD_0 && 1974 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1974)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1974)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0177
     * @tc.name      testKeyboardControllerRange0177
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1975.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0177 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1975 >= KeyCode.KEYCODE_0 && 1975 <= KeyCode.KEYCODE_9) ||
        (1975 >= KeyCode.KEYCODE_NUMPAD_0 && 1975 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1975)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1975)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0178
     * @tc.name      testKeyboardControllerRange0178
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1976.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0178 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1976 >= KeyCode.KEYCODE_0 && 1976 <= KeyCode.KEYCODE_9) ||
        (1976 >= KeyCode.KEYCODE_NUMPAD_0 && 1976 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1976)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1976)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0179
     * @tc.name      testKeyboardControllerRange0179
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1977.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0179 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1977 >= KeyCode.KEYCODE_0 && 1977 <= KeyCode.KEYCODE_9) ||
        (1977 >= KeyCode.KEYCODE_NUMPAD_0 && 1977 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1977)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1977)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0180
     * @tc.name      testKeyboardControllerRange0180
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1978.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0180 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1978 >= KeyCode.KEYCODE_0 && 1978 <= KeyCode.KEYCODE_9) ||
        (1978 >= KeyCode.KEYCODE_NUMPAD_0 && 1978 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1978)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1978)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0181
     * @tc.name      testKeyboardControllerRange0181
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1979.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0181 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1979 >= KeyCode.KEYCODE_0 && 1979 <= KeyCode.KEYCODE_9) ||
        (1979 >= KeyCode.KEYCODE_NUMPAD_0 && 1979 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1979)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1979)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0182
     * @tc.name      testKeyboardControllerRange0182
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1980.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0182 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1980 >= KeyCode.KEYCODE_0 && 1980 <= KeyCode.KEYCODE_9) ||
        (1980 >= KeyCode.KEYCODE_NUMPAD_0 && 1980 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1980)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1980)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0183
     * @tc.name      testKeyboardControllerRange0183
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1981.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0183 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1981 >= KeyCode.KEYCODE_0 && 1981 <= KeyCode.KEYCODE_9) ||
        (1981 >= KeyCode.KEYCODE_NUMPAD_0 && 1981 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1981)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1981)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0184
     * @tc.name      testKeyboardControllerRange0184
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1982.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0184 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1982 >= KeyCode.KEYCODE_0 && 1982 <= KeyCode.KEYCODE_9) ||
        (1982 >= KeyCode.KEYCODE_NUMPAD_0 && 1982 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1982)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1982)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0185
     * @tc.name      testKeyboardControllerRange0185
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1983.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0185 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1983 >= KeyCode.KEYCODE_0 && 1983 <= KeyCode.KEYCODE_9) ||
        (1983 >= KeyCode.KEYCODE_NUMPAD_0 && 1983 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1983)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1983)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0186
     * @tc.name      testKeyboardControllerRange0186
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1984.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0186 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1984 >= KeyCode.KEYCODE_0 && 1984 <= KeyCode.KEYCODE_9) ||
        (1984 >= KeyCode.KEYCODE_NUMPAD_0 && 1984 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1984)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1984)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0187
     * @tc.name      testKeyboardControllerRange0187
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1985.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0187 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1985 >= KeyCode.KEYCODE_0 && 1985 <= KeyCode.KEYCODE_9) ||
        (1985 >= KeyCode.KEYCODE_NUMPAD_0 && 1985 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1985)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1985)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0188
     * @tc.name      testKeyboardControllerRange0188
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1986.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0188 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1986 >= KeyCode.KEYCODE_0 && 1986 <= KeyCode.KEYCODE_9) ||
        (1986 >= KeyCode.KEYCODE_NUMPAD_0 && 1986 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1986)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1986)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0189
     * @tc.name      testKeyboardControllerRange0189
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1987.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0189 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1987 >= KeyCode.KEYCODE_0 && 1987 <= KeyCode.KEYCODE_9) ||
        (1987 >= KeyCode.KEYCODE_NUMPAD_0 && 1987 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1987)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1987)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0190
     * @tc.name      testKeyboardControllerRange0190
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1988.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0190 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1988 >= KeyCode.KEYCODE_0 && 1988 <= KeyCode.KEYCODE_9) ||
        (1988 >= KeyCode.KEYCODE_NUMPAD_0 && 1988 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1988)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1988)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0191
     * @tc.name      testKeyboardControllerRange0191
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1989.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0191 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1989 >= KeyCode.KEYCODE_0 && 1989 <= KeyCode.KEYCODE_9) ||
        (1989 >= KeyCode.KEYCODE_NUMPAD_0 && 1989 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1989)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1989)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0192
     * @tc.name      testKeyboardControllerRange0192
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1990.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0192 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1990 >= KeyCode.KEYCODE_0 && 1990 <= KeyCode.KEYCODE_9) ||
        (1990 >= KeyCode.KEYCODE_NUMPAD_0 && 1990 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1990)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1990)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0193
     * @tc.name      testKeyboardControllerRange0193
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1991.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0193 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1991 >= KeyCode.KEYCODE_0 && 1991 <= KeyCode.KEYCODE_9) ||
        (1991 >= KeyCode.KEYCODE_NUMPAD_0 && 1991 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1991)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1991)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0194
     * @tc.name      testKeyboardControllerRange0194
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1992.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0194 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1992 >= KeyCode.KEYCODE_0 && 1992 <= KeyCode.KEYCODE_9) ||
        (1992 >= KeyCode.KEYCODE_NUMPAD_0 && 1992 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1992)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1992)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0195
     * @tc.name      testKeyboardControllerRange0195
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1993.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0195 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1993 >= KeyCode.KEYCODE_0 && 1993 <= KeyCode.KEYCODE_9) ||
        (1993 >= KeyCode.KEYCODE_NUMPAD_0 && 1993 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1993)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1993)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0196
     * @tc.name      testKeyboardControllerRange0196
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1994.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0196 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1994 >= KeyCode.KEYCODE_0 && 1994 <= KeyCode.KEYCODE_9) ||
        (1994 >= KeyCode.KEYCODE_NUMPAD_0 && 1994 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1994)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1994)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0197
     * @tc.name      testKeyboardControllerRange0197
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1995.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0197 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1995 >= KeyCode.KEYCODE_0 && 1995 <= KeyCode.KEYCODE_9) ||
        (1995 >= KeyCode.KEYCODE_NUMPAD_0 && 1995 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1995)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1995)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0198
     * @tc.name      testKeyboardControllerRange0198
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1996.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0198 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1996 >= KeyCode.KEYCODE_0 && 1996 <= KeyCode.KEYCODE_9) ||
        (1996 >= KeyCode.KEYCODE_NUMPAD_0 && 1996 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1996)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1996)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0199
     * @tc.name      testKeyboardControllerRange0199
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1997.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0199 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1997 >= KeyCode.KEYCODE_0 && 1997 <= KeyCode.KEYCODE_9) ||
        (1997 >= KeyCode.KEYCODE_NUMPAD_0 && 1997 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1997)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1997)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0200
     * @tc.name      testKeyboardControllerRange0200
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1998.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0200 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1998 >= KeyCode.KEYCODE_0 && 1998 <= KeyCode.KEYCODE_9) ||
        (1998 >= KeyCode.KEYCODE_NUMPAD_0 && 1998 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1998)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1998)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0201
     * @tc.name      testKeyboardControllerRange0201
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 1999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0201 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (1999 >= KeyCode.KEYCODE_0 && 1999 <= KeyCode.KEYCODE_9) ||
        (1999 >= KeyCode.KEYCODE_NUMPAD_0 && 1999 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(1999)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(1999)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0202
     * @tc.name      testKeyboardControllerRange0202
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0202 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2000 >= KeyCode.KEYCODE_0 && 2000 <= KeyCode.KEYCODE_9) ||
        (2000 >= KeyCode.KEYCODE_NUMPAD_0 && 2000 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2000)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2000)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0203
     * @tc.name      testKeyboardControllerRange0203
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0203 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2001 >= KeyCode.KEYCODE_0 && 2001 <= KeyCode.KEYCODE_9) ||
        (2001 >= KeyCode.KEYCODE_NUMPAD_0 && 2001 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2001)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2001)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0204
     * @tc.name      testKeyboardControllerRange0204
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0204 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2002 >= KeyCode.KEYCODE_0 && 2002 <= KeyCode.KEYCODE_9) ||
        (2002 >= KeyCode.KEYCODE_NUMPAD_0 && 2002 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2002)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2002)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0205
     * @tc.name      testKeyboardControllerRange0205
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0205 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2003 >= KeyCode.KEYCODE_0 && 2003 <= KeyCode.KEYCODE_9) ||
        (2003 >= KeyCode.KEYCODE_NUMPAD_0 && 2003 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2003)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2003)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0205 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0206
     * @tc.name      testKeyboardControllerRange0206
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2004.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0206 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2004 >= KeyCode.KEYCODE_0 && 2004 <= KeyCode.KEYCODE_9) ||
        (2004 >= KeyCode.KEYCODE_NUMPAD_0 && 2004 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2004)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2004)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0207
     * @tc.name      testKeyboardControllerRange0207
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0207 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2005 >= KeyCode.KEYCODE_0 && 2005 <= KeyCode.KEYCODE_9) ||
        (2005 >= KeyCode.KEYCODE_NUMPAD_0 && 2005 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2005)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2005)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0208
     * @tc.name      testKeyboardControllerRange0208
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0208 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2006 >= KeyCode.KEYCODE_0 && 2006 <= KeyCode.KEYCODE_9) ||
        (2006 >= KeyCode.KEYCODE_NUMPAD_0 && 2006 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2006)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2006)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0209
     * @tc.name      testKeyboardControllerRange0209
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0209 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2007 >= KeyCode.KEYCODE_0 && 2007 <= KeyCode.KEYCODE_9) ||
        (2007 >= KeyCode.KEYCODE_NUMPAD_0 && 2007 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2007)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2007)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0210
     * @tc.name      testKeyboardControllerRange0210
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0210 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2008 >= KeyCode.KEYCODE_0 && 2008 <= KeyCode.KEYCODE_9) ||
        (2008 >= KeyCode.KEYCODE_NUMPAD_0 && 2008 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2008)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2008)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0211
     * @tc.name      testKeyboardControllerRange0211
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0211 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2009 >= KeyCode.KEYCODE_0 && 2009 <= KeyCode.KEYCODE_9) ||
        (2009 >= KeyCode.KEYCODE_NUMPAD_0 && 2009 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2009)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2009)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0211 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0212
     * @tc.name      testKeyboardControllerRange0212
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2010.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0212 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2010 >= KeyCode.KEYCODE_0 && 2010 <= KeyCode.KEYCODE_9) ||
        (2010 >= KeyCode.KEYCODE_NUMPAD_0 && 2010 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2010)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2010)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0212 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0213
     * @tc.name      testKeyboardControllerRange0213
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2011.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0213 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2011 >= KeyCode.KEYCODE_0 && 2011 <= KeyCode.KEYCODE_9) ||
        (2011 >= KeyCode.KEYCODE_NUMPAD_0 && 2011 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2011)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2011)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0213 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0214
     * @tc.name      testKeyboardControllerRange0214
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0214 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2012 >= KeyCode.KEYCODE_0 && 2012 <= KeyCode.KEYCODE_9) ||
        (2012 >= KeyCode.KEYCODE_NUMPAD_0 && 2012 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2012)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2012)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0214 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0215
     * @tc.name      testKeyboardControllerRange0215
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0215 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2013 >= KeyCode.KEYCODE_0 && 2013 <= KeyCode.KEYCODE_9) ||
        (2013 >= KeyCode.KEYCODE_NUMPAD_0 && 2013 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2013)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2013)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0215 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0216
     * @tc.name      testKeyboardControllerRange0216
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0216 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2014 >= KeyCode.KEYCODE_0 && 2014 <= KeyCode.KEYCODE_9) ||
        (2014 >= KeyCode.KEYCODE_NUMPAD_0 && 2014 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2014)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2014)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0216 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0217
     * @tc.name      testKeyboardControllerRange0217
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0217 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2015 >= KeyCode.KEYCODE_0 && 2015 <= KeyCode.KEYCODE_9) ||
        (2015 >= KeyCode.KEYCODE_NUMPAD_0 && 2015 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2015)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2015)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0217 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0218
     * @tc.name      testKeyboardControllerRange0218
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0218 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2016 >= KeyCode.KEYCODE_0 && 2016 <= KeyCode.KEYCODE_9) ||
        (2016 >= KeyCode.KEYCODE_NUMPAD_0 && 2016 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2016)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2016)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0218 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0219
     * @tc.name      testKeyboardControllerRange0219
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0219 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2017 >= KeyCode.KEYCODE_0 && 2017 <= KeyCode.KEYCODE_9) ||
        (2017 >= KeyCode.KEYCODE_NUMPAD_0 && 2017 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2017)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2017)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0219 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0220
     * @tc.name      testKeyboardControllerRange0220
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0220 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2018 >= KeyCode.KEYCODE_0 && 2018 <= KeyCode.KEYCODE_9) ||
        (2018 >= KeyCode.KEYCODE_NUMPAD_0 && 2018 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2018)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2018)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0220 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0221
     * @tc.name      testKeyboardControllerRange0221
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0221 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2019 >= KeyCode.KEYCODE_0 && 2019 <= KeyCode.KEYCODE_9) ||
        (2019 >= KeyCode.KEYCODE_NUMPAD_0 && 2019 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2019)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2019)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0221 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0222
     * @tc.name      testKeyboardControllerRange0222
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0222 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2020 >= KeyCode.KEYCODE_0 && 2020 <= KeyCode.KEYCODE_9) ||
        (2020 >= KeyCode.KEYCODE_NUMPAD_0 && 2020 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2020)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2020)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0222 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0223
     * @tc.name      testKeyboardControllerRange0223
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2021.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0223 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2021 >= KeyCode.KEYCODE_0 && 2021 <= KeyCode.KEYCODE_9) ||
        (2021 >= KeyCode.KEYCODE_NUMPAD_0 && 2021 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2021)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2021)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0223 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0224
     * @tc.name      testKeyboardControllerRange0224
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2022.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0224 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2022 >= KeyCode.KEYCODE_0 && 2022 <= KeyCode.KEYCODE_9) ||
        (2022 >= KeyCode.KEYCODE_NUMPAD_0 && 2022 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2022)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2022)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0224 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0225
     * @tc.name      testKeyboardControllerRange0225
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0225 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2023 >= KeyCode.KEYCODE_0 && 2023 <= KeyCode.KEYCODE_9) ||
        (2023 >= KeyCode.KEYCODE_NUMPAD_0 && 2023 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2023)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2023)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0225 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0226
     * @tc.name      testKeyboardControllerRange0226
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0226 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2024 >= KeyCode.KEYCODE_0 && 2024 <= KeyCode.KEYCODE_9) ||
        (2024 >= KeyCode.KEYCODE_NUMPAD_0 && 2024 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2024)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2024)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0226 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0227
     * @tc.name      testKeyboardControllerRange0227
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2025.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0227 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2025 >= KeyCode.KEYCODE_0 && 2025 <= KeyCode.KEYCODE_9) ||
        (2025 >= KeyCode.KEYCODE_NUMPAD_0 && 2025 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2025)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2025)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0227 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0228
     * @tc.name      testKeyboardControllerRange0228
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0228 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2026 >= KeyCode.KEYCODE_0 && 2026 <= KeyCode.KEYCODE_9) ||
        (2026 >= KeyCode.KEYCODE_NUMPAD_0 && 2026 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2026)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2026)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0228 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0229
     * @tc.name      testKeyboardControllerRange0229
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2027.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0229 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2027 >= KeyCode.KEYCODE_0 && 2027 <= KeyCode.KEYCODE_9) ||
        (2027 >= KeyCode.KEYCODE_NUMPAD_0 && 2027 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2027)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2027)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0229 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0230
     * @tc.name      testKeyboardControllerRange0230
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2028.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0230 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2028 >= KeyCode.KEYCODE_0 && 2028 <= KeyCode.KEYCODE_9) ||
        (2028 >= KeyCode.KEYCODE_NUMPAD_0 && 2028 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2028)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2028)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0230 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0231
     * @tc.name      testKeyboardControllerRange0231
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2029.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0231 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2029 >= KeyCode.KEYCODE_0 && 2029 <= KeyCode.KEYCODE_9) ||
        (2029 >= KeyCode.KEYCODE_NUMPAD_0 && 2029 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2029)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2029)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0231 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0232
     * @tc.name      testKeyboardControllerRange0232
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2030.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0232 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2030 >= KeyCode.KEYCODE_0 && 2030 <= KeyCode.KEYCODE_9) ||
        (2030 >= KeyCode.KEYCODE_NUMPAD_0 && 2030 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2030)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2030)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0232 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0233
     * @tc.name      testKeyboardControllerRange0233
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2031.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0233 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2031 >= KeyCode.KEYCODE_0 && 2031 <= KeyCode.KEYCODE_9) ||
        (2031 >= KeyCode.KEYCODE_NUMPAD_0 && 2031 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2031)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2031)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0233 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0234
     * @tc.name      testKeyboardControllerRange0234
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0234 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2032 >= KeyCode.KEYCODE_0 && 2032 <= KeyCode.KEYCODE_9) ||
        (2032 >= KeyCode.KEYCODE_NUMPAD_0 && 2032 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2032)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2032)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0234 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYCTRL_0235
     * @tc.name      testKeyboardControllerRange0235
     * @tc.desc      isKeyCodeNumber reports the expected boundary result for code 2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerRange0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0235 begin');
      const controller: KeyboardController = new KeyboardController();
      const expected: boolean = (2033 >= KeyCode.KEYCODE_0 && 2033 <= KeyCode.KEYCODE_9) ||
        (2033 >= KeyCode.KEYCODE_NUMPAD_0 && 2033 <= KeyCode.KEYCODE_NUMPAD_9);
      expect(controller.isKeyCodeNumber(2033)).assertEqual(expected);
      expect(typeof controller.isKeyCodeNumber(2033)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerRange0235 end');
    })
  })
}
