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

export default function dateArithmeticExpandedTest() {
  describe('dateArithmeticExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0001
     * @tc.name      testExpDateA0001
     * @tc.desc      Offset -50 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -50;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0002
     * @tc.name      testExpDateA0002
     * @tc.desc      Offset -49 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -49;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0003
     * @tc.name      testExpDateA0003
     * @tc.desc      Offset -48 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -48;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0004
     * @tc.name      testExpDateA0004
     * @tc.desc      Offset -47 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -47;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0005
     * @tc.name      testExpDateA0005
     * @tc.desc      Offset -46 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -46;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0006
     * @tc.name      testExpDateA0006
     * @tc.desc      Offset -45 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -45;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0007
     * @tc.name      testExpDateA0007
     * @tc.desc      Offset -44 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -44;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0008
     * @tc.name      testExpDateA0008
     * @tc.desc      Offset -43 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -43;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0009
     * @tc.name      testExpDateA0009
     * @tc.desc      Offset -42 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -42;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0010
     * @tc.name      testExpDateA0010
     * @tc.desc      Offset -41 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -41;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0011
     * @tc.name      testExpDateA0011
     * @tc.desc      Offset -40 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -40;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0012
     * @tc.name      testExpDateA0012
     * @tc.desc      Offset -39 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -39;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0013
     * @tc.name      testExpDateA0013
     * @tc.desc      Offset -38 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -38;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0014
     * @tc.name      testExpDateA0014
     * @tc.desc      Offset -37 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -37;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0015
     * @tc.name      testExpDateA0015
     * @tc.desc      Offset -36 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -36;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0016
     * @tc.name      testExpDateA0016
     * @tc.desc      Offset -35 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -35;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0017
     * @tc.name      testExpDateA0017
     * @tc.desc      Offset -34 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -34;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0018
     * @tc.name      testExpDateA0018
     * @tc.desc      Offset -33 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -33;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0019
     * @tc.name      testExpDateA0019
     * @tc.desc      Offset -32 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -32;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0020
     * @tc.name      testExpDateA0020
     * @tc.desc      Offset -31 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -31;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0021
     * @tc.name      testExpDateA0021
     * @tc.desc      Offset -30 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -30;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0022
     * @tc.name      testExpDateA0022
     * @tc.desc      Offset -29 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -29;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0023
     * @tc.name      testExpDateA0023
     * @tc.desc      Offset -28 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -28;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0024
     * @tc.name      testExpDateA0024
     * @tc.desc      Offset -27 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -27;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0025
     * @tc.name      testExpDateA0025
     * @tc.desc      Offset -26 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -26;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0026
     * @tc.name      testExpDateA0026
     * @tc.desc      Offset -25 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -25;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0027
     * @tc.name      testExpDateA0027
     * @tc.desc      Offset -24 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -24;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0028
     * @tc.name      testExpDateA0028
     * @tc.desc      Offset -23 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -23;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0029
     * @tc.name      testExpDateA0029
     * @tc.desc      Offset -22 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -22;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0030
     * @tc.name      testExpDateA0030
     * @tc.desc      Offset -21 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -21;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0031
     * @tc.name      testExpDateA0031
     * @tc.desc      Offset -20 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -20;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0032
     * @tc.name      testExpDateA0032
     * @tc.desc      Offset -19 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -19;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0033
     * @tc.name      testExpDateA0033
     * @tc.desc      Offset -18 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -18;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0034
     * @tc.name      testExpDateA0034
     * @tc.desc      Offset -17 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -17;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0035
     * @tc.name      testExpDateA0035
     * @tc.desc      Offset -16 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -16;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0036
     * @tc.name      testExpDateA0036
     * @tc.desc      Offset -15 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -15;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0037
     * @tc.name      testExpDateA0037
     * @tc.desc      Offset -14 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -14;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0038
     * @tc.name      testExpDateA0038
     * @tc.desc      Offset -13 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -13;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0039
     * @tc.name      testExpDateA0039
     * @tc.desc      Offset -12 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -12;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0040
     * @tc.name      testExpDateA0040
     * @tc.desc      Offset -11 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -11;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0041
     * @tc.name      testExpDateA0041
     * @tc.desc      Offset -10 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -10;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0042
     * @tc.name      testExpDateA0042
     * @tc.desc      Offset -9 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -9;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0043
     * @tc.name      testExpDateA0043
     * @tc.desc      Offset -8 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -8;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0044
     * @tc.name      testExpDateA0044
     * @tc.desc      Offset -7 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -7;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0045
     * @tc.name      testExpDateA0045
     * @tc.desc      Offset -6 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -6;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0046
     * @tc.name      testExpDateA0046
     * @tc.desc      Offset -5 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -5;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0047
     * @tc.name      testExpDateA0047
     * @tc.desc      Offset -4 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -4;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0048
     * @tc.name      testExpDateA0048
     * @tc.desc      Offset -3 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -3;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0049
     * @tc.name      testExpDateA0049
     * @tc.desc      Offset -2 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -2;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0050
     * @tc.name      testExpDateA0050
     * @tc.desc      Offset -1 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = -1;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0051
     * @tc.name      testExpDateA0051
     * @tc.desc      Offset 0 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 0;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0052
     * @tc.name      testExpDateA0052
     * @tc.desc      Offset 1 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 1;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0053
     * @tc.name      testExpDateA0053
     * @tc.desc      Offset 2 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 2;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0054
     * @tc.name      testExpDateA0054
     * @tc.desc      Offset 3 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 3;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0055
     * @tc.name      testExpDateA0055
     * @tc.desc      Offset 4 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 4;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0056
     * @tc.name      testExpDateA0056
     * @tc.desc      Offset 5 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 5;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0057
     * @tc.name      testExpDateA0057
     * @tc.desc      Offset 6 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 6;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0058
     * @tc.name      testExpDateA0058
     * @tc.desc      Offset 7 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 7;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0059
     * @tc.name      testExpDateA0059
     * @tc.desc      Offset 8 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 8;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0060
     * @tc.name      testExpDateA0060
     * @tc.desc      Offset 9 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 9;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0061
     * @tc.name      testExpDateA0061
     * @tc.desc      Offset 10 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 10;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0062
     * @tc.name      testExpDateA0062
     * @tc.desc      Offset 11 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 11;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0063
     * @tc.name      testExpDateA0063
     * @tc.desc      Offset 12 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 12;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0064
     * @tc.name      testExpDateA0064
     * @tc.desc      Offset 13 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 13;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0065
     * @tc.name      testExpDateA0065
     * @tc.desc      Offset 14 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 14;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0066
     * @tc.name      testExpDateA0066
     * @tc.desc      Offset 15 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 15;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0067
     * @tc.name      testExpDateA0067
     * @tc.desc      Offset 16 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 16;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0068
     * @tc.name      testExpDateA0068
     * @tc.desc      Offset 17 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 17;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0069
     * @tc.name      testExpDateA0069
     * @tc.desc      Offset 18 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 18;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0070
     * @tc.name      testExpDateA0070
     * @tc.desc      Offset 19 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 19;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0071
     * @tc.name      testExpDateA0071
     * @tc.desc      Offset 20 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 20;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0072
     * @tc.name      testExpDateA0072
     * @tc.desc      Offset 21 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 21;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0073
     * @tc.name      testExpDateA0073
     * @tc.desc      Offset 22 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 22;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0074
     * @tc.name      testExpDateA0074
     * @tc.desc      Offset 23 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 23;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0075
     * @tc.name      testExpDateA0075
     * @tc.desc      Offset 24 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 24;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0076
     * @tc.name      testExpDateA0076
     * @tc.desc      Offset 25 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 25;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0077
     * @tc.name      testExpDateA0077
     * @tc.desc      Offset 26 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 26;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0078
     * @tc.name      testExpDateA0078
     * @tc.desc      Offset 27 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 27;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0079
     * @tc.name      testExpDateA0079
     * @tc.desc      Offset 28 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 28;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0080
     * @tc.name      testExpDateA0080
     * @tc.desc      Offset 29 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 29;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0081
     * @tc.name      testExpDateA0081
     * @tc.desc      Offset 30 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 30;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0082
     * @tc.name      testExpDateA0082
     * @tc.desc      Offset 31 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 31;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0083
     * @tc.name      testExpDateA0083
     * @tc.desc      Offset 32 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 32;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0084
     * @tc.name      testExpDateA0084
     * @tc.desc      Offset 33 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 33;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0085
     * @tc.name      testExpDateA0085
     * @tc.desc      Offset 34 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 34;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0086
     * @tc.name      testExpDateA0086
     * @tc.desc      Offset 35 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 35;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0087
     * @tc.name      testExpDateA0087
     * @tc.desc      Offset 36 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 36;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0088
     * @tc.name      testExpDateA0088
     * @tc.desc      Offset 37 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 37;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0089
     * @tc.name      testExpDateA0089
     * @tc.desc      Offset 38 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 38;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0090
     * @tc.name      testExpDateA0090
     * @tc.desc      Offset 39 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 39;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0091
     * @tc.name      testExpDateA0091
     * @tc.desc      Offset 40 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 40;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0092
     * @tc.name      testExpDateA0092
     * @tc.desc      Offset 41 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 41;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0093
     * @tc.name      testExpDateA0093
     * @tc.desc      Offset 42 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 42;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0094
     * @tc.name      testExpDateA0094
     * @tc.desc      Offset 43 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 43;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(5);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0095
     * @tc.name      testExpDateA0095
     * @tc.desc      Offset 44 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 44;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(6);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0096
     * @tc.name      testExpDateA0096
     * @tc.desc      Offset 45 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 45;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(0);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0097
     * @tc.name      testExpDateA0097
     * @tc.desc      Offset 46 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 46;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(1);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0098
     * @tc.name      testExpDateA0098
     * @tc.desc      Offset 47 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 47;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(2);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0099
     * @tc.name      testExpDateA0099
     * @tc.desc      Offset 48 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 48;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(3);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEA_0100
     * @tc.name      testExpDateA0100
     * @tc.desc      Offset 49 days keeps the expected UTC weekday and millisecond delta.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateA0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = Date.UTC(2026, 0, 1);
      const offset: number = 49;
      const actual: Date = new Date(base + offset * 86400000);
      expect(actual.getTime()).assertEqual(base + offset * 86400000);
      expect(actual.getUTCDay()).assertEqual(4);
      expect(Number.isFinite(actual.getTime())).assertTrue();
    })
  })
}
