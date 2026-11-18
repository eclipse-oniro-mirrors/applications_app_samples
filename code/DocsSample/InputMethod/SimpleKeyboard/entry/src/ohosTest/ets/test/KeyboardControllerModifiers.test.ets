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
const TAG: string = '[Sample_KeyboardControllerModifiers]';

export default function KeyboardControllerModifiersTest(): void {
  describe('KeyboardControllerModifiers', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0001
     * @tc.name      testKeyboardControllerModifier0001
     * @tc.desc      inputHardKeyCode accepts uppercase letter value A.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0001 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('A', 2017 + 0)).assertTrue();
      expect(controller.shiftKeys('A')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0002
     * @tc.name      testKeyboardControllerModifier0002
     * @tc.desc      inputHardKeyCode accepts uppercase letter value B.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0002 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('B', 2017 + 1)).assertTrue();
      expect(controller.shiftKeys('B')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0003
     * @tc.name      testKeyboardControllerModifier0003
     * @tc.desc      inputHardKeyCode accepts uppercase letter value C.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0003 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('C', 2017 + 2)).assertTrue();
      expect(controller.shiftKeys('C')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0004
     * @tc.name      testKeyboardControllerModifier0004
     * @tc.desc      inputHardKeyCode accepts uppercase letter value D.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0004 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('D', 2017 + 3)).assertTrue();
      expect(controller.shiftKeys('D')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0005
     * @tc.name      testKeyboardControllerModifier0005
     * @tc.desc      inputHardKeyCode accepts uppercase letter value E.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0005 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('E', 2017 + 4)).assertTrue();
      expect(controller.shiftKeys('E')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0006
     * @tc.name      testKeyboardControllerModifier0006
     * @tc.desc      inputHardKeyCode accepts uppercase letter value F.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0006 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('F', 2017 + 5)).assertTrue();
      expect(controller.shiftKeys('F')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0007
     * @tc.name      testKeyboardControllerModifier0007
     * @tc.desc      inputHardKeyCode accepts uppercase letter value G.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0007 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('G', 2017 + 6)).assertTrue();
      expect(controller.shiftKeys('G')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0008
     * @tc.name      testKeyboardControllerModifier0008
     * @tc.desc      inputHardKeyCode accepts uppercase letter value H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0008 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('H', 2017 + 7)).assertTrue();
      expect(controller.shiftKeys('H')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0009
     * @tc.name      testKeyboardControllerModifier0009
     * @tc.desc      inputHardKeyCode accepts uppercase letter value I.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0009 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('I', 2017 + 8)).assertTrue();
      expect(controller.shiftKeys('I')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0010
     * @tc.name      testKeyboardControllerModifier0010
     * @tc.desc      inputHardKeyCode accepts uppercase letter value J.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0010 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('J', 2017 + 9)).assertTrue();
      expect(controller.shiftKeys('J')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0011
     * @tc.name      testKeyboardControllerModifier0011
     * @tc.desc      inputHardKeyCode accepts uppercase letter value K.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0011 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('K', 2017 + 10)).assertTrue();
      expect(controller.shiftKeys('K')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0012
     * @tc.name      testKeyboardControllerModifier0012
     * @tc.desc      inputHardKeyCode accepts uppercase letter value L.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0012 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('L', 2017 + 11)).assertTrue();
      expect(controller.shiftKeys('L')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0013
     * @tc.name      testKeyboardControllerModifier0013
     * @tc.desc      inputHardKeyCode accepts uppercase letter value M.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0013 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('M', 2017 + 12)).assertTrue();
      expect(controller.shiftKeys('M')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0014
     * @tc.name      testKeyboardControllerModifier0014
     * @tc.desc      inputHardKeyCode accepts uppercase letter value N.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0014 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('N', 2017 + 13)).assertTrue();
      expect(controller.shiftKeys('N')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0015
     * @tc.name      testKeyboardControllerModifier0015
     * @tc.desc      inputHardKeyCode accepts uppercase letter value O.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0015 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('O', 2017 + 14)).assertTrue();
      expect(controller.shiftKeys('O')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0016
     * @tc.name      testKeyboardControllerModifier0016
     * @tc.desc      inputHardKeyCode accepts uppercase letter value P.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0016 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('P', 2017 + 15)).assertTrue();
      expect(controller.shiftKeys('P')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0017
     * @tc.name      testKeyboardControllerModifier0017
     * @tc.desc      inputHardKeyCode accepts uppercase letter value Q.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0017 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('Q', 2017 + 16)).assertTrue();
      expect(controller.shiftKeys('Q')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0018
     * @tc.name      testKeyboardControllerModifier0018
     * @tc.desc      inputHardKeyCode accepts uppercase letter value R.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0018 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('R', 2017 + 17)).assertTrue();
      expect(controller.shiftKeys('R')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0019
     * @tc.name      testKeyboardControllerModifier0019
     * @tc.desc      inputHardKeyCode accepts uppercase letter value S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0019 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('S', 2017 + 18)).assertTrue();
      expect(controller.shiftKeys('S')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0020
     * @tc.name      testKeyboardControllerModifier0020
     * @tc.desc      inputHardKeyCode accepts uppercase letter value T.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0020 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('T', 2017 + 19)).assertTrue();
      expect(controller.shiftKeys('T')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0021
     * @tc.name      testKeyboardControllerModifier0021
     * @tc.desc      inputHardKeyCode accepts uppercase letter value U.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0021 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('U', 2017 + 20)).assertTrue();
      expect(controller.shiftKeys('U')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0022
     * @tc.name      testKeyboardControllerModifier0022
     * @tc.desc      inputHardKeyCode accepts uppercase letter value V.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0022 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('V', 2017 + 21)).assertTrue();
      expect(controller.shiftKeys('V')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0023
     * @tc.name      testKeyboardControllerModifier0023
     * @tc.desc      inputHardKeyCode accepts uppercase letter value W.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0023 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('W', 2017 + 22)).assertTrue();
      expect(controller.shiftKeys('W')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0024
     * @tc.name      testKeyboardControllerModifier0024
     * @tc.desc      inputHardKeyCode accepts uppercase letter value X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0024 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('X', 2017 + 23)).assertTrue();
      expect(controller.shiftKeys('X')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0025
     * @tc.name      testKeyboardControllerModifier0025
     * @tc.desc      inputHardKeyCode accepts uppercase letter value Y.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0025 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('Y', 2017 + 24)).assertTrue();
      expect(controller.shiftKeys('Y')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0026
     * @tc.name      testKeyboardControllerModifier0026
     * @tc.desc      inputHardKeyCode accepts uppercase letter value Z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0026 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.inputHardKeyCode('Z', 2017 + 25)).assertTrue();
      expect(controller.shiftKeys('Z')).assertFalse();
      expect(controller.isShiftKeyHold()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0027
     * @tc.name      testKeyboardControllerModifier0027
     * @tc.desc      processFunctionKeys rejects digit value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0027 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('0')).assertFalse();
      expect(controller.shiftKeys('0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0028
     * @tc.name      testKeyboardControllerModifier0028
     * @tc.desc      processFunctionKeys rejects digit value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0028 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('1')).assertFalse();
      expect(controller.shiftKeys('1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0029
     * @tc.name      testKeyboardControllerModifier0029
     * @tc.desc      processFunctionKeys rejects digit value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0029 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('2')).assertFalse();
      expect(controller.shiftKeys('2')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0030
     * @tc.name      testKeyboardControllerModifier0030
     * @tc.desc      processFunctionKeys rejects digit value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0030 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('3')).assertFalse();
      expect(controller.shiftKeys('3')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0031
     * @tc.name      testKeyboardControllerModifier0031
     * @tc.desc      processFunctionKeys rejects digit value 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0031 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('4')).assertFalse();
      expect(controller.shiftKeys('4')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0032
     * @tc.name      testKeyboardControllerModifier0032
     * @tc.desc      processFunctionKeys rejects digit value 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0032 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('5')).assertFalse();
      expect(controller.shiftKeys('5')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0033
     * @tc.name      testKeyboardControllerModifier0033
     * @tc.desc      processFunctionKeys rejects digit value 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0033 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('6')).assertFalse();
      expect(controller.shiftKeys('6')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0034
     * @tc.name      testKeyboardControllerModifier0034
     * @tc.desc      processFunctionKeys rejects digit value 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0034 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('7')).assertFalse();
      expect(controller.shiftKeys('7')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0035
     * @tc.name      testKeyboardControllerModifier0035
     * @tc.desc      processFunctionKeys rejects digit value 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0035 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('8')).assertFalse();
      expect(controller.shiftKeys('8')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0036
     * @tc.name      testKeyboardControllerModifier0036
     * @tc.desc      processFunctionKeys rejects digit value 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0036 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('9')).assertFalse();
      expect(controller.shiftKeys('9')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0037
     * @tc.name      testKeyboardControllerModifier0037
     * @tc.desc      processFunctionKeys handles the exact KEYCODE_DEL value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0037 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DEL')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_DEL')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0038
     * @tc.name      testKeyboardControllerModifier0038
     * @tc.desc      processFunctionKeys rejects malformed function value 'KEYCODE_DEL_LOWER'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0038 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DEL_LOWER')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_DEL_LOWER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0039
     * @tc.name      testKeyboardControllerModifier0039
     * @tc.desc      processFunctionKeys rejects malformed function value 'keycode_del'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0039 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('keycode_del')).assertFalse();
      expect(controller.processFunctionKeys('keycode_del')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0040
     * @tc.name      testKeyboardControllerModifier0040
     * @tc.desc      processFunctionKeys rejects malformed function value ' KEYCODE_DEL'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0040 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys(' KEYCODE_DEL')).assertFalse();
      expect(controller.processFunctionKeys(' KEYCODE_DEL')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0041
     * @tc.name      testKeyboardControllerModifier0041
     * @tc.desc      processFunctionKeys rejects malformed function value 'KEYCODE_DEL '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0041 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DEL ')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_DEL ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0042
     * @tc.name      testKeyboardControllerModifier0042
     * @tc.desc      processFunctionKeys rejects malformed function value 'KEYCODE_DEL\t'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0042 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_DEL\t')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_DEL\t')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0043
     * @tc.name      testKeyboardControllerModifier0043
     * @tc.desc      processFunctionKeys handles the exact KEYCODE_FORWARD_DEL value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0043 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL')).assertTrue();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0044
     * @tc.name      testKeyboardControllerModifier0044
     * @tc.desc      processFunctionKeys rejects malformed function value 'KEYCODE_FORWARD_DEL_LOWER'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0044 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL_LOWER')).assertFalse();
      expect(controller.processFunctionKeys('KEYCODE_FORWARD_DEL_LOWER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0045
     * @tc.name      testKeyboardControllerModifier0045
     * @tc.desc      processFunctionKeys rejects malformed function value 'keycode_forward_del'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0045 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys('keycode_forward_del')).assertFalse();
      expect(controller.processFunctionKeys('keycode_forward_del')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0046
     * @tc.name      testKeyboardControllerModifier0046
     * @tc.desc      processFunctionKeys rejects malformed function value ' KEYCODE_FORWARD_DEL'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0046 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.processFunctionKeys(' KEYCODE_FORWARD_DEL')).assertFalse();
      expect(controller.processFunctionKeys(' KEYCODE_FORWARD_DEL')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0047
     * @tc.name      testKeyboardControllerModifier0047
     * @tc.desc      shiftKeys rejects whitespace or word value ' '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0047 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys(' ')).assertFalse();
      expect(controller.processFunctionKeys(' ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0048
     * @tc.name      testKeyboardControllerModifier0048
     * @tc.desc      shiftKeys rejects whitespace or word value '  '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0048 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('  ')).assertFalse();
      expect(controller.processFunctionKeys('  ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0049
     * @tc.name      testKeyboardControllerModifier0049
     * @tc.desc      shiftKeys rejects whitespace or word value '\t'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0049 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('\t')).assertFalse();
      expect(controller.processFunctionKeys('\t')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0050
     * @tc.name      testKeyboardControllerModifier0050
     * @tc.desc      shiftKeys rejects whitespace or word value '\n'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0050 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('\n')).assertFalse();
      expect(controller.processFunctionKeys('\n')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0051
     * @tc.name      testKeyboardControllerModifier0051
     * @tc.desc      shiftKeys rejects whitespace or word value 'space'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0051 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('space')).assertFalse();
      expect(controller.processFunctionKeys('space')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0052
     * @tc.name      testKeyboardControllerModifier0052
     * @tc.desc      shiftKeys rejects whitespace or word value 'Space'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0052 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('Space')).assertFalse();
      expect(controller.processFunctionKeys('Space')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0053
     * @tc.name      testKeyboardControllerModifier0053
     * @tc.desc      shiftKeys rejects whitespace or word value 'SPACE'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0053 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('SPACE')).assertFalse();
      expect(controller.processFunctionKeys('SPACE')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0054
     * @tc.name      testKeyboardControllerModifier0054
     * @tc.desc      shiftKeys rejects whitespace or word value ' key'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0054 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys(' key')).assertFalse();
      expect(controller.processFunctionKeys(' key')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0055
     * @tc.name      testKeyboardControllerModifier0055
     * @tc.desc      shiftKeys rejects whitespace or word value 'key '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0055 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('key ')).assertFalse();
      expect(controller.processFunctionKeys('key ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYMOD_0056
     * @tc.name      testKeyboardControllerModifier0056
     * @tc.desc      shiftKeys rejects whitespace or word value '   key   '.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardControllerModifier0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0056 begin');
      const controller: KeyboardController = new KeyboardController();
      expect(controller.shiftKeys('   key   ')).assertFalse();
      expect(controller.processFunctionKeys('   key   ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyboardControllerModifier0056 end');
    })
  })
}
