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

export default function nativeAddBoundaryMatrixTest() {
  describe('NativeAddBoundaryMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0001
     * @tc.name      testNativeBoundary0001
     * @tc.desc      Add boundary values 0.0 and 0.0 and expect 0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.0, 0.0);
      logCase('testNativeBoundary0001', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(0.0, 0.0)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(0.0, 0.0)).assertEqual(0.0 + 0.0);
      {
      const sum: number = nativeAdd(1.0, -1.0);
      logCase('testNativeBoundary0002', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(-1.0, 1.0)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(-1.0))).assertEqual(1.0);
      expect(nativeAdd(0.0, -(1.0))).assertEqual(-1.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(1.0, -1.0)).assertEqual(1.0 + -1.0);
      }
      {
      const sum: number = nativeAdd(-1.0, 1.0);
      logCase('testNativeBoundary0003', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(1.0, -1.0)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(1.0))).assertEqual(-1.0);
      expect(nativeAdd(0.0, -(-1.0))).assertEqual(1.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(-1.0, 1.0)).assertEqual(-1.0 + 1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0004
     * @tc.name      testNativeBoundary0004
     * @tc.desc      Add boundary values 0.0 and -0 and expect 0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(0.0, -0);
      logCase('testNativeBoundary0004', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(-0, 0.0)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(-0))).assertEqual(0.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(-0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(0.0, -0)).assertEqual(0.0 + -0);
      {
      const sum: number = nativeAdd(-0, -0);
      logCase('testNativeBoundary0005', 'negative zero case');
      expect(sum).assertEqual(0);
      expect(nativeAdd(-0, -0)).assertEqual(0);
      expect(nativeAdd(0, -(-0))).assertEqual(-0);
      expect(nativeAdd(0, -(-0))).assertEqual(-0);
      expect(nativeAdd(0, -(0))).assertEqual(0);
      expect(Math.abs(nativeAdd(-0, -0)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(-0, -0) % 3)).assertEqual(0);
      expect(nativeAdd(-0, 0)).assertEqual(-0);
      expect(1 / sum).assertEqual(-Infinity);
      }
      {
      const sum: number = nativeAdd(-0, 5.0);
      logCase('testNativeBoundary0006', `sum=${sum}`);
      expect(sum).assertEqual(5.0);
      expect(nativeAdd(5.0, -0)).assertEqual(5.0);
      expect(nativeAdd(5.0, -(5.0))).assertEqual(-0);
      expect(nativeAdd(5.0, -(-0))).assertEqual(5.0);
      expect(nativeAdd(5.0, -(5.0))).assertEqual(0);
      expect(nativeAdd(-0, 5.0)).assertEqual(-0 + 5.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0007
     * @tc.name      testNativeBoundary0007
     * @tc.desc      Add boundary values 5.0 and -0 and expect 5.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(5.0, -0);
      logCase('testNativeBoundary0007', `sum=${sum}`);
      expect(sum).assertEqual(5.0);
      expect(nativeAdd(-0, 5.0)).assertEqual(5.0);
      expect(nativeAdd(5.0, -(-0))).assertEqual(5.0);
      expect(nativeAdd(5.0, -(5.0))).assertEqual(-0);
      expect(nativeAdd(5.0, -(5.0))).assertEqual(0);
      expect(nativeAdd(5.0, -0)).assertEqual(5.0 + -0);
      {
      const sum: number = nativeAdd(Infinity, 5.0);
      logCase('testNativeBoundary0008', `inf=${sum}`);
      expect(sum).assertEqual(Infinity);
      expect(sum > 0).assertEqual(true);
      }
      {
      const sum: number = nativeAdd(5.0, Infinity);
      logCase('testNativeBoundary0009', `inf=${sum}`);
      expect(sum).assertEqual(Infinity);
      expect(sum > 0).assertEqual(true);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0010
     * @tc.name      testNativeBoundary0010
     * @tc.desc      Add boundary values Infinity and Infinity and expect Infinity
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(Infinity, Infinity);
      logCase('testNativeBoundary0010', `inf=${sum}`);
      expect(sum).assertEqual(Infinity);
      expect(sum > 0).assertEqual(true);
      {
      const sum: number = nativeAdd(Infinity, (-Infinity));
      logCase('testNativeBoundary0011', 'not a number case');
      expect(Number.isNaN(sum)).assertTrue();
      }
      {
      const sum: number = nativeAdd(Infinity, 0.0);
      logCase('testNativeBoundary0012', `inf=${sum}`);
      expect(sum).assertEqual(Infinity);
      expect(sum > 0).assertEqual(true);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0013
     * @tc.name      testNativeBoundary0013
     * @tc.desc      Add boundary values (-Infinity) and 0.0 and expect (-Infinity)
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd((-Infinity), 0.0);
      logCase('testNativeBoundary0013', `inf=${sum}`);
      expect(sum).assertEqual((-Infinity));
      expect(sum > 0).assertEqual(false);
      {
      const sum: number = nativeAdd(Infinity, NaN);
      logCase('testNativeBoundary0014', 'not a number case');
      expect(Number.isNaN(sum)).assertTrue();
      }
      {
      const sum: number = nativeAdd(NaN, 0.0);
      logCase('testNativeBoundary0015', 'not a number case');
      expect(Number.isNaN(sum)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0016
     * @tc.name      testNativeBoundary0016
     * @tc.desc      Add boundary values NaN and NaN and expect NaN
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(NaN, NaN);
      logCase('testNativeBoundary0016', 'not a number case');
      expect(Number.isNaN(sum)).assertTrue();
      {
      const sum: number = nativeAdd(1e+308, 1e+308);
      logCase('testNativeBoundary0017', `inf=${sum}`);
      expect(sum).assertEqual(Infinity);
      expect(sum > 0).assertEqual(true);
      }
      {
      const sum: number = nativeAdd(-1e+308, -1e+308);
      logCase('testNativeBoundary0018', `inf=${sum}`);
      expect(sum).assertEqual((-Infinity));
      expect(sum > 0).assertEqual(false);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0019
     * @tc.name      testNativeBoundary0019
     * @tc.desc      Add boundary values 1e+308 and -1e+308 and expect 0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1e+308, -1e+308);
      logCase('testNativeBoundary0019', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(-1e+308, 1e+308)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(-1e+308))).assertEqual(1e+308);
      expect(nativeAdd(0.0, -(1e+308))).assertEqual(-1e+308);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(1e+308, -1e+308)).assertEqual(1e+308 + -1e+308);
      {
      const sum: number = nativeAdd(5e-324, 0.0);
      logCase('testNativeBoundary0020', `sum=${sum}`);
      expect(sum).assertEqual(5e-324);
      expect(nativeAdd(0.0, 5e-324)).assertEqual(5e-324);
      expect(nativeAdd(5e-324, -(0.0))).assertEqual(5e-324);
      expect(nativeAdd(5e-324, -(5e-324))).assertEqual(0.0);
      expect(nativeAdd(5e-324, -(5e-324))).assertEqual(0);
      expect(nativeAdd(5e-324, 0.0)).assertEqual(5e-324 + 0.0);
      }
      {
      const sum: number = nativeAdd(5e-324, 5e-324);
      logCase('testNativeBoundary0021', `sum=${sum}`);
      expect(sum).assertEqual(1e-323);
      expect(nativeAdd(5e-324, 5e-324)).assertEqual(1e-323);
      expect(nativeAdd(1e-323, -(5e-324))).assertEqual(5e-324);
      expect(nativeAdd(1e-323, -(5e-324))).assertEqual(5e-324);
      expect(nativeAdd(1e-323, -(1e-323))).assertEqual(0);
      expect(nativeAdd(5e-324, 5e-324) > 5e-324).assertTrue();
      expect(nativeAdd(5e-324, 5e-324)).assertEqual(5e-324 + 5e-324);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0022
     * @tc.name      testNativeBoundary0022
     * @tc.desc      Add boundary values 1.7976931348623157e+308 and 0.0 and expect 1.7976931348623157e+308
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1.7976931348623157e+308, 0.0);
      logCase('testNativeBoundary0022', `sum=${sum}`);
      expect(sum).assertEqual(1.7976931348623157e+308);
      {
      const sum: number = nativeAdd(2.2250738585072014e-308, 0.0);
      logCase('testNativeBoundary0023', `sum=${sum}`);
      expect(sum).assertEqual(2.2250738585072014e-308);
      expect(nativeAdd(0.0, 2.2250738585072014e-308)).assertEqual(2.2250738585072014e-308);
      expect(nativeAdd(2.2250738585072014e-308, -(0.0))).assertEqual(2.2250738585072014e-308);
      expect(nativeAdd(2.2250738585072014e-308, -(2.2250738585072014e-308))).assertEqual(0.0);
      expect(nativeAdd(2.2250738585072014e-308, -(2.2250738585072014e-308))).assertEqual(0);
      expect(nativeAdd(2.2250738585072014e-308, 0.0)).assertEqual(2.2250738585072014e-308 + 0.0);
      }
      {
      const sum: number = nativeAdd(2.220446049250313e-16, 0.0);
      logCase('testNativeBoundary0024', `sum=${sum}`);
      expect(sum).assertEqual(2.220446049250313e-16);
      expect(nativeAdd(0.0, 2.220446049250313e-16)).assertEqual(2.220446049250313e-16);
      expect(nativeAdd(2.220446049250313e-16, -(0.0))).assertEqual(2.220446049250313e-16);
      expect(nativeAdd(2.220446049250313e-16, -(2.220446049250313e-16))).assertEqual(0.0);
      expect(nativeAdd(2.220446049250313e-16, -(2.220446049250313e-16))).assertEqual(0);
      expect(nativeAdd(2.220446049250313e-16, 0.0)).assertEqual(2.220446049250313e-16 + 0.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0025
     * @tc.name      testNativeBoundary0025
     * @tc.desc      Add boundary values 9007199254740991.0 and 0.0 and expect 9007199254740991.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(9007199254740991.0, 0.0);
      logCase('testNativeBoundary0025', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740991.0);
      expect(nativeAdd(0.0, 9007199254740991.0)).assertEqual(9007199254740991.0);
      expect(nativeAdd(9007199254740991.0, -(0.0))).assertEqual(9007199254740991.0);
      expect(nativeAdd(9007199254740991.0, -(9007199254740991.0))).assertEqual(0.0);
      expect(nativeAdd(9007199254740991.0, -(9007199254740991.0))).assertEqual(0);
      expect(nativeAdd(9007199254740991.0, 0.0)).assertEqual(9007199254740991.0 + 0.0);
      {
      const sum: number = nativeAdd(9007199254740991.0, 1.0);
      logCase('testNativeBoundary0026', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740992.0);
      expect(nativeAdd(1.0, 9007199254740991.0)).assertEqual(9007199254740992.0);
      expect(nativeAdd(9007199254740992.0, -(1.0))).assertEqual(9007199254740991.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740991.0))).assertEqual(1.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740992.0))).assertEqual(0);
      expect(nativeAdd(9007199254740991.0, 1.0) > 9007199254740991.0).assertTrue();
      expect(nativeAdd(9007199254740991.0, 1.0)).assertEqual(9007199254740991.0 + 1.0);
      }
      {
      const sum: number = nativeAdd(9007199254740991.0, -1.0);
      logCase('testNativeBoundary0027', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740990.0);
      expect(nativeAdd(-1.0, 9007199254740991.0)).assertEqual(9007199254740990.0);
      expect(nativeAdd(9007199254740990.0, -(-1.0))).assertEqual(9007199254740991.0);
      expect(nativeAdd(9007199254740990.0, -(9007199254740991.0))).assertEqual(-1.0);
      expect(nativeAdd(9007199254740990.0, -(9007199254740990.0))).assertEqual(0);
      expect(nativeAdd(9007199254740991.0, -1.0)).assertEqual(9007199254740991.0 + -1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0028
     * @tc.name      testNativeBoundary0028
     * @tc.desc      Add boundary values 9007199254740992.0 and 1.0 and expect 9007199254740992.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(9007199254740992.0, 1.0);
      logCase('testNativeBoundary0028', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740992.0);
      expect(nativeAdd(1.0, 9007199254740992.0)).assertEqual(9007199254740992.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740992.0))).assertEqual(0);
      expect(nativeAdd(9007199254740992.0, 1.0)).assertEqual(9007199254740992.0 + 1.0);
      {
      const sum: number = nativeAdd(9007199254740990.0, 2.0);
      logCase('testNativeBoundary0029', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740992.0);
      expect(nativeAdd(2.0, 9007199254740990.0)).assertEqual(9007199254740992.0);
      expect(nativeAdd(9007199254740992.0, -(2.0))).assertEqual(9007199254740990.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740990.0))).assertEqual(2.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740992.0))).assertEqual(0);
      expect(nativeAdd(9007199254740990.0, 2.0) > 9007199254740990.0).assertTrue();
      expect(nativeAdd(9007199254740990.0, 2.0)).assertEqual(9007199254740990.0 + 2.0);
      }
      {
      const sum: number = nativeAdd(-9007199254740991.0, -1.0);
      logCase('testNativeBoundary0030', `sum=${sum}`);
      expect(sum).assertEqual(-9007199254740992.0);
      expect(nativeAdd(-1.0, -9007199254740991.0)).assertEqual(-9007199254740992.0);
      expect(nativeAdd(-9007199254740992.0, -(-1.0))).assertEqual(-9007199254740991.0);
      expect(nativeAdd(-9007199254740992.0, -(-9007199254740991.0))).assertEqual(-1.0);
      expect(nativeAdd(-9007199254740992.0, -(-9007199254740992.0))).assertEqual(0);
      expect(nativeAdd(-9007199254740991.0, -1.0) < -9007199254740991.0).assertTrue();
      expect(nativeAdd(-9007199254740991.0, -1.0)).assertEqual(-9007199254740991.0 + -1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0031
     * @tc.name      testNativeBoundary0031
     * @tc.desc      Add boundary values 4503599627370496.0 and 4503599627370496.0 and expect 9007199254740992.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(4503599627370496.0, 4503599627370496.0);
      logCase('testNativeBoundary0031', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740992.0);
      expect(nativeAdd(4503599627370496.0, 4503599627370496.0)).assertEqual(9007199254740992.0);
      expect(nativeAdd(9007199254740992.0, -(4503599627370496.0))).assertEqual(4503599627370496.0);
      expect(nativeAdd(9007199254740992.0, -(4503599627370496.0))).assertEqual(4503599627370496.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740992.0))).assertEqual(0);
      expect(nativeAdd(4503599627370496.0, 4503599627370496.0) > 4503599627370496.0).assertTrue();
      expect(nativeAdd(4503599627370496.0, 4503599627370496.0)).assertEqual(4503599627370496.0 + 4503599627370496.0);
      {
      const sum: number = nativeAdd(4503599627370495.0, 1.0);
      logCase('testNativeBoundary0032', `sum=${sum}`);
      expect(sum).assertEqual(4503599627370496.0);
      expect(nativeAdd(1.0, 4503599627370495.0)).assertEqual(4503599627370496.0);
      expect(nativeAdd(4503599627370496.0, -(1.0))).assertEqual(4503599627370495.0);
      expect(nativeAdd(4503599627370496.0, -(4503599627370495.0))).assertEqual(1.0);
      expect(nativeAdd(4503599627370496.0, -(4503599627370496.0))).assertEqual(0);
      expect(nativeAdd(4503599627370495.0, 1.0) > 4503599627370495.0).assertTrue();
      expect(nativeAdd(4503599627370495.0, 1.0)).assertEqual(4503599627370495.0 + 1.0);
      }
      {
      const sum: number = nativeAdd(1500000000000000.0, 2500000000000000.0);
      logCase('testNativeBoundary0033', `sum=${sum}`);
      expect(sum).assertEqual(4000000000000000.0);
      expect(nativeAdd(2500000000000000.0, 1500000000000000.0)).assertEqual(4000000000000000.0);
      expect(nativeAdd(4000000000000000.0, -(2500000000000000.0))).assertEqual(1500000000000000.0);
      expect(nativeAdd(4000000000000000.0, -(1500000000000000.0))).assertEqual(2500000000000000.0);
      expect(nativeAdd(4000000000000000.0, -(4000000000000000.0))).assertEqual(0);
      expect(nativeAdd(1500000000000000.0, 2500000000000000.0) > 1500000000000000.0).assertTrue();
      expect(nativeAdd(1500000000000000.0, 2500000000000000.0)).assertEqual(1500000000000000.0 + 2500000000000000.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0034
     * @tc.name      testNativeBoundary0034
     * @tc.desc      Add boundary values -1500000000000000.0 and -2500000000000000.0 and expect -4000000000000000.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1500000000000000.0, -2500000000000000.0);
      logCase('testNativeBoundary0034', `sum=${sum}`);
      expect(sum).assertEqual(-4000000000000000.0);
      expect(nativeAdd(-2500000000000000.0, -1500000000000000.0)).assertEqual(-4000000000000000.0);
      expect(nativeAdd(-4000000000000000.0, -(-2500000000000000.0))).assertEqual(-1500000000000000.0);
      expect(nativeAdd(-4000000000000000.0, -(-1500000000000000.0))).assertEqual(-2500000000000000.0);
      expect(nativeAdd(-4000000000000000.0, -(-4000000000000000.0))).assertEqual(0);
      expect(nativeAdd(-1500000000000000.0, -2500000000000000.0) < -1500000000000000.0).assertTrue();
      expect(nativeAdd(-1500000000000000.0, -2500000000000000.0))
        .assertEqual(-1500000000000000.0 + -2500000000000000.0);
      {
      const sum: number = nativeAdd(123456789012345.0, 987654321098765.0);
      logCase('testNativeBoundary0035', `sum=${sum}`);
      expect(sum).assertEqual(1111111110111110.0);
      expect(nativeAdd(987654321098765.0, 123456789012345.0)).assertEqual(1111111110111110.0);
      expect(nativeAdd(1111111110111110.0, -(987654321098765.0))).assertEqual(123456789012345.0);
      expect(nativeAdd(1111111110111110.0, -(123456789012345.0))).assertEqual(987654321098765.0);
      expect(nativeAdd(1111111110111110.0, -(1111111110111110.0))).assertEqual(0);
      expect(nativeAdd(123456789012345.0, 987654321098765.0) > 123456789012345.0).assertTrue();
      expect(nativeAdd(123456789012345.0, 987654321098765.0)).assertEqual(123456789012345.0 + 987654321098765.0);
      }
      {
      const sum: number = nativeAdd(1000000000000000.0, 1.0);
      logCase('testNativeBoundary0036', `sum=${sum}`);
      expect(sum).assertEqual(1000000000000001.0);
      expect(nativeAdd(1.0, 1000000000000000.0)).assertEqual(1000000000000001.0);
      expect(nativeAdd(1000000000000001.0, -(1.0))).assertEqual(1000000000000000.0);
      expect(nativeAdd(1000000000000001.0, -(1000000000000000.0))).assertEqual(1.0);
      expect(nativeAdd(1000000000000001.0, -(1000000000000001.0))).assertEqual(0);
      expect(nativeAdd(1000000000000000.0, 1.0) > 1000000000000000.0).assertTrue();
      expect(nativeAdd(1000000000000000.0, 1.0)).assertEqual(1000000000000000.0 + 1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0037
     * @tc.name      testNativeBoundary0037
     * @tc.desc      Add boundary values 1000000000000000.0 and -1.0 and expect 999999999999999.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1000000000000000.0, -1.0);
      logCase('testNativeBoundary0037', `sum=${sum}`);
      expect(sum).assertEqual(999999999999999.0);
      expect(nativeAdd(-1.0, 1000000000000000.0)).assertEqual(999999999999999.0);
      expect(nativeAdd(999999999999999.0, -(-1.0))).assertEqual(1000000000000000.0);
      expect(nativeAdd(999999999999999.0, -(1000000000000000.0))).assertEqual(-1.0);
      expect(nativeAdd(999999999999999.0, -(999999999999999.0))).assertEqual(0);
      expect(nativeAdd(1000000000000000.0, -1.0)).assertEqual(1000000000000000.0 + -1.0);
      {
      const sum: number = nativeAdd(1e+16, 1.0);
      logCase('testNativeBoundary0038', `sum=${sum}`);
      expect(sum).assertEqual(1e+16);
      expect(nativeAdd(1.0, 1e+16)).assertEqual(1e+16);
      expect(nativeAdd(1e+16, -(1.0))).assertEqual(1e+16);
      expect(nativeAdd(1e+16, -(1e+16))).assertEqual(0);
      expect(nativeAdd(1e+16, 1.0)).assertEqual(1e+16 + 1.0);
      }
      {
      const sum: number = nativeAdd(1e+16, -1.0);
      logCase('testNativeBoundary0039', `sum=${sum}`);
      expect(sum).assertEqual(1e+16);
      expect(nativeAdd(-1.0, 1e+16)).assertEqual(1e+16);
      expect(nativeAdd(1e+16, -(-1.0))).assertEqual(1e+16);
      expect(nativeAdd(1e+16, -(1e+16))).assertEqual(0);
      expect(nativeAdd(1e+16, -1.0)).assertEqual(1e+16 + -1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0040
     * @tc.name      testNativeBoundary0040
     * @tc.desc      Add boundary values 1e+17 and 1.0 and expect 1e+17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1e+17, 1.0);
      logCase('testNativeBoundary0040', `sum=${sum}`);
      expect(sum).assertEqual(1e+17);
      expect(nativeAdd(1.0, 1e+17)).assertEqual(1e+17);
      expect(nativeAdd(1e+17, -(1.0))).assertEqual(1e+17);
      expect(nativeAdd(1e+17, -(1e+17))).assertEqual(0);
      expect(nativeAdd(1e+17, 1.0)).assertEqual(1e+17 + 1.0);
      {
      const sum: number = nativeAdd(0.5, 9007199254740991.0);
      logCase('testNativeBoundary0041', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740992.0);
      expect(nativeAdd(9007199254740991.0, 0.5)).assertEqual(9007199254740992.0);
      expect(nativeAdd(9007199254740992.0, -(9007199254740992.0))).assertEqual(0);
      expect(nativeAdd(0.5, 9007199254740991.0) > 0.5).assertTrue();
      expect(nativeAdd(0.5, 9007199254740991.0)).assertEqual(0.5 + 9007199254740991.0);
      }
      {
      const sum: number = nativeAdd(-0.5, 9007199254740991.0);
      logCase('testNativeBoundary0042', `sum=${sum}`);
      expect(sum).assertEqual(9007199254740990.0);
      expect(nativeAdd(9007199254740991.0, -0.5)).assertEqual(9007199254740990.0);
      expect(nativeAdd(9007199254740990.0, -(9007199254740990.0))).assertEqual(0);
      expect(nativeAdd(-0.5, 9007199254740991.0)).assertEqual(-0.5 + 9007199254740991.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0043
     * @tc.name      testNativeBoundary0043
     * @tc.desc      Add boundary values 1e-10 and 10000000000.0 and expect 10000000000.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBoundary0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1e-10, 10000000000.0);
      logCase('testNativeBoundary0043', `sum=${sum}`);
      expect(sum).assertEqual(10000000000.0);
      expect(nativeAdd(10000000000.0, 1e-10)).assertEqual(10000000000.0);
      expect(nativeAdd(10000000000.0, -(1e-10))).assertEqual(10000000000.0);
      expect(nativeAdd(10000000000.0, -(10000000000.0))).assertEqual(0);
      expect(nativeAdd(1e-10, 10000000000.0)).assertEqual(1e-10 + 10000000000.0);
      {
      const sum: number = nativeAdd(-1e-10, -10000000000.0);
      logCase('testNativeBoundary0044', `sum=${sum}`);
      expect(sum).assertEqual(-10000000000.0);
      expect(nativeAdd(-10000000000.0, -1e-10)).assertEqual(-10000000000.0);
      expect(nativeAdd(-10000000000.0, -(-1e-10))).assertEqual(-10000000000.0);
      expect(nativeAdd(-10000000000.0, -(-10000000000.0))).assertEqual(0);
      expect(nativeAdd(-1e-10, -10000000000.0)).assertEqual(-1e-10 + -10000000000.0);
      }
      {
      const sum: number = nativeAdd(3.0, -3.0);
      logCase('testNativeBoundary0045', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(-3.0, 3.0)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(-3.0))).assertEqual(3.0);
      expect(nativeAdd(0.0, -(3.0))).assertEqual(-3.0);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(3.0, -3.0)).assertEqual(3.0 + -3.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0046
     * @tc.name      testNativeBoundary0046
     * @tc.desc      Add boundary values 7.5 and -7.5 and expect 0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(7.5, -7.5);
      logCase('testNativeBoundary0046', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(-7.5, 7.5)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(-7.5))).assertEqual(7.5);
      expect(nativeAdd(0.0, -(7.5))).assertEqual(-7.5);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(7.5, -7.5)).assertEqual(7.5 + -7.5);
      {
      const sum: number = nativeAdd(1e+100, 1e+100);
      logCase('testNativeBoundary0047', `sum=${sum}`);
      expect(sum).assertEqual(2e+100);
      expect(nativeAdd(1e+100, 1e+100)).assertEqual(2e+100);
      expect(nativeAdd(2e+100, -(1e+100))).assertEqual(1e+100);
      expect(nativeAdd(2e+100, -(1e+100))).assertEqual(1e+100);
      expect(nativeAdd(2e+100, -(2e+100))).assertEqual(0);
      expect(nativeAdd(1e+100, 1e+100) > 1e+100).assertTrue();
      expect(nativeAdd(1e+100, 1e+100)).assertEqual(1e+100 + 1e+100);
      }
      {
      const sum: number = nativeAdd(-1e+100, -1e+100);
      logCase('testNativeBoundary0048', `sum=${sum}`);
      expect(sum).assertEqual(-2e+100);
      expect(nativeAdd(-1e+100, -1e+100)).assertEqual(-2e+100);
      expect(nativeAdd(-2e+100, -(-1e+100))).assertEqual(-1e+100);
      expect(nativeAdd(-2e+100, -(-1e+100))).assertEqual(-1e+100);
      expect(nativeAdd(-2e+100, -(-2e+100))).assertEqual(0);
      expect(nativeAdd(-1e+100, -1e+100) < -1e+100).assertTrue();
      expect(nativeAdd(-1e+100, -1e+100)).assertEqual(-1e+100 + -1e+100);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0049
     * @tc.name      testNativeBoundary0049
     * @tc.desc      Add boundary values 1e+100 and -1e+100 and expect 0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(1e+100, -1e+100);
      logCase('testNativeBoundary0049', `sum=${sum}`);
      expect(sum).assertEqual(0.0);
      expect(nativeAdd(-1e+100, 1e+100)).assertEqual(0.0);
      expect(nativeAdd(0.0, -(-1e+100))).assertEqual(1e+100);
      expect(nativeAdd(0.0, -(1e+100))).assertEqual(-1e+100);
      expect(nativeAdd(0.0, -(0.0))).assertEqual(0);
      expect(nativeAdd(1e+100, -1e+100)).assertEqual(1e+100 + -1e+100);
      {
      const sum: number = nativeAdd(999999999999999.0, 1.0);
      logCase('testNativeBoundary0050', `sum=${sum}`);
      expect(sum).assertEqual(1000000000000000.0);
      expect(nativeAdd(1.0, 999999999999999.0)).assertEqual(1000000000000000.0);
      expect(nativeAdd(1000000000000000.0, -(1.0))).assertEqual(999999999999999.0);
      expect(nativeAdd(1000000000000000.0, -(999999999999999.0))).assertEqual(1.0);
      expect(nativeAdd(1000000000000000.0, -(1000000000000000.0))).assertEqual(0);
      expect(nativeAdd(999999999999999.0, 1.0) > 999999999999999.0).assertTrue();
      expect(nativeAdd(999999999999999.0, 1.0)).assertEqual(999999999999999.0 + 1.0);
      }
      {
      const sum: number = nativeAdd(999999999999999.0, 2.0);
      logCase('testNativeBoundary0051', `sum=${sum}`);
      expect(sum).assertEqual(1000000000000001.0);
      expect(nativeAdd(2.0, 999999999999999.0)).assertEqual(1000000000000001.0);
      expect(nativeAdd(1000000000000001.0, -(2.0))).assertEqual(999999999999999.0);
      expect(nativeAdd(1000000000000001.0, -(999999999999999.0))).assertEqual(2.0);
      expect(nativeAdd(1000000000000001.0, -(1000000000000001.0))).assertEqual(0);
      expect(nativeAdd(999999999999999.0, 2.0) > 999999999999999.0).assertTrue();
      expect(nativeAdd(999999999999999.0, 2.0)).assertEqual(999999999999999.0 + 2.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0052
     * @tc.name      testNativeBoundary0052
     * @tc.desc      Add boundary values 999999999999999.0 and 3.0 and expect 1000000000000002.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(999999999999999.0, 3.0);
      logCase('testNativeBoundary0052', `sum=${sum}`);
      expect(sum).assertEqual(1000000000000002.0);
      expect(nativeAdd(3.0, 999999999999999.0)).assertEqual(1000000000000002.0);
      expect(nativeAdd(1000000000000002.0, -(3.0))).assertEqual(999999999999999.0);
      expect(nativeAdd(1000000000000002.0, -(999999999999999.0))).assertEqual(3.0);
      expect(nativeAdd(1000000000000002.0, -(1000000000000002.0))).assertEqual(0);
      expect(nativeAdd(999999999999999.0, 3.0) > 999999999999999.0).assertTrue();
      expect(nativeAdd(999999999999999.0, 3.0)).assertEqual(999999999999999.0 + 3.0);
      {
      const sum: number = nativeAdd(-999999999999999.0, -1.0);
      logCase('testNativeBoundary0053', `sum=${sum}`);
      expect(sum).assertEqual(-1000000000000000.0);
      expect(nativeAdd(-1.0, -999999999999999.0)).assertEqual(-1000000000000000.0);
      expect(nativeAdd(-1000000000000000.0, -(-1.0))).assertEqual(-999999999999999.0);
      expect(nativeAdd(-1000000000000000.0, -(-999999999999999.0))).assertEqual(-1.0);
      expect(nativeAdd(-1000000000000000.0, -(-1000000000000000.0))).assertEqual(0);
      expect(nativeAdd(-999999999999999.0, -1.0) < -999999999999999.0).assertTrue();
      expect(nativeAdd(-999999999999999.0, -1.0)).assertEqual(-999999999999999.0 + -1.0);
      }
      {
      const sum: number = nativeAdd(-999999999999999.0, -2.0);
      logCase('testNativeBoundary0054', `sum=${sum}`);
      expect(sum).assertEqual(-1000000000000001.0);
      expect(nativeAdd(-2.0, -999999999999999.0)).assertEqual(-1000000000000001.0);
      expect(nativeAdd(-1000000000000001.0, -(-2.0))).assertEqual(-999999999999999.0);
      expect(nativeAdd(-1000000000000001.0, -(-999999999999999.0))).assertEqual(-2.0);
      expect(nativeAdd(-1000000000000001.0, -(-1000000000000001.0))).assertEqual(0);
      expect(nativeAdd(-999999999999999.0, -2.0) < -999999999999999.0).assertTrue();
      expect(nativeAdd(-999999999999999.0, -2.0)).assertEqual(-999999999999999.0 + -2.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0055
     * @tc.name      testNativeBoundary0055
     * @tc.desc      Add boundary values 2251799813685248.0 and 0.5 and expect 2251799813685248.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685248.0, 0.5);
      logCase('testNativeBoundary0055', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685248.5);
      expect(nativeAdd(0.5, 2251799813685248.0)).assertEqual(2251799813685248.5);
      expect(nativeAdd(2251799813685248.5, -(0.5))).assertEqual(2251799813685248.0);
      expect(nativeAdd(2251799813685248.5, -(2251799813685248.0))).assertEqual(0.5);
      expect(nativeAdd(2251799813685248.5, -(2251799813685248.5))).assertEqual(0);
      expect(nativeAdd(2251799813685248.0, 0.5) > 2251799813685248.0).assertTrue();
      expect(nativeAdd(2251799813685248.0, 0.5)).assertEqual(2251799813685248.0 + 0.5);
      {
      const sum: number = nativeAdd(2251799813685246.5, 0.75);
      logCase('testNativeBoundary0056', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685247.2);
      expect(nativeAdd(0.75, 2251799813685246.5)).assertEqual(2251799813685247.2);
      expect(nativeAdd(2251799813685247.2, -(0.75))).assertEqual(2251799813685246.5);
      expect(nativeAdd(2251799813685247.2, -(2251799813685246.5))).assertEqual(0.75);
      expect(nativeAdd(2251799813685247.2, -(2251799813685247.2))).assertEqual(0);
      expect(nativeAdd(2251799813685246.5, 0.75) > 2251799813685246.5).assertTrue();
      expect(nativeAdd(2251799813685246.5, 0.75)).assertEqual(2251799813685246.5 + 0.75);
      }
      {
      const sum: number = nativeAdd(2251799813685245.0, 1.0);
      logCase('testNativeBoundary0057', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685246.0);
      expect(nativeAdd(1.0, 2251799813685245.0)).assertEqual(2251799813685246.0);
      expect(nativeAdd(2251799813685246.0, -(1.0))).assertEqual(2251799813685245.0);
      expect(nativeAdd(2251799813685246.0, -(2251799813685245.0))).assertEqual(1.0);
      expect(nativeAdd(2251799813685246.0, -(2251799813685246.0))).assertEqual(0);
      expect(nativeAdd(2251799813685245.0, 1.0) > 2251799813685245.0).assertTrue();
      expect(nativeAdd(2251799813685245.0, 1.0)).assertEqual(2251799813685245.0 + 1.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0058
     * @tc.name      testNativeBoundary0058
     * @tc.desc      Add boundary values 2251799813685243.5 and 1.25 and expect 2251799813685244.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685243.5, 1.25);
      logCase('testNativeBoundary0058', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685244.8);
      expect(nativeAdd(1.25, 2251799813685243.5)).assertEqual(2251799813685244.8);
      expect(nativeAdd(2251799813685244.8, -(1.25))).assertEqual(2251799813685243.5);
      expect(nativeAdd(2251799813685244.8, -(2251799813685243.5))).assertEqual(1.25);
      expect(nativeAdd(2251799813685244.8, -(2251799813685244.8))).assertEqual(0);
      expect(nativeAdd(2251799813685243.5, 1.25) > 2251799813685243.5).assertTrue();
      expect(nativeAdd(2251799813685243.5, 1.25)).assertEqual(2251799813685243.5 + 1.25);
      {
      const sum: number = nativeAdd(2251799813685242.0, 1.5);
      logCase('testNativeBoundary0059', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685243.5);
      expect(nativeAdd(1.5, 2251799813685242.0)).assertEqual(2251799813685243.5);
      expect(nativeAdd(2251799813685243.5, -(1.5))).assertEqual(2251799813685242.0);
      expect(nativeAdd(2251799813685243.5, -(2251799813685242.0))).assertEqual(1.5);
      expect(nativeAdd(2251799813685243.5, -(2251799813685243.5))).assertEqual(0);
      expect(nativeAdd(2251799813685242.0, 1.5) > 2251799813685242.0).assertTrue();
      expect(nativeAdd(2251799813685242.0, 1.5)).assertEqual(2251799813685242.0 + 1.5);
      }
      {
      const sum: number = nativeAdd(2251799813685240.5, 1.75);
      logCase('testNativeBoundary0060', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685242.2);
      expect(nativeAdd(1.75, 2251799813685240.5)).assertEqual(2251799813685242.2);
      expect(nativeAdd(2251799813685242.2, -(1.75))).assertEqual(2251799813685240.5);
      expect(nativeAdd(2251799813685242.2, -(2251799813685240.5))).assertEqual(1.75);
      expect(nativeAdd(2251799813685242.2, -(2251799813685242.2))).assertEqual(0);
      expect(nativeAdd(2251799813685240.5, 1.75) > 2251799813685240.5).assertTrue();
      expect(nativeAdd(2251799813685240.5, 1.75)).assertEqual(2251799813685240.5 + 1.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0061
     * @tc.name      testNativeBoundary0061
     * @tc.desc      Add boundary values 2251799813685239.0 and 2.0 and expect 2251799813685241.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685239.0, 2.0);
      logCase('testNativeBoundary0061', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685241.0);
      expect(nativeAdd(2.0, 2251799813685239.0)).assertEqual(2251799813685241.0);
      expect(nativeAdd(2251799813685241.0, -(2.0))).assertEqual(2251799813685239.0);
      expect(nativeAdd(2251799813685241.0, -(2251799813685239.0))).assertEqual(2.0);
      expect(nativeAdd(2251799813685241.0, -(2251799813685241.0))).assertEqual(0);
      expect(nativeAdd(2251799813685239.0, 2.0) > 2251799813685239.0).assertTrue();
      expect(nativeAdd(2251799813685239.0, 2.0)).assertEqual(2251799813685239.0 + 2.0);
      {
      const sum: number = nativeAdd(2251799813685237.5, 2.25);
      logCase('testNativeBoundary0062', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685239.8);
      expect(nativeAdd(2.25, 2251799813685237.5)).assertEqual(2251799813685239.8);
      expect(nativeAdd(2251799813685239.8, -(2.25))).assertEqual(2251799813685237.5);
      expect(nativeAdd(2251799813685239.8, -(2251799813685237.5))).assertEqual(2.25);
      expect(nativeAdd(2251799813685239.8, -(2251799813685239.8))).assertEqual(0);
      expect(nativeAdd(2251799813685237.5, 2.25) > 2251799813685237.5).assertTrue();
      expect(nativeAdd(2251799813685237.5, 2.25)).assertEqual(2251799813685237.5 + 2.25);
      }
      {
      const sum: number = nativeAdd(2251799813685236.0, 2.5);
      logCase('testNativeBoundary0063', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685238.5);
      expect(nativeAdd(2.5, 2251799813685236.0)).assertEqual(2251799813685238.5);
      expect(nativeAdd(2251799813685238.5, -(2.5))).assertEqual(2251799813685236.0);
      expect(nativeAdd(2251799813685238.5, -(2251799813685236.0))).assertEqual(2.5);
      expect(nativeAdd(2251799813685238.5, -(2251799813685238.5))).assertEqual(0);
      expect(nativeAdd(2251799813685236.0, 2.5) > 2251799813685236.0).assertTrue();
      expect(nativeAdd(2251799813685236.0, 2.5)).assertEqual(2251799813685236.0 + 2.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0064
     * @tc.name      testNativeBoundary0064
     * @tc.desc      Add boundary values 2251799813685234.5 and 2.75 and expect 2251799813685237.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685234.5, 2.75);
      logCase('testNativeBoundary0064', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685237.2);
      expect(nativeAdd(2.75, 2251799813685234.5)).assertEqual(2251799813685237.2);
      expect(nativeAdd(2251799813685237.2, -(2.75))).assertEqual(2251799813685234.5);
      expect(nativeAdd(2251799813685237.2, -(2251799813685234.5))).assertEqual(2.75);
      expect(nativeAdd(2251799813685237.2, -(2251799813685237.2))).assertEqual(0);
      expect(nativeAdd(2251799813685234.5, 2.75) > 2251799813685234.5).assertTrue();
      expect(nativeAdd(2251799813685234.5, 2.75)).assertEqual(2251799813685234.5 + 2.75);
      {
      const sum: number = nativeAdd(2251799813685233.0, 3.0);
      logCase('testNativeBoundary0065', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685236.0);
      expect(nativeAdd(3.0, 2251799813685233.0)).assertEqual(2251799813685236.0);
      expect(nativeAdd(2251799813685236.0, -(3.0))).assertEqual(2251799813685233.0);
      expect(nativeAdd(2251799813685236.0, -(2251799813685233.0))).assertEqual(3.0);
      expect(nativeAdd(2251799813685236.0, -(2251799813685236.0))).assertEqual(0);
      expect(nativeAdd(2251799813685233.0, 3.0) > 2251799813685233.0).assertTrue();
      expect(nativeAdd(2251799813685233.0, 3.0)).assertEqual(2251799813685233.0 + 3.0);
      }
      {
      const sum: number = nativeAdd(2251799813685231.5, 3.25);
      logCase('testNativeBoundary0066', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685234.8);
      expect(nativeAdd(3.25, 2251799813685231.5)).assertEqual(2251799813685234.8);
      expect(nativeAdd(2251799813685234.8, -(3.25))).assertEqual(2251799813685231.5);
      expect(nativeAdd(2251799813685234.8, -(2251799813685231.5))).assertEqual(3.25);
      expect(nativeAdd(2251799813685234.8, -(2251799813685234.8))).assertEqual(0);
      expect(nativeAdd(2251799813685231.5, 3.25) > 2251799813685231.5).assertTrue();
      expect(nativeAdd(2251799813685231.5, 3.25)).assertEqual(2251799813685231.5 + 3.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0067
     * @tc.name      testNativeBoundary0067
     * @tc.desc      Add boundary values 2251799813685230.0 and 3.5 and expect 2251799813685233.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685230.0, 3.5);
      logCase('testNativeBoundary0067', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685233.5);
      expect(nativeAdd(3.5, 2251799813685230.0)).assertEqual(2251799813685233.5);
      expect(nativeAdd(2251799813685233.5, -(3.5))).assertEqual(2251799813685230.0);
      expect(nativeAdd(2251799813685233.5, -(2251799813685230.0))).assertEqual(3.5);
      expect(nativeAdd(2251799813685233.5, -(2251799813685233.5))).assertEqual(0);
      expect(nativeAdd(2251799813685230.0, 3.5) > 2251799813685230.0).assertTrue();
      expect(nativeAdd(2251799813685230.0, 3.5)).assertEqual(2251799813685230.0 + 3.5);
      {
      const sum: number = nativeAdd(2251799813685228.5, 3.75);
      logCase('testNativeBoundary0068', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685232.2);
      expect(nativeAdd(3.75, 2251799813685228.5)).assertEqual(2251799813685232.2);
      expect(nativeAdd(2251799813685232.2, -(3.75))).assertEqual(2251799813685228.5);
      expect(nativeAdd(2251799813685232.2, -(2251799813685228.5))).assertEqual(3.75);
      expect(nativeAdd(2251799813685232.2, -(2251799813685232.2))).assertEqual(0);
      expect(nativeAdd(2251799813685228.5, 3.75) > 2251799813685228.5).assertTrue();
      expect(nativeAdd(2251799813685228.5, 3.75)).assertEqual(2251799813685228.5 + 3.75);
      }
      {
      const sum: number = nativeAdd(2251799813685227.0, 4.0);
      logCase('testNativeBoundary0069', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685231.0);
      expect(nativeAdd(4.0, 2251799813685227.0)).assertEqual(2251799813685231.0);
      expect(nativeAdd(2251799813685231.0, -(4.0))).assertEqual(2251799813685227.0);
      expect(nativeAdd(2251799813685231.0, -(2251799813685227.0))).assertEqual(4.0);
      expect(nativeAdd(2251799813685231.0, -(2251799813685231.0))).assertEqual(0);
      expect(nativeAdd(2251799813685227.0, 4.0) > 2251799813685227.0).assertTrue();
      expect(nativeAdd(2251799813685227.0, 4.0)).assertEqual(2251799813685227.0 + 4.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0070
     * @tc.name      testNativeBoundary0070
     * @tc.desc      Add boundary values 2251799813685225.5 and 4.25 and expect 2251799813685229.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685225.5, 4.25);
      logCase('testNativeBoundary0070', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685229.8);
      expect(nativeAdd(4.25, 2251799813685225.5)).assertEqual(2251799813685229.8);
      expect(nativeAdd(2251799813685229.8, -(4.25))).assertEqual(2251799813685225.5);
      expect(nativeAdd(2251799813685229.8, -(2251799813685225.5))).assertEqual(4.25);
      expect(nativeAdd(2251799813685229.8, -(2251799813685229.8))).assertEqual(0);
      expect(nativeAdd(2251799813685225.5, 4.25) > 2251799813685225.5).assertTrue();
      expect(nativeAdd(2251799813685225.5, 4.25)).assertEqual(2251799813685225.5 + 4.25);
      {
      const sum: number = nativeAdd(2251799813685224.0, 4.5);
      logCase('testNativeBoundary0071', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685228.5);
      expect(nativeAdd(4.5, 2251799813685224.0)).assertEqual(2251799813685228.5);
      expect(nativeAdd(2251799813685228.5, -(4.5))).assertEqual(2251799813685224.0);
      expect(nativeAdd(2251799813685228.5, -(2251799813685224.0))).assertEqual(4.5);
      expect(nativeAdd(2251799813685228.5, -(2251799813685228.5))).assertEqual(0);
      expect(nativeAdd(2251799813685224.0, 4.5) > 2251799813685224.0).assertTrue();
      expect(nativeAdd(2251799813685224.0, 4.5)).assertEqual(2251799813685224.0 + 4.5);
      }
      {
      const sum: number = nativeAdd(2251799813685222.5, 4.75);
      logCase('testNativeBoundary0072', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685227.2);
      expect(nativeAdd(4.75, 2251799813685222.5)).assertEqual(2251799813685227.2);
      expect(nativeAdd(2251799813685227.2, -(4.75))).assertEqual(2251799813685222.5);
      expect(nativeAdd(2251799813685227.2, -(2251799813685222.5))).assertEqual(4.75);
      expect(nativeAdd(2251799813685227.2, -(2251799813685227.2))).assertEqual(0);
      expect(nativeAdd(2251799813685222.5, 4.75) > 2251799813685222.5).assertTrue();
      expect(nativeAdd(2251799813685222.5, 4.75)).assertEqual(2251799813685222.5 + 4.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0073
     * @tc.name      testNativeBoundary0073
     * @tc.desc      Add boundary values 2251799813685221.0 and 5.0 and expect 2251799813685226.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685221.0, 5.0);
      logCase('testNativeBoundary0073', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685226.0);
      expect(nativeAdd(5.0, 2251799813685221.0)).assertEqual(2251799813685226.0);
      expect(nativeAdd(2251799813685226.0, -(5.0))).assertEqual(2251799813685221.0);
      expect(nativeAdd(2251799813685226.0, -(2251799813685221.0))).assertEqual(5.0);
      expect(nativeAdd(2251799813685226.0, -(2251799813685226.0))).assertEqual(0);
      expect(nativeAdd(2251799813685221.0, 5.0) > 2251799813685221.0).assertTrue();
      expect(nativeAdd(2251799813685221.0, 5.0)).assertEqual(2251799813685221.0 + 5.0);
      {
      const sum: number = nativeAdd(2251799813685219.5, 5.25);
      logCase('testNativeBoundary0074', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685224.8);
      expect(nativeAdd(5.25, 2251799813685219.5)).assertEqual(2251799813685224.8);
      expect(nativeAdd(2251799813685224.8, -(5.25))).assertEqual(2251799813685219.5);
      expect(nativeAdd(2251799813685224.8, -(2251799813685219.5))).assertEqual(5.25);
      expect(nativeAdd(2251799813685224.8, -(2251799813685224.8))).assertEqual(0);
      expect(nativeAdd(2251799813685219.5, 5.25) > 2251799813685219.5).assertTrue();
      expect(nativeAdd(2251799813685219.5, 5.25)).assertEqual(2251799813685219.5 + 5.25);
      }
      {
      const sum: number = nativeAdd(2251799813685218.0, 5.5);
      logCase('testNativeBoundary0075', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685223.5);
      expect(nativeAdd(5.5, 2251799813685218.0)).assertEqual(2251799813685223.5);
      expect(nativeAdd(2251799813685223.5, -(5.5))).assertEqual(2251799813685218.0);
      expect(nativeAdd(2251799813685223.5, -(2251799813685218.0))).assertEqual(5.5);
      expect(nativeAdd(2251799813685223.5, -(2251799813685223.5))).assertEqual(0);
      expect(nativeAdd(2251799813685218.0, 5.5) > 2251799813685218.0).assertTrue();
      expect(nativeAdd(2251799813685218.0, 5.5)).assertEqual(2251799813685218.0 + 5.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0076
     * @tc.name      testNativeBoundary0076
     * @tc.desc      Add boundary values 2251799813685216.5 and 5.75 and expect 2251799813685222.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685216.5, 5.75);
      logCase('testNativeBoundary0076', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685222.2);
      expect(nativeAdd(5.75, 2251799813685216.5)).assertEqual(2251799813685222.2);
      expect(nativeAdd(2251799813685222.2, -(5.75))).assertEqual(2251799813685216.5);
      expect(nativeAdd(2251799813685222.2, -(2251799813685216.5))).assertEqual(5.75);
      expect(nativeAdd(2251799813685222.2, -(2251799813685222.2))).assertEqual(0);
      expect(nativeAdd(2251799813685216.5, 5.75) > 2251799813685216.5).assertTrue();
      expect(nativeAdd(2251799813685216.5, 5.75)).assertEqual(2251799813685216.5 + 5.75);
      {
      const sum: number = nativeAdd(2251799813685215.0, 6.0);
      logCase('testNativeBoundary0077', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685221.0);
      expect(nativeAdd(6.0, 2251799813685215.0)).assertEqual(2251799813685221.0);
      expect(nativeAdd(2251799813685221.0, -(6.0))).assertEqual(2251799813685215.0);
      expect(nativeAdd(2251799813685221.0, -(2251799813685215.0))).assertEqual(6.0);
      expect(nativeAdd(2251799813685221.0, -(2251799813685221.0))).assertEqual(0);
      expect(nativeAdd(2251799813685215.0, 6.0) > 2251799813685215.0).assertTrue();
      expect(nativeAdd(2251799813685215.0, 6.0)).assertEqual(2251799813685215.0 + 6.0);
      }
      {
      const sum: number = nativeAdd(2251799813685213.5, 6.25);
      logCase('testNativeBoundary0078', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685219.8);
      expect(nativeAdd(6.25, 2251799813685213.5)).assertEqual(2251799813685219.8);
      expect(nativeAdd(2251799813685219.8, -(6.25))).assertEqual(2251799813685213.5);
      expect(nativeAdd(2251799813685219.8, -(2251799813685213.5))).assertEqual(6.25);
      expect(nativeAdd(2251799813685219.8, -(2251799813685219.8))).assertEqual(0);
      expect(nativeAdd(2251799813685213.5, 6.25) > 2251799813685213.5).assertTrue();
      expect(nativeAdd(2251799813685213.5, 6.25)).assertEqual(2251799813685213.5 + 6.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0079
     * @tc.name      testNativeBoundary0079
     * @tc.desc      Add boundary values 2251799813685212.0 and 6.5 and expect 2251799813685218.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685212.0, 6.5);
      logCase('testNativeBoundary0079', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685218.5);
      expect(nativeAdd(6.5, 2251799813685212.0)).assertEqual(2251799813685218.5);
      expect(nativeAdd(2251799813685218.5, -(6.5))).assertEqual(2251799813685212.0);
      expect(nativeAdd(2251799813685218.5, -(2251799813685212.0))).assertEqual(6.5);
      expect(nativeAdd(2251799813685218.5, -(2251799813685218.5))).assertEqual(0);
      expect(nativeAdd(2251799813685212.0, 6.5) > 2251799813685212.0).assertTrue();
      expect(nativeAdd(2251799813685212.0, 6.5)).assertEqual(2251799813685212.0 + 6.5);
      {
      const sum: number = nativeAdd(2251799813685210.5, 6.75);
      logCase('testNativeBoundary0080', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685217.2);
      expect(nativeAdd(6.75, 2251799813685210.5)).assertEqual(2251799813685217.2);
      expect(nativeAdd(2251799813685217.2, -(6.75))).assertEqual(2251799813685210.5);
      expect(nativeAdd(2251799813685217.2, -(2251799813685210.5))).assertEqual(6.75);
      expect(nativeAdd(2251799813685217.2, -(2251799813685217.2))).assertEqual(0);
      expect(nativeAdd(2251799813685210.5, 6.75) > 2251799813685210.5).assertTrue();
      expect(nativeAdd(2251799813685210.5, 6.75)).assertEqual(2251799813685210.5 + 6.75);
      }
      {
      const sum: number = nativeAdd(2251799813685209.0, 7.0);
      logCase('testNativeBoundary0081', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685216.0);
      expect(nativeAdd(7.0, 2251799813685209.0)).assertEqual(2251799813685216.0);
      expect(nativeAdd(2251799813685216.0, -(7.0))).assertEqual(2251799813685209.0);
      expect(nativeAdd(2251799813685216.0, -(2251799813685209.0))).assertEqual(7.0);
      expect(nativeAdd(2251799813685216.0, -(2251799813685216.0))).assertEqual(0);
      expect(nativeAdd(2251799813685209.0, 7.0) > 2251799813685209.0).assertTrue();
      expect(nativeAdd(2251799813685209.0, 7.0)).assertEqual(2251799813685209.0 + 7.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0082
     * @tc.name      testNativeBoundary0082
     * @tc.desc      Add boundary values 2251799813685207.5 and 7.25 and expect 2251799813685214.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685207.5, 7.25);
      logCase('testNativeBoundary0082', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685214.8);
      expect(nativeAdd(7.25, 2251799813685207.5)).assertEqual(2251799813685214.8);
      expect(nativeAdd(2251799813685214.8, -(7.25))).assertEqual(2251799813685207.5);
      expect(nativeAdd(2251799813685214.8, -(2251799813685207.5))).assertEqual(7.25);
      expect(nativeAdd(2251799813685214.8, -(2251799813685214.8))).assertEqual(0);
      expect(nativeAdd(2251799813685207.5, 7.25) > 2251799813685207.5).assertTrue();
      expect(nativeAdd(2251799813685207.5, 7.25)).assertEqual(2251799813685207.5 + 7.25);
      {
      const sum: number = nativeAdd(2251799813685206.0, 7.5);
      logCase('testNativeBoundary0083', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685213.5);
      expect(nativeAdd(7.5, 2251799813685206.0)).assertEqual(2251799813685213.5);
      expect(nativeAdd(2251799813685213.5, -(7.5))).assertEqual(2251799813685206.0);
      expect(nativeAdd(2251799813685213.5, -(2251799813685206.0))).assertEqual(7.5);
      expect(nativeAdd(2251799813685213.5, -(2251799813685213.5))).assertEqual(0);
      expect(nativeAdd(2251799813685206.0, 7.5) > 2251799813685206.0).assertTrue();
      expect(nativeAdd(2251799813685206.0, 7.5)).assertEqual(2251799813685206.0 + 7.5);
      }
      {
      const sum: number = nativeAdd(2251799813685204.5, 7.75);
      logCase('testNativeBoundary0084', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685212.2);
      expect(nativeAdd(7.75, 2251799813685204.5)).assertEqual(2251799813685212.2);
      expect(nativeAdd(2251799813685212.2, -(7.75))).assertEqual(2251799813685204.5);
      expect(nativeAdd(2251799813685212.2, -(2251799813685204.5))).assertEqual(7.75);
      expect(nativeAdd(2251799813685212.2, -(2251799813685212.2))).assertEqual(0);
      expect(nativeAdd(2251799813685204.5, 7.75) > 2251799813685204.5).assertTrue();
      expect(nativeAdd(2251799813685204.5, 7.75)).assertEqual(2251799813685204.5 + 7.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0085
     * @tc.name      testNativeBoundary0085
     * @tc.desc      Add boundary values 2251799813685203.0 and 8.0 and expect 2251799813685211.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685203.0, 8.0);
      logCase('testNativeBoundary0085', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685211.0);
      expect(nativeAdd(8.0, 2251799813685203.0)).assertEqual(2251799813685211.0);
      expect(nativeAdd(2251799813685211.0, -(8.0))).assertEqual(2251799813685203.0);
      expect(nativeAdd(2251799813685211.0, -(2251799813685203.0))).assertEqual(8.0);
      expect(nativeAdd(2251799813685211.0, -(2251799813685211.0))).assertEqual(0);
      expect(nativeAdd(2251799813685203.0, 8.0) > 2251799813685203.0).assertTrue();
      expect(nativeAdd(2251799813685203.0, 8.0)).assertEqual(2251799813685203.0 + 8.0);
      {
      const sum: number = nativeAdd(2251799813685201.5, 8.25);
      logCase('testNativeBoundary0086', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685209.8);
      expect(nativeAdd(8.25, 2251799813685201.5)).assertEqual(2251799813685209.8);
      expect(nativeAdd(2251799813685209.8, -(8.25))).assertEqual(2251799813685201.5);
      expect(nativeAdd(2251799813685209.8, -(2251799813685201.5))).assertEqual(8.25);
      expect(nativeAdd(2251799813685209.8, -(2251799813685209.8))).assertEqual(0);
      expect(nativeAdd(2251799813685201.5, 8.25) > 2251799813685201.5).assertTrue();
      expect(nativeAdd(2251799813685201.5, 8.25)).assertEqual(2251799813685201.5 + 8.25);
      }
      {
      const sum: number = nativeAdd(2251799813685200.0, 8.5);
      logCase('testNativeBoundary0087', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685208.5);
      expect(nativeAdd(8.5, 2251799813685200.0)).assertEqual(2251799813685208.5);
      expect(nativeAdd(2251799813685208.5, -(8.5))).assertEqual(2251799813685200.0);
      expect(nativeAdd(2251799813685208.5, -(2251799813685200.0))).assertEqual(8.5);
      expect(nativeAdd(2251799813685208.5, -(2251799813685208.5))).assertEqual(0);
      expect(nativeAdd(2251799813685200.0, 8.5) > 2251799813685200.0).assertTrue();
      expect(nativeAdd(2251799813685200.0, 8.5)).assertEqual(2251799813685200.0 + 8.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0088
     * @tc.name      testNativeBoundary0088
     * @tc.desc      Add boundary values 2251799813685198.5 and 8.75 and expect 2251799813685207.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685198.5, 8.75);
      logCase('testNativeBoundary0088', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685207.2);
      expect(nativeAdd(8.75, 2251799813685198.5)).assertEqual(2251799813685207.2);
      expect(nativeAdd(2251799813685207.2, -(8.75))).assertEqual(2251799813685198.5);
      expect(nativeAdd(2251799813685207.2, -(2251799813685198.5))).assertEqual(8.75);
      expect(nativeAdd(2251799813685207.2, -(2251799813685207.2))).assertEqual(0);
      expect(nativeAdd(2251799813685198.5, 8.75) > 2251799813685198.5).assertTrue();
      expect(nativeAdd(2251799813685198.5, 8.75)).assertEqual(2251799813685198.5 + 8.75);
      {
      const sum: number = nativeAdd(2251799813685197.0, 9.0);
      logCase('testNativeBoundary0089', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685206.0);
      expect(nativeAdd(9.0, 2251799813685197.0)).assertEqual(2251799813685206.0);
      expect(nativeAdd(2251799813685206.0, -(9.0))).assertEqual(2251799813685197.0);
      expect(nativeAdd(2251799813685206.0, -(2251799813685197.0))).assertEqual(9.0);
      expect(nativeAdd(2251799813685206.0, -(2251799813685206.0))).assertEqual(0);
      expect(nativeAdd(2251799813685197.0, 9.0) > 2251799813685197.0).assertTrue();
      expect(nativeAdd(2251799813685197.0, 9.0)).assertEqual(2251799813685197.0 + 9.0);
      }
      {
      const sum: number = nativeAdd(2251799813685195.5, 9.25);
      logCase('testNativeBoundary0090', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685204.8);
      expect(nativeAdd(9.25, 2251799813685195.5)).assertEqual(2251799813685204.8);
      expect(nativeAdd(2251799813685204.8, -(9.25))).assertEqual(2251799813685195.5);
      expect(nativeAdd(2251799813685204.8, -(2251799813685195.5))).assertEqual(9.25);
      expect(nativeAdd(2251799813685204.8, -(2251799813685204.8))).assertEqual(0);
      expect(nativeAdd(2251799813685195.5, 9.25) > 2251799813685195.5).assertTrue();
      expect(nativeAdd(2251799813685195.5, 9.25)).assertEqual(2251799813685195.5 + 9.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0091
     * @tc.name      testNativeBoundary0091
     * @tc.desc      Add boundary values 2251799813685194.0 and 9.5 and expect 2251799813685203.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685194.0, 9.5);
      logCase('testNativeBoundary0091', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685203.5);
      expect(nativeAdd(9.5, 2251799813685194.0)).assertEqual(2251799813685203.5);
      expect(nativeAdd(2251799813685203.5, -(9.5))).assertEqual(2251799813685194.0);
      expect(nativeAdd(2251799813685203.5, -(2251799813685194.0))).assertEqual(9.5);
      expect(nativeAdd(2251799813685203.5, -(2251799813685203.5))).assertEqual(0);
      expect(nativeAdd(2251799813685194.0, 9.5) > 2251799813685194.0).assertTrue();
      expect(nativeAdd(2251799813685194.0, 9.5)).assertEqual(2251799813685194.0 + 9.5);
      {
      const sum: number = nativeAdd(2251799813685192.5, 9.75);
      logCase('testNativeBoundary0092', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685202.2);
      expect(nativeAdd(9.75, 2251799813685192.5)).assertEqual(2251799813685202.2);
      expect(nativeAdd(2251799813685202.2, -(9.75))).assertEqual(2251799813685192.5);
      expect(nativeAdd(2251799813685202.2, -(2251799813685192.5))).assertEqual(9.75);
      expect(nativeAdd(2251799813685202.2, -(2251799813685202.2))).assertEqual(0);
      expect(nativeAdd(2251799813685192.5, 9.75) > 2251799813685192.5).assertTrue();
      expect(nativeAdd(2251799813685192.5, 9.75)).assertEqual(2251799813685192.5 + 9.75);
      }
      {
      const sum: number = nativeAdd(2251799813685191.0, 10.0);
      logCase('testNativeBoundary0093', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685201.0);
      expect(nativeAdd(10.0, 2251799813685191.0)).assertEqual(2251799813685201.0);
      expect(nativeAdd(2251799813685201.0, -(10.0))).assertEqual(2251799813685191.0);
      expect(nativeAdd(2251799813685201.0, -(2251799813685191.0))).assertEqual(10.0);
      expect(nativeAdd(2251799813685201.0, -(2251799813685201.0))).assertEqual(0);
      expect(nativeAdd(2251799813685191.0, 10.0) > 2251799813685191.0).assertTrue();
      expect(nativeAdd(2251799813685191.0, 10.0)).assertEqual(2251799813685191.0 + 10.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0094
     * @tc.name      testNativeBoundary0094
     * @tc.desc      Add boundary values 2251799813685189.5 and 10.25 and expect 2251799813685199.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685189.5, 10.25);
      logCase('testNativeBoundary0094', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685199.8);
      expect(nativeAdd(10.25, 2251799813685189.5)).assertEqual(2251799813685199.8);
      expect(nativeAdd(2251799813685199.8, -(10.25))).assertEqual(2251799813685189.5);
      expect(nativeAdd(2251799813685199.8, -(2251799813685189.5))).assertEqual(10.25);
      expect(nativeAdd(2251799813685199.8, -(2251799813685199.8))).assertEqual(0);
      expect(nativeAdd(2251799813685189.5, 10.25) > 2251799813685189.5).assertTrue();
      expect(nativeAdd(2251799813685189.5, 10.25)).assertEqual(2251799813685189.5 + 10.25);
      {
      const sum: number = nativeAdd(2251799813685188.0, 10.5);
      logCase('testNativeBoundary0095', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685198.5);
      expect(nativeAdd(10.5, 2251799813685188.0)).assertEqual(2251799813685198.5);
      expect(nativeAdd(2251799813685198.5, -(10.5))).assertEqual(2251799813685188.0);
      expect(nativeAdd(2251799813685198.5, -(2251799813685188.0))).assertEqual(10.5);
      expect(nativeAdd(2251799813685198.5, -(2251799813685198.5))).assertEqual(0);
      expect(nativeAdd(2251799813685188.0, 10.5) > 2251799813685188.0).assertTrue();
      expect(nativeAdd(2251799813685188.0, 10.5)).assertEqual(2251799813685188.0 + 10.5);
      }
      {
      const sum: number = nativeAdd(2251799813685186.5, 10.75);
      logCase('testNativeBoundary0096', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685197.2);
      expect(nativeAdd(10.75, 2251799813685186.5)).assertEqual(2251799813685197.2);
      expect(nativeAdd(2251799813685197.2, -(10.75))).assertEqual(2251799813685186.5);
      expect(nativeAdd(2251799813685197.2, -(2251799813685186.5))).assertEqual(10.75);
      expect(nativeAdd(2251799813685197.2, -(2251799813685197.2))).assertEqual(0);
      expect(nativeAdd(2251799813685186.5, 10.75) > 2251799813685186.5).assertTrue();
      expect(nativeAdd(2251799813685186.5, 10.75)).assertEqual(2251799813685186.5 + 10.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0097
     * @tc.name      testNativeBoundary0097
     * @tc.desc      Add boundary values 2251799813685185.0 and 11.0 and expect 2251799813685196.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685185.0, 11.0);
      logCase('testNativeBoundary0097', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685196.0);
      expect(nativeAdd(11.0, 2251799813685185.0)).assertEqual(2251799813685196.0);
      expect(nativeAdd(2251799813685196.0, -(11.0))).assertEqual(2251799813685185.0);
      expect(nativeAdd(2251799813685196.0, -(2251799813685185.0))).assertEqual(11.0);
      expect(nativeAdd(2251799813685196.0, -(2251799813685196.0))).assertEqual(0);
      expect(nativeAdd(2251799813685185.0, 11.0) > 2251799813685185.0).assertTrue();
      expect(nativeAdd(2251799813685185.0, 11.0)).assertEqual(2251799813685185.0 + 11.0);
      {
      const sum: number = nativeAdd(2251799813685183.5, 11.25);
      logCase('testNativeBoundary0098', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685194.8);
      expect(nativeAdd(11.25, 2251799813685183.5)).assertEqual(2251799813685194.8);
      expect(nativeAdd(2251799813685194.8, -(11.25))).assertEqual(2251799813685183.5);
      expect(nativeAdd(2251799813685194.8, -(2251799813685183.5))).assertEqual(11.25);
      expect(nativeAdd(2251799813685194.8, -(2251799813685194.8))).assertEqual(0);
      expect(nativeAdd(2251799813685183.5, 11.25) > 2251799813685183.5).assertTrue();
      expect(nativeAdd(2251799813685183.5, 11.25)).assertEqual(2251799813685183.5 + 11.25);
      }
      {
      const sum: number = nativeAdd(2251799813685182.0, 11.5);
      logCase('testNativeBoundary0099', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685193.5);
      expect(nativeAdd(11.5, 2251799813685182.0)).assertEqual(2251799813685193.5);
      expect(nativeAdd(2251799813685193.5, -(11.5))).assertEqual(2251799813685182.0);
      expect(nativeAdd(2251799813685193.5, -(2251799813685182.0))).assertEqual(11.5);
      expect(nativeAdd(2251799813685193.5, -(2251799813685193.5))).assertEqual(0);
      expect(nativeAdd(2251799813685182.0, 11.5) > 2251799813685182.0).assertTrue();
      expect(nativeAdd(2251799813685182.0, 11.5)).assertEqual(2251799813685182.0 + 11.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0100
     * @tc.name      testNativeBoundary0100
     * @tc.desc      Add boundary values 2251799813685180.5 and 11.75 and expect 2251799813685192.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685180.5, 11.75);
      logCase('testNativeBoundary0100', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685192.2);
      expect(nativeAdd(11.75, 2251799813685180.5)).assertEqual(2251799813685192.2);
      expect(nativeAdd(2251799813685192.2, -(11.75))).assertEqual(2251799813685180.5);
      expect(nativeAdd(2251799813685192.2, -(2251799813685180.5))).assertEqual(11.75);
      expect(nativeAdd(2251799813685192.2, -(2251799813685192.2))).assertEqual(0);
      expect(nativeAdd(2251799813685180.5, 11.75) > 2251799813685180.5).assertTrue();
      expect(nativeAdd(2251799813685180.5, 11.75)).assertEqual(2251799813685180.5 + 11.75);
      {
      const sum: number = nativeAdd(2251799813685179.0, 12.0);
      logCase('testNativeBoundary0101', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685191.0);
      expect(nativeAdd(12.0, 2251799813685179.0)).assertEqual(2251799813685191.0);
      expect(nativeAdd(2251799813685191.0, -(12.0))).assertEqual(2251799813685179.0);
      expect(nativeAdd(2251799813685191.0, -(2251799813685179.0))).assertEqual(12.0);
      expect(nativeAdd(2251799813685191.0, -(2251799813685191.0))).assertEqual(0);
      expect(nativeAdd(2251799813685179.0, 12.0) > 2251799813685179.0).assertTrue();
      expect(nativeAdd(2251799813685179.0, 12.0)).assertEqual(2251799813685179.0 + 12.0);
      }
      {
      const sum: number = nativeAdd(2251799813685177.5, 12.25);
      logCase('testNativeBoundary0102', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685189.8);
      expect(nativeAdd(12.25, 2251799813685177.5)).assertEqual(2251799813685189.8);
      expect(nativeAdd(2251799813685189.8, -(12.25))).assertEqual(2251799813685177.5);
      expect(nativeAdd(2251799813685189.8, -(2251799813685177.5))).assertEqual(12.25);
      expect(nativeAdd(2251799813685189.8, -(2251799813685189.8))).assertEqual(0);
      expect(nativeAdd(2251799813685177.5, 12.25) > 2251799813685177.5).assertTrue();
      expect(nativeAdd(2251799813685177.5, 12.25)).assertEqual(2251799813685177.5 + 12.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0103
     * @tc.name      testNativeBoundary0103
     * @tc.desc      Add boundary values 2251799813685176.0 and 12.5 and expect 2251799813685188.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685176.0, 12.5);
      logCase('testNativeBoundary0103', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685188.5);
      expect(nativeAdd(12.5, 2251799813685176.0)).assertEqual(2251799813685188.5);
      expect(nativeAdd(2251799813685188.5, -(12.5))).assertEqual(2251799813685176.0);
      expect(nativeAdd(2251799813685188.5, -(2251799813685176.0))).assertEqual(12.5);
      expect(nativeAdd(2251799813685188.5, -(2251799813685188.5))).assertEqual(0);
      expect(nativeAdd(2251799813685176.0, 12.5) > 2251799813685176.0).assertTrue();
      expect(nativeAdd(2251799813685176.0, 12.5)).assertEqual(2251799813685176.0 + 12.5);
      {
      const sum: number = nativeAdd(2251799813685174.5, 12.75);
      logCase('testNativeBoundary0104', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685187.2);
      expect(nativeAdd(12.75, 2251799813685174.5)).assertEqual(2251799813685187.2);
      expect(nativeAdd(2251799813685187.2, -(12.75))).assertEqual(2251799813685174.5);
      expect(nativeAdd(2251799813685187.2, -(2251799813685174.5))).assertEqual(12.75);
      expect(nativeAdd(2251799813685187.2, -(2251799813685187.2))).assertEqual(0);
      expect(nativeAdd(2251799813685174.5, 12.75) > 2251799813685174.5).assertTrue();
      expect(nativeAdd(2251799813685174.5, 12.75)).assertEqual(2251799813685174.5 + 12.75);
      }
      {
      const sum: number = nativeAdd(2251799813685173.0, 13.0);
      logCase('testNativeBoundary0105', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685186.0);
      expect(nativeAdd(13.0, 2251799813685173.0)).assertEqual(2251799813685186.0);
      expect(nativeAdd(2251799813685186.0, -(13.0))).assertEqual(2251799813685173.0);
      expect(nativeAdd(2251799813685186.0, -(2251799813685173.0))).assertEqual(13.0);
      expect(nativeAdd(2251799813685186.0, -(2251799813685186.0))).assertEqual(0);
      expect(nativeAdd(2251799813685173.0, 13.0) > 2251799813685173.0).assertTrue();
      expect(nativeAdd(2251799813685173.0, 13.0)).assertEqual(2251799813685173.0 + 13.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0106
     * @tc.name      testNativeBoundary0106
     * @tc.desc      Add boundary values 2251799813685171.5 and 13.25 and expect 2251799813685184.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685171.5, 13.25);
      logCase('testNativeBoundary0106', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685184.8);
      expect(nativeAdd(13.25, 2251799813685171.5)).assertEqual(2251799813685184.8);
      expect(nativeAdd(2251799813685184.8, -(13.25))).assertEqual(2251799813685171.5);
      expect(nativeAdd(2251799813685184.8, -(2251799813685171.5))).assertEqual(13.25);
      expect(nativeAdd(2251799813685184.8, -(2251799813685184.8))).assertEqual(0);
      expect(nativeAdd(2251799813685171.5, 13.25) > 2251799813685171.5).assertTrue();
      expect(nativeAdd(2251799813685171.5, 13.25)).assertEqual(2251799813685171.5 + 13.25);
      {
      const sum: number = nativeAdd(2251799813685170.0, 13.5);
      logCase('testNativeBoundary0107', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685183.5);
      expect(nativeAdd(13.5, 2251799813685170.0)).assertEqual(2251799813685183.5);
      expect(nativeAdd(2251799813685183.5, -(13.5))).assertEqual(2251799813685170.0);
      expect(nativeAdd(2251799813685183.5, -(2251799813685170.0))).assertEqual(13.5);
      expect(nativeAdd(2251799813685183.5, -(2251799813685183.5))).assertEqual(0);
      expect(nativeAdd(2251799813685170.0, 13.5) > 2251799813685170.0).assertTrue();
      expect(nativeAdd(2251799813685170.0, 13.5)).assertEqual(2251799813685170.0 + 13.5);
      }
      {
      const sum: number = nativeAdd(2251799813685168.5, 13.75);
      logCase('testNativeBoundary0108', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685182.2);
      expect(nativeAdd(13.75, 2251799813685168.5)).assertEqual(2251799813685182.2);
      expect(nativeAdd(2251799813685182.2, -(13.75))).assertEqual(2251799813685168.5);
      expect(nativeAdd(2251799813685182.2, -(2251799813685168.5))).assertEqual(13.75);
      expect(nativeAdd(2251799813685182.2, -(2251799813685182.2))).assertEqual(0);
      expect(nativeAdd(2251799813685168.5, 13.75) > 2251799813685168.5).assertTrue();
      expect(nativeAdd(2251799813685168.5, 13.75)).assertEqual(2251799813685168.5 + 13.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0109
     * @tc.name      testNativeBoundary0109
     * @tc.desc      Add boundary values 2251799813685167.0 and 14.0 and expect 2251799813685181.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBoundary0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2251799813685167.0, 14.0);
      logCase('testNativeBoundary0109', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685181.0);
      expect(nativeAdd(14.0, 2251799813685167.0)).assertEqual(2251799813685181.0);
      expect(nativeAdd(2251799813685181.0, -(14.0))).assertEqual(2251799813685167.0);
      expect(nativeAdd(2251799813685181.0, -(2251799813685167.0))).assertEqual(14.0);
      expect(nativeAdd(2251799813685181.0, -(2251799813685181.0))).assertEqual(0);
      expect(nativeAdd(2251799813685167.0, 14.0) > 2251799813685167.0).assertTrue();
      expect(nativeAdd(2251799813685167.0, 14.0)).assertEqual(2251799813685167.0 + 14.0);
      {
      const sum: number = nativeAdd(2251799813685165.5, 14.25);
      logCase('testNativeBoundary0110', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685179.8);
      expect(nativeAdd(14.25, 2251799813685165.5)).assertEqual(2251799813685179.8);
      expect(nativeAdd(2251799813685179.8, -(14.25))).assertEqual(2251799813685165.5);
      expect(nativeAdd(2251799813685179.8, -(2251799813685165.5))).assertEqual(14.25);
      expect(nativeAdd(2251799813685179.8, -(2251799813685179.8))).assertEqual(0);
      expect(nativeAdd(2251799813685165.5, 14.25) > 2251799813685165.5).assertTrue();
      expect(nativeAdd(2251799813685165.5, 14.25)).assertEqual(2251799813685165.5 + 14.25);
      }
      {
      const sum: number = nativeAdd(2251799813685164.0, 14.5);
      logCase('testNativeBoundary0111', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685178.5);
      expect(nativeAdd(14.5, 2251799813685164.0)).assertEqual(2251799813685178.5);
      expect(nativeAdd(2251799813685178.5, -(14.5))).assertEqual(2251799813685164.0);
      expect(nativeAdd(2251799813685178.5, -(2251799813685164.0))).assertEqual(14.5);
      expect(nativeAdd(2251799813685178.5, -(2251799813685178.5))).assertEqual(0);
      expect(nativeAdd(2251799813685164.0, 14.5) > 2251799813685164.0).assertTrue();
      expect(nativeAdd(2251799813685164.0, 14.5)).assertEqual(2251799813685164.0 + 14.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0112
     * @tc.name      testNativeBoundary0112
     * @tc.desc      Add boundary values 2251799813685162.5 and 14.75 and expect 2251799813685177.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685162.5, 14.75);
      logCase('testNativeBoundary0112', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685177.2);
      expect(nativeAdd(14.75, 2251799813685162.5)).assertEqual(2251799813685177.2);
      expect(nativeAdd(2251799813685177.2, -(14.75))).assertEqual(2251799813685162.5);
      expect(nativeAdd(2251799813685177.2, -(2251799813685162.5))).assertEqual(14.75);
      expect(nativeAdd(2251799813685177.2, -(2251799813685177.2))).assertEqual(0);
      expect(nativeAdd(2251799813685162.5, 14.75) > 2251799813685162.5).assertTrue();
      expect(nativeAdd(2251799813685162.5, 14.75)).assertEqual(2251799813685162.5 + 14.75);
      {
      const sum: number = nativeAdd(2251799813685161.0, 15.0);
      logCase('testNativeBoundary0113', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685176.0);
      expect(nativeAdd(15.0, 2251799813685161.0)).assertEqual(2251799813685176.0);
      expect(nativeAdd(2251799813685176.0, -(15.0))).assertEqual(2251799813685161.0);
      expect(nativeAdd(2251799813685176.0, -(2251799813685161.0))).assertEqual(15.0);
      expect(nativeAdd(2251799813685176.0, -(2251799813685176.0))).assertEqual(0);
      expect(nativeAdd(2251799813685161.0, 15.0) > 2251799813685161.0).assertTrue();
      expect(nativeAdd(2251799813685161.0, 15.0)).assertEqual(2251799813685161.0 + 15.0);
      }
      {
      const sum: number = nativeAdd(2251799813685159.5, 15.25);
      logCase('testNativeBoundary0114', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685174.8);
      expect(nativeAdd(15.25, 2251799813685159.5)).assertEqual(2251799813685174.8);
      expect(nativeAdd(2251799813685174.8, -(15.25))).assertEqual(2251799813685159.5);
      expect(nativeAdd(2251799813685174.8, -(2251799813685159.5))).assertEqual(15.25);
      expect(nativeAdd(2251799813685174.8, -(2251799813685174.8))).assertEqual(0);
      expect(nativeAdd(2251799813685159.5, 15.25) > 2251799813685159.5).assertTrue();
      expect(nativeAdd(2251799813685159.5, 15.25)).assertEqual(2251799813685159.5 + 15.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0115
     * @tc.name      testNativeBoundary0115
     * @tc.desc      Add boundary values 2251799813685158.0 and 15.5 and expect 2251799813685173.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685158.0, 15.5);
      logCase('testNativeBoundary0115', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685173.5);
      expect(nativeAdd(15.5, 2251799813685158.0)).assertEqual(2251799813685173.5);
      expect(nativeAdd(2251799813685173.5, -(15.5))).assertEqual(2251799813685158.0);
      expect(nativeAdd(2251799813685173.5, -(2251799813685158.0))).assertEqual(15.5);
      expect(nativeAdd(2251799813685173.5, -(2251799813685173.5))).assertEqual(0);
      expect(nativeAdd(2251799813685158.0, 15.5) > 2251799813685158.0).assertTrue();
      expect(nativeAdd(2251799813685158.0, 15.5)).assertEqual(2251799813685158.0 + 15.5);
      {
      const sum: number = nativeAdd(2251799813685156.5, 15.75);
      logCase('testNativeBoundary0116', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685172.2);
      expect(nativeAdd(15.75, 2251799813685156.5)).assertEqual(2251799813685172.2);
      expect(nativeAdd(2251799813685172.2, -(15.75))).assertEqual(2251799813685156.5);
      expect(nativeAdd(2251799813685172.2, -(2251799813685156.5))).assertEqual(15.75);
      expect(nativeAdd(2251799813685172.2, -(2251799813685172.2))).assertEqual(0);
      expect(nativeAdd(2251799813685156.5, 15.75) > 2251799813685156.5).assertTrue();
      expect(nativeAdd(2251799813685156.5, 15.75)).assertEqual(2251799813685156.5 + 15.75);
      }
      {
      const sum: number = nativeAdd(2251799813685155.0, 16.0);
      logCase('testNativeBoundary0117', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685171.0);
      expect(nativeAdd(16.0, 2251799813685155.0)).assertEqual(2251799813685171.0);
      expect(nativeAdd(2251799813685171.0, -(16.0))).assertEqual(2251799813685155.0);
      expect(nativeAdd(2251799813685171.0, -(2251799813685155.0))).assertEqual(16.0);
      expect(nativeAdd(2251799813685171.0, -(2251799813685171.0))).assertEqual(0);
      expect(nativeAdd(2251799813685155.0, 16.0) > 2251799813685155.0).assertTrue();
      expect(nativeAdd(2251799813685155.0, 16.0)).assertEqual(2251799813685155.0 + 16.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0118
     * @tc.name      testNativeBoundary0118
     * @tc.desc      Add boundary values 2251799813685153.5 and 16.25 and expect 2251799813685169.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685153.5, 16.25);
      logCase('testNativeBoundary0118', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685169.8);
      expect(nativeAdd(16.25, 2251799813685153.5)).assertEqual(2251799813685169.8);
      expect(nativeAdd(2251799813685169.8, -(16.25))).assertEqual(2251799813685153.5);
      expect(nativeAdd(2251799813685169.8, -(2251799813685153.5))).assertEqual(16.25);
      expect(nativeAdd(2251799813685169.8, -(2251799813685169.8))).assertEqual(0);
      expect(nativeAdd(2251799813685153.5, 16.25) > 2251799813685153.5).assertTrue();
      expect(nativeAdd(2251799813685153.5, 16.25)).assertEqual(2251799813685153.5 + 16.25);
      {
      const sum: number = nativeAdd(2251799813685152.0, 16.5);
      logCase('testNativeBoundary0119', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685168.5);
      expect(nativeAdd(16.5, 2251799813685152.0)).assertEqual(2251799813685168.5);
      expect(nativeAdd(2251799813685168.5, -(16.5))).assertEqual(2251799813685152.0);
      expect(nativeAdd(2251799813685168.5, -(2251799813685152.0))).assertEqual(16.5);
      expect(nativeAdd(2251799813685168.5, -(2251799813685168.5))).assertEqual(0);
      expect(nativeAdd(2251799813685152.0, 16.5) > 2251799813685152.0).assertTrue();
      expect(nativeAdd(2251799813685152.0, 16.5)).assertEqual(2251799813685152.0 + 16.5);
      }
      {
      const sum: number = nativeAdd(2251799813685150.5, 16.75);
      logCase('testNativeBoundary0120', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685167.2);
      expect(nativeAdd(16.75, 2251799813685150.5)).assertEqual(2251799813685167.2);
      expect(nativeAdd(2251799813685167.2, -(16.75))).assertEqual(2251799813685150.5);
      expect(nativeAdd(2251799813685167.2, -(2251799813685150.5))).assertEqual(16.75);
      expect(nativeAdd(2251799813685167.2, -(2251799813685167.2))).assertEqual(0);
      expect(nativeAdd(2251799813685150.5, 16.75) > 2251799813685150.5).assertTrue();
      expect(nativeAdd(2251799813685150.5, 16.75)).assertEqual(2251799813685150.5 + 16.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0121
     * @tc.name      testNativeBoundary0121
     * @tc.desc      Add boundary values 2251799813685149.0 and 17.0 and expect 2251799813685166.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685149.0, 17.0);
      logCase('testNativeBoundary0121', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685166.0);
      expect(nativeAdd(17.0, 2251799813685149.0)).assertEqual(2251799813685166.0);
      expect(nativeAdd(2251799813685166.0, -(17.0))).assertEqual(2251799813685149.0);
      expect(nativeAdd(2251799813685166.0, -(2251799813685149.0))).assertEqual(17.0);
      expect(nativeAdd(2251799813685166.0, -(2251799813685166.0))).assertEqual(0);
      expect(nativeAdd(2251799813685149.0, 17.0) > 2251799813685149.0).assertTrue();
      expect(nativeAdd(2251799813685149.0, 17.0)).assertEqual(2251799813685149.0 + 17.0);
      {
      const sum: number = nativeAdd(2251799813685147.5, 17.25);
      logCase('testNativeBoundary0122', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685164.8);
      expect(nativeAdd(17.25, 2251799813685147.5)).assertEqual(2251799813685164.8);
      expect(nativeAdd(2251799813685164.8, -(17.25))).assertEqual(2251799813685147.5);
      expect(nativeAdd(2251799813685164.8, -(2251799813685147.5))).assertEqual(17.25);
      expect(nativeAdd(2251799813685164.8, -(2251799813685164.8))).assertEqual(0);
      expect(nativeAdd(2251799813685147.5, 17.25) > 2251799813685147.5).assertTrue();
      expect(nativeAdd(2251799813685147.5, 17.25)).assertEqual(2251799813685147.5 + 17.25);
      }
      {
      const sum: number = nativeAdd(2251799813685146.0, 17.5);
      logCase('testNativeBoundary0123', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685163.5);
      expect(nativeAdd(17.5, 2251799813685146.0)).assertEqual(2251799813685163.5);
      expect(nativeAdd(2251799813685163.5, -(17.5))).assertEqual(2251799813685146.0);
      expect(nativeAdd(2251799813685163.5, -(2251799813685146.0))).assertEqual(17.5);
      expect(nativeAdd(2251799813685163.5, -(2251799813685163.5))).assertEqual(0);
      expect(nativeAdd(2251799813685146.0, 17.5) > 2251799813685146.0).assertTrue();
      expect(nativeAdd(2251799813685146.0, 17.5)).assertEqual(2251799813685146.0 + 17.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0124
     * @tc.name      testNativeBoundary0124
     * @tc.desc      Add boundary values 2251799813685144.5 and 17.75 and expect 2251799813685162.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685144.5, 17.75);
      logCase('testNativeBoundary0124', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685162.2);
      expect(nativeAdd(17.75, 2251799813685144.5)).assertEqual(2251799813685162.2);
      expect(nativeAdd(2251799813685162.2, -(17.75))).assertEqual(2251799813685144.5);
      expect(nativeAdd(2251799813685162.2, -(2251799813685144.5))).assertEqual(17.75);
      expect(nativeAdd(2251799813685162.2, -(2251799813685162.2))).assertEqual(0);
      expect(nativeAdd(2251799813685144.5, 17.75) > 2251799813685144.5).assertTrue();
      expect(nativeAdd(2251799813685144.5, 17.75)).assertEqual(2251799813685144.5 + 17.75);
      {
      const sum: number = nativeAdd(2251799813685143.0, 18.0);
      logCase('testNativeBoundary0125', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685161.0);
      expect(nativeAdd(18.0, 2251799813685143.0)).assertEqual(2251799813685161.0);
      expect(nativeAdd(2251799813685161.0, -(18.0))).assertEqual(2251799813685143.0);
      expect(nativeAdd(2251799813685161.0, -(2251799813685143.0))).assertEqual(18.0);
      expect(nativeAdd(2251799813685161.0, -(2251799813685161.0))).assertEqual(0);
      expect(nativeAdd(2251799813685143.0, 18.0) > 2251799813685143.0).assertTrue();
      expect(nativeAdd(2251799813685143.0, 18.0)).assertEqual(2251799813685143.0 + 18.0);
      }
      {
      const sum: number = nativeAdd(2251799813685141.5, 18.25);
      logCase('testNativeBoundary0126', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685159.8);
      expect(nativeAdd(18.25, 2251799813685141.5)).assertEqual(2251799813685159.8);
      expect(nativeAdd(2251799813685159.8, -(18.25))).assertEqual(2251799813685141.5);
      expect(nativeAdd(2251799813685159.8, -(2251799813685141.5))).assertEqual(18.25);
      expect(nativeAdd(2251799813685159.8, -(2251799813685159.8))).assertEqual(0);
      expect(nativeAdd(2251799813685141.5, 18.25) > 2251799813685141.5).assertTrue();
      expect(nativeAdd(2251799813685141.5, 18.25)).assertEqual(2251799813685141.5 + 18.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0127
     * @tc.name      testNativeBoundary0127
     * @tc.desc      Add boundary values 2251799813685140.0 and 18.5 and expect 2251799813685158.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685140.0, 18.5);
      logCase('testNativeBoundary0127', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685158.5);
      expect(nativeAdd(18.5, 2251799813685140.0)).assertEqual(2251799813685158.5);
      expect(nativeAdd(2251799813685158.5, -(18.5))).assertEqual(2251799813685140.0);
      expect(nativeAdd(2251799813685158.5, -(2251799813685140.0))).assertEqual(18.5);
      expect(nativeAdd(2251799813685158.5, -(2251799813685158.5))).assertEqual(0);
      expect(nativeAdd(2251799813685140.0, 18.5) > 2251799813685140.0).assertTrue();
      expect(nativeAdd(2251799813685140.0, 18.5)).assertEqual(2251799813685140.0 + 18.5);
      {
      const sum: number = nativeAdd(2251799813685138.5, 18.75);
      logCase('testNativeBoundary0128', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685157.2);
      expect(nativeAdd(18.75, 2251799813685138.5)).assertEqual(2251799813685157.2);
      expect(nativeAdd(2251799813685157.2, -(18.75))).assertEqual(2251799813685138.5);
      expect(nativeAdd(2251799813685157.2, -(2251799813685138.5))).assertEqual(18.75);
      expect(nativeAdd(2251799813685157.2, -(2251799813685157.2))).assertEqual(0);
      expect(nativeAdd(2251799813685138.5, 18.75) > 2251799813685138.5).assertTrue();
      expect(nativeAdd(2251799813685138.5, 18.75)).assertEqual(2251799813685138.5 + 18.75);
      }
      {
      const sum: number = nativeAdd(2251799813685137.0, 19.0);
      logCase('testNativeBoundary0129', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685156.0);
      expect(nativeAdd(19.0, 2251799813685137.0)).assertEqual(2251799813685156.0);
      expect(nativeAdd(2251799813685156.0, -(19.0))).assertEqual(2251799813685137.0);
      expect(nativeAdd(2251799813685156.0, -(2251799813685137.0))).assertEqual(19.0);
      expect(nativeAdd(2251799813685156.0, -(2251799813685156.0))).assertEqual(0);
      expect(nativeAdd(2251799813685137.0, 19.0) > 2251799813685137.0).assertTrue();
      expect(nativeAdd(2251799813685137.0, 19.0)).assertEqual(2251799813685137.0 + 19.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0130
     * @tc.name      testNativeBoundary0130
     * @tc.desc      Add boundary values 2251799813685135.5 and 19.25 and expect 2251799813685154.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685135.5, 19.25);
      logCase('testNativeBoundary0130', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685154.8);
      expect(nativeAdd(19.25, 2251799813685135.5)).assertEqual(2251799813685154.8);
      expect(nativeAdd(2251799813685154.8, -(19.25))).assertEqual(2251799813685135.5);
      expect(nativeAdd(2251799813685154.8, -(2251799813685135.5))).assertEqual(19.25);
      expect(nativeAdd(2251799813685154.8, -(2251799813685154.8))).assertEqual(0);
      expect(nativeAdd(2251799813685135.5, 19.25) > 2251799813685135.5).assertTrue();
      expect(nativeAdd(2251799813685135.5, 19.25)).assertEqual(2251799813685135.5 + 19.25);
      {
      const sum: number = nativeAdd(2251799813685134.0, 19.5);
      logCase('testNativeBoundary0131', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685153.5);
      expect(nativeAdd(19.5, 2251799813685134.0)).assertEqual(2251799813685153.5);
      expect(nativeAdd(2251799813685153.5, -(19.5))).assertEqual(2251799813685134.0);
      expect(nativeAdd(2251799813685153.5, -(2251799813685134.0))).assertEqual(19.5);
      expect(nativeAdd(2251799813685153.5, -(2251799813685153.5))).assertEqual(0);
      expect(nativeAdd(2251799813685134.0, 19.5) > 2251799813685134.0).assertTrue();
      expect(nativeAdd(2251799813685134.0, 19.5)).assertEqual(2251799813685134.0 + 19.5);
      }
      {
      const sum: number = nativeAdd(2251799813685132.5, 19.75);
      logCase('testNativeBoundary0132', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685152.2);
      expect(nativeAdd(19.75, 2251799813685132.5)).assertEqual(2251799813685152.2);
      expect(nativeAdd(2251799813685152.2, -(19.75))).assertEqual(2251799813685132.5);
      expect(nativeAdd(2251799813685152.2, -(2251799813685132.5))).assertEqual(19.75);
      expect(nativeAdd(2251799813685152.2, -(2251799813685152.2))).assertEqual(0);
      expect(nativeAdd(2251799813685132.5, 19.75) > 2251799813685132.5).assertTrue();
      expect(nativeAdd(2251799813685132.5, 19.75)).assertEqual(2251799813685132.5 + 19.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0133
     * @tc.name      testNativeBoundary0133
     * @tc.desc      Add boundary values 2251799813685131.0 and 20.0 and expect 2251799813685151.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685131.0, 20.0);
      logCase('testNativeBoundary0133', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685151.0);
      expect(nativeAdd(20.0, 2251799813685131.0)).assertEqual(2251799813685151.0);
      expect(nativeAdd(2251799813685151.0, -(20.0))).assertEqual(2251799813685131.0);
      expect(nativeAdd(2251799813685151.0, -(2251799813685131.0))).assertEqual(20.0);
      expect(nativeAdd(2251799813685151.0, -(2251799813685151.0))).assertEqual(0);
      expect(nativeAdd(2251799813685131.0, 20.0) > 2251799813685131.0).assertTrue();
      expect(nativeAdd(2251799813685131.0, 20.0)).assertEqual(2251799813685131.0 + 20.0);
      {
      const sum: number = nativeAdd(2251799813685129.5, 20.25);
      logCase('testNativeBoundary0134', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685149.8);
      expect(nativeAdd(20.25, 2251799813685129.5)).assertEqual(2251799813685149.8);
      expect(nativeAdd(2251799813685149.8, -(20.25))).assertEqual(2251799813685129.5);
      expect(nativeAdd(2251799813685149.8, -(2251799813685129.5))).assertEqual(20.25);
      expect(nativeAdd(2251799813685149.8, -(2251799813685149.8))).assertEqual(0);
      expect(nativeAdd(2251799813685129.5, 20.25) > 2251799813685129.5).assertTrue();
      expect(nativeAdd(2251799813685129.5, 20.25)).assertEqual(2251799813685129.5 + 20.25);
      }
      {
      const sum: number = nativeAdd(2251799813685128.0, 20.5);
      logCase('testNativeBoundary0135', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685148.5);
      expect(nativeAdd(20.5, 2251799813685128.0)).assertEqual(2251799813685148.5);
      expect(nativeAdd(2251799813685148.5, -(20.5))).assertEqual(2251799813685128.0);
      expect(nativeAdd(2251799813685148.5, -(2251799813685128.0))).assertEqual(20.5);
      expect(nativeAdd(2251799813685148.5, -(2251799813685148.5))).assertEqual(0);
      expect(nativeAdd(2251799813685128.0, 20.5) > 2251799813685128.0).assertTrue();
      expect(nativeAdd(2251799813685128.0, 20.5)).assertEqual(2251799813685128.0 + 20.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0136
     * @tc.name      testNativeBoundary0136
     * @tc.desc      Add boundary values 2251799813685126.5 and 20.75 and expect 2251799813685147.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685126.5, 20.75);
      logCase('testNativeBoundary0136', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685147.2);
      expect(nativeAdd(20.75, 2251799813685126.5)).assertEqual(2251799813685147.2);
      expect(nativeAdd(2251799813685147.2, -(20.75))).assertEqual(2251799813685126.5);
      expect(nativeAdd(2251799813685147.2, -(2251799813685126.5))).assertEqual(20.75);
      expect(nativeAdd(2251799813685147.2, -(2251799813685147.2))).assertEqual(0);
      expect(nativeAdd(2251799813685126.5, 20.75) > 2251799813685126.5).assertTrue();
      expect(nativeAdd(2251799813685126.5, 20.75)).assertEqual(2251799813685126.5 + 20.75);
      {
      const sum: number = nativeAdd(2251799813685125.0, 21.0);
      logCase('testNativeBoundary0137', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685146.0);
      expect(nativeAdd(21.0, 2251799813685125.0)).assertEqual(2251799813685146.0);
      expect(nativeAdd(2251799813685146.0, -(21.0))).assertEqual(2251799813685125.0);
      expect(nativeAdd(2251799813685146.0, -(2251799813685125.0))).assertEqual(21.0);
      expect(nativeAdd(2251799813685146.0, -(2251799813685146.0))).assertEqual(0);
      expect(nativeAdd(2251799813685125.0, 21.0) > 2251799813685125.0).assertTrue();
      expect(nativeAdd(2251799813685125.0, 21.0)).assertEqual(2251799813685125.0 + 21.0);
      }
      {
      const sum: number = nativeAdd(2251799813685123.5, 21.25);
      logCase('testNativeBoundary0138', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685144.8);
      expect(nativeAdd(21.25, 2251799813685123.5)).assertEqual(2251799813685144.8);
      expect(nativeAdd(2251799813685144.8, -(21.25))).assertEqual(2251799813685123.5);
      expect(nativeAdd(2251799813685144.8, -(2251799813685123.5))).assertEqual(21.25);
      expect(nativeAdd(2251799813685144.8, -(2251799813685144.8))).assertEqual(0);
      expect(nativeAdd(2251799813685123.5, 21.25) > 2251799813685123.5).assertTrue();
      expect(nativeAdd(2251799813685123.5, 21.25)).assertEqual(2251799813685123.5 + 21.25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0139
     * @tc.name      testNativeBoundary0139
     * @tc.desc      Add boundary values 2251799813685122.0 and 21.5 and expect 2251799813685143.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685122.0, 21.5);
      logCase('testNativeBoundary0139', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685143.5);
      expect(nativeAdd(21.5, 2251799813685122.0)).assertEqual(2251799813685143.5);
      expect(nativeAdd(2251799813685143.5, -(21.5))).assertEqual(2251799813685122.0);
      expect(nativeAdd(2251799813685143.5, -(2251799813685122.0))).assertEqual(21.5);
      expect(nativeAdd(2251799813685143.5, -(2251799813685143.5))).assertEqual(0);
      expect(nativeAdd(2251799813685122.0, 21.5) > 2251799813685122.0).assertTrue();
      expect(nativeAdd(2251799813685122.0, 21.5)).assertEqual(2251799813685122.0 + 21.5);
      {
      const sum: number = nativeAdd(2251799813685120.5, 21.75);
      logCase('testNativeBoundary0140', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685142.2);
      expect(nativeAdd(21.75, 2251799813685120.5)).assertEqual(2251799813685142.2);
      expect(nativeAdd(2251799813685142.2, -(21.75))).assertEqual(2251799813685120.5);
      expect(nativeAdd(2251799813685142.2, -(2251799813685120.5))).assertEqual(21.75);
      expect(nativeAdd(2251799813685142.2, -(2251799813685142.2))).assertEqual(0);
      expect(nativeAdd(2251799813685120.5, 21.75) > 2251799813685120.5).assertTrue();
      expect(nativeAdd(2251799813685120.5, 21.75)).assertEqual(2251799813685120.5 + 21.75);
      }
      {
      const sum: number = nativeAdd(2251799813685119.0, 22.0);
      logCase('testNativeBoundary0141', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685141.0);
      expect(nativeAdd(22.0, 2251799813685119.0)).assertEqual(2251799813685141.0);
      expect(nativeAdd(2251799813685141.0, -(22.0))).assertEqual(2251799813685119.0);
      expect(nativeAdd(2251799813685141.0, -(2251799813685119.0))).assertEqual(22.0);
      expect(nativeAdd(2251799813685141.0, -(2251799813685141.0))).assertEqual(0);
      expect(nativeAdd(2251799813685119.0, 22.0) > 2251799813685119.0).assertTrue();
      expect(nativeAdd(2251799813685119.0, 22.0)).assertEqual(2251799813685119.0 + 22.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0142
     * @tc.name      testNativeBoundary0142
     * @tc.desc      Add boundary values 2251799813685117.5 and 22.25 and expect 2251799813685139.8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685117.5, 22.25);
      logCase('testNativeBoundary0142', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685139.8);
      expect(nativeAdd(22.25, 2251799813685117.5)).assertEqual(2251799813685139.8);
      expect(nativeAdd(2251799813685139.8, -(22.25))).assertEqual(2251799813685117.5);
      expect(nativeAdd(2251799813685139.8, -(2251799813685117.5))).assertEqual(22.25);
      expect(nativeAdd(2251799813685139.8, -(2251799813685139.8))).assertEqual(0);
      expect(nativeAdd(2251799813685117.5, 22.25) > 2251799813685117.5).assertTrue();
      expect(nativeAdd(2251799813685117.5, 22.25)).assertEqual(2251799813685117.5 + 22.25);
      {
      const sum: number = nativeAdd(2251799813685116.0, 22.5);
      logCase('testNativeBoundary0143', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685138.5);
      expect(nativeAdd(22.5, 2251799813685116.0)).assertEqual(2251799813685138.5);
      expect(nativeAdd(2251799813685138.5, -(22.5))).assertEqual(2251799813685116.0);
      expect(nativeAdd(2251799813685138.5, -(2251799813685116.0))).assertEqual(22.5);
      expect(nativeAdd(2251799813685138.5, -(2251799813685138.5))).assertEqual(0);
      expect(nativeAdd(2251799813685116.0, 22.5) > 2251799813685116.0).assertTrue();
      expect(nativeAdd(2251799813685116.0, 22.5)).assertEqual(2251799813685116.0 + 22.5);
      }
      {
      const sum: number = nativeAdd(2251799813685114.5, 22.75);
      logCase('testNativeBoundary0144', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685137.2);
      expect(nativeAdd(22.75, 2251799813685114.5)).assertEqual(2251799813685137.2);
      expect(nativeAdd(2251799813685137.2, -(22.75))).assertEqual(2251799813685114.5);
      expect(nativeAdd(2251799813685137.2, -(2251799813685114.5))).assertEqual(22.75);
      expect(nativeAdd(2251799813685137.2, -(2251799813685137.2))).assertEqual(0);
      expect(nativeAdd(2251799813685114.5, 22.75) > 2251799813685114.5).assertTrue();
      expect(nativeAdd(2251799813685114.5, 22.75)).assertEqual(2251799813685114.5 + 22.75);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0145
     * @tc.name      testNativeBoundary0145
     * @tc.desc      Add boundary values 2251799813685113.0 and 23.0 and expect 2251799813685136.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685113.0, 23.0);
      logCase('testNativeBoundary0145', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685136.0);
      expect(nativeAdd(23.0, 2251799813685113.0)).assertEqual(2251799813685136.0);
      expect(nativeAdd(2251799813685136.0, -(23.0))).assertEqual(2251799813685113.0);
      expect(nativeAdd(2251799813685136.0, -(2251799813685113.0))).assertEqual(23.0);
      expect(nativeAdd(2251799813685136.0, -(2251799813685136.0))).assertEqual(0);
      expect(nativeAdd(2251799813685113.0, 23.0) > 2251799813685113.0).assertTrue();
      expect(nativeAdd(2251799813685113.0, 23.0)).assertEqual(2251799813685113.0 + 23.0);
      {
      const sum: number = nativeAdd(2251799813685111.5, 23.25);
      logCase('testNativeBoundary0146', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685134.8);
      expect(nativeAdd(23.25, 2251799813685111.5)).assertEqual(2251799813685134.8);
      expect(nativeAdd(2251799813685134.8, -(23.25))).assertEqual(2251799813685111.5);
      expect(nativeAdd(2251799813685134.8, -(2251799813685111.5))).assertEqual(23.25);
      expect(nativeAdd(2251799813685134.8, -(2251799813685134.8))).assertEqual(0);
      expect(nativeAdd(2251799813685111.5, 23.25) > 2251799813685111.5).assertTrue();
      expect(nativeAdd(2251799813685111.5, 23.25)).assertEqual(2251799813685111.5 + 23.25);
      }
      {
      const sum: number = nativeAdd(2251799813685110.0, 23.5);
      logCase('testNativeBoundary0147', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685133.5);
      expect(nativeAdd(23.5, 2251799813685110.0)).assertEqual(2251799813685133.5);
      expect(nativeAdd(2251799813685133.5, -(23.5))).assertEqual(2251799813685110.0);
      expect(nativeAdd(2251799813685133.5, -(2251799813685110.0))).assertEqual(23.5);
      expect(nativeAdd(2251799813685133.5, -(2251799813685133.5))).assertEqual(0);
      expect(nativeAdd(2251799813685110.0, 23.5) > 2251799813685110.0).assertTrue();
      expect(nativeAdd(2251799813685110.0, 23.5)).assertEqual(2251799813685110.0 + 23.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BOUNDARY_0148
     * @tc.name      testNativeBoundary0148
     * @tc.desc      Add boundary values 2251799813685108.5 and 23.75 and expect 2251799813685132.2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBoundary0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(2251799813685108.5, 23.75);
      logCase('testNativeBoundary0148', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685132.2);
      expect(nativeAdd(23.75, 2251799813685108.5)).assertEqual(2251799813685132.2);
      expect(nativeAdd(2251799813685132.2, -(23.75))).assertEqual(2251799813685108.5);
      expect(nativeAdd(2251799813685132.2, -(2251799813685108.5))).assertEqual(23.75);
      expect(nativeAdd(2251799813685132.2, -(2251799813685132.2))).assertEqual(0);
      expect(nativeAdd(2251799813685108.5, 23.75) > 2251799813685108.5).assertTrue();
      expect(nativeAdd(2251799813685108.5, 23.75)).assertEqual(2251799813685108.5 + 23.75);
      {
      const sum: number = nativeAdd(2251799813685107.0, 24.0);
      logCase('testNativeBoundary0149', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685131.0);
      expect(nativeAdd(24.0, 2251799813685107.0)).assertEqual(2251799813685131.0);
      expect(nativeAdd(2251799813685131.0, -(24.0))).assertEqual(2251799813685107.0);
      expect(nativeAdd(2251799813685131.0, -(2251799813685107.0))).assertEqual(24.0);
      expect(nativeAdd(2251799813685131.0, -(2251799813685131.0))).assertEqual(0);
      expect(nativeAdd(2251799813685107.0, 24.0) > 2251799813685107.0).assertTrue();
      expect(nativeAdd(2251799813685107.0, 24.0)).assertEqual(2251799813685107.0 + 24.0);
      }
      {
      const sum: number = nativeAdd(2251799813685105.5, 24.25);
      logCase('testNativeBoundary0150', `sum=${sum}`);
      expect(sum).assertEqual(2251799813685129.8);
      expect(nativeAdd(24.25, 2251799813685105.5)).assertEqual(2251799813685129.8);
      expect(nativeAdd(2251799813685129.8, -(24.25))).assertEqual(2251799813685105.5);
      expect(nativeAdd(2251799813685129.8, -(2251799813685105.5))).assertEqual(24.25);
      expect(nativeAdd(2251799813685129.8, -(2251799813685129.8))).assertEqual(0);
      expect(nativeAdd(2251799813685105.5, 24.25) > 2251799813685105.5).assertTrue();
      expect(nativeAdd(2251799813685105.5, 24.25)).assertEqual(2251799813685105.5 + 24.25);
      }
    });

  });
}
