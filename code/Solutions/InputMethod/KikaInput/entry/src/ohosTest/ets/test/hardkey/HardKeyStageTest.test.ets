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
import { createKeyboardController, processFunctionToken, translateShiftToken } from '../support/TestSupport';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputHardKeyRangePartition]';

function countInRange(from: number, to: number): number {
  let count: number = 0;
  for (let code = from; code <= to; code++) {
    if (GetHardKeyValue(code, false) !== '') {
      count = count + 1;
    }
  }
  return count;
}

function isFunctionToken(token: string): boolean {
  return token === 'KEYCODE_DEL' || token === 'KEYCODE_FORWARD_DEL' ||
    token === 'KEYCODE_DPAD_UP' || token === 'KEYCODE_DPAD_DOWN' ||
    token === 'KEYCODE_DPAD_LEFT' || token === 'KEYCODE_DPAD_RIGHT';
}

function isShiftToken(token: string): boolean {
  return token === 'KEYCODE_SHIFT_LEFT' || token === 'KEYCODE_SHIFT_RIGHT';
}

export default function hardKeyStageTest(): void {
  describe('HardKeyStageTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0100
     * @tc.name      testHardKeyRangePartition_001
     * @tc.desc      Verify that the decimal partition 2000..2009 contains ten mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_001 begin');
      expect(countInRange(2000, 2009)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0200
     * @tc.name      testHardKeyRangePartition_002
     * @tc.desc      Verify that the star and hash partition 2010..2011 contains two mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_002 begin');
      expect(GetHardKeyValue(2010, false)).assertEqual('*');
      expect(GetHardKeyValue(2011, false)).assertEqual('#');
      expect(countInRange(2010, 2011)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0300
     * @tc.name      testHardKeyRangePartition_003
     * @tc.desc      Verify that the function partition 2012..2016 contains five tokens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_003 begin');
      expect(countInRange(2012, 2016)).assertEqual(5);
      for (let code = 2012; code <= 2016; code++) {
        expect(GetHardKeyValue(code, false).indexOf('KEYCODE_')).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0400
     * @tc.name      testHardKeyRangePartition_004
     * @tc.desc      Verify that the letter partition 2017..2042 contains twenty-six mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_004 begin');
      expect(countInRange(2017, 2042)).assertEqual(26);
      for (let code = 2017; code <= 2042; code++) {
        expect(GetHardKeyValue(code, true).length).assertEqual(1);
        expect(GetHardKeyValue(code, false).length).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0500
     * @tc.name      testHardKeyRangePartition_005
     * @tc.desc      Verify that the comma and period partition 2043..2044 contains two mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_005 begin');
      const probes: number[] = [2043, 2044, -2043, -2044];
      const expected: string[] = [',', '.', ',', '.'];
      let i: number = 0;
      while (i < probes.length) {
        const shifted: boolean = probes[i] < 0;
        const code: number = shifted ? -probes[i] : probes[i];
        expect(GetHardKeyValue(code, shifted)).assertEqual(expected[i]);
        i = i + 1;
      }
      expect(GetHardKeyValue(2043, false).length).assertEqual(1);
      expect(countInRange(2043, 2044)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0600
     * @tc.name      testHardKeyRangePartition_006
     * @tc.desc      Verify that the alt partition 2045..2046 is unmapped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_006 begin');
      const probes: number[] = [2045, 2046, -2045, -2046];
      const expected: string[] = ['', '', '', ''];
      const observed: string[] = [];
      let probeIndex: number = 0;
      while (probeIndex < probes.length) {
        const probe: number = probes[probeIndex];
        observed.push(GetHardKeyValue(probe < 0 ? -probe : probe, probe < 0));
        probeIndex = probeIndex + 1;
      }
      expect(GetHardKeyValue(2045, false).length).assertEqual(0);
      expect(GetHardKeyValue(2045, false).length + GetHardKeyValue(2046, false).length).assertEqual(0);
      expect(observed.join('|')).assertEqual(expected.join('|'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0700
     * @tc.name      testHardKeyRangePartition_007
     * @tc.desc      Verify that the shift partition 2047..2048 contains two tokens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_007 begin');
      const probes: number[] = [2047, 2048, -2047, -2048];
      const expected: string[] = ['KEYCODE_SHIFT_LEFT', 'KEYCODE_SHIFT_RIGHT', 'KEYCODE_SHIFT_LEFT', 'KEYCODE_SHIFT_RIGHT'];
      let i: number = 0;
      while (i < probes.length) {
        const code: number = probes[i] < 0 ? -probes[i] : probes[i];
        expect(GetHardKeyValue(code, probes[i] < 0) === expected[i]).assertEqual(true);
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0800
     * @tc.name      testHardKeyRangePartition_008
     * @tc.desc      Verify that the gap 2049..2054 contains only the space code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_008 begin');
      expect(GetHardKeyValue(2050, false)).assertEqual(' ');
      expect(countInRange(2049, 2054)).assertEqual(1);
      const gapCodes: number[] = [2049, 2054, 2051];
      for (let i = 0; i < gapCodes.length; i++) {
        expect(GetHardKeyValue(gapCodes[i], false)).assertEqual('');
      }
      expect(GetHardKeyValue(2050, false).charCodeAt(0)).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_0900
     * @tc.name      testHardKeyRangePartition_009
     * @tc.desc      Verify that the delete partition 2055..2057 contains only the DEL token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_009 begin');
      const probes: number[] = [2055, 2056, -2055, -2057];
      const expected: string[] = ['KEYCODE_DEL', '', 'KEYCODE_DEL', ''];
      let i: number = 0;
      while (i < probes.length) {
        const shifted: boolean = probes[i] < 0;
        const code: number = shifted ? -probes[i] : probes[i];
        expect(GetHardKeyValue(code, shifted)).assertEqual(expected[i]);
        i = i + 1;
      }
      for (let code = 2056; code <= 2057; code++) {
        expect(GetHardKeyValue(code, false)).assertEqual('');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1000
     * @tc.name      testHardKeyRangePartition_010
     * @tc.desc      Verify that the equals partition 2058..2063 contains only the equals glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_010 begin');
      const probes: number[] = [2058, 2063, -2058, -2059];
      const expected: string[] = ['=', '', '=', ''];
      for (let i = 0; i < probes.length; i++) {
        const shifted: boolean = probes[i] < 0;
        const code: number = shifted ? -probes[i] : probes[i];
        expect(GetHardKeyValue(code, shifted)).assertEqual(expected[i]);
      }
      expect(GetHardKeyValue(2060, false).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1100
     * @tc.name      testHardKeyRangePartition_011
     * @tc.desc      Verify that the slash, at and plus partition 2064..2070 contains three glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_011 begin');
      const probes: number[] = [2064, 2065, 2066];
      const expected: string[] = ['/', '@', '+'];
      const observed: string[] = [];
      let probeIndex: number = 0;
      while (probeIndex < probes.length) {
        const probe: number = probes[probeIndex];
        observed.push(GetHardKeyValue(probe < 0 ? -probe : probe, probe < 0));
        probeIndex = probeIndex + 1;
      }
      expect(GetHardKeyValue(2066, false).charCodeAt(0)).assertEqual(43);
      expect(GetHardKeyValue(2065, false).charCodeAt(0)).assertEqual(64);
      expect(observed.join('|')).assertEqual(expected.join('|'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1200
     * @tc.name      testHardKeyRangePartition_012
     * @tc.desc      Verify that the forward-delete partition 2071..2120 contains one token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_012 begin');
      const probes: number[] = [2071, 2103, -2071, -2120];
      const expected: string[] = ['KEYCODE_FORWARD_DEL', '', 'KEYCODE_FORWARD_DEL', ''];
      for (let i = 0; i < probes.length; i++) {
        const code: number = probes[i] < 0 ? -probes[i] : probes[i];
        expect(GetHardKeyValue(code, probes[i] < 0)).assertEqual(expected[i]);
      }
      expect(countInRange(2072, 2102)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1300
     * @tc.name      testHardKeyRangePartition_013
     * @tc.desc      Verify that the parenthesis partition 2121..2122 contains two glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_013 begin');
      const probes: number[] = [2121, 2122, -2121, -2122];
      const expected: string[] = ['(', ')', '(', ')'];
      let probeIndex: number = 0;
      do {
        const raw: number = probes[probeIndex];
        const code: number = raw < 0 ? -raw : raw;
        expect(GetHardKeyValue(code, raw < 0)).assertEqual(expected[probeIndex]);
        probeIndex = probeIndex + 1;
      } while (probeIndex < probes.length);
      expect(GetHardKeyValue(2122, false).charCodeAt(0)).assertEqual(41);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1400
     * @tc.name      testHardKeyRangePartition_014
     * @tc.desc      Verify that the range past the table tail is entirely unmapped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyRangePartition_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_014 begin');
      expect(countInRange(2123, 2199)).assertEqual(0);
      const tailCodes: number[] = [2123, 2199, 2198];
      for (let i = 0; i < tailCodes.length; i++) {
        expect(GetHardKeyValue(tailCodes[i], true)).assertEqual('');
        expect(GetHardKeyValue(tailCodes[i], false)).assertEqual('');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1500
     * @tc.name      testHardKeyRangePartition_015
     * @tc.desc      Verify that the partition counts sum to the fifty-six mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyRangePartition_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_015 begin');
      const counts: number[] = [
        countInRange(2000, 2009), countInRange(2010, 2011), countInRange(2012, 2016),
        countInRange(2017, 2042), countInRange(2043, 2044), countInRange(2045, 2046),
        countInRange(2047, 2048), countInRange(2049, 2054), countInRange(2055, 2057),
        countInRange(2058, 2063), countInRange(2064, 2070), countInRange(2071, 2120),
        countInRange(2121, 2122), countInRange(2123, 2199)
      ];
      let total: number = 0;
      let i: number = 0;
      while (i < counts.length) {
        total = total + counts[i];
        i = i + 1;
      }
      expect(total).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_RANGE_PARTITION_1600
     * @tc.name      testHardKeyRangePartition_016
     * @tc.desc      Verify that shift is a no-op in every non-letter partition.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyRangePartition_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_016 begin');
      const ranges: number[][] = [[2000, 2009], [2010, 2011], [2012, 2016], [2043, 2044],
        [2045, 2046], [2047, 2048], [2049, 2054], [2055, 2057], [2058, 2063], [2064, 2070],
        [2071, 2120], [2121, 2122], [2123, 2199]];
      for (let i = 0; i < ranges.length; i++) {
        for (let code = ranges[i][0]; code <= ranges[i][1]; code++) {
          expect(GetHardKeyValue(code, true)).assertEqual(GetHardKeyValue(code, false));
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyRangePartition_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0100
     * @tc.name      testHardKeyComposition_001
     * @tc.desc      Verify that shift tokens are consumed by the shift stage only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_001 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(translateShiftToken(controller, 'KEYCODE_SHIFT_LEFT')).assertTrue();
      expect(translateShiftToken(controller, 'KEYCODE_SHIFT_RIGHT')).assertTrue();
      expect(processFunctionToken(controller, 'KEYCODE_SHIFT_LEFT')).assertFalse();
      expect(processFunctionToken(controller, 'KEYCODE_SHIFT_RIGHT')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0200
     * @tc.name      testHardKeyComposition_002
     * @tc.desc      Verify that the DEL token is consumed by the function stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_002 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      expect(translateShiftToken(controller, 'KEYCODE_DEL')).assertFalse();
      expect(processFunctionToken(controller, 'KEYCODE_DEL')).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0300
     * @tc.name      testHardKeyComposition_003
     * @tc.desc      Verify that the FORWARD_DEL token is consumed by the function stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_003 begin');
      const controller: KeyboardController = createKeyboardController();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      expect(translateShiftToken(controller, 'KEYCODE_FORWARD_DEL')).assertEqual(false);
      expect(processFunctionToken(controller, 'KEYCODE_FORWARD_DEL')).assertEqual(true);
      expect(editorRef.backwardLengths.length).assertEqual(1);
      expect(editorRef.journal.join('|')).assertEqual('back:1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0400
     * @tc.name      testHardKeyComposition_004
     * @tc.desc      Verify that the four arrow tokens are consumed by the function stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_004 begin');
      const controller: KeyboardController = createKeyboardController();
      const arrows: string[] = ['KEYCODE_DPAD_UP', 'KEYCODE_DPAD_DOWN',
        'KEYCODE_DPAD_LEFT', 'KEYCODE_DPAD_RIGHT'];
      for (let i = 0; i < arrows.length; i++) {
        expect(translateShiftToken(controller, arrows[i])).assertFalse();
        expect(processFunctionToken(controller, arrows[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0500
     * @tc.name      testHardKeyComposition_005
     * @tc.desc      Verify that the center token is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_005 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(processFunctionToken(controller, 'KEYCODE_DPAD_UP')).assertTrue();
      expect(processFunctionToken(controller, 'KEYCODE_DPAD_CENTER')).assertFalse();
      expect(translateShiftToken(controller, 'KEYCODE_DPAD_CENTER')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0600
     * @tc.name      testHardKeyComposition_006
     * @tc.desc      Verify that a lowercase letter is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_006 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(translateShiftToken(controller, 'a')).assertEqual(false);
      expect(processFunctionToken(controller, 'X')).assertEqual(false);
      expect(translateShiftToken(controller, 'X')).assertEqual(false);
      expect(processFunctionToken(controller, 'a')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0700
     * @tc.name      testHardKeyComposition_007
     * @tc.desc      Verify that an uppercase letter is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_007 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(translateShiftToken(controller, 'A')).assertFalse();
      expect(processFunctionToken(controller, 'z')).assertFalse();
      expect(processFunctionToken(controller, 'A')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0800
     * @tc.name      testHardKeyComposition_008
     * @tc.desc      Verify that a digit glyph is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_008 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(GetHardKeyValue(2001, false).length).assertEqual(1);
      expect(processFunctionToken(controller, '7')).assertFalse();
      expect(translateShiftToken(controller, '7')).assertFalse();
      expect(GetHardKeyValue(2001, false)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_0900
     * @tc.name      testHardKeyComposition_009
     * @tc.desc      Verify that a punctuation glyph is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyComposition_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_009 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(processFunctionToken(controller, ',')).assertEqual(false);
      expect(translateShiftToken(controller, ',')).assertEqual(false);
      expect(GetHardKeyValue(2043, false)).assertEqual(',');
      expect(GetHardKeyValue(2043, true).charCodeAt(0)).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_1000
     * @tc.name      testHardKeyComposition_010
     * @tc.desc      Verify that an empty token is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_010 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(translateShiftToken(controller, '')).assertFalse();
      expect(processFunctionToken(controller, 'KEYCODE_DEL')).assertTrue();
      expect(translateShiftToken(controller, 'KEYCODE_DEL')).assertFalse();
      expect(processFunctionToken(controller, '')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_1100
     * @tc.name      testHardKeyComposition_011
     * @tc.desc      Verify that an unknown KEYCODE token is not consumed by either stage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_011 begin');
      const controller: KeyboardController = createKeyboardController();
      expect('KEYCODE_UNKNOWN'.indexOf('KEYCODE_')).assertEqual(0);
      expect(processFunctionToken(controller, 'KEYCODE_UNKNOWN')).assertFalse();
      expect(translateShiftToken(controller, 'KEYCODE_UNKNOWN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_1200
     * @tc.name      testHardKeyComposition_012
     * @tc.desc      Verify that a lowercase keyword token is not consumed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_012 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(processFunctionToken(controller, 'keycode_del')).assertEqual(false);
      expect(processFunctionToken(controller, 'keycode_delete')).assertEqual(false);
      expect(translateShiftToken(controller, 'keycode_shift_left')).assertEqual(false);
      expect(processFunctionToken(controller, 'KEYCODE_DPAD_LEFT')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_1300
     * @tc.name      testHardKeyComposition_013
     * @tc.desc      Verify that whitespace around a token prevents stage consumption.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_013 begin');
      const controller: KeyboardController = createKeyboardController();
      expect(processFunctionToken(controller, ' KEYCODE_DEL')).assertFalse();
      expect(processFunctionToken(controller, 'KEYCODE_DEL ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_1400
     * @tc.name      testHardKeyComposition_014
     * @tc.desc      Verify that every mapped code routes to exactly the stage matching its token class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_014 begin');
      const controller: KeyboardController = createKeyboardController();
      for (let code = 2000; code <= 2122; code++) {
        const token: string = GetHardKeyValue(code, false);
        if (token === '') {
          continue;
        }
        if (isShiftToken(token)) {
          expect(processFunctionToken(controller, token)).assertFalse();
          expect(translateShiftToken(controller, token)).assertTrue();
        } else if (isFunctionToken(token)) {
          expect(translateShiftToken(controller, token)).assertFalse();
          expect(processFunctionToken(controller, token)).assertTrue();
        } else {
          expect(translateShiftToken(controller, token)).assertFalse();
          expect(processFunctionToken(controller, token)).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_COMPOSITION_1500
     * @tc.name      testHardKeyComposition_015
     * @tc.desc      Verify that two distinct unknown tokens both stay outside both stages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyComposition_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_015 begin');
      const controller: KeyboardController = createKeyboardController();
      const unknowns: string[] = ['KEYCODE_DPAD_CENTER', 'CUSTOM_TOKEN'];
      let i: number = 0;
      while (i < unknowns.length) {
        expect(processFunctionToken(controller, unknowns[i])).assertEqual(false);
        expect(translateShiftToken(controller, unknowns[i])).assertEqual(false);
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyComposition_015 end');
      await yieldToEventLoop();
    });

  });

}
