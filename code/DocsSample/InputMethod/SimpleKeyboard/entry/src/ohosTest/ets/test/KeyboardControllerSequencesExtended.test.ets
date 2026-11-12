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
const TAG: string = '[Sample_KeyboardControllerSequences]';

export default function KeyboardControllerSequencesExtendedTest(): void {
  describe('KeyboardControllerSequencesExtendedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0114
     * @tc.name      testKeyboardControllerSequence0114
     * @tc.desc      Unknown key code 40 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0114 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 40, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 40, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 40, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0115
     * @tc.name      testKeyboardControllerSequence0115
     * @tc.desc      Unknown key code 41 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0115 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 41, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 41, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 41, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0116
     * @tc.name      testKeyboardControllerSequence0116
     * @tc.desc      Unknown key code 42 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0116 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 42, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 42, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 42, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0117
     * @tc.name      testKeyboardControllerSequence0117
     * @tc.desc      Unknown key code 43 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0117 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 43, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 43, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 43, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0118
     * @tc.name      testKeyboardControllerSequence0118
     * @tc.desc      Unknown key code 44 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0118 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 44, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 44, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 44, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0119
     * @tc.name      testKeyboardControllerSequence0119
     * @tc.desc      Unknown key code 45 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0119 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 45, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 45, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 45, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0120
     * @tc.name      testKeyboardControllerSequence0120
     * @tc.desc      Unknown key code 46 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0120 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 46, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 46, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 46, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0121
     * @tc.name      testKeyboardControllerSequence0121
     * @tc.desc      Unknown key code 47 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0121 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 47, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 47, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 47, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0122
     * @tc.name      testKeyboardControllerSequence0122
     * @tc.desc      Unknown key code 48 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0122 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 48, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 48, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 48, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0123
     * @tc.name      testKeyboardControllerSequence0123
     * @tc.desc      Unknown key code 49 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0123 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 49, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 49, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 49, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0124
     * @tc.name      testKeyboardControllerSequence0124
     * @tc.desc      Unknown key code 50 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0124 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 50, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 50, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 50, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0125
     * @tc.name      testKeyboardControllerSequence0125
     * @tc.desc      Unknown key code 51 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0125 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 51, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 51, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 51, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0126
     * @tc.name      testKeyboardControllerSequence0126
     * @tc.desc      Unknown key code 52 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0126 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 52, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 52, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 52, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0127
     * @tc.name      testKeyboardControllerSequence0127
     * @tc.desc      Unknown key code 53 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0127 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 53, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 53, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 53, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0128
     * @tc.name      testKeyboardControllerSequence0128
     * @tc.desc      Unknown key code 54 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0128 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 54, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 54, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 54, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0128 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0129
     * @tc.name      testKeyboardControllerSequence0129
     * @tc.desc      Unknown key code 55 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0129 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 55, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 55, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 55, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0129 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0130
     * @tc.name      testKeyboardControllerSequence0130
     * @tc.desc      Unknown key code 56 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0130 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 56, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 56, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 56, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0130 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0131
     * @tc.name      testKeyboardControllerSequence0131
     * @tc.desc      Unknown key code 57 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0131 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 57, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 57, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 57, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0131 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0132
     * @tc.name      testKeyboardControllerSequence0132
     * @tc.desc      Unknown key code 58 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0132 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 58, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 58, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 58, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0132 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0133
     * @tc.name      testKeyboardControllerSequence0133
     * @tc.desc      Unknown key code 59 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0133 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 59, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 59, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 59, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0133 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0134
     * @tc.name      testKeyboardControllerSequence0134
     * @tc.desc      Unknown key code 60 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0134 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 60, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 60, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 60, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0134 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0135
     * @tc.name      testKeyboardControllerSequence0135
     * @tc.desc      Unknown key code 61 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0135 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 61, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 61, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 61, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0136
     * @tc.name      testKeyboardControllerSequence0136
     * @tc.desc      Unknown key code 62 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0136 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 62, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 62, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 62, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0137
     * @tc.name      testKeyboardControllerSequence0137
     * @tc.desc      Unknown key code 63 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0137 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 63, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 63, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 63, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0138
     * @tc.name      testKeyboardControllerSequence0138
     * @tc.desc      Unknown key code 64 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0138 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 64, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 64, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 64, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0139
     * @tc.name      testKeyboardControllerSequence0139
     * @tc.desc      Unknown key code 65 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0139 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 65, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 65, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 65, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0140
     * @tc.name      testKeyboardControllerSequence0140
     * @tc.desc      Unknown key code 66 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0140 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 66, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 66, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 66, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0141
     * @tc.name      testKeyboardControllerSequence0141
     * @tc.desc      Unknown key code 67 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0141 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 67, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 67, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 67, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0142
     * @tc.name      testKeyboardControllerSequence0142
     * @tc.desc      Unknown key code 68 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0142 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 68, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 68, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 68, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0143
     * @tc.name      testKeyboardControllerSequence0143
     * @tc.desc      Unknown key code 69 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0143 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 69, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 69, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 69, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0144
     * @tc.name      testKeyboardControllerSequence0144
     * @tc.desc      Unknown key code 70 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0144 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 70, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 70, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 70, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0145
     * @tc.name      testKeyboardControllerSequence0145
     * @tc.desc      Unknown key code 71 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0145 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 71, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 71, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 71, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0146
     * @tc.name      testKeyboardControllerSequence0146
     * @tc.desc      Unknown key code 72 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0146 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 72, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 72, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 72, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0147
     * @tc.name      testKeyboardControllerSequence0147
     * @tc.desc      Unknown key code 73 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0147 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 73, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 73, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 73, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0148
     * @tc.name      testKeyboardControllerSequence0148
     * @tc.desc      Unknown key code 74 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0148 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 74, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 74, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 74, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0149
     * @tc.name      testKeyboardControllerSequence0149
     * @tc.desc      Unknown key code 75 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0149 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 75, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 75, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 75, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0150
     * @tc.name      testKeyboardControllerSequence0150
     * @tc.desc      Unknown key code 76 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0150 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 76, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 76, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 76, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0151
     * @tc.name      testKeyboardControllerSequence0151
     * @tc.desc      Unknown key code 77 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0151 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 77, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 77, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 77, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0152
     * @tc.name      testKeyboardControllerSequence0152
     * @tc.desc      Unknown key code 78 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0152 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 78, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 78, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 78, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0153
     * @tc.name      testKeyboardControllerSequence0153
     * @tc.desc      Unknown key code 79 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0153 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 79, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 79, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 79, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0154
     * @tc.name      testKeyboardControllerSequence0154
     * @tc.desc      Unknown key code 80 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0154 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 80, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 80, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 80, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0155
     * @tc.name      testKeyboardControllerSequence0155
     * @tc.desc      Unknown key code 81 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0155 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 81, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 81, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 81, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0156
     * @tc.name      testKeyboardControllerSequence0156
     * @tc.desc      Unknown key code 82 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0156 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 82, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 82, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 82, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0157
     * @tc.name      testKeyboardControllerSequence0157
     * @tc.desc      Unknown key code 83 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0157 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 83, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 83, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 83, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0158
     * @tc.name      testKeyboardControllerSequence0158
     * @tc.desc      Unknown key code 84 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0158 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 84, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 84, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 84, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0159
     * @tc.name      testKeyboardControllerSequence0159
     * @tc.desc      Unknown key code 85 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0159 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 85, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 85, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 85, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0160
     * @tc.name      testKeyboardControllerSequence0160
     * @tc.desc      Unknown key code 86 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0160 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 86, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 86, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 86, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0161
     * @tc.name      testKeyboardControllerSequence0161
     * @tc.desc      Unknown key code 87 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0161 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 87, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 87, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 87, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0162
     * @tc.name      testKeyboardControllerSequence0162
     * @tc.desc      Unknown key code 88 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0162 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 88, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 88, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 88, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0163
     * @tc.name      testKeyboardControllerSequence0163
     * @tc.desc      Unknown key code 89 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0163 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 89, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 89, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 89, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0164
     * @tc.name      testKeyboardControllerSequence0164
     * @tc.desc      Unknown key code 90 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0164 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 90, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 90, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 90, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0165
     * @tc.name      testKeyboardControllerSequence0165
     * @tc.desc      Unknown key code 91 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0165 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 91, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 91, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 91, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0166
     * @tc.name      testKeyboardControllerSequence0166
     * @tc.desc      Unknown key code 92 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0166 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 92, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 92, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 92, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0167
     * @tc.name      testKeyboardControllerSequence0167
     * @tc.desc      Unknown key code 93 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0167 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 93, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 93, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 93, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0168
     * @tc.name      testKeyboardControllerSequence0168
     * @tc.desc      Unknown key code 94 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0168 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 94, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 94, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 94, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0169
     * @tc.name      testKeyboardControllerSequence0169
     * @tc.desc      Unknown key code 95 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0169 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 95, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 95, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 95, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0170
     * @tc.name      testKeyboardControllerSequence0170
     * @tc.desc      Unknown key code 96 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0170 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 96, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 96, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 96, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0171
     * @tc.name      testKeyboardControllerSequence0171
     * @tc.desc      Unknown key code 97 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0171 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 97, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 97, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 97, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0172
     * @tc.name      testKeyboardControllerSequence0172
     * @tc.desc      Unknown key code 98 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0172 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 98, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 98, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 98, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0173
     * @tc.name      testKeyboardControllerSequence0173
     * @tc.desc      Unknown key code 99 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0173 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 99, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 99, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 99, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0174
     * @tc.name      testKeyboardControllerSequence0174
     * @tc.desc      Modifier key code 2045 is consumed without becoming shift state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0174 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2045, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2045, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0175
     * @tc.name      testKeyboardControllerSequence0175
     * @tc.desc      Modifier key code 2046 is consumed without becoming shift state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0175 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2046, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2046, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0176
     * @tc.name      testKeyboardControllerSequence0176
     * @tc.desc      Shift plus digit key code 2000 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0176 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2000, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2000, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0177
     * @tc.name      testKeyboardControllerSequence0177
     * @tc.desc      Shift plus digit key code 2001 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0177 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2001, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2001, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0178
     * @tc.name      testKeyboardControllerSequence0178
     * @tc.desc      Shift plus digit key code 2002 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0178 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2002, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2002, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0179
     * @tc.name      testKeyboardControllerSequence0179
     * @tc.desc      Shift plus digit key code 2003 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0179 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2003, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2003, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0180
     * @tc.name      testKeyboardControllerSequence0180
     * @tc.desc      Shift plus digit key code 2004 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0180 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2004, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2004, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0181
     * @tc.name      testKeyboardControllerSequence0181
     * @tc.desc      Shift plus digit key code 2005 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0181 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2005, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2005, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0182
     * @tc.name      testKeyboardControllerSequence0182
     * @tc.desc      Shift plus digit key code 2006 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0182 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2006, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2006, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0183
     * @tc.name      testKeyboardControllerSequence0183
     * @tc.desc      Shift plus digit key code 2007 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0183 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2007, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2007, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0184
     * @tc.name      testKeyboardControllerSequence0184
     * @tc.desc      Shift plus digit key code 2008 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0184 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2008, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2008, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0185
     * @tc.name      testKeyboardControllerSequence0185
     * @tc.desc      Shift plus digit key code 2009 is treated as a special key sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0185 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2009, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2009, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0186
     * @tc.name      testKeyboardControllerSequence0186
     * @tc.desc      Letter key code 2017 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0186 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2017, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2017, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2017, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0187
     * @tc.name      testKeyboardControllerSequence0187
     * @tc.desc      Letter key code 2018 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0187 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2018, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2018, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2018, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0188
     * @tc.name      testKeyboardControllerSequence0188
     * @tc.desc      Letter key code 2019 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0188 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2019, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2019, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2019, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0189
     * @tc.name      testKeyboardControllerSequence0189
     * @tc.desc      Letter key code 2020 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0189 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2020, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2020, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2020, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0190
     * @tc.name      testKeyboardControllerSequence0190
     * @tc.desc      Letter key code 2021 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0190 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2021, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2021, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2021, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0191
     * @tc.name      testKeyboardControllerSequence0191
     * @tc.desc      Letter key code 2022 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0191 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2022, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2022, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2022, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0192
     * @tc.name      testKeyboardControllerSequence0192
     * @tc.desc      Letter key code 2023 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0192 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2023, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2023, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2023, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0193
     * @tc.name      testKeyboardControllerSequence0193
     * @tc.desc      Letter key code 2024 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0193 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2024, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2024, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2024, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0194
     * @tc.name      testKeyboardControllerSequence0194
     * @tc.desc      Letter key code 2025 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0194 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2025, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2025, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2025, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0195
     * @tc.name      testKeyboardControllerSequence0195
     * @tc.desc      Letter key code 2026 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0195 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2026, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2026, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2026, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0196
     * @tc.name      testKeyboardControllerSequence0196
     * @tc.desc      Letter key code 2027 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0196 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2027, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2027, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2027, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0197
     * @tc.name      testKeyboardControllerSequence0197
     * @tc.desc      Letter key code 2028 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0197 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2028, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2028, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2028, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0198
     * @tc.name      testKeyboardControllerSequence0198
     * @tc.desc      Letter key code 2029 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0198 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2029, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2029, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2029, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0199
     * @tc.name      testKeyboardControllerSequence0199
     * @tc.desc      Letter key code 2030 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0199 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2030, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2030, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2030, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0200
     * @tc.name      testKeyboardControllerSequence0200
     * @tc.desc      Letter key code 2031 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0200 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2031, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2031, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2031, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0201
     * @tc.name      testKeyboardControllerSequence0201
     * @tc.desc      Letter key code 2032 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0201 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2032, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2032, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2032, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0202
     * @tc.name      testKeyboardControllerSequence0202
     * @tc.desc      Letter key code 2033 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0202 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2033, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2033, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2033, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0203
     * @tc.name      testKeyboardControllerSequence0203
     * @tc.desc      Letter key code 2034 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0203 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2034, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2034, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2034, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0204
     * @tc.name      testKeyboardControllerSequence0204
     * @tc.desc      Letter key code 2035 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0204 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2035, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2035, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2035, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0205
     * @tc.name      testKeyboardControllerSequence0205
     * @tc.desc      Letter key code 2036 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0205 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2036, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2036, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2036, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0205 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0206
     * @tc.name      testKeyboardControllerSequence0206
     * @tc.desc      Letter key code 2037 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0206 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2037, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2037, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2037, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0207
     * @tc.name      testKeyboardControllerSequence0207
     * @tc.desc      Letter key code 2038 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0207 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2038, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2038, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2038, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0208
     * @tc.name      testKeyboardControllerSequence0208
     * @tc.desc      Letter key code 2039 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0208 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2039, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2039, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2039, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0209
     * @tc.name      testKeyboardControllerSequence0209
     * @tc.desc      Letter key code 2040 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0209 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2040, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2040, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2040, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0210
     * @tc.name      testKeyboardControllerSequence0210
     * @tc.desc      Letter key code 2041 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0210 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2041, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2041, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2041, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0211
     * @tc.name      testKeyboardControllerSequence0211
     * @tc.desc      Letter key code 2042 keeps a stable down and up result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0211 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2042, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2042, keyAction: 0 })).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2042, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0211 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0212
     * @tc.name      testKeyboardControllerSequence0212
     * @tc.desc      onKeyUp for letter code 2017 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0212 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2017, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0212 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0213
     * @tc.name      testKeyboardControllerSequence0213
     * @tc.desc      onKeyUp for letter code 2018 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0213 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2018, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0213 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0214
     * @tc.name      testKeyboardControllerSequence0214
     * @tc.desc      onKeyUp for letter code 2019 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0214 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2019, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0214 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0215
     * @tc.name      testKeyboardControllerSequence0215
     * @tc.desc      onKeyUp for letter code 2020 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0215 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2020, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0215 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0216
     * @tc.name      testKeyboardControllerSequence0216
     * @tc.desc      onKeyUp for letter code 2021 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0216 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2021, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0216 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0217
     * @tc.name      testKeyboardControllerSequence0217
     * @tc.desc      onKeyUp for letter code 2022 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0217 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2022, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0217 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0218
     * @tc.name      testKeyboardControllerSequence0218
     * @tc.desc      onKeyUp for letter code 2023 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0218 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2023, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0218 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0219
     * @tc.name      testKeyboardControllerSequence0219
     * @tc.desc      onKeyUp for letter code 2024 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0219 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2024, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0219 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0220
     * @tc.name      testKeyboardControllerSequence0220
     * @tc.desc      onKeyUp for letter code 2025 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0220 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2025, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0220 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0221
     * @tc.name      testKeyboardControllerSequence0221
     * @tc.desc      onKeyUp for letter code 2026 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0221 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2026, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0221 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0222
     * @tc.name      testKeyboardControllerSequence0222
     * @tc.desc      onKeyUp for letter code 2027 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0222 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2027, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0222 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0223
     * @tc.name      testKeyboardControllerSequence0223
     * @tc.desc      onKeyUp for letter code 2028 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0223 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2028, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0223 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0224
     * @tc.name      testKeyboardControllerSequence0224
     * @tc.desc      onKeyUp for letter code 2029 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0224 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2029, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0224 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0225
     * @tc.name      testKeyboardControllerSequence0225
     * @tc.desc      onKeyUp for letter code 2030 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0225 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2030, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0225 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0226
     * @tc.name      testKeyboardControllerSequence0226
     * @tc.desc      onKeyUp for letter code 2031 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0226 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2031, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0226 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0227
     * @tc.name      testKeyboardControllerSequence0227
     * @tc.desc      onKeyUp for letter code 2032 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0227 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2032, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0227 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0228
     * @tc.name      testKeyboardControllerSequence0228
     * @tc.desc      onKeyUp for letter code 2033 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0228 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2033, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0228 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0229
     * @tc.name      testKeyboardControllerSequence0229
     * @tc.desc      onKeyUp for letter code 2034 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0229 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2034, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0229 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0230
     * @tc.name      testKeyboardControllerSequence0230
     * @tc.desc      onKeyUp for letter code 2035 returns true without a prior down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0230 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyUp({ keyCode: 2035, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0230 end');
    })
  })
}
