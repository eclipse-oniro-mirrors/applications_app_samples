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

export default function dateTimeExpandedTest() {
  describe('dateTimeExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0001
     * @tc.name      testExpDateT0001
     * @tc.desc      Hour offset -50 wraps to UTC hour 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -50 * 3600000);
      expect(actual.getUTCHours()).assertEqual(22);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0002
     * @tc.name      testExpDateT0002
     * @tc.desc      Hour offset -49 wraps to UTC hour 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -49 * 3600000);
      expect(actual.getUTCHours()).assertEqual(23);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0003
     * @tc.name      testExpDateT0003
     * @tc.desc      Hour offset -48 wraps to UTC hour 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -48 * 3600000);
      expect(actual.getUTCHours()).assertEqual(0);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0004
     * @tc.name      testExpDateT0004
     * @tc.desc      Hour offset -47 wraps to UTC hour 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -47 * 3600000);
      expect(actual.getUTCHours()).assertEqual(1);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0005
     * @tc.name      testExpDateT0005
     * @tc.desc      Hour offset -46 wraps to UTC hour 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -46 * 3600000);
      expect(actual.getUTCHours()).assertEqual(2);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0006
     * @tc.name      testExpDateT0006
     * @tc.desc      Hour offset -45 wraps to UTC hour 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -45 * 3600000);
      expect(actual.getUTCHours()).assertEqual(3);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0007
     * @tc.name      testExpDateT0007
     * @tc.desc      Hour offset -44 wraps to UTC hour 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -44 * 3600000);
      expect(actual.getUTCHours()).assertEqual(4);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0008
     * @tc.name      testExpDateT0008
     * @tc.desc      Hour offset -43 wraps to UTC hour 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -43 * 3600000);
      expect(actual.getUTCHours()).assertEqual(5);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0009
     * @tc.name      testExpDateT0009
     * @tc.desc      Hour offset -42 wraps to UTC hour 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -42 * 3600000);
      expect(actual.getUTCHours()).assertEqual(6);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0010
     * @tc.name      testExpDateT0010
     * @tc.desc      Hour offset -41 wraps to UTC hour 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -41 * 3600000);
      expect(actual.getUTCHours()).assertEqual(7);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0011
     * @tc.name      testExpDateT0011
     * @tc.desc      Hour offset -40 wraps to UTC hour 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -40 * 3600000);
      expect(actual.getUTCHours()).assertEqual(8);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0012
     * @tc.name      testExpDateT0012
     * @tc.desc      Hour offset -39 wraps to UTC hour 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -39 * 3600000);
      expect(actual.getUTCHours()).assertEqual(9);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0013
     * @tc.name      testExpDateT0013
     * @tc.desc      Hour offset -38 wraps to UTC hour 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -38 * 3600000);
      expect(actual.getUTCHours()).assertEqual(10);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0014
     * @tc.name      testExpDateT0014
     * @tc.desc      Hour offset -37 wraps to UTC hour 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -37 * 3600000);
      expect(actual.getUTCHours()).assertEqual(11);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0015
     * @tc.name      testExpDateT0015
     * @tc.desc      Hour offset -36 wraps to UTC hour 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -36 * 3600000);
      expect(actual.getUTCHours()).assertEqual(12);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0016
     * @tc.name      testExpDateT0016
     * @tc.desc      Hour offset -35 wraps to UTC hour 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -35 * 3600000);
      expect(actual.getUTCHours()).assertEqual(13);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0017
     * @tc.name      testExpDateT0017
     * @tc.desc      Hour offset -34 wraps to UTC hour 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -34 * 3600000);
      expect(actual.getUTCHours()).assertEqual(14);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0018
     * @tc.name      testExpDateT0018
     * @tc.desc      Hour offset -33 wraps to UTC hour 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -33 * 3600000);
      expect(actual.getUTCHours()).assertEqual(15);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0019
     * @tc.name      testExpDateT0019
     * @tc.desc      Hour offset -32 wraps to UTC hour 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -32 * 3600000);
      expect(actual.getUTCHours()).assertEqual(16);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0020
     * @tc.name      testExpDateT0020
     * @tc.desc      Hour offset -31 wraps to UTC hour 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -31 * 3600000);
      expect(actual.getUTCHours()).assertEqual(17);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0021
     * @tc.name      testExpDateT0021
     * @tc.desc      Hour offset -30 wraps to UTC hour 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -30 * 3600000);
      expect(actual.getUTCHours()).assertEqual(18);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0022
     * @tc.name      testExpDateT0022
     * @tc.desc      Hour offset -29 wraps to UTC hour 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -29 * 3600000);
      expect(actual.getUTCHours()).assertEqual(19);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0023
     * @tc.name      testExpDateT0023
     * @tc.desc      Hour offset -28 wraps to UTC hour 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -28 * 3600000);
      expect(actual.getUTCHours()).assertEqual(20);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0024
     * @tc.name      testExpDateT0024
     * @tc.desc      Hour offset -27 wraps to UTC hour 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -27 * 3600000);
      expect(actual.getUTCHours()).assertEqual(21);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0025
     * @tc.name      testExpDateT0025
     * @tc.desc      Hour offset -26 wraps to UTC hour 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -26 * 3600000);
      expect(actual.getUTCHours()).assertEqual(22);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0026
     * @tc.name      testExpDateT0026
     * @tc.desc      Hour offset -25 wraps to UTC hour 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -25 * 3600000);
      expect(actual.getUTCHours()).assertEqual(23);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0027
     * @tc.name      testExpDateT0027
     * @tc.desc      Hour offset -24 wraps to UTC hour 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -24 * 3600000);
      expect(actual.getUTCHours()).assertEqual(0);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0028
     * @tc.name      testExpDateT0028
     * @tc.desc      Hour offset -23 wraps to UTC hour 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -23 * 3600000);
      expect(actual.getUTCHours()).assertEqual(1);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0029
     * @tc.name      testExpDateT0029
     * @tc.desc      Hour offset -22 wraps to UTC hour 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -22 * 3600000);
      expect(actual.getUTCHours()).assertEqual(2);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0030
     * @tc.name      testExpDateT0030
     * @tc.desc      Hour offset -21 wraps to UTC hour 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -21 * 3600000);
      expect(actual.getUTCHours()).assertEqual(3);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0031
     * @tc.name      testExpDateT0031
     * @tc.desc      Hour offset -20 wraps to UTC hour 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -20 * 3600000);
      expect(actual.getUTCHours()).assertEqual(4);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0032
     * @tc.name      testExpDateT0032
     * @tc.desc      Hour offset -19 wraps to UTC hour 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -19 * 3600000);
      expect(actual.getUTCHours()).assertEqual(5);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0033
     * @tc.name      testExpDateT0033
     * @tc.desc      Hour offset -18 wraps to UTC hour 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -18 * 3600000);
      expect(actual.getUTCHours()).assertEqual(6);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0034
     * @tc.name      testExpDateT0034
     * @tc.desc      Hour offset -17 wraps to UTC hour 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -17 * 3600000);
      expect(actual.getUTCHours()).assertEqual(7);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0035
     * @tc.name      testExpDateT0035
     * @tc.desc      Hour offset -16 wraps to UTC hour 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -16 * 3600000);
      expect(actual.getUTCHours()).assertEqual(8);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0036
     * @tc.name      testExpDateT0036
     * @tc.desc      Hour offset -15 wraps to UTC hour 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -15 * 3600000);
      expect(actual.getUTCHours()).assertEqual(9);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0037
     * @tc.name      testExpDateT0037
     * @tc.desc      Hour offset -14 wraps to UTC hour 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -14 * 3600000);
      expect(actual.getUTCHours()).assertEqual(10);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0038
     * @tc.name      testExpDateT0038
     * @tc.desc      Hour offset -13 wraps to UTC hour 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -13 * 3600000);
      expect(actual.getUTCHours()).assertEqual(11);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0039
     * @tc.name      testExpDateT0039
     * @tc.desc      Hour offset -12 wraps to UTC hour 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -12 * 3600000);
      expect(actual.getUTCHours()).assertEqual(12);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0040
     * @tc.name      testExpDateT0040
     * @tc.desc      Hour offset -11 wraps to UTC hour 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -11 * 3600000);
      expect(actual.getUTCHours()).assertEqual(13);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0041
     * @tc.name      testExpDateT0041
     * @tc.desc      Hour offset -10 wraps to UTC hour 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -10 * 3600000);
      expect(actual.getUTCHours()).assertEqual(14);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0042
     * @tc.name      testExpDateT0042
     * @tc.desc      Hour offset -9 wraps to UTC hour 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -9 * 3600000);
      expect(actual.getUTCHours()).assertEqual(15);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0043
     * @tc.name      testExpDateT0043
     * @tc.desc      Hour offset -8 wraps to UTC hour 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -8 * 3600000);
      expect(actual.getUTCHours()).assertEqual(16);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0044
     * @tc.name      testExpDateT0044
     * @tc.desc      Hour offset -7 wraps to UTC hour 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -7 * 3600000);
      expect(actual.getUTCHours()).assertEqual(17);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0045
     * @tc.name      testExpDateT0045
     * @tc.desc      Hour offset -6 wraps to UTC hour 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -6 * 3600000);
      expect(actual.getUTCHours()).assertEqual(18);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0046
     * @tc.name      testExpDateT0046
     * @tc.desc      Hour offset -5 wraps to UTC hour 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -5 * 3600000);
      expect(actual.getUTCHours()).assertEqual(19);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0047
     * @tc.name      testExpDateT0047
     * @tc.desc      Hour offset -4 wraps to UTC hour 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -4 * 3600000);
      expect(actual.getUTCHours()).assertEqual(20);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0048
     * @tc.name      testExpDateT0048
     * @tc.desc      Hour offset -3 wraps to UTC hour 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -3 * 3600000);
      expect(actual.getUTCHours()).assertEqual(21);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0049
     * @tc.name      testExpDateT0049
     * @tc.desc      Hour offset -2 wraps to UTC hour 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -2 * 3600000);
      expect(actual.getUTCHours()).assertEqual(22);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0050
     * @tc.name      testExpDateT0050
     * @tc.desc      Hour offset -1 wraps to UTC hour 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + -1 * 3600000);
      expect(actual.getUTCHours()).assertEqual(23);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0051
     * @tc.name      testExpDateT0051
     * @tc.desc      Hour offset 0 wraps to UTC hour 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 0 * 3600000);
      expect(actual.getUTCHours()).assertEqual(0);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0052
     * @tc.name      testExpDateT0052
     * @tc.desc      Hour offset 1 wraps to UTC hour 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 1 * 3600000);
      expect(actual.getUTCHours()).assertEqual(1);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0053
     * @tc.name      testExpDateT0053
     * @tc.desc      Hour offset 2 wraps to UTC hour 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 2 * 3600000);
      expect(actual.getUTCHours()).assertEqual(2);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0054
     * @tc.name      testExpDateT0054
     * @tc.desc      Hour offset 3 wraps to UTC hour 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 3 * 3600000);
      expect(actual.getUTCHours()).assertEqual(3);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0055
     * @tc.name      testExpDateT0055
     * @tc.desc      Hour offset 4 wraps to UTC hour 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 4 * 3600000);
      expect(actual.getUTCHours()).assertEqual(4);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0056
     * @tc.name      testExpDateT0056
     * @tc.desc      Hour offset 5 wraps to UTC hour 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 5 * 3600000);
      expect(actual.getUTCHours()).assertEqual(5);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0057
     * @tc.name      testExpDateT0057
     * @tc.desc      Hour offset 6 wraps to UTC hour 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 6 * 3600000);
      expect(actual.getUTCHours()).assertEqual(6);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0058
     * @tc.name      testExpDateT0058
     * @tc.desc      Hour offset 7 wraps to UTC hour 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 7 * 3600000);
      expect(actual.getUTCHours()).assertEqual(7);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0059
     * @tc.name      testExpDateT0059
     * @tc.desc      Hour offset 8 wraps to UTC hour 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 8 * 3600000);
      expect(actual.getUTCHours()).assertEqual(8);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0060
     * @tc.name      testExpDateT0060
     * @tc.desc      Hour offset 9 wraps to UTC hour 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 9 * 3600000);
      expect(actual.getUTCHours()).assertEqual(9);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0061
     * @tc.name      testExpDateT0061
     * @tc.desc      Hour offset 10 wraps to UTC hour 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 10 * 3600000);
      expect(actual.getUTCHours()).assertEqual(10);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0062
     * @tc.name      testExpDateT0062
     * @tc.desc      Hour offset 11 wraps to UTC hour 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 11 * 3600000);
      expect(actual.getUTCHours()).assertEqual(11);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0063
     * @tc.name      testExpDateT0063
     * @tc.desc      Hour offset 12 wraps to UTC hour 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 12 * 3600000);
      expect(actual.getUTCHours()).assertEqual(12);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0064
     * @tc.name      testExpDateT0064
     * @tc.desc      Hour offset 13 wraps to UTC hour 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 13 * 3600000);
      expect(actual.getUTCHours()).assertEqual(13);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0065
     * @tc.name      testExpDateT0065
     * @tc.desc      Hour offset 14 wraps to UTC hour 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 14 * 3600000);
      expect(actual.getUTCHours()).assertEqual(14);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0066
     * @tc.name      testExpDateT0066
     * @tc.desc      Hour offset 15 wraps to UTC hour 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 15 * 3600000);
      expect(actual.getUTCHours()).assertEqual(15);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0067
     * @tc.name      testExpDateT0067
     * @tc.desc      Hour offset 16 wraps to UTC hour 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 16 * 3600000);
      expect(actual.getUTCHours()).assertEqual(16);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0068
     * @tc.name      testExpDateT0068
     * @tc.desc      Hour offset 17 wraps to UTC hour 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 17 * 3600000);
      expect(actual.getUTCHours()).assertEqual(17);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0069
     * @tc.name      testExpDateT0069
     * @tc.desc      Hour offset 18 wraps to UTC hour 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 18 * 3600000);
      expect(actual.getUTCHours()).assertEqual(18);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0070
     * @tc.name      testExpDateT0070
     * @tc.desc      Hour offset 19 wraps to UTC hour 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 19 * 3600000);
      expect(actual.getUTCHours()).assertEqual(19);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0071
     * @tc.name      testExpDateT0071
     * @tc.desc      Hour offset 20 wraps to UTC hour 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 20 * 3600000);
      expect(actual.getUTCHours()).assertEqual(20);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0072
     * @tc.name      testExpDateT0072
     * @tc.desc      Hour offset 21 wraps to UTC hour 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 21 * 3600000);
      expect(actual.getUTCHours()).assertEqual(21);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0073
     * @tc.name      testExpDateT0073
     * @tc.desc      Hour offset 22 wraps to UTC hour 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 22 * 3600000);
      expect(actual.getUTCHours()).assertEqual(22);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0074
     * @tc.name      testExpDateT0074
     * @tc.desc      Hour offset 23 wraps to UTC hour 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 23 * 3600000);
      expect(actual.getUTCHours()).assertEqual(23);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0075
     * @tc.name      testExpDateT0075
     * @tc.desc      Hour offset 24 wraps to UTC hour 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 24 * 3600000);
      expect(actual.getUTCHours()).assertEqual(0);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0076
     * @tc.name      testExpDateT0076
     * @tc.desc      Hour offset 25 wraps to UTC hour 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 25 * 3600000);
      expect(actual.getUTCHours()).assertEqual(1);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0077
     * @tc.name      testExpDateT0077
     * @tc.desc      Hour offset 26 wraps to UTC hour 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 26 * 3600000);
      expect(actual.getUTCHours()).assertEqual(2);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0078
     * @tc.name      testExpDateT0078
     * @tc.desc      Hour offset 27 wraps to UTC hour 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 27 * 3600000);
      expect(actual.getUTCHours()).assertEqual(3);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0079
     * @tc.name      testExpDateT0079
     * @tc.desc      Hour offset 28 wraps to UTC hour 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 28 * 3600000);
      expect(actual.getUTCHours()).assertEqual(4);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0080
     * @tc.name      testExpDateT0080
     * @tc.desc      Hour offset 29 wraps to UTC hour 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 29 * 3600000);
      expect(actual.getUTCHours()).assertEqual(5);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0081
     * @tc.name      testExpDateT0081
     * @tc.desc      Hour offset 30 wraps to UTC hour 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 30 * 3600000);
      expect(actual.getUTCHours()).assertEqual(6);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0082
     * @tc.name      testExpDateT0082
     * @tc.desc      Hour offset 31 wraps to UTC hour 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 31 * 3600000);
      expect(actual.getUTCHours()).assertEqual(7);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0083
     * @tc.name      testExpDateT0083
     * @tc.desc      Hour offset 32 wraps to UTC hour 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 32 * 3600000);
      expect(actual.getUTCHours()).assertEqual(8);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0084
     * @tc.name      testExpDateT0084
     * @tc.desc      Hour offset 33 wraps to UTC hour 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 33 * 3600000);
      expect(actual.getUTCHours()).assertEqual(9);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0085
     * @tc.name      testExpDateT0085
     * @tc.desc      Hour offset 34 wraps to UTC hour 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 34 * 3600000);
      expect(actual.getUTCHours()).assertEqual(10);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0086
     * @tc.name      testExpDateT0086
     * @tc.desc      Hour offset 35 wraps to UTC hour 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 35 * 3600000);
      expect(actual.getUTCHours()).assertEqual(11);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0087
     * @tc.name      testExpDateT0087
     * @tc.desc      Hour offset 36 wraps to UTC hour 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 36 * 3600000);
      expect(actual.getUTCHours()).assertEqual(12);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0088
     * @tc.name      testExpDateT0088
     * @tc.desc      Hour offset 37 wraps to UTC hour 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 37 * 3600000);
      expect(actual.getUTCHours()).assertEqual(13);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0089
     * @tc.name      testExpDateT0089
     * @tc.desc      Hour offset 38 wraps to UTC hour 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 38 * 3600000);
      expect(actual.getUTCHours()).assertEqual(14);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0090
     * @tc.name      testExpDateT0090
     * @tc.desc      Hour offset 39 wraps to UTC hour 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 39 * 3600000);
      expect(actual.getUTCHours()).assertEqual(15);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0091
     * @tc.name      testExpDateT0091
     * @tc.desc      Hour offset 40 wraps to UTC hour 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 40 * 3600000);
      expect(actual.getUTCHours()).assertEqual(16);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0092
     * @tc.name      testExpDateT0092
     * @tc.desc      Hour offset 41 wraps to UTC hour 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 41 * 3600000);
      expect(actual.getUTCHours()).assertEqual(17);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0093
     * @tc.name      testExpDateT0093
     * @tc.desc      Hour offset 42 wraps to UTC hour 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 42 * 3600000);
      expect(actual.getUTCHours()).assertEqual(18);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0094
     * @tc.name      testExpDateT0094
     * @tc.desc      Hour offset 43 wraps to UTC hour 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 43 * 3600000);
      expect(actual.getUTCHours()).assertEqual(19);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0095
     * @tc.name      testExpDateT0095
     * @tc.desc      Hour offset 44 wraps to UTC hour 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 44 * 3600000);
      expect(actual.getUTCHours()).assertEqual(20);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0096
     * @tc.name      testExpDateT0096
     * @tc.desc      Hour offset 45 wraps to UTC hour 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 45 * 3600000);
      expect(actual.getUTCHours()).assertEqual(21);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0097
     * @tc.name      testExpDateT0097
     * @tc.desc      Hour offset 46 wraps to UTC hour 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 46 * 3600000);
      expect(actual.getUTCHours()).assertEqual(22);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0098
     * @tc.name      testExpDateT0098
     * @tc.desc      Hour offset 47 wraps to UTC hour 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 47 * 3600000);
      expect(actual.getUTCHours()).assertEqual(23);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0099
     * @tc.name      testExpDateT0099
     * @tc.desc      Hour offset 48 wraps to UTC hour 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 48 * 3600000);
      expect(actual.getUTCHours()).assertEqual(0);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATET_0100
     * @tc.name      testExpDateT0100
     * @tc.desc      Hour offset 49 wraps to UTC hour 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1, 0, 0, 0);
      const actual: Date = new Date(base + 49 * 3600000);
      expect(actual.getUTCHours()).assertEqual(1);
      expect(actual.getUTCMinutes()).assertEqual(0);
      expect(actual.getUTCSeconds()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
  })
}
