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
import { GetHardKeyValue } from '../../../../main/ets/model/HardKeyUtils';
import { KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';
import { createKeyboardController, isAlphabetKeyCode, isNumberKeyCode, isShiftHeld, pressHardKey, releaseHardKey, sendKeyAction, sendKeyUpAction } from '../support/TestSupport';

import { tapExpect } from '../support/PhaseRunner';
const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputKeyCodeBoundary]';

const INT_MIN: number = -2147483648;

const INT_MAX: number = 2147483647;

function mappedCount(from: number, to: number): number {
  let count: number = 0;
  for (let code = from; code <= to; code++) {
    if (GetHardKeyValue(code, false) !== '') {
      count = count + 1;
    }
  }
  return count;
}

export default function boundaryTest(): void {
  describe('BoundaryTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0100
     * @tc.name      testKeyCodeBoundary_001
     * @tc.desc      Verify that the decimal block 2000..2009 maps to the ten digits in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyCodeBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_001 begin');

      const expected: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      let i: number = 0;
      while (i < expected.length) {
        expect(GetHardKeyValue(2000 + i, false)).assertEqual(expected[i]);
        i = i + 1;
      }
      // The block boundary must not leak into its neighbours.
      expect(GetHardKeyValue(1999, false)).assertEqual('');
      expect(GetHardKeyValue(2010, false)).assertEqual('*');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0200
     * @tc.name      testKeyCodeBoundary_002
     * @tc.desc      Verify that shift never changes the digit glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_002 begin');

      for (let code = 2000; code <= 2009; code++) {
        const plain: string = GetHardKeyValue(code, false);
        const shifted: string = GetHardKeyValue(code, true);
        expect(shifted.length).assertEqual(1);
        expect(shifted).assertEqual(plain);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0300
     * @tc.name      testKeyCodeBoundary_003
     * @tc.desc      Verify that shift never changes a punctuation or symbol glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_003 begin');

      const codes: number[] = [2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];
      let i: number = 0;
      while (i < codes.length) {
        const plain: string = GetHardKeyValue(codes[i], false);
        expect(GetHardKeyValue(codes[i], true)).assertEqual(plain);
        expect(plain.length).assertEqual(1);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0400
     * @tc.name      testKeyCodeBoundary_004
     * @tc.desc      Verify that the A..Z block maps to lowercase and uppercases only under shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyCodeBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_004 begin');

      let lowercaseCount: number = 0;
      for (let code = 2017; code <= 2042; code++) {
        const lower: string = GetHardKeyValue(code, false);
        const upper: string = GetHardKeyValue(code, true);
        expect(upper).assertEqual(lower.toUpperCase());
        expect(lower.length).assertEqual(1);
        if (lower === lower.toLowerCase()) {
          lowercaseCount = lowercaseCount + 1;
        }
      }
      expect(lowercaseCount).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0500
     * @tc.name      testKeyCodeBoundary_005
     * @tc.desc      Verify that function tokens are identical with and without shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_005 begin');

      const codes: number[] = [2012, 2013, 2014, 2015, 2016, 2055, 2071];
      let i: number = 0;
      while (i < codes.length) {
        const plain: string = GetHardKeyValue(codes[i], false);
        expect(plain.indexOf('KEYCODE_')).assertEqual(0);
        expect(GetHardKeyValue(codes[i], true)).assertEqual(plain);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0600
     * @tc.name      testKeyCodeBoundary_006
     * @tc.desc      Verify that every documented gap code yields an empty translation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_006 begin');

      const gaps: number[] = [2045, 2046, 2049, 2051, 2052, 2053, 2054, 2056, 2057,
        2059, 2060, 2061, 2062, 2063, 2067, 2068, 2069, 2070, 2072];
      for (let i = 0; i < gaps.length; i++) {
        expect(GetHardKeyValue(gaps[i], true)).assertEqual('');
        expect(GetHardKeyValue(gaps[i], false)).assertEqual('');
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0700
     * @tc.name      testKeyCodeBoundary_007
     * @tc.desc      Verify that extreme and negative codes stay unmapped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_007 begin');

      const extremes: number[] = [0, -1, INT_MIN, INT_MAX, 9999];
      let i: number = 0;
      while (i < extremes.length) {
        expect(GetHardKeyValue(extremes[i], false)).assertEqual('');
        expect(GetHardKeyValue(extremes[i], true)).assertEqual('');
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0800
     * @tc.name      testKeyCodeBoundary_008
     * @tc.desc      Verify that the numpad block is classified as numbers but has no glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeBoundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_008 begin');

      const numpad: number[] = [2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2111, 2112];
      for (let i = 0; i < numpad.length; i++) {
        expect(GetHardKeyValue(numpad[i], true)).assertEqual('');
        expect(GetHardKeyValue(numpad[i], false)).assertEqual('');
      }
      // The decimal block next door is mapped, which makes the empty window explicit.
      expect(GetHardKeyValue(2000, false)).assertEqual('0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_0900
     * @tc.name      testKeyCodeBoundary_009
     * @tc.desc      Verify that repeated lookups are deterministic across the whole range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_009 begin');

      let compared: number = 0;
      for (let code = 2000; code <= 2122; code = code + 7) {
        const first: string = GetHardKeyValue(code, false);
        const second: string = GetHardKeyValue(code, false);
        expect(second).assertEqual(first);
        compared = compared + 1;
      }
      expect(compared).assertEqual(18);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_1000
     * @tc.name      testKeyCodeBoundary_010
     * @tc.desc      Verify the two neighbours of the A..Z block in both shift states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeBoundary_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_010 begin');

      expect(GetHardKeyValue(2016, true)).assertEqual('KEYCODE_DPAD_CENTER');
      expect(GetHardKeyValue(2016, false)).assertEqual('KEYCODE_DPAD_CENTER');
      const firstLetter: string = GetHardKeyValue(2017, true);
      const lastLetter: string = GetHardKeyValue(2042, true);
      expect(lastLetter).assertEqual('Z');
      expect(GetHardKeyValue(2043, false)).assertEqual(',');
      expect(GetHardKeyValue(2043, true)).assertEqual(',');
      expect(firstLetter).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_1100
     * @tc.name      testKeyCodeBoundary_011
     * @tc.desc      Verify the digit block neighbours do not change under shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeBoundary_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_011 begin');

      expect(GetHardKeyValue(2010, true)).assertEqual('*');
      expect(GetHardKeyValue(2011, true)).assertEqual('#');
      expect(GetHardKeyValue(1999, false)).assertEqual('');
      expect(GetHardKeyValue(1999, true)).assertEqual('');
      expect(GetHardKeyValue(2000, true)).assertEqual('0');
      expect(GetHardKeyValue(2009, true)).assertEqual('9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_1200
     * @tc.name      testKeyCodeBoundary_012
     * @tc.desc      Verify the parenthesis pair at the end of the mapped range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeBoundary_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_012 begin');

      expect(GetHardKeyValue(2122, false)).assertEqual(')');
      expect(GetHardKeyValue(2121, true)).assertEqual('(');
      expect(GetHardKeyValue(2122, true)).assertEqual(')');
      expect(GetHardKeyValue(2123, false)).assertEqual('');
      expect(GetHardKeyValue(2121, false)).assertEqual('(');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_1300
     * @tc.name      testKeyCodeBoundary_013
     * @tc.desc      Verify the shape of glyphs versus function tokens across the mapped range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeBoundary_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_013 begin');

      let glyphs: number = 0;
      let tokens: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value === '') {
          continue;
        }
        if (value.indexOf('KEYCODE_') === 0) {
          tokens = tokens + 1;
        } else {
          glyphs = glyphs + 1;
          expect(value.length).assertEqual(1);
        }
      }
      expect(glyphs).assertEqual(47);
      expect(tokens).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_BOUNDARY_1400
     * @tc.name      testKeyCodeBoundary_014
     * @tc.desc      Verify that the mapped and unmapped codes partition the 2000..2122 window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeBoundary_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_014 begin');

      const mapped: number = mappedCount(2000, 2122);
      const window: number = 2122 - 2000 + 1;
      expect(window - mapped).assertEqual(67);
      expect(mapped).assertEqual(56);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeBoundary_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0100
     * @tc.name      testControllerKeyEventEdge_001
     * @tc.desc      Verify that the down handler ignores the keyAction field and keys off keyCode only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyEventEdge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_001 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      const actions: number[] = [0, 1, 99];
      let i: number = 0;
      while (i < actions.length) {
        expect(sendKeyAction(controller, 2017, actions[i])).assertTrue();
        i = i + 1;
      }
      expect(editorRef.journal.length).assertEqual(3);
      expect(editorRef.insertedTexts.join('')).assertEqual('aaa');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0200
     * @tc.name      testControllerKeyEventEdge_002
     * @tc.desc      Verify that the up handler returns false and emits nothing for an unusual action value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_002 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(sendKeyUpAction(controller, 2017, 99)).assertEqual(false);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.journal[0]).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0300
     * @tc.name      testControllerKeyEventEdge_003
     * @tc.desc      Verify that an up without a matching down changes no editor state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_003 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);

      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0400
     * @tc.name      testControllerKeyEventEdge_004
     * @tc.desc      Verify that a repeated up for the same key stays idempotent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_004 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      tapExpect(controller, 2017, true, false);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(1);
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0500
     * @tc.name      testControllerKeyEventEdge_005
     * @tc.desc      Verify that key code zero is intercepted without reaching the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_005 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      tapExpect(controller, 0, false, false);
      expect(editorRef.journal.length).assertEqual(0);

      expect(pressHardKey(controller, 2017)).assertEqual(true);
      releaseHardKey(controller, 2017);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0600
     * @tc.name      testControllerKeyEventEdge_006
     * @tc.desc      Verify that a negative key code is intercepted without reaching the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_006 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      expect(pressHardKey(controller, -1)).assertFalse();
      expect(releaseHardKey(controller, -1)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);

      expect(isShiftHeld(controller)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0700
     * @tc.name      testControllerKeyEventEdge_007
     * @tc.desc      Verify that the maximum integer key code is intercepted without reaching the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_007 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);

      expect(pressHardKey(controller, INT_MAX)).assertFalse();
      expect(releaseHardKey(controller, INT_MAX)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0800
     * @tc.name      testControllerKeyEventEdge_008
     * @tc.desc      Verify that a third held key bypasses the two-key shift latch and is inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyEventEdge_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_008 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(pressHardKey(controller, 2001)).assertEqual(true);
      expect(harness.client.journal.join('|')).assertEqual('insert:A|insert:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_0900
     * @tc.name      testControllerKeyEventEdge_009
     * @tc.desc      Verify that two bare shift keys latch without producing an editor command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyEventEdge_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_009 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(editorRef.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_1000
     * @tc.name      testControllerKeyEventEdge_010
     * @tc.desc      Verify that shift plus punctuation is blocked and leaves no command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_010 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2043)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2043)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_1100
     * @tc.name      testControllerKeyEventEdge_011
     * @tc.desc      Verify that releasing shift before the letter keeps the single uppercase insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyEventEdge_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_011 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);

      expect(pressHardKey(controller, 2047)).assertEqual(false);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(releaseHardKey(controller, 2017)).assertEqual(false);
      expect(harness.client.journal.join('|')).assertEqual('insert:A');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_1200
     * @tc.name      testControllerKeyEventEdge_012
     * @tc.desc      Verify that an alt key never latches and the next letter is inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_012 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      expect(pressHardKey(controller, 2045)).assertFalse();
      tapExpect(controller, 2017, true, false);
      expect(releaseHardKey(controller, 2045)).assertFalse();
      expect(harness.client.journal.join('|')).assertEqual('insert:a');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_1300
     * @tc.name      testControllerKeyEventEdge_013
     * @tc.desc      Verify that the center key reaches the editor as a literal function token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerKeyEventEdge_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_013 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      tapExpect(controller, 2016, true, false);
      expect(editorRef.journal.join('|')).assertEqual('insert:KEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_1400
     * @tc.name      testControllerKeyEventEdge_014
     * @tc.desc      Verify that the four arrow codes route to the four cursor directions in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_014 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      const arrows: number[] = [2012, 2013, 2014, 2015];
      for (let i = 0; i < arrows.length; i++) {
        expect(pressHardKey(controller, arrows[i])).assertEqual(true);
        expect(releaseHardKey(controller, arrows[i])).assertEqual(false);
      }
      expect(harness.client.movedDirections.length).assertEqual(4);
      expect(harness.client.movedDirections.join('|')).assertEqual('1|2|3|4');
      expect(harness.client.movedDirections[harness.client.movedDirections.length - 1]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_EVENT_EDGE_1500
     * @tc.name      testControllerKeyEventEdge_015
     * @tc.desc      Verify that both classifiers reject extreme and unknown codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerKeyEventEdge_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_015 begin');
      const controller: KeyboardController = createKeyboardController();

      const extremes: number[] = [0, -1, INT_MAX, 9999, 1999, 2123];
      let i: number = 0;
      while (i < extremes.length) {
        expect(isAlphabetKeyCode(controller, extremes[i])).assertFalse();
        expect(isNumberKeyCode(controller, extremes[i])).assertFalse();
        i = i + 1;
      }

      const alphabetEdges: number[] = [2017, 2042];
      let iW1: number = 0;
      while (iW1 < alphabetEdges.length) {
        expect(isAlphabetKeyCode(controller, alphabetEdges[iW1])).assertTrue();
        iW1 = iW1 + 1;
      }

      const numberEdges: number[] = [2000, 2103, 2112];
      let iW2: number = 0;
      while (iW2 < numberEdges.length) {
        expect(isNumberKeyCode(controller, numberEdges[iW2])).assertTrue();
        iW2 = iW2 + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerKeyEventEdge_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_DETERMINISM_0100
     * @tc.name      testKeyCodeDeterminism_001
     * @tc.desc      Verify that two forward passes over the mapped window return identical values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeDeterminism_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_001 begin');
      for (let code = 2000; code <= 2122; code++) {
        const first: string = GetHardKeyValue(code, false);
        const second: string = GetHardKeyValue(code, false);
        expect(second).assertEqual(first);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_DETERMINISM_0200
     * @tc.name      testKeyCodeDeterminism_002
     * @tc.desc      Verify that repeated shifted lookups are idempotent across the window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyCodeDeterminism_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_002 begin');
      let compared: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        const first: string = GetHardKeyValue(code, true);
        const second: string = GetHardKeyValue(code, true);
        expect(second).assertEqual(first);
        compared = compared + 1;
      }
      expect(compared).assertEqual(123);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_DETERMINISM_0300
     * @tc.name      testKeyCodeDeterminism_003
     * @tc.desc      Verify that forward and reverse traversal produce the same mapping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeDeterminism_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_003 begin');

      const forward: string[] = [];
      for (let code = 2000; code <= 2122; code++) {
        forward.push(GetHardKeyValue(code, false));
      }

      const reverse: string[] = [];
      for (let code = 2122; code >= 2000; code--) {
        reverse.push(GetHardKeyValue(code, false));
      }
      for (let i = 0; i < forward.length; i++) {
        expect(reverse[reverse.length - 1 - i]).assertEqual(forward[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_DETERMINISM_0400
     * @tc.name      testKeyCodeDeterminism_004
     * @tc.desc      Verify that toggling shift between calls does not mutate the stored mapping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeDeterminism_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_004 begin');
      const baseline: string = GetHardKeyValue(2017, false);
      let i: number = 0;
      while (i < 10) {
        GetHardKeyValue(2017, i % 2 === 0);
        i = i + 1;
      }
      expect(GetHardKeyValue(2017, false)).assertEqual(baseline);
      expect(GetHardKeyValue(2017, true)).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_DETERMINISM_0500
     * @tc.name      testKeyCodeDeterminism_005
     * @tc.desc      Verify that two reverse passes over the shifted mapping return identical values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeDeterminism_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_005 begin');
      for (let code = 2122; code >= 2000; code--) {
        const first: string = GetHardKeyValue(code, true);
        const second: string = GetHardKeyValue(code, true);
        expect(second).assertEqual(first);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_CODE_DETERMINISM_0600
     * @tc.name      testKeyCodeDeterminism_006
     * @tc.desc      Verify that interleaved plain and shifted lookups stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyCodeDeterminism_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_006 begin');
      for (let code = 2017; code <= 2042; code++) {
        const plain: string = GetHardKeyValue(code, false);
        const upper: string = GetHardKeyValue(code, true);
        expect(GetHardKeyValue(code, true)).assertEqual(upper);
        expect(upper === plain).assertFalse();
        expect(GetHardKeyValue(code, false)).assertEqual(plain);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyCodeDeterminism_006 end');
      await yieldToEventLoop();
    });

  });

}
