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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { listOffsetOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listOffsetOf (96 cases). */
export default function listOffsetOfTest(): void {
  describe('ListOffsetOfTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0001
     * @tc.name      ExpandTitle_ListOffsetOf_0001
     * @tc.desc      listOffsetOf(offset=-100, yOffset=-100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ListOffsetOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0001 begin`);
      const actual: number = listOffsetOf(-100, -100);
      logInfo(`listOffsetOf(offset=-100, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ListOffsetOf_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0002
     * @tc.name      ExpandTitle_ListOffsetOf_0002
     * @tc.desc      listOffsetOf(offset=-100, yOffset=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ListOffsetOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0002 begin`);
      const actual: number = listOffsetOf(-100, -1);
      logInfo(`listOffsetOf(offset=-100, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ListOffsetOf_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0003
     * @tc.name      ExpandTitle_ListOffsetOf_0003
     * @tc.desc      listOffsetOf(offset=-100, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0003 begin`);
      const actual: number = listOffsetOf(-100, 0);
      logInfo(`listOffsetOf(offset=-100, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0004
     * @tc.name      ExpandTitle_ListOffsetOf_0004
     * @tc.desc      listOffsetOf(offset=-100, yOffset=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0004 begin`);
      const actual: number = listOffsetOf(-100, 1);
      logInfo(`listOffsetOf(offset=-100, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0005
     * @tc.name      ExpandTitle_ListOffsetOf_0005
     * @tc.desc      listOffsetOf(offset=-100, yOffset=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0005 begin`);
      const actual: number = listOffsetOf(-100, 50);
      logInfo(`listOffsetOf(offset=-100, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}ListOffsetOf_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0006
     * @tc.name      ExpandTitle_ListOffsetOf_0006
     * @tc.desc      listOffsetOf(offset=-100, yOffset=100) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0006 begin`);
      const actual: number = listOffsetOf(-100, 100);
      logInfo(`listOffsetOf(offset=-100, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ListOffsetOf_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0007
     * @tc.name      ExpandTitle_ListOffsetOf_0007
     * @tc.desc      listOffsetOf(offset=-100, yOffset=2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0007 begin`);
      const actual: number = listOffsetOf(-100, 2);
      logInfo(`listOffsetOf(offset=-100, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}ListOffsetOf_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0008
     * @tc.name      ExpandTitle_ListOffsetOf_0008
     * @tc.desc      listOffsetOf(offset=-100, yOffset=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0008 begin`);
      const actual: number = listOffsetOf(-100, 3);
      logInfo(`listOffsetOf(offset=-100, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}ListOffsetOf_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0009
     * @tc.name      ExpandTitle_ListOffsetOf_0009
     * @tc.desc      listOffsetOf(offset=-100, yOffset=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0009 begin`);
      const actual: number = listOffsetOf(-100, 10);
      logInfo(`listOffsetOf(offset=-100, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ListOffsetOf_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0010
     * @tc.name      ExpandTitle_ListOffsetOf_0010
     * @tc.desc      listOffsetOf(offset=-100, yOffset=5) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0010 begin`);
      const actual: number = listOffsetOf(-100, 5);
      logInfo(`listOffsetOf(offset=-100, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ListOffsetOf_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0011
     * @tc.name      ExpandTitle_ListOffsetOf_0011
     * @tc.desc      listOffsetOf(offset=-100, yOffset=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0011 begin`);
      const actual: number = listOffsetOf(-100, 15);
      logInfo(`listOffsetOf(offset=-100, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ListOffsetOf_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0012
     * @tc.name      ExpandTitle_ListOffsetOf_0012
     * @tc.desc      listOffsetOf(offset=-100, yOffset=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0012 begin`);
      const actual: number = listOffsetOf(-100, 20);
      logInfo(`listOffsetOf(offset=-100, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ListOffsetOf_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0013
     * @tc.name      ExpandTitle_ListOffsetOf_0013
     * @tc.desc      listOffsetOf(offset=-100, yOffset=25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0013 begin`);
      const actual: number = listOffsetOf(-100, 25);
      logInfo(`listOffsetOf(offset=-100, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ListOffsetOf_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0014
     * @tc.name      ExpandTitle_ListOffsetOf_0014
     * @tc.desc      listOffsetOf(offset=-100, yOffset=30) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0014 begin`);
      const actual: number = listOffsetOf(-100, 30);
      logInfo(`listOffsetOf(offset=-100, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ListOffsetOf_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0015
     * @tc.name      ExpandTitle_ListOffsetOf_0015
     * @tc.desc      listOffsetOf(offset=-100, yOffset=35) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0015 begin`);
      const actual: number = listOffsetOf(-100, 35);
      logInfo(`listOffsetOf(offset=-100, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}ListOffsetOf_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0016
     * @tc.name      ExpandTitle_ListOffsetOf_0016
     * @tc.desc      listOffsetOf(offset=-100, yOffset=40) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0016 begin`);
      const actual: number = listOffsetOf(-100, 40);
      logInfo(`listOffsetOf(offset=-100, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}ListOffsetOf_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0017
     * @tc.name      ExpandTitle_ListOffsetOf_0017
     * @tc.desc      listOffsetOf(offset=-100, yOffset=45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0017 begin`);
      const actual: number = listOffsetOf(-100, 45);
      logInfo(`listOffsetOf(offset=-100, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}ListOffsetOf_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0018
     * @tc.name      ExpandTitle_ListOffsetOf_0018
     * @tc.desc      listOffsetOf(offset=-100, yOffset=55) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0018 begin`);
      const actual: number = listOffsetOf(-100, 55);
      logInfo(`listOffsetOf(offset=-100, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}ListOffsetOf_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0019
     * @tc.name      ExpandTitle_ListOffsetOf_0019
     * @tc.desc      listOffsetOf(offset=-100, yOffset=60) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0019 begin`);
      const actual: number = listOffsetOf(-100, 60);
      logInfo(`listOffsetOf(offset=-100, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}ListOffsetOf_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0020
     * @tc.name      ExpandTitle_ListOffsetOf_0020
     * @tc.desc      listOffsetOf(offset=-100, yOffset=65) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0020 begin`);
      const actual: number = listOffsetOf(-100, 65);
      logInfo(`listOffsetOf(offset=-100, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}ListOffsetOf_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0021
     * @tc.name      ExpandTitle_ListOffsetOf_0021
     * @tc.desc      listOffsetOf(offset=-100, yOffset=70) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0021 begin`);
      const actual: number = listOffsetOf(-100, 70);
      logInfo(`listOffsetOf(offset=-100, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}ListOffsetOf_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0022
     * @tc.name      ExpandTitle_ListOffsetOf_0022
     * @tc.desc      listOffsetOf(offset=-100, yOffset=75) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0022 begin`);
      const actual: number = listOffsetOf(-100, 75);
      logInfo(`listOffsetOf(offset=-100, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}ListOffsetOf_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0023
     * @tc.name      ExpandTitle_ListOffsetOf_0023
     * @tc.desc      listOffsetOf(offset=-100, yOffset=80) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0023 begin`);
      const actual: number = listOffsetOf(-100, 80);
      logInfo(`listOffsetOf(offset=-100, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}ListOffsetOf_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0024
     * @tc.name      ExpandTitle_ListOffsetOf_0024
     * @tc.desc      listOffsetOf(offset=-100, yOffset=85) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0024 begin`);
      const actual: number = listOffsetOf(-100, 85);
      logInfo(`listOffsetOf(offset=-100, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}ListOffsetOf_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0025
     * @tc.name      ExpandTitle_ListOffsetOf_0025
     * @tc.desc      listOffsetOf(offset=-100, yOffset=90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0025 begin`);
      const actual: number = listOffsetOf(-100, 90);
      logInfo(`listOffsetOf(offset=-100, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}ListOffsetOf_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0026
     * @tc.name      ExpandTitle_ListOffsetOf_0026
     * @tc.desc      listOffsetOf(offset=-100, yOffset=95) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0026 begin`);
      const actual: number = listOffsetOf(-100, 95);
      logInfo(`listOffsetOf(offset=-100, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}ListOffsetOf_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0027
     * @tc.name      ExpandTitle_ListOffsetOf_0027
     * @tc.desc      listOffsetOf(offset=-100, yOffset=-3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0027 begin`);
      const actual: number = listOffsetOf(-100, -3);
      logInfo(`listOffsetOf(offset=-100, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ListOffsetOf_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0028
     * @tc.name      ExpandTitle_ListOffsetOf_0028
     * @tc.desc      listOffsetOf(offset=-100, yOffset=52.83) returns -52.83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0028 begin`);
      const actual: number = listOffsetOf(-100, 52.83);
      logInfo(`listOffsetOf(offset=-100, yOffset=52.83): actual=${actual}`);
      expect(actual).assertClose(-52.83, PRECISION);
      logInfo(`${BUNDLE}ListOffsetOf_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0029
     * @tc.name      ExpandTitle_ListOffsetOf_0029
     * @tc.desc      listOffsetOf(offset=-100, yOffset=105) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0029 begin`);
      const actual: number = listOffsetOf(-100, 105);
      logInfo(`listOffsetOf(offset=-100, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ListOffsetOf_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0030
     * @tc.name      ExpandTitle_ListOffsetOf_0030
     * @tc.desc      listOffsetOf(offset=-100, yOffset=179) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0030 begin`);
      const actual: number = listOffsetOf(-100, 179);
      logInfo(`listOffsetOf(offset=-100, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ListOffsetOf_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0031
     * @tc.name      ExpandTitle_ListOffsetOf_0031
     * @tc.desc      listOffsetOf(offset=-1, yOffset=-100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0031 begin`);
      const actual: number = listOffsetOf(-1, -100);
      logInfo(`listOffsetOf(offset=-1, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ListOffsetOf_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0032
     * @tc.name      ExpandTitle_ListOffsetOf_0032
     * @tc.desc      listOffsetOf(offset=-1, yOffset=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0032 begin`);
      const actual: number = listOffsetOf(-1, -1);
      logInfo(`listOffsetOf(offset=-1, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ListOffsetOf_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0033
     * @tc.name      ExpandTitle_ListOffsetOf_0033
     * @tc.desc      listOffsetOf(offset=-1, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0033 begin`);
      const actual: number = listOffsetOf(-1, 0);
      logInfo(`listOffsetOf(offset=-1, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0034
     * @tc.name      ExpandTitle_ListOffsetOf_0034
     * @tc.desc      listOffsetOf(offset=-1, yOffset=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0034 begin`);
      const actual: number = listOffsetOf(-1, 1);
      logInfo(`listOffsetOf(offset=-1, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0035
     * @tc.name      ExpandTitle_ListOffsetOf_0035
     * @tc.desc      listOffsetOf(offset=-1, yOffset=50) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0035 begin`);
      const actual: number = listOffsetOf(-1, 50);
      logInfo(`listOffsetOf(offset=-1, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0036
     * @tc.name      ExpandTitle_ListOffsetOf_0036
     * @tc.desc      listOffsetOf(offset=-1, yOffset=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0036 begin`);
      const actual: number = listOffsetOf(-1, 100);
      logInfo(`listOffsetOf(offset=-1, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0037
     * @tc.name      ExpandTitle_ListOffsetOf_0037
     * @tc.desc      listOffsetOf(offset=-1, yOffset=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0037 begin`);
      const actual: number = listOffsetOf(-1, 2);
      logInfo(`listOffsetOf(offset=-1, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0038
     * @tc.name      ExpandTitle_ListOffsetOf_0038
     * @tc.desc      listOffsetOf(offset=-1, yOffset=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0038 begin`);
      const actual: number = listOffsetOf(-1, 3);
      logInfo(`listOffsetOf(offset=-1, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0039
     * @tc.name      ExpandTitle_ListOffsetOf_0039
     * @tc.desc      listOffsetOf(offset=-1, yOffset=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0039 begin`);
      const actual: number = listOffsetOf(-1, 10);
      logInfo(`listOffsetOf(offset=-1, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0040
     * @tc.name      ExpandTitle_ListOffsetOf_0040
     * @tc.desc      listOffsetOf(offset=-1, yOffset=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0040 begin`);
      const actual: number = listOffsetOf(-1, 5);
      logInfo(`listOffsetOf(offset=-1, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0041
     * @tc.name      ExpandTitle_ListOffsetOf_0041
     * @tc.desc      listOffsetOf(offset=-1, yOffset=15) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0041 begin`);
      const actual: number = listOffsetOf(-1, 15);
      logInfo(`listOffsetOf(offset=-1, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0042
     * @tc.name      ExpandTitle_ListOffsetOf_0042
     * @tc.desc      listOffsetOf(offset=-1, yOffset=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0042 begin`);
      const actual: number = listOffsetOf(-1, 20);
      logInfo(`listOffsetOf(offset=-1, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0043
     * @tc.name      ExpandTitle_ListOffsetOf_0043
     * @tc.desc      listOffsetOf(offset=-1, yOffset=25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0043 begin`);
      const actual: number = listOffsetOf(-1, 25);
      logInfo(`listOffsetOf(offset=-1, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0044
     * @tc.name      ExpandTitle_ListOffsetOf_0044
     * @tc.desc      listOffsetOf(offset=-1, yOffset=30) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0044 begin`);
      const actual: number = listOffsetOf(-1, 30);
      logInfo(`listOffsetOf(offset=-1, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0045
     * @tc.name      ExpandTitle_ListOffsetOf_0045
     * @tc.desc      listOffsetOf(offset=-1, yOffset=35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0045 begin`);
      const actual: number = listOffsetOf(-1, 35);
      logInfo(`listOffsetOf(offset=-1, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0046
     * @tc.name      ExpandTitle_ListOffsetOf_0046
     * @tc.desc      listOffsetOf(offset=-1, yOffset=40) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0046 begin`);
      const actual: number = listOffsetOf(-1, 40);
      logInfo(`listOffsetOf(offset=-1, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0047
     * @tc.name      ExpandTitle_ListOffsetOf_0047
     * @tc.desc      listOffsetOf(offset=-1, yOffset=45) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0047 begin`);
      const actual: number = listOffsetOf(-1, 45);
      logInfo(`listOffsetOf(offset=-1, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0048
     * @tc.name      ExpandTitle_ListOffsetOf_0048
     * @tc.desc      listOffsetOf(offset=-1, yOffset=55) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0048 begin`);
      const actual: number = listOffsetOf(-1, 55);
      logInfo(`listOffsetOf(offset=-1, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0049
     * @tc.name      ExpandTitle_ListOffsetOf_0049
     * @tc.desc      listOffsetOf(offset=-1, yOffset=60) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0049 begin`);
      const actual: number = listOffsetOf(-1, 60);
      logInfo(`listOffsetOf(offset=-1, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0050
     * @tc.name      ExpandTitle_ListOffsetOf_0050
     * @tc.desc      listOffsetOf(offset=-1, yOffset=65) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0050 begin`);
      const actual: number = listOffsetOf(-1, 65);
      logInfo(`listOffsetOf(offset=-1, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0051
     * @tc.name      ExpandTitle_ListOffsetOf_0051
     * @tc.desc      listOffsetOf(offset=-1, yOffset=70) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0051 begin`);
      const actual: number = listOffsetOf(-1, 70);
      logInfo(`listOffsetOf(offset=-1, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0052
     * @tc.name      ExpandTitle_ListOffsetOf_0052
     * @tc.desc      listOffsetOf(offset=-1, yOffset=75) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0052 begin`);
      const actual: number = listOffsetOf(-1, 75);
      logInfo(`listOffsetOf(offset=-1, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0053
     * @tc.name      ExpandTitle_ListOffsetOf_0053
     * @tc.desc      listOffsetOf(offset=-1, yOffset=80) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0053 begin`);
      const actual: number = listOffsetOf(-1, 80);
      logInfo(`listOffsetOf(offset=-1, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0054
     * @tc.name      ExpandTitle_ListOffsetOf_0054
     * @tc.desc      listOffsetOf(offset=-1, yOffset=85) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0054 begin`);
      const actual: number = listOffsetOf(-1, 85);
      logInfo(`listOffsetOf(offset=-1, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0055
     * @tc.name      ExpandTitle_ListOffsetOf_0055
     * @tc.desc      listOffsetOf(offset=-1, yOffset=90) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0055 begin`);
      const actual: number = listOffsetOf(-1, 90);
      logInfo(`listOffsetOf(offset=-1, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0056
     * @tc.name      ExpandTitle_ListOffsetOf_0056
     * @tc.desc      listOffsetOf(offset=-1, yOffset=95) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0056 begin`);
      const actual: number = listOffsetOf(-1, 95);
      logInfo(`listOffsetOf(offset=-1, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0057
     * @tc.name      ExpandTitle_ListOffsetOf_0057
     * @tc.desc      listOffsetOf(offset=-1, yOffset=105) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0057 begin`);
      const actual: number = listOffsetOf(-1, 105);
      logInfo(`listOffsetOf(offset=-1, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0058
     * @tc.name      ExpandTitle_ListOffsetOf_0058
     * @tc.desc      listOffsetOf(offset=-1, yOffset=179) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0058 begin`);
      const actual: number = listOffsetOf(-1, 179);
      logInfo(`listOffsetOf(offset=-1, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0059
     * @tc.name      ExpandTitle_ListOffsetOf_0059
     * @tc.desc      listOffsetOf(offset=-1, yOffset=-3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0059 begin`);
      const actual: number = listOffsetOf(-1, -3);
      logInfo(`listOffsetOf(offset=-1, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ListOffsetOf_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0060
     * @tc.name      ExpandTitle_ListOffsetOf_0060
     * @tc.desc      listOffsetOf(offset=-1, yOffset=52.83) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0060 begin`);
      const actual: number = listOffsetOf(-1, 52.83);
      logInfo(`listOffsetOf(offset=-1, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListOffsetOf_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0061
     * @tc.name      ExpandTitle_ListOffsetOf_0061
     * @tc.desc      listOffsetOf(offset=0, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0061 begin`);
      const actual: number = listOffsetOf(0, -100);
      logInfo(`listOffsetOf(offset=0, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0062
     * @tc.name      ExpandTitle_ListOffsetOf_0062
     * @tc.desc      listOffsetOf(offset=0, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0062 begin`);
      const actual: number = listOffsetOf(0, -1);
      logInfo(`listOffsetOf(offset=0, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0063
     * @tc.name      ExpandTitle_ListOffsetOf_0063
     * @tc.desc      listOffsetOf(offset=0, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0063 begin`);
      const actual: number = listOffsetOf(0, 0);
      logInfo(`listOffsetOf(offset=0, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0064
     * @tc.name      ExpandTitle_ListOffsetOf_0064
     * @tc.desc      listOffsetOf(offset=0, yOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0064 begin`);
      const actual: number = listOffsetOf(0, 1);
      logInfo(`listOffsetOf(offset=0, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0065
     * @tc.name      ExpandTitle_ListOffsetOf_0065
     * @tc.desc      listOffsetOf(offset=0, yOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0065 begin`);
      const actual: number = listOffsetOf(0, 50);
      logInfo(`listOffsetOf(offset=0, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0066
     * @tc.name      ExpandTitle_ListOffsetOf_0066
     * @tc.desc      listOffsetOf(offset=0, yOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0066 begin`);
      const actual: number = listOffsetOf(0, 100);
      logInfo(`listOffsetOf(offset=0, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0067
     * @tc.name      ExpandTitle_ListOffsetOf_0067
     * @tc.desc      listOffsetOf(offset=0, yOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0067 begin`);
      const actual: number = listOffsetOf(0, 2);
      logInfo(`listOffsetOf(offset=0, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0068
     * @tc.name      ExpandTitle_ListOffsetOf_0068
     * @tc.desc      listOffsetOf(offset=0, yOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0068 begin`);
      const actual: number = listOffsetOf(0, 3);
      logInfo(`listOffsetOf(offset=0, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0069
     * @tc.name      ExpandTitle_ListOffsetOf_0069
     * @tc.desc      listOffsetOf(offset=0, yOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0069 begin`);
      const actual: number = listOffsetOf(0, 10);
      logInfo(`listOffsetOf(offset=0, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0070
     * @tc.name      ExpandTitle_ListOffsetOf_0070
     * @tc.desc      listOffsetOf(offset=0, yOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0070 begin`);
      const actual: number = listOffsetOf(0, 5);
      logInfo(`listOffsetOf(offset=0, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0071
     * @tc.name      ExpandTitle_ListOffsetOf_0071
     * @tc.desc      listOffsetOf(offset=0, yOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0071 begin`);
      const actual: number = listOffsetOf(0, 15);
      logInfo(`listOffsetOf(offset=0, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0072
     * @tc.name      ExpandTitle_ListOffsetOf_0072
     * @tc.desc      listOffsetOf(offset=0, yOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0072 begin`);
      const actual: number = listOffsetOf(0, 20);
      logInfo(`listOffsetOf(offset=0, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0073
     * @tc.name      ExpandTitle_ListOffsetOf_0073
     * @tc.desc      listOffsetOf(offset=0, yOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0073 begin`);
      const actual: number = listOffsetOf(0, 25);
      logInfo(`listOffsetOf(offset=0, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0074
     * @tc.name      ExpandTitle_ListOffsetOf_0074
     * @tc.desc      listOffsetOf(offset=0, yOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0074 begin`);
      const actual: number = listOffsetOf(0, 30);
      logInfo(`listOffsetOf(offset=0, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0075
     * @tc.name      ExpandTitle_ListOffsetOf_0075
     * @tc.desc      listOffsetOf(offset=0, yOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0075 begin`);
      const actual: number = listOffsetOf(0, 35);
      logInfo(`listOffsetOf(offset=0, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0076
     * @tc.name      ExpandTitle_ListOffsetOf_0076
     * @tc.desc      listOffsetOf(offset=0, yOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0076 begin`);
      const actual: number = listOffsetOf(0, 40);
      logInfo(`listOffsetOf(offset=0, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0077
     * @tc.name      ExpandTitle_ListOffsetOf_0077
     * @tc.desc      listOffsetOf(offset=0, yOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0077 begin`);
      const actual: number = listOffsetOf(0, 45);
      logInfo(`listOffsetOf(offset=0, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0078
     * @tc.name      ExpandTitle_ListOffsetOf_0078
     * @tc.desc      listOffsetOf(offset=0, yOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0078 begin`);
      const actual: number = listOffsetOf(0, 55);
      logInfo(`listOffsetOf(offset=0, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0079
     * @tc.name      ExpandTitle_ListOffsetOf_0079
     * @tc.desc      listOffsetOf(offset=0, yOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0079 begin`);
      const actual: number = listOffsetOf(0, 60);
      logInfo(`listOffsetOf(offset=0, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0080
     * @tc.name      ExpandTitle_ListOffsetOf_0080
     * @tc.desc      listOffsetOf(offset=0, yOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0080 begin`);
      const actual: number = listOffsetOf(0, 65);
      logInfo(`listOffsetOf(offset=0, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0081
     * @tc.name      ExpandTitle_ListOffsetOf_0081
     * @tc.desc      listOffsetOf(offset=0, yOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0081 begin`);
      const actual: number = listOffsetOf(0, 70);
      logInfo(`listOffsetOf(offset=0, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0082
     * @tc.name      ExpandTitle_ListOffsetOf_0082
     * @tc.desc      listOffsetOf(offset=0, yOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0082 begin`);
      const actual: number = listOffsetOf(0, 75);
      logInfo(`listOffsetOf(offset=0, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0083
     * @tc.name      ExpandTitle_ListOffsetOf_0083
     * @tc.desc      listOffsetOf(offset=0, yOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0083 begin`);
      const actual: number = listOffsetOf(0, 80);
      logInfo(`listOffsetOf(offset=0, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0084
     * @tc.name      ExpandTitle_ListOffsetOf_0084
     * @tc.desc      listOffsetOf(offset=0, yOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0084 begin`);
      const actual: number = listOffsetOf(0, 85);
      logInfo(`listOffsetOf(offset=0, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0085
     * @tc.name      ExpandTitle_ListOffsetOf_0085
     * @tc.desc      listOffsetOf(offset=0, yOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0085 begin`);
      const actual: number = listOffsetOf(0, 90);
      logInfo(`listOffsetOf(offset=0, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0086
     * @tc.name      ExpandTitle_ListOffsetOf_0086
     * @tc.desc      listOffsetOf(offset=0, yOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0086 begin`);
      const actual: number = listOffsetOf(0, 95);
      logInfo(`listOffsetOf(offset=0, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0087
     * @tc.name      ExpandTitle_ListOffsetOf_0087
     * @tc.desc      listOffsetOf(offset=0, yOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0087 begin`);
      const actual: number = listOffsetOf(0, 105);
      logInfo(`listOffsetOf(offset=0, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0088
     * @tc.name      ExpandTitle_ListOffsetOf_0088
     * @tc.desc      listOffsetOf(offset=0, yOffset=179) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0088 begin`);
      const actual: number = listOffsetOf(0, 179);
      logInfo(`listOffsetOf(offset=0, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0089
     * @tc.name      ExpandTitle_ListOffsetOf_0089
     * @tc.desc      listOffsetOf(offset=0, yOffset=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0089 begin`);
      const actual: number = listOffsetOf(0, -3);
      logInfo(`listOffsetOf(offset=0, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0090
     * @tc.name      ExpandTitle_ListOffsetOf_0090
     * @tc.desc      listOffsetOf(offset=0, yOffset=52.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0090 begin`);
      const actual: number = listOffsetOf(0, 52.83);
      logInfo(`listOffsetOf(offset=0, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0091
     * @tc.name      ExpandTitle_ListOffsetOf_0091
     * @tc.desc      listOffsetOf(offset=1, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0091 begin`);
      const actual: number = listOffsetOf(1, -100);
      logInfo(`listOffsetOf(offset=1, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0092
     * @tc.name      ExpandTitle_ListOffsetOf_0092
     * @tc.desc      listOffsetOf(offset=1, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0092 begin`);
      const actual: number = listOffsetOf(1, -1);
      logInfo(`listOffsetOf(offset=1, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0093
     * @tc.name      ExpandTitle_ListOffsetOf_0093
     * @tc.desc      listOffsetOf(offset=1, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0093 begin`);
      const actual: number = listOffsetOf(1, 0);
      logInfo(`listOffsetOf(offset=1, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0094
     * @tc.name      ExpandTitle_ListOffsetOf_0094
     * @tc.desc      listOffsetOf(offset=1, yOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0094 begin`);
      const actual: number = listOffsetOf(1, 1);
      logInfo(`listOffsetOf(offset=1, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0095
     * @tc.name      ExpandTitle_ListOffsetOf_0095
     * @tc.desc      listOffsetOf(offset=1, yOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0095 begin`);
      const actual: number = listOffsetOf(1, 50);
      logInfo(`listOffsetOf(offset=1, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0096
     * @tc.name      ExpandTitle_ListOffsetOf_0096
     * @tc.desc      listOffsetOf(offset=1, yOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0096 begin`);
      const actual: number = listOffsetOf(1, 100);
      logInfo(`listOffsetOf(offset=1, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0096 end`);
    });
  });
}
