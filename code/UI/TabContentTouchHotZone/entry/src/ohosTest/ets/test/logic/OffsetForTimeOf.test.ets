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
import { offsetForTimeOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetForTimeOf (96 cases). */
export default function offsetForTimeOfTest(): void {
  describe('OffsetForTimeOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0001
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0001
     * @tc.desc      offsetForTimeOf(time=0, totalTime=0, screenW=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0001 begin`);
      const actual: number = offsetForTimeOf(0, 0, 0);
      logInfo(`offsetForTimeOf(time=0, totalTime=0, scre...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}OffsetForTimeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0002
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0002
     * @tc.desc      offsetForTimeOf(time=500, totalTime=0, screenW=0) returns Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0002 begin`);
      const actual: number = offsetForTimeOf(500, 0, 0);
      logInfo(`offsetForTimeOf(time=500, totalTime=0, sc...: actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}OffsetForTimeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0003
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0003
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=0, screenW=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0003 begin`);
      const actual: number = offsetForTimeOf(-1, 0, 0);
      logInfo(`offsetForTimeOf(time=-1, totalTime=0, scr...: actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}OffsetForTimeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0004
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0004
     * @tc.desc      offsetForTimeOf(time=0, totalTime=500, screenW=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0004 begin`);
      const actual: number = offsetForTimeOf(0, 500, 0);
      logInfo(`offsetForTimeOf(time=0, totalTime=500, sc...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}OffsetForTimeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0005
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0005
     * @tc.desc      offsetForTimeOf(time=500, totalTime=999, screenW=3) returns -13.513513513513514
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0005 begin`);
      const actual: number = offsetForTimeOf(500, 999, 3);
      logInfo(`offsetForTimeOf(time=500, totalTime=999, ...: actual=${actual}`);
      expect(actual).assertClose(-13.513513513513514, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0006
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0006
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=500, screenW=0) returns -3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0006 begin`);
      const actual: number = offsetForTimeOf(60000, 500, 0);
      logInfo(`offsetForTimeOf(time=60000, totalTime=500...: actual=${actual}`);
      expect(actual).assertEqual(-3600);
      logInfo(`${BUNDLE}OffsetForTimeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0007
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0007
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=3600000, screenW=2) returns -0.0077777777777777776
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0007 begin`);
      const actual: number = offsetForTimeOf(1000, 3600000, 2);
      logInfo(`offsetForTimeOf(time=1000, totalTime=3600...: actual=${actual}`);
      expect(actual).assertClose(-0.0077777777777777776, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0008
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0008
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=500, screenW=33.84) returns 460.8000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0008 begin`);
      const actual: number = offsetForTimeOf(60000, 500, 33.84);
      logInfo(`offsetForTimeOf(time=60000, totalTime=500...: actual=${actual}`);
      expect(actual).assertClose(460.8000000000004, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0009
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0009
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=59999, screenW=15) returns 0.0002500041667361123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0009 begin`);
      const actual: number = offsetForTimeOf(-1, 59999, 15);
      logInfo(`offsetForTimeOf(time=-1, totalTime=59999,...: actual=${actual}`);
      expect(actual).assertClose(0.0002500041667361123, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0010
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0010
     * @tc.desc      offsetForTimeOf(time=1, totalTime=1, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0010 begin`);
      const actual: number = offsetForTimeOf(1, 1, 1);
      logInfo(`offsetForTimeOf(time=1, totalTime=1, scre...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}OffsetForTimeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0011
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0011
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=999, screenW=15) returns -54039.03903903904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0011 begin`);
      const actual: number = offsetForTimeOf(3599000, 999, 15);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=9...: actual=${actual}`);
      expect(actual).assertClose(-54039.03903903904, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0012
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0012
     * @tc.desc      offsetForTimeOf(time=1, totalTime=60000, screenW=0) returns -0.0005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0012 begin`);
      const actual: number = offsetForTimeOf(1, 60000, 0);
      logInfo(`offsetForTimeOf(time=1, totalTime=60000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0005, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0013
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0013
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=-1, screenW=0) returns 1830000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0013 begin`);
      const actual: number = offsetForTimeOf(61000, -1, 0);
      logInfo(`offsetForTimeOf(time=61000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1830000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0014
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0014
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3599000, screenW=-1) returns -0.000008613503751041957
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0014 begin`);
      const actual: number = offsetForTimeOf(1, 3599000, -1);
      logInfo(`offsetForTimeOf(time=1, totalTime=3599000...: actual=${actual}`);
      expect(actual).assertClose(-0.000008613503751041957, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0015
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0015
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=3599000, screenW=10) returns -0.005557099194220616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0015 begin`);
      const actual: number = offsetForTimeOf(1000, 3599000, 10);
      logInfo(`offsetForTimeOf(time=1000, totalTime=3599...: actual=${actual}`);
      expect(actual).assertClose(-0.005557099194220616, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0016
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0016
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=59999, screenW=20) returns -599.8433307221787
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0016 begin`);
      const actual: number = offsetForTimeOf(3599000, 59999, 20);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=5...: actual=${actual}`);
      expect(actual).assertClose(-599.8433307221787, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0017
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0017
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=1000, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0017 begin`);
      const actual: number = offsetForTimeOf(1000, 1000, -1);
      logInfo(`offsetForTimeOf(time=1000, totalTime=1000...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}OffsetForTimeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0018
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0018
     * @tc.desc      offsetForTimeOf(time=1, totalTime=500, screenW=5) returns -0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0018 begin`);
      const actual: number = offsetForTimeOf(1, 500, 5);
      logInfo(`offsetForTimeOf(time=1, totalTime=500, sc...: actual=${actual}`);
      expect(actual).assertClose(-0.05, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0019
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0019
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=-1, screenW=25) returns 299995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0019 begin`);
      const actual: number = offsetForTimeOf(59999, -1, 25);
      logInfo(`offsetForTimeOf(time=59999, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(299995);
      logInfo(`${BUNDLE}OffsetForTimeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0020
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0020
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=60000, screenW=15) returns -0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0020 begin`);
      const actual: number = offsetForTimeOf(1000, 60000, 15);
      logInfo(`offsetForTimeOf(time=1000, totalTime=6000...: actual=${actual}`);
      expect(actual).assertClose(-0.25, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0021
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0021
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=2, screenW=3) returns 13.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0021 begin`);
      const actual: number = offsetForTimeOf(-1, 2, 3);
      logInfo(`offsetForTimeOf(time=-1, totalTime=2, scr...: actual=${actual}`);
      expect(actual).assertClose(13.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0022
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0022
     * @tc.desc      offsetForTimeOf(time=2, totalTime=3599000, screenW=100) returns 0.00003889969435954432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0022 begin`);
      const actual: number = offsetForTimeOf(2, 3599000, 100);
      logInfo(`offsetForTimeOf(time=2, totalTime=3599000...: actual=${actual}`);
      expect(actual).assertClose(0.00003889969435954432, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0023
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0023
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=60000, screenW=33.84) returns 3.8400000000000034
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0023 begin`);
      const actual: number = offsetForTimeOf(60000, 60000, 33.84);
      logInfo(`offsetForTimeOf(time=60000, totalTime=600...: actual=${actual}`);
      expect(actual).assertClose(3.8400000000000034, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0024
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0024
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=1, screenW=0) returns -1799970
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0024 begin`);
      const actual: number = offsetForTimeOf(59999, 1, 0);
      logInfo(`offsetForTimeOf(time=59999, totalTime=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1799970);
      logInfo(`${BUNDLE}OffsetForTimeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0025
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0025
     * @tc.desc      offsetForTimeOf(time=999, totalTime=1, screenW=10) returns -19980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0025 begin`);
      const actual: number = offsetForTimeOf(999, 1, 10);
      logInfo(`offsetForTimeOf(time=999, totalTime=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-19980);
      logInfo(`${BUNDLE}OffsetForTimeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0026
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0026
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=59999, screenW=15) returns -900.0150002500042
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0026 begin`);
      const actual: number = offsetForTimeOf(3600000, 59999, 15);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=5...: actual=${actual}`);
      expect(actual).assertClose(-900.0150002500042, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0027
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0027
     * @tc.desc      offsetForTimeOf(time=2, totalTime=59999, screenW=-1) returns -0.0010333505558425976
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0027 begin`);
      const actual: number = offsetForTimeOf(2, 59999, -1);
      logInfo(`offsetForTimeOf(time=2, totalTime=59999, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0010333505558425976, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0028
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0028
     * @tc.desc      offsetForTimeOf(time=999, totalTime=2, screenW=25) returns -2497.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0028 begin`);
      const actual: number = offsetForTimeOf(999, 2, 25);
      logInfo(`offsetForTimeOf(time=999, totalTime=2, sc...: actual=${actual}`);
      expect(actual).assertClose(-2497.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0029
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0029
     * @tc.desc      offsetForTimeOf(time=1, totalTime=61000, screenW=15) returns -0.0002459016393442623
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0029 begin`);
      const actual: number = offsetForTimeOf(1, 61000, 15);
      logInfo(`offsetForTimeOf(time=1, totalTime=61000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0002459016393442623, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0030
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0030
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=60000, screenW=25) returns -4.999916666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0030 begin`);
      const actual: number = offsetForTimeOf(59999, 60000, 25);
      logInfo(`offsetForTimeOf(time=59999, totalTime=600...: actual=${actual}`);
      expect(actual).assertClose(-4.999916666666667, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0031
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0031
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=500, screenW=15) returns -107970
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0031 begin`);
      const actual: number = offsetForTimeOf(3599000, 500, 15);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=5...: actual=${actual}`);
      expect(actual).assertEqual(-107970);
      logInfo(`${BUNDLE}OffsetForTimeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0032
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0032
     * @tc.desc      offsetForTimeOf(time=1, totalTime=60000, screenW=10) returns -0.0003333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0032 begin`);
      const actual: number = offsetForTimeOf(1, 60000, 10);
      logInfo(`offsetForTimeOf(time=1, totalTime=60000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0003333333333333334, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0033
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0033
     * @tc.desc      offsetForTimeOf(time=1, totalTime=-1, screenW=100) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0033 begin`);
      const actual: number = offsetForTimeOf(1, -1, 100);
      logInfo(`offsetForTimeOf(time=1, totalTime=-1, scr...: actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}OffsetForTimeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0034
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0034
     * @tc.desc      offsetForTimeOf(time=2, totalTime=2, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0034 begin`);
      const actual: number = offsetForTimeOf(2, 2, 15);
      logInfo(`offsetForTimeOf(time=2, totalTime=2, scre...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}OffsetForTimeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0035
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0035
     * @tc.desc      offsetForTimeOf(time=500, totalTime=500, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0035 begin`);
      const actual: number = offsetForTimeOf(500, 500, 2);
      logInfo(`offsetForTimeOf(time=500, totalTime=500, ...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}OffsetForTimeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0036
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0036
     * @tc.desc      offsetForTimeOf(time=2, totalTime=1, screenW=5) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0036 begin`);
      const actual: number = offsetForTimeOf(2, 1, 5);
      logInfo(`offsetForTimeOf(time=2, totalTime=1, scre...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}OffsetForTimeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0037
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0037
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=1, screenW=25) returns -299995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0037 begin`);
      const actual: number = offsetForTimeOf(59999, 1, 25);
      logInfo(`offsetForTimeOf(time=59999, totalTime=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-299995);
      logInfo(`${BUNDLE}OffsetForTimeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0038
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0038
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3599000, screenW=33.84) returns 0.0000010669630452903595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0038 begin`);
      const actual: number = offsetForTimeOf(1, 3599000, 33.84);
      logInfo(`offsetForTimeOf(time=1, totalTime=3599000...: actual=${actual}`);
      expect(actual).assertClose(0.0000010669630452903595, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0039
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0039
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=60000, screenW=3) returns -1619.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0039 begin`);
      const actual: number = offsetForTimeOf(3599000, 60000, 3);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-1619.55, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0040
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0040
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=2, screenW=15) returns -449992.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0040 begin`);
      const actual: number = offsetForTimeOf(59999, 2, 15);
      logInfo(`offsetForTimeOf(time=59999, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertClose(-449992.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0041
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0041
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=60000, screenW=15) returns -900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0041 begin`);
      const actual: number = offsetForTimeOf(3600000, 60000, 15);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=6...: actual=${actual}`);
      expect(actual).assertEqual(-900);
      logInfo(`${BUNDLE}OffsetForTimeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0042
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0042
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3600000, screenW=2) returns -0.000007777777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0042 begin`);
      const actual: number = offsetForTimeOf(1, 3600000, 2);
      logInfo(`offsetForTimeOf(time=1, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(-0.000007777777777777777, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0043
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0043
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=500, screenW=15) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0043 begin`);
      const actual: number = offsetForTimeOf(-1, 500, 15);
      logInfo(`offsetForTimeOf(time=-1, totalTime=500, s...: actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0044
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0044
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=3600000, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0044 begin`);
      const actual: number = offsetForTimeOf(3600000, 3600000, 3);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=3...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}OffsetForTimeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0045
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0045
     * @tc.desc      offsetForTimeOf(time=500, totalTime=3599000, screenW=1) returns -0.004028896915809947
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0045 begin`);
      const actual: number = offsetForTimeOf(500, 3599000, 1);
      logInfo(`offsetForTimeOf(time=500, totalTime=35990...: actual=${actual}`);
      expect(actual).assertClose(-0.004028896915809947, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0046
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0046
     * @tc.desc      offsetForTimeOf(time=1, totalTime=2, screenW=15) returns -7.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0046 begin`);
      const actual: number = offsetForTimeOf(1, 2, 15);
      logInfo(`offsetForTimeOf(time=1, totalTime=2, scre...: actual=${actual}`);
      expect(actual).assertClose(-7.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0047
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0047
     * @tc.desc      offsetForTimeOf(time=2, totalTime=500, screenW=33.84) returns 0.015360000000000014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0047 begin`);
      const actual: number = offsetForTimeOf(2, 500, 33.84);
      logInfo(`offsetForTimeOf(time=2, totalTime=500, sc...: actual=${actual}`);
      expect(actual).assertClose(0.015360000000000014, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0048
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0048
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=1000, screenW=20) returns -600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0048 begin`);
      const actual: number = offsetForTimeOf(60000, 1000, 20);
      logInfo(`offsetForTimeOf(time=60000, totalTime=100...: actual=${actual}`);
      expect(actual).assertEqual(-600);
      logInfo(`${BUNDLE}OffsetForTimeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0049
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0049
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=1, screenW=1) returns -1740000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0049 begin`);
      const actual: number = offsetForTimeOf(60000, 1, 1);
      logInfo(`offsetForTimeOf(time=60000, totalTime=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1740000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0050
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0050
     * @tc.desc      offsetForTimeOf(time=500, totalTime=999, screenW=33.84) returns 1.921921921921924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0050 begin`);
      const actual: number = offsetForTimeOf(500, 999, 33.84);
      logInfo(`offsetForTimeOf(time=500, totalTime=999, ...: actual=${actual}`);
      expect(actual).assertClose(1.921921921921924, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0051
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0051
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=2, screenW=20) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0051 begin`);
      const actual: number = offsetForTimeOf(1000, 2, 20);
      logInfo(`offsetForTimeOf(time=1000, totalTime=2, s...: actual=${actual}`);
      expect(actual).assertEqual(-5000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0052
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0052
     * @tc.desc      offsetForTimeOf(time=999, totalTime=500, screenW=-1) returns -61.938
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0052 begin`);
      const actual: number = offsetForTimeOf(999, 500, -1);
      logInfo(`offsetForTimeOf(time=999, totalTime=500, ...: actual=${actual}`);
      expect(actual).assertClose(-61.938, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0053
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0053
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=999, screenW=1) returns -104475.47547547547
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0053 begin`);
      const actual: number = offsetForTimeOf(3599000, 999, 1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=9...: actual=${actual}`);
      expect(actual).assertClose(-104475.47547547547, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0054
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0054
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3600000, screenW=5) returns -0.000006944444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0054 begin`);
      const actual: number = offsetForTimeOf(1, 3600000, 5);
      logInfo(`offsetForTimeOf(time=1, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(-0.000006944444444444444, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0055
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0055
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=3599000, screenW=10) returns -0.333425951653237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0055 begin`);
      const actual: number = offsetForTimeOf(60000, 3599000, 10);
      logInfo(`offsetForTimeOf(time=60000, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.333425951653237, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0056
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0056
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=999, screenW=33.84) returns 230.63063063063083
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0056 begin`);
      const actual: number = offsetForTimeOf(60000, 999, 33.84);
      logInfo(`offsetForTimeOf(time=60000, totalTime=999...: actual=${actual}`);
      expect(actual).assertClose(230.63063063063083, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0057
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0057
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=1000, screenW=0) returns -1799.97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0057 begin`);
      const actual: number = offsetForTimeOf(59999, 1000, 0);
      logInfo(`offsetForTimeOf(time=59999, totalTime=100...: actual=${actual}`);
      expect(actual).assertClose(-1799.97, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0058
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0058
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3599000, screenW=20) returns -0.0000027785495971103087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0058 begin`);
      const actual: number = offsetForTimeOf(1, 3599000, 20);
      logInfo(`offsetForTimeOf(time=1, totalTime=3599000...: actual=${actual}`);
      expect(actual).assertClose(-0.0000027785495971103087, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0059
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0059
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=2, screenW=15) returns -450000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0059 begin`);
      const actual: number = offsetForTimeOf(60000, 2, 15);
      logInfo(`offsetForTimeOf(time=60000, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-450000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0060
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0060
     * @tc.desc      offsetForTimeOf(time=999, totalTime=3599000, screenW=10) returns -0.005551542095026396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0060 begin`);
      const actual: number = offsetForTimeOf(999, 3599000, 10);
      logInfo(`offsetForTimeOf(time=999, totalTime=35990...: actual=${actual}`);
      expect(actual).assertClose(-0.005551542095026396, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0061
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0061
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=3600000, screenW=5) returns -24.993055555555554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0061 begin`);
      const actual: number = offsetForTimeOf(3599000, 3600000, 5);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=3...: actual=${actual}`);
      expect(actual).assertClose(-24.993055555555554, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0062
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0062
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=500, screenW=3) returns -54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0062 begin`);
      const actual: number = offsetForTimeOf(1000, 500, 3);
      logInfo(`offsetForTimeOf(time=1000, totalTime=500,...: actual=${actual}`);
      expect(actual).assertEqual(-54);
      logInfo(`${BUNDLE}OffsetForTimeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0063
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0063
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=500, screenW=-1) returns -223138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0063 begin`);
      const actual: number = offsetForTimeOf(3599000, 500, -1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=5...: actual=${actual}`);
      expect(actual).assertEqual(-223138);
      logInfo(`${BUNDLE}OffsetForTimeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0064
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0064
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=500, screenW=10) returns -143960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0064 begin`);
      const actual: number = offsetForTimeOf(3599000, 500, 10);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=5...: actual=${actual}`);
      expect(actual).assertEqual(-143960);
      logInfo(`${BUNDLE}OffsetForTimeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0065
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0065
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=60000, screenW=10) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0065 begin`);
      const actual: number = offsetForTimeOf(1000, 60000, 10);
      logInfo(`offsetForTimeOf(time=1000, totalTime=6000...: actual=${actual}`);
      expect(actual).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0066
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0066
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=-1, screenW=100) returns -251930000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0066 begin`);
      const actual: number = offsetForTimeOf(3599000, -1, 100);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=-...: actual=${actual}`);
      expect(actual).assertEqual(-251930000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0067
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0067
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=61000, screenW=15) returns -885.2459016393442
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0067 begin`);
      const actual: number = offsetForTimeOf(3600000, 61000, 15);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-885.2459016393442, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0068
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0068
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=3600000, screenW=1) returns -0.48332527777777784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0068 begin`);
      const actual: number = offsetForTimeOf(59999, 3600000, 1);
      logInfo(`offsetForTimeOf(time=59999, totalTime=360...: actual=${actual}`);
      expect(actual).assertClose(-0.48332527777777784, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0069
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0069
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=999, screenW=25) returns -305.3053053053053
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0069 begin`);
      const actual: number = offsetForTimeOf(61000, 999, 25);
      logInfo(`offsetForTimeOf(time=61000, totalTime=999...: actual=${actual}`);
      expect(actual).assertClose(-305.3053053053053, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0070
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0070
     * @tc.desc      offsetForTimeOf(time=2, totalTime=-1, screenW=15) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0070 begin`);
      const actual: number = offsetForTimeOf(2, -1, 15);
      logInfo(`offsetForTimeOf(time=2, totalTime=-1, scr...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}OffsetForTimeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0071
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0071
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=3599000, screenW=5) returns -0.423728813559322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0071 begin`);
      const actual: number = offsetForTimeOf(61000, 3599000, 5);
      logInfo(`offsetForTimeOf(time=61000, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.423728813559322, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0072
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0072
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=59999, screenW=-1) returns -1859.514325238754
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0072 begin`);
      const actual: number = offsetForTimeOf(3599000, 59999, -1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=5...: actual=${actual}`);
      expect(actual).assertClose(-1859.514325238754, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0073
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0073
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=60000, screenW=2) returns -1679.5333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0073 begin`);
      const actual: number = offsetForTimeOf(3599000, 60000, 2);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-1679.5333333333333, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0074
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0074
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=61000, screenW=-1) returns -30.491803278688526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0074 begin`);
      const actual: number = offsetForTimeOf(60000, 61000, -1);
      logInfo(`offsetForTimeOf(time=60000, totalTime=610...: actual=${actual}`);
      expect(actual).assertClose(-30.491803278688526, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0075
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0075
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=60000, screenW=100) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0075 begin`);
      const actual: number = offsetForTimeOf(60000, 60000, 100);
      logInfo(`offsetForTimeOf(time=60000, totalTime=600...: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}OffsetForTimeOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0076
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0076
     * @tc.desc      offsetForTimeOf(time=2, totalTime=60000, screenW=3) returns -0.0009000000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0076 begin`);
      const actual: number = offsetForTimeOf(2, 60000, 3);
      logInfo(`offsetForTimeOf(time=2, totalTime=60000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0009000000000000001, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0077
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0077
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=3599000, screenW=2) returns 0.000007779938871908864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0077 begin`);
      const actual: number = offsetForTimeOf(-1, 3599000, 2);
      logInfo(`offsetForTimeOf(time=-1, totalTime=359900...: actual=${actual}`);
      expect(actual).assertClose(0.000007779938871908864, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0078
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0078
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=999, screenW=5) returns -25.025025025025027
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0078 begin`);
      const actual: number = offsetForTimeOf(1000, 999, 5);
      logInfo(`offsetForTimeOf(time=1000, totalTime=999,...: actual=${actual}`);
      expect(actual).assertClose(-25.025025025025027, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0079
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0079
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=60000, screenW=1) returns -1739.5166666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0079 begin`);
      const actual: number = offsetForTimeOf(3599000, 60000, 1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-1739.5166666666667, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0080
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0080
     * @tc.desc      offsetForTimeOf(time=999, totalTime=59999, screenW=0) returns -0.49950832513875226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0080 begin`);
      const actual: number = offsetForTimeOf(999, 59999, 0);
      logInfo(`offsetForTimeOf(time=999, totalTime=59999...: actual=${actual}`);
      expect(actual).assertClose(-0.49950832513875226, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0081
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0081
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=3599000, screenW=-1) returns -31.008613503751043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0081 begin`);
      const actual: number = offsetForTimeOf(3600000, 3599000, -1);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=3...: actual=${actual}`);
      expect(actual).assertClose(-31.008613503751043, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0082
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0082
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=61000, screenW=100) returns -0.0011475409836065574
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0082 begin`);
      const actual: number = offsetForTimeOf(-1, 61000, 100);
      logInfo(`offsetForTimeOf(time=-1, totalTime=61000,...: actual=${actual}`);
      expect(actual).assertClose(-0.0011475409836065574, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0083
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0083
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=500, screenW=-1) returns -3720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0083 begin`);
      const actual: number = offsetForTimeOf(60000, 500, -1);
      logInfo(`offsetForTimeOf(time=60000, totalTime=500...: actual=${actual}`);
      expect(actual).assertEqual(-3720);
      logInfo(`${BUNDLE}OffsetForTimeOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0084
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0084
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=1, screenW=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0084 begin`);
      const actual: number = offsetForTimeOf(-1, 1, 2);
      logInfo(`offsetForTimeOf(time=-1, totalTime=1, scr...: actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}OffsetForTimeOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0085
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0085
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=1, screenW=0) returns -1830000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0085 begin`);
      const actual: number = offsetForTimeOf(61000, 1, 0);
      logInfo(`offsetForTimeOf(time=61000, totalTime=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1830000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0086
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0086
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=3600000, screenW=0) returns -29.991666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0086 begin`);
      const actual: number = offsetForTimeOf(3599000, 3600000, 0);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=3...: actual=${actual}`);
      expect(actual).assertClose(-29.991666666666667, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0087
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0087
     * @tc.desc      offsetForTimeOf(time=2, totalTime=59999, screenW=2) returns -0.0009333488891481525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0087 begin`);
      const actual: number = offsetForTimeOf(2, 59999, 2);
      logInfo(`offsetForTimeOf(time=2, totalTime=59999, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0009333488891481525, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0088
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0088
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3600000, screenW=-1) returns -0.00000861111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0088 begin`);
      const actual: number = offsetForTimeOf(1, 3600000, -1);
      logInfo(`offsetForTimeOf(time=1, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(-0.00000861111111111111, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0089
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0089
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=59999, screenW=0) returns 0.0005000083334722246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0089 begin`);
      const actual: number = offsetForTimeOf(-1, 59999, 0);
      logInfo(`offsetForTimeOf(time=-1, totalTime=59999,...: actual=${actual}`);
      expect(actual).assertClose(0.0005000083334722246, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0090
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0090
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=3599000, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0090 begin`);
      const actual: number = offsetForTimeOf(3599000, 3599000, 5);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=3...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}OffsetForTimeOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0091
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0091
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=3599000, screenW=1) returns -29.00805779383162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0091 begin`);
      const actual: number = offsetForTimeOf(3600000, 3599000, 1);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=3...: actual=${actual}`);
      expect(actual).assertClose(-29.00805779383162, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0092
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0092
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=1, screenW=15) returns -899985
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0092 begin`);
      const actual: number = offsetForTimeOf(59999, 1, 15);
      logInfo(`offsetForTimeOf(time=59999, totalTime=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-899985);
      logInfo(`${BUNDLE}OffsetForTimeOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0093
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0093
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=2, screenW=5) returns -44987500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0093 begin`);
      const actual: number = offsetForTimeOf(3599000, 2, 5);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=2...: actual=${actual}`);
      expect(actual).assertEqual(-44987500);
      logInfo(`${BUNDLE}OffsetForTimeOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0094
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0094
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=59999, screenW=1) returns -29.48382473041217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0094 begin`);
      const actual: number = offsetForTimeOf(61000, 59999, 1);
      logInfo(`offsetForTimeOf(time=61000, totalTime=599...: actual=${actual}`);
      expect(actual).assertClose(-29.48382473041217, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0095
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0095
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=61000, screenW=-1) returns -30.491295081967213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0095 begin`);
      const actual: number = offsetForTimeOf(59999, 61000, -1);
      logInfo(`offsetForTimeOf(time=59999, totalTime=610...: actual=${actual}`);
      expect(actual).assertClose(-30.491295081967213, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0096
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0096
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=2, screenW=33.84) returns 115198.0800000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0096 begin`);
      const actual: number = offsetForTimeOf(59999, 2, 33.84);
      logInfo(`offsetForTimeOf(time=59999, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertClose(115198.0800000001, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0096 end`);
    });
  });
}
