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
