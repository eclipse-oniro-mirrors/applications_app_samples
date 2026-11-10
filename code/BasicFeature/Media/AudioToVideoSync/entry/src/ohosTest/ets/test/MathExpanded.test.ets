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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';

export default function mathExpandedTest() {
  describe('mathExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0001
     * @tc.name      testExpMath0001
     * @tc.desc      Numeric rounding rules for value -50 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -50;
      expect(Math.abs(value)).assertEqual(50);
      expect(Math.ceil(value)).assertEqual(-50);
      expect(Math.floor(value)).assertEqual(-50);
      expect(Math.trunc(value)).assertEqual(-50);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0002
     * @tc.name      testExpMath0002
     * @tc.desc      Numeric rounding rules for value -49 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -49;
      expect(Math.abs(value)).assertEqual(49);
      expect(Math.ceil(value)).assertEqual(-49);
      expect(Math.floor(value)).assertEqual(-49);
      expect(Math.trunc(value)).assertEqual(-49);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0003
     * @tc.name      testExpMath0003
     * @tc.desc      Numeric rounding rules for value -48 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -48;
      expect(Math.abs(value)).assertEqual(48);
      expect(Math.ceil(value)).assertEqual(-48);
      expect(Math.floor(value)).assertEqual(-48);
      expect(Math.trunc(value)).assertEqual(-48);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0004
     * @tc.name      testExpMath0004
     * @tc.desc      Numeric rounding rules for value -47 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -47;
      expect(Math.abs(value)).assertEqual(47);
      expect(Math.ceil(value)).assertEqual(-47);
      expect(Math.floor(value)).assertEqual(-47);
      expect(Math.trunc(value)).assertEqual(-47);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0005
     * @tc.name      testExpMath0005
     * @tc.desc      Numeric rounding rules for value -46 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -46;
      expect(Math.abs(value)).assertEqual(46);
      expect(Math.ceil(value)).assertEqual(-46);
      expect(Math.floor(value)).assertEqual(-46);
      expect(Math.trunc(value)).assertEqual(-46);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0006
     * @tc.name      testExpMath0006
     * @tc.desc      Numeric rounding rules for value -45 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -45;
      expect(Math.abs(value)).assertEqual(45);
      expect(Math.ceil(value)).assertEqual(-45);
      expect(Math.floor(value)).assertEqual(-45);
      expect(Math.trunc(value)).assertEqual(-45);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0007
     * @tc.name      testExpMath0007
     * @tc.desc      Numeric rounding rules for value -44 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -44;
      expect(Math.abs(value)).assertEqual(44);
      expect(Math.ceil(value)).assertEqual(-44);
      expect(Math.floor(value)).assertEqual(-44);
      expect(Math.trunc(value)).assertEqual(-44);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0008
     * @tc.name      testExpMath0008
     * @tc.desc      Numeric rounding rules for value -43 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -43;
      expect(Math.abs(value)).assertEqual(43);
      expect(Math.ceil(value)).assertEqual(-43);
      expect(Math.floor(value)).assertEqual(-43);
      expect(Math.trunc(value)).assertEqual(-43);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0009
     * @tc.name      testExpMath0009
     * @tc.desc      Numeric rounding rules for value -42 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -42;
      expect(Math.abs(value)).assertEqual(42);
      expect(Math.ceil(value)).assertEqual(-42);
      expect(Math.floor(value)).assertEqual(-42);
      expect(Math.trunc(value)).assertEqual(-42);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0010
     * @tc.name      testExpMath0010
     * @tc.desc      Numeric rounding rules for value -41 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -41;
      expect(Math.abs(value)).assertEqual(41);
      expect(Math.ceil(value)).assertEqual(-41);
      expect(Math.floor(value)).assertEqual(-41);
      expect(Math.trunc(value)).assertEqual(-41);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0011
     * @tc.name      testExpMath0011
     * @tc.desc      Numeric rounding rules for value -40 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -40;
      expect(Math.abs(value)).assertEqual(40);
      expect(Math.ceil(value)).assertEqual(-40);
      expect(Math.floor(value)).assertEqual(-40);
      expect(Math.trunc(value)).assertEqual(-40);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0012
     * @tc.name      testExpMath0012
     * @tc.desc      Numeric rounding rules for value -39 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -39;
      expect(Math.abs(value)).assertEqual(39);
      expect(Math.ceil(value)).assertEqual(-39);
      expect(Math.floor(value)).assertEqual(-39);
      expect(Math.trunc(value)).assertEqual(-39);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0013
     * @tc.name      testExpMath0013
     * @tc.desc      Numeric rounding rules for value -38 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -38;
      expect(Math.abs(value)).assertEqual(38);
      expect(Math.ceil(value)).assertEqual(-38);
      expect(Math.floor(value)).assertEqual(-38);
      expect(Math.trunc(value)).assertEqual(-38);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0014
     * @tc.name      testExpMath0014
     * @tc.desc      Numeric rounding rules for value -37 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -37;
      expect(Math.abs(value)).assertEqual(37);
      expect(Math.ceil(value)).assertEqual(-37);
      expect(Math.floor(value)).assertEqual(-37);
      expect(Math.trunc(value)).assertEqual(-37);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0015
     * @tc.name      testExpMath0015
     * @tc.desc      Numeric rounding rules for value -36 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -36;
      expect(Math.abs(value)).assertEqual(36);
      expect(Math.ceil(value)).assertEqual(-36);
      expect(Math.floor(value)).assertEqual(-36);
      expect(Math.trunc(value)).assertEqual(-36);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0016
     * @tc.name      testExpMath0016
     * @tc.desc      Numeric rounding rules for value -35 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -35;
      expect(Math.abs(value)).assertEqual(35);
      expect(Math.ceil(value)).assertEqual(-35);
      expect(Math.floor(value)).assertEqual(-35);
      expect(Math.trunc(value)).assertEqual(-35);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0017
     * @tc.name      testExpMath0017
     * @tc.desc      Numeric rounding rules for value -34 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -34;
      expect(Math.abs(value)).assertEqual(34);
      expect(Math.ceil(value)).assertEqual(-34);
      expect(Math.floor(value)).assertEqual(-34);
      expect(Math.trunc(value)).assertEqual(-34);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0018
     * @tc.name      testExpMath0018
     * @tc.desc      Numeric rounding rules for value -33 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -33;
      expect(Math.abs(value)).assertEqual(33);
      expect(Math.ceil(value)).assertEqual(-33);
      expect(Math.floor(value)).assertEqual(-33);
      expect(Math.trunc(value)).assertEqual(-33);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0019
     * @tc.name      testExpMath0019
     * @tc.desc      Numeric rounding rules for value -32 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -32;
      expect(Math.abs(value)).assertEqual(32);
      expect(Math.ceil(value)).assertEqual(-32);
      expect(Math.floor(value)).assertEqual(-32);
      expect(Math.trunc(value)).assertEqual(-32);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0020
     * @tc.name      testExpMath0020
     * @tc.desc      Numeric rounding rules for value -31 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -31;
      expect(Math.abs(value)).assertEqual(31);
      expect(Math.ceil(value)).assertEqual(-31);
      expect(Math.floor(value)).assertEqual(-31);
      expect(Math.trunc(value)).assertEqual(-31);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0021
     * @tc.name      testExpMath0021
     * @tc.desc      Numeric rounding rules for value -30 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -30;
      expect(Math.abs(value)).assertEqual(30);
      expect(Math.ceil(value)).assertEqual(-30);
      expect(Math.floor(value)).assertEqual(-30);
      expect(Math.trunc(value)).assertEqual(-30);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0022
     * @tc.name      testExpMath0022
     * @tc.desc      Numeric rounding rules for value -29 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -29;
      expect(Math.abs(value)).assertEqual(29);
      expect(Math.ceil(value)).assertEqual(-29);
      expect(Math.floor(value)).assertEqual(-29);
      expect(Math.trunc(value)).assertEqual(-29);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0023
     * @tc.name      testExpMath0023
     * @tc.desc      Numeric rounding rules for value -28 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -28;
      expect(Math.abs(value)).assertEqual(28);
      expect(Math.ceil(value)).assertEqual(-28);
      expect(Math.floor(value)).assertEqual(-28);
      expect(Math.trunc(value)).assertEqual(-28);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0024
     * @tc.name      testExpMath0024
     * @tc.desc      Numeric rounding rules for value -27 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -27;
      expect(Math.abs(value)).assertEqual(27);
      expect(Math.ceil(value)).assertEqual(-27);
      expect(Math.floor(value)).assertEqual(-27);
      expect(Math.trunc(value)).assertEqual(-27);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0025
     * @tc.name      testExpMath0025
     * @tc.desc      Numeric rounding rules for value -26 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -26;
      expect(Math.abs(value)).assertEqual(26);
      expect(Math.ceil(value)).assertEqual(-26);
      expect(Math.floor(value)).assertEqual(-26);
      expect(Math.trunc(value)).assertEqual(-26);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0026
     * @tc.name      testExpMath0026
     * @tc.desc      Numeric rounding rules for value -25 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -25;
      expect(Math.abs(value)).assertEqual(25);
      expect(Math.ceil(value)).assertEqual(-25);
      expect(Math.floor(value)).assertEqual(-25);
      expect(Math.trunc(value)).assertEqual(-25);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0027
     * @tc.name      testExpMath0027
     * @tc.desc      Numeric rounding rules for value -24 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -24;
      expect(Math.abs(value)).assertEqual(24);
      expect(Math.ceil(value)).assertEqual(-24);
      expect(Math.floor(value)).assertEqual(-24);
      expect(Math.trunc(value)).assertEqual(-24);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0028
     * @tc.name      testExpMath0028
     * @tc.desc      Numeric rounding rules for value -23 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -23;
      expect(Math.abs(value)).assertEqual(23);
      expect(Math.ceil(value)).assertEqual(-23);
      expect(Math.floor(value)).assertEqual(-23);
      expect(Math.trunc(value)).assertEqual(-23);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0029
     * @tc.name      testExpMath0029
     * @tc.desc      Numeric rounding rules for value -22 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -22;
      expect(Math.abs(value)).assertEqual(22);
      expect(Math.ceil(value)).assertEqual(-22);
      expect(Math.floor(value)).assertEqual(-22);
      expect(Math.trunc(value)).assertEqual(-22);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0030
     * @tc.name      testExpMath0030
     * @tc.desc      Numeric rounding rules for value -21 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -21;
      expect(Math.abs(value)).assertEqual(21);
      expect(Math.ceil(value)).assertEqual(-21);
      expect(Math.floor(value)).assertEqual(-21);
      expect(Math.trunc(value)).assertEqual(-21);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0031
     * @tc.name      testExpMath0031
     * @tc.desc      Numeric rounding rules for value -20 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -20;
      expect(Math.abs(value)).assertEqual(20);
      expect(Math.ceil(value)).assertEqual(-20);
      expect(Math.floor(value)).assertEqual(-20);
      expect(Math.trunc(value)).assertEqual(-20);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0032
     * @tc.name      testExpMath0032
     * @tc.desc      Numeric rounding rules for value -19 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -19;
      expect(Math.abs(value)).assertEqual(19);
      expect(Math.ceil(value)).assertEqual(-19);
      expect(Math.floor(value)).assertEqual(-19);
      expect(Math.trunc(value)).assertEqual(-19);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0033
     * @tc.name      testExpMath0033
     * @tc.desc      Numeric rounding rules for value -18 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -18;
      expect(Math.abs(value)).assertEqual(18);
      expect(Math.ceil(value)).assertEqual(-18);
      expect(Math.floor(value)).assertEqual(-18);
      expect(Math.trunc(value)).assertEqual(-18);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0034
     * @tc.name      testExpMath0034
     * @tc.desc      Numeric rounding rules for value -17 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -17;
      expect(Math.abs(value)).assertEqual(17);
      expect(Math.ceil(value)).assertEqual(-17);
      expect(Math.floor(value)).assertEqual(-17);
      expect(Math.trunc(value)).assertEqual(-17);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0035
     * @tc.name      testExpMath0035
     * @tc.desc      Numeric rounding rules for value -16 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -16;
      expect(Math.abs(value)).assertEqual(16);
      expect(Math.ceil(value)).assertEqual(-16);
      expect(Math.floor(value)).assertEqual(-16);
      expect(Math.trunc(value)).assertEqual(-16);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0036
     * @tc.name      testExpMath0036
     * @tc.desc      Numeric rounding rules for value -15 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -15;
      expect(Math.abs(value)).assertEqual(15);
      expect(Math.ceil(value)).assertEqual(-15);
      expect(Math.floor(value)).assertEqual(-15);
      expect(Math.trunc(value)).assertEqual(-15);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0037
     * @tc.name      testExpMath0037
     * @tc.desc      Numeric rounding rules for value -14 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -14;
      expect(Math.abs(value)).assertEqual(14);
      expect(Math.ceil(value)).assertEqual(-14);
      expect(Math.floor(value)).assertEqual(-14);
      expect(Math.trunc(value)).assertEqual(-14);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0038
     * @tc.name      testExpMath0038
     * @tc.desc      Numeric rounding rules for value -13 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -13;
      expect(Math.abs(value)).assertEqual(13);
      expect(Math.ceil(value)).assertEqual(-13);
      expect(Math.floor(value)).assertEqual(-13);
      expect(Math.trunc(value)).assertEqual(-13);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0039
     * @tc.name      testExpMath0039
     * @tc.desc      Numeric rounding rules for value -12 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -12;
      expect(Math.abs(value)).assertEqual(12);
      expect(Math.ceil(value)).assertEqual(-12);
      expect(Math.floor(value)).assertEqual(-12);
      expect(Math.trunc(value)).assertEqual(-12);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0040
     * @tc.name      testExpMath0040
     * @tc.desc      Numeric rounding rules for value -11 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -11;
      expect(Math.abs(value)).assertEqual(11);
      expect(Math.ceil(value)).assertEqual(-11);
      expect(Math.floor(value)).assertEqual(-11);
      expect(Math.trunc(value)).assertEqual(-11);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0041
     * @tc.name      testExpMath0041
     * @tc.desc      Numeric rounding rules for value -10 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -10;
      expect(Math.abs(value)).assertEqual(10);
      expect(Math.ceil(value)).assertEqual(-10);
      expect(Math.floor(value)).assertEqual(-10);
      expect(Math.trunc(value)).assertEqual(-10);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0042
     * @tc.name      testExpMath0042
     * @tc.desc      Numeric rounding rules for value -9 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -9;
      expect(Math.abs(value)).assertEqual(9);
      expect(Math.ceil(value)).assertEqual(-9);
      expect(Math.floor(value)).assertEqual(-9);
      expect(Math.trunc(value)).assertEqual(-9);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0043
     * @tc.name      testExpMath0043
     * @tc.desc      Numeric rounding rules for value -8 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -8;
      expect(Math.abs(value)).assertEqual(8);
      expect(Math.ceil(value)).assertEqual(-8);
      expect(Math.floor(value)).assertEqual(-8);
      expect(Math.trunc(value)).assertEqual(-8);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0044
     * @tc.name      testExpMath0044
     * @tc.desc      Numeric rounding rules for value -7 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -7;
      expect(Math.abs(value)).assertEqual(7);
      expect(Math.ceil(value)).assertEqual(-7);
      expect(Math.floor(value)).assertEqual(-7);
      expect(Math.trunc(value)).assertEqual(-7);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0045
     * @tc.name      testExpMath0045
     * @tc.desc      Numeric rounding rules for value -6 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -6;
      expect(Math.abs(value)).assertEqual(6);
      expect(Math.ceil(value)).assertEqual(-6);
      expect(Math.floor(value)).assertEqual(-6);
      expect(Math.trunc(value)).assertEqual(-6);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0046
     * @tc.name      testExpMath0046
     * @tc.desc      Numeric rounding rules for value -5 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -5;
      expect(Math.abs(value)).assertEqual(5);
      expect(Math.ceil(value)).assertEqual(-5);
      expect(Math.floor(value)).assertEqual(-5);
      expect(Math.trunc(value)).assertEqual(-5);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0047
     * @tc.name      testExpMath0047
     * @tc.desc      Numeric rounding rules for value -4 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -4;
      expect(Math.abs(value)).assertEqual(4);
      expect(Math.ceil(value)).assertEqual(-4);
      expect(Math.floor(value)).assertEqual(-4);
      expect(Math.trunc(value)).assertEqual(-4);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0048
     * @tc.name      testExpMath0048
     * @tc.desc      Numeric rounding rules for value -3 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -3;
      expect(Math.abs(value)).assertEqual(3);
      expect(Math.ceil(value)).assertEqual(-3);
      expect(Math.floor(value)).assertEqual(-3);
      expect(Math.trunc(value)).assertEqual(-3);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0049
     * @tc.name      testExpMath0049
     * @tc.desc      Numeric rounding rules for value -2 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -2;
      expect(Math.abs(value)).assertEqual(2);
      expect(Math.ceil(value)).assertEqual(-2);
      expect(Math.floor(value)).assertEqual(-2);
      expect(Math.trunc(value)).assertEqual(-2);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0050
     * @tc.name      testExpMath0050
     * @tc.desc      Numeric rounding rules for value -1 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -1;
      expect(Math.abs(value)).assertEqual(1);
      expect(Math.ceil(value)).assertEqual(-1);
      expect(Math.floor(value)).assertEqual(-1);
      expect(Math.trunc(value)).assertEqual(-1);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0051
     * @tc.name      testExpMath0051
     * @tc.desc      Numeric rounding rules for value 0 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0;
      expect(Math.abs(value)).assertEqual(0);
      expect(Math.ceil(value)).assertEqual(0);
      expect(Math.floor(value)).assertEqual(0);
      expect(Math.trunc(value)).assertEqual(0);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0052
     * @tc.name      testExpMath0052
     * @tc.desc      Numeric rounding rules for value 1 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 1;
      expect(Math.abs(value)).assertEqual(1);
      expect(Math.ceil(value)).assertEqual(1);
      expect(Math.floor(value)).assertEqual(1);
      expect(Math.trunc(value)).assertEqual(1);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0053
     * @tc.name      testExpMath0053
     * @tc.desc      Numeric rounding rules for value 2 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 2;
      expect(Math.abs(value)).assertEqual(2);
      expect(Math.ceil(value)).assertEqual(2);
      expect(Math.floor(value)).assertEqual(2);
      expect(Math.trunc(value)).assertEqual(2);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0054
     * @tc.name      testExpMath0054
     * @tc.desc      Numeric rounding rules for value 3 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 3;
      expect(Math.abs(value)).assertEqual(3);
      expect(Math.ceil(value)).assertEqual(3);
      expect(Math.floor(value)).assertEqual(3);
      expect(Math.trunc(value)).assertEqual(3);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0055
     * @tc.name      testExpMath0055
     * @tc.desc      Numeric rounding rules for value 4 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 4;
      expect(Math.abs(value)).assertEqual(4);
      expect(Math.ceil(value)).assertEqual(4);
      expect(Math.floor(value)).assertEqual(4);
      expect(Math.trunc(value)).assertEqual(4);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0056
     * @tc.name      testExpMath0056
     * @tc.desc      Numeric rounding rules for value 5 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 5;
      expect(Math.abs(value)).assertEqual(5);
      expect(Math.ceil(value)).assertEqual(5);
      expect(Math.floor(value)).assertEqual(5);
      expect(Math.trunc(value)).assertEqual(5);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0057
     * @tc.name      testExpMath0057
     * @tc.desc      Numeric rounding rules for value 6 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 6;
      expect(Math.abs(value)).assertEqual(6);
      expect(Math.ceil(value)).assertEqual(6);
      expect(Math.floor(value)).assertEqual(6);
      expect(Math.trunc(value)).assertEqual(6);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0058
     * @tc.name      testExpMath0058
     * @tc.desc      Numeric rounding rules for value 7 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 7;
      expect(Math.abs(value)).assertEqual(7);
      expect(Math.ceil(value)).assertEqual(7);
      expect(Math.floor(value)).assertEqual(7);
      expect(Math.trunc(value)).assertEqual(7);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0059
     * @tc.name      testExpMath0059
     * @tc.desc      Numeric rounding rules for value 8 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 8;
      expect(Math.abs(value)).assertEqual(8);
      expect(Math.ceil(value)).assertEqual(8);
      expect(Math.floor(value)).assertEqual(8);
      expect(Math.trunc(value)).assertEqual(8);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0060
     * @tc.name      testExpMath0060
     * @tc.desc      Numeric rounding rules for value 9 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 9;
      expect(Math.abs(value)).assertEqual(9);
      expect(Math.ceil(value)).assertEqual(9);
      expect(Math.floor(value)).assertEqual(9);
      expect(Math.trunc(value)).assertEqual(9);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0061
     * @tc.name      testExpMath0061
     * @tc.desc      Numeric rounding rules for value 10 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 10;
      expect(Math.abs(value)).assertEqual(10);
      expect(Math.ceil(value)).assertEqual(10);
      expect(Math.floor(value)).assertEqual(10);
      expect(Math.trunc(value)).assertEqual(10);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0062
     * @tc.name      testExpMath0062
     * @tc.desc      Numeric rounding rules for value 11 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 11;
      expect(Math.abs(value)).assertEqual(11);
      expect(Math.ceil(value)).assertEqual(11);
      expect(Math.floor(value)).assertEqual(11);
      expect(Math.trunc(value)).assertEqual(11);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0063
     * @tc.name      testExpMath0063
     * @tc.desc      Numeric rounding rules for value 12 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 12;
      expect(Math.abs(value)).assertEqual(12);
      expect(Math.ceil(value)).assertEqual(12);
      expect(Math.floor(value)).assertEqual(12);
      expect(Math.trunc(value)).assertEqual(12);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0064
     * @tc.name      testExpMath0064
     * @tc.desc      Numeric rounding rules for value 13 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 13;
      expect(Math.abs(value)).assertEqual(13);
      expect(Math.ceil(value)).assertEqual(13);
      expect(Math.floor(value)).assertEqual(13);
      expect(Math.trunc(value)).assertEqual(13);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0065
     * @tc.name      testExpMath0065
     * @tc.desc      Numeric rounding rules for value 14 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 14;
      expect(Math.abs(value)).assertEqual(14);
      expect(Math.ceil(value)).assertEqual(14);
      expect(Math.floor(value)).assertEqual(14);
      expect(Math.trunc(value)).assertEqual(14);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0066
     * @tc.name      testExpMath0066
     * @tc.desc      Numeric rounding rules for value 15 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 15;
      expect(Math.abs(value)).assertEqual(15);
      expect(Math.ceil(value)).assertEqual(15);
      expect(Math.floor(value)).assertEqual(15);
      expect(Math.trunc(value)).assertEqual(15);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0067
     * @tc.name      testExpMath0067
     * @tc.desc      Numeric rounding rules for value 16 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 16;
      expect(Math.abs(value)).assertEqual(16);
      expect(Math.ceil(value)).assertEqual(16);
      expect(Math.floor(value)).assertEqual(16);
      expect(Math.trunc(value)).assertEqual(16);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0068
     * @tc.name      testExpMath0068
     * @tc.desc      Numeric rounding rules for value 17 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 17;
      expect(Math.abs(value)).assertEqual(17);
      expect(Math.ceil(value)).assertEqual(17);
      expect(Math.floor(value)).assertEqual(17);
      expect(Math.trunc(value)).assertEqual(17);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0069
     * @tc.name      testExpMath0069
     * @tc.desc      Numeric rounding rules for value 18 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 18;
      expect(Math.abs(value)).assertEqual(18);
      expect(Math.ceil(value)).assertEqual(18);
      expect(Math.floor(value)).assertEqual(18);
      expect(Math.trunc(value)).assertEqual(18);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0070
     * @tc.name      testExpMath0070
     * @tc.desc      Numeric rounding rules for value 19 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 19;
      expect(Math.abs(value)).assertEqual(19);
      expect(Math.ceil(value)).assertEqual(19);
      expect(Math.floor(value)).assertEqual(19);
      expect(Math.trunc(value)).assertEqual(19);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0071
     * @tc.name      testExpMath0071
     * @tc.desc      Numeric rounding rules for value 20 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 20;
      expect(Math.abs(value)).assertEqual(20);
      expect(Math.ceil(value)).assertEqual(20);
      expect(Math.floor(value)).assertEqual(20);
      expect(Math.trunc(value)).assertEqual(20);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0072
     * @tc.name      testExpMath0072
     * @tc.desc      Numeric rounding rules for value 21 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 21;
      expect(Math.abs(value)).assertEqual(21);
      expect(Math.ceil(value)).assertEqual(21);
      expect(Math.floor(value)).assertEqual(21);
      expect(Math.trunc(value)).assertEqual(21);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0073
     * @tc.name      testExpMath0073
     * @tc.desc      Numeric rounding rules for value 22 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 22;
      expect(Math.abs(value)).assertEqual(22);
      expect(Math.ceil(value)).assertEqual(22);
      expect(Math.floor(value)).assertEqual(22);
      expect(Math.trunc(value)).assertEqual(22);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0074
     * @tc.name      testExpMath0074
     * @tc.desc      Numeric rounding rules for value 23 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 23;
      expect(Math.abs(value)).assertEqual(23);
      expect(Math.ceil(value)).assertEqual(23);
      expect(Math.floor(value)).assertEqual(23);
      expect(Math.trunc(value)).assertEqual(23);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0075
     * @tc.name      testExpMath0075
     * @tc.desc      Numeric rounding rules for value 24 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 24;
      expect(Math.abs(value)).assertEqual(24);
      expect(Math.ceil(value)).assertEqual(24);
      expect(Math.floor(value)).assertEqual(24);
      expect(Math.trunc(value)).assertEqual(24);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0076
     * @tc.name      testExpMath0076
     * @tc.desc      Numeric rounding rules for value 25 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 25;
      expect(Math.abs(value)).assertEqual(25);
      expect(Math.ceil(value)).assertEqual(25);
      expect(Math.floor(value)).assertEqual(25);
      expect(Math.trunc(value)).assertEqual(25);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0077
     * @tc.name      testExpMath0077
     * @tc.desc      Numeric rounding rules for value 26 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 26;
      expect(Math.abs(value)).assertEqual(26);
      expect(Math.ceil(value)).assertEqual(26);
      expect(Math.floor(value)).assertEqual(26);
      expect(Math.trunc(value)).assertEqual(26);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0078
     * @tc.name      testExpMath0078
     * @tc.desc      Numeric rounding rules for value 27 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 27;
      expect(Math.abs(value)).assertEqual(27);
      expect(Math.ceil(value)).assertEqual(27);
      expect(Math.floor(value)).assertEqual(27);
      expect(Math.trunc(value)).assertEqual(27);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0079
     * @tc.name      testExpMath0079
     * @tc.desc      Numeric rounding rules for value 28 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 28;
      expect(Math.abs(value)).assertEqual(28);
      expect(Math.ceil(value)).assertEqual(28);
      expect(Math.floor(value)).assertEqual(28);
      expect(Math.trunc(value)).assertEqual(28);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0080
     * @tc.name      testExpMath0080
     * @tc.desc      Numeric rounding rules for value 29 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 29;
      expect(Math.abs(value)).assertEqual(29);
      expect(Math.ceil(value)).assertEqual(29);
      expect(Math.floor(value)).assertEqual(29);
      expect(Math.trunc(value)).assertEqual(29);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0081
     * @tc.name      testExpMath0081
     * @tc.desc      Numeric rounding rules for value 30 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 30;
      expect(Math.abs(value)).assertEqual(30);
      expect(Math.ceil(value)).assertEqual(30);
      expect(Math.floor(value)).assertEqual(30);
      expect(Math.trunc(value)).assertEqual(30);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0082
     * @tc.name      testExpMath0082
     * @tc.desc      Numeric rounding rules for value 31 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 31;
      expect(Math.abs(value)).assertEqual(31);
      expect(Math.ceil(value)).assertEqual(31);
      expect(Math.floor(value)).assertEqual(31);
      expect(Math.trunc(value)).assertEqual(31);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0083
     * @tc.name      testExpMath0083
     * @tc.desc      Numeric rounding rules for value 32 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 32;
      expect(Math.abs(value)).assertEqual(32);
      expect(Math.ceil(value)).assertEqual(32);
      expect(Math.floor(value)).assertEqual(32);
      expect(Math.trunc(value)).assertEqual(32);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0084
     * @tc.name      testExpMath0084
     * @tc.desc      Numeric rounding rules for value 33 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 33;
      expect(Math.abs(value)).assertEqual(33);
      expect(Math.ceil(value)).assertEqual(33);
      expect(Math.floor(value)).assertEqual(33);
      expect(Math.trunc(value)).assertEqual(33);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0085
     * @tc.name      testExpMath0085
     * @tc.desc      Numeric rounding rules for value 34 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 34;
      expect(Math.abs(value)).assertEqual(34);
      expect(Math.ceil(value)).assertEqual(34);
      expect(Math.floor(value)).assertEqual(34);
      expect(Math.trunc(value)).assertEqual(34);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0086
     * @tc.name      testExpMath0086
     * @tc.desc      Numeric rounding rules for value 35 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 35;
      expect(Math.abs(value)).assertEqual(35);
      expect(Math.ceil(value)).assertEqual(35);
      expect(Math.floor(value)).assertEqual(35);
      expect(Math.trunc(value)).assertEqual(35);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0087
     * @tc.name      testExpMath0087
     * @tc.desc      Numeric rounding rules for value 36 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 36;
      expect(Math.abs(value)).assertEqual(36);
      expect(Math.ceil(value)).assertEqual(36);
      expect(Math.floor(value)).assertEqual(36);
      expect(Math.trunc(value)).assertEqual(36);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0088
     * @tc.name      testExpMath0088
     * @tc.desc      Numeric rounding rules for value 37 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 37;
      expect(Math.abs(value)).assertEqual(37);
      expect(Math.ceil(value)).assertEqual(37);
      expect(Math.floor(value)).assertEqual(37);
      expect(Math.trunc(value)).assertEqual(37);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0089
     * @tc.name      testExpMath0089
     * @tc.desc      Numeric rounding rules for value 38 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 38;
      expect(Math.abs(value)).assertEqual(38);
      expect(Math.ceil(value)).assertEqual(38);
      expect(Math.floor(value)).assertEqual(38);
      expect(Math.trunc(value)).assertEqual(38);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0090
     * @tc.name      testExpMath0090
     * @tc.desc      Numeric rounding rules for value 39 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 39;
      expect(Math.abs(value)).assertEqual(39);
      expect(Math.ceil(value)).assertEqual(39);
      expect(Math.floor(value)).assertEqual(39);
      expect(Math.trunc(value)).assertEqual(39);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0091
     * @tc.name      testExpMath0091
     * @tc.desc      Numeric rounding rules for value 40 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 40;
      expect(Math.abs(value)).assertEqual(40);
      expect(Math.ceil(value)).assertEqual(40);
      expect(Math.floor(value)).assertEqual(40);
      expect(Math.trunc(value)).assertEqual(40);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0092
     * @tc.name      testExpMath0092
     * @tc.desc      Numeric rounding rules for value 41 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 41;
      expect(Math.abs(value)).assertEqual(41);
      expect(Math.ceil(value)).assertEqual(41);
      expect(Math.floor(value)).assertEqual(41);
      expect(Math.trunc(value)).assertEqual(41);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0093
     * @tc.name      testExpMath0093
     * @tc.desc      Numeric rounding rules for value 42 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 42;
      expect(Math.abs(value)).assertEqual(42);
      expect(Math.ceil(value)).assertEqual(42);
      expect(Math.floor(value)).assertEqual(42);
      expect(Math.trunc(value)).assertEqual(42);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0094
     * @tc.name      testExpMath0094
     * @tc.desc      Numeric rounding rules for value 43 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 43;
      expect(Math.abs(value)).assertEqual(43);
      expect(Math.ceil(value)).assertEqual(43);
      expect(Math.floor(value)).assertEqual(43);
      expect(Math.trunc(value)).assertEqual(43);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0095
     * @tc.name      testExpMath0095
     * @tc.desc      Numeric rounding rules for value 44 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 44;
      expect(Math.abs(value)).assertEqual(44);
      expect(Math.ceil(value)).assertEqual(44);
      expect(Math.floor(value)).assertEqual(44);
      expect(Math.trunc(value)).assertEqual(44);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0096
     * @tc.name      testExpMath0096
     * @tc.desc      Numeric rounding rules for value 45 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 45;
      expect(Math.abs(value)).assertEqual(45);
      expect(Math.ceil(value)).assertEqual(45);
      expect(Math.floor(value)).assertEqual(45);
      expect(Math.trunc(value)).assertEqual(45);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0097
     * @tc.name      testExpMath0097
     * @tc.desc      Numeric rounding rules for value 46 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 46;
      expect(Math.abs(value)).assertEqual(46);
      expect(Math.ceil(value)).assertEqual(46);
      expect(Math.floor(value)).assertEqual(46);
      expect(Math.trunc(value)).assertEqual(46);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0098
     * @tc.name      testExpMath0098
     * @tc.desc      Numeric rounding rules for value 47 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 47;
      expect(Math.abs(value)).assertEqual(47);
      expect(Math.ceil(value)).assertEqual(47);
      expect(Math.floor(value)).assertEqual(47);
      expect(Math.trunc(value)).assertEqual(47);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0099
     * @tc.name      testExpMath0099
     * @tc.desc      Numeric rounding rules for value 48 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 48;
      expect(Math.abs(value)).assertEqual(48);
      expect(Math.ceil(value)).assertEqual(48);
      expect(Math.floor(value)).assertEqual(48);
      expect(Math.trunc(value)).assertEqual(48);
      expect(value <= Math.ceil(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_MATH_0100
     * @tc.name      testExpMath0100
     * @tc.desc      Numeric rounding rules for value 49 are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpMath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 49;
      expect(Math.abs(value)).assertEqual(49);
      expect(Math.ceil(value)).assertEqual(49);
      expect(Math.floor(value)).assertEqual(49);
      expect(Math.trunc(value)).assertEqual(49);
      expect(value <= Math.ceil(value)).assertTrue();
    })
  })
}
