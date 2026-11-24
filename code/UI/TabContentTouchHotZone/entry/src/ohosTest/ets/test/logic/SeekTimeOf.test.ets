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
import { seekTimeOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for seekTimeOf (96 cases). */
export default function seekTimeOfTest(): void {
  describe('SeekTimeOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0001
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0001
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SeekTimeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0001 begin`);
      const actual: number = seekTimeOf(-100, 3, 0);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SeekTimeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0002
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0002
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=500) returns 1851.852
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SeekTimeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0002 begin`);
      const actual: number = seekTimeOf(-100, 3, 500);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(1851.852, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0003
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0003
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=3) returns 11.111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0003 begin`);
      const actual: number = seekTimeOf(-100, 3, 3);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(11.111, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0004
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0004
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=2) returns 7.407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0004 begin`);
      const actual: number = seekTimeOf(-100, 3, 2);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(7.407, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0005
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0005
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=4) returns 14.815
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0005 begin`);
      const actual: number = seekTimeOf(-100, 3, 4);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(14.815, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0006
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0006
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=999) returns 3700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0006 begin`);
      const actual: number = seekTimeOf(-100, 3, 999);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(3700);
      logInfo(`${BUNDLE}SeekTimeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0007
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0007
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=1000) returns 3703.704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0007 begin`);
      const actual: number = seekTimeOf(-100, 3, 1000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(3703.704, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0008
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0008
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=59999) returns 222218.519
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0008 begin`);
      const actual: number = seekTimeOf(-100, 3, 59999);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(222218.519, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0009
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0009
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=60000) returns 222222.222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0009 begin`);
      const actual: number = seekTimeOf(-100, 3, 60000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(222222.222, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0010
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0010
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=61000) returns 225925.926
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0010 begin`);
      const actual: number = seekTimeOf(-100, 3, 61000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(225925.926, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0011
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0011
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=3599000) returns 13329629.63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0011 begin`);
      const actual: number = seekTimeOf(-100, 3, 3599000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(13329629.63, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0012
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0012
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=3, totalTime=3600000) returns 13333333.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0012 begin`);
      const actual: number = seekTimeOf(-100, 3, 3600000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=3, total...: actual=${actual}`);
      expect(actual).assertClose(13333333.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0013
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0013
     * @tc.desc      seekTimeOf(offsetX=100, screenW=5, totalTime=999) returns -3996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0013 begin`);
      const actual: number = seekTimeOf(100, 5, 999);
      logInfo(`seekTimeOf(offsetX=100, screenW=5, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-3996);
      logInfo(`${BUNDLE}SeekTimeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0014
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0014
     * @tc.desc      seekTimeOf(offsetX=100, screenW=-1, totalTime=3599000) returns -11609677.419
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0014 begin`);
      const actual: number = seekTimeOf(100, -1, 3599000);
      logInfo(`seekTimeOf(offsetX=100, screenW=-1, total...: actual=${actual}`);
      expect(actual).assertClose(-11609677.419, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0015
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0015
     * @tc.desc      seekTimeOf(offsetX=10, screenW=1, totalTime=3599000) returns -1241034.483
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0015 begin`);
      const actual: number = seekTimeOf(10, 1, 3599000);
      logInfo(`seekTimeOf(offsetX=10, screenW=1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1241034.483, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0016
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0016
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=100, totalTime=3600000) returns -51428.571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0016 begin`);
      const actual: number = seekTimeOf(-1, 100, 3600000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=100, total...: actual=${actual}`);
      expect(actual).assertClose(-51428.571, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0017
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0017
     * @tc.desc      seekTimeOf(offsetX=2, screenW=10, totalTime=59999) returns -5999.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0017 begin`);
      const actual: number = seekTimeOf(2, 10, 59999);
      logInfo(`seekTimeOf(offsetX=2, screenW=10, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-5999.9, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0018
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0018
     * @tc.desc      seekTimeOf(offsetX=3, screenW=-1, totalTime=4) returns -0.387
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0018 begin`);
      const actual: number = seekTimeOf(3, -1, 4);
      logInfo(`seekTimeOf(offsetX=3, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.387, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0019
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0019
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=-1, totalTime=3599000) returns 11609677.419
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0019 begin`);
      const actual: number = seekTimeOf(-100, -1, 3599000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertClose(11609677.419, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0020
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0020
     * @tc.desc      seekTimeOf(offsetX=4, screenW=-1, totalTime=3599000) returns -464387.097
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0020 begin`);
      const actual: number = seekTimeOf(4, -1, 3599000);
      logInfo(`seekTimeOf(offsetX=4, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-464387.097, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0021
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0021
     * @tc.desc      seekTimeOf(offsetX=5, screenW=5, totalTime=61000) returns -12200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0021 begin`);
      const actual: number = seekTimeOf(5, 5, 61000);
      logInfo(`seekTimeOf(offsetX=5, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-12200);
      logInfo(`${BUNDLE}SeekTimeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0022
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0022
     * @tc.desc      seekTimeOf(offsetX=5, screenW=15, totalTime=2) returns -0.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0022 begin`);
      const actual: number = seekTimeOf(5, 15, 2);
      logInfo(`seekTimeOf(offsetX=5, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0023
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0023
     * @tc.desc      seekTimeOf(offsetX=100, screenW=2, totalTime=500) returns -1785.714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0023 begin`);
      const actual: number = seekTimeOf(100, 2, 500);
      logInfo(`seekTimeOf(offsetX=100, screenW=2, totalT...: actual=${actual}`);
      expect(actual).assertClose(-1785.714, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0024
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0024
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=5, totalTime=1000) returns 4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0024 begin`);
      const actual: number = seekTimeOf(-100, 5, 1000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=5, total...: actual=${actual}`);
      expect(actual).assertEqual(4000);
      logInfo(`${BUNDLE}SeekTimeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0025
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0025
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=4, totalTime=61000) returns 63346.154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0025 begin`);
      const actual: number = seekTimeOf(-27, 4, 61000);
      logInfo(`seekTimeOf(offsetX=-27, screenW=4, totalT...: actual=${actual}`);
      expect(actual).assertClose(63346.154, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0026
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0026
     * @tc.desc      seekTimeOf(offsetX=5, screenW=100, totalTime=60000) returns 4285.714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0026 begin`);
      const actual: number = seekTimeOf(5, 100, 60000);
      logInfo(`seekTimeOf(offsetX=5, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(4285.714, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0027
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0027
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=1, totalTime=3) returns 0.103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0027 begin`);
      const actual: number = seekTimeOf(-1, 1, 3);
      logInfo(`seekTimeOf(offsetX=-1, screenW=1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(0.103, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0028
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0028
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=3, totalTime=1000) returns 37.037
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0028 begin`);
      const actual: number = seekTimeOf(-1, 3, 1000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=3, totalTi...: actual=${actual}`);
      expect(actual).assertClose(37.037, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0029
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0029
     * @tc.desc      seekTimeOf(offsetX=50, screenW=15, totalTime=3599000) returns -11996666.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0029 begin`);
      const actual: number = seekTimeOf(50, 15, 3599000);
      logInfo(`seekTimeOf(offsetX=50, screenW=15, totalT...: actual=${actual}`);
      expect(actual).assertClose(-11996666.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0030
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0030
     * @tc.desc      seekTimeOf(offsetX=100, screenW=0, totalTime=3600000) returns -12000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0030 begin`);
      const actual: number = seekTimeOf(100, 0, 3600000);
      logInfo(`seekTimeOf(offsetX=100, screenW=0, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-12000000);
      logInfo(`${BUNDLE}SeekTimeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0031
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0031
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=15, totalTime=59999) returns 399993.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0031 begin`);
      const actual: number = seekTimeOf(-100, 15, 59999);
      logInfo(`seekTimeOf(offsetX=-100, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertClose(399993.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0032
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0032
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=15, totalTime=61000) returns 4066.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0032 begin`);
      const actual: number = seekTimeOf(-1, 15, 61000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=15, totalT...: actual=${actual}`);
      expect(actual).assertClose(4066.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0033
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0033
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=3, totalTime=3599000) returns 3599000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0033 begin`);
      const actual: number = seekTimeOf(-27, 3, 3599000);
      logInfo(`seekTimeOf(offsetX=-27, screenW=3, totalT...: actual=${actual}`);
      expect(actual).assertEqual(3599000);
      logInfo(`${BUNDLE}SeekTimeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0034
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0034
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=100, totalTime=1000) returns -1428.571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0034 begin`);
      const actual: number = seekTimeOf(-100, 100, 1000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=100, tot...: actual=${actual}`);
      expect(actual).assertClose(-1428.571, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0035
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0035
     * @tc.desc      seekTimeOf(offsetX=4, screenW=20, totalTime=3600000) returns -1440000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0035 begin`);
      const actual: number = seekTimeOf(4, 20, 3600000);
      logInfo(`seekTimeOf(offsetX=4, screenW=20, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-1440000);
      logInfo(`${BUNDLE}SeekTimeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0036
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0036
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=2, totalTime=2) returns 1.929
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0036 begin`);
      const actual: number = seekTimeOf(-27, 2, 2);
      logInfo(`seekTimeOf(offsetX=-27, screenW=2, totalT...: actual=${actual}`);
      expect(actual).assertClose(1.929, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0037
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0037
     * @tc.desc      seekTimeOf(offsetX=3, screenW=9.61, totalTime=1000) returns -147.131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0037 begin`);
      const actual: number = seekTimeOf(3, 9.61, 1000);
      logInfo(`seekTimeOf(offsetX=3, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-147.131, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0038
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0038
     * @tc.desc      seekTimeOf(offsetX=100, screenW=0, totalTime=500) returns -1666.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0038 begin`);
      const actual: number = seekTimeOf(100, 0, 500);
      logInfo(`seekTimeOf(offsetX=100, screenW=0, totalT...: actual=${actual}`);
      expect(actual).assertClose(-1666.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0039
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0039
     * @tc.desc      seekTimeOf(offsetX=1, screenW=-1, totalTime=500) returns -16.129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0039 begin`);
      const actual: number = seekTimeOf(1, -1, 500);
      logInfo(`seekTimeOf(offsetX=1, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-16.129, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0040
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0040
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=100, totalTime=3) returns -4.286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0040 begin`);
      const actual: number = seekTimeOf(-100, 100, 3);
      logInfo(`seekTimeOf(offsetX=-100, screenW=100, tot...: actual=${actual}`);
      expect(actual).assertClose(-4.286, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0041
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0041
     * @tc.desc      seekTimeOf(offsetX=50, screenW=5, totalTime=999) returns -1998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0041 begin`);
      const actual: number = seekTimeOf(50, 5, 999);
      logInfo(`seekTimeOf(offsetX=50, screenW=5, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-1998);
      logInfo(`${BUNDLE}SeekTimeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0042
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0042
     * @tc.desc      seekTimeOf(offsetX=10, screenW=4, totalTime=59999) returns -23076.538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0042 begin`);
      const actual: number = seekTimeOf(10, 4, 59999);
      logInfo(`seekTimeOf(offsetX=10, screenW=4, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-23076.538, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0043
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0043
     * @tc.desc      seekTimeOf(offsetX=1, screenW=5, totalTime=3599000) returns -143960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0043 begin`);
      const actual: number = seekTimeOf(1, 5, 3599000);
      logInfo(`seekTimeOf(offsetX=1, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-143960);
      logInfo(`${BUNDLE}SeekTimeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0044
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0044
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=9.61, totalTime=999) returns 1322.854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0044 begin`);
      const actual: number = seekTimeOf(-27, 9.61, 999);
      logInfo(`seekTimeOf(offsetX=-27, screenW=9.61, tot...: actual=${actual}`);
      expect(actual).assertClose(1322.854, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0045
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0045
     * @tc.desc      seekTimeOf(offsetX=5, screenW=9.61, totalTime=2) returns -0.49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0045 begin`);
      const actual: number = seekTimeOf(5, 9.61, 2);
      logInfo(`seekTimeOf(offsetX=5, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-0.49, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0046
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0046
     * @tc.desc      seekTimeOf(offsetX=1, screenW=100, totalTime=3600000) returns 51428.571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0046 begin`);
      const actual: number = seekTimeOf(1, 100, 3600000);
      logInfo(`seekTimeOf(offsetX=1, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(51428.571, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0047
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0047
     * @tc.desc      seekTimeOf(offsetX=1, screenW=0, totalTime=4) returns -0.133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0047 begin`);
      const actual: number = seekTimeOf(1, 0, 4);
      logInfo(`seekTimeOf(offsetX=1, screenW=0, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.133, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0048
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0048
     * @tc.desc      seekTimeOf(offsetX=2, screenW=4, totalTime=999) returns -76.846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0048 begin`);
      const actual: number = seekTimeOf(2, 4, 999);
      logInfo(`seekTimeOf(offsetX=2, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-76.846, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0049
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0049
     * @tc.desc      seekTimeOf(offsetX=5, screenW=2, totalTime=61000) returns -10892.857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0049 begin`);
      const actual: number = seekTimeOf(5, 2, 61000);
      logInfo(`seekTimeOf(offsetX=5, screenW=2, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-10892.857, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0050
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0050
     * @tc.desc      seekTimeOf(offsetX=1, screenW=5, totalTime=4) returns -0.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0050 begin`);
      const actual: number = seekTimeOf(1, 5, 4);
      logInfo(`seekTimeOf(offsetX=1, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.16, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0051
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0051
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=4, totalTime=59999) returns 62306.654
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0051 begin`);
      const actual: number = seekTimeOf(-27, 4, 59999);
      logInfo(`seekTimeOf(offsetX=-27, screenW=4, totalT...: actual=${actual}`);
      expect(actual).assertClose(62306.654, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0052
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0052
     * @tc.desc      seekTimeOf(offsetX=5, screenW=15, totalTime=1000) returns -333.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0052 begin`);
      const actual: number = seekTimeOf(5, 15, 1000);
      logInfo(`seekTimeOf(offsetX=5, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-333.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0053
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0053
     * @tc.desc      seekTimeOf(offsetX=100, screenW=20, totalTime=3) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0053 begin`);
      const actual: number = seekTimeOf(100, 20, 3);
      logInfo(`seekTimeOf(offsetX=100, screenW=20, total...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}SeekTimeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0054
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0054
     * @tc.desc      seekTimeOf(offsetX=5, screenW=100, totalTime=4) returns 0.286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0054 begin`);
      const actual: number = seekTimeOf(5, 100, 4);
      logInfo(`seekTimeOf(offsetX=5, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(0.286, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0055
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0055
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=5, totalTime=500) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0055 begin`);
      const actual: number = seekTimeOf(-1, 5, 500);
      logInfo(`seekTimeOf(offsetX=-1, screenW=5, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}SeekTimeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0056
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0056
     * @tc.desc      seekTimeOf(offsetX=50, screenW=-1, totalTime=4) returns -6.452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0056 begin`);
      const actual: number = seekTimeOf(50, -1, 4);
      logInfo(`seekTimeOf(offsetX=50, screenW=-1, totalT...: actual=${actual}`);
      expect(actual).assertClose(-6.452, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0057
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0057
     * @tc.desc      seekTimeOf(offsetX=3, screenW=-1, totalTime=60000) returns -5806.452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0057 begin`);
      const actual: number = seekTimeOf(3, -1, 60000);
      logInfo(`seekTimeOf(offsetX=3, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-5806.452, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0058
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0058
     * @tc.desc      seekTimeOf(offsetX=4, screenW=100, totalTime=3599000) returns 205657.143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0058 begin`);
      const actual: number = seekTimeOf(4, 100, 3599000);
      logInfo(`seekTimeOf(offsetX=4, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(205657.143, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0059
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0059
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=15, totalTime=500) returns 3333.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0059 begin`);
      const actual: number = seekTimeOf(-100, 15, 500);
      logInfo(`seekTimeOf(offsetX=-100, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertClose(3333.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0060
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0060
     * @tc.desc      seekTimeOf(offsetX=5, screenW=5, totalTime=60000) returns -12000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0060 begin`);
      const actual: number = seekTimeOf(5, 5, 60000);
      logInfo(`seekTimeOf(offsetX=5, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-12000);
      logInfo(`${BUNDLE}SeekTimeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0061
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0061
     * @tc.desc      seekTimeOf(offsetX=2, screenW=9.61, totalTime=1000) returns -98.087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0061 begin`);
      const actual: number = seekTimeOf(2, 9.61, 1000);
      logInfo(`seekTimeOf(offsetX=2, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-98.087, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0062
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0062
     * @tc.desc      seekTimeOf(offsetX=2, screenW=2, totalTime=999) returns -71.357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0062 begin`);
      const actual: number = seekTimeOf(2, 2, 999);
      logInfo(`seekTimeOf(offsetX=2, screenW=2, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-71.357, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0063
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0063
     * @tc.desc      seekTimeOf(offsetX=100, screenW=4, totalTime=4) returns -15.385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0063 begin`);
      const actual: number = seekTimeOf(100, 4, 4);
      logInfo(`seekTimeOf(offsetX=100, screenW=4, totalT...: actual=${actual}`);
      expect(actual).assertClose(-15.385, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0064
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0064
     * @tc.desc      seekTimeOf(offsetX=10, screenW=-1, totalTime=1000) returns -322.581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0064 begin`);
      const actual: number = seekTimeOf(10, -1, 1000);
      logInfo(`seekTimeOf(offsetX=10, screenW=-1, totalT...: actual=${actual}`);
      expect(actual).assertClose(-322.581, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0065
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0065
     * @tc.desc      seekTimeOf(offsetX=5, screenW=9.61, totalTime=1000) returns -245.218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0065 begin`);
      const actual: number = seekTimeOf(5, 9.61, 1000);
      logInfo(`seekTimeOf(offsetX=5, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-245.218, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0066
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0066
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=9.61, totalTime=3599000) returns 4765718.489
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0066 begin`);
      const actual: number = seekTimeOf(-27, 9.61, 3599000);
      logInfo(`seekTimeOf(offsetX=-27, screenW=9.61, tot...: actual=${actual}`);
      expect(actual).assertClose(4765718.489, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0067
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0067
     * @tc.desc      seekTimeOf(offsetX=2, screenW=0, totalTime=3599000) returns -239933.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0067 begin`);
      const actual: number = seekTimeOf(2, 0, 3599000);
      logInfo(`seekTimeOf(offsetX=2, screenW=0, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-239933.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0068
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0068
     * @tc.desc      seekTimeOf(offsetX=2, screenW=-1, totalTime=61000) returns -3935.484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0068 begin`);
      const actual: number = seekTimeOf(2, -1, 61000);
      logInfo(`seekTimeOf(offsetX=2, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-3935.484, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0069
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0069
     * @tc.desc      seekTimeOf(offsetX=100, screenW=3, totalTime=59999) returns -222218.519
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0069 begin`);
      const actual: number = seekTimeOf(100, 3, 59999);
      logInfo(`seekTimeOf(offsetX=100, screenW=3, totalT...: actual=${actual}`);
      expect(actual).assertClose(-222218.519, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0070
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0070
     * @tc.desc      seekTimeOf(offsetX=100, screenW=10, totalTime=3600000) returns -18000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0070 begin`);
      const actual: number = seekTimeOf(100, 10, 3600000);
      logInfo(`seekTimeOf(offsetX=100, screenW=10, total...: actual=${actual}`);
      expect(actual).assertEqual(-18000000);
      logInfo(`${BUNDLE}SeekTimeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0071
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0071
     * @tc.desc      seekTimeOf(offsetX=10, screenW=5, totalTime=2) returns -0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0071 begin`);
      const actual: number = seekTimeOf(10, 5, 2);
      logInfo(`seekTimeOf(offsetX=10, screenW=5, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.8, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0072
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0072
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=0, totalTime=3600000) returns 3240000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0072 begin`);
      const actual: number = seekTimeOf(-27, 0, 3600000);
      logInfo(`seekTimeOf(offsetX=-27, screenW=0, totalT...: actual=${actual}`);
      expect(actual).assertEqual(3240000);
      logInfo(`${BUNDLE}SeekTimeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0073
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0073
     * @tc.desc      seekTimeOf(offsetX=50, screenW=1, totalTime=999) returns -1722.414
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0073 begin`);
      const actual: number = seekTimeOf(50, 1, 999);
      logInfo(`seekTimeOf(offsetX=50, screenW=1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1722.414, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0074
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0074
     * @tc.desc      seekTimeOf(offsetX=4, screenW=5, totalTime=59999) returns -9599.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0074 begin`);
      const actual: number = seekTimeOf(4, 5, 59999);
      logInfo(`seekTimeOf(offsetX=4, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-9599.84, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0075
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0075
     * @tc.desc      seekTimeOf(offsetX=2, screenW=0, totalTime=59999) returns -3999.933
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0075 begin`);
      const actual: number = seekTimeOf(2, 0, 59999);
      logInfo(`seekTimeOf(offsetX=2, screenW=0, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-3999.933, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0076
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0076
     * @tc.desc      seekTimeOf(offsetX=5, screenW=5, totalTime=3600000) returns -720000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0076 begin`);
      const actual: number = seekTimeOf(5, 5, 3600000);
      logInfo(`seekTimeOf(offsetX=5, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-720000);
      logInfo(`${BUNDLE}SeekTimeOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0077
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0077
     * @tc.desc      seekTimeOf(offsetX=5, screenW=20, totalTime=4) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0077 begin`);
      const actual: number = seekTimeOf(5, 20, 4);
      logInfo(`seekTimeOf(offsetX=5, screenW=20, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SeekTimeOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0078
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0078
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=10, totalTime=1000) returns 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0078 begin`);
      const actual: number = seekTimeOf(-100, 10, 1000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=10, tota...: actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}SeekTimeOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0079
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0079
     * @tc.desc      seekTimeOf(offsetX=5, screenW=3, totalTime=999) returns -185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0079 begin`);
      const actual: number = seekTimeOf(5, 3, 999);
      logInfo(`seekTimeOf(offsetX=5, screenW=3, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-185);
      logInfo(`${BUNDLE}SeekTimeOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0080
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0080
     * @tc.desc      seekTimeOf(offsetX=10, screenW=10, totalTime=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0080 begin`);
      const actual: number = seekTimeOf(10, 10, 2);
      logInfo(`seekTimeOf(offsetX=10, screenW=10, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SeekTimeOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0081
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0081
     * @tc.desc      seekTimeOf(offsetX=50, screenW=3, totalTime=3600000) returns -6666666.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0081 begin`);
      const actual: number = seekTimeOf(50, 3, 3600000);
      logInfo(`seekTimeOf(offsetX=50, screenW=3, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-6666666.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0082
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0082
     * @tc.desc      seekTimeOf(offsetX=50, screenW=5, totalTime=500) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0082 begin`);
      const actual: number = seekTimeOf(50, 5, 500);
      logInfo(`seekTimeOf(offsetX=50, screenW=5, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-1000);
      logInfo(`${BUNDLE}SeekTimeOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0083
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0083
     * @tc.desc      seekTimeOf(offsetX=2, screenW=15, totalTime=61000) returns -8133.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0083 begin`);
      const actual: number = seekTimeOf(2, 15, 61000);
      logInfo(`seekTimeOf(offsetX=2, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-8133.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0084
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0084
     * @tc.desc      seekTimeOf(offsetX=10, screenW=1, totalTime=59999) returns -20689.31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0084 begin`);
      const actual: number = seekTimeOf(10, 1, 59999);
      logInfo(`seekTimeOf(offsetX=10, screenW=1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-20689.31, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0085
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0085
     * @tc.desc      seekTimeOf(offsetX=2, screenW=9.61, totalTime=3599000) returns -353016.184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0085 begin`);
      const actual: number = seekTimeOf(2, 9.61, 3599000);
      logInfo(`seekTimeOf(offsetX=2, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-353016.184, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0086
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0086
     * @tc.desc      seekTimeOf(offsetX=100, screenW=-1, totalTime=500) returns -1612.903
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0086 begin`);
      const actual: number = seekTimeOf(100, -1, 500);
      logInfo(`seekTimeOf(offsetX=100, screenW=-1, total...: actual=${actual}`);
      expect(actual).assertClose(-1612.903, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0087
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0087
     * @tc.desc      seekTimeOf(offsetX=3, screenW=1, totalTime=61000) returns -6310.345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0087 begin`);
      const actual: number = seekTimeOf(3, 1, 61000);
      logInfo(`seekTimeOf(offsetX=3, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-6310.345, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0088
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0088
     * @tc.desc      seekTimeOf(offsetX=3, screenW=10, totalTime=60000) returns -9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0088 begin`);
      const actual: number = seekTimeOf(3, 10, 60000);
      logInfo(`seekTimeOf(offsetX=3, screenW=10, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-9000);
      logInfo(`${BUNDLE}SeekTimeOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0089
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0089
     * @tc.desc      seekTimeOf(offsetX=4, screenW=100, totalTime=2) returns 0.114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0089 begin`);
      const actual: number = seekTimeOf(4, 100, 2);
      logInfo(`seekTimeOf(offsetX=4, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(0.114, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0090
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0090
     * @tc.desc      seekTimeOf(offsetX=10, screenW=4, totalTime=1000) returns -384.615
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0090 begin`);
      const actual: number = seekTimeOf(10, 4, 1000);
      logInfo(`seekTimeOf(offsetX=10, screenW=4, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-384.615, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0091
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0091
     * @tc.desc      seekTimeOf(offsetX=3, screenW=9.61, totalTime=3) returns -0.441
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0091 begin`);
      const actual: number = seekTimeOf(3, 9.61, 3);
      logInfo(`seekTimeOf(offsetX=3, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-0.441, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0092
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0092
     * @tc.desc      seekTimeOf(offsetX=1, screenW=20, totalTime=60000) returns -6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0092 begin`);
      const actual: number = seekTimeOf(1, 20, 60000);
      logInfo(`seekTimeOf(offsetX=1, screenW=20, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-6000);
      logInfo(`${BUNDLE}SeekTimeOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0093
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0093
     * @tc.desc      seekTimeOf(offsetX=3, screenW=-1, totalTime=61000) returns -5903.226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0093 begin`);
      const actual: number = seekTimeOf(3, -1, 61000);
      logInfo(`seekTimeOf(offsetX=3, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-5903.226, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0094
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0094
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=100, totalTime=3599000) returns -51414.286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0094 begin`);
      const actual: number = seekTimeOf(-1, 100, 3599000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=100, total...: actual=${actual}`);
      expect(actual).assertClose(-51414.286, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0095
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0095
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=100, totalTime=500) returns -714.286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0095 begin`);
      const actual: number = seekTimeOf(-100, 100, 500);
      logInfo(`seekTimeOf(offsetX=-100, screenW=100, tot...: actual=${actual}`);
      expect(actual).assertClose(-714.286, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0096
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0096
     * @tc.desc      seekTimeOf(offsetX=10, screenW=9.61, totalTime=3599000) returns -1765080.922
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0096 begin`);
      const actual: number = seekTimeOf(10, 9.61, 3599000);
      logInfo(`seekTimeOf(offsetX=10, screenW=9.61, tota...: actual=${actual}`);
      expect(actual).assertClose(-1765080.922, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0096 end`);
    });
  });
}
