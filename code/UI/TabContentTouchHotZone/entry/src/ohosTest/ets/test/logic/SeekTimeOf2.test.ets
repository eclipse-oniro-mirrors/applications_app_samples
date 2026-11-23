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
export default function seekTimeOf2Test(): void {
  describe('SeekTimeOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0097
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0097
     * @tc.desc      seekTimeOf(offsetX=1, screenW=2, totalTime=1000) returns -35.714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0097 begin`);
      const actual: number = seekTimeOf(1, 2, 1000);
      logInfo(`seekTimeOf(offsetX=1, screenW=2, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-35.714, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0098
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0098
     * @tc.desc      seekTimeOf(offsetX=10, screenW=10, totalTime=1000) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0098 begin`);
      const actual: number = seekTimeOf(10, 10, 1000);
      logInfo(`seekTimeOf(offsetX=10, screenW=10, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-500);
      logInfo(`${BUNDLE}SeekTimeOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0099
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0099
     * @tc.desc      seekTimeOf(offsetX=1, screenW=3, totalTime=1000) returns -37.037
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0099 begin`);
      const actual: number = seekTimeOf(1, 3, 1000);
      logInfo(`seekTimeOf(offsetX=1, screenW=3, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-37.037, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0100
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0100
     * @tc.desc      seekTimeOf(offsetX=3, screenW=20, totalTime=500) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0100 begin`);
      const actual: number = seekTimeOf(3, 20, 500);
      logInfo(`seekTimeOf(offsetX=3, screenW=20, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}SeekTimeOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0101
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0101
     * @tc.desc      seekTimeOf(offsetX=50, screenW=10, totalTime=61000) returns -152500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0101 begin`);
      const actual: number = seekTimeOf(50, 10, 61000);
      logInfo(`seekTimeOf(offsetX=50, screenW=10, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-152500);
      logInfo(`${BUNDLE}SeekTimeOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0102
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0102
     * @tc.desc      seekTimeOf(offsetX=2, screenW=1, totalTime=61000) returns -4206.897
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0102 begin`);
      const actual: number = seekTimeOf(2, 1, 61000);
      logInfo(`seekTimeOf(offsetX=2, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-4206.897, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0103
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0103
     * @tc.desc      seekTimeOf(offsetX=5, screenW=0, totalTime=2) returns -0.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0103 begin`);
      const actual: number = seekTimeOf(5, 0, 2);
      logInfo(`seekTimeOf(offsetX=5, screenW=0, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0104
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0104
     * @tc.desc      seekTimeOf(offsetX=2, screenW=5, totalTime=4) returns -0.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0104 begin`);
      const actual: number = seekTimeOf(2, 5, 4);
      logInfo(`seekTimeOf(offsetX=2, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.32, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0105
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0105
     * @tc.desc      seekTimeOf(offsetX=50, screenW=3, totalTime=4) returns -7.407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0105 begin`);
      const actual: number = seekTimeOf(50, 3, 4);
      logInfo(`seekTimeOf(offsetX=50, screenW=3, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-7.407, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0106
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0106
     * @tc.desc      seekTimeOf(offsetX=100, screenW=1, totalTime=59999) returns -206893.103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0106 begin`);
      const actual: number = seekTimeOf(100, 1, 59999);
      logInfo(`seekTimeOf(offsetX=100, screenW=1, totalT...: actual=${actual}`);
      expect(actual).assertClose(-206893.103, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0107
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0107
     * @tc.desc      seekTimeOf(offsetX=4, screenW=1, totalTime=60000) returns -8275.862
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0107 begin`);
      const actual: number = seekTimeOf(4, 1, 60000);
      logInfo(`seekTimeOf(offsetX=4, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-8275.862, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0108
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0108
     * @tc.desc      seekTimeOf(offsetX=50, screenW=2, totalTime=3) returns -5.357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0108 begin`);
      const actual: number = seekTimeOf(50, 2, 3);
      logInfo(`seekTimeOf(offsetX=50, screenW=2, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-5.357, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0109
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0109
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=9.61, totalTime=61000) returns 299166.258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0109 begin`);
      const actual: number = seekTimeOf(-100, 9.61, 61000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=9.61, to...: actual=${actual}`);
      expect(actual).assertClose(299166.258, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0110
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0110
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=-1, totalTime=999) returns 870.097
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0110 begin`);
      const actual: number = seekTimeOf(-27, -1, 999);
      logInfo(`seekTimeOf(offsetX=-27, screenW=-1, total...: actual=${actual}`);
      expect(actual).assertClose(870.097, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0111
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0111
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=1, totalTime=4) returns 0.138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0111 begin`);
      const actual: number = seekTimeOf(-1, 1, 4);
      logInfo(`seekTimeOf(offsetX=-1, screenW=1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(0.138, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0112
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0112
     * @tc.desc      seekTimeOf(offsetX=3, screenW=1, totalTime=60000) returns -6206.897
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0112 begin`);
      const actual: number = seekTimeOf(3, 1, 60000);
      logInfo(`seekTimeOf(offsetX=3, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-6206.897, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0113
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0113
     * @tc.desc      seekTimeOf(offsetX=2, screenW=10, totalTime=2) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0113 begin`);
      const actual: number = seekTimeOf(2, 10, 2);
      logInfo(`seekTimeOf(offsetX=2, screenW=10, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0114
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0114
     * @tc.desc      seekTimeOf(offsetX=10, screenW=4, totalTime=3) returns -1.154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0114 begin`);
      const actual: number = seekTimeOf(10, 4, 3);
      logInfo(`seekTimeOf(offsetX=10, screenW=4, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1.154, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0115
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0115
     * @tc.desc      seekTimeOf(offsetX=1, screenW=4, totalTime=500) returns -19.231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0115 begin`);
      const actual: number = seekTimeOf(1, 4, 500);
      logInfo(`seekTimeOf(offsetX=1, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-19.231, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0116
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0116
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=2, totalTime=59999) returns 2142.821
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0116 begin`);
      const actual: number = seekTimeOf(-1, 2, 59999);
      logInfo(`seekTimeOf(offsetX=-1, screenW=2, totalTi...: actual=${actual}`);
      expect(actual).assertClose(2142.821, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0117
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0117
     * @tc.desc      seekTimeOf(offsetX=5, screenW=9.61, totalTime=500) returns -122.609
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0117 begin`);
      const actual: number = seekTimeOf(5, 9.61, 500);
      logInfo(`seekTimeOf(offsetX=5, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-122.609, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0118
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0118
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=3, totalTime=3) returns 0.111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0118 begin`);
      const actual: number = seekTimeOf(-1, 3, 3);
      logInfo(`seekTimeOf(offsetX=-1, screenW=3, totalTi...: actual=${actual}`);
      expect(actual).assertClose(0.111, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0119
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0119
     * @tc.desc      seekTimeOf(offsetX=100, screenW=15, totalTime=3) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0119 begin`);
      const actual: number = seekTimeOf(100, 15, 3);
      logInfo(`seekTimeOf(offsetX=100, screenW=15, total...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}SeekTimeOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0120
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0120
     * @tc.desc      seekTimeOf(offsetX=3, screenW=3, totalTime=59999) returns -6666.556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0120 begin`);
      const actual: number = seekTimeOf(3, 3, 59999);
      logInfo(`seekTimeOf(offsetX=3, screenW=3, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-6666.556, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0121
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0121
     * @tc.desc      seekTimeOf(offsetX=100, screenW=4, totalTime=2) returns -7.692
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0121 begin`);
      const actual: number = seekTimeOf(100, 4, 2);
      logInfo(`seekTimeOf(offsetX=100, screenW=4, totalT...: actual=${actual}`);
      expect(actual).assertClose(-7.692, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0122
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0122
     * @tc.desc      seekTimeOf(offsetX=1, screenW=9.61, totalTime=4) returns -0.196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0122 begin`);
      const actual: number = seekTimeOf(1, 9.61, 4);
      logInfo(`seekTimeOf(offsetX=1, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-0.196, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0123
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0123
     * @tc.desc      seekTimeOf(offsetX=100, screenW=100, totalTime=4) returns 5.714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0123 begin`);
      const actual: number = seekTimeOf(100, 100, 4);
      logInfo(`seekTimeOf(offsetX=100, screenW=100, tota...: actual=${actual}`);
      expect(actual).assertClose(5.714, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0124
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0124
     * @tc.desc      seekTimeOf(offsetX=3, screenW=1, totalTime=4) returns -0.414
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0124 begin`);
      const actual: number = seekTimeOf(3, 1, 4);
      logInfo(`seekTimeOf(offsetX=3, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.414, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0125
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0125
     * @tc.desc      seekTimeOf(offsetX=100, screenW=5, totalTime=60000) returns -240000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0125 begin`);
      const actual: number = seekTimeOf(100, 5, 60000);
      logInfo(`seekTimeOf(offsetX=100, screenW=5, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-240000);
      logInfo(`${BUNDLE}SeekTimeOf_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0126
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0126
     * @tc.desc      seekTimeOf(offsetX=5, screenW=5, totalTime=500) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0126 begin`);
      const actual: number = seekTimeOf(5, 5, 500);
      logInfo(`seekTimeOf(offsetX=5, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}SeekTimeOf_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0127
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0127
     * @tc.desc      seekTimeOf(offsetX=3, screenW=4, totalTime=61000) returns -7038.462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0127 begin`);
      const actual: number = seekTimeOf(3, 4, 61000);
      logInfo(`seekTimeOf(offsetX=3, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-7038.462, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0128
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0128
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=2, totalTime=500) returns 482.143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0128 begin`);
      const actual: number = seekTimeOf(-27, 2, 500);
      logInfo(`seekTimeOf(offsetX=-27, screenW=2, totalT...: actual=${actual}`);
      expect(actual).assertClose(482.143, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0129
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0129
     * @tc.desc      seekTimeOf(offsetX=2, screenW=4, totalTime=3599000) returns -276846.154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0129 begin`);
      const actual: number = seekTimeOf(2, 4, 3599000);
      logInfo(`seekTimeOf(offsetX=2, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-276846.154, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0130
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0130
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=9.61, totalTime=60000) returns 294261.893
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0130 begin`);
      const actual: number = seekTimeOf(-100, 9.61, 60000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=9.61, to...: actual=${actual}`);
      expect(actual).assertClose(294261.893, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0131
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0131
     * @tc.desc      seekTimeOf(offsetX=10, screenW=0, totalTime=500) returns -166.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0131 begin`);
      const actual: number = seekTimeOf(10, 0, 500);
      logInfo(`seekTimeOf(offsetX=10, screenW=0, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-166.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0132
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0132
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=9.61, totalTime=2) returns 2.648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0132 begin`);
      const actual: number = seekTimeOf(-27, 9.61, 2);
      logInfo(`seekTimeOf(offsetX=-27, screenW=9.61, tot...: actual=${actual}`);
      expect(actual).assertClose(2.648, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0133
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0133
     * @tc.desc      seekTimeOf(offsetX=4, screenW=3, totalTime=60000) returns -8888.889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0133 begin`);
      const actual: number = seekTimeOf(4, 3, 60000);
      logInfo(`seekTimeOf(offsetX=4, screenW=3, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-8888.889, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0134
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0134
     * @tc.desc      seekTimeOf(offsetX=1, screenW=10, totalTime=999) returns -49.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0134 begin`);
      const actual: number = seekTimeOf(1, 10, 999);
      logInfo(`seekTimeOf(offsetX=1, screenW=10, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-49.95, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0135
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0135
     * @tc.desc      seekTimeOf(offsetX=10, screenW=2, totalTime=61000) returns -21785.714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0135 begin`);
      const actual: number = seekTimeOf(10, 2, 61000);
      logInfo(`seekTimeOf(offsetX=10, screenW=2, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-21785.714, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0136
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0136
     * @tc.desc      seekTimeOf(offsetX=50, screenW=3, totalTime=1000) returns -1851.852
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0136 begin`);
      const actual: number = seekTimeOf(50, 3, 1000);
      logInfo(`seekTimeOf(offsetX=50, screenW=3, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1851.852, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0137
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0137
     * @tc.desc      seekTimeOf(offsetX=100, screenW=9.61, totalTime=60000) returns -294261.893
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0137 begin`);
      const actual: number = seekTimeOf(100, 9.61, 60000);
      logInfo(`seekTimeOf(offsetX=100, screenW=9.61, tot...: actual=${actual}`);
      expect(actual).assertClose(-294261.893, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0138
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0138
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=15, totalTime=4) returns 7.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0138 begin`);
      const actual: number = seekTimeOf(-27, 15, 4);
      logInfo(`seekTimeOf(offsetX=-27, screenW=15, total...: actual=${actual}`);
      expect(actual).assertClose(7.2, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0139
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0139
     * @tc.desc      seekTimeOf(offsetX=4, screenW=4, totalTime=1000) returns -153.846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0139 begin`);
      const actual: number = seekTimeOf(4, 4, 1000);
      logInfo(`seekTimeOf(offsetX=4, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-153.846, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0140
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0140
     * @tc.desc      seekTimeOf(offsetX=4, screenW=5, totalTime=999) returns -159.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0140 begin`);
      const actual: number = seekTimeOf(4, 5, 999);
      logInfo(`seekTimeOf(offsetX=4, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-159.84, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0141
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0141
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=20, totalTime=999) returns 2697.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0141 begin`);
      const actual: number = seekTimeOf(-27, 20, 999);
      logInfo(`seekTimeOf(offsetX=-27, screenW=20, total...: actual=${actual}`);
      expect(actual).assertClose(2697.3, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0142
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0142
     * @tc.desc      seekTimeOf(offsetX=4, screenW=100, totalTime=3) returns 0.171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0142 begin`);
      const actual: number = seekTimeOf(4, 100, 3);
      logInfo(`seekTimeOf(offsetX=4, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(0.171, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0143
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0143
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=3, totalTime=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0143 begin`);
      const actual: number = seekTimeOf(-27, 3, 3);
      logInfo(`seekTimeOf(offsetX=-27, screenW=3, totalT...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SeekTimeOf_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0144
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0144
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=20, totalTime=60000) returns 600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0144 begin`);
      const actual: number = seekTimeOf(-100, 20, 60000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=20, tota...: actual=${actual}`);
      expect(actual).assertEqual(600000);
      logInfo(`${BUNDLE}SeekTimeOf_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0145
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0145
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=0, totalTime=3) returns 2.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0145 begin`);
      const actual: number = seekTimeOf(-27, 0, 3);
      logInfo(`seekTimeOf(offsetX=-27, screenW=0, totalT...: actual=${actual}`);
      expect(actual).assertClose(2.7, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0145 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0146
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0146
     * @tc.desc      seekTimeOf(offsetX=10, screenW=3, totalTime=3599000) returns -1332962.963
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0146 begin`);
      const actual: number = seekTimeOf(10, 3, 3599000);
      logInfo(`seekTimeOf(offsetX=10, screenW=3, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1332962.963, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0147
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0147
     * @tc.desc      seekTimeOf(offsetX=2, screenW=9.61, totalTime=59999) returns -5885.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0147 begin`);
      const actual: number = seekTimeOf(2, 9.61, 59999);
      logInfo(`seekTimeOf(offsetX=2, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-5885.14, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0148
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0148
     * @tc.desc      seekTimeOf(offsetX=4, screenW=15, totalTime=500) returns -133.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0148 begin`);
      const actual: number = seekTimeOf(4, 15, 500);
      logInfo(`seekTimeOf(offsetX=4, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-133.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0149
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0149
     * @tc.desc      seekTimeOf(offsetX=1, screenW=-1, totalTime=60000) returns -1935.484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0149 begin`);
      const actual: number = seekTimeOf(1, -1, 60000);
      logInfo(`seekTimeOf(offsetX=1, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1935.484, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0150
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0150
     * @tc.desc      seekTimeOf(offsetX=10, screenW=-1, totalTime=3) returns -0.968
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0150 begin`);
      const actual: number = seekTimeOf(10, -1, 3);
      logInfo(`seekTimeOf(offsetX=10, screenW=-1, totalT...: actual=${actual}`);
      expect(actual).assertClose(-0.968, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0151
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0151
     * @tc.desc      seekTimeOf(offsetX=4, screenW=-1, totalTime=61000) returns -7870.968
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0151 begin`);
      const actual: number = seekTimeOf(4, -1, 61000);
      logInfo(`seekTimeOf(offsetX=4, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-7870.968, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0151 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0152
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0152
     * @tc.desc      seekTimeOf(offsetX=4, screenW=100, totalTime=3600000) returns 205714.286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0152 begin`);
      const actual: number = seekTimeOf(4, 100, 3600000);
      logInfo(`seekTimeOf(offsetX=4, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(205714.286, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0153
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0153
     * @tc.desc      seekTimeOf(offsetX=5, screenW=-1, totalTime=59999) returns -9677.258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0153 begin`);
      const actual: number = seekTimeOf(5, -1, 59999);
      logInfo(`seekTimeOf(offsetX=5, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-9677.258, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0154
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0154
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=15, totalTime=1000) returns 66.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0154 begin`);
      const actual: number = seekTimeOf(-1, 15, 1000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=15, totalT...: actual=${actual}`);
      expect(actual).assertClose(66.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0155
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0155
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=4, totalTime=500) returns 1923.077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0155 begin`);
      const actual: number = seekTimeOf(-100, 4, 500);
      logInfo(`seekTimeOf(offsetX=-100, screenW=4, total...: actual=${actual}`);
      expect(actual).assertClose(1923.077, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0156
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0156
     * @tc.desc      seekTimeOf(offsetX=50, screenW=-1, totalTime=999) returns -1611.29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0156 begin`);
      const actual: number = seekTimeOf(50, -1, 999);
      logInfo(`seekTimeOf(offsetX=50, screenW=-1, totalT...: actual=${actual}`);
      expect(actual).assertClose(-1611.29, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0157
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0157
     * @tc.desc      seekTimeOf(offsetX=2, screenW=20, totalTime=1000) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0157 begin`);
      const actual: number = seekTimeOf(2, 20, 1000);
      logInfo(`seekTimeOf(offsetX=2, screenW=20, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-200);
      logInfo(`${BUNDLE}SeekTimeOf_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0158
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0158
     * @tc.desc      seekTimeOf(offsetX=100, screenW=-1, totalTime=60000) returns -193548.387
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0158 begin`);
      const actual: number = seekTimeOf(100, -1, 60000);
      logInfo(`seekTimeOf(offsetX=100, screenW=-1, total...: actual=${actual}`);
      expect(actual).assertClose(-193548.387, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0159
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0159
     * @tc.desc      seekTimeOf(offsetX=10, screenW=20, totalTime=4) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0159 begin`);
      const actual: number = seekTimeOf(10, 20, 4);
      logInfo(`seekTimeOf(offsetX=10, screenW=20, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}SeekTimeOf_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0160
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0160
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=15, totalTime=3599000) returns 239933.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0160 begin`);
      const actual: number = seekTimeOf(-1, 15, 3599000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=15, totalT...: actual=${actual}`);
      expect(actual).assertClose(239933.333, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0161
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0161
     * @tc.desc      seekTimeOf(offsetX=5, screenW=-1, totalTime=1000) returns -161.29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0161 begin`);
      const actual: number = seekTimeOf(5, -1, 1000);
      logInfo(`seekTimeOf(offsetX=5, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-161.29, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0162
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0162
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=9.61, totalTime=500) returns 2452.182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0162 begin`);
      const actual: number = seekTimeOf(-100, 9.61, 500);
      logInfo(`seekTimeOf(offsetX=-100, screenW=9.61, to...: actual=${actual}`);
      expect(actual).assertClose(2452.182, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0163
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0163
     * @tc.desc      seekTimeOf(offsetX=5, screenW=4, totalTime=3) returns -0.577
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0163 begin`);
      const actual: number = seekTimeOf(5, 4, 3);
      logInfo(`seekTimeOf(offsetX=5, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.577, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0164
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0164
     * @tc.desc      seekTimeOf(offsetX=5, screenW=-1, totalTime=4) returns -0.645
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0164 begin`);
      const actual: number = seekTimeOf(5, -1, 4);
      logInfo(`seekTimeOf(offsetX=5, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.645, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0165
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0165
     * @tc.desc      seekTimeOf(offsetX=100, screenW=9.61, totalTime=2) returns -9.809
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0165 begin`);
      const actual: number = seekTimeOf(100, 9.61, 2);
      logInfo(`seekTimeOf(offsetX=100, screenW=9.61, tot...: actual=${actual}`);
      expect(actual).assertClose(-9.809, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0166
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0166
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=9.61, totalTime=500) returns 24.522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0166 begin`);
      const actual: number = seekTimeOf(-1, 9.61, 500);
      logInfo(`seekTimeOf(offsetX=-1, screenW=9.61, tota...: actual=${actual}`);
      expect(actual).assertClose(24.522, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0167
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0167
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=-1, totalTime=999) returns 32.226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0167 begin`);
      const actual: number = seekTimeOf(-1, -1, 999);
      logInfo(`seekTimeOf(offsetX=-1, screenW=-1, totalT...: actual=${actual}`);
      expect(actual).assertClose(32.226, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0168
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0168
     * @tc.desc      seekTimeOf(offsetX=2, screenW=5, totalTime=3599000) returns -287920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0168 begin`);
      const actual: number = seekTimeOf(2, 5, 3599000);
      logInfo(`seekTimeOf(offsetX=2, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-287920);
      logInfo(`${BUNDLE}SeekTimeOf_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0169
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0169
     * @tc.desc      seekTimeOf(offsetX=100, screenW=10, totalTime=1000) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0169 begin`);
      const actual: number = seekTimeOf(100, 10, 1000);
      logInfo(`seekTimeOf(offsetX=100, screenW=10, total...: actual=${actual}`);
      expect(actual).assertEqual(-5000);
      logInfo(`${BUNDLE}SeekTimeOf_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0170
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0170
     * @tc.desc      seekTimeOf(offsetX=50, screenW=2, totalTime=2) returns -3.571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0170 begin`);
      const actual: number = seekTimeOf(50, 2, 2);
      logInfo(`seekTimeOf(offsetX=50, screenW=2, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-3.571, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0171
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0171
     * @tc.desc      seekTimeOf(offsetX=3, screenW=100, totalTime=999) returns 42.814
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0171 begin`);
      const actual: number = seekTimeOf(3, 100, 999);
      logInfo(`seekTimeOf(offsetX=3, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(42.814, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0172
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0172
     * @tc.desc      seekTimeOf(offsetX=2, screenW=2, totalTime=59999) returns -4285.643
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0172 begin`);
      const actual: number = seekTimeOf(2, 2, 59999);
      logInfo(`seekTimeOf(offsetX=2, screenW=2, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-4285.643, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0173
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0173
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=4, totalTime=60000) returns 230769.231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0173 begin`);
      const actual: number = seekTimeOf(-100, 4, 60000);
      logInfo(`seekTimeOf(offsetX=-100, screenW=4, total...: actual=${actual}`);
      expect(actual).assertClose(230769.231, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0174
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0174
     * @tc.desc      seekTimeOf(offsetX=3, screenW=-1, totalTime=3599000) returns -348290.323
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0174 begin`);
      const actual: number = seekTimeOf(3, -1, 3599000);
      logInfo(`seekTimeOf(offsetX=3, screenW=-1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-348290.323, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0175
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0175
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=100, totalTime=500) returns -192.857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0175 begin`);
      const actual: number = seekTimeOf(-27, 100, 500);
      logInfo(`seekTimeOf(offsetX=-27, screenW=100, tota...: actual=${actual}`);
      expect(actual).assertClose(-192.857, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0176
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0176
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=10, totalTime=60000) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0176 begin`);
      const actual: number = seekTimeOf(-1, 10, 60000);
      logInfo(`seekTimeOf(offsetX=-1, screenW=10, totalT...: actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}SeekTimeOf_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0177
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0177
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=4, totalTime=500) returns 19.231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0177 begin`);
      const actual: number = seekTimeOf(-1, 4, 500);
      logInfo(`seekTimeOf(offsetX=-1, screenW=4, totalTi...: actual=${actual}`);
      expect(actual).assertClose(19.231, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0178
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0178
     * @tc.desc      seekTimeOf(offsetX=1, screenW=100, totalTime=2) returns 0.029
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0178 begin`);
      const actual: number = seekTimeOf(1, 100, 2);
      logInfo(`seekTimeOf(offsetX=1, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(0.029, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0179
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0179
     * @tc.desc      seekTimeOf(offsetX=1, screenW=10, totalTime=61000) returns -3050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0179 begin`);
      const actual: number = seekTimeOf(1, 10, 61000);
      logInfo(`seekTimeOf(offsetX=1, screenW=10, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-3050);
      logInfo(`${BUNDLE}SeekTimeOf_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0180
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0180
     * @tc.desc      seekTimeOf(offsetX=10, screenW=2, totalTime=3599000) returns -1285357.143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0180 begin`);
      const actual: number = seekTimeOf(10, 2, 3599000);
      logInfo(`seekTimeOf(offsetX=10, screenW=2, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-1285357.143, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0181
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0181
     * @tc.desc      seekTimeOf(offsetX=1, screenW=1, totalTime=1000) returns -34.483
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0181 begin`);
      const actual: number = seekTimeOf(1, 1, 1000);
      logInfo(`seekTimeOf(offsetX=1, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-34.483, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0182
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0182
     * @tc.desc      seekTimeOf(offsetX=4, screenW=1, totalTime=3599000) returns -496413.793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0182 begin`);
      const actual: number = seekTimeOf(4, 1, 3599000);
      logInfo(`seekTimeOf(offsetX=4, screenW=1, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-496413.793, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0183
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0183
     * @tc.desc      seekTimeOf(offsetX=50, screenW=10, totalTime=2) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0183 begin`);
      const actual: number = seekTimeOf(50, 10, 2);
      logInfo(`seekTimeOf(offsetX=50, screenW=10, totalT...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}SeekTimeOf_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0184
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0184
     * @tc.desc      seekTimeOf(offsetX=-27, screenW=1, totalTime=1000) returns 931.034
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0184 begin`);
      const actual: number = seekTimeOf(-27, 1, 1000);
      logInfo(`seekTimeOf(offsetX=-27, screenW=1, totalT...: actual=${actual}`);
      expect(actual).assertClose(931.034, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0185
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0185
     * @tc.desc      seekTimeOf(offsetX=100, screenW=-1, totalTime=999) returns -3222.581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0185 begin`);
      const actual: number = seekTimeOf(100, -1, 999);
      logInfo(`seekTimeOf(offsetX=100, screenW=-1, total...: actual=${actual}`);
      expect(actual).assertClose(-3222.581, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0186
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0186
     * @tc.desc      seekTimeOf(offsetX=50, screenW=1, totalTime=2) returns -3.448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0186 begin`);
      const actual: number = seekTimeOf(50, 1, 2);
      logInfo(`seekTimeOf(offsetX=50, screenW=1, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-3.448, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0187
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0187
     * @tc.desc      seekTimeOf(offsetX=5, screenW=15, totalTime=3600000) returns -1200000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0187 begin`);
      const actual: number = seekTimeOf(5, 15, 3600000);
      logInfo(`seekTimeOf(offsetX=5, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-1200000);
      logInfo(`${BUNDLE}SeekTimeOf_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0188
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0188
     * @tc.desc      seekTimeOf(offsetX=2, screenW=9.61, totalTime=60000) returns -5885.238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0188 begin`);
      const actual: number = seekTimeOf(2, 9.61, 60000);
      logInfo(`seekTimeOf(offsetX=2, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-5885.238, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0189
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0189
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=0, totalTime=999) returns 3330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0189 begin`);
      const actual: number = seekTimeOf(-100, 0, 999);
      logInfo(`seekTimeOf(offsetX=-100, screenW=0, total...: actual=${actual}`);
      expect(actual).assertEqual(3330);
      logInfo(`${BUNDLE}SeekTimeOf_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0190
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0190
     * @tc.desc      seekTimeOf(offsetX=-1, screenW=10, totalTime=500) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0190 begin`);
      const actual: number = seekTimeOf(-1, 10, 500);
      logInfo(`seekTimeOf(offsetX=-1, screenW=10, totalT...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}SeekTimeOf_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0191
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0191
     * @tc.desc      seekTimeOf(offsetX=3, screenW=10, totalTime=500) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0191 begin`);
      const actual: number = seekTimeOf(3, 10, 500);
      logInfo(`seekTimeOf(offsetX=3, screenW=10, totalTi...: actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}SeekTimeOf_0191 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0192
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0192
     * @tc.desc      seekTimeOf(offsetX=5, screenW=3, totalTime=3) returns -0.556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0192 begin`);
      const actual: number = seekTimeOf(5, 3, 3);
      logInfo(`seekTimeOf(offsetX=5, screenW=3, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.556, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0192 end`);
    });
  });
}
