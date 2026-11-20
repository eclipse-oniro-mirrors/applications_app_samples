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

export default function KeyboardControllerSequencesCoreTest(): void {
  describe('KeyboardControllerSequencesCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0001
     * @tc.name      testKeyboardControllerSequence0001
     * @tc.desc      Letter key code 2017 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0001 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2017, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0002
     * @tc.name      testKeyboardControllerSequence0002
     * @tc.desc      Letter key code 2018 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0002 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2018, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0003
     * @tc.name      testKeyboardControllerSequence0003
     * @tc.desc      Letter key code 2019 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0003 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2019, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0004
     * @tc.name      testKeyboardControllerSequence0004
     * @tc.desc      Letter key code 2020 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0004 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2020, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0005
     * @tc.name      testKeyboardControllerSequence0005
     * @tc.desc      Letter key code 2021 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0005 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2021, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0006
     * @tc.name      testKeyboardControllerSequence0006
     * @tc.desc      Letter key code 2022 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0006 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2022, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0007
     * @tc.name      testKeyboardControllerSequence0007
     * @tc.desc      Letter key code 2023 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0007 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2023, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0008
     * @tc.name      testKeyboardControllerSequence0008
     * @tc.desc      Letter key code 2024 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0008 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2024, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0009
     * @tc.name      testKeyboardControllerSequence0009
     * @tc.desc      Letter key code 2025 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0009 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2025, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0010
     * @tc.name      testKeyboardControllerSequence0010
     * @tc.desc      Letter key code 2026 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0010 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2026, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0011
     * @tc.name      testKeyboardControllerSequence0011
     * @tc.desc      Letter key code 2027 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0011 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2027, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0012
     * @tc.name      testKeyboardControllerSequence0012
     * @tc.desc      Letter key code 2028 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0012 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2028, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0013
     * @tc.name      testKeyboardControllerSequence0013
     * @tc.desc      Letter key code 2029 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0013 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2029, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0014
     * @tc.name      testKeyboardControllerSequence0014
     * @tc.desc      Letter key code 2030 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0014 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2030, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0015
     * @tc.name      testKeyboardControllerSequence0015
     * @tc.desc      Letter key code 2031 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0015 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2031, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0016
     * @tc.name      testKeyboardControllerSequence0016
     * @tc.desc      Letter key code 2032 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0016 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2032, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0017
     * @tc.name      testKeyboardControllerSequence0017
     * @tc.desc      Letter key code 2033 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0017 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2033, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0018
     * @tc.name      testKeyboardControllerSequence0018
     * @tc.desc      Letter key code 2034 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0018 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2034, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0019
     * @tc.name      testKeyboardControllerSequence0019
     * @tc.desc      Letter key code 2035 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0019 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2035, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0020
     * @tc.name      testKeyboardControllerSequence0020
     * @tc.desc      Letter key code 2036 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0020 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2036, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0021
     * @tc.name      testKeyboardControllerSequence0021
     * @tc.desc      Letter key code 2037 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0021 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2037, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0022
     * @tc.name      testKeyboardControllerSequence0022
     * @tc.desc      Letter key code 2038 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0022 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2038, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0023
     * @tc.name      testKeyboardControllerSequence0023
     * @tc.desc      Letter key code 2039 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0023 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2039, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0024
     * @tc.name      testKeyboardControllerSequence0024
     * @tc.desc      Letter key code 2040 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0024 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2040, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0025
     * @tc.name      testKeyboardControllerSequence0025
     * @tc.desc      Letter key code 2041 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0025 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2041, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0026
     * @tc.name      testKeyboardControllerSequence0026
     * @tc.desc      Letter key code 2042 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0026 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2042, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0027
     * @tc.name      testKeyboardControllerSequence0027
     * @tc.desc      Shift plus letter key code 2017 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0027 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2017, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2017, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0028
     * @tc.name      testKeyboardControllerSequence0028
     * @tc.desc      Shift plus letter key code 2018 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0028 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2018, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2018, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0029
     * @tc.name      testKeyboardControllerSequence0029
     * @tc.desc      Shift plus letter key code 2019 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0029 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2019, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2019, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0030
     * @tc.name      testKeyboardControllerSequence0030
     * @tc.desc      Shift plus letter key code 2020 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0030 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2020, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2020, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0031
     * @tc.name      testKeyboardControllerSequence0031
     * @tc.desc      Shift plus letter key code 2021 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0031 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2021, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2021, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0032
     * @tc.name      testKeyboardControllerSequence0032
     * @tc.desc      Shift plus letter key code 2022 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0032 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2022, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2022, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0033
     * @tc.name      testKeyboardControllerSequence0033
     * @tc.desc      Shift plus letter key code 2023 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0033 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2023, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2023, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0034
     * @tc.name      testKeyboardControllerSequence0034
     * @tc.desc      Shift plus letter key code 2024 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0034 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2024, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2024, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0035
     * @tc.name      testKeyboardControllerSequence0035
     * @tc.desc      Shift plus letter key code 2025 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0035 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2025, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2025, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0036
     * @tc.name      testKeyboardControllerSequence0036
     * @tc.desc      Shift plus letter key code 2026 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0036 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2026, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2026, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0037
     * @tc.name      testKeyboardControllerSequence0037
     * @tc.desc      Shift plus letter key code 2027 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0037 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2027, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2027, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0038
     * @tc.name      testKeyboardControllerSequence0038
     * @tc.desc      Shift plus letter key code 2028 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0038 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2028, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2028, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0039
     * @tc.name      testKeyboardControllerSequence0039
     * @tc.desc      Shift plus letter key code 2029 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0039 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2029, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2029, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0040
     * @tc.name      testKeyboardControllerSequence0040
     * @tc.desc      Shift plus letter key code 2030 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0040 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2030, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2030, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0041
     * @tc.name      testKeyboardControllerSequence0041
     * @tc.desc      Shift plus letter key code 2031 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0041 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2031, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2031, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0042
     * @tc.name      testKeyboardControllerSequence0042
     * @tc.desc      Shift plus letter key code 2032 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0042 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2032, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2032, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0043
     * @tc.name      testKeyboardControllerSequence0043
     * @tc.desc      Shift plus letter key code 2033 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0043 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2033, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2033, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0044
     * @tc.name      testKeyboardControllerSequence0044
     * @tc.desc      Shift plus letter key code 2034 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0044 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2034, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2034, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0045
     * @tc.name      testKeyboardControllerSequence0045
     * @tc.desc      Shift plus letter key code 2035 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0045 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2035, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2035, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0046
     * @tc.name      testKeyboardControllerSequence0046
     * @tc.desc      Shift plus letter key code 2036 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0046 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2036, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2036, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0047
     * @tc.name      testKeyboardControllerSequence0047
     * @tc.desc      Shift plus letter key code 2037 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0047 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2037, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2037, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0048
     * @tc.name      testKeyboardControllerSequence0048
     * @tc.desc      Shift plus letter key code 2038 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0048 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2038, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2038, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0049
     * @tc.name      testKeyboardControllerSequence0049
     * @tc.desc      Shift plus letter key code 2039 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0049 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2039, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2039, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0050
     * @tc.name      testKeyboardControllerSequence0050
     * @tc.desc      Shift plus letter key code 2040 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0050 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2040, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2040, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0051
     * @tc.name      testKeyboardControllerSequence0051
     * @tc.desc      Shift plus letter key code 2041 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0051 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2041, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2041, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0052
     * @tc.name      testKeyboardControllerSequence0052
     * @tc.desc      Shift plus letter key code 2042 inserts an uppercase key value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0052 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2047, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertTrue();
      expect(controller.onKeyDown({ keyCode: 2042, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2042, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2047, keyAction: 0 })).assertTrue();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0053
     * @tc.name      testKeyboardControllerSequence0053
     * @tc.desc      Digit key code 2000 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0053 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2000, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2000, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0054
     * @tc.name      testKeyboardControllerSequence0054
     * @tc.desc      Digit key code 2001 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0054 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2001, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2001, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0055
     * @tc.name      testKeyboardControllerSequence0055
     * @tc.desc      Digit key code 2002 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0055 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2002, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2002, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0056
     * @tc.name      testKeyboardControllerSequence0056
     * @tc.desc      Digit key code 2003 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0056 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2003, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2003, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0057
     * @tc.name      testKeyboardControllerSequence0057
     * @tc.desc      Digit key code 2004 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0057 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2004, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2004, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0058
     * @tc.name      testKeyboardControllerSequence0058
     * @tc.desc      Digit key code 2005 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0058 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2005, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2005, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0059
     * @tc.name      testKeyboardControllerSequence0059
     * @tc.desc      Digit key code 2006 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0059 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2006, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2006, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0060
     * @tc.name      testKeyboardControllerSequence0060
     * @tc.desc      Digit key code 2007 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0060 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2007, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2007, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0061
     * @tc.name      testKeyboardControllerSequence0061
     * @tc.desc      Digit key code 2008 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0061 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2008, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2008, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0062
     * @tc.name      testKeyboardControllerSequence0062
     * @tc.desc      Digit key code 2009 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0062 begin');
      const controller: KeyboardController = new KeyboardController();
      const result: boolean = controller.onKeyDown({ keyCode: 2009, keyAction: 0 });
      expect(result).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2009, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0063
     * @tc.name      testKeyboardControllerSequence0063
     * @tc.desc      Punctuation key code 2010 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0063 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2010, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2010, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0064
     * @tc.name      testKeyboardControllerSequence0064
     * @tc.desc      Punctuation key code 2011 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0064 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2011, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2011, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0065
     * @tc.name      testKeyboardControllerSequence0065
     * @tc.desc      Punctuation key code 2043 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0065 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2043, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2043, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0066
     * @tc.name      testKeyboardControllerSequence0066
     * @tc.desc      Punctuation key code 2044 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0066 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2044, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2044, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0067
     * @tc.name      testKeyboardControllerSequence0067
     * @tc.desc      Punctuation key code 2050 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0067 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2050, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2050, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0068
     * @tc.name      testKeyboardControllerSequence0068
     * @tc.desc      Punctuation key code 2058 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0068 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2058, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2058, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0069
     * @tc.name      testKeyboardControllerSequence0069
     * @tc.desc      Punctuation key code 2064 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0069 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2064, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2064, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0070
     * @tc.name      testKeyboardControllerSequence0070
     * @tc.desc      Punctuation key code 2065 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0070 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2065, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2065, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0071
     * @tc.name      testKeyboardControllerSequence0071
     * @tc.desc      Punctuation key code 2066 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0071 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2066, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2066, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0072
     * @tc.name      testKeyboardControllerSequence0072
     * @tc.desc      Punctuation key code 2121 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0072 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2121, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2121, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0073
     * @tc.name      testKeyboardControllerSequence0073
     * @tc.desc      Punctuation key code 2122 is accepted by onKeyDown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0073 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2122, keyAction: 0 })).assertTrue();
      expect(controller.onKeyUp({ keyCode: 2122, keyAction: 0 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0074
     * @tc.name      testKeyboardControllerSequence0074
     * @tc.desc      Unknown key code 0 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0074 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 0, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 0, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 0, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0075
     * @tc.name      testKeyboardControllerSequence0075
     * @tc.desc      Unknown key code 1 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0075 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 1, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 1, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 1, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0076
     * @tc.name      testKeyboardControllerSequence0076
     * @tc.desc      Unknown key code 2 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0076 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 2, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 2, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 2, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0077
     * @tc.name      testKeyboardControllerSequence0077
     * @tc.desc      Unknown key code 3 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0077 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 3, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 3, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 3, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0078
     * @tc.name      testKeyboardControllerSequence0078
     * @tc.desc      Unknown key code 4 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0078 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 4, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 4, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 4, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0079
     * @tc.name      testKeyboardControllerSequence0079
     * @tc.desc      Unknown key code 5 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0079 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 5, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 5, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 5, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0080
     * @tc.name      testKeyboardControllerSequence0080
     * @tc.desc      Unknown key code 6 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0080 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 6, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 6, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 6, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0081
     * @tc.name      testKeyboardControllerSequence0081
     * @tc.desc      Unknown key code 7 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0081 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 7, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 7, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 7, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0082
     * @tc.name      testKeyboardControllerSequence0082
     * @tc.desc      Unknown key code 8 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0082 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 8, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 8, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 8, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0083
     * @tc.name      testKeyboardControllerSequence0083
     * @tc.desc      Unknown key code 9 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0083 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 9, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 9, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 9, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0084
     * @tc.name      testKeyboardControllerSequence0084
     * @tc.desc      Unknown key code 10 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0084 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 10, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 10, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 10, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0085
     * @tc.name      testKeyboardControllerSequence0085
     * @tc.desc      Unknown key code 11 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0085 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 11, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 11, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 11, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0086
     * @tc.name      testKeyboardControllerSequence0086
     * @tc.desc      Unknown key code 12 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0086 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 12, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 12, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 12, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0087
     * @tc.name      testKeyboardControllerSequence0087
     * @tc.desc      Unknown key code 13 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0087 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 13, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 13, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 13, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0088
     * @tc.name      testKeyboardControllerSequence0088
     * @tc.desc      Unknown key code 14 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0088 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 14, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 14, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 14, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0089
     * @tc.name      testKeyboardControllerSequence0089
     * @tc.desc      Unknown key code 15 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0089 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 15, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 15, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 15, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0090
     * @tc.name      testKeyboardControllerSequence0090
     * @tc.desc      Unknown key code 16 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0090 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 16, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 16, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 16, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0091
     * @tc.name      testKeyboardControllerSequence0091
     * @tc.desc      Unknown key code 17 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0091 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 17, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 17, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 17, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0092
     * @tc.name      testKeyboardControllerSequence0092
     * @tc.desc      Unknown key code 18 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0092 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 18, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 18, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 18, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0093
     * @tc.name      testKeyboardControllerSequence0093
     * @tc.desc      Unknown key code 19 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0093 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 19, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 19, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 19, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0094
     * @tc.name      testKeyboardControllerSequence0094
     * @tc.desc      Unknown key code 20 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0094 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 20, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 20, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 20, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0095
     * @tc.name      testKeyboardControllerSequence0095
     * @tc.desc      Unknown key code 21 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0095 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 21, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 21, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 21, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0096
     * @tc.name      testKeyboardControllerSequence0096
     * @tc.desc      Unknown key code 22 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0096 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 22, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 22, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 22, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0097
     * @tc.name      testKeyboardControllerSequence0097
     * @tc.desc      Unknown key code 23 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0097 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 23, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 23, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 23, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0098
     * @tc.name      testKeyboardControllerSequence0098
     * @tc.desc      Unknown key code 24 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0098 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 24, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 24, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 24, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0099
     * @tc.name      testKeyboardControllerSequence0099
     * @tc.desc      Unknown key code 25 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0099 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 25, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 25, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 25, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0100
     * @tc.name      testKeyboardControllerSequence0100
     * @tc.desc      Unknown key code 26 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0100 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 26, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 26, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 26, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0101
     * @tc.name      testKeyboardControllerSequence0101
     * @tc.desc      Unknown key code 27 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0101 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 27, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 27, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 27, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0102
     * @tc.name      testKeyboardControllerSequence0102
     * @tc.desc      Unknown key code 28 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0102 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 28, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 28, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 28, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0103
     * @tc.name      testKeyboardControllerSequence0103
     * @tc.desc      Unknown key code 29 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0103 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 29, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 29, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 29, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0104
     * @tc.name      testKeyboardControllerSequence0104
     * @tc.desc      Unknown key code 30 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0104 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 30, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 30, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 30, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0105
     * @tc.name      testKeyboardControllerSequence0105
     * @tc.desc      Unknown key code 31 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0105 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 31, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 31, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 31, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0106
     * @tc.name      testKeyboardControllerSequence0106
     * @tc.desc      Unknown key code 32 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0106 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 32, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 32, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 32, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0107
     * @tc.name      testKeyboardControllerSequence0107
     * @tc.desc      Unknown key code 33 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0107 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 33, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 33, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 33, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0108
     * @tc.name      testKeyboardControllerSequence0108
     * @tc.desc      Unknown key code 34 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0108 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 34, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 34, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 34, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0109
     * @tc.name      testKeyboardControllerSequence0109
     * @tc.desc      Unknown key code 35 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0109 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 35, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 35, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 35, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0110
     * @tc.name      testKeyboardControllerSequence0110
     * @tc.desc      Unknown key code 36 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0110 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 36, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 36, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 36, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0111
     * @tc.name      testKeyboardControllerSequence0111
     * @tc.desc      Unknown key code 37 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0111 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 37, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 37, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 37, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0112
     * @tc.name      testKeyboardControllerSequence0112
     * @tc.desc      Unknown key code 38 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0112 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 38, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 38, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 38, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ2_0113
     * @tc.name      testKeyboardControllerSequence0113
     * @tc.desc      Unknown key code 39 is rejected and released without a held shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerSequence0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0113 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.onKeyDown({ keyCode: 39, keyAction: 0 })).assertFalse();
      expect(controller.onKeyDown({ keyCode: 39, keyAction: 0 })).assertFalse();
      expect(controller.onKeyUp({ keyCode: 39, keyAction: 0 })).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerSequence0113 end');
    })
  })
}
