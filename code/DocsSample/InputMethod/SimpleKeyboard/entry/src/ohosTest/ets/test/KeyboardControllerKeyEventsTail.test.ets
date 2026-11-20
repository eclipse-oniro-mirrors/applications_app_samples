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
import { KeyboardController } from '../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyboardControllerKeyEvents]';

export default function KeyboardControllerKeyEventsTailTest(): void {
  describe('KeyboardControllerKeyEventsTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0107
     * @tc.name      testKeyboardControllerKeyEvent0107
     * @tc.desc      onKeyDown for code 2106 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0107 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2106, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2106, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0108
     * @tc.name      testKeyboardControllerKeyEvent0108
     * @tc.desc      onKeyDown for code 2107 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0108 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2107, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2107, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0109
     * @tc.name      testKeyboardControllerKeyEvent0109
     * @tc.desc      onKeyDown for code 2108 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0109 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2108, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2108, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0110
     * @tc.name      testKeyboardControllerKeyEvent0110
     * @tc.desc      onKeyDown for code 2109 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0110 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2109, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2109, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0111
     * @tc.name      testKeyboardControllerKeyEvent0111
     * @tc.desc      onKeyDown for code 2110 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0111 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2110, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2110, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0112
     * @tc.name      testKeyboardControllerKeyEvent0112
     * @tc.desc      onKeyDown for code 2111 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0112 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2111, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2111, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0113
     * @tc.name      testKeyboardControllerKeyEvent0113
     * @tc.desc      onKeyDown for code 2112 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0113 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2112, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2112, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0114
     * @tc.name      testKeyboardControllerKeyEvent0114
     * @tc.desc      onKeyDown for code 2113 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0114 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2113, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2113, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0115
     * @tc.name      testKeyboardControllerKeyEvent0115
     * @tc.desc      onKeyDown for code 2114 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0115 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2114, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2114, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0116
     * @tc.name      testKeyboardControllerKeyEvent0116
     * @tc.desc      onKeyDown for code 2115 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0116 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2115, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2115, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0117
     * @tc.name      testKeyboardControllerKeyEvent0117
     * @tc.desc      onKeyDown for code 2116 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0117 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2116, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2116, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0118
     * @tc.name      testKeyboardControllerKeyEvent0118
     * @tc.desc      onKeyDown for code 2117 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0118 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2117, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2117, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0119
     * @tc.name      testKeyboardControllerKeyEvent0119
     * @tc.desc      onKeyDown for code 2118 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0119 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2118, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2118, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0120
     * @tc.name      testKeyboardControllerKeyEvent0120
     * @tc.desc      onKeyDown for code 2119 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0120 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2119, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2119, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0121
     * @tc.name      testKeyboardControllerKeyEvent0121
     * @tc.desc      onKeyDown for code 2120 returns false and the paired onKeyUp returns false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0121 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2120, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2120, keyAction: 0 });
      expect(downResult).assertEqual(false);
      expect(upResult).assertEqual(false);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0122
     * @tc.name      testKeyboardControllerKeyEvent0122
     * @tc.desc      onKeyDown for code 2121 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0122 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2121, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2121, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYEVENT_0123
     * @tc.name      testKeyboardControllerKeyEvent0123
     * @tc.desc      onKeyDown for code 2122 returns true and the paired onKeyUp returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerKeyEvent0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0123 begin');
      const controller: KeyboardController = new KeyboardController();
      const downResult: boolean = controller.onKeyDown({ keyCode: 2122, keyAction: 0 });
      const upResult: boolean = controller.onKeyUp({ keyCode: 2122, keyAction: 0 });
      expect(downResult).assertEqual(true);
      expect(upResult).assertEqual(true);
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerKeyEvent0123 end');
    })
  })
}
