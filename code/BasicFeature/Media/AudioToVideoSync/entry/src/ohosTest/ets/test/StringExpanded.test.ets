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

export default function stringExpandedTest() {
  describe('stringExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_STR_0001
     * @tc.name      testExpString0001
     * @tc.desc      Trimmed key 0 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_0_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_0_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_0_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0002
     * @tc.name      testExpString0002
     * @tc.desc      Trimmed key 1 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_1_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_1_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_1_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0003
     * @tc.name      testExpString0003
     * @tc.desc      Trimmed key 2 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_2_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_2_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_2_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0004
     * @tc.name      testExpString0004
     * @tc.desc      Trimmed key 3 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_3_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_3_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_3_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0005
     * @tc.name      testExpString0005
     * @tc.desc      Trimmed key 4 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_4_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_4_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_4_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0006
     * @tc.name      testExpString0006
     * @tc.desc      Trimmed key 5 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_5_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_5_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_5_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0007
     * @tc.name      testExpString0007
     * @tc.desc      Trimmed key 6 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_6_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_6_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_6_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0008
     * @tc.name      testExpString0008
     * @tc.desc      Trimmed key 7 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_7_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_7_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_7_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0009
     * @tc.name      testExpString0009
     * @tc.desc      Trimmed key 8 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_8_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_8_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_8_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0010
     * @tc.name      testExpString0010
     * @tc.desc      Trimmed key 9 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_9_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_9_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_9_');
      expect(trimmed.length).assertEqual(6);
      expect(source.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0011
     * @tc.name      testExpString0011
     * @tc.desc      Trimmed key 10 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_10_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_10_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_10_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0012
     * @tc.name      testExpString0012
     * @tc.desc      Trimmed key 11 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_11_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_11_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_11_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0013
     * @tc.name      testExpString0013
     * @tc.desc      Trimmed key 12 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_12_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_12_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_12_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0014
     * @tc.name      testExpString0014
     * @tc.desc      Trimmed key 13 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_13_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_13_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_13_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0015
     * @tc.name      testExpString0015
     * @tc.desc      Trimmed key 14 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_14_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_14_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_14_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0016
     * @tc.name      testExpString0016
     * @tc.desc      Trimmed key 15 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_15_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_15_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_15_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0017
     * @tc.name      testExpString0017
     * @tc.desc      Trimmed key 16 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_16_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_16_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_16_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0018
     * @tc.name      testExpString0018
     * @tc.desc      Trimmed key 17 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_17_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_17_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_17_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0019
     * @tc.name      testExpString0019
     * @tc.desc      Trimmed key 18 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_18_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_18_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_18_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0020
     * @tc.name      testExpString0020
     * @tc.desc      Trimmed key 19 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_19_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_19_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_19_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0021
     * @tc.name      testExpString0021
     * @tc.desc      Trimmed key 20 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_20_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_20_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_20_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0022
     * @tc.name      testExpString0022
     * @tc.desc      Trimmed key 21 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_21_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_21_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_21_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0023
     * @tc.name      testExpString0023
     * @tc.desc      Trimmed key 22 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_22_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_22_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_22_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0024
     * @tc.name      testExpString0024
     * @tc.desc      Trimmed key 23 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_23_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_23_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_23_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0025
     * @tc.name      testExpString0025
     * @tc.desc      Trimmed key 24 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_24_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_24_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_24_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0026
     * @tc.name      testExpString0026
     * @tc.desc      Trimmed key 25 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_25_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_25_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_25_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0027
     * @tc.name      testExpString0027
     * @tc.desc      Trimmed key 26 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_26_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_26_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_26_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0028
     * @tc.name      testExpString0028
     * @tc.desc      Trimmed key 27 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_27_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_27_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_27_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0029
     * @tc.name      testExpString0029
     * @tc.desc      Trimmed key 28 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_28_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_28_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_28_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0030
     * @tc.name      testExpString0030
     * @tc.desc      Trimmed key 29 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_29_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_29_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_29_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0031
     * @tc.name      testExpString0031
     * @tc.desc      Trimmed key 30 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_30_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_30_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_30_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0032
     * @tc.name      testExpString0032
     * @tc.desc      Trimmed key 31 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_31_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_31_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_31_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0033
     * @tc.name      testExpString0033
     * @tc.desc      Trimmed key 32 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_32_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_32_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_32_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0034
     * @tc.name      testExpString0034
     * @tc.desc      Trimmed key 33 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_33_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_33_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_33_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0035
     * @tc.name      testExpString0035
     * @tc.desc      Trimmed key 34 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_34_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_34_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_34_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0036
     * @tc.name      testExpString0036
     * @tc.desc      Trimmed key 35 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_35_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_35_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_35_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0037
     * @tc.name      testExpString0037
     * @tc.desc      Trimmed key 36 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_36_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_36_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_36_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0038
     * @tc.name      testExpString0038
     * @tc.desc      Trimmed key 37 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_37_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_37_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_37_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0039
     * @tc.name      testExpString0039
     * @tc.desc      Trimmed key 38 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_38_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_38_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_38_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0040
     * @tc.name      testExpString0040
     * @tc.desc      Trimmed key 39 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_39_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_39_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_39_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0041
     * @tc.name      testExpString0041
     * @tc.desc      Trimmed key 40 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_40_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_40_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_40_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0042
     * @tc.name      testExpString0042
     * @tc.desc      Trimmed key 41 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_41_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_41_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_41_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0043
     * @tc.name      testExpString0043
     * @tc.desc      Trimmed key 42 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_42_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_42_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_42_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0044
     * @tc.name      testExpString0044
     * @tc.desc      Trimmed key 43 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_43_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_43_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_43_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0045
     * @tc.name      testExpString0045
     * @tc.desc      Trimmed key 44 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_44_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_44_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_44_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0046
     * @tc.name      testExpString0046
     * @tc.desc      Trimmed key 45 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_45_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_45_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_45_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0047
     * @tc.name      testExpString0047
     * @tc.desc      Trimmed key 46 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_46_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_46_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_46_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0048
     * @tc.name      testExpString0048
     * @tc.desc      Trimmed key 47 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_47_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_47_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_47_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0049
     * @tc.name      testExpString0049
     * @tc.desc      Trimmed key 48 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_48_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_48_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_48_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0050
     * @tc.name      testExpString0050
     * @tc.desc      Trimmed key 49 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_49_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_49_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_49_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0051
     * @tc.name      testExpString0051
     * @tc.desc      Trimmed key 50 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_50_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_50_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_50_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0052
     * @tc.name      testExpString0052
     * @tc.desc      Trimmed key 51 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_51_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_51_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_51_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0053
     * @tc.name      testExpString0053
     * @tc.desc      Trimmed key 52 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_52_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_52_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_52_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0054
     * @tc.name      testExpString0054
     * @tc.desc      Trimmed key 53 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_53_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_53_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_53_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0055
     * @tc.name      testExpString0055
     * @tc.desc      Trimmed key 54 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_54_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_54_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_54_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0056
     * @tc.name      testExpString0056
     * @tc.desc      Trimmed key 55 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_55_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_55_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_55_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0057
     * @tc.name      testExpString0057
     * @tc.desc      Trimmed key 56 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_56_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_56_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_56_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0058
     * @tc.name      testExpString0058
     * @tc.desc      Trimmed key 57 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_57_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_57_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_57_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0059
     * @tc.name      testExpString0059
     * @tc.desc      Trimmed key 58 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_58_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_58_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_58_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0060
     * @tc.name      testExpString0060
     * @tc.desc      Trimmed key 59 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_59_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_59_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_59_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0061
     * @tc.name      testExpString0061
     * @tc.desc      Trimmed key 60 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_60_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_60_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_60_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0062
     * @tc.name      testExpString0062
     * @tc.desc      Trimmed key 61 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_61_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_61_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_61_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0063
     * @tc.name      testExpString0063
     * @tc.desc      Trimmed key 62 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_62_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_62_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_62_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0064
     * @tc.name      testExpString0064
     * @tc.desc      Trimmed key 63 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_63_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_63_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_63_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0065
     * @tc.name      testExpString0065
     * @tc.desc      Trimmed key 64 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_64_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_64_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_64_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0066
     * @tc.name      testExpString0066
     * @tc.desc      Trimmed key 65 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_65_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_65_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_65_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0067
     * @tc.name      testExpString0067
     * @tc.desc      Trimmed key 66 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_66_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_66_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_66_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0068
     * @tc.name      testExpString0068
     * @tc.desc      Trimmed key 67 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_67_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_67_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_67_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0069
     * @tc.name      testExpString0069
     * @tc.desc      Trimmed key 68 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_68_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_68_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_68_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0070
     * @tc.name      testExpString0070
     * @tc.desc      Trimmed key 69 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_69_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_69_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_69_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0071
     * @tc.name      testExpString0071
     * @tc.desc      Trimmed key 70 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_70_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_70_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_70_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0072
     * @tc.name      testExpString0072
     * @tc.desc      Trimmed key 71 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_71_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_71_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_71_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0073
     * @tc.name      testExpString0073
     * @tc.desc      Trimmed key 72 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_72_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_72_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_72_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0074
     * @tc.name      testExpString0074
     * @tc.desc      Trimmed key 73 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_73_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_73_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_73_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0075
     * @tc.name      testExpString0075
     * @tc.desc      Trimmed key 74 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_74_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_74_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_74_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0076
     * @tc.name      testExpString0076
     * @tc.desc      Trimmed key 75 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_75_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_75_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_75_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0077
     * @tc.name      testExpString0077
     * @tc.desc      Trimmed key 76 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_76_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_76_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_76_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0078
     * @tc.name      testExpString0078
     * @tc.desc      Trimmed key 77 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_77_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_77_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_77_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0079
     * @tc.name      testExpString0079
     * @tc.desc      Trimmed key 78 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_78_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_78_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_78_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0080
     * @tc.name      testExpString0080
     * @tc.desc      Trimmed key 79 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_79_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_79_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_79_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0081
     * @tc.name      testExpString0081
     * @tc.desc      Trimmed key 80 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_80_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_80_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_80_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0082
     * @tc.name      testExpString0082
     * @tc.desc      Trimmed key 81 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_81_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_81_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_81_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0083
     * @tc.name      testExpString0083
     * @tc.desc      Trimmed key 82 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_82_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_82_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_82_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0084
     * @tc.name      testExpString0084
     * @tc.desc      Trimmed key 83 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_83_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_83_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_83_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0085
     * @tc.name      testExpString0085
     * @tc.desc      Trimmed key 84 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_84_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_84_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_84_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0086
     * @tc.name      testExpString0086
     * @tc.desc      Trimmed key 85 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_85_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_85_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_85_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0087
     * @tc.name      testExpString0087
     * @tc.desc      Trimmed key 86 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_86_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_86_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_86_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0088
     * @tc.name      testExpString0088
     * @tc.desc      Trimmed key 87 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_87_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_87_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_87_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0089
     * @tc.name      testExpString0089
     * @tc.desc      Trimmed key 88 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_88_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_88_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_88_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0090
     * @tc.name      testExpString0090
     * @tc.desc      Trimmed key 89 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_89_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_89_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_89_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0091
     * @tc.name      testExpString0091
     * @tc.desc      Trimmed key 90 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_90_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_90_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_90_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0092
     * @tc.name      testExpString0092
     * @tc.desc      Trimmed key 91 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_91_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_91_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_91_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0093
     * @tc.name      testExpString0093
     * @tc.desc      Trimmed key 92 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_92_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_92_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_92_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0094
     * @tc.name      testExpString0094
     * @tc.desc      Trimmed key 93 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_93_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_93_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_93_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0095
     * @tc.name      testExpString0095
     * @tc.desc      Trimmed key 94 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_94_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_94_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_94_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0096
     * @tc.name      testExpString0096
     * @tc.desc      Trimmed key 95 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_95_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_95_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_95_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0097
     * @tc.name      testExpString0097
     * @tc.desc      Trimmed key 96 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_96_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_96_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_96_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0098
     * @tc.name      testExpString0098
     * @tc.desc      Trimmed key 97 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_97_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_97_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_97_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0099
     * @tc.name      testExpString0099
     * @tc.desc      Trimmed key 98 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_98_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_98_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_98_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVS_EXP_STR_0100
     * @tc.name      testExpString0100
     * @tc.desc      Trimmed key 99 preserves its core token and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = '  Key_99_  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Key_99_');
      expect(trimmed.indexOf('Key_')).assertEqual(0);
      expect(trimmed.toUpperCase()).assertEqual('KEY_99_');
      expect(trimmed.length).assertEqual(7);
      expect(source.length).assertEqual(11);
    })
  })
}
