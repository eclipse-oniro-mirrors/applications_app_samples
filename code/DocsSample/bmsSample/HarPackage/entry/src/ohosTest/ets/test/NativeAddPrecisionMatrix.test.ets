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

export default function nativeAddPrecisionMatrixTest() {
  describe('NativeAddPrecisionMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0001
     * @tc.name      testNativePrecision0001
     * @tc.desc      Add decimal values 0.1 and 0.8 and expect the IEEE 754 sum 0.9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.1, 0.8);
      logCase('testNativePrecision0001', `sum=${sum}`);
      expect(sum).assertEqual(0.9);
      expect(nativeAdd(0.8, 0.1)).assertEqual(0.9);
      expect(nativeAdd(0.9, -(0.1))).assertEqual(0.8);
      expect(nativeAdd(0.9, -(0.9))).assertEqual(0);
      expect(nativeAdd(0.1, 0.8) > 0.1).assertTrue();
      expect(nativeAdd(0.1, 0.8)).assertEqual(0.1 + 0.8);
      {
      const sum: number = nativeAdd(0.2, 3.15);
      logCase('testNativePrecision0002', `sum=${sum}`);
      expect(sum).assertEqual(3.35);
      expect(nativeAdd(3.15, 0.2)).assertEqual(3.35);
      expect(nativeAdd(3.35, -(0.2))).assertEqual(3.15);
      expect(nativeAdd(3.35, -(3.35))).assertEqual(0);
      expect(nativeAdd(0.2, 3.15) > 0.2).assertTrue();
      expect(nativeAdd(0.2, 3.15)).assertEqual(0.2 + 3.15);
      }
      {
      const sum: number = nativeAdd(0.3, 8.95);
      logCase('testNativePrecision0003', `sum=${sum}`);
      expect(sum).assertEqual(9.25);
      expect(nativeAdd(8.95, 0.3)).assertEqual(9.25);
      expect(nativeAdd(9.25, -(0.3))).assertEqual(8.95);
      expect(nativeAdd(9.25, -(9.25))).assertEqual(0);
      expect(nativeAdd(0.3, 8.95) > 0.3).assertTrue();
      expect(nativeAdd(0.3, 8.95)).assertEqual(0.3 + 8.95);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0004
     * @tc.name      testNativePrecision0004
     * @tc.desc      Add decimal values 0.4 and 123.45 and expect the IEEE 754 sum 123.85000000000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.4, 123.45);
      logCase('testNativePrecision0004', `sum=${sum}`);
      expect(sum).assertEqual(123.85000000000001);
      expect(nativeAdd(123.45, 0.4)).assertEqual(123.85000000000001);
      expect(nativeAdd(123.85000000000001, -(0.4))).assertEqual(123.45);
      expect(nativeAdd(123.85000000000001, -(123.85000000000001))).assertEqual(0);
      expect(nativeAdd(0.4, 123.45) > 0.4).assertTrue();
      expect(nativeAdd(0.4, 123.45)).assertEqual(0.4 + 123.45);
      {
      const sum: number = nativeAdd(0.5, 0.2);
      logCase('testNativePrecision0005', `sum=${sum}`);
      expect(sum).assertEqual(0.7);
      expect(nativeAdd(0.2, 0.5)).assertEqual(0.7);
      expect(nativeAdd(0.7, -(0.7))).assertEqual(0);
      expect(nativeAdd(0.5, 0.2) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 0.2)).assertEqual(0.5 + 0.2);
      }
      {
      const sum: number = nativeAdd(0.6, 0.7);
      logCase('testNativePrecision0006', `sum=${sum}`);
      expect(sum).assertEqual(1.2999999999999998);
      expect(nativeAdd(0.7, 0.6)).assertEqual(1.2999999999999998);
      expect(nativeAdd(1.2999999999999998, -(1.2999999999999998))).assertEqual(0);
      expect(nativeAdd(0.6, 0.7) > 0.6).assertTrue();
      expect(nativeAdd(0.6, 0.7)).assertEqual(0.6 + 0.7);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0007
     * @tc.name      testNativePrecision0007
     * @tc.desc      Add decimal values 0.7 and 2.75 and expect the IEEE 754 sum 3.45
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.7, 2.75);
      logCase('testNativePrecision0007', `sum=${sum}`);
      expect(sum).assertEqual(3.45);
      expect(nativeAdd(2.75, 0.7)).assertEqual(3.45);
      expect(nativeAdd(3.45, -(0.7))).assertEqual(2.75);
      expect(nativeAdd(3.45, -(3.45))).assertEqual(0);
      expect(nativeAdd(0.7, 2.75) > 0.7).assertTrue();
      expect(nativeAdd(0.7, 2.75)).assertEqual(0.7 + 2.75);
      {
      const sum: number = nativeAdd(0.8, 7.85);
      logCase('testNativePrecision0008', `sum=${sum}`);
      expect(sum).assertEqual(8.65);
      expect(nativeAdd(7.85, 0.8)).assertEqual(8.65);
      expect(nativeAdd(8.65, -(8.65))).assertEqual(0);
      expect(nativeAdd(0.8, 7.85) > 0.8).assertTrue();
      expect(nativeAdd(0.8, 7.85)).assertEqual(0.8 + 7.85);
      }
      {
      const sum: number = nativeAdd(0.9, 90.12);
      logCase('testNativePrecision0009', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(90.12, 0.9)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(0.9, 90.12) > 0.9).assertTrue();
      expect(nativeAdd(0.9, 90.12)).assertEqual(0.9 + 90.12);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0010
     * @tc.name      testNativePrecision0010
     * @tc.desc      Add decimal values 1.1 and 0.1 and expect the IEEE 754 sum 1.2000000000000002
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1.1, 0.1);
      logCase('testNativePrecision0010', `sum=${sum}`);
      expect(sum).assertEqual(1.2000000000000002);
      expect(nativeAdd(0.1, 1.1)).assertEqual(1.2000000000000002);
      expect(nativeAdd(1.2000000000000002, -(0.1))).assertEqual(1.1);
      expect(nativeAdd(1.2000000000000002, -(1.2000000000000002))).assertEqual(0);
      expect(nativeAdd(1.1, 0.1) > 1.1).assertTrue();
      expect(nativeAdd(1.1, 0.1)).assertEqual(1.1 + 0.1);
      {
      const sum: number = nativeAdd(1.25, 0.6);
      logCase('testNativePrecision0011', `sum=${sum}`);
      expect(sum).assertEqual(1.85);
      expect(nativeAdd(0.6, 1.25)).assertEqual(1.85);
      expect(nativeAdd(1.85, -(0.6))).assertEqual(1.25);
      expect(nativeAdd(1.85, -(1.85))).assertEqual(0);
      expect(nativeAdd(1.25, 0.6) > 1.25).assertTrue();
      expect(nativeAdd(1.25, 0.6)).assertEqual(1.25 + 0.6);
      }
      {
      const sum: number = nativeAdd(2.75, 1.25);
      logCase('testNativePrecision0012', `sum=${sum}`);
      expect(sum).assertEqual(4.0);
      expect(nativeAdd(1.25, 2.75)).assertEqual(4.0);
      expect(nativeAdd(4.0, -(1.25))).assertEqual(2.75);
      expect(nativeAdd(4.0, -(2.75))).assertEqual(1.25);
      expect(nativeAdd(4.0, -(4.0))).assertEqual(0);
      expect(nativeAdd(2.75, 1.25) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.25)).assertEqual(2.75 + 1.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0013
     * @tc.name      testNativePrecision0013
     * @tc.desc      Add decimal values 3.15 and 6.65 and expect the IEEE 754 sum 9.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(3.15, 6.65);
      logCase('testNativePrecision0013', `sum=${sum}`);
      expect(sum).assertEqual(9.8);
      expect(nativeAdd(6.65, 3.15)).assertEqual(9.8);
      expect(nativeAdd(9.8, -(3.15))).assertEqual(6.65);
      expect(nativeAdd(9.8, -(9.8))).assertEqual(0);
      expect(nativeAdd(3.15, 6.65) > 3.15).assertTrue();
      expect(nativeAdd(3.15, 6.65)).assertEqual(3.15 + 6.65);
      {
      const sum: number = nativeAdd(4.35, 56.78);
      logCase('testNativePrecision0014', `sum=${sum}`);
      expect(sum).assertEqual(61.13);
      expect(nativeAdd(56.78, 4.35)).assertEqual(61.13);
      expect(nativeAdd(61.13, -(4.35))).assertEqual(56.78);
      expect(nativeAdd(61.13, -(61.13))).assertEqual(0);
      expect(nativeAdd(4.35, 56.78) > 4.35).assertTrue();
      expect(nativeAdd(4.35, 56.78)).assertEqual(4.35 + 56.78);
      }
      {
      const sum: number = nativeAdd(5.55, 0.005);
      logCase('testNativePrecision0015', `sum=${sum}`);
      expect(sum).assertEqual(5.555);
      expect(nativeAdd(0.005, 5.55)).assertEqual(5.555);
      expect(nativeAdd(5.555, -(0.005))).assertEqual(5.55);
      expect(nativeAdd(5.555, -(5.555))).assertEqual(0);
      expect(nativeAdd(5.55, 0.005) > 5.55).assertTrue();
      expect(nativeAdd(5.55, 0.005)).assertEqual(5.55 + 0.005);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0016
     * @tc.name      testNativePrecision0016
     * @tc.desc      Add decimal values 6.65 and 0.5 and expect the IEEE 754 sum 7.15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(6.65, 0.5);
      logCase('testNativePrecision0016', `sum=${sum}`);
      expect(sum).assertEqual(7.15);
      expect(nativeAdd(0.5, 6.65)).assertEqual(7.15);
      expect(nativeAdd(7.15, -(0.5))).assertEqual(6.65);
      expect(nativeAdd(7.15, -(6.65))).assertEqual(0.5);
      expect(nativeAdd(7.15, -(7.15))).assertEqual(0);
      expect(nativeAdd(6.65, 0.5) > 6.65).assertTrue();
      expect(nativeAdd(6.65, 0.5)).assertEqual(6.65 + 0.5);
      {
      const sum: number = nativeAdd(7.85, 1.1);
      logCase('testNativePrecision0017', `sum=${sum}`);
      expect(sum).assertEqual(8.95);
      expect(nativeAdd(1.1, 7.85)).assertEqual(8.95);
      expect(nativeAdd(8.95, -(1.1))).assertEqual(7.85);
      expect(nativeAdd(8.95, -(8.95))).assertEqual(0);
      expect(nativeAdd(7.85, 1.1) > 7.85).assertTrue();
      expect(nativeAdd(7.85, 1.1)).assertEqual(7.85 + 1.1);
      }
      {
      const sum: number = nativeAdd(8.95, 5.55);
      logCase('testNativePrecision0018', `sum=${sum}`);
      expect(sum).assertEqual(14.5);
      expect(nativeAdd(5.55, 8.95)).assertEqual(14.5);
      expect(nativeAdd(14.5, -(5.55))).assertEqual(8.95);
      expect(nativeAdd(14.5, -(14.5))).assertEqual(0);
      expect(nativeAdd(8.95, 5.55) > 8.95).assertTrue();
      expect(nativeAdd(8.95, 5.55)).assertEqual(8.95 + 5.55);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0019
     * @tc.name      testNativePrecision0019
     * @tc.desc      Add decimal values 10.01 and 12.34 and expect the IEEE 754 sum 22.35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(10.01, 12.34);
      logCase('testNativePrecision0019', `sum=${sum}`);
      expect(sum).assertEqual(22.35);
      expect(nativeAdd(12.34, 10.01)).assertEqual(22.35);
      expect(nativeAdd(22.35, -(22.35))).assertEqual(0);
      expect(nativeAdd(10.01, 12.34) > 10.01).assertTrue();
      expect(nativeAdd(10.01, 12.34)).assertEqual(10.01 + 12.34);
      {
      const sum: number = nativeAdd(12.34, 0.05);
      logCase('testNativePrecision0020', `sum=${sum}`);
      expect(sum).assertEqual(12.39);
      expect(nativeAdd(0.05, 12.34)).assertEqual(12.39);
      expect(nativeAdd(12.39, -(0.05))).assertEqual(12.34);
      expect(nativeAdd(12.39, -(12.39))).assertEqual(0);
      expect(nativeAdd(12.34, 0.05) > 12.34).assertTrue();
      expect(nativeAdd(12.34, 0.05)).assertEqual(12.34 + 0.05);
      }
      {
      const sum: number = nativeAdd(56.78, 0.4);
      logCase('testNativePrecision0021', `sum=${sum}`);
      expect(sum).assertEqual(57.18);
      expect(nativeAdd(0.4, 56.78)).assertEqual(57.18);
      expect(nativeAdd(57.18, -(0.4))).assertEqual(56.78);
      expect(nativeAdd(57.18, -(57.18))).assertEqual(0);
      expect(nativeAdd(56.78, 0.4) > 56.78).assertTrue();
      expect(nativeAdd(56.78, 0.4)).assertEqual(56.78 + 0.4);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0022
     * @tc.name      testNativePrecision0022
     * @tc.desc      Add decimal values 90.12 and 0.9 and expect the IEEE 754 sum 91.02000000000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(90.12, 0.9);
      logCase('testNativePrecision0022', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(0.9, 90.12)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(90.12, 0.9) > 90.12).assertTrue();
      expect(nativeAdd(90.12, 0.9)).assertEqual(90.12 + 0.9);
      {
      const sum: number = nativeAdd(123.45, 4.35);
      logCase('testNativePrecision0023', `sum=${sum}`);
      expect(sum).assertEqual(127.8);
      expect(nativeAdd(4.35, 123.45)).assertEqual(127.8);
      expect(nativeAdd(127.8, -(4.35))).assertEqual(123.45);
      expect(nativeAdd(127.8, -(127.8))).assertEqual(0);
      expect(nativeAdd(123.45, 4.35) > 123.45).assertTrue();
      expect(nativeAdd(123.45, 4.35)).assertEqual(123.45 + 4.35);
      }
      {
      const sum: number = nativeAdd(678.9, 10.01);
      logCase('testNativePrecision0024', `sum=${sum}`);
      expect(sum).assertEqual(688.91);
      expect(nativeAdd(10.01, 678.9)).assertEqual(688.91);
      expect(nativeAdd(688.91, -(10.01))).assertEqual(678.9);
      expect(nativeAdd(688.91, -(688.91))).assertEqual(0);
      expect(nativeAdd(678.9, 10.01) > 678.9).assertTrue();
      expect(nativeAdd(678.9, 10.01)).assertEqual(678.9 + 10.01);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0025
     * @tc.name      testNativePrecision0025
     * @tc.desc      Add decimal values 0.05 and 678.9 and expect the IEEE 754 sum 678.9499999999999
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.05, 678.9);
      logCase('testNativePrecision0025', `sum=${sum}`);
      expect(sum).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9, 0.05)).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9499999999999, -(0.05))).assertEqual(678.9);
      expect(nativeAdd(678.9499999999999, -(678.9499999999999))).assertEqual(0);
      expect(nativeAdd(0.05, 678.9) > 0.05).assertTrue();
      expect(nativeAdd(0.05, 678.9)).assertEqual(0.05 + 678.9);
      {
      const sum: number = nativeAdd(0.005, 0.3);
      logCase('testNativePrecision0026', `sum=${sum}`);
      expect(sum).assertEqual(0.305);
      expect(nativeAdd(0.3, 0.005)).assertEqual(0.305);
      expect(nativeAdd(0.305, -(0.005))).assertEqual(0.3);
      expect(nativeAdd(0.305, -(0.305))).assertEqual(0);
      expect(nativeAdd(0.005, 0.3) > 0.005).assertTrue();
      expect(nativeAdd(0.005, 0.3)).assertEqual(0.005 + 0.3);
      }
      {
      const sum: number = nativeAdd(0.1, 0.8);
      logCase('testNativePrecision0027', `sum=${sum}`);
      expect(sum).assertEqual(0.9);
      expect(nativeAdd(0.8, 0.1)).assertEqual(0.9);
      expect(nativeAdd(0.9, -(0.1))).assertEqual(0.8);
      expect(nativeAdd(0.9, -(0.9))).assertEqual(0);
      expect(nativeAdd(0.1, 0.8) > 0.1).assertTrue();
      expect(nativeAdd(0.1, 0.8)).assertEqual(0.1 + 0.8);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0028
     * @tc.name      testNativePrecision0028
     * @tc.desc      Add decimal values 0.2 and 3.15 and expect the IEEE 754 sum 3.35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.2, 3.15);
      logCase('testNativePrecision0028', `sum=${sum}`);
      expect(sum).assertEqual(3.35);
      expect(nativeAdd(3.15, 0.2)).assertEqual(3.35);
      expect(nativeAdd(3.35, -(0.2))).assertEqual(3.15);
      expect(nativeAdd(3.35, -(3.35))).assertEqual(0);
      expect(nativeAdd(0.2, 3.15) > 0.2).assertTrue();
      expect(nativeAdd(0.2, 3.15)).assertEqual(0.2 + 3.15);
      {
      const sum: number = nativeAdd(0.3, 8.95);
      logCase('testNativePrecision0029', `sum=${sum}`);
      expect(sum).assertEqual(9.25);
      expect(nativeAdd(8.95, 0.3)).assertEqual(9.25);
      expect(nativeAdd(9.25, -(0.3))).assertEqual(8.95);
      expect(nativeAdd(9.25, -(9.25))).assertEqual(0);
      expect(nativeAdd(0.3, 8.95) > 0.3).assertTrue();
      expect(nativeAdd(0.3, 8.95)).assertEqual(0.3 + 8.95);
      }
      {
      const sum: number = nativeAdd(0.4, 123.45);
      logCase('testNativePrecision0030', `sum=${sum}`);
      expect(sum).assertEqual(123.85000000000001);
      expect(nativeAdd(123.45, 0.4)).assertEqual(123.85000000000001);
      expect(nativeAdd(123.85000000000001, -(0.4))).assertEqual(123.45);
      expect(nativeAdd(123.85000000000001, -(123.85000000000001))).assertEqual(0);
      expect(nativeAdd(0.4, 123.45) > 0.4).assertTrue();
      expect(nativeAdd(0.4, 123.45)).assertEqual(0.4 + 123.45);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0031
     * @tc.name      testNativePrecision0031
     * @tc.desc      Add decimal values 0.5 and 0.2 and expect the IEEE 754 sum 0.7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.5, 0.2);
      logCase('testNativePrecision0031', `sum=${sum}`);
      expect(sum).assertEqual(0.7);
      expect(nativeAdd(0.2, 0.5)).assertEqual(0.7);
      expect(nativeAdd(0.7, -(0.7))).assertEqual(0);
      expect(nativeAdd(0.5, 0.2) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 0.2)).assertEqual(0.5 + 0.2);
      {
      const sum: number = nativeAdd(0.6, 0.7);
      logCase('testNativePrecision0032', `sum=${sum}`);
      expect(sum).assertEqual(1.2999999999999998);
      expect(nativeAdd(0.7, 0.6)).assertEqual(1.2999999999999998);
      expect(nativeAdd(1.2999999999999998, -(1.2999999999999998))).assertEqual(0);
      expect(nativeAdd(0.6, 0.7) > 0.6).assertTrue();
      expect(nativeAdd(0.6, 0.7)).assertEqual(0.6 + 0.7);
      }
      {
      const sum: number = nativeAdd(0.7, 2.75);
      logCase('testNativePrecision0033', `sum=${sum}`);
      expect(sum).assertEqual(3.45);
      expect(nativeAdd(2.75, 0.7)).assertEqual(3.45);
      expect(nativeAdd(3.45, -(0.7))).assertEqual(2.75);
      expect(nativeAdd(3.45, -(3.45))).assertEqual(0);
      expect(nativeAdd(0.7, 2.75) > 0.7).assertTrue();
      expect(nativeAdd(0.7, 2.75)).assertEqual(0.7 + 2.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0034
     * @tc.name      testNativePrecision0034
     * @tc.desc      Add decimal values 0.8 and 7.85 and expect the IEEE 754 sum 8.65
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.8, 7.85);
      logCase('testNativePrecision0034', `sum=${sum}`);
      expect(sum).assertEqual(8.65);
      expect(nativeAdd(7.85, 0.8)).assertEqual(8.65);
      expect(nativeAdd(8.65, -(8.65))).assertEqual(0);
      expect(nativeAdd(0.8, 7.85) > 0.8).assertTrue();
      expect(nativeAdd(0.8, 7.85)).assertEqual(0.8 + 7.85);
      {
      const sum: number = nativeAdd(0.9, 90.12);
      logCase('testNativePrecision0035', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(90.12, 0.9)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(0.9, 90.12) > 0.9).assertTrue();
      expect(nativeAdd(0.9, 90.12)).assertEqual(0.9 + 90.12);
      }
      {
      const sum: number = nativeAdd(1.1, 0.1);
      logCase('testNativePrecision0036', `sum=${sum}`);
      expect(sum).assertEqual(1.2000000000000002);
      expect(nativeAdd(0.1, 1.1)).assertEqual(1.2000000000000002);
      expect(nativeAdd(1.2000000000000002, -(0.1))).assertEqual(1.1);
      expect(nativeAdd(1.2000000000000002, -(1.2000000000000002))).assertEqual(0);
      expect(nativeAdd(1.1, 0.1) > 1.1).assertTrue();
      expect(nativeAdd(1.1, 0.1)).assertEqual(1.1 + 0.1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0037
     * @tc.name      testNativePrecision0037
     * @tc.desc      Add decimal values 1.25 and 0.6 and expect the IEEE 754 sum 1.85
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1.25, 0.6);
      logCase('testNativePrecision0037', `sum=${sum}`);
      expect(sum).assertEqual(1.85);
      expect(nativeAdd(0.6, 1.25)).assertEqual(1.85);
      expect(nativeAdd(1.85, -(0.6))).assertEqual(1.25);
      expect(nativeAdd(1.85, -(1.85))).assertEqual(0);
      expect(nativeAdd(1.25, 0.6) > 1.25).assertTrue();
      expect(nativeAdd(1.25, 0.6)).assertEqual(1.25 + 0.6);
      {
      const sum: number = nativeAdd(2.75, 1.25);
      logCase('testNativePrecision0038', `sum=${sum}`);
      expect(sum).assertEqual(4.0);
      expect(nativeAdd(1.25, 2.75)).assertEqual(4.0);
      expect(nativeAdd(4.0, -(1.25))).assertEqual(2.75);
      expect(nativeAdd(4.0, -(2.75))).assertEqual(1.25);
      expect(nativeAdd(4.0, -(4.0))).assertEqual(0);
      expect(nativeAdd(2.75, 1.25) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.25)).assertEqual(2.75 + 1.25);
      }
      {
      const sum: number = nativeAdd(3.15, 6.65);
      logCase('testNativePrecision0039', `sum=${sum}`);
      expect(sum).assertEqual(9.8);
      expect(nativeAdd(6.65, 3.15)).assertEqual(9.8);
      expect(nativeAdd(9.8, -(3.15))).assertEqual(6.65);
      expect(nativeAdd(9.8, -(9.8))).assertEqual(0);
      expect(nativeAdd(3.15, 6.65) > 3.15).assertTrue();
      expect(nativeAdd(3.15, 6.65)).assertEqual(3.15 + 6.65);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0040
     * @tc.name      testNativePrecision0040
     * @tc.desc      Add decimal values 4.35 and 56.78 and expect the IEEE 754 sum 61.13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(4.35, 56.78);
      logCase('testNativePrecision0040', `sum=${sum}`);
      expect(sum).assertEqual(61.13);
      expect(nativeAdd(56.78, 4.35)).assertEqual(61.13);
      expect(nativeAdd(61.13, -(4.35))).assertEqual(56.78);
      expect(nativeAdd(61.13, -(61.13))).assertEqual(0);
      expect(nativeAdd(4.35, 56.78) > 4.35).assertTrue();
      expect(nativeAdd(4.35, 56.78)).assertEqual(4.35 + 56.78);
      {
      const sum: number = nativeAdd(5.55, 0.005);
      logCase('testNativePrecision0041', `sum=${sum}`);
      expect(sum).assertEqual(5.555);
      expect(nativeAdd(0.005, 5.55)).assertEqual(5.555);
      expect(nativeAdd(5.555, -(0.005))).assertEqual(5.55);
      expect(nativeAdd(5.555, -(5.555))).assertEqual(0);
      expect(nativeAdd(5.55, 0.005) > 5.55).assertTrue();
      expect(nativeAdd(5.55, 0.005)).assertEqual(5.55 + 0.005);
      }
      {
      const sum: number = nativeAdd(6.65, 0.5);
      logCase('testNativePrecision0042', `sum=${sum}`);
      expect(sum).assertEqual(7.15);
      expect(nativeAdd(0.5, 6.65)).assertEqual(7.15);
      expect(nativeAdd(7.15, -(0.5))).assertEqual(6.65);
      expect(nativeAdd(7.15, -(6.65))).assertEqual(0.5);
      expect(nativeAdd(7.15, -(7.15))).assertEqual(0);
      expect(nativeAdd(6.65, 0.5) > 6.65).assertTrue();
      expect(nativeAdd(6.65, 0.5)).assertEqual(6.65 + 0.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0043
     * @tc.name      testNativePrecision0043
     * @tc.desc      Add decimal values 7.85 and 1.1 and expect the IEEE 754 sum 8.95
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePrecision0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(7.85, 1.1);
      logCase('testNativePrecision0043', `sum=${sum}`);
      expect(sum).assertEqual(8.95);
      expect(nativeAdd(1.1, 7.85)).assertEqual(8.95);
      expect(nativeAdd(8.95, -(1.1))).assertEqual(7.85);
      expect(nativeAdd(8.95, -(8.95))).assertEqual(0);
      expect(nativeAdd(7.85, 1.1) > 7.85).assertTrue();
      expect(nativeAdd(7.85, 1.1)).assertEqual(7.85 + 1.1);
      {
      const sum: number = nativeAdd(8.95, 5.55);
      logCase('testNativePrecision0044', `sum=${sum}`);
      expect(sum).assertEqual(14.5);
      expect(nativeAdd(5.55, 8.95)).assertEqual(14.5);
      expect(nativeAdd(14.5, -(5.55))).assertEqual(8.95);
      expect(nativeAdd(14.5, -(14.5))).assertEqual(0);
      expect(nativeAdd(8.95, 5.55) > 8.95).assertTrue();
      expect(nativeAdd(8.95, 5.55)).assertEqual(8.95 + 5.55);
      }
      {
      const sum: number = nativeAdd(10.01, 12.34);
      logCase('testNativePrecision0045', `sum=${sum}`);
      expect(sum).assertEqual(22.35);
      expect(nativeAdd(12.34, 10.01)).assertEqual(22.35);
      expect(nativeAdd(22.35, -(22.35))).assertEqual(0);
      expect(nativeAdd(10.01, 12.34) > 10.01).assertTrue();
      expect(nativeAdd(10.01, 12.34)).assertEqual(10.01 + 12.34);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0046
     * @tc.name      testNativePrecision0046
     * @tc.desc      Add decimal values 12.34 and 0.05 and expect the IEEE 754 sum 12.39
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(12.34, 0.05);
      logCase('testNativePrecision0046', `sum=${sum}`);
      expect(sum).assertEqual(12.39);
      expect(nativeAdd(0.05, 12.34)).assertEqual(12.39);
      expect(nativeAdd(12.39, -(0.05))).assertEqual(12.34);
      expect(nativeAdd(12.39, -(12.39))).assertEqual(0);
      expect(nativeAdd(12.34, 0.05) > 12.34).assertTrue();
      expect(nativeAdd(12.34, 0.05)).assertEqual(12.34 + 0.05);
      {
      const sum: number = nativeAdd(56.78, 0.4);
      logCase('testNativePrecision0047', `sum=${sum}`);
      expect(sum).assertEqual(57.18);
      expect(nativeAdd(0.4, 56.78)).assertEqual(57.18);
      expect(nativeAdd(57.18, -(0.4))).assertEqual(56.78);
      expect(nativeAdd(57.18, -(57.18))).assertEqual(0);
      expect(nativeAdd(56.78, 0.4) > 56.78).assertTrue();
      expect(nativeAdd(56.78, 0.4)).assertEqual(56.78 + 0.4);
      }
      {
      const sum: number = nativeAdd(90.12, 0.9);
      logCase('testNativePrecision0048', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(0.9, 90.12)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(90.12, 0.9) > 90.12).assertTrue();
      expect(nativeAdd(90.12, 0.9)).assertEqual(90.12 + 0.9);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0049
     * @tc.name      testNativePrecision0049
     * @tc.desc      Add decimal values 123.45 and 4.35 and expect the IEEE 754 sum 127.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(123.45, 4.35);
      logCase('testNativePrecision0049', `sum=${sum}`);
      expect(sum).assertEqual(127.8);
      expect(nativeAdd(4.35, 123.45)).assertEqual(127.8);
      expect(nativeAdd(127.8, -(4.35))).assertEqual(123.45);
      expect(nativeAdd(127.8, -(127.8))).assertEqual(0);
      expect(nativeAdd(123.45, 4.35) > 123.45).assertTrue();
      expect(nativeAdd(123.45, 4.35)).assertEqual(123.45 + 4.35);
      {
      const sum: number = nativeAdd(678.9, 10.01);
      logCase('testNativePrecision0050', `sum=${sum}`);
      expect(sum).assertEqual(688.91);
      expect(nativeAdd(10.01, 678.9)).assertEqual(688.91);
      expect(nativeAdd(688.91, -(10.01))).assertEqual(678.9);
      expect(nativeAdd(688.91, -(688.91))).assertEqual(0);
      expect(nativeAdd(678.9, 10.01) > 678.9).assertTrue();
      expect(nativeAdd(678.9, 10.01)).assertEqual(678.9 + 10.01);
      }
      {
      const sum: number = nativeAdd(0.05, 678.9);
      logCase('testNativePrecision0051', `sum=${sum}`);
      expect(sum).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9, 0.05)).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9499999999999, -(0.05))).assertEqual(678.9);
      expect(nativeAdd(678.9499999999999, -(678.9499999999999))).assertEqual(0);
      expect(nativeAdd(0.05, 678.9) > 0.05).assertTrue();
      expect(nativeAdd(0.05, 678.9)).assertEqual(0.05 + 678.9);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0052
     * @tc.name      testNativePrecision0052
     * @tc.desc      Add decimal values 0.005 and 0.3 and expect the IEEE 754 sum 0.305
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.005, 0.3);
      logCase('testNativePrecision0052', `sum=${sum}`);
      expect(sum).assertEqual(0.305);
      expect(nativeAdd(0.3, 0.005)).assertEqual(0.305);
      expect(nativeAdd(0.305, -(0.005))).assertEqual(0.3);
      expect(nativeAdd(0.305, -(0.305))).assertEqual(0);
      expect(nativeAdd(0.005, 0.3) > 0.005).assertTrue();
      expect(nativeAdd(0.005, 0.3)).assertEqual(0.005 + 0.3);
      {
      const sum: number = nativeAdd(0.1, 0.8);
      logCase('testNativePrecision0053', `sum=${sum}`);
      expect(sum).assertEqual(0.9);
      expect(nativeAdd(0.8, 0.1)).assertEqual(0.9);
      expect(nativeAdd(0.9, -(0.1))).assertEqual(0.8);
      expect(nativeAdd(0.9, -(0.9))).assertEqual(0);
      expect(nativeAdd(0.1, 0.8) > 0.1).assertTrue();
      expect(nativeAdd(0.1, 0.8)).assertEqual(0.1 + 0.8);
      }
      {
      const sum: number = nativeAdd(0.2, 3.15);
      logCase('testNativePrecision0054', `sum=${sum}`);
      expect(sum).assertEqual(3.35);
      expect(nativeAdd(3.15, 0.2)).assertEqual(3.35);
      expect(nativeAdd(3.35, -(0.2))).assertEqual(3.15);
      expect(nativeAdd(3.35, -(3.35))).assertEqual(0);
      expect(nativeAdd(0.2, 3.15) > 0.2).assertTrue();
      expect(nativeAdd(0.2, 3.15)).assertEqual(0.2 + 3.15);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0055
     * @tc.name      testNativePrecision0055
     * @tc.desc      Add decimal values 0.3 and 8.95 and expect the IEEE 754 sum 9.25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.3, 8.95);
      logCase('testNativePrecision0055', `sum=${sum}`);
      expect(sum).assertEqual(9.25);
      expect(nativeAdd(8.95, 0.3)).assertEqual(9.25);
      expect(nativeAdd(9.25, -(0.3))).assertEqual(8.95);
      expect(nativeAdd(9.25, -(9.25))).assertEqual(0);
      expect(nativeAdd(0.3, 8.95) > 0.3).assertTrue();
      expect(nativeAdd(0.3, 8.95)).assertEqual(0.3 + 8.95);
      {
      const sum: number = nativeAdd(0.4, 123.45);
      logCase('testNativePrecision0056', `sum=${sum}`);
      expect(sum).assertEqual(123.85000000000001);
      expect(nativeAdd(123.45, 0.4)).assertEqual(123.85000000000001);
      expect(nativeAdd(123.85000000000001, -(0.4))).assertEqual(123.45);
      expect(nativeAdd(123.85000000000001, -(123.85000000000001))).assertEqual(0);
      expect(nativeAdd(0.4, 123.45) > 0.4).assertTrue();
      expect(nativeAdd(0.4, 123.45)).assertEqual(0.4 + 123.45);
      }
      {
      const sum: number = nativeAdd(0.5, 0.2);
      logCase('testNativePrecision0057', `sum=${sum}`);
      expect(sum).assertEqual(0.7);
      expect(nativeAdd(0.2, 0.5)).assertEqual(0.7);
      expect(nativeAdd(0.7, -(0.7))).assertEqual(0);
      expect(nativeAdd(0.5, 0.2) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 0.2)).assertEqual(0.5 + 0.2);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0058
     * @tc.name      testNativePrecision0058
     * @tc.desc      Add decimal values 0.6 and 0.7 and expect the IEEE 754 sum 1.2999999999999998
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.6, 0.7);
      logCase('testNativePrecision0058', `sum=${sum}`);
      expect(sum).assertEqual(1.2999999999999998);
      expect(nativeAdd(0.7, 0.6)).assertEqual(1.2999999999999998);
      expect(nativeAdd(1.2999999999999998, -(1.2999999999999998))).assertEqual(0);
      expect(nativeAdd(0.6, 0.7) > 0.6).assertTrue();
      expect(nativeAdd(0.6, 0.7)).assertEqual(0.6 + 0.7);
      {
      const sum: number = nativeAdd(0.7, 2.75);
      logCase('testNativePrecision0059', `sum=${sum}`);
      expect(sum).assertEqual(3.45);
      expect(nativeAdd(2.75, 0.7)).assertEqual(3.45);
      expect(nativeAdd(3.45, -(0.7))).assertEqual(2.75);
      expect(nativeAdd(3.45, -(3.45))).assertEqual(0);
      expect(nativeAdd(0.7, 2.75) > 0.7).assertTrue();
      expect(nativeAdd(0.7, 2.75)).assertEqual(0.7 + 2.75);
      }
      {
      const sum: number = nativeAdd(0.8, 7.85);
      logCase('testNativePrecision0060', `sum=${sum}`);
      expect(sum).assertEqual(8.65);
      expect(nativeAdd(7.85, 0.8)).assertEqual(8.65);
      expect(nativeAdd(8.65, -(8.65))).assertEqual(0);
      expect(nativeAdd(0.8, 7.85) > 0.8).assertTrue();
      expect(nativeAdd(0.8, 7.85)).assertEqual(0.8 + 7.85);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0061
     * @tc.name      testNativePrecision0061
     * @tc.desc      Add decimal values 0.9 and 90.12 and expect the IEEE 754 sum 91.02000000000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.9, 90.12);
      logCase('testNativePrecision0061', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(90.12, 0.9)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(0.9, 90.12) > 0.9).assertTrue();
      expect(nativeAdd(0.9, 90.12)).assertEqual(0.9 + 90.12);
      {
      const sum: number = nativeAdd(1.1, 0.1);
      logCase('testNativePrecision0062', `sum=${sum}`);
      expect(sum).assertEqual(1.2000000000000002);
      expect(nativeAdd(0.1, 1.1)).assertEqual(1.2000000000000002);
      expect(nativeAdd(1.2000000000000002, -(0.1))).assertEqual(1.1);
      expect(nativeAdd(1.2000000000000002, -(1.2000000000000002))).assertEqual(0);
      expect(nativeAdd(1.1, 0.1) > 1.1).assertTrue();
      expect(nativeAdd(1.1, 0.1)).assertEqual(1.1 + 0.1);
      }
      {
      const sum: number = nativeAdd(1.25, 0.6);
      logCase('testNativePrecision0063', `sum=${sum}`);
      expect(sum).assertEqual(1.85);
      expect(nativeAdd(0.6, 1.25)).assertEqual(1.85);
      expect(nativeAdd(1.85, -(0.6))).assertEqual(1.25);
      expect(nativeAdd(1.85, -(1.85))).assertEqual(0);
      expect(nativeAdd(1.25, 0.6) > 1.25).assertTrue();
      expect(nativeAdd(1.25, 0.6)).assertEqual(1.25 + 0.6);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0064
     * @tc.name      testNativePrecision0064
     * @tc.desc      Add decimal values 2.75 and 1.25 and expect the IEEE 754 sum 4.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2.75, 1.25);
      logCase('testNativePrecision0064', `sum=${sum}`);
      expect(sum).assertEqual(4.0);
      expect(nativeAdd(1.25, 2.75)).assertEqual(4.0);
      expect(nativeAdd(4.0, -(1.25))).assertEqual(2.75);
      expect(nativeAdd(4.0, -(2.75))).assertEqual(1.25);
      expect(nativeAdd(4.0, -(4.0))).assertEqual(0);
      expect(nativeAdd(2.75, 1.25) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.25)).assertEqual(2.75 + 1.25);
      {
      const sum: number = nativeAdd(3.15, 6.65);
      logCase('testNativePrecision0065', `sum=${sum}`);
      expect(sum).assertEqual(9.8);
      expect(nativeAdd(6.65, 3.15)).assertEqual(9.8);
      expect(nativeAdd(9.8, -(3.15))).assertEqual(6.65);
      expect(nativeAdd(9.8, -(9.8))).assertEqual(0);
      expect(nativeAdd(3.15, 6.65) > 3.15).assertTrue();
      expect(nativeAdd(3.15, 6.65)).assertEqual(3.15 + 6.65);
      }
      {
      const sum: number = nativeAdd(4.35, 56.78);
      logCase('testNativePrecision0066', `sum=${sum}`);
      expect(sum).assertEqual(61.13);
      expect(nativeAdd(56.78, 4.35)).assertEqual(61.13);
      expect(nativeAdd(61.13, -(4.35))).assertEqual(56.78);
      expect(nativeAdd(61.13, -(61.13))).assertEqual(0);
      expect(nativeAdd(4.35, 56.78) > 4.35).assertTrue();
      expect(nativeAdd(4.35, 56.78)).assertEqual(4.35 + 56.78);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0067
     * @tc.name      testNativePrecision0067
     * @tc.desc      Add decimal values 5.55 and 0.005 and expect the IEEE 754 sum 5.555
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(5.55, 0.005);
      logCase('testNativePrecision0067', `sum=${sum}`);
      expect(sum).assertEqual(5.555);
      expect(nativeAdd(0.005, 5.55)).assertEqual(5.555);
      expect(nativeAdd(5.555, -(0.005))).assertEqual(5.55);
      expect(nativeAdd(5.555, -(5.555))).assertEqual(0);
      expect(nativeAdd(5.55, 0.005) > 5.55).assertTrue();
      expect(nativeAdd(5.55, 0.005)).assertEqual(5.55 + 0.005);
      {
      const sum: number = nativeAdd(6.65, 0.5);
      logCase('testNativePrecision0068', `sum=${sum}`);
      expect(sum).assertEqual(7.15);
      expect(nativeAdd(0.5, 6.65)).assertEqual(7.15);
      expect(nativeAdd(7.15, -(0.5))).assertEqual(6.65);
      expect(nativeAdd(7.15, -(6.65))).assertEqual(0.5);
      expect(nativeAdd(7.15, -(7.15))).assertEqual(0);
      expect(nativeAdd(6.65, 0.5) > 6.65).assertTrue();
      expect(nativeAdd(6.65, 0.5)).assertEqual(6.65 + 0.5);
      }
      {
      const sum: number = nativeAdd(7.85, 1.1);
      logCase('testNativePrecision0069', `sum=${sum}`);
      expect(sum).assertEqual(8.95);
      expect(nativeAdd(1.1, 7.85)).assertEqual(8.95);
      expect(nativeAdd(8.95, -(1.1))).assertEqual(7.85);
      expect(nativeAdd(8.95, -(8.95))).assertEqual(0);
      expect(nativeAdd(7.85, 1.1) > 7.85).assertTrue();
      expect(nativeAdd(7.85, 1.1)).assertEqual(7.85 + 1.1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0070
     * @tc.name      testNativePrecision0070
     * @tc.desc      Add decimal values 8.95 and 5.55 and expect the IEEE 754 sum 14.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(8.95, 5.55);
      logCase('testNativePrecision0070', `sum=${sum}`);
      expect(sum).assertEqual(14.5);
      expect(nativeAdd(5.55, 8.95)).assertEqual(14.5);
      expect(nativeAdd(14.5, -(5.55))).assertEqual(8.95);
      expect(nativeAdd(14.5, -(14.5))).assertEqual(0);
      expect(nativeAdd(8.95, 5.55) > 8.95).assertTrue();
      expect(nativeAdd(8.95, 5.55)).assertEqual(8.95 + 5.55);
      {
      const sum: number = nativeAdd(10.01, 12.34);
      logCase('testNativePrecision0071', `sum=${sum}`);
      expect(sum).assertEqual(22.35);
      expect(nativeAdd(12.34, 10.01)).assertEqual(22.35);
      expect(nativeAdd(22.35, -(22.35))).assertEqual(0);
      expect(nativeAdd(10.01, 12.34) > 10.01).assertTrue();
      expect(nativeAdd(10.01, 12.34)).assertEqual(10.01 + 12.34);
      }
      {
      const sum: number = nativeAdd(12.34, 0.05);
      logCase('testNativePrecision0072', `sum=${sum}`);
      expect(sum).assertEqual(12.39);
      expect(nativeAdd(0.05, 12.34)).assertEqual(12.39);
      expect(nativeAdd(12.39, -(0.05))).assertEqual(12.34);
      expect(nativeAdd(12.39, -(12.39))).assertEqual(0);
      expect(nativeAdd(12.34, 0.05) > 12.34).assertTrue();
      expect(nativeAdd(12.34, 0.05)).assertEqual(12.34 + 0.05);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0073
     * @tc.name      testNativePrecision0073
     * @tc.desc      Add decimal values 56.78 and 0.4 and expect the IEEE 754 sum 57.18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(56.78, 0.4);
      logCase('testNativePrecision0073', `sum=${sum}`);
      expect(sum).assertEqual(57.18);
      expect(nativeAdd(0.4, 56.78)).assertEqual(57.18);
      expect(nativeAdd(57.18, -(0.4))).assertEqual(56.78);
      expect(nativeAdd(57.18, -(57.18))).assertEqual(0);
      expect(nativeAdd(56.78, 0.4) > 56.78).assertTrue();
      expect(nativeAdd(56.78, 0.4)).assertEqual(56.78 + 0.4);
      {
      const sum: number = nativeAdd(90.12, 0.9);
      logCase('testNativePrecision0074', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(0.9, 90.12)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(90.12, 0.9) > 90.12).assertTrue();
      expect(nativeAdd(90.12, 0.9)).assertEqual(90.12 + 0.9);
      }
      {
      const sum: number = nativeAdd(123.45, 4.35);
      logCase('testNativePrecision0075', `sum=${sum}`);
      expect(sum).assertEqual(127.8);
      expect(nativeAdd(4.35, 123.45)).assertEqual(127.8);
      expect(nativeAdd(127.8, -(4.35))).assertEqual(123.45);
      expect(nativeAdd(127.8, -(127.8))).assertEqual(0);
      expect(nativeAdd(123.45, 4.35) > 123.45).assertTrue();
      expect(nativeAdd(123.45, 4.35)).assertEqual(123.45 + 4.35);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0076
     * @tc.name      testNativePrecision0076
     * @tc.desc      Add decimal values 678.9 and 10.01 and expect the IEEE 754 sum 688.91
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(678.9, 10.01);
      logCase('testNativePrecision0076', `sum=${sum}`);
      expect(sum).assertEqual(688.91);
      expect(nativeAdd(10.01, 678.9)).assertEqual(688.91);
      expect(nativeAdd(688.91, -(10.01))).assertEqual(678.9);
      expect(nativeAdd(688.91, -(688.91))).assertEqual(0);
      expect(nativeAdd(678.9, 10.01) > 678.9).assertTrue();
      expect(nativeAdd(678.9, 10.01)).assertEqual(678.9 + 10.01);
      {
      const sum: number = nativeAdd(0.05, 678.9);
      logCase('testNativePrecision0077', `sum=${sum}`);
      expect(sum).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9, 0.05)).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9499999999999, -(0.05))).assertEqual(678.9);
      expect(nativeAdd(678.9499999999999, -(678.9499999999999))).assertEqual(0);
      expect(nativeAdd(0.05, 678.9) > 0.05).assertTrue();
      expect(nativeAdd(0.05, 678.9)).assertEqual(0.05 + 678.9);
      }
      {
      const sum: number = nativeAdd(0.005, 0.3);
      logCase('testNativePrecision0078', `sum=${sum}`);
      expect(sum).assertEqual(0.305);
      expect(nativeAdd(0.3, 0.005)).assertEqual(0.305);
      expect(nativeAdd(0.305, -(0.005))).assertEqual(0.3);
      expect(nativeAdd(0.305, -(0.305))).assertEqual(0);
      expect(nativeAdd(0.005, 0.3) > 0.005).assertTrue();
      expect(nativeAdd(0.005, 0.3)).assertEqual(0.005 + 0.3);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0079
     * @tc.name      testNativePrecision0079
     * @tc.desc      Add decimal values 0.1 and 0.8 and expect the IEEE 754 sum 0.9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.1, 0.8);
      logCase('testNativePrecision0079', `sum=${sum}`);
      expect(sum).assertEqual(0.9);
      expect(nativeAdd(0.8, 0.1)).assertEqual(0.9);
      expect(nativeAdd(0.9, -(0.1))).assertEqual(0.8);
      expect(nativeAdd(0.9, -(0.9))).assertEqual(0);
      expect(nativeAdd(0.1, 0.8) > 0.1).assertTrue();
      expect(nativeAdd(0.1, 0.8)).assertEqual(0.1 + 0.8);
      {
      const sum: number = nativeAdd(0.2, 3.15);
      logCase('testNativePrecision0080', `sum=${sum}`);
      expect(sum).assertEqual(3.35);
      expect(nativeAdd(3.15, 0.2)).assertEqual(3.35);
      expect(nativeAdd(3.35, -(0.2))).assertEqual(3.15);
      expect(nativeAdd(3.35, -(3.35))).assertEqual(0);
      expect(nativeAdd(0.2, 3.15) > 0.2).assertTrue();
      expect(nativeAdd(0.2, 3.15)).assertEqual(0.2 + 3.15);
      }
      {
      const sum: number = nativeAdd(0.3, 8.95);
      logCase('testNativePrecision0081', `sum=${sum}`);
      expect(sum).assertEqual(9.25);
      expect(nativeAdd(8.95, 0.3)).assertEqual(9.25);
      expect(nativeAdd(9.25, -(0.3))).assertEqual(8.95);
      expect(nativeAdd(9.25, -(9.25))).assertEqual(0);
      expect(nativeAdd(0.3, 8.95) > 0.3).assertTrue();
      expect(nativeAdd(0.3, 8.95)).assertEqual(0.3 + 8.95);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0082
     * @tc.name      testNativePrecision0082
     * @tc.desc      Add decimal values 0.4 and 123.45 and expect the IEEE 754 sum 123.85000000000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.4, 123.45);
      logCase('testNativePrecision0082', `sum=${sum}`);
      expect(sum).assertEqual(123.85000000000001);
      expect(nativeAdd(123.45, 0.4)).assertEqual(123.85000000000001);
      expect(nativeAdd(123.85000000000001, -(0.4))).assertEqual(123.45);
      expect(nativeAdd(123.85000000000001, -(123.85000000000001))).assertEqual(0);
      expect(nativeAdd(0.4, 123.45) > 0.4).assertTrue();
      expect(nativeAdd(0.4, 123.45)).assertEqual(0.4 + 123.45);
      {
      const sum: number = nativeAdd(0.5, 0.2);
      logCase('testNativePrecision0083', `sum=${sum}`);
      expect(sum).assertEqual(0.7);
      expect(nativeAdd(0.2, 0.5)).assertEqual(0.7);
      expect(nativeAdd(0.7, -(0.7))).assertEqual(0);
      expect(nativeAdd(0.5, 0.2) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 0.2)).assertEqual(0.5 + 0.2);
      }
      {
      const sum: number = nativeAdd(0.6, 0.7);
      logCase('testNativePrecision0084', `sum=${sum}`);
      expect(sum).assertEqual(1.2999999999999998);
      expect(nativeAdd(0.7, 0.6)).assertEqual(1.2999999999999998);
      expect(nativeAdd(1.2999999999999998, -(1.2999999999999998))).assertEqual(0);
      expect(nativeAdd(0.6, 0.7) > 0.6).assertTrue();
      expect(nativeAdd(0.6, 0.7)).assertEqual(0.6 + 0.7);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0085
     * @tc.name      testNativePrecision0085
     * @tc.desc      Add decimal values 0.7 and 2.75 and expect the IEEE 754 sum 3.45
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.7, 2.75);
      logCase('testNativePrecision0085', `sum=${sum}`);
      expect(sum).assertEqual(3.45);
      expect(nativeAdd(2.75, 0.7)).assertEqual(3.45);
      expect(nativeAdd(3.45, -(0.7))).assertEqual(2.75);
      expect(nativeAdd(3.45, -(3.45))).assertEqual(0);
      expect(nativeAdd(0.7, 2.75) > 0.7).assertTrue();
      expect(nativeAdd(0.7, 2.75)).assertEqual(0.7 + 2.75);
      {
      const sum: number = nativeAdd(0.8, 7.85);
      logCase('testNativePrecision0086', `sum=${sum}`);
      expect(sum).assertEqual(8.65);
      expect(nativeAdd(7.85, 0.8)).assertEqual(8.65);
      expect(nativeAdd(8.65, -(8.65))).assertEqual(0);
      expect(nativeAdd(0.8, 7.85) > 0.8).assertTrue();
      expect(nativeAdd(0.8, 7.85)).assertEqual(0.8 + 7.85);
      }
      {
      const sum: number = nativeAdd(0.9, 90.12);
      logCase('testNativePrecision0087', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(90.12, 0.9)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(0.9, 90.12) > 0.9).assertTrue();
      expect(nativeAdd(0.9, 90.12)).assertEqual(0.9 + 90.12);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0088
     * @tc.name      testNativePrecision0088
     * @tc.desc      Add decimal values 1.1 and 0.1 and expect the IEEE 754 sum 1.2000000000000002
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(1.1, 0.1);
      logCase('testNativePrecision0088', `sum=${sum}`);
      expect(sum).assertEqual(1.2000000000000002);
      expect(nativeAdd(0.1, 1.1)).assertEqual(1.2000000000000002);
      expect(nativeAdd(1.2000000000000002, -(0.1))).assertEqual(1.1);
      expect(nativeAdd(1.2000000000000002, -(1.2000000000000002))).assertEqual(0);
      expect(nativeAdd(1.1, 0.1) > 1.1).assertTrue();
      expect(nativeAdd(1.1, 0.1)).assertEqual(1.1 + 0.1);
      {
      const sum: number = nativeAdd(1.25, 0.6);
      logCase('testNativePrecision0089', `sum=${sum}`);
      expect(sum).assertEqual(1.85);
      expect(nativeAdd(0.6, 1.25)).assertEqual(1.85);
      expect(nativeAdd(1.85, -(0.6))).assertEqual(1.25);
      expect(nativeAdd(1.85, -(1.85))).assertEqual(0);
      expect(nativeAdd(1.25, 0.6) > 1.25).assertTrue();
      expect(nativeAdd(1.25, 0.6)).assertEqual(1.25 + 0.6);
      }
      {
      const sum: number = nativeAdd(2.75, 1.25);
      logCase('testNativePrecision0090', `sum=${sum}`);
      expect(sum).assertEqual(4.0);
      expect(nativeAdd(1.25, 2.75)).assertEqual(4.0);
      expect(nativeAdd(4.0, -(1.25))).assertEqual(2.75);
      expect(nativeAdd(4.0, -(2.75))).assertEqual(1.25);
      expect(nativeAdd(4.0, -(4.0))).assertEqual(0);
      expect(nativeAdd(2.75, 1.25) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.25)).assertEqual(2.75 + 1.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0091
     * @tc.name      testNativePrecision0091
     * @tc.desc      Add decimal values 3.15 and 6.65 and expect the IEEE 754 sum 9.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3.15, 6.65);
      logCase('testNativePrecision0091', `sum=${sum}`);
      expect(sum).assertEqual(9.8);
      expect(nativeAdd(6.65, 3.15)).assertEqual(9.8);
      expect(nativeAdd(9.8, -(3.15))).assertEqual(6.65);
      expect(nativeAdd(9.8, -(9.8))).assertEqual(0);
      expect(nativeAdd(3.15, 6.65) > 3.15).assertTrue();
      expect(nativeAdd(3.15, 6.65)).assertEqual(3.15 + 6.65);
      {
      const sum: number = nativeAdd(4.35, 56.78);
      logCase('testNativePrecision0092', `sum=${sum}`);
      expect(sum).assertEqual(61.13);
      expect(nativeAdd(56.78, 4.35)).assertEqual(61.13);
      expect(nativeAdd(61.13, -(4.35))).assertEqual(56.78);
      expect(nativeAdd(61.13, -(61.13))).assertEqual(0);
      expect(nativeAdd(4.35, 56.78) > 4.35).assertTrue();
      expect(nativeAdd(4.35, 56.78)).assertEqual(4.35 + 56.78);
      }
      {
      const sum: number = nativeAdd(5.55, 0.005);
      logCase('testNativePrecision0093', `sum=${sum}`);
      expect(sum).assertEqual(5.555);
      expect(nativeAdd(0.005, 5.55)).assertEqual(5.555);
      expect(nativeAdd(5.555, -(0.005))).assertEqual(5.55);
      expect(nativeAdd(5.555, -(5.555))).assertEqual(0);
      expect(nativeAdd(5.55, 0.005) > 5.55).assertTrue();
      expect(nativeAdd(5.55, 0.005)).assertEqual(5.55 + 0.005);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0094
     * @tc.name      testNativePrecision0094
     * @tc.desc      Add decimal values 6.65 and 0.5 and expect the IEEE 754 sum 7.15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(6.65, 0.5);
      logCase('testNativePrecision0094', `sum=${sum}`);
      expect(sum).assertEqual(7.15);
      expect(nativeAdd(0.5, 6.65)).assertEqual(7.15);
      expect(nativeAdd(7.15, -(0.5))).assertEqual(6.65);
      expect(nativeAdd(7.15, -(6.65))).assertEqual(0.5);
      expect(nativeAdd(7.15, -(7.15))).assertEqual(0);
      expect(nativeAdd(6.65, 0.5) > 6.65).assertTrue();
      expect(nativeAdd(6.65, 0.5)).assertEqual(6.65 + 0.5);
      {
      const sum: number = nativeAdd(7.85, 1.1);
      logCase('testNativePrecision0095', `sum=${sum}`);
      expect(sum).assertEqual(8.95);
      expect(nativeAdd(1.1, 7.85)).assertEqual(8.95);
      expect(nativeAdd(8.95, -(1.1))).assertEqual(7.85);
      expect(nativeAdd(8.95, -(8.95))).assertEqual(0);
      expect(nativeAdd(7.85, 1.1) > 7.85).assertTrue();
      expect(nativeAdd(7.85, 1.1)).assertEqual(7.85 + 1.1);
      }
      {
      const sum: number = nativeAdd(8.95, 5.55);
      logCase('testNativePrecision0096', `sum=${sum}`);
      expect(sum).assertEqual(14.5);
      expect(nativeAdd(5.55, 8.95)).assertEqual(14.5);
      expect(nativeAdd(14.5, -(5.55))).assertEqual(8.95);
      expect(nativeAdd(14.5, -(14.5))).assertEqual(0);
      expect(nativeAdd(8.95, 5.55) > 8.95).assertTrue();
      expect(nativeAdd(8.95, 5.55)).assertEqual(8.95 + 5.55);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0097
     * @tc.name      testNativePrecision0097
     * @tc.desc      Add decimal values 10.01 and 12.34 and expect the IEEE 754 sum 22.35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(10.01, 12.34);
      logCase('testNativePrecision0097', `sum=${sum}`);
      expect(sum).assertEqual(22.35);
      expect(nativeAdd(12.34, 10.01)).assertEqual(22.35);
      expect(nativeAdd(22.35, -(22.35))).assertEqual(0);
      expect(nativeAdd(10.01, 12.34) > 10.01).assertTrue();
      expect(nativeAdd(10.01, 12.34)).assertEqual(10.01 + 12.34);
      {
      const sum: number = nativeAdd(12.34, 0.05);
      logCase('testNativePrecision0098', `sum=${sum}`);
      expect(sum).assertEqual(12.39);
      expect(nativeAdd(0.05, 12.34)).assertEqual(12.39);
      expect(nativeAdd(12.39, -(0.05))).assertEqual(12.34);
      expect(nativeAdd(12.39, -(12.39))).assertEqual(0);
      expect(nativeAdd(12.34, 0.05) > 12.34).assertTrue();
      expect(nativeAdd(12.34, 0.05)).assertEqual(12.34 + 0.05);
      }
      {
      const sum: number = nativeAdd(56.78, 0.4);
      logCase('testNativePrecision0099', `sum=${sum}`);
      expect(sum).assertEqual(57.18);
      expect(nativeAdd(0.4, 56.78)).assertEqual(57.18);
      expect(nativeAdd(57.18, -(0.4))).assertEqual(56.78);
      expect(nativeAdd(57.18, -(57.18))).assertEqual(0);
      expect(nativeAdd(56.78, 0.4) > 56.78).assertTrue();
      expect(nativeAdd(56.78, 0.4)).assertEqual(56.78 + 0.4);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0100
     * @tc.name      testNativePrecision0100
     * @tc.desc      Add decimal values 90.12 and 0.9 and expect the IEEE 754 sum 91.02000000000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(90.12, 0.9);
      logCase('testNativePrecision0100', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(0.9, 90.12)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(90.12, 0.9) > 90.12).assertTrue();
      expect(nativeAdd(90.12, 0.9)).assertEqual(90.12 + 0.9);
      {
      const sum: number = nativeAdd(123.45, 4.35);
      logCase('testNativePrecision0101', `sum=${sum}`);
      expect(sum).assertEqual(127.8);
      expect(nativeAdd(4.35, 123.45)).assertEqual(127.8);
      expect(nativeAdd(127.8, -(4.35))).assertEqual(123.45);
      expect(nativeAdd(127.8, -(127.8))).assertEqual(0);
      expect(nativeAdd(123.45, 4.35) > 123.45).assertTrue();
      expect(nativeAdd(123.45, 4.35)).assertEqual(123.45 + 4.35);
      }
      {
      const sum: number = nativeAdd(678.9, 10.01);
      logCase('testNativePrecision0102', `sum=${sum}`);
      expect(sum).assertEqual(688.91);
      expect(nativeAdd(10.01, 678.9)).assertEqual(688.91);
      expect(nativeAdd(688.91, -(10.01))).assertEqual(678.9);
      expect(nativeAdd(688.91, -(688.91))).assertEqual(0);
      expect(nativeAdd(678.9, 10.01) > 678.9).assertTrue();
      expect(nativeAdd(678.9, 10.01)).assertEqual(678.9 + 10.01);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0103
     * @tc.name      testNativePrecision0103
     * @tc.desc      Add decimal values 0.05 and 678.9 and expect the IEEE 754 sum 678.9499999999999
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.05, 678.9);
      logCase('testNativePrecision0103', `sum=${sum}`);
      expect(sum).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9, 0.05)).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9499999999999, -(0.05))).assertEqual(678.9);
      expect(nativeAdd(678.9499999999999, -(678.9499999999999))).assertEqual(0);
      expect(nativeAdd(0.05, 678.9) > 0.05).assertTrue();
      expect(nativeAdd(0.05, 678.9)).assertEqual(0.05 + 678.9);
      {
      const sum: number = nativeAdd(0.005, 0.3);
      logCase('testNativePrecision0104', `sum=${sum}`);
      expect(sum).assertEqual(0.305);
      expect(nativeAdd(0.3, 0.005)).assertEqual(0.305);
      expect(nativeAdd(0.305, -(0.005))).assertEqual(0.3);
      expect(nativeAdd(0.305, -(0.305))).assertEqual(0);
      expect(nativeAdd(0.005, 0.3) > 0.005).assertTrue();
      expect(nativeAdd(0.005, 0.3)).assertEqual(0.005 + 0.3);
      }
      {
      const sum: number = nativeAdd(0.1, 0.8);
      logCase('testNativePrecision0105', `sum=${sum}`);
      expect(sum).assertEqual(0.9);
      expect(nativeAdd(0.8, 0.1)).assertEqual(0.9);
      expect(nativeAdd(0.9, -(0.1))).assertEqual(0.8);
      expect(nativeAdd(0.9, -(0.9))).assertEqual(0);
      expect(nativeAdd(0.1, 0.8) > 0.1).assertTrue();
      expect(nativeAdd(0.1, 0.8)).assertEqual(0.1 + 0.8);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0106
     * @tc.name      testNativePrecision0106
     * @tc.desc      Add decimal values 0.2 and 3.15 and expect the IEEE 754 sum 3.35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.2, 3.15);
      logCase('testNativePrecision0106', `sum=${sum}`);
      expect(sum).assertEqual(3.35);
      expect(nativeAdd(3.15, 0.2)).assertEqual(3.35);
      expect(nativeAdd(3.35, -(0.2))).assertEqual(3.15);
      expect(nativeAdd(3.35, -(3.35))).assertEqual(0);
      expect(nativeAdd(0.2, 3.15) > 0.2).assertTrue();
      expect(nativeAdd(0.2, 3.15)).assertEqual(0.2 + 3.15);
      {
      const sum: number = nativeAdd(0.3, 8.95);
      logCase('testNativePrecision0107', `sum=${sum}`);
      expect(sum).assertEqual(9.25);
      expect(nativeAdd(8.95, 0.3)).assertEqual(9.25);
      expect(nativeAdd(9.25, -(0.3))).assertEqual(8.95);
      expect(nativeAdd(9.25, -(9.25))).assertEqual(0);
      expect(nativeAdd(0.3, 8.95) > 0.3).assertTrue();
      expect(nativeAdd(0.3, 8.95)).assertEqual(0.3 + 8.95);
      }
      {
      const sum: number = nativeAdd(0.4, 123.45);
      logCase('testNativePrecision0108', `sum=${sum}`);
      expect(sum).assertEqual(123.85000000000001);
      expect(nativeAdd(123.45, 0.4)).assertEqual(123.85000000000001);
      expect(nativeAdd(123.85000000000001, -(0.4))).assertEqual(123.45);
      expect(nativeAdd(123.85000000000001, -(123.85000000000001))).assertEqual(0);
      expect(nativeAdd(0.4, 123.45) > 0.4).assertTrue();
      expect(nativeAdd(0.4, 123.45)).assertEqual(0.4 + 123.45);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0109
     * @tc.name      testNativePrecision0109
     * @tc.desc      Add decimal values 0.5 and 0.2 and expect the IEEE 754 sum 0.7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativePrecision0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(0.5, 0.2);
      logCase('testNativePrecision0109', `sum=${sum}`);
      expect(sum).assertEqual(0.7);
      expect(nativeAdd(0.2, 0.5)).assertEqual(0.7);
      expect(nativeAdd(0.7, -(0.7))).assertEqual(0);
      expect(nativeAdd(0.5, 0.2) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 0.2)).assertEqual(0.5 + 0.2);
      {
      const sum: number = nativeAdd(0.6, 0.7);
      logCase('testNativePrecision0110', `sum=${sum}`);
      expect(sum).assertEqual(1.2999999999999998);
      expect(nativeAdd(0.7, 0.6)).assertEqual(1.2999999999999998);
      expect(nativeAdd(1.2999999999999998, -(1.2999999999999998))).assertEqual(0);
      expect(nativeAdd(0.6, 0.7) > 0.6).assertTrue();
      expect(nativeAdd(0.6, 0.7)).assertEqual(0.6 + 0.7);
      }
      {
      const sum: number = nativeAdd(0.7, 2.75);
      logCase('testNativePrecision0111', `sum=${sum}`);
      expect(sum).assertEqual(3.45);
      expect(nativeAdd(2.75, 0.7)).assertEqual(3.45);
      expect(nativeAdd(3.45, -(0.7))).assertEqual(2.75);
      expect(nativeAdd(3.45, -(3.45))).assertEqual(0);
      expect(nativeAdd(0.7, 2.75) > 0.7).assertTrue();
      expect(nativeAdd(0.7, 2.75)).assertEqual(0.7 + 2.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0112
     * @tc.name      testNativePrecision0112
     * @tc.desc      Add decimal values 0.8 and 7.85 and expect the IEEE 754 sum 8.65
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(0.8, 7.85);
      logCase('testNativePrecision0112', `sum=${sum}`);
      expect(sum).assertEqual(8.65);
      expect(nativeAdd(7.85, 0.8)).assertEqual(8.65);
      expect(nativeAdd(8.65, -(8.65))).assertEqual(0);
      expect(nativeAdd(0.8, 7.85) > 0.8).assertTrue();
      expect(nativeAdd(0.8, 7.85)).assertEqual(0.8 + 7.85);
      {
      const sum: number = nativeAdd(0.9, 90.12);
      logCase('testNativePrecision0113', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(90.12, 0.9)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(0.9, 90.12) > 0.9).assertTrue();
      expect(nativeAdd(0.9, 90.12)).assertEqual(0.9 + 90.12);
      }
      {
      const sum: number = nativeAdd(1.1, 0.1);
      logCase('testNativePrecision0114', `sum=${sum}`);
      expect(sum).assertEqual(1.2000000000000002);
      expect(nativeAdd(0.1, 1.1)).assertEqual(1.2000000000000002);
      expect(nativeAdd(1.2000000000000002, -(0.1))).assertEqual(1.1);
      expect(nativeAdd(1.2000000000000002, -(1.2000000000000002))).assertEqual(0);
      expect(nativeAdd(1.1, 0.1) > 1.1).assertTrue();
      expect(nativeAdd(1.1, 0.1)).assertEqual(1.1 + 0.1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0115
     * @tc.name      testNativePrecision0115
     * @tc.desc      Add decimal values 1.25 and 0.6 and expect the IEEE 754 sum 1.85
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(1.25, 0.6);
      logCase('testNativePrecision0115', `sum=${sum}`);
      expect(sum).assertEqual(1.85);
      expect(nativeAdd(0.6, 1.25)).assertEqual(1.85);
      expect(nativeAdd(1.85, -(0.6))).assertEqual(1.25);
      expect(nativeAdd(1.85, -(1.85))).assertEqual(0);
      expect(nativeAdd(1.25, 0.6) > 1.25).assertTrue();
      expect(nativeAdd(1.25, 0.6)).assertEqual(1.25 + 0.6);
      {
      const sum: number = nativeAdd(2.75, 1.25);
      logCase('testNativePrecision0116', `sum=${sum}`);
      expect(sum).assertEqual(4.0);
      expect(nativeAdd(1.25, 2.75)).assertEqual(4.0);
      expect(nativeAdd(4.0, -(1.25))).assertEqual(2.75);
      expect(nativeAdd(4.0, -(2.75))).assertEqual(1.25);
      expect(nativeAdd(4.0, -(4.0))).assertEqual(0);
      expect(nativeAdd(2.75, 1.25) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.25)).assertEqual(2.75 + 1.25);
      }
      {
      const sum: number = nativeAdd(3.15, 6.65);
      logCase('testNativePrecision0117', `sum=${sum}`);
      expect(sum).assertEqual(9.8);
      expect(nativeAdd(6.65, 3.15)).assertEqual(9.8);
      expect(nativeAdd(9.8, -(3.15))).assertEqual(6.65);
      expect(nativeAdd(9.8, -(9.8))).assertEqual(0);
      expect(nativeAdd(3.15, 6.65) > 3.15).assertTrue();
      expect(nativeAdd(3.15, 6.65)).assertEqual(3.15 + 6.65);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0118
     * @tc.name      testNativePrecision0118
     * @tc.desc      Add decimal values 4.35 and 56.78 and expect the IEEE 754 sum 61.13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(4.35, 56.78);
      logCase('testNativePrecision0118', `sum=${sum}`);
      expect(sum).assertEqual(61.13);
      expect(nativeAdd(56.78, 4.35)).assertEqual(61.13);
      expect(nativeAdd(61.13, -(4.35))).assertEqual(56.78);
      expect(nativeAdd(61.13, -(61.13))).assertEqual(0);
      expect(nativeAdd(4.35, 56.78) > 4.35).assertTrue();
      expect(nativeAdd(4.35, 56.78)).assertEqual(4.35 + 56.78);
      {
      const sum: number = nativeAdd(5.55, 0.005);
      logCase('testNativePrecision0119', `sum=${sum}`);
      expect(sum).assertEqual(5.555);
      expect(nativeAdd(0.005, 5.55)).assertEqual(5.555);
      expect(nativeAdd(5.555, -(0.005))).assertEqual(5.55);
      expect(nativeAdd(5.555, -(5.555))).assertEqual(0);
      expect(nativeAdd(5.55, 0.005) > 5.55).assertTrue();
      expect(nativeAdd(5.55, 0.005)).assertEqual(5.55 + 0.005);
      }
      {
      const sum: number = nativeAdd(6.65, 0.5);
      logCase('testNativePrecision0120', `sum=${sum}`);
      expect(sum).assertEqual(7.15);
      expect(nativeAdd(0.5, 6.65)).assertEqual(7.15);
      expect(nativeAdd(7.15, -(0.5))).assertEqual(6.65);
      expect(nativeAdd(7.15, -(6.65))).assertEqual(0.5);
      expect(nativeAdd(7.15, -(7.15))).assertEqual(0);
      expect(nativeAdd(6.65, 0.5) > 6.65).assertTrue();
      expect(nativeAdd(6.65, 0.5)).assertEqual(6.65 + 0.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0121
     * @tc.name      testNativePrecision0121
     * @tc.desc      Add decimal values 7.85 and 1.1 and expect the IEEE 754 sum 8.95
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(7.85, 1.1);
      logCase('testNativePrecision0121', `sum=${sum}`);
      expect(sum).assertEqual(8.95);
      expect(nativeAdd(1.1, 7.85)).assertEqual(8.95);
      expect(nativeAdd(8.95, -(1.1))).assertEqual(7.85);
      expect(nativeAdd(8.95, -(8.95))).assertEqual(0);
      expect(nativeAdd(7.85, 1.1) > 7.85).assertTrue();
      expect(nativeAdd(7.85, 1.1)).assertEqual(7.85 + 1.1);
      {
      const sum: number = nativeAdd(8.95, 5.55);
      logCase('testNativePrecision0122', `sum=${sum}`);
      expect(sum).assertEqual(14.5);
      expect(nativeAdd(5.55, 8.95)).assertEqual(14.5);
      expect(nativeAdd(14.5, -(5.55))).assertEqual(8.95);
      expect(nativeAdd(14.5, -(14.5))).assertEqual(0);
      expect(nativeAdd(8.95, 5.55) > 8.95).assertTrue();
      expect(nativeAdd(8.95, 5.55)).assertEqual(8.95 + 5.55);
      }
      {
      const sum: number = nativeAdd(10.01, 12.34);
      logCase('testNativePrecision0123', `sum=${sum}`);
      expect(sum).assertEqual(22.35);
      expect(nativeAdd(12.34, 10.01)).assertEqual(22.35);
      expect(nativeAdd(22.35, -(22.35))).assertEqual(0);
      expect(nativeAdd(10.01, 12.34) > 10.01).assertTrue();
      expect(nativeAdd(10.01, 12.34)).assertEqual(10.01 + 12.34);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0124
     * @tc.name      testNativePrecision0124
     * @tc.desc      Add decimal values 12.34 and 0.05 and expect the IEEE 754 sum 12.39
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(12.34, 0.05);
      logCase('testNativePrecision0124', `sum=${sum}`);
      expect(sum).assertEqual(12.39);
      expect(nativeAdd(0.05, 12.34)).assertEqual(12.39);
      expect(nativeAdd(12.39, -(0.05))).assertEqual(12.34);
      expect(nativeAdd(12.39, -(12.39))).assertEqual(0);
      expect(nativeAdd(12.34, 0.05) > 12.34).assertTrue();
      expect(nativeAdd(12.34, 0.05)).assertEqual(12.34 + 0.05);
      {
      const sum: number = nativeAdd(56.78, 0.4);
      logCase('testNativePrecision0125', `sum=${sum}`);
      expect(sum).assertEqual(57.18);
      expect(nativeAdd(0.4, 56.78)).assertEqual(57.18);
      expect(nativeAdd(57.18, -(0.4))).assertEqual(56.78);
      expect(nativeAdd(57.18, -(57.18))).assertEqual(0);
      expect(nativeAdd(56.78, 0.4) > 56.78).assertTrue();
      expect(nativeAdd(56.78, 0.4)).assertEqual(56.78 + 0.4);
      }
      {
      const sum: number = nativeAdd(90.12, 0.9);
      logCase('testNativePrecision0126', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(0.9, 90.12)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(90.12, 0.9) > 90.12).assertTrue();
      expect(nativeAdd(90.12, 0.9)).assertEqual(90.12 + 0.9);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0127
     * @tc.name      testNativePrecision0127
     * @tc.desc      Add decimal values 123.45 and 4.35 and expect the IEEE 754 sum 127.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(123.45, 4.35);
      logCase('testNativePrecision0127', `sum=${sum}`);
      expect(sum).assertEqual(127.8);
      expect(nativeAdd(4.35, 123.45)).assertEqual(127.8);
      expect(nativeAdd(127.8, -(4.35))).assertEqual(123.45);
      expect(nativeAdd(127.8, -(127.8))).assertEqual(0);
      expect(nativeAdd(123.45, 4.35) > 123.45).assertTrue();
      expect(nativeAdd(123.45, 4.35)).assertEqual(123.45 + 4.35);
      {
      const sum: number = nativeAdd(678.9, 10.01);
      logCase('testNativePrecision0128', `sum=${sum}`);
      expect(sum).assertEqual(688.91);
      expect(nativeAdd(10.01, 678.9)).assertEqual(688.91);
      expect(nativeAdd(688.91, -(10.01))).assertEqual(678.9);
      expect(nativeAdd(688.91, -(688.91))).assertEqual(0);
      expect(nativeAdd(678.9, 10.01) > 678.9).assertTrue();
      expect(nativeAdd(678.9, 10.01)).assertEqual(678.9 + 10.01);
      }
      {
      const sum: number = nativeAdd(0.05, 678.9);
      logCase('testNativePrecision0129', `sum=${sum}`);
      expect(sum).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9, 0.05)).assertEqual(678.9499999999999);
      expect(nativeAdd(678.9499999999999, -(0.05))).assertEqual(678.9);
      expect(nativeAdd(678.9499999999999, -(678.9499999999999))).assertEqual(0);
      expect(nativeAdd(0.05, 678.9) > 0.05).assertTrue();
      expect(nativeAdd(0.05, 678.9)).assertEqual(0.05 + 678.9);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0130
     * @tc.name      testNativePrecision0130
     * @tc.desc      Add decimal values 0.005 and 0.3 and expect the IEEE 754 sum 0.305
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(0.005, 0.3);
      logCase('testNativePrecision0130', `sum=${sum}`);
      expect(sum).assertEqual(0.305);
      expect(nativeAdd(0.3, 0.005)).assertEqual(0.305);
      expect(nativeAdd(0.305, -(0.005))).assertEqual(0.3);
      expect(nativeAdd(0.305, -(0.305))).assertEqual(0);
      expect(nativeAdd(0.005, 0.3) > 0.005).assertTrue();
      expect(nativeAdd(0.005, 0.3)).assertEqual(0.005 + 0.3);
      {
      const sum: number = nativeAdd(0.1, 0.8);
      logCase('testNativePrecision0131', `sum=${sum}`);
      expect(sum).assertEqual(0.9);
      expect(nativeAdd(0.8, 0.1)).assertEqual(0.9);
      expect(nativeAdd(0.9, -(0.1))).assertEqual(0.8);
      expect(nativeAdd(0.9, -(0.9))).assertEqual(0);
      expect(nativeAdd(0.1, 0.8) > 0.1).assertTrue();
      expect(nativeAdd(0.1, 0.8)).assertEqual(0.1 + 0.8);
      }
      {
      const sum: number = nativeAdd(0.2, 3.15);
      logCase('testNativePrecision0132', `sum=${sum}`);
      expect(sum).assertEqual(3.35);
      expect(nativeAdd(3.15, 0.2)).assertEqual(3.35);
      expect(nativeAdd(3.35, -(0.2))).assertEqual(3.15);
      expect(nativeAdd(3.35, -(3.35))).assertEqual(0);
      expect(nativeAdd(0.2, 3.15) > 0.2).assertTrue();
      expect(nativeAdd(0.2, 3.15)).assertEqual(0.2 + 3.15);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0133
     * @tc.name      testNativePrecision0133
     * @tc.desc      Add decimal values 0.3 and 8.95 and expect the IEEE 754 sum 9.25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(0.3, 8.95);
      logCase('testNativePrecision0133', `sum=${sum}`);
      expect(sum).assertEqual(9.25);
      expect(nativeAdd(8.95, 0.3)).assertEqual(9.25);
      expect(nativeAdd(9.25, -(0.3))).assertEqual(8.95);
      expect(nativeAdd(9.25, -(9.25))).assertEqual(0);
      expect(nativeAdd(0.3, 8.95) > 0.3).assertTrue();
      expect(nativeAdd(0.3, 8.95)).assertEqual(0.3 + 8.95);
      {
      const sum: number = nativeAdd(0.4, 123.45);
      logCase('testNativePrecision0134', `sum=${sum}`);
      expect(sum).assertEqual(123.85000000000001);
      expect(nativeAdd(123.45, 0.4)).assertEqual(123.85000000000001);
      expect(nativeAdd(123.85000000000001, -(0.4))).assertEqual(123.45);
      expect(nativeAdd(123.85000000000001, -(123.85000000000001))).assertEqual(0);
      expect(nativeAdd(0.4, 123.45) > 0.4).assertTrue();
      expect(nativeAdd(0.4, 123.45)).assertEqual(0.4 + 123.45);
      }
      {
      const sum: number = nativeAdd(0.5, 0.2);
      logCase('testNativePrecision0135', `sum=${sum}`);
      expect(sum).assertEqual(0.7);
      expect(nativeAdd(0.2, 0.5)).assertEqual(0.7);
      expect(nativeAdd(0.7, -(0.7))).assertEqual(0);
      expect(nativeAdd(0.5, 0.2) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 0.2)).assertEqual(0.5 + 0.2);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0136
     * @tc.name      testNativePrecision0136
     * @tc.desc      Add decimal values 0.6 and 0.7 and expect the IEEE 754 sum 1.2999999999999998
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(0.6, 0.7);
      logCase('testNativePrecision0136', `sum=${sum}`);
      expect(sum).assertEqual(1.2999999999999998);
      expect(nativeAdd(0.7, 0.6)).assertEqual(1.2999999999999998);
      expect(nativeAdd(1.2999999999999998, -(1.2999999999999998))).assertEqual(0);
      expect(nativeAdd(0.6, 0.7) > 0.6).assertTrue();
      expect(nativeAdd(0.6, 0.7)).assertEqual(0.6 + 0.7);
      {
      const sum: number = nativeAdd(0.7, 2.75);
      logCase('testNativePrecision0137', `sum=${sum}`);
      expect(sum).assertEqual(3.45);
      expect(nativeAdd(2.75, 0.7)).assertEqual(3.45);
      expect(nativeAdd(3.45, -(0.7))).assertEqual(2.75);
      expect(nativeAdd(3.45, -(3.45))).assertEqual(0);
      expect(nativeAdd(0.7, 2.75) > 0.7).assertTrue();
      expect(nativeAdd(0.7, 2.75)).assertEqual(0.7 + 2.75);
      }
      {
      const sum: number = nativeAdd(0.8, 7.85);
      logCase('testNativePrecision0138', `sum=${sum}`);
      expect(sum).assertEqual(8.65);
      expect(nativeAdd(7.85, 0.8)).assertEqual(8.65);
      expect(nativeAdd(8.65, -(8.65))).assertEqual(0);
      expect(nativeAdd(0.8, 7.85) > 0.8).assertTrue();
      expect(nativeAdd(0.8, 7.85)).assertEqual(0.8 + 7.85);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0139
     * @tc.name      testNativePrecision0139
     * @tc.desc      Add decimal values 0.9 and 90.12 and expect the IEEE 754 sum 91.02000000000001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(0.9, 90.12);
      logCase('testNativePrecision0139', `sum=${sum}`);
      expect(sum).assertEqual(91.02000000000001);
      expect(nativeAdd(90.12, 0.9)).assertEqual(91.02000000000001);
      expect(nativeAdd(91.02000000000001, -(0.9))).assertEqual(90.12);
      expect(nativeAdd(91.02000000000001, -(91.02000000000001))).assertEqual(0);
      expect(nativeAdd(0.9, 90.12) > 0.9).assertTrue();
      expect(nativeAdd(0.9, 90.12)).assertEqual(0.9 + 90.12);
      {
      const sum: number = nativeAdd(1.1, 0.1);
      logCase('testNativePrecision0140', `sum=${sum}`);
      expect(sum).assertEqual(1.2000000000000002);
      expect(nativeAdd(0.1, 1.1)).assertEqual(1.2000000000000002);
      expect(nativeAdd(1.2000000000000002, -(0.1))).assertEqual(1.1);
      expect(nativeAdd(1.2000000000000002, -(1.2000000000000002))).assertEqual(0);
      expect(nativeAdd(1.1, 0.1) > 1.1).assertTrue();
      expect(nativeAdd(1.1, 0.1)).assertEqual(1.1 + 0.1);
      }
      {
      const sum: number = nativeAdd(1.25, 0.6);
      logCase('testNativePrecision0141', `sum=${sum}`);
      expect(sum).assertEqual(1.85);
      expect(nativeAdd(0.6, 1.25)).assertEqual(1.85);
      expect(nativeAdd(1.85, -(0.6))).assertEqual(1.25);
      expect(nativeAdd(1.85, -(1.85))).assertEqual(0);
      expect(nativeAdd(1.25, 0.6) > 1.25).assertTrue();
      expect(nativeAdd(1.25, 0.6)).assertEqual(1.25 + 0.6);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0142
     * @tc.name      testNativePrecision0142
     * @tc.desc      Add decimal values 2.75 and 1.25 and expect the IEEE 754 sum 4.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2.75, 1.25);
      logCase('testNativePrecision0142', `sum=${sum}`);
      expect(sum).assertEqual(4.0);
      expect(nativeAdd(1.25, 2.75)).assertEqual(4.0);
      expect(nativeAdd(4.0, -(1.25))).assertEqual(2.75);
      expect(nativeAdd(4.0, -(2.75))).assertEqual(1.25);
      expect(nativeAdd(4.0, -(4.0))).assertEqual(0);
      expect(nativeAdd(2.75, 1.25) > 2.75).assertTrue();
      expect(nativeAdd(2.75, 1.25)).assertEqual(2.75 + 1.25);
      {
      const sum: number = nativeAdd(3.15, 6.65);
      logCase('testNativePrecision0143', `sum=${sum}`);
      expect(sum).assertEqual(9.8);
      expect(nativeAdd(6.65, 3.15)).assertEqual(9.8);
      expect(nativeAdd(9.8, -(3.15))).assertEqual(6.65);
      expect(nativeAdd(9.8, -(9.8))).assertEqual(0);
      expect(nativeAdd(3.15, 6.65) > 3.15).assertTrue();
      expect(nativeAdd(3.15, 6.65)).assertEqual(3.15 + 6.65);
      }
      {
      const sum: number = nativeAdd(4.35, 56.78);
      logCase('testNativePrecision0144', `sum=${sum}`);
      expect(sum).assertEqual(61.13);
      expect(nativeAdd(56.78, 4.35)).assertEqual(61.13);
      expect(nativeAdd(61.13, -(4.35))).assertEqual(56.78);
      expect(nativeAdd(61.13, -(61.13))).assertEqual(0);
      expect(nativeAdd(4.35, 56.78) > 4.35).assertTrue();
      expect(nativeAdd(4.35, 56.78)).assertEqual(4.35 + 56.78);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0145
     * @tc.name      testNativePrecision0145
     * @tc.desc      Add decimal values 5.55 and 0.005 and expect the IEEE 754 sum 5.555
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5.55, 0.005);
      logCase('testNativePrecision0145', `sum=${sum}`);
      expect(sum).assertEqual(5.555);
      expect(nativeAdd(0.005, 5.55)).assertEqual(5.555);
      expect(nativeAdd(5.555, -(0.005))).assertEqual(5.55);
      expect(nativeAdd(5.555, -(5.555))).assertEqual(0);
      expect(nativeAdd(5.55, 0.005) > 5.55).assertTrue();
      expect(nativeAdd(5.55, 0.005)).assertEqual(5.55 + 0.005);
      {
      const sum: number = nativeAdd(6.65, 0.5);
      logCase('testNativePrecision0146', `sum=${sum}`);
      expect(sum).assertEqual(7.15);
      expect(nativeAdd(0.5, 6.65)).assertEqual(7.15);
      expect(nativeAdd(7.15, -(0.5))).assertEqual(6.65);
      expect(nativeAdd(7.15, -(6.65))).assertEqual(0.5);
      expect(nativeAdd(7.15, -(7.15))).assertEqual(0);
      expect(nativeAdd(6.65, 0.5) > 6.65).assertTrue();
      expect(nativeAdd(6.65, 0.5)).assertEqual(6.65 + 0.5);
      }
      {
      const sum: number = nativeAdd(7.85, 1.1);
      logCase('testNativePrecision0147', `sum=${sum}`);
      expect(sum).assertEqual(8.95);
      expect(nativeAdd(1.1, 7.85)).assertEqual(8.95);
      expect(nativeAdd(8.95, -(1.1))).assertEqual(7.85);
      expect(nativeAdd(8.95, -(8.95))).assertEqual(0);
      expect(nativeAdd(7.85, 1.1) > 7.85).assertTrue();
      expect(nativeAdd(7.85, 1.1)).assertEqual(7.85 + 1.1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PRECISION_0148
     * @tc.name      testNativePrecision0148
     * @tc.desc      Add decimal values 8.95 and 5.55 and expect the IEEE 754 sum 14.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativePrecision0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(8.95, 5.55);
      logCase('testNativePrecision0148', `sum=${sum}`);
      expect(sum).assertEqual(14.5);
      expect(nativeAdd(5.55, 8.95)).assertEqual(14.5);
      expect(nativeAdd(14.5, -(5.55))).assertEqual(8.95);
      expect(nativeAdd(14.5, -(14.5))).assertEqual(0);
      expect(nativeAdd(8.95, 5.55) > 8.95).assertTrue();
      expect(nativeAdd(8.95, 5.55)).assertEqual(8.95 + 5.55);
      {
      const sum: number = nativeAdd(10.01, 12.34);
      logCase('testNativePrecision0149', `sum=${sum}`);
      expect(sum).assertEqual(22.35);
      expect(nativeAdd(12.34, 10.01)).assertEqual(22.35);
      expect(nativeAdd(22.35, -(22.35))).assertEqual(0);
      expect(nativeAdd(10.01, 12.34) > 10.01).assertTrue();
      expect(nativeAdd(10.01, 12.34)).assertEqual(10.01 + 12.34);
      }
      {
      const sum: number = nativeAdd(12.34, 0.05);
      logCase('testNativePrecision0150', `sum=${sum}`);
      expect(sum).assertEqual(12.39);
      expect(nativeAdd(0.05, 12.34)).assertEqual(12.39);
      expect(nativeAdd(12.39, -(0.05))).assertEqual(12.34);
      expect(nativeAdd(12.39, -(12.39))).assertEqual(0);
      expect(nativeAdd(12.34, 0.05) > 12.34).assertTrue();
      expect(nativeAdd(12.34, 0.05)).assertEqual(12.34 + 0.05);
      }
    });

  });
}
