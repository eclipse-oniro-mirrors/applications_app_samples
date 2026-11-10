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

export default function numericExpandedTest() {
  describe('numericExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0001
     * @tc.name      testExpNumber0001
     * @tc.desc      Numeric formatting of -50 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -50;
      expect(value.toString()).assertEqual('-50');
      expect(value.toFixed(0)).assertEqual('-50');
      expect(value.toString(16)).assertEqual('-32');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0002
     * @tc.name      testExpNumber0002
     * @tc.desc      Numeric formatting of -49 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -49;
      expect(value.toString()).assertEqual('-49');
      expect(value.toFixed(0)).assertEqual('-49');
      expect(value.toString(16)).assertEqual('-31');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0003
     * @tc.name      testExpNumber0003
     * @tc.desc      Numeric formatting of -48 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -48;
      expect(value.toString()).assertEqual('-48');
      expect(value.toFixed(0)).assertEqual('-48');
      expect(value.toString(16)).assertEqual('-30');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0004
     * @tc.name      testExpNumber0004
     * @tc.desc      Numeric formatting of -47 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -47;
      expect(value.toString()).assertEqual('-47');
      expect(value.toFixed(0)).assertEqual('-47');
      expect(value.toString(16)).assertEqual('-2f');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0005
     * @tc.name      testExpNumber0005
     * @tc.desc      Numeric formatting of -46 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -46;
      expect(value.toString()).assertEqual('-46');
      expect(value.toFixed(0)).assertEqual('-46');
      expect(value.toString(16)).assertEqual('-2e');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0006
     * @tc.name      testExpNumber0006
     * @tc.desc      Numeric formatting of -45 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -45;
      expect(value.toString()).assertEqual('-45');
      expect(value.toFixed(0)).assertEqual('-45');
      expect(value.toString(16)).assertEqual('-2d');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0007
     * @tc.name      testExpNumber0007
     * @tc.desc      Numeric formatting of -44 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -44;
      expect(value.toString()).assertEqual('-44');
      expect(value.toFixed(0)).assertEqual('-44');
      expect(value.toString(16)).assertEqual('-2c');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0008
     * @tc.name      testExpNumber0008
     * @tc.desc      Numeric formatting of -43 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -43;
      expect(value.toString()).assertEqual('-43');
      expect(value.toFixed(0)).assertEqual('-43');
      expect(value.toString(16)).assertEqual('-2b');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0009
     * @tc.name      testExpNumber0009
     * @tc.desc      Numeric formatting of -42 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -42;
      expect(value.toString()).assertEqual('-42');
      expect(value.toFixed(0)).assertEqual('-42');
      expect(value.toString(16)).assertEqual('-2a');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0010
     * @tc.name      testExpNumber0010
     * @tc.desc      Numeric formatting of -41 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -41;
      expect(value.toString()).assertEqual('-41');
      expect(value.toFixed(0)).assertEqual('-41');
      expect(value.toString(16)).assertEqual('-29');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0011
     * @tc.name      testExpNumber0011
     * @tc.desc      Numeric formatting of -40 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -40;
      expect(value.toString()).assertEqual('-40');
      expect(value.toFixed(0)).assertEqual('-40');
      expect(value.toString(16)).assertEqual('-28');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0012
     * @tc.name      testExpNumber0012
     * @tc.desc      Numeric formatting of -39 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -39;
      expect(value.toString()).assertEqual('-39');
      expect(value.toFixed(0)).assertEqual('-39');
      expect(value.toString(16)).assertEqual('-27');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0013
     * @tc.name      testExpNumber0013
     * @tc.desc      Numeric formatting of -38 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -38;
      expect(value.toString()).assertEqual('-38');
      expect(value.toFixed(0)).assertEqual('-38');
      expect(value.toString(16)).assertEqual('-26');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0014
     * @tc.name      testExpNumber0014
     * @tc.desc      Numeric formatting of -37 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -37;
      expect(value.toString()).assertEqual('-37');
      expect(value.toFixed(0)).assertEqual('-37');
      expect(value.toString(16)).assertEqual('-25');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0015
     * @tc.name      testExpNumber0015
     * @tc.desc      Numeric formatting of -36 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -36;
      expect(value.toString()).assertEqual('-36');
      expect(value.toFixed(0)).assertEqual('-36');
      expect(value.toString(16)).assertEqual('-24');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0016
     * @tc.name      testExpNumber0016
     * @tc.desc      Numeric formatting of -35 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -35;
      expect(value.toString()).assertEqual('-35');
      expect(value.toFixed(0)).assertEqual('-35');
      expect(value.toString(16)).assertEqual('-23');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0017
     * @tc.name      testExpNumber0017
     * @tc.desc      Numeric formatting of -34 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -34;
      expect(value.toString()).assertEqual('-34');
      expect(value.toFixed(0)).assertEqual('-34');
      expect(value.toString(16)).assertEqual('-22');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0018
     * @tc.name      testExpNumber0018
     * @tc.desc      Numeric formatting of -33 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -33;
      expect(value.toString()).assertEqual('-33');
      expect(value.toFixed(0)).assertEqual('-33');
      expect(value.toString(16)).assertEqual('-21');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0019
     * @tc.name      testExpNumber0019
     * @tc.desc      Numeric formatting of -32 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -32;
      expect(value.toString()).assertEqual('-32');
      expect(value.toFixed(0)).assertEqual('-32');
      expect(value.toString(16)).assertEqual('-20');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0020
     * @tc.name      testExpNumber0020
     * @tc.desc      Numeric formatting of -31 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -31;
      expect(value.toString()).assertEqual('-31');
      expect(value.toFixed(0)).assertEqual('-31');
      expect(value.toString(16)).assertEqual('-1f');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0021
     * @tc.name      testExpNumber0021
     * @tc.desc      Numeric formatting of -30 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -30;
      expect(value.toString()).assertEqual('-30');
      expect(value.toFixed(0)).assertEqual('-30');
      expect(value.toString(16)).assertEqual('-1e');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0022
     * @tc.name      testExpNumber0022
     * @tc.desc      Numeric formatting of -29 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -29;
      expect(value.toString()).assertEqual('-29');
      expect(value.toFixed(0)).assertEqual('-29');
      expect(value.toString(16)).assertEqual('-1d');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0023
     * @tc.name      testExpNumber0023
     * @tc.desc      Numeric formatting of -28 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -28;
      expect(value.toString()).assertEqual('-28');
      expect(value.toFixed(0)).assertEqual('-28');
      expect(value.toString(16)).assertEqual('-1c');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0024
     * @tc.name      testExpNumber0024
     * @tc.desc      Numeric formatting of -27 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -27;
      expect(value.toString()).assertEqual('-27');
      expect(value.toFixed(0)).assertEqual('-27');
      expect(value.toString(16)).assertEqual('-1b');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0025
     * @tc.name      testExpNumber0025
     * @tc.desc      Numeric formatting of -26 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -26;
      expect(value.toString()).assertEqual('-26');
      expect(value.toFixed(0)).assertEqual('-26');
      expect(value.toString(16)).assertEqual('-1a');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0026
     * @tc.name      testExpNumber0026
     * @tc.desc      Numeric formatting of -25 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -25;
      expect(value.toString()).assertEqual('-25');
      expect(value.toFixed(0)).assertEqual('-25');
      expect(value.toString(16)).assertEqual('-19');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0027
     * @tc.name      testExpNumber0027
     * @tc.desc      Numeric formatting of -24 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -24;
      expect(value.toString()).assertEqual('-24');
      expect(value.toFixed(0)).assertEqual('-24');
      expect(value.toString(16)).assertEqual('-18');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0028
     * @tc.name      testExpNumber0028
     * @tc.desc      Numeric formatting of -23 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -23;
      expect(value.toString()).assertEqual('-23');
      expect(value.toFixed(0)).assertEqual('-23');
      expect(value.toString(16)).assertEqual('-17');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0029
     * @tc.name      testExpNumber0029
     * @tc.desc      Numeric formatting of -22 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -22;
      expect(value.toString()).assertEqual('-22');
      expect(value.toFixed(0)).assertEqual('-22');
      expect(value.toString(16)).assertEqual('-16');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0030
     * @tc.name      testExpNumber0030
     * @tc.desc      Numeric formatting of -21 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -21;
      expect(value.toString()).assertEqual('-21');
      expect(value.toFixed(0)).assertEqual('-21');
      expect(value.toString(16)).assertEqual('-15');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0031
     * @tc.name      testExpNumber0031
     * @tc.desc      Numeric formatting of -20 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -20;
      expect(value.toString()).assertEqual('-20');
      expect(value.toFixed(0)).assertEqual('-20');
      expect(value.toString(16)).assertEqual('-14');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0032
     * @tc.name      testExpNumber0032
     * @tc.desc      Numeric formatting of -19 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -19;
      expect(value.toString()).assertEqual('-19');
      expect(value.toFixed(0)).assertEqual('-19');
      expect(value.toString(16)).assertEqual('-13');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0033
     * @tc.name      testExpNumber0033
     * @tc.desc      Numeric formatting of -18 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -18;
      expect(value.toString()).assertEqual('-18');
      expect(value.toFixed(0)).assertEqual('-18');
      expect(value.toString(16)).assertEqual('-12');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0034
     * @tc.name      testExpNumber0034
     * @tc.desc      Numeric formatting of -17 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -17;
      expect(value.toString()).assertEqual('-17');
      expect(value.toFixed(0)).assertEqual('-17');
      expect(value.toString(16)).assertEqual('-11');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0035
     * @tc.name      testExpNumber0035
     * @tc.desc      Numeric formatting of -16 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -16;
      expect(value.toString()).assertEqual('-16');
      expect(value.toFixed(0)).assertEqual('-16');
      expect(value.toString(16)).assertEqual('-10');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0036
     * @tc.name      testExpNumber0036
     * @tc.desc      Numeric formatting of -15 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -15;
      expect(value.toString()).assertEqual('-15');
      expect(value.toFixed(0)).assertEqual('-15');
      expect(value.toString(16)).assertEqual('-f');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0037
     * @tc.name      testExpNumber0037
     * @tc.desc      Numeric formatting of -14 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -14;
      expect(value.toString()).assertEqual('-14');
      expect(value.toFixed(0)).assertEqual('-14');
      expect(value.toString(16)).assertEqual('-e');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0038
     * @tc.name      testExpNumber0038
     * @tc.desc      Numeric formatting of -13 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -13;
      expect(value.toString()).assertEqual('-13');
      expect(value.toFixed(0)).assertEqual('-13');
      expect(value.toString(16)).assertEqual('-d');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0039
     * @tc.name      testExpNumber0039
     * @tc.desc      Numeric formatting of -12 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -12;
      expect(value.toString()).assertEqual('-12');
      expect(value.toFixed(0)).assertEqual('-12');
      expect(value.toString(16)).assertEqual('-c');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0040
     * @tc.name      testExpNumber0040
     * @tc.desc      Numeric formatting of -11 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -11;
      expect(value.toString()).assertEqual('-11');
      expect(value.toFixed(0)).assertEqual('-11');
      expect(value.toString(16)).assertEqual('-b');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0041
     * @tc.name      testExpNumber0041
     * @tc.desc      Numeric formatting of -10 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -10;
      expect(value.toString()).assertEqual('-10');
      expect(value.toFixed(0)).assertEqual('-10');
      expect(value.toString(16)).assertEqual('-a');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0042
     * @tc.name      testExpNumber0042
     * @tc.desc      Numeric formatting of -9 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -9;
      expect(value.toString()).assertEqual('-9');
      expect(value.toFixed(0)).assertEqual('-9');
      expect(value.toString(16)).assertEqual('-9');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0043
     * @tc.name      testExpNumber0043
     * @tc.desc      Numeric formatting of -8 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -8;
      expect(value.toString()).assertEqual('-8');
      expect(value.toFixed(0)).assertEqual('-8');
      expect(value.toString(16)).assertEqual('-8');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0044
     * @tc.name      testExpNumber0044
     * @tc.desc      Numeric formatting of -7 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -7;
      expect(value.toString()).assertEqual('-7');
      expect(value.toFixed(0)).assertEqual('-7');
      expect(value.toString(16)).assertEqual('-7');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0045
     * @tc.name      testExpNumber0045
     * @tc.desc      Numeric formatting of -6 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -6;
      expect(value.toString()).assertEqual('-6');
      expect(value.toFixed(0)).assertEqual('-6');
      expect(value.toString(16)).assertEqual('-6');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0046
     * @tc.name      testExpNumber0046
     * @tc.desc      Numeric formatting of -5 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -5;
      expect(value.toString()).assertEqual('-5');
      expect(value.toFixed(0)).assertEqual('-5');
      expect(value.toString(16)).assertEqual('-5');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0047
     * @tc.name      testExpNumber0047
     * @tc.desc      Numeric formatting of -4 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -4;
      expect(value.toString()).assertEqual('-4');
      expect(value.toFixed(0)).assertEqual('-4');
      expect(value.toString(16)).assertEqual('-4');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0048
     * @tc.name      testExpNumber0048
     * @tc.desc      Numeric formatting of -3 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -3;
      expect(value.toString()).assertEqual('-3');
      expect(value.toFixed(0)).assertEqual('-3');
      expect(value.toString(16)).assertEqual('-3');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0049
     * @tc.name      testExpNumber0049
     * @tc.desc      Numeric formatting of -2 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -2;
      expect(value.toString()).assertEqual('-2');
      expect(value.toFixed(0)).assertEqual('-2');
      expect(value.toString(16)).assertEqual('-2');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0050
     * @tc.name      testExpNumber0050
     * @tc.desc      Numeric formatting of -1 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = -1;
      expect(value.toString()).assertEqual('-1');
      expect(value.toFixed(0)).assertEqual('-1');
      expect(value.toString(16)).assertEqual('-1');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0051
     * @tc.name      testExpNumber0051
     * @tc.desc      Numeric formatting of 0 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0;
      expect(value.toString()).assertEqual('0');
      expect(value.toFixed(0)).assertEqual('0');
      expect(value.toString(16)).assertEqual('0');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0052
     * @tc.name      testExpNumber0052
     * @tc.desc      Numeric formatting of 1 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 1;
      expect(value.toString()).assertEqual('1');
      expect(value.toFixed(0)).assertEqual('1');
      expect(value.toString(16)).assertEqual('1');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0053
     * @tc.name      testExpNumber0053
     * @tc.desc      Numeric formatting of 2 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 2;
      expect(value.toString()).assertEqual('2');
      expect(value.toFixed(0)).assertEqual('2');
      expect(value.toString(16)).assertEqual('2');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0054
     * @tc.name      testExpNumber0054
     * @tc.desc      Numeric formatting of 3 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 3;
      expect(value.toString()).assertEqual('3');
      expect(value.toFixed(0)).assertEqual('3');
      expect(value.toString(16)).assertEqual('3');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0055
     * @tc.name      testExpNumber0055
     * @tc.desc      Numeric formatting of 4 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 4;
      expect(value.toString()).assertEqual('4');
      expect(value.toFixed(0)).assertEqual('4');
      expect(value.toString(16)).assertEqual('4');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0056
     * @tc.name      testExpNumber0056
     * @tc.desc      Numeric formatting of 5 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 5;
      expect(value.toString()).assertEqual('5');
      expect(value.toFixed(0)).assertEqual('5');
      expect(value.toString(16)).assertEqual('5');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0057
     * @tc.name      testExpNumber0057
     * @tc.desc      Numeric formatting of 6 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 6;
      expect(value.toString()).assertEqual('6');
      expect(value.toFixed(0)).assertEqual('6');
      expect(value.toString(16)).assertEqual('6');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0058
     * @tc.name      testExpNumber0058
     * @tc.desc      Numeric formatting of 7 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 7;
      expect(value.toString()).assertEqual('7');
      expect(value.toFixed(0)).assertEqual('7');
      expect(value.toString(16)).assertEqual('7');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0059
     * @tc.name      testExpNumber0059
     * @tc.desc      Numeric formatting of 8 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 8;
      expect(value.toString()).assertEqual('8');
      expect(value.toFixed(0)).assertEqual('8');
      expect(value.toString(16)).assertEqual('8');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0060
     * @tc.name      testExpNumber0060
     * @tc.desc      Numeric formatting of 9 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 9;
      expect(value.toString()).assertEqual('9');
      expect(value.toFixed(0)).assertEqual('9');
      expect(value.toString(16)).assertEqual('9');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0061
     * @tc.name      testExpNumber0061
     * @tc.desc      Numeric formatting of 10 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 10;
      expect(value.toString()).assertEqual('10');
      expect(value.toFixed(0)).assertEqual('10');
      expect(value.toString(16)).assertEqual('a');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0062
     * @tc.name      testExpNumber0062
     * @tc.desc      Numeric formatting of 11 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 11;
      expect(value.toString()).assertEqual('11');
      expect(value.toFixed(0)).assertEqual('11');
      expect(value.toString(16)).assertEqual('b');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0063
     * @tc.name      testExpNumber0063
     * @tc.desc      Numeric formatting of 12 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 12;
      expect(value.toString()).assertEqual('12');
      expect(value.toFixed(0)).assertEqual('12');
      expect(value.toString(16)).assertEqual('c');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0064
     * @tc.name      testExpNumber0064
     * @tc.desc      Numeric formatting of 13 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 13;
      expect(value.toString()).assertEqual('13');
      expect(value.toFixed(0)).assertEqual('13');
      expect(value.toString(16)).assertEqual('d');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0065
     * @tc.name      testExpNumber0065
     * @tc.desc      Numeric formatting of 14 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 14;
      expect(value.toString()).assertEqual('14');
      expect(value.toFixed(0)).assertEqual('14');
      expect(value.toString(16)).assertEqual('e');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0066
     * @tc.name      testExpNumber0066
     * @tc.desc      Numeric formatting of 15 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 15;
      expect(value.toString()).assertEqual('15');
      expect(value.toFixed(0)).assertEqual('15');
      expect(value.toString(16)).assertEqual('f');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0067
     * @tc.name      testExpNumber0067
     * @tc.desc      Numeric formatting of 16 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 16;
      expect(value.toString()).assertEqual('16');
      expect(value.toFixed(0)).assertEqual('16');
      expect(value.toString(16)).assertEqual('10');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0068
     * @tc.name      testExpNumber0068
     * @tc.desc      Numeric formatting of 17 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 17;
      expect(value.toString()).assertEqual('17');
      expect(value.toFixed(0)).assertEqual('17');
      expect(value.toString(16)).assertEqual('11');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0069
     * @tc.name      testExpNumber0069
     * @tc.desc      Numeric formatting of 18 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 18;
      expect(value.toString()).assertEqual('18');
      expect(value.toFixed(0)).assertEqual('18');
      expect(value.toString(16)).assertEqual('12');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0070
     * @tc.name      testExpNumber0070
     * @tc.desc      Numeric formatting of 19 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 19;
      expect(value.toString()).assertEqual('19');
      expect(value.toFixed(0)).assertEqual('19');
      expect(value.toString(16)).assertEqual('13');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0071
     * @tc.name      testExpNumber0071
     * @tc.desc      Numeric formatting of 20 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 20;
      expect(value.toString()).assertEqual('20');
      expect(value.toFixed(0)).assertEqual('20');
      expect(value.toString(16)).assertEqual('14');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0072
     * @tc.name      testExpNumber0072
     * @tc.desc      Numeric formatting of 21 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 21;
      expect(value.toString()).assertEqual('21');
      expect(value.toFixed(0)).assertEqual('21');
      expect(value.toString(16)).assertEqual('15');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0073
     * @tc.name      testExpNumber0073
     * @tc.desc      Numeric formatting of 22 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 22;
      expect(value.toString()).assertEqual('22');
      expect(value.toFixed(0)).assertEqual('22');
      expect(value.toString(16)).assertEqual('16');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0074
     * @tc.name      testExpNumber0074
     * @tc.desc      Numeric formatting of 23 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 23;
      expect(value.toString()).assertEqual('23');
      expect(value.toFixed(0)).assertEqual('23');
      expect(value.toString(16)).assertEqual('17');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0075
     * @tc.name      testExpNumber0075
     * @tc.desc      Numeric formatting of 24 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 24;
      expect(value.toString()).assertEqual('24');
      expect(value.toFixed(0)).assertEqual('24');
      expect(value.toString(16)).assertEqual('18');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0076
     * @tc.name      testExpNumber0076
     * @tc.desc      Numeric formatting of 25 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 25;
      expect(value.toString()).assertEqual('25');
      expect(value.toFixed(0)).assertEqual('25');
      expect(value.toString(16)).assertEqual('19');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0077
     * @tc.name      testExpNumber0077
     * @tc.desc      Numeric formatting of 26 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 26;
      expect(value.toString()).assertEqual('26');
      expect(value.toFixed(0)).assertEqual('26');
      expect(value.toString(16)).assertEqual('1a');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0078
     * @tc.name      testExpNumber0078
     * @tc.desc      Numeric formatting of 27 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 27;
      expect(value.toString()).assertEqual('27');
      expect(value.toFixed(0)).assertEqual('27');
      expect(value.toString(16)).assertEqual('1b');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0079
     * @tc.name      testExpNumber0079
     * @tc.desc      Numeric formatting of 28 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 28;
      expect(value.toString()).assertEqual('28');
      expect(value.toFixed(0)).assertEqual('28');
      expect(value.toString(16)).assertEqual('1c');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0080
     * @tc.name      testExpNumber0080
     * @tc.desc      Numeric formatting of 29 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 29;
      expect(value.toString()).assertEqual('29');
      expect(value.toFixed(0)).assertEqual('29');
      expect(value.toString(16)).assertEqual('1d');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0081
     * @tc.name      testExpNumber0081
     * @tc.desc      Numeric formatting of 30 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 30;
      expect(value.toString()).assertEqual('30');
      expect(value.toFixed(0)).assertEqual('30');
      expect(value.toString(16)).assertEqual('1e');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0082
     * @tc.name      testExpNumber0082
     * @tc.desc      Numeric formatting of 31 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 31;
      expect(value.toString()).assertEqual('31');
      expect(value.toFixed(0)).assertEqual('31');
      expect(value.toString(16)).assertEqual('1f');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0083
     * @tc.name      testExpNumber0083
     * @tc.desc      Numeric formatting of 32 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 32;
      expect(value.toString()).assertEqual('32');
      expect(value.toFixed(0)).assertEqual('32');
      expect(value.toString(16)).assertEqual('20');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0084
     * @tc.name      testExpNumber0084
     * @tc.desc      Numeric formatting of 33 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 33;
      expect(value.toString()).assertEqual('33');
      expect(value.toFixed(0)).assertEqual('33');
      expect(value.toString(16)).assertEqual('21');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0085
     * @tc.name      testExpNumber0085
     * @tc.desc      Numeric formatting of 34 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 34;
      expect(value.toString()).assertEqual('34');
      expect(value.toFixed(0)).assertEqual('34');
      expect(value.toString(16)).assertEqual('22');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0086
     * @tc.name      testExpNumber0086
     * @tc.desc      Numeric formatting of 35 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 35;
      expect(value.toString()).assertEqual('35');
      expect(value.toFixed(0)).assertEqual('35');
      expect(value.toString(16)).assertEqual('23');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0087
     * @tc.name      testExpNumber0087
     * @tc.desc      Numeric formatting of 36 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 36;
      expect(value.toString()).assertEqual('36');
      expect(value.toFixed(0)).assertEqual('36');
      expect(value.toString(16)).assertEqual('24');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0088
     * @tc.name      testExpNumber0088
     * @tc.desc      Numeric formatting of 37 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 37;
      expect(value.toString()).assertEqual('37');
      expect(value.toFixed(0)).assertEqual('37');
      expect(value.toString(16)).assertEqual('25');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0089
     * @tc.name      testExpNumber0089
     * @tc.desc      Numeric formatting of 38 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 38;
      expect(value.toString()).assertEqual('38');
      expect(value.toFixed(0)).assertEqual('38');
      expect(value.toString(16)).assertEqual('26');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0090
     * @tc.name      testExpNumber0090
     * @tc.desc      Numeric formatting of 39 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 39;
      expect(value.toString()).assertEqual('39');
      expect(value.toFixed(0)).assertEqual('39');
      expect(value.toString(16)).assertEqual('27');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0091
     * @tc.name      testExpNumber0091
     * @tc.desc      Numeric formatting of 40 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 40;
      expect(value.toString()).assertEqual('40');
      expect(value.toFixed(0)).assertEqual('40');
      expect(value.toString(16)).assertEqual('28');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0092
     * @tc.name      testExpNumber0092
     * @tc.desc      Numeric formatting of 41 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 41;
      expect(value.toString()).assertEqual('41');
      expect(value.toFixed(0)).assertEqual('41');
      expect(value.toString(16)).assertEqual('29');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0093
     * @tc.name      testExpNumber0093
     * @tc.desc      Numeric formatting of 42 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 42;
      expect(value.toString()).assertEqual('42');
      expect(value.toFixed(0)).assertEqual('42');
      expect(value.toString(16)).assertEqual('2a');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0094
     * @tc.name      testExpNumber0094
     * @tc.desc      Numeric formatting of 43 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 43;
      expect(value.toString()).assertEqual('43');
      expect(value.toFixed(0)).assertEqual('43');
      expect(value.toString(16)).assertEqual('2b');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0095
     * @tc.name      testExpNumber0095
     * @tc.desc      Numeric formatting of 44 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 44;
      expect(value.toString()).assertEqual('44');
      expect(value.toFixed(0)).assertEqual('44');
      expect(value.toString(16)).assertEqual('2c');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0096
     * @tc.name      testExpNumber0096
     * @tc.desc      Numeric formatting of 45 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 45;
      expect(value.toString()).assertEqual('45');
      expect(value.toFixed(0)).assertEqual('45');
      expect(value.toString(16)).assertEqual('2d');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0097
     * @tc.name      testExpNumber0097
     * @tc.desc      Numeric formatting of 46 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 46;
      expect(value.toString()).assertEqual('46');
      expect(value.toFixed(0)).assertEqual('46');
      expect(value.toString(16)).assertEqual('2e');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0098
     * @tc.name      testExpNumber0098
     * @tc.desc      Numeric formatting of 47 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 47;
      expect(value.toString()).assertEqual('47');
      expect(value.toFixed(0)).assertEqual('47');
      expect(value.toString(16)).assertEqual('2f');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0099
     * @tc.name      testExpNumber0099
     * @tc.desc      Numeric formatting of 48 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 48;
      expect(value.toString()).assertEqual('48');
      expect(value.toFixed(0)).assertEqual('48');
      expect(value.toString(16)).assertEqual('30');
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_NUM_0100
     * @tc.name      testExpNumber0100
     * @tc.desc      Numeric formatting of 49 keeps decimal and hexadecimal forms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpNumber0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 49;
      expect(value.toString()).assertEqual('49');
      expect(value.toFixed(0)).assertEqual('49');
      expect(value.toString(16)).assertEqual('31');
      expect(Number.isInteger(value)).assertTrue();
    })
  })
}
