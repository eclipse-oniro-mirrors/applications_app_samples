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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { nativeAdd } from 'library';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function nativeAddFractionMatrixTest() {
  describe('NativeAddFractionMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0001
     * @tc.name      testNativeFraction0001
     * @tc.desc      Add binary fraction values 0.125 and -1.5 and expect -1.375
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.125, -1.5);
      logCase('testNativeFraction0001', `sum=${sum}`);
      expect(sum).assertEqual(-1.375);
      expect(nativeAdd(-1.5, 0.125)).assertEqual(-1.375);
      expect(nativeAdd(-1.375, -(-1.5))).assertEqual(0.125);
      expect(nativeAdd(-1.375, -(0.125))).assertEqual(-1.5);
      expect(nativeAdd(-1.375, -(-1.375))).assertEqual(0);
      expect(nativeAdd(0.125, -1.5)).assertEqual(0.125 + -1.5);
      {
      const sum: number = nativeAdd(0.5, -1.0625);
      logCase('testNativeFraction0002', `sum=${sum}`);
      expect(sum).assertEqual(-0.5625);
      expect(nativeAdd(-1.0625, 0.5)).assertEqual(-0.5625);
      expect(nativeAdd(-0.5625, -(-1.0625))).assertEqual(0.5);
      expect(nativeAdd(-0.5625, -(0.5))).assertEqual(-1.0625);
      expect(nativeAdd(-0.5625, -(-0.5625))).assertEqual(0);
      expect(nativeAdd(0.5, -1.0625)).assertEqual(0.5 + -1.0625);
      }
      {
      const sum: number = nativeAdd(0.875, -0.625);
      logCase('testNativeFraction0003', `sum=${sum}`);
      expect(sum).assertEqual(0.25);
      expect(nativeAdd(-0.625, 0.875)).assertEqual(0.25);
      expect(nativeAdd(0.25, -(-0.625))).assertEqual(0.875);
      expect(nativeAdd(0.25, -(0.875))).assertEqual(-0.625);
      expect(nativeAdd(0.25, -(0.25))).assertEqual(0);
      expect(nativeAdd(0.875, -0.625)).assertEqual(0.875 + -0.625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0004
     * @tc.name      testNativeFraction0004
     * @tc.desc      Add binary fraction values 1.25 and -0.1875 and expect 1.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1.25, -0.1875);
      logCase('testNativeFraction0004', `sum=${sum}`);
      expect(sum).assertEqual(1.0625);
      expect(nativeAdd(-0.1875, 1.25)).assertEqual(1.0625);
      expect(nativeAdd(1.0625, -(-0.1875))).assertEqual(1.25);
      expect(nativeAdd(1.0625, -(1.25))).assertEqual(-0.1875);
      expect(nativeAdd(1.0625, -(1.0625))).assertEqual(0);
      expect(nativeAdd(1.25, -0.1875)).assertEqual(1.25 + -0.1875);
      {
      const sum: number = nativeAdd(1.625, 0.25);
      logCase('testNativeFraction0005', `sum=${sum}`);
      expect(sum).assertEqual(1.875);
      expect(nativeAdd(0.25, 1.625)).assertEqual(1.875);
      expect(nativeAdd(1.875, -(0.25))).assertEqual(1.625);
      expect(nativeAdd(1.875, -(1.625))).assertEqual(0.25);
      expect(nativeAdd(1.875, -(1.875))).assertEqual(0);
      expect(nativeAdd(1.625, 0.25) > 1.625).assertTrue();
      expect(nativeAdd(1.625, 0.25)).assertEqual(1.625 + 0.25);
      }
      {
      const sum: number = nativeAdd(2.0, 0.6875);
      logCase('testNativeFraction0006', `sum=${sum}`);
      expect(sum).assertEqual(2.6875);
      expect(nativeAdd(0.6875, 2.0)).assertEqual(2.6875);
      expect(nativeAdd(2.6875, -(0.6875))).assertEqual(2.0);
      expect(nativeAdd(2.6875, -(2.0))).assertEqual(0.6875);
      expect(nativeAdd(2.6875, -(2.6875))).assertEqual(0);
      expect(nativeAdd(2.0, 0.6875) > 2.0).assertTrue();
      expect(nativeAdd(2.0, 0.6875)).assertEqual(2.0 + 0.6875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0007
     * @tc.name      testNativeFraction0007
     * @tc.desc      Add binary fraction values 2.375 and 1.125 and expect 3.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(2.375, 1.125);
      logCase('testNativeFraction0007', `sum=${sum}`);
      expect(sum).assertEqual(3.5);
      expect(nativeAdd(1.125, 2.375)).assertEqual(3.5);
      expect(nativeAdd(3.5, -(1.125))).assertEqual(2.375);
      expect(nativeAdd(3.5, -(2.375))).assertEqual(1.125);
      expect(nativeAdd(3.5, -(3.5))).assertEqual(0);
      expect(nativeAdd(2.375, 1.125) > 2.375).assertTrue();
      expect(nativeAdd(2.375, 1.125)).assertEqual(2.375 + 1.125);
      {
      const sum: number = nativeAdd(2.75, 1.5625);
      logCase('testNativeFraction0008', `sum=${sum}`);
      expect(sum).assertEqual(4.3125);
      expect(nativeAdd(1.5625, 2.75)).assertEqual(4.3125);
      expect(nativeAdd(4.3125, -(1.5625))).assertEqual(2.75);
      expect(nativeAdd(4.3125, -(2.75))).assertEqual(1.5625);
      expect(nativeAdd(4.3125, -(4.3125))).assertEqual(0);
      expect(nativeAdd(2.75, 1.5625) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.5625)).assertEqual(2.75 + 1.5625);
      }
      {
      const sum: number = nativeAdd(3.125, 2.0);
      logCase('testNativeFraction0009', `sum=${sum}`);
      expect(sum).assertEqual(5.125);
      expect(nativeAdd(2.0, 3.125)).assertEqual(5.125);
      expect(nativeAdd(5.125, -(2.0))).assertEqual(3.125);
      expect(nativeAdd(5.125, -(3.125))).assertEqual(2.0);
      expect(nativeAdd(5.125, -(5.125))).assertEqual(0);
      expect(nativeAdd(3.125, 2.0) > 3.125).assertTrue();
      expect(nativeAdd(3.125, 2.0)).assertEqual(3.125 + 2.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0010
     * @tc.name      testNativeFraction0010
     * @tc.desc      Add binary fraction values 3.5 and -1.375 and expect 2.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(3.5, -1.375);
      logCase('testNativeFraction0010', `sum=${sum}`);
      expect(sum).assertEqual(2.125);
      expect(nativeAdd(-1.375, 3.5)).assertEqual(2.125);
      expect(nativeAdd(2.125, -(-1.375))).assertEqual(3.5);
      expect(nativeAdd(2.125, -(3.5))).assertEqual(-1.375);
      expect(nativeAdd(2.125, -(2.125))).assertEqual(0);
      expect(nativeAdd(3.5, -1.375)).assertEqual(3.5 + -1.375);
      {
      const sum: number = nativeAdd(3.875, -0.9375);
      logCase('testNativeFraction0011', `sum=${sum}`);
      expect(sum).assertEqual(2.9375);
      expect(nativeAdd(-0.9375, 3.875)).assertEqual(2.9375);
      expect(nativeAdd(2.9375, -(-0.9375))).assertEqual(3.875);
      expect(nativeAdd(2.9375, -(3.875))).assertEqual(-0.9375);
      expect(nativeAdd(2.9375, -(2.9375))).assertEqual(0);
      expect(nativeAdd(3.875, -0.9375)).assertEqual(3.875 + -0.9375);
      }
      {
      const sum: number = nativeAdd(4.25, -0.5);
      logCase('testNativeFraction0012', `sum=${sum}`);
      expect(sum).assertEqual(3.75);
      expect(nativeAdd(-0.5, 4.25)).assertEqual(3.75);
      expect(nativeAdd(3.75, -(-0.5))).assertEqual(4.25);
      expect(nativeAdd(3.75, -(4.25))).assertEqual(-0.5);
      expect(nativeAdd(3.75, -(3.75))).assertEqual(0);
      expect(nativeAdd(4.25, -0.5)).assertEqual(4.25 + -0.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0013
     * @tc.name      testNativeFraction0013
     * @tc.desc      Add binary fraction values 4.625 and -0.0625 and expect 4.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(4.625, -0.0625);
      logCase('testNativeFraction0013', `sum=${sum}`);
      expect(sum).assertEqual(4.5625);
      expect(nativeAdd(-0.0625, 4.625)).assertEqual(4.5625);
      expect(nativeAdd(4.5625, -(-0.0625))).assertEqual(4.625);
      expect(nativeAdd(4.5625, -(4.625))).assertEqual(-0.0625);
      expect(nativeAdd(4.5625, -(4.5625))).assertEqual(0);
      expect(nativeAdd(4.625, -0.0625)).assertEqual(4.625 + -0.0625);
      {
      const sum: number = nativeAdd(5.0, 0.375);
      logCase('testNativeFraction0014', `sum=${sum}`);
      expect(sum).assertEqual(5.375);
      expect(nativeAdd(0.375, 5.0)).assertEqual(5.375);
      expect(nativeAdd(5.375, -(0.375))).assertEqual(5.0);
      expect(nativeAdd(5.375, -(5.0))).assertEqual(0.375);
      expect(nativeAdd(5.375, -(5.375))).assertEqual(0);
      expect(nativeAdd(5.0, 0.375) > 5.0).assertTrue();
      expect(nativeAdd(5.0, 0.375)).assertEqual(5.0 + 0.375);
      }
      {
      const sum: number = nativeAdd(5.375, 0.8125);
      logCase('testNativeFraction0015', `sum=${sum}`);
      expect(sum).assertEqual(6.1875);
      expect(nativeAdd(0.8125, 5.375)).assertEqual(6.1875);
      expect(nativeAdd(6.1875, -(0.8125))).assertEqual(5.375);
      expect(nativeAdd(6.1875, -(5.375))).assertEqual(0.8125);
      expect(nativeAdd(6.1875, -(6.1875))).assertEqual(0);
      expect(nativeAdd(5.375, 0.8125) > 5.375).assertTrue();
      expect(nativeAdd(5.375, 0.8125)).assertEqual(5.375 + 0.8125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0016
     * @tc.name      testNativeFraction0016
     * @tc.desc      Add binary fraction values 5.75 and 1.25 and expect 7.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(5.75, 1.25);
      logCase('testNativeFraction0016', `sum=${sum}`);
      expect(sum).assertEqual(7.0);
      expect(nativeAdd(1.25, 5.75)).assertEqual(7.0);
      expect(nativeAdd(7.0, -(1.25))).assertEqual(5.75);
      expect(nativeAdd(7.0, -(5.75))).assertEqual(1.25);
      expect(nativeAdd(7.0, -(7.0))).assertEqual(0);
      expect(nativeAdd(5.75, 1.25) > 5.75).assertTrue();
      expect(nativeAdd(5.75, 1.25)).assertEqual(5.75 + 1.25);
      {
      const sum: number = nativeAdd(6.125, 1.6875);
      logCase('testNativeFraction0017', `sum=${sum}`);
      expect(sum).assertEqual(7.8125);
      expect(nativeAdd(1.6875, 6.125)).assertEqual(7.8125);
      expect(nativeAdd(7.8125, -(1.6875))).assertEqual(6.125);
      expect(nativeAdd(7.8125, -(6.125))).assertEqual(1.6875);
      expect(nativeAdd(7.8125, -(7.8125))).assertEqual(0);
      expect(nativeAdd(6.125, 1.6875) > 6.125).assertTrue();
      expect(nativeAdd(6.125, 1.6875)).assertEqual(6.125 + 1.6875);
      }
      {
      const sum: number = nativeAdd(6.5, 2.125);
      logCase('testNativeFraction0018', `sum=${sum}`);
      expect(sum).assertEqual(8.625);
      expect(nativeAdd(2.125, 6.5)).assertEqual(8.625);
      expect(nativeAdd(8.625, -(2.125))).assertEqual(6.5);
      expect(nativeAdd(8.625, -(6.5))).assertEqual(2.125);
      expect(nativeAdd(8.625, -(8.625))).assertEqual(0);
      expect(nativeAdd(6.5, 2.125) > 6.5).assertTrue();
      expect(nativeAdd(6.5, 2.125)).assertEqual(6.5 + 2.125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0019
     * @tc.name      testNativeFraction0019
     * @tc.desc      Add binary fraction values 6.875 and -1.25 and expect 5.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(6.875, -1.25);
      logCase('testNativeFraction0019', `sum=${sum}`);
      expect(sum).assertEqual(5.625);
      expect(nativeAdd(-1.25, 6.875)).assertEqual(5.625);
      expect(nativeAdd(5.625, -(-1.25))).assertEqual(6.875);
      expect(nativeAdd(5.625, -(6.875))).assertEqual(-1.25);
      expect(nativeAdd(5.625, -(5.625))).assertEqual(0);
      expect(nativeAdd(6.875, -1.25)).assertEqual(6.875 + -1.25);
      {
      const sum: number = nativeAdd(7.25, -0.8125);
      logCase('testNativeFraction0020', `sum=${sum}`);
      expect(sum).assertEqual(6.4375);
      expect(nativeAdd(-0.8125, 7.25)).assertEqual(6.4375);
      expect(nativeAdd(6.4375, -(-0.8125))).assertEqual(7.25);
      expect(nativeAdd(6.4375, -(7.25))).assertEqual(-0.8125);
      expect(nativeAdd(6.4375, -(6.4375))).assertEqual(0);
      expect(nativeAdd(7.25, -0.8125)).assertEqual(7.25 + -0.8125);
      }
      {
      const sum: number = nativeAdd(7.625, -0.375);
      logCase('testNativeFraction0021', `sum=${sum}`);
      expect(sum).assertEqual(7.25);
      expect(nativeAdd(-0.375, 7.625)).assertEqual(7.25);
      expect(nativeAdd(7.25, -(-0.375))).assertEqual(7.625);
      expect(nativeAdd(7.25, -(7.625))).assertEqual(-0.375);
      expect(nativeAdd(7.25, -(7.25))).assertEqual(0);
      expect(nativeAdd(7.625, -0.375)).assertEqual(7.625 + -0.375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0022
     * @tc.name      testNativeFraction0022
     * @tc.desc      Add binary fraction values 8.0 and 0.0625 and expect 8.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(8.0, 0.0625);
      logCase('testNativeFraction0022', `sum=${sum}`);
      expect(sum).assertEqual(8.0625);
      expect(nativeAdd(0.0625, 8.0)).assertEqual(8.0625);
      expect(nativeAdd(8.0625, -(0.0625))).assertEqual(8.0);
      expect(nativeAdd(8.0625, -(8.0))).assertEqual(0.0625);
      expect(nativeAdd(8.0625, -(8.0625))).assertEqual(0);
      expect(nativeAdd(8.0, 0.0625) > 8.0).assertTrue();
      expect(nativeAdd(8.0, 0.0625)).assertEqual(8.0 + 0.0625);
      {
      const sum: number = nativeAdd(8.375, 0.5);
      logCase('testNativeFraction0023', `sum=${sum}`);
      expect(sum).assertEqual(8.875);
      expect(nativeAdd(0.5, 8.375)).assertEqual(8.875);
      expect(nativeAdd(8.875, -(0.5))).assertEqual(8.375);
      expect(nativeAdd(8.875, -(8.375))).assertEqual(0.5);
      expect(nativeAdd(8.875, -(8.875))).assertEqual(0);
      expect(nativeAdd(8.375, 0.5) > 8.375).assertTrue();
      expect(nativeAdd(8.375, 0.5)).assertEqual(8.375 + 0.5);
      }
      {
      const sum: number = nativeAdd(8.75, 0.9375);
      logCase('testNativeFraction0024', `sum=${sum}`);
      expect(sum).assertEqual(9.6875);
      expect(nativeAdd(0.9375, 8.75)).assertEqual(9.6875);
      expect(nativeAdd(9.6875, -(0.9375))).assertEqual(8.75);
      expect(nativeAdd(9.6875, -(8.75))).assertEqual(0.9375);
      expect(nativeAdd(9.6875, -(9.6875))).assertEqual(0);
      expect(nativeAdd(8.75, 0.9375) > 8.75).assertTrue();
      expect(nativeAdd(8.75, 0.9375)).assertEqual(8.75 + 0.9375);
      }
    })
    /**
