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
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0025
     * @tc.name      testNativeFraction0025
     * @tc.desc      Add binary fraction values 9.125 and 1.375 and expect 10.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(9.125, 1.375);
      logCase('testNativeFraction0025', `sum=${sum}`);
      expect(sum).assertEqual(10.5);
      expect(nativeAdd(1.375, 9.125)).assertEqual(10.5);
      expect(nativeAdd(10.5, -(1.375))).assertEqual(9.125);
      expect(nativeAdd(10.5, -(9.125))).assertEqual(1.375);
      expect(nativeAdd(10.5, -(10.5))).assertEqual(0);
      expect(nativeAdd(9.125, 1.375) > 9.125).assertTrue();
      expect(nativeAdd(9.125, 1.375)).assertEqual(9.125 + 1.375);
      {
      const sum: number = nativeAdd(9.5, 1.8125);
      logCase('testNativeFraction0026', `sum=${sum}`);
      expect(sum).assertEqual(11.3125);
      expect(nativeAdd(1.8125, 9.5)).assertEqual(11.3125);
      expect(nativeAdd(11.3125, -(1.8125))).assertEqual(9.5);
      expect(nativeAdd(11.3125, -(9.5))).assertEqual(1.8125);
      expect(nativeAdd(11.3125, -(11.3125))).assertEqual(0);
      expect(nativeAdd(9.5, 1.8125) > 9.5).assertTrue();
      expect(nativeAdd(9.5, 1.8125)).assertEqual(9.5 + 1.8125);
      }
      {
      const sum: number = nativeAdd(9.875, 2.25);
      logCase('testNativeFraction0027', `sum=${sum}`);
      expect(sum).assertEqual(12.125);
      expect(nativeAdd(2.25, 9.875)).assertEqual(12.125);
      expect(nativeAdd(12.125, -(2.25))).assertEqual(9.875);
      expect(nativeAdd(12.125, -(9.875))).assertEqual(2.25);
      expect(nativeAdd(12.125, -(12.125))).assertEqual(0);
      expect(nativeAdd(9.875, 2.25) > 9.875).assertTrue();
      expect(nativeAdd(9.875, 2.25)).assertEqual(9.875 + 2.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0028
     * @tc.name      testNativeFraction0028
     * @tc.desc      Add binary fraction values 10.25 and -1.125 and expect 9.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(10.25, -1.125);
      logCase('testNativeFraction0028', `sum=${sum}`);
      expect(sum).assertEqual(9.125);
      expect(nativeAdd(-1.125, 10.25)).assertEqual(9.125);
      expect(nativeAdd(9.125, -(-1.125))).assertEqual(10.25);
      expect(nativeAdd(9.125, -(10.25))).assertEqual(-1.125);
      expect(nativeAdd(9.125, -(9.125))).assertEqual(0);
      expect(nativeAdd(10.25, -1.125)).assertEqual(10.25 + -1.125);
      {
      const sum: number = nativeAdd(10.625, -0.6875);
      logCase('testNativeFraction0029', `sum=${sum}`);
      expect(sum).assertEqual(9.9375);
      expect(nativeAdd(-0.6875, 10.625)).assertEqual(9.9375);
      expect(nativeAdd(9.9375, -(-0.6875))).assertEqual(10.625);
      expect(nativeAdd(9.9375, -(10.625))).assertEqual(-0.6875);
      expect(nativeAdd(9.9375, -(9.9375))).assertEqual(0);
      expect(nativeAdd(10.625, -0.6875)).assertEqual(10.625 + -0.6875);
      }
      {
      const sum: number = nativeAdd(11.0, -0.25);
      logCase('testNativeFraction0030', `sum=${sum}`);
      expect(sum).assertEqual(10.75);
      expect(nativeAdd(-0.25, 11.0)).assertEqual(10.75);
      expect(nativeAdd(10.75, -(-0.25))).assertEqual(11.0);
      expect(nativeAdd(10.75, -(11.0))).assertEqual(-0.25);
      expect(nativeAdd(10.75, -(10.75))).assertEqual(0);
      expect(nativeAdd(11.0, -0.25)).assertEqual(11.0 + -0.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0031
     * @tc.name      testNativeFraction0031
     * @tc.desc      Add binary fraction values 11.375 and 0.1875 and expect 11.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(11.375, 0.1875);
      logCase('testNativeFraction0031', `sum=${sum}`);
      expect(sum).assertEqual(11.5625);
      expect(nativeAdd(0.1875, 11.375)).assertEqual(11.5625);
      expect(nativeAdd(11.5625, -(0.1875))).assertEqual(11.375);
      expect(nativeAdd(11.5625, -(11.375))).assertEqual(0.1875);
      expect(nativeAdd(11.5625, -(11.5625))).assertEqual(0);
      expect(nativeAdd(11.375, 0.1875) > 11.375).assertTrue();
      expect(nativeAdd(11.375, 0.1875)).assertEqual(11.375 + 0.1875);
      {
      const sum: number = nativeAdd(11.75, 0.625);
      logCase('testNativeFraction0032', `sum=${sum}`);
      expect(sum).assertEqual(12.375);
      expect(nativeAdd(0.625, 11.75)).assertEqual(12.375);
      expect(nativeAdd(12.375, -(0.625))).assertEqual(11.75);
      expect(nativeAdd(12.375, -(11.75))).assertEqual(0.625);
      expect(nativeAdd(12.375, -(12.375))).assertEqual(0);
      expect(nativeAdd(11.75, 0.625) > 11.75).assertTrue();
      expect(nativeAdd(11.75, 0.625)).assertEqual(11.75 + 0.625);
      }
      {
      const sum: number = nativeAdd(12.125, 1.0625);
      logCase('testNativeFraction0033', `sum=${sum}`);
      expect(sum).assertEqual(13.1875);
      expect(nativeAdd(1.0625, 12.125)).assertEqual(13.1875);
      expect(nativeAdd(13.1875, -(1.0625))).assertEqual(12.125);
      expect(nativeAdd(13.1875, -(12.125))).assertEqual(1.0625);
      expect(nativeAdd(13.1875, -(13.1875))).assertEqual(0);
      expect(nativeAdd(12.125, 1.0625) > 12.125).assertTrue();
      expect(nativeAdd(12.125, 1.0625)).assertEqual(12.125 + 1.0625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0034
     * @tc.name      testNativeFraction0034
     * @tc.desc      Add binary fraction values 12.5 and 1.5 and expect 14.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(12.5, 1.5);
      logCase('testNativeFraction0034', `sum=${sum}`);
      expect(sum).assertEqual(14.0);
      expect(nativeAdd(1.5, 12.5)).assertEqual(14.0);
      expect(nativeAdd(14.0, -(1.5))).assertEqual(12.5);
      expect(nativeAdd(14.0, -(12.5))).assertEqual(1.5);
      expect(nativeAdd(14.0, -(14.0))).assertEqual(0);
      expect(nativeAdd(12.5, 1.5) > 12.5).assertTrue();
      expect(nativeAdd(12.5, 1.5)).assertEqual(12.5 + 1.5);
      {
      const sum: number = nativeAdd(12.875, 1.9375);
      logCase('testNativeFraction0035', `sum=${sum}`);
      expect(sum).assertEqual(14.8125);
      expect(nativeAdd(1.9375, 12.875)).assertEqual(14.8125);
      expect(nativeAdd(14.8125, -(1.9375))).assertEqual(12.875);
      expect(nativeAdd(14.8125, -(12.875))).assertEqual(1.9375);
      expect(nativeAdd(14.8125, -(14.8125))).assertEqual(0);
      expect(nativeAdd(12.875, 1.9375) > 12.875).assertTrue();
      expect(nativeAdd(12.875, 1.9375)).assertEqual(12.875 + 1.9375);
      }
      {
      const sum: number = nativeAdd(13.25, -1.4375);
      logCase('testNativeFraction0036', `sum=${sum}`);
      expect(sum).assertEqual(11.8125);
      expect(nativeAdd(-1.4375, 13.25)).assertEqual(11.8125);
      expect(nativeAdd(11.8125, -(-1.4375))).assertEqual(13.25);
      expect(nativeAdd(11.8125, -(13.25))).assertEqual(-1.4375);
      expect(nativeAdd(11.8125, -(11.8125))).assertEqual(0);
      expect(nativeAdd(13.25, -1.4375)).assertEqual(13.25 + -1.4375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0037
     * @tc.name      testNativeFraction0037
     * @tc.desc      Add binary fraction values 13.625 and -1.0 and expect 12.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(13.625, -1.0);
      logCase('testNativeFraction0037', `sum=${sum}`);
      expect(sum).assertEqual(12.625);
      expect(nativeAdd(-1.0, 13.625)).assertEqual(12.625);
      expect(nativeAdd(12.625, -(-1.0))).assertEqual(13.625);
      expect(nativeAdd(12.625, -(13.625))).assertEqual(-1.0);
      expect(nativeAdd(12.625, -(12.625))).assertEqual(0);
      expect(nativeAdd(13.625, -1.0)).assertEqual(13.625 + -1.0);
      {
      const sum: number = nativeAdd(14.0, -0.5625);
      logCase('testNativeFraction0038', `sum=${sum}`);
      expect(sum).assertEqual(13.4375);
      expect(nativeAdd(-0.5625, 14.0)).assertEqual(13.4375);
      expect(nativeAdd(13.4375, -(-0.5625))).assertEqual(14.0);
      expect(nativeAdd(13.4375, -(14.0))).assertEqual(-0.5625);
      expect(nativeAdd(13.4375, -(13.4375))).assertEqual(0);
      expect(nativeAdd(14.0, -0.5625)).assertEqual(14.0 + -0.5625);
      }
      {
      const sum: number = nativeAdd(14.375, -0.125);
      logCase('testNativeFraction0039', `sum=${sum}`);
      expect(sum).assertEqual(14.25);
      expect(nativeAdd(-0.125, 14.375)).assertEqual(14.25);
      expect(nativeAdd(14.25, -(-0.125))).assertEqual(14.375);
      expect(nativeAdd(14.25, -(14.375))).assertEqual(-0.125);
      expect(nativeAdd(14.25, -(14.25))).assertEqual(0);
      expect(nativeAdd(14.375, -0.125)).assertEqual(14.375 + -0.125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0040
     * @tc.name      testNativeFraction0040
     * @tc.desc      Add binary fraction values 14.75 and 0.3125 and expect 15.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(14.75, 0.3125);
      logCase('testNativeFraction0040', `sum=${sum}`);
      expect(sum).assertEqual(15.0625);
      expect(nativeAdd(0.3125, 14.75)).assertEqual(15.0625);
      expect(nativeAdd(15.0625, -(0.3125))).assertEqual(14.75);
      expect(nativeAdd(15.0625, -(14.75))).assertEqual(0.3125);
      expect(nativeAdd(15.0625, -(15.0625))).assertEqual(0);
      expect(nativeAdd(14.75, 0.3125) > 14.75).assertTrue();
      expect(nativeAdd(14.75, 0.3125)).assertEqual(14.75 + 0.3125);
      {
      const sum: number = nativeAdd(15.125, 0.75);
      logCase('testNativeFraction0041', `sum=${sum}`);
      expect(sum).assertEqual(15.875);
      expect(nativeAdd(0.75, 15.125)).assertEqual(15.875);
      expect(nativeAdd(15.875, -(0.75))).assertEqual(15.125);
      expect(nativeAdd(15.875, -(15.125))).assertEqual(0.75);
      expect(nativeAdd(15.875, -(15.875))).assertEqual(0);
      expect(nativeAdd(15.125, 0.75) > 15.125).assertTrue();
      expect(nativeAdd(15.125, 0.75)).assertEqual(15.125 + 0.75);
      }
      {
      const sum: number = nativeAdd(15.5, 1.1875);
      logCase('testNativeFraction0042', `sum=${sum}`);
      expect(sum).assertEqual(16.6875);
      expect(nativeAdd(1.1875, 15.5)).assertEqual(16.6875);
      expect(nativeAdd(16.6875, -(1.1875))).assertEqual(15.5);
      expect(nativeAdd(16.6875, -(15.5))).assertEqual(1.1875);
      expect(nativeAdd(16.6875, -(16.6875))).assertEqual(0);
      expect(nativeAdd(15.5, 1.1875) > 15.5).assertTrue();
      expect(nativeAdd(15.5, 1.1875)).assertEqual(15.5 + 1.1875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0043
     * @tc.name      testNativeFraction0043
     * @tc.desc      Add binary fraction values 15.875 and 1.625 and expect 17.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeFraction0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(15.875, 1.625);
      logCase('testNativeFraction0043', `sum=${sum}`);
      expect(sum).assertEqual(17.5);
      expect(nativeAdd(1.625, 15.875)).assertEqual(17.5);
      expect(nativeAdd(17.5, -(1.625))).assertEqual(15.875);
      expect(nativeAdd(17.5, -(15.875))).assertEqual(1.625);
      expect(nativeAdd(17.5, -(17.5))).assertEqual(0);
      expect(nativeAdd(15.875, 1.625) > 15.875).assertTrue();
      expect(nativeAdd(15.875, 1.625)).assertEqual(15.875 + 1.625);
      {
      const sum: number = nativeAdd(16.25, 2.0625);
      logCase('testNativeFraction0044', `sum=${sum}`);
      expect(sum).assertEqual(18.3125);
      expect(nativeAdd(2.0625, 16.25)).assertEqual(18.3125);
      expect(nativeAdd(18.3125, -(2.0625))).assertEqual(16.25);
      expect(nativeAdd(18.3125, -(16.25))).assertEqual(2.0625);
      expect(nativeAdd(18.3125, -(18.3125))).assertEqual(0);
      expect(nativeAdd(16.25, 2.0625) > 16.25).assertTrue();
      expect(nativeAdd(16.25, 2.0625)).assertEqual(16.25 + 2.0625);
      }
      {
      const sum: number = nativeAdd(16.625, -1.3125);
      logCase('testNativeFraction0045', `sum=${sum}`);
      expect(sum).assertEqual(15.3125);
      expect(nativeAdd(-1.3125, 16.625)).assertEqual(15.3125);
      expect(nativeAdd(15.3125, -(-1.3125))).assertEqual(16.625);
      expect(nativeAdd(15.3125, -(16.625))).assertEqual(-1.3125);
      expect(nativeAdd(15.3125, -(15.3125))).assertEqual(0);
      expect(nativeAdd(16.625, -1.3125)).assertEqual(16.625 + -1.3125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0046
     * @tc.name      testNativeFraction0046
     * @tc.desc      Add binary fraction values 17.0 and -0.875 and expect 16.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(17.0, -0.875);
      logCase('testNativeFraction0046', `sum=${sum}`);
      expect(sum).assertEqual(16.125);
      expect(nativeAdd(-0.875, 17.0)).assertEqual(16.125);
      expect(nativeAdd(16.125, -(-0.875))).assertEqual(17.0);
      expect(nativeAdd(16.125, -(17.0))).assertEqual(-0.875);
      expect(nativeAdd(16.125, -(16.125))).assertEqual(0);
      expect(nativeAdd(17.0, -0.875)).assertEqual(17.0 + -0.875);
      {
      const sum: number = nativeAdd(17.375, -0.4375);
      logCase('testNativeFraction0047', `sum=${sum}`);
      expect(sum).assertEqual(16.9375);
      expect(nativeAdd(-0.4375, 17.375)).assertEqual(16.9375);
      expect(nativeAdd(16.9375, -(-0.4375))).assertEqual(17.375);
      expect(nativeAdd(16.9375, -(17.375))).assertEqual(-0.4375);
      expect(nativeAdd(16.9375, -(16.9375))).assertEqual(0);
      expect(nativeAdd(17.375, -0.4375)).assertEqual(17.375 + -0.4375);
      }
      {
      const sum: number = nativeAdd(17.75, 0.0);
      logCase('testNativeFraction0048', `sum=${sum}`);
      expect(sum).assertEqual(17.75);
      expect(nativeAdd(0.0, 17.75)).assertEqual(17.75);
      expect(nativeAdd(17.75, -(0.0))).assertEqual(17.75);
      expect(nativeAdd(17.75, -(17.75))).assertEqual(0.0);
      expect(nativeAdd(17.75, -(17.75))).assertEqual(0);
      expect(nativeAdd(17.75, 0.0)).assertEqual(17.75 + 0.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0049
     * @tc.name      testNativeFraction0049
     * @tc.desc      Add binary fraction values 18.125 and 0.4375 and expect 18.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(18.125, 0.4375);
      logCase('testNativeFraction0049', `sum=${sum}`);
      expect(sum).assertEqual(18.5625);
      expect(nativeAdd(0.4375, 18.125)).assertEqual(18.5625);
      expect(nativeAdd(18.5625, -(0.4375))).assertEqual(18.125);
      expect(nativeAdd(18.5625, -(18.125))).assertEqual(0.4375);
      expect(nativeAdd(18.5625, -(18.5625))).assertEqual(0);
      expect(nativeAdd(18.125, 0.4375) > 18.125).assertTrue();
      expect(nativeAdd(18.125, 0.4375)).assertEqual(18.125 + 0.4375);
      {
      const sum: number = nativeAdd(18.5, 0.875);
      logCase('testNativeFraction0050', `sum=${sum}`);
      expect(sum).assertEqual(19.375);
      expect(nativeAdd(0.875, 18.5)).assertEqual(19.375);
      expect(nativeAdd(19.375, -(0.875))).assertEqual(18.5);
      expect(nativeAdd(19.375, -(18.5))).assertEqual(0.875);
      expect(nativeAdd(19.375, -(19.375))).assertEqual(0);
      expect(nativeAdd(18.5, 0.875) > 18.5).assertTrue();
      expect(nativeAdd(18.5, 0.875)).assertEqual(18.5 + 0.875);
      }
      {
      const sum: number = nativeAdd(18.875, 1.3125);
      logCase('testNativeFraction0051', `sum=${sum}`);
      expect(sum).assertEqual(20.1875);
      expect(nativeAdd(1.3125, 18.875)).assertEqual(20.1875);
      expect(nativeAdd(20.1875, -(1.3125))).assertEqual(18.875);
      expect(nativeAdd(20.1875, -(18.875))).assertEqual(1.3125);
      expect(nativeAdd(20.1875, -(20.1875))).assertEqual(0);
      expect(nativeAdd(18.875, 1.3125) > 18.875).assertTrue();
      expect(nativeAdd(18.875, 1.3125)).assertEqual(18.875 + 1.3125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0052
     * @tc.name      testNativeFraction0052
     * @tc.desc      Add binary fraction values 19.25 and 1.75 and expect 21.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(19.25, 1.75);
      logCase('testNativeFraction0052', `sum=${sum}`);
      expect(sum).assertEqual(21.0);
      expect(nativeAdd(1.75, 19.25)).assertEqual(21.0);
      expect(nativeAdd(21.0, -(1.75))).assertEqual(19.25);
      expect(nativeAdd(21.0, -(19.25))).assertEqual(1.75);
      expect(nativeAdd(21.0, -(21.0))).assertEqual(0);
      expect(nativeAdd(19.25, 1.75) > 19.25).assertTrue();
      expect(nativeAdd(19.25, 1.75)).assertEqual(19.25 + 1.75);
      {
      const sum: number = nativeAdd(19.625, 2.1875);
      logCase('testNativeFraction0053', `sum=${sum}`);
      expect(sum).assertEqual(21.8125);
      expect(nativeAdd(2.1875, 19.625)).assertEqual(21.8125);
      expect(nativeAdd(21.8125, -(2.1875))).assertEqual(19.625);
      expect(nativeAdd(21.8125, -(19.625))).assertEqual(2.1875);
      expect(nativeAdd(21.8125, -(21.8125))).assertEqual(0);
      expect(nativeAdd(19.625, 2.1875) > 19.625).assertTrue();
      expect(nativeAdd(19.625, 2.1875)).assertEqual(19.625 + 2.1875);
      }
      {
      const sum: number = nativeAdd(20.0, -1.1875);
      logCase('testNativeFraction0054', `sum=${sum}`);
      expect(sum).assertEqual(18.8125);
      expect(nativeAdd(-1.1875, 20.0)).assertEqual(18.8125);
      expect(nativeAdd(18.8125, -(-1.1875))).assertEqual(20.0);
      expect(nativeAdd(18.8125, -(20.0))).assertEqual(-1.1875);
      expect(nativeAdd(18.8125, -(18.8125))).assertEqual(0);
      expect(nativeAdd(20.0, -1.1875)).assertEqual(20.0 + -1.1875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0055
     * @tc.name      testNativeFraction0055
     * @tc.desc      Add binary fraction values 20.375 and -0.75 and expect 19.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(20.375, -0.75);
      logCase('testNativeFraction0055', `sum=${sum}`);
      expect(sum).assertEqual(19.625);
      expect(nativeAdd(-0.75, 20.375)).assertEqual(19.625);
      expect(nativeAdd(19.625, -(-0.75))).assertEqual(20.375);
      expect(nativeAdd(19.625, -(20.375))).assertEqual(-0.75);
      expect(nativeAdd(19.625, -(19.625))).assertEqual(0);
      expect(nativeAdd(20.375, -0.75)).assertEqual(20.375 + -0.75);
      {
      const sum: number = nativeAdd(20.75, -0.3125);
      logCase('testNativeFraction0056', `sum=${sum}`);
      expect(sum).assertEqual(20.4375);
      expect(nativeAdd(-0.3125, 20.75)).assertEqual(20.4375);
      expect(nativeAdd(20.4375, -(-0.3125))).assertEqual(20.75);
      expect(nativeAdd(20.4375, -(20.75))).assertEqual(-0.3125);
      expect(nativeAdd(20.4375, -(20.4375))).assertEqual(0);
      expect(nativeAdd(20.75, -0.3125)).assertEqual(20.75 + -0.3125);
      }
      {
      const sum: number = nativeAdd(21.125, 0.125);
      logCase('testNativeFraction0057', `sum=${sum}`);
      expect(sum).assertEqual(21.25);
      expect(nativeAdd(0.125, 21.125)).assertEqual(21.25);
      expect(nativeAdd(21.25, -(0.125))).assertEqual(21.125);
      expect(nativeAdd(21.25, -(21.125))).assertEqual(0.125);
      expect(nativeAdd(21.25, -(21.25))).assertEqual(0);
      expect(nativeAdd(21.125, 0.125) > 21.125).assertTrue();
      expect(nativeAdd(21.125, 0.125)).assertEqual(21.125 + 0.125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0058
     * @tc.name      testNativeFraction0058
     * @tc.desc      Add binary fraction values 21.5 and 0.5625 and expect 22.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(21.5, 0.5625);
      logCase('testNativeFraction0058', `sum=${sum}`);
      expect(sum).assertEqual(22.0625);
      expect(nativeAdd(0.5625, 21.5)).assertEqual(22.0625);
      expect(nativeAdd(22.0625, -(0.5625))).assertEqual(21.5);
      expect(nativeAdd(22.0625, -(21.5))).assertEqual(0.5625);
      expect(nativeAdd(22.0625, -(22.0625))).assertEqual(0);
      expect(nativeAdd(21.5, 0.5625) > 21.5).assertTrue();
      expect(nativeAdd(21.5, 0.5625)).assertEqual(21.5 + 0.5625);
      {
      const sum: number = nativeAdd(21.875, 1.0);
      logCase('testNativeFraction0059', `sum=${sum}`);
      expect(sum).assertEqual(22.875);
      expect(nativeAdd(1.0, 21.875)).assertEqual(22.875);
      expect(nativeAdd(22.875, -(1.0))).assertEqual(21.875);
      expect(nativeAdd(22.875, -(21.875))).assertEqual(1.0);
      expect(nativeAdd(22.875, -(22.875))).assertEqual(0);
      expect(nativeAdd(21.875, 1.0) > 21.875).assertTrue();
      expect(nativeAdd(21.875, 1.0)).assertEqual(21.875 + 1.0);
      }
      {
      const sum: number = nativeAdd(22.25, 1.4375);
      logCase('testNativeFraction0060', `sum=${sum}`);
      expect(sum).assertEqual(23.6875);
      expect(nativeAdd(1.4375, 22.25)).assertEqual(23.6875);
      expect(nativeAdd(23.6875, -(1.4375))).assertEqual(22.25);
      expect(nativeAdd(23.6875, -(22.25))).assertEqual(1.4375);
      expect(nativeAdd(23.6875, -(23.6875))).assertEqual(0);
      expect(nativeAdd(22.25, 1.4375) > 22.25).assertTrue();
      expect(nativeAdd(22.25, 1.4375)).assertEqual(22.25 + 1.4375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0061
     * @tc.name      testNativeFraction0061
     * @tc.desc      Add binary fraction values 22.625 and 1.875 and expect 24.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(22.625, 1.875);
      logCase('testNativeFraction0061', `sum=${sum}`);
      expect(sum).assertEqual(24.5);
      expect(nativeAdd(1.875, 22.625)).assertEqual(24.5);
      expect(nativeAdd(24.5, -(1.875))).assertEqual(22.625);
      expect(nativeAdd(24.5, -(22.625))).assertEqual(1.875);
      expect(nativeAdd(24.5, -(24.5))).assertEqual(0);
      expect(nativeAdd(22.625, 1.875) > 22.625).assertTrue();
      expect(nativeAdd(22.625, 1.875)).assertEqual(22.625 + 1.875);
      {
      const sum: number = nativeAdd(23.0, -1.5);
      logCase('testNativeFraction0062', `sum=${sum}`);
      expect(sum).assertEqual(21.5);
      expect(nativeAdd(-1.5, 23.0)).assertEqual(21.5);
      expect(nativeAdd(21.5, -(-1.5))).assertEqual(23.0);
      expect(nativeAdd(21.5, -(23.0))).assertEqual(-1.5);
      expect(nativeAdd(21.5, -(21.5))).assertEqual(0);
      expect(nativeAdd(23.0, -1.5)).assertEqual(23.0 + -1.5);
      }
      {
      const sum: number = nativeAdd(23.375, -1.0625);
      logCase('testNativeFraction0063', `sum=${sum}`);
      expect(sum).assertEqual(22.3125);
      expect(nativeAdd(-1.0625, 23.375)).assertEqual(22.3125);
      expect(nativeAdd(22.3125, -(-1.0625))).assertEqual(23.375);
      expect(nativeAdd(22.3125, -(23.375))).assertEqual(-1.0625);
      expect(nativeAdd(22.3125, -(22.3125))).assertEqual(0);
      expect(nativeAdd(23.375, -1.0625)).assertEqual(23.375 + -1.0625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0064
     * @tc.name      testNativeFraction0064
     * @tc.desc      Add binary fraction values 23.75 and -0.625 and expect 23.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(23.75, -0.625);
      logCase('testNativeFraction0064', `sum=${sum}`);
      expect(sum).assertEqual(23.125);
      expect(nativeAdd(-0.625, 23.75)).assertEqual(23.125);
      expect(nativeAdd(23.125, -(-0.625))).assertEqual(23.75);
      expect(nativeAdd(23.125, -(23.75))).assertEqual(-0.625);
      expect(nativeAdd(23.125, -(23.125))).assertEqual(0);
      expect(nativeAdd(23.75, -0.625)).assertEqual(23.75 + -0.625);
      {
      const sum: number = nativeAdd(24.125, -0.1875);
      logCase('testNativeFraction0065', `sum=${sum}`);
      expect(sum).assertEqual(23.9375);
      expect(nativeAdd(-0.1875, 24.125)).assertEqual(23.9375);
      expect(nativeAdd(23.9375, -(-0.1875))).assertEqual(24.125);
      expect(nativeAdd(23.9375, -(24.125))).assertEqual(-0.1875);
      expect(nativeAdd(23.9375, -(23.9375))).assertEqual(0);
      expect(nativeAdd(24.125, -0.1875)).assertEqual(24.125 + -0.1875);
      }
      {
      const sum: number = nativeAdd(24.5, 0.25);
      logCase('testNativeFraction0066', `sum=${sum}`);
      expect(sum).assertEqual(24.75);
      expect(nativeAdd(0.25, 24.5)).assertEqual(24.75);
      expect(nativeAdd(24.75, -(0.25))).assertEqual(24.5);
      expect(nativeAdd(24.75, -(24.5))).assertEqual(0.25);
      expect(nativeAdd(24.75, -(24.75))).assertEqual(0);
      expect(nativeAdd(24.5, 0.25) > 24.5).assertTrue();
      expect(nativeAdd(24.5, 0.25)).assertEqual(24.5 + 0.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0067
     * @tc.name      testNativeFraction0067
     * @tc.desc      Add binary fraction values 24.875 and 0.6875 and expect 25.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(24.875, 0.6875);
      logCase('testNativeFraction0067', `sum=${sum}`);
      expect(sum).assertEqual(25.5625);
      expect(nativeAdd(0.6875, 24.875)).assertEqual(25.5625);
      expect(nativeAdd(25.5625, -(0.6875))).assertEqual(24.875);
      expect(nativeAdd(25.5625, -(24.875))).assertEqual(0.6875);
      expect(nativeAdd(25.5625, -(25.5625))).assertEqual(0);
      expect(nativeAdd(24.875, 0.6875) > 24.875).assertTrue();
      expect(nativeAdd(24.875, 0.6875)).assertEqual(24.875 + 0.6875);
      {
      const sum: number = nativeAdd(25.25, 1.125);
      logCase('testNativeFraction0068', `sum=${sum}`);
      expect(sum).assertEqual(26.375);
      expect(nativeAdd(1.125, 25.25)).assertEqual(26.375);
      expect(nativeAdd(26.375, -(1.125))).assertEqual(25.25);
      expect(nativeAdd(26.375, -(25.25))).assertEqual(1.125);
      expect(nativeAdd(26.375, -(26.375))).assertEqual(0);
      expect(nativeAdd(25.25, 1.125) > 25.25).assertTrue();
      expect(nativeAdd(25.25, 1.125)).assertEqual(25.25 + 1.125);
      }
      {
      const sum: number = nativeAdd(25.625, 1.5625);
      logCase('testNativeFraction0069', `sum=${sum}`);
      expect(sum).assertEqual(27.1875);
      expect(nativeAdd(1.5625, 25.625)).assertEqual(27.1875);
      expect(nativeAdd(27.1875, -(1.5625))).assertEqual(25.625);
      expect(nativeAdd(27.1875, -(25.625))).assertEqual(1.5625);
      expect(nativeAdd(27.1875, -(27.1875))).assertEqual(0);
      expect(nativeAdd(25.625, 1.5625) > 25.625).assertTrue();
      expect(nativeAdd(25.625, 1.5625)).assertEqual(25.625 + 1.5625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0070
     * @tc.name      testNativeFraction0070
     * @tc.desc      Add binary fraction values 26.0 and 2.0 and expect 28.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(26.0, 2.0);
      logCase('testNativeFraction0070', `sum=${sum}`);
      expect(sum).assertEqual(28.0);
      expect(nativeAdd(2.0, 26.0)).assertEqual(28.0);
      expect(nativeAdd(28.0, -(2.0))).assertEqual(26.0);
      expect(nativeAdd(28.0, -(26.0))).assertEqual(2.0);
      expect(nativeAdd(28.0, -(28.0))).assertEqual(0);
      expect(nativeAdd(26.0, 2.0) > 26.0).assertTrue();
      expect(nativeAdd(26.0, 2.0)).assertEqual(26.0 + 2.0);
      {
      const sum: number = nativeAdd(26.375, -1.375);
      logCase('testNativeFraction0071', `sum=${sum}`);
      expect(sum).assertEqual(25.0);
      expect(nativeAdd(-1.375, 26.375)).assertEqual(25.0);
      expect(nativeAdd(25.0, -(-1.375))).assertEqual(26.375);
      expect(nativeAdd(25.0, -(26.375))).assertEqual(-1.375);
      expect(nativeAdd(25.0, -(25.0))).assertEqual(0);
      expect(nativeAdd(26.375, -1.375)).assertEqual(26.375 + -1.375);
      }
      {
      const sum: number = nativeAdd(26.75, -0.9375);
      logCase('testNativeFraction0072', `sum=${sum}`);
      expect(sum).assertEqual(25.8125);
      expect(nativeAdd(-0.9375, 26.75)).assertEqual(25.8125);
      expect(nativeAdd(25.8125, -(-0.9375))).assertEqual(26.75);
      expect(nativeAdd(25.8125, -(26.75))).assertEqual(-0.9375);
      expect(nativeAdd(25.8125, -(25.8125))).assertEqual(0);
      expect(nativeAdd(26.75, -0.9375)).assertEqual(26.75 + -0.9375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0073
     * @tc.name      testNativeFraction0073
     * @tc.desc      Add binary fraction values 27.125 and -0.5 and expect 26.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(27.125, -0.5);
      logCase('testNativeFraction0073', `sum=${sum}`);
      expect(sum).assertEqual(26.625);
      expect(nativeAdd(-0.5, 27.125)).assertEqual(26.625);
      expect(nativeAdd(26.625, -(-0.5))).assertEqual(27.125);
      expect(nativeAdd(26.625, -(27.125))).assertEqual(-0.5);
      expect(nativeAdd(26.625, -(26.625))).assertEqual(0);
      expect(nativeAdd(27.125, -0.5)).assertEqual(27.125 + -0.5);
      {
      const sum: number = nativeAdd(27.5, -0.0625);
      logCase('testNativeFraction0074', `sum=${sum}`);
      expect(sum).assertEqual(27.4375);
      expect(nativeAdd(-0.0625, 27.5)).assertEqual(27.4375);
      expect(nativeAdd(27.4375, -(-0.0625))).assertEqual(27.5);
      expect(nativeAdd(27.4375, -(27.5))).assertEqual(-0.0625);
      expect(nativeAdd(27.4375, -(27.4375))).assertEqual(0);
      expect(nativeAdd(27.5, -0.0625)).assertEqual(27.5 + -0.0625);
      }
      {
      const sum: number = nativeAdd(27.875, 0.375);
      logCase('testNativeFraction0075', `sum=${sum}`);
      expect(sum).assertEqual(28.25);
      expect(nativeAdd(0.375, 27.875)).assertEqual(28.25);
      expect(nativeAdd(28.25, -(0.375))).assertEqual(27.875);
      expect(nativeAdd(28.25, -(27.875))).assertEqual(0.375);
      expect(nativeAdd(28.25, -(28.25))).assertEqual(0);
      expect(nativeAdd(27.875, 0.375) > 27.875).assertTrue();
      expect(nativeAdd(27.875, 0.375)).assertEqual(27.875 + 0.375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0076
     * @tc.name      testNativeFraction0076
     * @tc.desc      Add binary fraction values 28.25 and 0.8125 and expect 29.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(28.25, 0.8125);
      logCase('testNativeFraction0076', `sum=${sum}`);
      expect(sum).assertEqual(29.0625);
      expect(nativeAdd(0.8125, 28.25)).assertEqual(29.0625);
      expect(nativeAdd(29.0625, -(0.8125))).assertEqual(28.25);
      expect(nativeAdd(29.0625, -(28.25))).assertEqual(0.8125);
      expect(nativeAdd(29.0625, -(29.0625))).assertEqual(0);
      expect(nativeAdd(28.25, 0.8125) > 28.25).assertTrue();
      expect(nativeAdd(28.25, 0.8125)).assertEqual(28.25 + 0.8125);
      {
      const sum: number = nativeAdd(28.625, 1.25);
      logCase('testNativeFraction0077', `sum=${sum}`);
      expect(sum).assertEqual(29.875);
      expect(nativeAdd(1.25, 28.625)).assertEqual(29.875);
      expect(nativeAdd(29.875, -(1.25))).assertEqual(28.625);
      expect(nativeAdd(29.875, -(28.625))).assertEqual(1.25);
      expect(nativeAdd(29.875, -(29.875))).assertEqual(0);
      expect(nativeAdd(28.625, 1.25) > 28.625).assertTrue();
      expect(nativeAdd(28.625, 1.25)).assertEqual(28.625 + 1.25);
      }
      {
      const sum: number = nativeAdd(29.0, 1.6875);
      logCase('testNativeFraction0078', `sum=${sum}`);
      expect(sum).assertEqual(30.6875);
      expect(nativeAdd(1.6875, 29.0)).assertEqual(30.6875);
      expect(nativeAdd(30.6875, -(1.6875))).assertEqual(29.0);
      expect(nativeAdd(30.6875, -(29.0))).assertEqual(1.6875);
      expect(nativeAdd(30.6875, -(30.6875))).assertEqual(0);
      expect(nativeAdd(29.0, 1.6875) > 29.0).assertTrue();
      expect(nativeAdd(29.0, 1.6875)).assertEqual(29.0 + 1.6875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0079
     * @tc.name      testNativeFraction0079
     * @tc.desc      Add binary fraction values 29.375 and 2.125 and expect 31.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(29.375, 2.125);
      logCase('testNativeFraction0079', `sum=${sum}`);
      expect(sum).assertEqual(31.5);
      expect(nativeAdd(2.125, 29.375)).assertEqual(31.5);
      expect(nativeAdd(31.5, -(2.125))).assertEqual(29.375);
      expect(nativeAdd(31.5, -(29.375))).assertEqual(2.125);
      expect(nativeAdd(31.5, -(31.5))).assertEqual(0);
      expect(nativeAdd(29.375, 2.125) > 29.375).assertTrue();
      expect(nativeAdd(29.375, 2.125)).assertEqual(29.375 + 2.125);
      {
      const sum: number = nativeAdd(29.75, -1.25);
      logCase('testNativeFraction0080', `sum=${sum}`);
      expect(sum).assertEqual(28.5);
      expect(nativeAdd(-1.25, 29.75)).assertEqual(28.5);
      expect(nativeAdd(28.5, -(-1.25))).assertEqual(29.75);
      expect(nativeAdd(28.5, -(29.75))).assertEqual(-1.25);
      expect(nativeAdd(28.5, -(28.5))).assertEqual(0);
      expect(nativeAdd(29.75, -1.25)).assertEqual(29.75 + -1.25);
      }
      {
      const sum: number = nativeAdd(30.125, -0.8125);
      logCase('testNativeFraction0081', `sum=${sum}`);
      expect(sum).assertEqual(29.3125);
      expect(nativeAdd(-0.8125, 30.125)).assertEqual(29.3125);
      expect(nativeAdd(29.3125, -(-0.8125))).assertEqual(30.125);
      expect(nativeAdd(29.3125, -(30.125))).assertEqual(-0.8125);
      expect(nativeAdd(29.3125, -(29.3125))).assertEqual(0);
      expect(nativeAdd(30.125, -0.8125)).assertEqual(30.125 + -0.8125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0082
     * @tc.name      testNativeFraction0082
     * @tc.desc      Add binary fraction values 30.5 and -0.375 and expect 30.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(30.5, -0.375);
      logCase('testNativeFraction0082', `sum=${sum}`);
      expect(sum).assertEqual(30.125);
      expect(nativeAdd(-0.375, 30.5)).assertEqual(30.125);
      expect(nativeAdd(30.125, -(-0.375))).assertEqual(30.5);
      expect(nativeAdd(30.125, -(30.5))).assertEqual(-0.375);
      expect(nativeAdd(30.125, -(30.125))).assertEqual(0);
      expect(nativeAdd(30.5, -0.375)).assertEqual(30.5 + -0.375);
      {
      const sum: number = nativeAdd(30.875, 0.0625);
      logCase('testNativeFraction0083', `sum=${sum}`);
      expect(sum).assertEqual(30.9375);
      expect(nativeAdd(0.0625, 30.875)).assertEqual(30.9375);
      expect(nativeAdd(30.9375, -(0.0625))).assertEqual(30.875);
      expect(nativeAdd(30.9375, -(30.875))).assertEqual(0.0625);
      expect(nativeAdd(30.9375, -(30.9375))).assertEqual(0);
      expect(nativeAdd(30.875, 0.0625) > 30.875).assertTrue();
      expect(nativeAdd(30.875, 0.0625)).assertEqual(30.875 + 0.0625);
      }
      {
      const sum: number = nativeAdd(31.25, 0.5);
      logCase('testNativeFraction0084', `sum=${sum}`);
      expect(sum).assertEqual(31.75);
      expect(nativeAdd(0.5, 31.25)).assertEqual(31.75);
      expect(nativeAdd(31.75, -(0.5))).assertEqual(31.25);
      expect(nativeAdd(31.75, -(31.25))).assertEqual(0.5);
      expect(nativeAdd(31.75, -(31.75))).assertEqual(0);
      expect(nativeAdd(31.25, 0.5) > 31.25).assertTrue();
      expect(nativeAdd(31.25, 0.5)).assertEqual(31.25 + 0.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0085
     * @tc.name      testNativeFraction0085
     * @tc.desc      Add binary fraction values 31.625 and 0.9375 and expect 32.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(31.625, 0.9375);
      logCase('testNativeFraction0085', `sum=${sum}`);
      expect(sum).assertEqual(32.5625);
      expect(nativeAdd(0.9375, 31.625)).assertEqual(32.5625);
      expect(nativeAdd(32.5625, -(0.9375))).assertEqual(31.625);
      expect(nativeAdd(32.5625, -(31.625))).assertEqual(0.9375);
      expect(nativeAdd(32.5625, -(32.5625))).assertEqual(0);
      expect(nativeAdd(31.625, 0.9375) > 31.625).assertTrue();
      expect(nativeAdd(31.625, 0.9375)).assertEqual(31.625 + 0.9375);
      {
      const sum: number = nativeAdd(32.0, 1.375);
      logCase('testNativeFraction0086', `sum=${sum}`);
      expect(sum).assertEqual(33.375);
      expect(nativeAdd(1.375, 32.0)).assertEqual(33.375);
      expect(nativeAdd(33.375, -(1.375))).assertEqual(32.0);
      expect(nativeAdd(33.375, -(32.0))).assertEqual(1.375);
      expect(nativeAdd(33.375, -(33.375))).assertEqual(0);
      expect(nativeAdd(32.0, 1.375) > 32.0).assertTrue();
      expect(nativeAdd(32.0, 1.375)).assertEqual(32.0 + 1.375);
      }
      {
      const sum: number = nativeAdd(32.375, 1.8125);
      logCase('testNativeFraction0087', `sum=${sum}`);
      expect(sum).assertEqual(34.1875);
      expect(nativeAdd(1.8125, 32.375)).assertEqual(34.1875);
      expect(nativeAdd(34.1875, -(1.8125))).assertEqual(32.375);
      expect(nativeAdd(34.1875, -(32.375))).assertEqual(1.8125);
      expect(nativeAdd(34.1875, -(34.1875))).assertEqual(0);
      expect(nativeAdd(32.375, 1.8125) > 32.375).assertTrue();
      expect(nativeAdd(32.375, 1.8125)).assertEqual(32.375 + 1.8125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0088
     * @tc.name      testNativeFraction0088
     * @tc.desc      Add binary fraction values 32.75 and 2.25 and expect 35.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(32.75, 2.25);
      logCase('testNativeFraction0088', `sum=${sum}`);
      expect(sum).assertEqual(35.0);
      expect(nativeAdd(2.25, 32.75)).assertEqual(35.0);
      expect(nativeAdd(35.0, -(2.25))).assertEqual(32.75);
      expect(nativeAdd(35.0, -(32.75))).assertEqual(2.25);
      expect(nativeAdd(35.0, -(35.0))).assertEqual(0);
      expect(nativeAdd(32.75, 2.25) > 32.75).assertTrue();
      expect(nativeAdd(32.75, 2.25)).assertEqual(32.75 + 2.25);
      {
      const sum: number = nativeAdd(33.125, -1.125);
      logCase('testNativeFraction0089', `sum=${sum}`);
      expect(sum).assertEqual(32.0);
      expect(nativeAdd(-1.125, 33.125)).assertEqual(32.0);
      expect(nativeAdd(32.0, -(-1.125))).assertEqual(33.125);
      expect(nativeAdd(32.0, -(33.125))).assertEqual(-1.125);
      expect(nativeAdd(32.0, -(32.0))).assertEqual(0);
      expect(nativeAdd(33.125, -1.125)).assertEqual(33.125 + -1.125);
      }
      {
      const sum: number = nativeAdd(33.5, -0.6875);
      logCase('testNativeFraction0090', `sum=${sum}`);
      expect(sum).assertEqual(32.8125);
      expect(nativeAdd(-0.6875, 33.5)).assertEqual(32.8125);
      expect(nativeAdd(32.8125, -(-0.6875))).assertEqual(33.5);
      expect(nativeAdd(32.8125, -(33.5))).assertEqual(-0.6875);
      expect(nativeAdd(32.8125, -(32.8125))).assertEqual(0);
      expect(nativeAdd(33.5, -0.6875)).assertEqual(33.5 + -0.6875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0091
     * @tc.name      testNativeFraction0091
     * @tc.desc      Add binary fraction values 33.875 and -0.25 and expect 33.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(33.875, -0.25);
      logCase('testNativeFraction0091', `sum=${sum}`);
      expect(sum).assertEqual(33.625);
      expect(nativeAdd(-0.25, 33.875)).assertEqual(33.625);
      expect(nativeAdd(33.625, -(-0.25))).assertEqual(33.875);
      expect(nativeAdd(33.625, -(33.875))).assertEqual(-0.25);
      expect(nativeAdd(33.625, -(33.625))).assertEqual(0);
      expect(nativeAdd(33.875, -0.25)).assertEqual(33.875 + -0.25);
      {
      const sum: number = nativeAdd(34.25, 0.1875);
      logCase('testNativeFraction0092', `sum=${sum}`);
      expect(sum).assertEqual(34.4375);
      expect(nativeAdd(0.1875, 34.25)).assertEqual(34.4375);
      expect(nativeAdd(34.4375, -(0.1875))).assertEqual(34.25);
      expect(nativeAdd(34.4375, -(34.25))).assertEqual(0.1875);
      expect(nativeAdd(34.4375, -(34.4375))).assertEqual(0);
      expect(nativeAdd(34.25, 0.1875) > 34.25).assertTrue();
      expect(nativeAdd(34.25, 0.1875)).assertEqual(34.25 + 0.1875);
      }
      {
      const sum: number = nativeAdd(34.625, 0.625);
      logCase('testNativeFraction0093', `sum=${sum}`);
      expect(sum).assertEqual(35.25);
      expect(nativeAdd(0.625, 34.625)).assertEqual(35.25);
      expect(nativeAdd(35.25, -(0.625))).assertEqual(34.625);
      expect(nativeAdd(35.25, -(34.625))).assertEqual(0.625);
      expect(nativeAdd(35.25, -(35.25))).assertEqual(0);
      expect(nativeAdd(34.625, 0.625) > 34.625).assertTrue();
      expect(nativeAdd(34.625, 0.625)).assertEqual(34.625 + 0.625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0094
     * @tc.name      testNativeFraction0094
     * @tc.desc      Add binary fraction values 35.0 and 1.0625 and expect 36.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(35.0, 1.0625);
      logCase('testNativeFraction0094', `sum=${sum}`);
      expect(sum).assertEqual(36.0625);
      expect(nativeAdd(1.0625, 35.0)).assertEqual(36.0625);
      expect(nativeAdd(36.0625, -(1.0625))).assertEqual(35.0);
      expect(nativeAdd(36.0625, -(35.0))).assertEqual(1.0625);
      expect(nativeAdd(36.0625, -(36.0625))).assertEqual(0);
      expect(nativeAdd(35.0, 1.0625) > 35.0).assertTrue();
      expect(nativeAdd(35.0, 1.0625)).assertEqual(35.0 + 1.0625);
      {
      const sum: number = nativeAdd(35.375, 1.5);
      logCase('testNativeFraction0095', `sum=${sum}`);
      expect(sum).assertEqual(36.875);
      expect(nativeAdd(1.5, 35.375)).assertEqual(36.875);
      expect(nativeAdd(36.875, -(1.5))).assertEqual(35.375);
      expect(nativeAdd(36.875, -(35.375))).assertEqual(1.5);
      expect(nativeAdd(36.875, -(36.875))).assertEqual(0);
      expect(nativeAdd(35.375, 1.5) > 35.375).assertTrue();
      expect(nativeAdd(35.375, 1.5)).assertEqual(35.375 + 1.5);
      }
      {
      const sum: number = nativeAdd(35.75, 1.9375);
      logCase('testNativeFraction0096', `sum=${sum}`);
      expect(sum).assertEqual(37.6875);
      expect(nativeAdd(1.9375, 35.75)).assertEqual(37.6875);
      expect(nativeAdd(37.6875, -(1.9375))).assertEqual(35.75);
      expect(nativeAdd(37.6875, -(35.75))).assertEqual(1.9375);
      expect(nativeAdd(37.6875, -(37.6875))).assertEqual(0);
      expect(nativeAdd(35.75, 1.9375) > 35.75).assertTrue();
      expect(nativeAdd(35.75, 1.9375)).assertEqual(35.75 + 1.9375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0097
     * @tc.name      testNativeFraction0097
     * @tc.desc      Add binary fraction values 36.125 and -1.4375 and expect 34.6875
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(36.125, -1.4375);
      logCase('testNativeFraction0097', `sum=${sum}`);
      expect(sum).assertEqual(34.6875);
      expect(nativeAdd(-1.4375, 36.125)).assertEqual(34.6875);
      expect(nativeAdd(34.6875, -(-1.4375))).assertEqual(36.125);
      expect(nativeAdd(34.6875, -(36.125))).assertEqual(-1.4375);
      expect(nativeAdd(34.6875, -(34.6875))).assertEqual(0);
      expect(nativeAdd(36.125, -1.4375)).assertEqual(36.125 + -1.4375);
      {
      const sum: number = nativeAdd(36.5, -1.0);
      logCase('testNativeFraction0098', `sum=${sum}`);
      expect(sum).assertEqual(35.5);
      expect(nativeAdd(-1.0, 36.5)).assertEqual(35.5);
      expect(nativeAdd(35.5, -(-1.0))).assertEqual(36.5);
      expect(nativeAdd(35.5, -(36.5))).assertEqual(-1.0);
      expect(nativeAdd(35.5, -(35.5))).assertEqual(0);
      expect(nativeAdd(36.5, -1.0)).assertEqual(36.5 + -1.0);
      }
      {
      const sum: number = nativeAdd(36.875, -0.5625);
      logCase('testNativeFraction0099', `sum=${sum}`);
      expect(sum).assertEqual(36.3125);
      expect(nativeAdd(-0.5625, 36.875)).assertEqual(36.3125);
      expect(nativeAdd(36.3125, -(-0.5625))).assertEqual(36.875);
      expect(nativeAdd(36.3125, -(36.875))).assertEqual(-0.5625);
      expect(nativeAdd(36.3125, -(36.3125))).assertEqual(0);
      expect(nativeAdd(36.875, -0.5625)).assertEqual(36.875 + -0.5625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0100
     * @tc.name      testNativeFraction0100
     * @tc.desc      Add binary fraction values 37.25 and -0.125 and expect 37.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(37.25, -0.125);
      logCase('testNativeFraction0100', `sum=${sum}`);
      expect(sum).assertEqual(37.125);
      expect(nativeAdd(-0.125, 37.25)).assertEqual(37.125);
      expect(nativeAdd(37.125, -(-0.125))).assertEqual(37.25);
      expect(nativeAdd(37.125, -(37.25))).assertEqual(-0.125);
      expect(nativeAdd(37.125, -(37.125))).assertEqual(0);
      expect(nativeAdd(37.25, -0.125)).assertEqual(37.25 + -0.125);
      {
      const sum: number = nativeAdd(37.625, 0.3125);
      logCase('testNativeFraction0101', `sum=${sum}`);
      expect(sum).assertEqual(37.9375);
      expect(nativeAdd(0.3125, 37.625)).assertEqual(37.9375);
      expect(nativeAdd(37.9375, -(0.3125))).assertEqual(37.625);
      expect(nativeAdd(37.9375, -(37.625))).assertEqual(0.3125);
      expect(nativeAdd(37.9375, -(37.9375))).assertEqual(0);
      expect(nativeAdd(37.625, 0.3125) > 37.625).assertTrue();
      expect(nativeAdd(37.625, 0.3125)).assertEqual(37.625 + 0.3125);
      }
      {
      const sum: number = nativeAdd(38.0, 0.75);
      logCase('testNativeFraction0102', `sum=${sum}`);
      expect(sum).assertEqual(38.75);
      expect(nativeAdd(0.75, 38.0)).assertEqual(38.75);
      expect(nativeAdd(38.75, -(0.75))).assertEqual(38.0);
      expect(nativeAdd(38.75, -(38.0))).assertEqual(0.75);
      expect(nativeAdd(38.75, -(38.75))).assertEqual(0);
      expect(nativeAdd(38.0, 0.75) > 38.0).assertTrue();
      expect(nativeAdd(38.0, 0.75)).assertEqual(38.0 + 0.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0103
     * @tc.name      testNativeFraction0103
     * @tc.desc      Add binary fraction values 38.375 and 1.1875 and expect 39.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(38.375, 1.1875);
      logCase('testNativeFraction0103', `sum=${sum}`);
      expect(sum).assertEqual(39.5625);
      expect(nativeAdd(1.1875, 38.375)).assertEqual(39.5625);
      expect(nativeAdd(39.5625, -(1.1875))).assertEqual(38.375);
      expect(nativeAdd(39.5625, -(38.375))).assertEqual(1.1875);
      expect(nativeAdd(39.5625, -(39.5625))).assertEqual(0);
      expect(nativeAdd(38.375, 1.1875) > 38.375).assertTrue();
      expect(nativeAdd(38.375, 1.1875)).assertEqual(38.375 + 1.1875);
      {
      const sum: number = nativeAdd(38.75, 1.625);
      logCase('testNativeFraction0104', `sum=${sum}`);
      expect(sum).assertEqual(40.375);
      expect(nativeAdd(1.625, 38.75)).assertEqual(40.375);
      expect(nativeAdd(40.375, -(1.625))).assertEqual(38.75);
      expect(nativeAdd(40.375, -(38.75))).assertEqual(1.625);
      expect(nativeAdd(40.375, -(40.375))).assertEqual(0);
      expect(nativeAdd(38.75, 1.625) > 38.75).assertTrue();
      expect(nativeAdd(38.75, 1.625)).assertEqual(38.75 + 1.625);
      }
      {
      const sum: number = nativeAdd(39.125, 2.0625);
      logCase('testNativeFraction0105', `sum=${sum}`);
      expect(sum).assertEqual(41.1875);
      expect(nativeAdd(2.0625, 39.125)).assertEqual(41.1875);
      expect(nativeAdd(41.1875, -(2.0625))).assertEqual(39.125);
      expect(nativeAdd(41.1875, -(39.125))).assertEqual(2.0625);
      expect(nativeAdd(41.1875, -(41.1875))).assertEqual(0);
      expect(nativeAdd(39.125, 2.0625) > 39.125).assertTrue();
      expect(nativeAdd(39.125, 2.0625)).assertEqual(39.125 + 2.0625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0106
     * @tc.name      testNativeFraction0106
     * @tc.desc      Add binary fraction values 39.5 and -1.3125 and expect 38.1875
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(39.5, -1.3125);
      logCase('testNativeFraction0106', `sum=${sum}`);
      expect(sum).assertEqual(38.1875);
      expect(nativeAdd(-1.3125, 39.5)).assertEqual(38.1875);
      expect(nativeAdd(38.1875, -(-1.3125))).assertEqual(39.5);
      expect(nativeAdd(38.1875, -(39.5))).assertEqual(-1.3125);
      expect(nativeAdd(38.1875, -(38.1875))).assertEqual(0);
      expect(nativeAdd(39.5, -1.3125)).assertEqual(39.5 + -1.3125);
      {
      const sum: number = nativeAdd(39.875, -0.875);
      logCase('testNativeFraction0107', `sum=${sum}`);
      expect(sum).assertEqual(39.0);
      expect(nativeAdd(-0.875, 39.875)).assertEqual(39.0);
      expect(nativeAdd(39.0, -(-0.875))).assertEqual(39.875);
      expect(nativeAdd(39.0, -(39.875))).assertEqual(-0.875);
      expect(nativeAdd(39.0, -(39.0))).assertEqual(0);
      expect(nativeAdd(39.875, -0.875)).assertEqual(39.875 + -0.875);
      }
      {
      const sum: number = nativeAdd(40.25, -0.4375);
      logCase('testNativeFraction0108', `sum=${sum}`);
      expect(sum).assertEqual(39.8125);
      expect(nativeAdd(-0.4375, 40.25)).assertEqual(39.8125);
      expect(nativeAdd(39.8125, -(-0.4375))).assertEqual(40.25);
      expect(nativeAdd(39.8125, -(40.25))).assertEqual(-0.4375);
      expect(nativeAdd(39.8125, -(39.8125))).assertEqual(0);
      expect(nativeAdd(40.25, -0.4375)).assertEqual(40.25 + -0.4375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0109
     * @tc.name      testNativeFraction0109
     * @tc.desc      Add binary fraction values 40.625 and 0.0 and expect 40.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeFraction0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(40.625, 0.0);
      logCase('testNativeFraction0109', `sum=${sum}`);
      expect(sum).assertEqual(40.625);
      expect(nativeAdd(0.0, 40.625)).assertEqual(40.625);
      expect(nativeAdd(40.625, -(0.0))).assertEqual(40.625);
      expect(nativeAdd(40.625, -(40.625))).assertEqual(0.0);
      expect(nativeAdd(40.625, -(40.625))).assertEqual(0);
      expect(nativeAdd(40.625, 0.0)).assertEqual(40.625 + 0.0);
      {
      const sum: number = nativeAdd(41.0, 0.4375);
      logCase('testNativeFraction0110', `sum=${sum}`);
      expect(sum).assertEqual(41.4375);
      expect(nativeAdd(0.4375, 41.0)).assertEqual(41.4375);
      expect(nativeAdd(41.4375, -(0.4375))).assertEqual(41.0);
      expect(nativeAdd(41.4375, -(41.0))).assertEqual(0.4375);
      expect(nativeAdd(41.4375, -(41.4375))).assertEqual(0);
      expect(nativeAdd(41.0, 0.4375) > 41.0).assertTrue();
      expect(nativeAdd(41.0, 0.4375)).assertEqual(41.0 + 0.4375);
      }
      {
      const sum: number = nativeAdd(41.375, 0.875);
      logCase('testNativeFraction0111', `sum=${sum}`);
      expect(sum).assertEqual(42.25);
      expect(nativeAdd(0.875, 41.375)).assertEqual(42.25);
      expect(nativeAdd(42.25, -(0.875))).assertEqual(41.375);
      expect(nativeAdd(42.25, -(41.375))).assertEqual(0.875);
      expect(nativeAdd(42.25, -(42.25))).assertEqual(0);
      expect(nativeAdd(41.375, 0.875) > 41.375).assertTrue();
      expect(nativeAdd(41.375, 0.875)).assertEqual(41.375 + 0.875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0112
     * @tc.name      testNativeFraction0112
     * @tc.desc      Add binary fraction values 41.75 and 1.3125 and expect 43.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(41.75, 1.3125);
      logCase('testNativeFraction0112', `sum=${sum}`);
      expect(sum).assertEqual(43.0625);
      expect(nativeAdd(1.3125, 41.75)).assertEqual(43.0625);
      expect(nativeAdd(43.0625, -(1.3125))).assertEqual(41.75);
      expect(nativeAdd(43.0625, -(41.75))).assertEqual(1.3125);
      expect(nativeAdd(43.0625, -(43.0625))).assertEqual(0);
      expect(nativeAdd(41.75, 1.3125) > 41.75).assertTrue();
      expect(nativeAdd(41.75, 1.3125)).assertEqual(41.75 + 1.3125);
      {
      const sum: number = nativeAdd(42.125, 1.75);
      logCase('testNativeFraction0113', `sum=${sum}`);
      expect(sum).assertEqual(43.875);
      expect(nativeAdd(1.75, 42.125)).assertEqual(43.875);
      expect(nativeAdd(43.875, -(1.75))).assertEqual(42.125);
      expect(nativeAdd(43.875, -(42.125))).assertEqual(1.75);
      expect(nativeAdd(43.875, -(43.875))).assertEqual(0);
      expect(nativeAdd(42.125, 1.75) > 42.125).assertTrue();
      expect(nativeAdd(42.125, 1.75)).assertEqual(42.125 + 1.75);
      }
      {
      const sum: number = nativeAdd(42.5, 2.1875);
      logCase('testNativeFraction0114', `sum=${sum}`);
      expect(sum).assertEqual(44.6875);
      expect(nativeAdd(2.1875, 42.5)).assertEqual(44.6875);
      expect(nativeAdd(44.6875, -(2.1875))).assertEqual(42.5);
      expect(nativeAdd(44.6875, -(42.5))).assertEqual(2.1875);
      expect(nativeAdd(44.6875, -(44.6875))).assertEqual(0);
      expect(nativeAdd(42.5, 2.1875) > 42.5).assertTrue();
      expect(nativeAdd(42.5, 2.1875)).assertEqual(42.5 + 2.1875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0115
     * @tc.name      testNativeFraction0115
     * @tc.desc      Add binary fraction values 42.875 and -1.1875 and expect 41.6875
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(42.875, -1.1875);
      logCase('testNativeFraction0115', `sum=${sum}`);
      expect(sum).assertEqual(41.6875);
      expect(nativeAdd(-1.1875, 42.875)).assertEqual(41.6875);
      expect(nativeAdd(41.6875, -(-1.1875))).assertEqual(42.875);
      expect(nativeAdd(41.6875, -(42.875))).assertEqual(-1.1875);
      expect(nativeAdd(41.6875, -(41.6875))).assertEqual(0);
      expect(nativeAdd(42.875, -1.1875)).assertEqual(42.875 + -1.1875);
      {
      const sum: number = nativeAdd(43.25, -0.75);
      logCase('testNativeFraction0116', `sum=${sum}`);
      expect(sum).assertEqual(42.5);
      expect(nativeAdd(-0.75, 43.25)).assertEqual(42.5);
      expect(nativeAdd(42.5, -(-0.75))).assertEqual(43.25);
      expect(nativeAdd(42.5, -(43.25))).assertEqual(-0.75);
      expect(nativeAdd(42.5, -(42.5))).assertEqual(0);
      expect(nativeAdd(43.25, -0.75)).assertEqual(43.25 + -0.75);
      }
      {
      const sum: number = nativeAdd(43.625, -0.3125);
      logCase('testNativeFraction0117', `sum=${sum}`);
      expect(sum).assertEqual(43.3125);
      expect(nativeAdd(-0.3125, 43.625)).assertEqual(43.3125);
      expect(nativeAdd(43.3125, -(-0.3125))).assertEqual(43.625);
      expect(nativeAdd(43.3125, -(43.625))).assertEqual(-0.3125);
      expect(nativeAdd(43.3125, -(43.3125))).assertEqual(0);
      expect(nativeAdd(43.625, -0.3125)).assertEqual(43.625 + -0.3125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0118
     * @tc.name      testNativeFraction0118
     * @tc.desc      Add binary fraction values 44.0 and 0.125 and expect 44.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(44.0, 0.125);
      logCase('testNativeFraction0118', `sum=${sum}`);
      expect(sum).assertEqual(44.125);
      expect(nativeAdd(0.125, 44.0)).assertEqual(44.125);
      expect(nativeAdd(44.125, -(0.125))).assertEqual(44.0);
      expect(nativeAdd(44.125, -(44.0))).assertEqual(0.125);
      expect(nativeAdd(44.125, -(44.125))).assertEqual(0);
      expect(nativeAdd(44.0, 0.125) > 44.0).assertTrue();
      expect(nativeAdd(44.0, 0.125)).assertEqual(44.0 + 0.125);
      {
      const sum: number = nativeAdd(44.375, 0.5625);
      logCase('testNativeFraction0119', `sum=${sum}`);
      expect(sum).assertEqual(44.9375);
      expect(nativeAdd(0.5625, 44.375)).assertEqual(44.9375);
      expect(nativeAdd(44.9375, -(0.5625))).assertEqual(44.375);
      expect(nativeAdd(44.9375, -(44.375))).assertEqual(0.5625);
      expect(nativeAdd(44.9375, -(44.9375))).assertEqual(0);
      expect(nativeAdd(44.375, 0.5625) > 44.375).assertTrue();
      expect(nativeAdd(44.375, 0.5625)).assertEqual(44.375 + 0.5625);
      }
      {
      const sum: number = nativeAdd(44.75, 1.0);
      logCase('testNativeFraction0120', `sum=${sum}`);
      expect(sum).assertEqual(45.75);
      expect(nativeAdd(1.0, 44.75)).assertEqual(45.75);
      expect(nativeAdd(45.75, -(1.0))).assertEqual(44.75);
      expect(nativeAdd(45.75, -(44.75))).assertEqual(1.0);
      expect(nativeAdd(45.75, -(45.75))).assertEqual(0);
      expect(nativeAdd(44.75, 1.0) > 44.75).assertTrue();
      expect(nativeAdd(44.75, 1.0)).assertEqual(44.75 + 1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0121
     * @tc.name      testNativeFraction0121
     * @tc.desc      Add binary fraction values 45.125 and 1.4375 and expect 46.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(45.125, 1.4375);
      logCase('testNativeFraction0121', `sum=${sum}`);
      expect(sum).assertEqual(46.5625);
      expect(nativeAdd(1.4375, 45.125)).assertEqual(46.5625);
      expect(nativeAdd(46.5625, -(1.4375))).assertEqual(45.125);
      expect(nativeAdd(46.5625, -(45.125))).assertEqual(1.4375);
      expect(nativeAdd(46.5625, -(46.5625))).assertEqual(0);
      expect(nativeAdd(45.125, 1.4375) > 45.125).assertTrue();
      expect(nativeAdd(45.125, 1.4375)).assertEqual(45.125 + 1.4375);
      {
      const sum: number = nativeAdd(45.5, 1.875);
      logCase('testNativeFraction0122', `sum=${sum}`);
      expect(sum).assertEqual(47.375);
      expect(nativeAdd(1.875, 45.5)).assertEqual(47.375);
      expect(nativeAdd(47.375, -(1.875))).assertEqual(45.5);
      expect(nativeAdd(47.375, -(45.5))).assertEqual(1.875);
      expect(nativeAdd(47.375, -(47.375))).assertEqual(0);
      expect(nativeAdd(45.5, 1.875) > 45.5).assertTrue();
      expect(nativeAdd(45.5, 1.875)).assertEqual(45.5 + 1.875);
      }
      {
      const sum: number = nativeAdd(45.875, -1.5);
      logCase('testNativeFraction0123', `sum=${sum}`);
      expect(sum).assertEqual(44.375);
      expect(nativeAdd(-1.5, 45.875)).assertEqual(44.375);
      expect(nativeAdd(44.375, -(-1.5))).assertEqual(45.875);
      expect(nativeAdd(44.375, -(45.875))).assertEqual(-1.5);
      expect(nativeAdd(44.375, -(44.375))).assertEqual(0);
      expect(nativeAdd(45.875, -1.5)).assertEqual(45.875 + -1.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0124
     * @tc.name      testNativeFraction0124
     * @tc.desc      Add binary fraction values 46.25 and -1.0625 and expect 45.1875
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(46.25, -1.0625);
      logCase('testNativeFraction0124', `sum=${sum}`);
      expect(sum).assertEqual(45.1875);
      expect(nativeAdd(-1.0625, 46.25)).assertEqual(45.1875);
      expect(nativeAdd(45.1875, -(-1.0625))).assertEqual(46.25);
      expect(nativeAdd(45.1875, -(46.25))).assertEqual(-1.0625);
      expect(nativeAdd(45.1875, -(45.1875))).assertEqual(0);
      expect(nativeAdd(46.25, -1.0625)).assertEqual(46.25 + -1.0625);
      {
      const sum: number = nativeAdd(46.625, -0.625);
      logCase('testNativeFraction0125', `sum=${sum}`);
      expect(sum).assertEqual(46.0);
      expect(nativeAdd(-0.625, 46.625)).assertEqual(46.0);
      expect(nativeAdd(46.0, -(-0.625))).assertEqual(46.625);
      expect(nativeAdd(46.0, -(46.625))).assertEqual(-0.625);
      expect(nativeAdd(46.0, -(46.0))).assertEqual(0);
      expect(nativeAdd(46.625, -0.625)).assertEqual(46.625 + -0.625);
      }
      {
      const sum: number = nativeAdd(47.0, -0.1875);
      logCase('testNativeFraction0126', `sum=${sum}`);
      expect(sum).assertEqual(46.8125);
      expect(nativeAdd(-0.1875, 47.0)).assertEqual(46.8125);
      expect(nativeAdd(46.8125, -(-0.1875))).assertEqual(47.0);
      expect(nativeAdd(46.8125, -(47.0))).assertEqual(-0.1875);
      expect(nativeAdd(46.8125, -(46.8125))).assertEqual(0);
      expect(nativeAdd(47.0, -0.1875)).assertEqual(47.0 + -0.1875);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0127
     * @tc.name      testNativeFraction0127
     * @tc.desc      Add binary fraction values 47.375 and 0.25 and expect 47.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(47.375, 0.25);
      logCase('testNativeFraction0127', `sum=${sum}`);
      expect(sum).assertEqual(47.625);
      expect(nativeAdd(0.25, 47.375)).assertEqual(47.625);
      expect(nativeAdd(47.625, -(0.25))).assertEqual(47.375);
      expect(nativeAdd(47.625, -(47.375))).assertEqual(0.25);
      expect(nativeAdd(47.625, -(47.625))).assertEqual(0);
      expect(nativeAdd(47.375, 0.25) > 47.375).assertTrue();
      expect(nativeAdd(47.375, 0.25)).assertEqual(47.375 + 0.25);
      {
      const sum: number = nativeAdd(47.75, 0.6875);
      logCase('testNativeFraction0128', `sum=${sum}`);
      expect(sum).assertEqual(48.4375);
      expect(nativeAdd(0.6875, 47.75)).assertEqual(48.4375);
      expect(nativeAdd(48.4375, -(0.6875))).assertEqual(47.75);
      expect(nativeAdd(48.4375, -(47.75))).assertEqual(0.6875);
      expect(nativeAdd(48.4375, -(48.4375))).assertEqual(0);
      expect(nativeAdd(47.75, 0.6875) > 47.75).assertTrue();
      expect(nativeAdd(47.75, 0.6875)).assertEqual(47.75 + 0.6875);
      }
      {
      const sum: number = nativeAdd(48.125, 1.125);
      logCase('testNativeFraction0129', `sum=${sum}`);
      expect(sum).assertEqual(49.25);
      expect(nativeAdd(1.125, 48.125)).assertEqual(49.25);
      expect(nativeAdd(49.25, -(1.125))).assertEqual(48.125);
      expect(nativeAdd(49.25, -(48.125))).assertEqual(1.125);
      expect(nativeAdd(49.25, -(49.25))).assertEqual(0);
      expect(nativeAdd(48.125, 1.125) > 48.125).assertTrue();
      expect(nativeAdd(48.125, 1.125)).assertEqual(48.125 + 1.125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0130
     * @tc.name      testNativeFraction0130
     * @tc.desc      Add binary fraction values 48.5 and 1.5625 and expect 50.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(48.5, 1.5625);
      logCase('testNativeFraction0130', `sum=${sum}`);
      expect(sum).assertEqual(50.0625);
      expect(nativeAdd(1.5625, 48.5)).assertEqual(50.0625);
      expect(nativeAdd(50.0625, -(1.5625))).assertEqual(48.5);
      expect(nativeAdd(50.0625, -(48.5))).assertEqual(1.5625);
      expect(nativeAdd(50.0625, -(50.0625))).assertEqual(0);
      expect(nativeAdd(48.5, 1.5625) > 48.5).assertTrue();
      expect(nativeAdd(48.5, 1.5625)).assertEqual(48.5 + 1.5625);
      {
      const sum: number = nativeAdd(48.875, 2.0);
      logCase('testNativeFraction0131', `sum=${sum}`);
      expect(sum).assertEqual(50.875);
      expect(nativeAdd(2.0, 48.875)).assertEqual(50.875);
      expect(nativeAdd(50.875, -(2.0))).assertEqual(48.875);
      expect(nativeAdd(50.875, -(48.875))).assertEqual(2.0);
      expect(nativeAdd(50.875, -(50.875))).assertEqual(0);
      expect(nativeAdd(48.875, 2.0) > 48.875).assertTrue();
      expect(nativeAdd(48.875, 2.0)).assertEqual(48.875 + 2.0);
      }
      {
      const sum: number = nativeAdd(49.25, -1.375);
      logCase('testNativeFraction0132', `sum=${sum}`);
      expect(sum).assertEqual(47.875);
      expect(nativeAdd(-1.375, 49.25)).assertEqual(47.875);
      expect(nativeAdd(47.875, -(-1.375))).assertEqual(49.25);
      expect(nativeAdd(47.875, -(49.25))).assertEqual(-1.375);
      expect(nativeAdd(47.875, -(47.875))).assertEqual(0);
      expect(nativeAdd(49.25, -1.375)).assertEqual(49.25 + -1.375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0133
     * @tc.name      testNativeFraction0133
     * @tc.desc      Add binary fraction values 49.625 and -0.9375 and expect 48.6875
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(49.625, -0.9375);
      logCase('testNativeFraction0133', `sum=${sum}`);
      expect(sum).assertEqual(48.6875);
      expect(nativeAdd(-0.9375, 49.625)).assertEqual(48.6875);
      expect(nativeAdd(48.6875, -(-0.9375))).assertEqual(49.625);
      expect(nativeAdd(48.6875, -(49.625))).assertEqual(-0.9375);
      expect(nativeAdd(48.6875, -(48.6875))).assertEqual(0);
      expect(nativeAdd(49.625, -0.9375)).assertEqual(49.625 + -0.9375);
      {
      const sum: number = nativeAdd(50.0, -0.5);
      logCase('testNativeFraction0134', `sum=${sum}`);
      expect(sum).assertEqual(49.5);
      expect(nativeAdd(-0.5, 50.0)).assertEqual(49.5);
      expect(nativeAdd(49.5, -(-0.5))).assertEqual(50.0);
      expect(nativeAdd(49.5, -(50.0))).assertEqual(-0.5);
      expect(nativeAdd(49.5, -(49.5))).assertEqual(0);
      expect(nativeAdd(50.0, -0.5)).assertEqual(50.0 + -0.5);
      }
      {
      const sum: number = nativeAdd(50.375, -0.0625);
      logCase('testNativeFraction0135', `sum=${sum}`);
      expect(sum).assertEqual(50.3125);
      expect(nativeAdd(-0.0625, 50.375)).assertEqual(50.3125);
      expect(nativeAdd(50.3125, -(-0.0625))).assertEqual(50.375);
      expect(nativeAdd(50.3125, -(50.375))).assertEqual(-0.0625);
      expect(nativeAdd(50.3125, -(50.3125))).assertEqual(0);
      expect(nativeAdd(50.375, -0.0625)).assertEqual(50.375 + -0.0625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0136
     * @tc.name      testNativeFraction0136
     * @tc.desc      Add binary fraction values 50.75 and 0.375 and expect 51.125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(50.75, 0.375);
      logCase('testNativeFraction0136', `sum=${sum}`);
      expect(sum).assertEqual(51.125);
      expect(nativeAdd(0.375, 50.75)).assertEqual(51.125);
      expect(nativeAdd(51.125, -(0.375))).assertEqual(50.75);
      expect(nativeAdd(51.125, -(50.75))).assertEqual(0.375);
      expect(nativeAdd(51.125, -(51.125))).assertEqual(0);
      expect(nativeAdd(50.75, 0.375) > 50.75).assertTrue();
      expect(nativeAdd(50.75, 0.375)).assertEqual(50.75 + 0.375);
      {
      const sum: number = nativeAdd(51.125, 0.8125);
      logCase('testNativeFraction0137', `sum=${sum}`);
      expect(sum).assertEqual(51.9375);
      expect(nativeAdd(0.8125, 51.125)).assertEqual(51.9375);
      expect(nativeAdd(51.9375, -(0.8125))).assertEqual(51.125);
      expect(nativeAdd(51.9375, -(51.125))).assertEqual(0.8125);
      expect(nativeAdd(51.9375, -(51.9375))).assertEqual(0);
      expect(nativeAdd(51.125, 0.8125) > 51.125).assertTrue();
      expect(nativeAdd(51.125, 0.8125)).assertEqual(51.125 + 0.8125);
      }
      {
      const sum: number = nativeAdd(51.5, 1.25);
      logCase('testNativeFraction0138', `sum=${sum}`);
      expect(sum).assertEqual(52.75);
      expect(nativeAdd(1.25, 51.5)).assertEqual(52.75);
      expect(nativeAdd(52.75, -(1.25))).assertEqual(51.5);
      expect(nativeAdd(52.75, -(51.5))).assertEqual(1.25);
      expect(nativeAdd(52.75, -(52.75))).assertEqual(0);
      expect(nativeAdd(51.5, 1.25) > 51.5).assertTrue();
      expect(nativeAdd(51.5, 1.25)).assertEqual(51.5 + 1.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0139
     * @tc.name      testNativeFraction0139
     * @tc.desc      Add binary fraction values 51.875 and 1.6875 and expect 53.5625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(51.875, 1.6875);
      logCase('testNativeFraction0139', `sum=${sum}`);
      expect(sum).assertEqual(53.5625);
      expect(nativeAdd(1.6875, 51.875)).assertEqual(53.5625);
      expect(nativeAdd(53.5625, -(1.6875))).assertEqual(51.875);
      expect(nativeAdd(53.5625, -(51.875))).assertEqual(1.6875);
      expect(nativeAdd(53.5625, -(53.5625))).assertEqual(0);
      expect(nativeAdd(51.875, 1.6875) > 51.875).assertTrue();
      expect(nativeAdd(51.875, 1.6875)).assertEqual(51.875 + 1.6875);
      {
      const sum: number = nativeAdd(52.25, 2.125);
      logCase('testNativeFraction0140', `sum=${sum}`);
      expect(sum).assertEqual(54.375);
      expect(nativeAdd(2.125, 52.25)).assertEqual(54.375);
      expect(nativeAdd(54.375, -(2.125))).assertEqual(52.25);
      expect(nativeAdd(54.375, -(52.25))).assertEqual(2.125);
      expect(nativeAdd(54.375, -(54.375))).assertEqual(0);
      expect(nativeAdd(52.25, 2.125) > 52.25).assertTrue();
      expect(nativeAdd(52.25, 2.125)).assertEqual(52.25 + 2.125);
      }
      {
      const sum: number = nativeAdd(52.625, -1.25);
      logCase('testNativeFraction0141', `sum=${sum}`);
      expect(sum).assertEqual(51.375);
      expect(nativeAdd(-1.25, 52.625)).assertEqual(51.375);
      expect(nativeAdd(51.375, -(-1.25))).assertEqual(52.625);
      expect(nativeAdd(51.375, -(52.625))).assertEqual(-1.25);
      expect(nativeAdd(51.375, -(51.375))).assertEqual(0);
      expect(nativeAdd(52.625, -1.25)).assertEqual(52.625 + -1.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0142
     * @tc.name      testNativeFraction0142
     * @tc.desc      Add binary fraction values 53.0 and -0.8125 and expect 52.1875
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(53.0, -0.8125);
      logCase('testNativeFraction0142', `sum=${sum}`);
      expect(sum).assertEqual(52.1875);
      expect(nativeAdd(-0.8125, 53.0)).assertEqual(52.1875);
      expect(nativeAdd(52.1875, -(-0.8125))).assertEqual(53.0);
      expect(nativeAdd(52.1875, -(53.0))).assertEqual(-0.8125);
      expect(nativeAdd(52.1875, -(52.1875))).assertEqual(0);
      expect(nativeAdd(53.0, -0.8125)).assertEqual(53.0 + -0.8125);
      {
      const sum: number = nativeAdd(53.375, -0.375);
      logCase('testNativeFraction0143', `sum=${sum}`);
      expect(sum).assertEqual(53.0);
      expect(nativeAdd(-0.375, 53.375)).assertEqual(53.0);
      expect(nativeAdd(53.0, -(-0.375))).assertEqual(53.375);
      expect(nativeAdd(53.0, -(53.375))).assertEqual(-0.375);
      expect(nativeAdd(53.0, -(53.0))).assertEqual(0);
      expect(nativeAdd(53.375, -0.375)).assertEqual(53.375 + -0.375);
      }
      {
      const sum: number = nativeAdd(53.75, 0.0625);
      logCase('testNativeFraction0144', `sum=${sum}`);
      expect(sum).assertEqual(53.8125);
      expect(nativeAdd(0.0625, 53.75)).assertEqual(53.8125);
      expect(nativeAdd(53.8125, -(0.0625))).assertEqual(53.75);
      expect(nativeAdd(53.8125, -(53.75))).assertEqual(0.0625);
      expect(nativeAdd(53.8125, -(53.8125))).assertEqual(0);
      expect(nativeAdd(53.75, 0.0625) > 53.75).assertTrue();
      expect(nativeAdd(53.75, 0.0625)).assertEqual(53.75 + 0.0625);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0145
     * @tc.name      testNativeFraction0145
     * @tc.desc      Add binary fraction values 54.125 and 0.5 and expect 54.625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(54.125, 0.5);
      logCase('testNativeFraction0145', `sum=${sum}`);
      expect(sum).assertEqual(54.625);
      expect(nativeAdd(0.5, 54.125)).assertEqual(54.625);
      expect(nativeAdd(54.625, -(0.5))).assertEqual(54.125);
      expect(nativeAdd(54.625, -(54.125))).assertEqual(0.5);
      expect(nativeAdd(54.625, -(54.625))).assertEqual(0);
      expect(nativeAdd(54.125, 0.5) > 54.125).assertTrue();
      expect(nativeAdd(54.125, 0.5)).assertEqual(54.125 + 0.5);
      {
      const sum: number = nativeAdd(54.5, 0.9375);
      logCase('testNativeFraction0146', `sum=${sum}`);
      expect(sum).assertEqual(55.4375);
      expect(nativeAdd(0.9375, 54.5)).assertEqual(55.4375);
      expect(nativeAdd(55.4375, -(0.9375))).assertEqual(54.5);
      expect(nativeAdd(55.4375, -(54.5))).assertEqual(0.9375);
      expect(nativeAdd(55.4375, -(55.4375))).assertEqual(0);
      expect(nativeAdd(54.5, 0.9375) > 54.5).assertTrue();
      expect(nativeAdd(54.5, 0.9375)).assertEqual(54.5 + 0.9375);
      }
      {
      const sum: number = nativeAdd(54.875, 1.375);
      logCase('testNativeFraction0147', `sum=${sum}`);
      expect(sum).assertEqual(56.25);
      expect(nativeAdd(1.375, 54.875)).assertEqual(56.25);
      expect(nativeAdd(56.25, -(1.375))).assertEqual(54.875);
      expect(nativeAdd(56.25, -(54.875))).assertEqual(1.375);
      expect(nativeAdd(56.25, -(56.25))).assertEqual(0);
      expect(nativeAdd(54.875, 1.375) > 54.875).assertTrue();
      expect(nativeAdd(54.875, 1.375)).assertEqual(54.875 + 1.375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_FRACTION_0148
     * @tc.name      testNativeFraction0148
     * @tc.desc      Add binary fraction values 55.25 and 1.8125 and expect 57.0625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeFraction0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(55.25, 1.8125);
      logCase('testNativeFraction0148', `sum=${sum}`);
      expect(sum).assertEqual(57.0625);
      expect(nativeAdd(1.8125, 55.25)).assertEqual(57.0625);
      expect(nativeAdd(57.0625, -(1.8125))).assertEqual(55.25);
      expect(nativeAdd(57.0625, -(55.25))).assertEqual(1.8125);
      expect(nativeAdd(57.0625, -(57.0625))).assertEqual(0);
      expect(nativeAdd(55.25, 1.8125) > 55.25).assertTrue();
      expect(nativeAdd(55.25, 1.8125)).assertEqual(55.25 + 1.8125);
      {
      const sum: number = nativeAdd(55.625, 2.25);
      logCase('testNativeFraction0149', `sum=${sum}`);
      expect(sum).assertEqual(57.875);
      expect(nativeAdd(2.25, 55.625)).assertEqual(57.875);
      expect(nativeAdd(57.875, -(2.25))).assertEqual(55.625);
      expect(nativeAdd(57.875, -(55.625))).assertEqual(2.25);
      expect(nativeAdd(57.875, -(57.875))).assertEqual(0);
      expect(nativeAdd(55.625, 2.25) > 55.625).assertTrue();
      expect(nativeAdd(55.625, 2.25)).assertEqual(55.625 + 2.25);
      }
      {
      const sum: number = nativeAdd(56.0, -1.125);
      logCase('testNativeFraction0150', `sum=${sum}`);
      expect(sum).assertEqual(54.875);
      expect(nativeAdd(-1.125, 56.0)).assertEqual(54.875);
      expect(nativeAdd(54.875, -(-1.125))).assertEqual(56.0);
      expect(nativeAdd(54.875, -(56.0))).assertEqual(-1.125);
      expect(nativeAdd(54.875, -(54.875))).assertEqual(0);
      expect(nativeAdd(56.0, -1.125)).assertEqual(56.0 + -1.125);
      }
    });

  });
}
