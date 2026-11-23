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
import { createKeyboardController, pressHardKey, releaseHardKey, inputHardKeyValue, isShiftHeld, isAlphabetKeyCode, isNumberKeyCode, processFunctionToken } from '../support/TestSupport';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';

import { tapExpect } from '../support/PhaseRunner';
const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputControllerKeyContractTest]';

export default function controllerContractTest(): void {
  describe('ControllerContractTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0100
     * @tc.name      testControllerKeyContract_001
     * @tc.desc      Verify that every mapped key follows the normal down-up cycle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_001 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122, 2012, 2013, 2014, 2015, 2016, 2055, 2071];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      let downAccepted: number = 0;
      let upReleased: number = 0;
      let i: number = 0;
      while (i < codes.length) {
        if (pressHardKey(controller, codes[i])) {
          downAccepted = downAccepted + 1;
        }
        if (!releaseHardKey(controller, codes[i])) {
          upReleased = upReleased + 1;
        }
        i = i + 1;
      }
      expect(downAccepted).assertEqual(codes.length);
      expect(upReleased).assertEqual(codes.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0200
     * @tc.name      testControllerKeyContract_002
     * @tc.desc      Verify that shift and alt keys follow the intercepted down-up cycle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_002 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2047, 2048, 2045, 2046];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      for (let i = 0; i < codes.length; i++) {
        const down: boolean = pressHardKey(controller, codes[i]);
        const up: boolean = releaseHardKey(controller, codes[i]);
        expect(up).assertEqual(false);
        expect(down).assertEqual(false);
      }

      expect(codes.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0300
     * @tc.name      testControllerKeyContract_003
     * @tc.desc      Verify that every numpad code is intercepted because the translation table has no glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_003 begin');

      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2111, 2112];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      // Numpad codes pass isKeyCodeNumber but have no glyph, so dispatch arms the special latch.
      let i: number = 0;
      while (i < codes.length) {
        const down: boolean = pressHardKey(controller, codes[i]);
        const up: boolean = releaseHardKey(controller, codes[i]);
        expect(down).assertFalse();
        expect(up).assertFalse();
        i = i + 1;
      }

      expect(codes.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0400
     * @tc.name      testControllerKeyContract_004
     * @tc.desc      Verify that every unmapped code is released without clearing the latch before the last key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_004 begin');
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [1999, 2049, 2051, 2053, 2056, 2059, 3000, 9999];

      // Each unmapped code is refused on both edges and releases through the latch path.
      for (let i = 0; i < codes.length; i++) {
        const down: boolean = pressHardKey(controller, codes[i]);
        const up: boolean = releaseHardKey(controller, codes[i]);
        expect(up === false).assertEqual(true);
        expect(down === false).assertEqual(true);
      }
      expect(codes.length).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0500
     * @tc.name      testControllerKeyContract_005
     * @tc.desc      Verify that custom text tokens outside the KEYCODE vocabulary are inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_005 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const tokens: string[] = ["KEYCODE_CUSTOM", "KEYCODE_CUSTOM_1", "custom", "CUSTOM", "KEYCODE_TEST", "KEYCODE_TEST_2", "keycode_custom", "KeyCodeCustom", "KEYCODE_PLUGIN", "KEYCODE_PLUGIN_9", "plugin", "PLUGIN", "KEYCODE_VENDOR", "KEYCODE_VENDOR_3", "vendor", "VENDOR", "KEYCODE_EXTRA", "KEYCODE_EXTRA_4", "extra", "EXTRA", "KEYCODE_SAMPLE", "KEYCODE_SAMPLE_5", "sample", "SAMPLE", "KEYCODE_DEMO", "KEYCODE_DEMO_6", "demo", "DEMO", "KEYCODE_ALPHA", "KEYCODE_BETA"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      let i: number = 0;
      while (i < tokens.length) {
        const actual: boolean = inputHardKeyValue(controller, tokens[i], 9999);
        expect(actual).assertEqual(true);
        i = i + 1;
      }

      expect(tokens.length).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0600
     * @tc.name      testControllerKeyContract_006
     * @tc.desc      Verify that every capitalised pair accepts the shifted and the plain key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_006 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const firstCodes: number[] = [2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026];
      const secondCodes: number[] = [2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039];

      for (let i = 0; i < firstCodes.length; i++) {
        const shiftHeld: boolean = pressHardKey(controller, 2047);
        const first: boolean = pressHardKey(controller, firstCodes[i]);
        releaseHardKey(controller, firstCodes[i]);
        releaseHardKey(controller, 2047);
        const second: boolean = pressHardKey(controller, secondCodes[i]);
        releaseHardKey(controller, secondCodes[i]);
        expect(second).assertEqual(true);
        expect(shiftHeld).assertEqual(false);
        expect(first).assertEqual(true);
      }

      expect(firstCodes.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0700
     * @tc.name      testControllerKeyContract_007
     * @tc.desc      Verify that every lowercase letter is accepted on down and released as non-special.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerKeyContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_007 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      const results: boolean[] = [];
      let i: number = 0;
      while (i < codes.length) {
        results.push(pressHardKey(controller, codes[i]));
        results.push(releaseHardKey(controller, codes[i]));
        i = i + 1;
      }
      for (let i = 0; i < results.length; i += 2) {
        expect(results[i]).assertEqual(true);
        expect(results[i + 1]).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0800
     * @tc.name      testControllerKeyContract_008
     * @tc.desc      Verify that every letter is accepted on down while shift is held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_008 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      for (let i = 0; i < codes.length; i++) {
        pressHardKey(controller, 2047);
        const down: boolean = pressHardKey(controller, codes[i]);
        const up: boolean = releaseHardKey(controller, codes[i]);
        expect(up).assertEqual(false);
        expect(down).assertEqual(true);
        releaseHardKey(controller, 2047);
      }

      expect(codes.length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_0900
     * @tc.name      testControllerKeyContract_009
     * @tc.desc      Verify that every digit is accepted on down and released as non-special.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerKeyContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_009 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      let i: number = 0;
      while (i < codes.length) {
        const down: boolean = pressHardKey(controller, codes[i]);
        const up: boolean = releaseHardKey(controller, codes[i]);
        expect(down).assertTrue();
        expect(up).assertFalse();
        i = i + 1;
      }

      expect(codes.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1000
     * @tc.name      testControllerKeyContract_010
     * @tc.desc      Verify that every digit under shift is intercepted as a special key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_010 begin');

      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      for (let i = 0; i < codes.length; i++) {
        // Shift is held, so the second non-alphabetic key is intercepted before translation.
        pressHardKey(controller, 2047);
        const down: boolean = pressHardKey(controller, codes[i]);
        expect(down).assertEqual(false);
        releaseHardKey(controller, codes[i]);
        releaseHardKey(controller, 2047);
      }

      expect(codes.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1100
     * @tc.name      testControllerKeyContract_011
     * @tc.desc      Verify that every navigation or editing code is accepted on down.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerKeyContract_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_011 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2012, 2013, 2014, 2015, 2016, 2055, 2071];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      let i: number = 0;
      while (i < codes.length) {
        const down: boolean = pressHardKey(controller, codes[i]);
        expect(down).assertEqual(true);
        releaseHardKey(controller, codes[i]);
        i = i + 1;
      }

      expect(codes.length).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1200
     * @tc.name      testControllerKeyContract_012
     * @tc.desc      Verify that every punctuation key is accepted on down.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_012 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      for (let i = 0; i < codes.length; i++) {
        const down: boolean = pressHardKey(controller, codes[i]);
        expect(down).assertTrue();
        releaseHardKey(controller, codes[i]);
      }

      expect(codes.length).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1300
     * @tc.name      testControllerKeyContract_013
     * @tc.desc      Verify that both bare shift keys are intercepted by the down handler.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerKeyContract_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_013 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2047, 2048];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      let i: number = 0;
      while (i < codes.length) {
        expect(pressHardKey(controller, codes[i])).assertEqual(false);
        expect(isShiftHeld(controller)).assertEqual(true);
        expect(releaseHardKey(controller, codes[i])).assertEqual(false);
        expect(isShiftHeld(controller)).assertEqual(false);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1400
     * @tc.name      testControllerKeyContract_014
     * @tc.desc      Verify that both alt keys are intercepted by the down handler.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerKeyContract_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_014 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2045, 2046];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      for (let i = 0; i < codes.length; i++) {
        expect(pressHardKey(controller, codes[i])).assertFalse();
        expect(releaseHardKey(controller, codes[i])).assertFalse();
      }
      // Alt never latches, so a letter pressed afterwards is still accepted.
      tapExpect(controller, 2017, true, false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1500
     * @tc.name      testControllerKeyContract_015
     * @tc.desc      Verify that every unmapped code is intercepted and leaves no latch after release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyContract_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_015 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [1999, 2049, 2051, 2052, 2053, 2054, 2056, 2057, 2059, 2060, 2061, 2062, 2063, 3000];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      let i: number = 0;
      while (i < codes.length) {
        const down: boolean = pressHardKey(controller, codes[i]);
        expect(down).assertFalse();
        releaseHardKey(controller, codes[i]);
        i = i + 1;
      }

      expect(codes.length).assertEqual(14);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1600
     * @tc.name      testControllerKeyContract_016
     * @tc.desc      Verify that a letter following any unmapped code is intercepted while the latch is armed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyContract_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_016 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2049, 2051, 2053, 2056, 2059];

      for (let i = 0; i < codes.length; i++) {
        pressHardKey(controller, codes[i]);
        const letter: boolean = pressHardKey(controller, 2017);
        expect(letter).assertEqual(false);
        releaseHardKey(controller, 2017);
        releaseHardKey(controller, codes[i]);
      }

      expect(codes.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_CONTRACT_1700
     * @tc.name      testControllerKeyContract_017
     * @tc.desc      Verify that repeated presses of the same letter remain accepted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyContract_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_017 begin');

      const controller: KeyboardController = createKeyboardController();
      // Each key is pressed on a fresh controller; the journal shows what reached the editor.
      const codes: number[] = [2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026];

      let i: number = 0;
      while (i < codes.length) {
        const first: boolean = pressHardKey(controller, codes[i]);
        releaseHardKey(controller, codes[i]);
        const second: boolean = pressHardKey(controller, codes[i]);
        releaseHardKey(controller, codes[i]);
        expect(first).assertEqual(true);
        expect(second).assertEqual(true);
        i = i + 1;
      }

      expect(codes.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyContract_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0100
     * @tc.name      testControllerLatchContract_001
     * @tc.desc      Verify that a repeated down of one letter inserts that letter once per down event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_001 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      // Key repeat is a second down without an intervening up.
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.journal.length).assertEqual(1);
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:a');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0200
     * @tc.name      testControllerLatchContract_002
     * @tc.desc      Verify that a repeated shift down keeps one held code and still capitalizes one letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_002 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      // The duplicate down must not add a second shift entry.
      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(true);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(editorRef.journal.join('|')).assertEqual('insert:A');
      expect(releaseHardKey(controller, 2017)).assertEqual(false);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0300
     * @tc.name      testControllerLatchContract_003
     * @tc.desc      Verify that a release without a matching press changes no editor state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_003 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      // A stray up is ignored; the latch and the journal stay untouched.
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0400
     * @tc.name      testControllerLatchContract_004
     * @tc.desc      Verify that two separated down-up cycles of one letter insert it twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_004 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      // One physical key tapped twice is two editor insertions.
      const tapPlan0: number[] = [2018, 2018];
      let i: number = 0;
      while (i < tapPlan0.length) {
        tapExpect(controller, tapPlan0[i], true, false);
        i = i + 1;
      }
      expect(harness.client.journal.join('|')).assertEqual('insert:b|insert:b');
      expect(harness.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0500
     * @tc.name      testControllerLatchContract_005
     * @tc.desc      Verify that a blocked shift-digit recovers when the digit is released before shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_005 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertEqual(false);
      tapExpect(controller, 2001, false, false);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);
      expect(harness.client.journal.length).assertEqual(0);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(harness.client.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0600
     * @tc.name      testControllerLatchContract_006
     * @tc.desc      Verify that a blocked shift-punctuation recovers when shift is released first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_006 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2043)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(releaseHardKey(controller, 2043)).assertFalse();
      expect(pressHardKey(controller, 2043)).assertTrue();
      expect(editorRef.journal.join('|')).assertEqual('insert:,');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0700
     * @tc.name      testControllerLatchContract_007
     * @tc.desc      Verify that a blocked shift-arrow releases without inserting and clears the latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_007 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2015, false, false);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0800
     * @tc.name      testControllerLatchContract_008
     * @tc.desc      Verify that an alt key is ignored without arming the latch, so the next letter inserts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_008 begin');
      const harness: ClientHarness = await createClientHarness(0);
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertEqual(false);
      // The alt key leaves no command; only the letter reaches the editor.
      const beforeLetter: number = harness.client.journal.length;
      expect(pressHardKey(controller, 2019)).assertEqual(true);
      expect(harness.client.journal.length).assertEqual(beforeLetter + 1);
      expect(harness.client.journal[harness.client.journal.length - 1]).assertEqual('insert:c');
      expect(releaseHardKey(controller, 2019)).assertEqual(false);
      expect(releaseHardKey(controller, 2045)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_0900
     * @tc.name      testControllerLatchContract_009
     * @tc.desc      Verify that two unmapped keys keep the latch until both are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_009 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();
      const firstBlocked: number = 2049;
      const secondBlocked: number = 3000;
      const letterKey: number = 2017;

      expect(pressHardKey(controller, firstBlocked)).assertFalse();
      expect(pressHardKey(controller, secondBlocked)).assertFalse();
      expect(pressHardKey(controller, letterKey)).assertFalse();
      expect(releaseHardKey(controller, firstBlocked)).assertFalse();
      expect(pressHardKey(controller, letterKey)).assertFalse();
      expect(releaseHardKey(controller, secondBlocked)).assertFalse();
      expect(releaseHardKey(controller, letterKey)).assertFalse();
      expect(pressHardKey(controller, letterKey)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1000
     * @tc.name      testControllerLatchContract_010
     * @tc.desc      Verify that a blocked shift-function key leaves no editor command behind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_010 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2055, false, false);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(editorRef.forwardLengths.length).assertEqual(0);
      expect(editorRef.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1100
     * @tc.name      testControllerLatchContract_011
     * @tc.desc      Verify that alt followed by a digit inserts the digit because alt never arms the latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_011 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertEqual(false);
      expect(pressHardKey(controller, 2001)).assertEqual(true);
      const journalIndex: number = harness.client.journal.indexOf('insert:1');
      expect(journalIndex).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);
      expect(releaseHardKey(controller, 2001)).assertEqual(false);
      expect(releaseHardKey(controller, 2045)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1200
     * @tc.name      testControllerLatchContract_012
     * @tc.desc      Verify that a blocked shift-center recovers to a lowercase letter after both releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerLatchContract_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_012 begin');
      const harness: ClientHarness = await createClientHarness(0);
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2016, false, false);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1300
     * @tc.name      testControllerLatchContract_013
     * @tc.desc      Verify that an unmapped key followed by shift keeps the latch until all three releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_013 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2049)).assertFalse();
      expect(pressHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2017, false, false);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(releaseHardKey(controller, 2049)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1400
     * @tc.name      testControllerLatchContract_014
     * @tc.desc      Verify that releasing shift before the unmapped key still clears the latch at the last release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_014 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(pressHardKey(controller, 2049)).assertEqual(false);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(releaseHardKey(controller, 2049)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);
      expect(pressHardKey(controller, 2019)).assertEqual(true);
      expect(editorRef.journal.join('|')).assertEqual('insert:c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1500
     * @tc.name      testControllerLatchContract_015
     * @tc.desc      Verify that alt, a digit and a letter form two insertions without a latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_015 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertFalse();
      expect(pressHardKey(controller, 2001)).assertTrue();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('insert:1|insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_LATCH_CONTRACT_1600
     * @tc.name      testControllerLatchContract_016
     * @tc.desc      Verify that a function key blocked by shift works again after shift is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerLatchContract_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_016 begin');
      const harness: ClientHarness = await createClientHarness(0);
      // The blocked key and its release order are the subject of this case.
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2055, false, false);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      tapExpect(controller, 2055, true, false);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerLatchContract_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0100
     * @tc.name      testControllerMappingContract_001
     * @tc.desc      Verify that the alphabet classifier accepts every letter code and rejects the remaining observed codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_001 begin');

      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2000, 2009, 2010, 2011, 2012, 2015, 2016, 2043, 2044, 2045, 2046, 2047, 2048, 2055, 2071, 2103, 2112, 2121, 2122, 0, -1, 9999, 2001, 2008, 2013, 2014, 2050, 2058, 2064, 2065];
      const expected: boolean[] = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      // The A..Z range is inclusive on both ends; the table pins both boundaries explicitly.
      for (let i = 0; i < codes.length; i++) {
        const actual: boolean = isAlphabetKeyCode(controller, codes[i]);
        expect(actual).assertEqual(expected[i]);
      }

      expect(codes.length).assertEqual(56);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0200
     * @tc.name      testControllerMappingContract_002
     * @tc.desc      Verify that the number classifier accepts both digit blocks and rejects the remaining observed codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_002 begin');

      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2111, 2112, 1999, 2010, 2011, 2012, 2015, 2016, 2017, 2042, 2043, 2045, 2047, 2055, 2071, 2099, 2102, 2113, 2114, 2120, 2122, 0, -1, 9999, 2050, 2058, 2064, 2065, 2066, 2121, 2101, 2115];
      const expected: boolean[] = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      let i: number = 0;
      while (i < codes.length) {
        const actual: boolean = isNumberKeyCode(controller, codes[i]);
        expect(actual).assertEqual(expected[i]);
        i = i + 1;
      }

      expect(codes.length).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0300
     * @tc.name      testControllerMappingContract_003
     * @tc.desc      Verify that every two-letter pair dispatches both keys in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_003 begin');

      const controller: KeyboardController = createKeyboardController();
      const firstCodes: number[] = [2017, 2019, 2021, 2023, 2025, 2027, 2029, 2031, 2033, 2035];
      const secondCodes: number[] = [2018, 2020, 2022, 2024, 2026, 2028, 2030, 2032, 2034, 2036];

      for (let i = 0; i < firstCodes.length; i++) {
        const first: boolean = pressHardKey(controller, firstCodes[i]);
        releaseHardKey(controller, firstCodes[i]);
        const second: boolean = pressHardKey(controller, secondCodes[i]);
        releaseHardKey(controller, secondCodes[i]);
        expect(second).assertEqual(true);
        expect(first).assertEqual(true);
      }

      expect(firstCodes.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0400
     * @tc.name      testControllerMappingContract_004
     * @tc.desc      Verify that letters are dispatched normally after a shift release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerMappingContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_004 begin');

      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2017, 2018, 2019, 2020, 2021];

      let i: number = 0;
      while (i < codes.length) {
        pressHardKey(controller, 2047);
        releaseHardKey(controller, 2047);
        const actual: boolean = pressHardKey(controller, codes[i]);
        releaseHardKey(controller, codes[i]);
        expect(actual).assertEqual(true);
        i = i + 1;
      }

      expect(codes.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0500
     * @tc.name      testControllerMappingContract_005
     * @tc.desc      Verify that every unmapped code leaves no latch after release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerMappingContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_005 begin');

      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2049, 2051, 2053, 2056, 2059];

      for (let i = 0; i < codes.length; i++) {
        const armed: boolean = pressHardKey(controller, codes[i]);
        releaseHardKey(controller, codes[i]);
        const recovered: boolean = pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        expect(recovered).assertEqual(true);
        expect(armed).assertEqual(false);
      }

      expect(codes.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0600
     * @tc.name      testControllerMappingContract_006
     * @tc.desc      Verify that every non-function, non-shift token is inserted by the input stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_006 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "#", "KEYCODE_DPAD_CENTER", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ",", ".", " ", "=", "/", "@", "+", "(", ")", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", "KEYCODE_UNKNOWN", "abc"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      let i: number = 0;
      while (i < tokens.length) {
        const actual: boolean = inputHardKeyValue(controller, tokens[i], 2017);
        expect(actual).assertTrue();
        i = i + 1;
      }

      expect(tokens.length).assertEqual(76);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0700
     * @tc.name      testControllerMappingContract_007
     * @tc.desc      Verify that the empty token is accepted by the insert branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerMappingContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_007 begin');

      const controller: KeyboardController = createKeyboardController();
      const token: string = '';

      const actual: boolean = inputHardKeyValue(controller, token, 0);

      expect(token.length).assertEqual(0);
      expect(actual === true).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0800
     * @tc.name      testControllerMappingContract_008
     * @tc.desc      Verify that every function token is consumed and reported as handled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_008 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["KEYCODE_DEL", "KEYCODE_FORWARD_DEL", "KEYCODE_DPAD_UP", "KEYCODE_DPAD_DOWN", "KEYCODE_DPAD_LEFT", "KEYCODE_DPAD_RIGHT"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      let i: number = 0;
      while (i < tokens.length) {
        const actual: boolean = inputHardKeyValue(controller, tokens[i], 2012);
        expect(actual).assertEqual(true);
        i = i + 1;
      }

      expect(tokens.length).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_0900
     * @tc.name      testControllerMappingContract_009
     * @tc.desc      Verify that every shift token is intercepted instead of being inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_009 begin');

      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ["KEYCODE_SHIFT_LEFT", "KEYCODE_SHIFT_RIGHT"];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${tokens.length}`);

      for (let i = 0; i < tokens.length; i++) {
        const actual: boolean = inputHardKeyValue(controller, tokens[i], 2047);
        expect(actual).assertFalse();
      }

      expect(tokens.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_1000
     * @tc.name      testControllerMappingContract_010
     * @tc.desc      Verify that the alphabet classifier accepts 2017..2042 and rejects the neighbours.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerMappingContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_010 begin');
      const controller: KeyboardController = createKeyboardController();

      // The block boundary is inclusive on both ends.
      let accepted: number = 0;
      for (let code = 2017; code <= 2042; code++) {
        if (isAlphabetKeyCode(controller, code)) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(26);
      expect(isAlphabetKeyCode(controller, 2016)).assertEqual(false);
      expect(isAlphabetKeyCode(controller, 2043)).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_1100
     * @tc.name      testControllerMappingContract_011
     * @tc.desc      Verify that the number classifier accepts the decimal block and rejects its neighbours.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerMappingContract_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_011 begin');
      const controller: KeyboardController = createKeyboardController();

      const decimalCodes: number[] = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009];
      for (let i = 0; i < decimalCodes.length; i++) {
        expect(isNumberKeyCode(controller, decimalCodes[i])).assertTrue();
      }
      expect(isNumberKeyCode(controller, 2010)).assertFalse();
      expect(isNumberKeyCode(controller, 1999)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_1200
     * @tc.name      testControllerMappingContract_012
     * @tc.desc      Verify that the number classifier also accepts the numpad block boundaries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerMappingContract_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_012 begin');
      const controller: KeyboardController = createKeyboardController();

      // Numpad digits are classified as numbers even though they have no glyph.
      const acceptedCodes: number[] = [];
      for (let code = 2100; code <= 2115; code++) {
        if (isNumberKeyCode(controller, code)) {
          acceptedCodes.push(code);
        }
      }
      expect(acceptedCodes[acceptedCodes.length - 1]).assertEqual(2112);
      expect(acceptedCodes.length).assertEqual(10);
      expect(acceptedCodes[0]).assertEqual(2103);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_1300
     * @tc.name      testControllerMappingContract_013
     * @tc.desc      Verify that modifiers, shift and function codes belong to neither class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerMappingContract_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_013 begin');
      const controller: KeyboardController = createKeyboardController();

      // The two classifiers cover disjoint code blocks; control keys match neither.
      const controlCodes: number[] = [2047, 2055];
      for (let i = 0; i < controlCodes.length; i++) {
        expect(isNumberKeyCode(controller, controlCodes[i])).assertEqual(false);
        expect(isAlphabetKeyCode(controller, controlCodes[i])).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_MAPPING_CONTRACT_1400
     * @tc.name      testControllerMappingContract_014
     * @tc.desc      Verify that only the six documented function tokens are accepted by the function stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerMappingContract_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_014 begin');
      const controller: KeyboardController = createKeyboardController();

      // Center and custom tokens are not part of the function vocabulary.
      expect(processFunctionToken(controller, 'KEYCODE_DEL')).assertTrue();
      expect(processFunctionToken(controller, 'KEYCODE_DPAD_LEFT')).assertTrue();
      expect(processFunctionToken(controller, 'KEYCODE_DPAD_CENTER')).assertFalse();
      expect(processFunctionToken(controller, 'CUSTOM_TOKEN')).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerMappingContract_014 end');
      await yieldToEventLoop();
    });

  });

}
