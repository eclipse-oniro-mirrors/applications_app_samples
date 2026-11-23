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
import { trackWidthOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for trackWidthOf (24 cases). */
export default function trackWidthOf2Test(): void {
  describe('TrackWidthOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0097
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0097
     * @tc.desc      trackWidthOf(screenW=62.72) returns 32.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0097 begin`);
      const actual: number = trackWidthOf(62.72);
      logInfo(`trackWidthOf(screenW=62.72): actual=${actual}`);
      expect(actual).assertClose(32.72, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0098
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0098
     * @tc.desc      trackWidthOf(screenW=-81) returns -111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0098 begin`);
      const actual: number = trackWidthOf(-81);
      logInfo(`trackWidthOf(screenW=-81): actual=${actual}`);
      expect(actual).assertEqual(-111);
      logInfo(`${BUNDLE}TrackWidthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0099
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0099
     * @tc.desc      trackWidthOf(screenW=9) returns -21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0099 begin`);
      const actual: number = trackWidthOf(9);
      logInfo(`trackWidthOf(screenW=9): actual=${actual}`);
      expect(actual).assertEqual(-21);
      logInfo(`${BUNDLE}TrackWidthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0100
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0100
     * @tc.desc      trackWidthOf(screenW=138) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0100 begin`);
      const actual: number = trackWidthOf(138);
      logInfo(`trackWidthOf(screenW=138): actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}TrackWidthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0101
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0101
     * @tc.desc      trackWidthOf(screenW=-2) returns -32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0101 begin`);
      const actual: number = trackWidthOf(-2);
      logInfo(`trackWidthOf(screenW=-2): actual=${actual}`);
      expect(actual).assertEqual(-32);
      logInfo(`${BUNDLE}TrackWidthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0102
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0102
     * @tc.desc      trackWidthOf(screenW=-50) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0102 begin`);
      const actual: number = trackWidthOf(-50);
      logInfo(`trackWidthOf(screenW=-50): actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}TrackWidthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0103
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0103
     * @tc.desc      trackWidthOf(screenW=8.44) returns -21.560000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0103 begin`);
      const actual: number = trackWidthOf(8.44);
      logInfo(`trackWidthOf(screenW=8.44): actual=${actual}`);
      expect(actual).assertClose(-21.560000000000002, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0104
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0104
     * @tc.desc      trackWidthOf(screenW=158) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0104 begin`);
      const actual: number = trackWidthOf(158);
      logInfo(`trackWidthOf(screenW=158): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}TrackWidthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0105
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0105
     * @tc.desc      trackWidthOf(screenW=63.23) returns 33.23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0105 begin`);
      const actual: number = trackWidthOf(63.23);
      logInfo(`trackWidthOf(screenW=63.23): actual=${actual}`);
      expect(actual).assertClose(33.23, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0106
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0106
     * @tc.desc      trackWidthOf(screenW=131) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0106 begin`);
      const actual: number = trackWidthOf(131);
      logInfo(`trackWidthOf(screenW=131): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}TrackWidthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0107
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0107
     * @tc.desc      trackWidthOf(screenW=-35) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0107 begin`);
      const actual: number = trackWidthOf(-35);
      logInfo(`trackWidthOf(screenW=-35): actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}TrackWidthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0108
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0108
     * @tc.desc      trackWidthOf(screenW=-16) returns -46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0108 begin`);
      const actual: number = trackWidthOf(-16);
      logInfo(`trackWidthOf(screenW=-16): actual=${actual}`);
      expect(actual).assertEqual(-46);
      logInfo(`${BUNDLE}TrackWidthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0109
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0109
     * @tc.desc      trackWidthOf(screenW=77.76) returns 47.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0109 begin`);
      const actual: number = trackWidthOf(77.76);
      logInfo(`trackWidthOf(screenW=77.76): actual=${actual}`);
      expect(actual).assertClose(47.760000000000005, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0110
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0110
     * @tc.desc      trackWidthOf(screenW=60.82) returns 30.82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0110 begin`);
      const actual: number = trackWidthOf(60.82);
      logInfo(`trackWidthOf(screenW=60.82): actual=${actual}`);
      expect(actual).assertClose(30.82, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0111
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0111
     * @tc.desc      trackWidthOf(screenW=15.32) returns -14.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0111 begin`);
      const actual: number = trackWidthOf(15.32);
      logInfo(`trackWidthOf(screenW=15.32): actual=${actual}`);
      expect(actual).assertClose(-14.68, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0112
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0112
     * @tc.desc      trackWidthOf(screenW=60.8) returns 30.799999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0112 begin`);
      const actual: number = trackWidthOf(60.8);
      logInfo(`trackWidthOf(screenW=60.8): actual=${actual}`);
      expect(actual).assertClose(30.799999999999997, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0113
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0113
     * @tc.desc      trackWidthOf(screenW=74.76) returns 44.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0113 begin`);
      const actual: number = trackWidthOf(74.76);
      logInfo(`trackWidthOf(screenW=74.76): actual=${actual}`);
      expect(actual).assertClose(44.760000000000005, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0114
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0114
     * @tc.desc      trackWidthOf(screenW=49.89) returns 19.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0114 begin`);
      const actual: number = trackWidthOf(49.89);
      logInfo(`trackWidthOf(screenW=49.89): actual=${actual}`);
      expect(actual).assertClose(19.89, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0115
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0115
     * @tc.desc      trackWidthOf(screenW=156) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0115 begin`);
      const actual: number = trackWidthOf(156);
      logInfo(`trackWidthOf(screenW=156): actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}TrackWidthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0116
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0116
     * @tc.desc      trackWidthOf(screenW=74.48) returns 44.480000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0116 begin`);
      const actual: number = trackWidthOf(74.48);
      logInfo(`trackWidthOf(screenW=74.48): actual=${actual}`);
      expect(actual).assertClose(44.480000000000004, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0117
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0117
     * @tc.desc      trackWidthOf(screenW=66.75) returns 36.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0117 begin`);
      const actual: number = trackWidthOf(66.75);
      logInfo(`trackWidthOf(screenW=66.75): actual=${actual}`);
      expect(actual).assertClose(36.75, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0118
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0118
     * @tc.desc      trackWidthOf(screenW=60.63) returns 30.630000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0118 begin`);
      const actual: number = trackWidthOf(60.63);
      logInfo(`trackWidthOf(screenW=60.63): actual=${actual}`);
      expect(actual).assertClose(30.630000000000003, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0119
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0119
     * @tc.desc      trackWidthOf(screenW=40.83) returns 10.829999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0119 begin`);
      const actual: number = trackWidthOf(40.83);
      logInfo(`trackWidthOf(screenW=40.83): actual=${actual}`);
      expect(actual).assertClose(10.829999999999998, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0120
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0120
     * @tc.desc      trackWidthOf(screenW=63.22) returns 33.22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0120 begin`);
      const actual: number = trackWidthOf(63.22);
      logInfo(`trackWidthOf(screenW=63.22): actual=${actual}`);
      expect(actual).assertClose(33.22, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0120 end`);
    });
  });
}
