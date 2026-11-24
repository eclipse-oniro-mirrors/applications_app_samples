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
import { yieldToEventLoop } from '../support/AsyncSupport';
import { KeyboardController, InputHandler } from '../../../../main/ets/model/KeyboardController';
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld, processFunctionToken, translateShiftToken, inputHardKeyValue } from '../support/TestSupport';
import hilog from '@ohos.hilog';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';

import { tapExpect } from '../support/PhaseRunner';
const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputControllerStageTest]';

export default function controllerStateTest001(): void {
  describe('ControllerStateTest001', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0100
     * @tc.name      testControllerStateTest001Test_001
     * @tc.desc      Verify that shift then letter then release letter then shift works for every sampled letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerStateTest001Test_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const controller: KeyboardController = createKeyboardController();

      const letters: number[] = [2017, 2018, 2021, 2030, 2042];
      // The release order must not clear shift while the letter is still held.
      let i: number = 0;
      while (i < letters.length) {
        expect(pressHardKey(controller, 2047)).assertEqual(false);
        expect(pressHardKey(controller, letters[i])).assertEqual(true);
        expect(isShiftHeld(controller)).assertEqual(true);
        expect(releaseHardKey(controller, letters[i])).assertEqual(false);
        expect(isShiftHeld(controller)).assertEqual(true);
        expect(releaseHardKey(controller, 2047)).assertEqual(false);
        expect(isShiftHeld(controller)).assertEqual(false);
        i = i + 1;
      }
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0200
     * @tc.name      testControllerStateTest001Test_002
     * @tc.desc      Verify that shift then letter then release shift then letter works for every sampled letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerStateTest001Test_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const controller: KeyboardController = createKeyboardController();

      const letters: number[] = [2017, 2018, 2021, 2030, 2042];
      // Releasing shift first makes the letter release a plain release.
      for (let i = 0; i < letters.length; i++) {
        expect(pressHardKey(controller, 2047)).assertFalse();
        expect(pressHardKey(controller, letters[i])).assertTrue();
        expect(releaseHardKey(controller, 2047)).assertFalse();
        expect(isShiftHeld(controller)).assertFalse();
        expect(releaseHardKey(controller, letters[i])).assertFalse();
      }
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0300
     * @tc.name      testControllerStateTest001Test_003
     * @tc.desc      Verify that letter then shift then release shift then letter works for every sampled letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const letters: number[] = [2017, 2018, 2021, 2030, 2042];
      // Shift pressed while a letter is held is not the first key, so it does not arm uppercase.
      let i: number = 0;
      while (i < letters.length) {
        expect(pressHardKey(controller, letters[i])).assertTrue();
        expect(pressHardKey(controller, 2047)).assertFalse();
        expect(isShiftHeld(controller)).assertFalse();
        expect(releaseHardKey(controller, 2047)).assertFalse();
        expect(releaseHardKey(controller, letters[i])).assertFalse();
        i = i + 1;
      }
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0400
     * @tc.name      testControllerStateTest001Test_004
     * @tc.desc      Verify that shift held across two letters keeps both letters accepted until release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const letters: number[] = [2017, 2018, 2021, 2030, 2042];
      // The second letter is pressed while shift and the first letter are still held.
      for (let i = 0; i < letters.length; i++) {
        expect(pressHardKey(controller, 2047)).assertEqual(false);
        expect(pressHardKey(controller, letters[i])).assertEqual(true);
        tapExpect(controller, 2018, true, false);
        expect(releaseHardKey(controller, letters[i])).assertEqual(false);
        expect(releaseHardKey(controller, 2047)).assertEqual(false);
        expect(isShiftHeld(controller)).assertEqual(false);
      }
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0500
     * @tc.name      testControllerStateTest001Test_005
     * @tc.desc      Verify that shift followed by a non-alphabetic code is blocked for every sampled code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const codes: number[] = [2001, 2005, 2049, 2103, 2045];
      // Shift plus a non-letter arms the special latch and returns false.
      let i: number = 0;
      while (i < codes.length) {
        expect(pressHardKey(controller, 2047)).assertFalse();
        expect(pressHardKey(controller, codes[i])).assertFalse();
        expect(releaseHardKey(controller, codes[i])).assertFalse();
        expect(releaseHardKey(controller, 2047)).assertFalse();
        expect(isShiftHeld(controller)).assertFalse();
        i = i + 1;
      }
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0600
     * @tc.name      testControllerStateTest001Test_006
     * @tc.desc      Verify that an unmapped or modifier code blocks the following letter until all keys are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2049, 3000];

      // Unmapped codes arm the latch, so the following letter is refused until release.
      for (let i = 0; i < codes.length; i++) {
        expect(pressHardKey(controller, codes[i])).assertFalse();
        tapExpect(controller, 2017, false, false);
        expect(releaseHardKey(controller, codes[i])).assertFalse();
        expect(isShiftHeld(controller)).assertFalse();
      }

      // Alt codes are refused before the mapping stage and do not arm the latch.
      expect(pressHardKey(controller, 2045)).assertFalse();
      tapExpect(controller, 2017, true, false);
      expect(releaseHardKey(controller, 2045)).assertFalse();
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0700
     * @tc.name      testControllerStateTest001Test_007
     * @tc.desc      Verify that shift followed by a function code is blocked for every sampled function key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const codes: number[] = [2055, 2071, 2012, 2015];
      // Function keys cannot pass through an armed shift.
      let i: number = 0;
      while (i < codes.length) {
        expect(pressHardKey(controller, 2047)).assertEqual(false);
        expect(pressHardKey(controller, codes[i])).assertEqual(false);
        expect(releaseHardKey(controller, codes[i])).assertEqual(false);
        expect(releaseHardKey(controller, 2047)).assertEqual(false);
        expect(isShiftHeld(controller)).assertEqual(false);
        i = i + 1;
      }
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0800
     * @tc.name      testControllerStateTest001Test_008
     * @tc.desc      Verify that the key state machine handles repeat letter press and release in scenario 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();
      const actions: number[] = [1, 0, 1, 0];
      const stepCodes: number[] = [2017, 2017, 2017, 2017];
      const expected: boolean[] = [true, false, true, false];
      let stepIndex: number = 0;
      do {
        const accepted: boolean = actions[stepIndex] === 1 ?
          pressHardKey(controller, stepCodes[stepIndex]) : releaseHardKey(controller, stepCodes[stepIndex]);
        expect(isShiftHeld(controller)).assertEqual(false);
        expect(accepted).assertEqual(expected[stepIndex]);
        stepIndex = stepIndex + 1;
      } while (stepIndex < stepCodes.length);

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertFalse();
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_0900
     * @tc.name      testControllerStateTest001Test_009
     * @tc.desc      Verify that the key state machine handles repeat shift press in scenario 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const down1: boolean = pressHardKey(controller, 2047);
      expect(down1).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      const down2: boolean = pressHardKey(controller, 2047);
      expect(down2).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      const up3: boolean = releaseHardKey(controller, 2047);
      expect(up3).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();

      // Release any key still held so the next case starts clean.
      releaseHardKey(controller, 2047);
      expect(isShiftHeld(controller)).assertFalse();
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1000
     * @tc.name      testControllerStateTest001Test_010
     * @tc.desc      Verify that the key state machine handles left and right shift in sequence in scenario 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const down1: boolean = pressHardKey(controller, 2047);
      expect(isShiftHeld(controller) === true).assertEqual(true);
      expect(down1 === false).assertEqual(true);
      const up2: boolean = releaseHardKey(controller, 2047);
      expect(isShiftHeld(controller) === false).assertEqual(true);
      expect(up2 === false).assertEqual(true);
      const down3: boolean = pressHardKey(controller, 2048);
      expect(isShiftHeld(controller) === true).assertEqual(true);
      expect(down3 === false).assertEqual(true);
      const up4: boolean = releaseHardKey(controller, 2048);
      expect(isShiftHeld(controller) === false).assertEqual(true);
      expect(up4 === false).assertEqual(true);

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertEqual(false);
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1100
     * @tc.name      testControllerStateTest001Test_011
     * @tc.desc      Verify that the key state machine handles shift left then right together in scenario 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const down1: boolean = pressHardKey(controller, 2047);
      expect(down1).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const down2: boolean = pressHardKey(controller, 2048);
      expect(down2).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const up3: boolean = releaseHardKey(controller, 2048);
      expect(up3).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const up4: boolean = releaseHardKey(controller, 2047);
      expect(up4).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertEqual(false);
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1200
     * @tc.name      testControllerStateTest001Test_012
     * @tc.desc      Verify that the key state machine handles alt then shift then letter in scenario 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();
      const actions: number[] = [1, 1, 1, 0, 0, 0];
      const stepCodes: number[] = [2045, 2047, 2017, 2017, 2047, 2045];
      const expected: boolean[] = [false, false, true, false, false, false];
      for (let stepIndex = 0; stepIndex < stepCodes.length; stepIndex = stepIndex + 1) {
        const modelAction: number = actions[stepIndex];
        const modelCode: number = stepCodes[stepIndex];
        const accepted: boolean = modelAction === 1 ?
          pressHardKey(controller, modelCode) : releaseHardKey(controller, modelCode);
        expect(isShiftHeld(controller)).assertEqual(false);
        expect(accepted).assertEqual(expected[stepIndex]);
      }

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertFalse();
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1300
     * @tc.name      testControllerStateTest001Test_013
     * @tc.desc      Verify that the key state machine handles unmapped then shift then letter in scenario 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();
      const actions: number[] = [1, 1, 1, 0, 0, 0];
      const stepCodes: number[] = [2049, 2047, 2017, 2017, 2047, 2049];
      const expected: boolean[] = [false, false, false, false, false, false];
      let i: number = 0;
      while (i < stepCodes.length) {
        const accepted: boolean = actions[i] === 1 ?
            pressHardKey(controller, stepCodes[i]) : releaseHardKey(controller, stepCodes[i]);
        expect(accepted).assertEqual(expected[i]);
        expect(isShiftHeld(controller)).assertEqual(false);
        i = i + 1;
      }

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertEqual(false);
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1400
     * @tc.name      testControllerStateTest001Test_014
     * @tc.desc      Verify that the key state machine handles two digits then release in scenario 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();
      const actions: number[] = [1, 1, 0, 0];
      const stepCodes: number[] = [2001, 2002, 2001, 2002];
      const expected: boolean[] = [true, true, false, false];
      for (let stepIndex = 0; stepIndex < stepCodes.length; stepIndex = stepIndex + 1) {
        const modelAction: number = actions[stepIndex];
        const modelCode: number = stepCodes[stepIndex];
        const accepted: boolean = modelAction === 1 ?
          pressHardKey(controller, modelCode) : releaseHardKey(controller, modelCode);
        expect(isShiftHeld(controller)).assertEqual(false);
        expect(accepted).assertEqual(expected[stepIndex]);
      }

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertFalse();
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1500
     * @tc.name      testControllerStateTest001Test_015
     * @tc.desc      Verify that the key state machine handles digit then shift then digit in scenario 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();
      const actions: number[] = [1, 1, 1, 0, 0, 0];
      const stepCodes: number[] = [2001, 2047, 2002, 2002, 2047, 2001];
      const expected: boolean[] = [true, false, true, false, false, false];
      let stepIndex: number = 0;
      do {
        const accepted: boolean = actions[stepIndex] === 1 ?
          pressHardKey(controller, stepCodes[stepIndex]) : releaseHardKey(controller, stepCodes[stepIndex]);
        expect(accepted).assertEqual(expected[stepIndex]);
        expect(isShiftHeld(controller)).assertFalse();
        stepIndex = stepIndex + 1;
      } while (stepIndex < stepCodes.length);

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertFalse();
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1600
     * @tc.name      testControllerStateTest001Test_016
     * @tc.desc      Verify that the key state machine handles letter then unmapped then letter in scenario 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();
      const actions: number[] = [1, 1, 1, 0, 0, 0];
      const stepCodes: number[] = [2017, 2049, 2018, 2018, 2049, 2017];
      const expected: boolean[] = [true, false, false, false, false, false];
      for (let stepIndex = 0; stepIndex < stepCodes.length; stepIndex = stepIndex + 1) {
        const modelAction: number = actions[stepIndex];
        const modelCode: number = stepCodes[stepIndex];
        const accepted: boolean = modelAction === 1 ?
          pressHardKey(controller, modelCode) : releaseHardKey(controller, modelCode);
        expect(isShiftHeld(controller) === false).assertEqual(true);
        expect(accepted).assertEqual(expected[stepIndex]);
      }

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertEqual(false);
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MULTI_KEY_1700
     * @tc.name      testControllerStateTest001Test_017
     * @tc.desc      Verify that the key state machine handles shift then comma then period in scenario 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const controller: KeyboardController = createKeyboardController();

      const down1: boolean = pressHardKey(controller, 2047);
      expect(down1).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const down2: boolean = pressHardKey(controller, 2043);
      expect(down2).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const down3: boolean = pressHardKey(controller, 2044);
      expect(down3).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const up4: boolean = releaseHardKey(controller, 2044);
      expect(up4).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const up5: boolean = releaseHardKey(controller, 2043);
      expect(up5).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      const up6: boolean = releaseHardKey(controller, 2047);
      expect(up6).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);

      // Release any key still held so the next case starts clean.
      expect(isShiftHeld(controller)).assertEqual(false);
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0100
     * @tc.name      testControllerStateTest001Test_018
     * @tc.desc      Verify that every consumed token is recognised by the Function stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerStateTest001Test_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_018 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["KEYCODE_DEL", "KEYCODE_FORWARD_DEL", "KEYCODE_DPAD_UP", "KEYCODE_DPAD_DOWN", "KEYCODE_DPAD_LEFT", "KEYCODE_DPAD_RIGHT"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      for (let i = 0; i < tokens.length; i++) {
        // Function tokens are consumed before shift/insert, so precedence is observable here.
        const actual: boolean = processFunctionToken(controller, tokens[i]);
        expect(actual).assertTrue();
      }

      expect(tokens.length).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0200
     * @tc.name      testControllerStateTest001Test_019
     * @tc.desc      Verify that no near-miss token is consumed by the Function stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_019 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["KEYCODE_DELETE", "keycode_del", "KEYCODE_del", "KEYCODE_", "KEYCODE_DPAD_CENTER", "KEYCODE_DPAD_UP_EXTRA", "KEYCODE_SHIFT_LEFT", "KEYCODE_SHIFT_RIGHT", "KEYCODE_ALT_LEFT", "KEYCODE_ALT_RIGHT", "a", "A", "0", "9", " ", "", ",", ".", "?123", "ABC", "=/<", "KEYCODE_FORWARD_DELETE", "KEYCODE_BACKSPACE", "KEYCODE_ENTER", "KEYCODE_TAB", "DELETE", "KEYCODE_DEL ", " KEYCODE_DEL", "KEYCODE__DEL", "KEYCODE_DPAD_UP_LEFT", "KEYCODE_DPAD", "KEYCODE_D", "KEYCODE_DPAD_DOWN_", "KEYCODE_DPAD_RIGHT ", "KEYCODE_DPAD_UP\t", "KEYCODE_DPAD_UP.", "dpad_up", "KEYCODE_dpad_up", "KEYCODE_DPAD_Up", "KEYCODE_DPAD_LEFT "];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      let i: number = 0;
      while (i < tokens.length) {
        const actual: boolean = processFunctionToken(controller, tokens[i]);
        expect(actual).assertEqual(false);
        i = i + 1;
      }

      expect(tokens.length).assertEqual(40);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0300
     * @tc.name      testControllerStateTest001Test_020
     * @tc.desc      Verify that every consumed token is recognised by the Shift stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerStateTest001Test_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_020 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["KEYCODE_SHIFT_LEFT", "KEYCODE_SHIFT_RIGHT"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      for (let i = 0; i < tokens.length; i++) {
        const actual: boolean = translateShiftToken(controller, tokens[i]);
        expect(actual).assertTrue();
      }

      expect(tokens.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0400
     * @tc.name      testControllerStateTest001Test_021
     * @tc.desc      Verify that no near-miss token is consumed by the Shift stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_021 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["KEYCODE_SHIFT", "KEYCODE_SHIFT_LEF", "KEYCODE_SHIFT_LEFT_", "shift_left", "shift_right", "", "a", "A", "0", " ", "KEYCODE_ALT_LEFT", "KEYCODE_ALT_RIGHT", "KEYCODE_CTRL_LEFT", "KEYCODE_DEL", "KEYCODE_FORWARD_DEL", "KEYCODE_DPAD_UP", "KEYCODE_DELETE", "KEYCODE_SHIFT_LEFT_KEY", "KEYCODE_SHIFT_RIGHT_KEY", "KEYCODE_SHIFTLEFT", "KEYCODE_SHIFTRIGHT", "KEYCODE_SHIFT_LEFT ", " KEYCODE_SHIFT_LEFT", "KEYCODE_SHIFT_LEFT.", "KEYCODE_shift_left", "KEYCODE_SHIFT_Left", "?123", "ABC", "=/<", ",", ".", "KEYCODE_ENTER", "KEYCODE_TAB", "KEYCODE_BACKSPACE", "KEYCODE_SPACE", "KEYCODE_CTRL_RIGHT", "KEYCODE_META_LEFT", "KEYCODE_META_RIGHT", "KEYCODE_CAPS_LOCK", "KEYCODE_NUM_LOCK", "KEYCODE_SCROLL_LOCK"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      let i: number = 0;
      while (i < tokens.length) {
        const actual: boolean = translateShiftToken(controller, tokens[i]);
        expect(actual).assertFalse();
        i = i + 1;
      }

      expect(tokens.length).assertEqual(41);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0500
     * @tc.name      testControllerStateTest001Test_022
     * @tc.desc      Verify that fresh controller reports no shift hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_022 begin');

      const controller: KeyboardController = createKeyboardController();
      // no key has been pressed yet.
      // isShiftKeyHold looks at the first held code; release order matters for multi-key sequences.
      const expected: boolean = false;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0600
     * @tc.name      testControllerStateTest001Test_023
     * @tc.desc      Verify that left shift press is remembered as a hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_023 begin');

      const controller: KeyboardController = createKeyboardController();
      // The hold must appear on press and disappear on release.
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0700
     * @tc.name      testControllerStateTest001Test_024
     * @tc.desc      Verify that right shift press is remembered as a hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_024 begin');

      const controller: KeyboardController = createKeyboardController();
      // A letter accepted while right shift is held must not clear the hold.
      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0800
     * @tc.name      testControllerStateTest001Test_025
     * @tc.desc      Verify that a leading letter press is not a shift hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_025 begin');

      const controller: KeyboardController = createKeyboardController();
      // a letter is pressed first.
      pressHardKey(controller, 2017);
      const expected: boolean = false;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      releaseHardKey(controller, 2017);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_0900
     * @tc.name      testControllerStateTest001Test_026
     * @tc.desc      Verify that shift after a letter does not become the leading key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_026 begin');

      const controller: KeyboardController = createKeyboardController();
      // the letter is still the first held code.
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2047);
      const expected: boolean = false;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      releaseHardKey(controller, 2047);
      releaseHardKey(controller, 2017);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1000
     * @tc.name      testControllerStateTest001Test_027
     * @tc.desc      Verify that shift followed by a letter keeps the hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_027 begin');

      const controller: KeyboardController = createKeyboardController();
      // Releasing shift first clears the hold even while the letter is still held.
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1100
     * @tc.name      testControllerStateTest001Test_028
     * @tc.desc      Verify that releasing the letter preserves the shift hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_028 begin');

      const controller: KeyboardController = createKeyboardController();
      // only shift remains pressed.
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      const expected: boolean = true;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      releaseHardKey(controller, 2047);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1200
     * @tc.name      testControllerStateTest001Test_029
     * @tc.desc      Verify that releasing both keys clears the shift hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_029 begin');

      const controller: KeyboardController = createKeyboardController();
      // the key stack is empty.
      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      const releaseRun0: number[] = [2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      const expected: boolean = false;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1300
     * @tc.name      testControllerStateTest001Test_030
     * @tc.desc      Verify that shift followed by a digit keeps the hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_030 begin');

      const controller: KeyboardController = createKeyboardController();
      const shiftKey: number = 2047;
      const digitKey: number = 2001;
      // The blocked digit leaves the hold armed until shift itself is released.
      expect(pressHardKey(controller, shiftKey)).assertFalse();
      expect(pressHardKey(controller, digitKey)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, digitKey)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, shiftKey)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1400
     * @tc.name      testControllerStateTest001Test_031
     * @tc.desc      Verify that repeated shift down does not duplicate the held code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_031 begin');

      const controller: KeyboardController = createKeyboardController();
      // the same code is reported twice.
      const pressRun0: number[] = [2047, 2047];
      for (const pressCode of pressRun0) {
        pressHardKey(controller, pressCode);
      }
      const expected: boolean = true;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      releaseHardKey(controller, 2047);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1500
     * @tc.name      testControllerStateTest001Test_032
     * @tc.desc      Verify that releasing shift alone clears the hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_032 begin');

      const controller: KeyboardController = createKeyboardController();
      // the only held key is shift.
      pressHardKey(controller, 2047);
      releaseHardKey(controller, 2047);
      const expected: boolean = false;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_STAGE_1600
     * @tc.name      testControllerStateTest001Test_033
     * @tc.desc      Verify that releasing a non-held code does not create a hold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_033 begin');

      const controller: KeyboardController = createKeyboardController();
      // no key was pressed.
      releaseHardKey(controller, 2047);
      const expected: boolean = false;

      const actual: boolean = isShiftHeld(controller);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      expect(actual).assertEqual(expected);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0100
     * @tc.name      testControllerStateTest001Test_034
     * @tc.desc      Verify that two held letters both insert before either is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_034 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(pressHardKey(controller, 2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0200
     * @tc.name      testControllerStateTest001Test_035
     * @tc.desc      Verify that a held letter and a held digit both insert.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_035 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2001)).assertTrue();
      expect(editorRef.insertedTexts.join('')).assertEqual('a1');
      const releaseRun0: number[] = [2001, 2017];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.journal[1]).assertEqual('insert:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0300
     * @tc.name      testControllerStateTest001Test_036
     * @tc.desc      Verify that a held letter and a function key produce an insert and a move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_036 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2012)).assertTrue();
      releaseHardKey(controller, 2012);
      releaseHardKey(controller, 2017);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|move:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0400
     * @tc.name      testControllerStateTest001Test_037
     * @tc.desc      Verify that a held letter plus an unmapped code latches until both are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_037 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(pressHardKey(controller, 2049)).assertEqual(false);
      expect(pressHardKey(controller, 2018)).assertEqual(false);
      const releaseRun0: number[] = [2018, 2049, 2017];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(pressHardKey(controller, 2019)).assertEqual(true);
      releaseHardKey(controller, 2019);
      expect(harness.client.insertedTexts.join('')).assertEqual('ac');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0500
     * @tc.name      testControllerStateTest001Test_038
     * @tc.desc      Verify that two held digits both insert.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_038 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2001)).assertTrue();
      expect(pressHardKey(controller, 2002)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('12');
      releaseHardKey(controller, 2002);
      releaseHardKey(controller, 2001);

      expect(harness.client.insertedTexts[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_038 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0600
     * @tc.name      testControllerStateTest001Test_039
     * @tc.desc      Verify that a held digit and a function key produce an insert and a move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_039 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2001)).assertTrue();
      expect(pressHardKey(controller, 2013)).assertTrue();
      const releaseRun0: number[] = [2013, 2001];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.journal.join('|')).assertEqual('insert:1|move:2');

      expect(editorRef.movedDirections[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_039 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0700
     * @tc.name      testControllerStateTest001Test_040
     * @tc.desc      Verify that a shift key held after a letter never becomes the leading key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_040 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);
      expect(pressHardKey(controller, 2018)).assertEqual(true);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2047);
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_040 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0800
     * @tc.name      testControllerStateTest001Test_041
     * @tc.desc      Verify that shift plus a function key latches without a command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_041 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2012)).assertFalse();
      const releaseRun0: number[] = [2012, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_041 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_0900
     * @tc.name      testControllerStateTest001Test_042
     * @tc.desc      Verify that alt plus a function key still routes the function command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_042 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertFalse();
      expect(pressHardKey(controller, 2012)).assertTrue();
      releaseHardKey(controller, 2012);
      releaseHardKey(controller, 2045);
      expect(harness.client.movedDirections[0]).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_042 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_1000
     * @tc.name      testControllerStateTest001Test_043
     * @tc.desc      Verify that two held function keys produce two ordered cursor commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_043 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2012)).assertEqual(true);
      expect(pressHardKey(controller, 2013)).assertEqual(true);
      const releaseRun0: number[] = [2013, 2012];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(editorRef.movedDirections.join('|')).assertEqual('1|2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_043 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_1100
     * @tc.name      testControllerStateTest001Test_044
     * @tc.desc      Verify that three held letters all insert in their physical order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_044 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const heldLetters: number[] = [2017, 2018, 2019];
      for (let i = 0; i < heldLetters.length; i++) {
        expect(pressHardKey(controller, heldLetters[i])).assertTrue();
      }
      for (let i = heldLetters.length - 1; i >= 0; i--) {
        releaseHardKey(controller, heldLetters[i]);
      }
      expect(harness.client.journal.length).assertEqual(3);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_044 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_HELD_KEY_MATRIX_1200
     * @tc.name      testControllerStateTest001Test_045
     * @tc.desc      Verify that a digit and an unmapped code latch until both are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_045 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2001)).assertTrue();
      expect(pressHardKey(controller, 3000)).assertFalse();
      expect(pressHardKey(controller, 2002)).assertFalse();
      const releaseRun0: number[] = [2002, 3000, 2001];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(pressHardKey(controller, 2003)).assertTrue();
      releaseHardKey(controller, 2003);
      expect(harness.client.insertedTexts.join('')).assertEqual('13');

      expect(harness.client.journal.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_045 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0100
     * @tc.name      testControllerStateTest001Test_046
     * @tc.desc      Verify that releasing a letter before shift keeps the next letter uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_046 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertEqual(false);
      const tapPlan0: number[] = [2017, 2018];
      for (let i = 0; i < tapPlan0.length; i++) {
        tapExpect(controller, tapPlan0[i], true, false);
      }
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');
      expect(isShiftHeld(controller)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_046 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0200
     * @tc.name      testControllerStateTest001Test_047
     * @tc.desc      Verify that releasing two held letters in reverse order keeps both uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_047 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const pressRun0: number[] = [2047, 2017, 2018];
      for (const pressCode of pressRun0) {
        pressHardKey(controller, pressCode);
      }
      const releaseOrder: number[] = [2018, 2017, 2047];
      let i: number = 0;
      while (i < releaseOrder.length) {
        expect(releaseHardKey(controller, releaseOrder[i])).assertFalse();
        i = i + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual('AB');
      expect(editorRef.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_047 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0300
     * @tc.name      testControllerStateTest001Test_048
     * @tc.desc      Verify that releasing shift before the held letter emits no extra command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_048 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      pressHardKey(controller, 2017);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.join('|')).assertEqual('insert:A');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_048 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0400
     * @tc.name      testControllerStateTest001Test_049
     * @tc.desc      Verify that releasing alt before the held letter emits no extra command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_049 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertEqual(false);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(releaseHardKey(controller, 2045)).assertEqual(false);
      expect(releaseHardKey(controller, 2017)).assertEqual(false);
      expect(harness.client.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_049 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0500
     * @tc.name      testControllerStateTest001Test_050
     * @tc.desc      Verify that releasing the first of two held letters allows the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_050 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const firstPair: number[] = [2017, 2018];
      for (let i = 0; i < firstPair.length; i++) {
        expect(pressHardKey(controller, firstPair[i])).assertTrue();
      }
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertTrue();
      releaseHardKey(controller, 2019);
      releaseHardKey(controller, 2018);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_050 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0600
     * @tc.name      testControllerStateTest001Test_051
     * @tc.desc      Verify that the latch clears only after the last held key is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_051 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 0)).assertFalse();
      tapExpect(controller, 2018, false, false);
      expect(releaseHardKey(controller, 0)).assertFalse();
      tapExpect(controller, 2019, false, false);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertTrue();
      releaseHardKey(controller, 2018);
      expect(editorRef.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_051 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0700
     * @tc.name      testControllerStateTest001Test_052
     * @tc.desc      Verify that a three-key shift path inserts the third key and recovers after release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_052 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      pressHardKey(controller, 2017);
      tapExpect(controller, 2001, true, false);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(pressHardKey(controller, 2001)).assertEqual(true);
      releaseHardKey(controller, 2001);
      releaseHardKey(controller, 2017);
      expect(harness.client.journal.join('|')).assertEqual('insert:A|insert:1|insert:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_052 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0800
     * @tc.name      testControllerStateTest001Test_053
     * @tc.desc      Verify that an alt key added as the third held key does not arm the latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_053 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const pressRun1: number[] = [2047, 2017];
      for (const pressCode of pressRun1) {
        pressHardKey(controller, pressCode);
      }
      tapExpect(controller, 2045, false, false);
      expect(pressHardKey(controller, 2018)).assertTrue();
      const releaseRun0: number[] = [2018, 2017, 2047];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.journal.join('|')).assertEqual('insert:A|insert:B');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_053 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_0900
     * @tc.name      testControllerStateTest001Test_054
     * @tc.desc      Verify that two shift keys keep the latch until both are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_054 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2048)).assertFalse();
      tapExpect(controller, 2017, false, false);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2017, false, false);
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      releaseHardKey(controller, 2017);
      expect(harness.client.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_054 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_1000
     * @tc.name      testControllerStateTest001Test_055
     * @tc.desc      Verify that a blocked punctuation recovers after shift and punctuation are both released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_055 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      expect(pressHardKey(controller, 2043)).assertEqual(false);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(releaseHardKey(controller, 2043)).assertEqual(false);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      releaseHardKey(controller, 2017);
      expect(editorRef.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_055 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_1100
     * @tc.name      testControllerStateTest001Test_056
     * @tc.desc      Verify that releasing shift first still keeps two held letters uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_056 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      pressHardKey(controller, 2017);
      pressHardKey(controller, 2018);
      const shiftFirstRelease: number[] = [2047, 2017, 2018];
      for (let i = 0; i < shiftFirstRelease.length; i++) {
        expect(releaseHardKey(controller, shiftFirstRelease[i])).assertFalse();
      }
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_056 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_RELEASE_ORDER_1200
     * @tc.name      testControllerStateTest001Test_057
     * @tc.desc      Verify that releasing a never-pressed code inside a multi-key hold changes no state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_057 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const liveKeys: number[] = [2017, 2018];
      let i: number = 0;
      while (i < liveKeys.length) {
        expect(pressHardKey(controller, liveKeys[i])).assertTrue();
        i = i + 1;
      }
      expect(releaseHardKey(controller, 9999)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertTrue();
      const releaseRun0: number[] = [2019, 2018, 2017];
      let relIdx0: number = 0;
      while (relIdx0 < releaseRun0.length) {
        releaseHardKey(controller, releaseRun0[relIdx0]);
        relIdx0 = relIdx0 + 1;
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_057 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0100
     * @tc.name      testControllerStateTest001Test_058
     * @tc.desc      Verify that a CJK token takes the insert branch unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_058 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '中文', 9999)).assertEqual(true);
      expect(harness.client.insertedTexts[0]).assertEqual('中文');
      expect(harness.client.journal.join('|')).assertEqual('insert:中文');

      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(20013);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_058 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0200
     * @tc.name      testControllerStateTest001Test_059
     * @tc.desc      Verify that an emoji token takes the insert branch unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_059 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '😀', 9999)).assertTrue();
      expect(editorRef.insertedTexts[0]).assertEqual('😀');
      expect(editorRef.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_059 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0300
     * @tc.name      testControllerStateTest001Test_060
     * @tc.desc      Verify that a long token is inserted as one command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_060 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      let payload: string = '';
      for (let i = 0; i < 1024; i++) {
        payload = payload + 'q';
      }
      expect(inputHardKeyValue(controller, payload, 9999)).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(1024);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_060 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0400
     * @tc.name      testControllerStateTest001Test_061
     * @tc.desc      Verify that an empty token still takes the insert branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_061 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, '', 9999)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('');
      expect(harness.client.journal.join('|')).assertEqual('insert:');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_061 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0500
     * @tc.name      testControllerStateTest001Test_062
     * @tc.desc      Verify that a whitespace token is inserted literally.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_062 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, ' ', 2050)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.journal.join('|')).assertEqual('insert: ');

      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_062 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0600
     * @tc.name      testControllerStateTest001Test_063
     * @tc.desc      Verify that function-token matching is case sensitive.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_063 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'keycode_del', 9999)).assertTrue();
      expect(editorRef.insertedTexts[0]).assertEqual('keycode_del');
      expect(editorRef.forwardLengths.length).assertEqual(0);

      expect(editorRef.journal.join('|')).assertEqual('insert:keycode_del');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_063 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0700
     * @tc.name      testControllerStateTest001Test_064
     * @tc.desc      Verify that a near-miss function token is inserted instead of dispatched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_064 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL_KEY', 9999)).assertEqual(true);
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_DEL_KEY');
      expect(harness.client.forwardLengths.length).assertEqual(0);

      expect(harness.client.insertedTexts[0].indexOf('KEYCODE_DEL')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_064 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0800
     * @tc.name      testControllerStateTest001Test_065
     * @tc.desc      Verify that control whitespace inside a token is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_065 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const payload: string = 'a\tb\nc';
      expect(inputHardKeyValue(controller, payload, 9999)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual(payload);
      expect(harness.client.insertedTexts[0].indexOf('\t') > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_065 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_PAYLOAD_0900
     * @tc.name      testControllerStateTest001Test_066
     * @tc.desc      Verify that the DEL token routes to the function stage and not to insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateTest001Test_066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_066 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_066 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0100
     * @tc.name      testControllerStateTest001Test_067
     * @tc.desc      Verify that one hundred held unknown codes release in reverse order and recover.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_068 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      for (let code = 3000; code < 3100; code++) {
        expect(pressHardKey(controller, code)).assertEqual(false);
      }
      for (let code = 3099; code >= 3000; code--) {
        expect(releaseHardKey(controller, code)).assertEqual(false);
      }
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      releaseHardKey(controller, 2017);
      expect(editorRef.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_068 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0200
     * @tc.name      testControllerStateTest001Test_068
     * @tc.desc      Verify that one hundred held unknown codes release in forward order and recover.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_069 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      for (let code = 3000; code < 3100; code++) {
        pressHardKey(controller, code);
      }
      for (let code = 3000; code < 3100; code++) {
        releaseHardKey(controller, code);
      }
      expect(isShiftHeld(controller)).assertFalse();
      expect(pressHardKey(controller, 2001)).assertTrue();
      releaseHardKey(controller, 2001);
      expect(harness.client.journal.join('|')).assertEqual('insert:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_069 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0300
     * @tc.name      testControllerStateTest001Test_069
     * @tc.desc      Verify that ten duplicate downs insert ten times and one up releases the key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_070 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      let i: number = 0;
      while (i < 10) {
        expect(pressHardKey(controller, 2017)).assertTrue();
        i = i + 1;
      }
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts.length).assertEqual(11);
      expect(harness.client.journal.length).assertEqual(11);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_070 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0400
     * @tc.name      testControllerStateTest001Test_070
     * @tc.desc      Verify five held letters released in reverse order keep all five insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_071 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      for (let code = 2017; code <= 2021; code++) {
        expect(pressHardKey(controller, code)).assertEqual(true);
      }
      for (let code = 2021; code >= 2017; code--) {
        expect(releaseHardKey(controller, code)).assertEqual(false);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abcde');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_071 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0500
     * @tc.name      testControllerStateTest001Test_071
     * @tc.desc      Verify five held letters released in forward order keep all five insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest001Test_071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_072 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      let i: number = 0;
      while (i < 5) {
        expect(pressHardKey(controller, 2017 + i)).assertTrue();
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < 5) {
        expect(releaseHardKey(controller, 2017 + iW1)).assertFalse();
        iW1 = iW1 + 1;
      }
      expect(editorRef.insertedTexts.join('')).assertEqual('abcde');
      expect(editorRef.journal.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest001Test_072 end');
      await yieldToEventLoop();
    });

  });

}
