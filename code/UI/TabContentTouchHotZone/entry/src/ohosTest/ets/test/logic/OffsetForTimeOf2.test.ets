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
export default function offsetForTimeOf2Test(): void {
  describe('OffsetForTimeOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0097
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0097
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=3599000, screenW=1) returns -0.48346762989719366
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0097 begin`);
      const actual: number = offsetForTimeOf(60000, 3599000, 1);
      logInfo(`offsetForTimeOf(time=60000, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.48346762989719366, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0098
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0098
     * @tc.desc      offsetForTimeOf(time=2, totalTime=3600000, screenW=-1) returns -0.00001722222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0098 begin`);
      const actual: number = offsetForTimeOf(2, 3600000, -1);
      logInfo(`offsetForTimeOf(time=2, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(-0.00001722222222222222, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0099
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0099
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=2, screenW=1) returns -52185500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0099 begin`);
      const actual: number = offsetForTimeOf(3599000, 2, 1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=2...: actual=${actual}`);
      expect(actual).assertEqual(-52185500);
      logInfo(`${BUNDLE}OffsetForTimeOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0100
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0100
     * @tc.desc      offsetForTimeOf(time=999, totalTime=61000, screenW=20) returns -0.16377049180327868
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0100 begin`);
      const actual: number = offsetForTimeOf(999, 61000, 20);
      logInfo(`offsetForTimeOf(time=999, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(-0.16377049180327868, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0101
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0101
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=-1, screenW=2) returns 1708000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0101 begin`);
      const actual: number = offsetForTimeOf(61000, -1, 2);
      logInfo(`offsetForTimeOf(time=61000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1708000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0102
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0102
     * @tc.desc      offsetForTimeOf(time=1, totalTime=500, screenW=25) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0102 begin`);
      const actual: number = offsetForTimeOf(1, 500, 25);
      logInfo(`offsetForTimeOf(time=1, totalTime=500, sc...: actual=${actual}`);
      expect(actual).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0103
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0103
     * @tc.desc      offsetForTimeOf(time=500, totalTime=1, screenW=33.84) returns 1920.0000000000018
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0103 begin`);
      const actual: number = offsetForTimeOf(500, 1, 33.84);
      logInfo(`offsetForTimeOf(time=500, totalTime=1, sc...: actual=${actual}`);
      expect(actual).assertClose(1920.0000000000018, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0104
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0104
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=2, screenW=10) returns -600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0104 begin`);
      const actual: number = offsetForTimeOf(60000, 2, 10);
      logInfo(`offsetForTimeOf(time=60000, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-600000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0105
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0105
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=3599000, screenW=20) returns 0.0000027785495971103087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0105 begin`);
      const actual: number = offsetForTimeOf(-1, 3599000, 20);
      logInfo(`offsetForTimeOf(time=-1, totalTime=359900...: actual=${actual}`);
      expect(actual).assertClose(0.0000027785495971103087, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0106
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0106
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=2, screenW=0) returns -53985000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0106 begin`);
      const actual: number = offsetForTimeOf(3599000, 2, 0);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=2...: actual=${actual}`);
      expect(actual).assertEqual(-53985000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0107
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0107
     * @tc.desc      offsetForTimeOf(time=500, totalTime=61000, screenW=-1) returns -0.2540983606557377
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0107 begin`);
      const actual: number = offsetForTimeOf(500, 61000, -1);
      logInfo(`offsetForTimeOf(time=500, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(-0.2540983606557377, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0108
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0108
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=61000, screenW=1) returns -0.4754098360655738
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0108 begin`);
      const actual: number = offsetForTimeOf(1000, 61000, 1);
      logInfo(`offsetForTimeOf(time=1000, totalTime=6100...: actual=${actual}`);
      expect(actual).assertClose(-0.4754098360655738, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0109
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0109
     * @tc.desc      offsetForTimeOf(time=2, totalTime=3600000, screenW=0) returns -0.000016666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0109 begin`);
      const actual: number = offsetForTimeOf(2, 3600000, 0);
      logInfo(`offsetForTimeOf(time=2, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(-0.000016666666666666664, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0110
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0110
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=-1, screenW=33.84) returns -3840.0000000000036
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0110 begin`);
      const actual: number = offsetForTimeOf(1000, -1, 33.84);
      logInfo(`offsetForTimeOf(time=1000, totalTime=-1, ...: actual=${actual}`);
      expect(actual).assertClose(-3840.0000000000036, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0111
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0111
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=999, screenW=1) returns -1741.7417417417416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0111 begin`);
      const actual: number = offsetForTimeOf(60000, 999, 1);
      logInfo(`offsetForTimeOf(time=60000, totalTime=999...: actual=${actual}`);
      expect(actual).assertClose(-1741.7417417417416, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0112
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0112
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=3599000, screenW=1) returns -0.4915254237288136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0112 begin`);
      const actual: number = offsetForTimeOf(61000, 3599000, 1);
      logInfo(`offsetForTimeOf(time=61000, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.4915254237288136, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0113
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0113
     * @tc.desc      offsetForTimeOf(time=2, totalTime=59999, screenW=1) returns -0.0009666827780463008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0113 begin`);
      const actual: number = offsetForTimeOf(2, 59999, 1);
      logInfo(`offsetForTimeOf(time=2, totalTime=59999, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0009666827780463008, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0114
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0114
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=59999, screenW=10) returns -0.33333888898148306
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0114 begin`);
      const actual: number = offsetForTimeOf(1000, 59999, 10);
      logInfo(`offsetForTimeOf(time=1000, totalTime=5999...: actual=${actual}`);
      expect(actual).assertClose(-0.33333888898148306, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0115
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0115
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=60000, screenW=20) returns -9.999833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0115 begin`);
      const actual: number = offsetForTimeOf(59999, 60000, 20);
      logInfo(`offsetForTimeOf(time=59999, totalTime=600...: actual=${actual}`);
      expect(actual).assertClose(-9.999833333333333, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0116
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0116
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=500, screenW=100) returns 8400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0116 begin`);
      const actual: number = offsetForTimeOf(60000, 500, 100);
      logInfo(`offsetForTimeOf(time=60000, totalTime=500...: actual=${actual}`);
      expect(actual).assertEqual(8400);
      logInfo(`${BUNDLE}OffsetForTimeOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0117
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0117
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=59999, screenW=10) returns -1200.0200003333389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0117 begin`);
      const actual: number = offsetForTimeOf(3600000, 59999, 10);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=5...: actual=${actual}`);
      expect(actual).assertClose(-1200.0200003333389, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0118
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0118
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=999, screenW=3) returns -1648.6486486486485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0118 begin`);
      const actual: number = offsetForTimeOf(61000, 999, 3);
      logInfo(`offsetForTimeOf(time=61000, totalTime=999...: actual=${actual}`);
      expect(actual).assertClose(-1648.6486486486485, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0119
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0119
     * @tc.desc      offsetForTimeOf(time=500, totalTime=2, screenW=100) returns 17500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0119 begin`);
      const actual: number = offsetForTimeOf(500, 2, 100);
      logInfo(`offsetForTimeOf(time=500, totalTime=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(17500);
      logInfo(`${BUNDLE}OffsetForTimeOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0120
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0120
     * @tc.desc      offsetForTimeOf(time=999, totalTime=-1, screenW=10) returns 19980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0120 begin`);
      const actual: number = offsetForTimeOf(999, -1, 10);
      logInfo(`offsetForTimeOf(time=999, totalTime=-1, s...: actual=${actual}`);
      expect(actual).assertEqual(19980);
      logInfo(`${BUNDLE}OffsetForTimeOf_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0121
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0121
     * @tc.desc      offsetForTimeOf(time=1, totalTime=999, screenW=10) returns -0.02002002002002002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0121 begin`);
      const actual: number = offsetForTimeOf(1, 999, 10);
      logInfo(`offsetForTimeOf(time=1, totalTime=999, sc...: actual=${actual}`);
      expect(actual).assertClose(-0.02002002002002002, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0122
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0122
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=1, screenW=3) returns -27000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0122 begin`);
      const actual: number = offsetForTimeOf(1000, 1, 3);
      logInfo(`offsetForTimeOf(time=1000, totalTime=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-27000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0123
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0123
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=3600000, screenW=5) returns 0.000006944444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0123 begin`);
      const actual: number = offsetForTimeOf(-1, 3600000, 5);
      logInfo(`offsetForTimeOf(time=-1, totalTime=360000...: actual=${actual}`);
      expect(actual).assertClose(0.000006944444444444444, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0124
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0124
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=3600000, screenW=3) returns -0.4575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0124 begin`);
      const actual: number = offsetForTimeOf(61000, 3600000, 3);
      logInfo(`offsetForTimeOf(time=61000, totalTime=360...: actual=${actual}`);
      expect(actual).assertClose(-0.4575, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0125
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0125
     * @tc.desc      offsetForTimeOf(time=500, totalTime=61000, screenW=20) returns -0.0819672131147541
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0125 begin`);
      const actual: number = offsetForTimeOf(500, 61000, 20);
      logInfo(`offsetForTimeOf(time=500, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(-0.0819672131147541, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0126
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0126
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=60000, screenW=100) returns 4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0126 begin`);
      const actual: number = offsetForTimeOf(3600000, 60000, 100);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=6...: actual=${actual}`);
      expect(actual).assertEqual(4200);
      logInfo(`${BUNDLE}OffsetForTimeOf_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0127
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0127
     * @tc.desc      offsetForTimeOf(time=500, totalTime=1000, screenW=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0127 begin`);
      const actual: number = offsetForTimeOf(500, 1000, 10);
      logInfo(`offsetForTimeOf(time=500, totalTime=1000,...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}OffsetForTimeOf_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0128
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0128
     * @tc.desc      offsetForTimeOf(time=999, totalTime=61000, screenW=33.84) returns 0.06288786885245908
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0128 begin`);
      const actual: number = offsetForTimeOf(999, 61000, 33.84);
      logInfo(`offsetForTimeOf(time=999, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(0.06288786885245908, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0129
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0129
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=59999, screenW=1) returns -0.48334138902315044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0129 begin`);
      const actual: number = offsetForTimeOf(1000, 59999, 1);
      logInfo(`offsetForTimeOf(time=1000, totalTime=5999...: actual=${actual}`);
      expect(actual).assertClose(-0.48334138902315044, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0130
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0130
     * @tc.desc      offsetForTimeOf(time=1, totalTime=3600000, screenW=33.84) returns 0.0000010666666666666675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0130 begin`);
      const actual: number = offsetForTimeOf(1, 3600000, 33.84);
      logInfo(`offsetForTimeOf(time=1, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(0.0000010666666666666675, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0131
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0131
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=60000, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0131 begin`);
      const actual: number = offsetForTimeOf(60000, 60000, 10);
      logInfo(`offsetForTimeOf(time=60000, totalTime=600...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}OffsetForTimeOf_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0132
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0132
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=59999, screenW=20) returns -10.166836113935231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0132 begin`);
      const actual: number = offsetForTimeOf(61000, 59999, 20);
      logInfo(`offsetForTimeOf(time=61000, totalTime=599...: actual=${actual}`);
      expect(actual).assertClose(-10.166836113935231, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0133
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0133
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=999, screenW=2) returns -1709.7097097097096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0133 begin`);
      const actual: number = offsetForTimeOf(61000, 999, 2);
      logInfo(`offsetForTimeOf(time=61000, totalTime=999...: actual=${actual}`);
      expect(actual).assertClose(-1709.7097097097096, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0134
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0134
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=500, screenW=15) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0134 begin`);
      const actual: number = offsetForTimeOf(1000, 500, 15);
      logInfo(`offsetForTimeOf(time=1000, totalTime=500,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}OffsetForTimeOf_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0135
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0135
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=-1, screenW=15) returns 915000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0135 begin`);
      const actual: number = offsetForTimeOf(61000, -1, 15);
      logInfo(`offsetForTimeOf(time=61000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(915000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0136
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0136
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=-1, screenW=10) returns 1220000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0136 begin`);
      const actual: number = offsetForTimeOf(61000, -1, 10);
      logInfo(`offsetForTimeOf(time=61000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1220000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0137
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0137
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=61000, screenW=1) returns -1711.4754098360654
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0137 begin`);
      const actual: number = offsetForTimeOf(3600000, 61000, 1);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-1711.4754098360654, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0138
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0138
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=-1, screenW=-1) returns 111600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0138 begin`);
      const actual: number = offsetForTimeOf(3600000, -1, -1);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=-...: actual=${actual}`);
      expect(actual).assertEqual(111600000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0139
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0139
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=60000, screenW=20) returns -599.8333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0139 begin`);
      const actual: number = offsetForTimeOf(3599000, 60000, 20);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-599.8333333333334, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0140
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0140
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=3599000, screenW=33.84) returns 0.0010669630452903593
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0140 begin`);
      const actual: number = offsetForTimeOf(1000, 3599000, 33.84);
      logInfo(`offsetForTimeOf(time=1000, totalTime=3599...: actual=${actual}`);
      expect(actual).assertClose(0.0010669630452903593, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0141
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0141
     * @tc.desc      offsetForTimeOf(time=2, totalTime=500, screenW=1) returns -0.116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0141 begin`);
      const actual: number = offsetForTimeOf(2, 500, 1);
      logInfo(`offsetForTimeOf(time=2, totalTime=500, sc...: actual=${actual}`);
      expect(actual).assertClose(-0.116, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0142
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0142
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=1, screenW=15) returns -15000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0142 begin`);
      const actual: number = offsetForTimeOf(1000, 1, 15);
      logInfo(`offsetForTimeOf(time=1000, totalTime=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-15000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0143
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0143
     * @tc.desc      offsetForTimeOf(time=500, totalTime=3599000, screenW=25) returns -0.000694637399277577
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0143 begin`);
      const actual: number = offsetForTimeOf(500, 3599000, 25);
      logInfo(`offsetForTimeOf(time=500, totalTime=35990...: actual=${actual}`);
      expect(actual).assertClose(-0.000694637399277577, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0144
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0144
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=3600000, screenW=33.84) returns 0.0010666666666666676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0144 begin`);
      const actual: number = offsetForTimeOf(1000, 3600000, 33.84);
      logInfo(`offsetForTimeOf(time=1000, totalTime=3600...: actual=${actual}`);
      expect(actual).assertClose(0.0010666666666666676, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0145
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0145
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=1000, screenW=15) returns -54000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0145 begin`);
      const actual: number = offsetForTimeOf(3600000, 1000, 15);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=1...: actual=${actual}`);
      expect(actual).assertEqual(-54000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0145 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0146
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0146
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=999, screenW=15) returns -915.9159159159159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0146 begin`);
      const actual: number = offsetForTimeOf(61000, 999, 15);
      logInfo(`offsetForTimeOf(time=61000, totalTime=999...: actual=${actual}`);
      expect(actual).assertClose(-915.9159159159159, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0147
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0147
     * @tc.desc      offsetForTimeOf(time=500, totalTime=2, screenW=-1) returns -7750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0147 begin`);
      const actual: number = offsetForTimeOf(500, 2, -1);
      logInfo(`offsetForTimeOf(time=500, totalTime=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-7750);
      logInfo(`${BUNDLE}OffsetForTimeOf_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0148
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0148
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=60000, screenW=2) returns 0.00046666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0148 begin`);
      const actual: number = offsetForTimeOf(-1, 60000, 2);
      logInfo(`offsetForTimeOf(time=-1, totalTime=60000,...: actual=${actual}`);
      expect(actual).assertClose(0.00046666666666666666, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0149
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0149
     * @tc.desc      offsetForTimeOf(time=1, totalTime=1, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0149 begin`);
      const actual: number = offsetForTimeOf(1, 1, 25);
      logInfo(`offsetForTimeOf(time=1, totalTime=1, scre...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}OffsetForTimeOf_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0150
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0150
     * @tc.desc      offsetForTimeOf(time=2, totalTime=1, screenW=0) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0150 begin`);
      const actual: number = offsetForTimeOf(2, 1, 0);
      logInfo(`offsetForTimeOf(time=2, totalTime=1, scre...: actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}OffsetForTimeOf_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0151
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0151
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=3600000, screenW=1) returns 0.000008055555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0151 begin`);
      const actual: number = offsetForTimeOf(-1, 3600000, 1);
      logInfo(`offsetForTimeOf(time=-1, totalTime=360000...: actual=${actual}`);
      expect(actual).assertClose(0.000008055555555555556, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0151 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0152
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0152
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=2, screenW=-1) returns -55784500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0152 begin`);
      const actual: number = offsetForTimeOf(3599000, 2, -1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=2...: actual=${actual}`);
      expect(actual).assertEqual(-55784500);
      logInfo(`${BUNDLE}OffsetForTimeOf_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0153
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0153
     * @tc.desc      offsetForTimeOf(time=999, totalTime=3600000, screenW=25) returns -0.0013875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0153 begin`);
      const actual: number = offsetForTimeOf(999, 3600000, 25);
      logInfo(`offsetForTimeOf(time=999, totalTime=36000...: actual=${actual}`);
      expect(actual).assertClose(-0.0013875, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0154
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0154
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=-1, screenW=25) returns 17995000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0154 begin`);
      const actual: number = offsetForTimeOf(3599000, -1, 25);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=-...: actual=${actual}`);
      expect(actual).assertEqual(17995000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0155
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0155
     * @tc.desc      offsetForTimeOf(time=2, totalTime=61000, screenW=20) returns -0.0003278688524590164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0155 begin`);
      const actual: number = offsetForTimeOf(2, 61000, 20);
      logInfo(`offsetForTimeOf(time=2, totalTime=61000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0003278688524590164, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0156
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0156
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=3599000, screenW=-1) returns -0.5254237288135594
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0156 begin`);
      const actual: number = offsetForTimeOf(61000, 3599000, -1);
      logInfo(`offsetForTimeOf(time=61000, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.5254237288135594, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0157
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0157
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=61000, screenW=20) returns -590.1639344262295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0157 begin`);
      const actual: number = offsetForTimeOf(3600000, 61000, 20);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=6...: actual=${actual}`);
      expect(actual).assertClose(-590.1639344262295, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0158
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0158
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=1000, screenW=0) returns -108000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0158 begin`);
      const actual: number = offsetForTimeOf(3600000, 1000, 0);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=1...: actual=${actual}`);
      expect(actual).assertEqual(-108000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0159
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0159
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=-1, screenW=25) returns 18000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0159 begin`);
      const actual: number = offsetForTimeOf(3600000, -1, 25);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=-...: actual=${actual}`);
      expect(actual).assertEqual(18000000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0160
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0160
     * @tc.desc      offsetForTimeOf(time=2, totalTime=61000, screenW=10) returns -0.0006557377049180328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0160 begin`);
      const actual: number = offsetForTimeOf(2, 61000, 10);
      logInfo(`offsetForTimeOf(time=2, totalTime=61000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.0006557377049180328, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0161
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0161
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=60000, screenW=1) returns -0.48333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0161 begin`);
      const actual: number = offsetForTimeOf(1000, 60000, 1);
      logInfo(`offsetForTimeOf(time=1000, totalTime=6000...: actual=${actual}`);
      expect(actual).assertClose(-0.48333333333333334, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0162
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0162
     * @tc.desc      offsetForTimeOf(time=2, totalTime=3599000, screenW=33.84) returns 0.000002133926090580719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0162 begin`);
      const actual: number = offsetForTimeOf(2, 3599000, 33.84);
      logInfo(`offsetForTimeOf(time=2, totalTime=3599000...: actual=${actual}`);
      expect(actual).assertClose(0.000002133926090580719, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0163
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0163
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=59999, screenW=100) returns 70.00116668611143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0163 begin`);
      const actual: number = offsetForTimeOf(60000, 59999, 100);
      logInfo(`offsetForTimeOf(time=60000, totalTime=599...: actual=${actual}`);
      expect(actual).assertClose(70.00116668611143, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0164
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0164
     * @tc.desc      offsetForTimeOf(time=1, totalTime=61000, screenW=2) returns -0.000459016393442623
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0164 begin`);
      const actual: number = offsetForTimeOf(1, 61000, 2);
      logInfo(`offsetForTimeOf(time=1, totalTime=61000, ...: actual=${actual}`);
      expect(actual).assertClose(-0.000459016393442623, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0165
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0165
     * @tc.desc      offsetForTimeOf(time=500, totalTime=59999, screenW=33.84) returns 0.0320005333422224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0165 begin`);
      const actual: number = offsetForTimeOf(500, 59999, 33.84);
      logInfo(`offsetForTimeOf(time=500, totalTime=59999...: actual=${actual}`);
      expect(actual).assertClose(0.0320005333422224, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0166
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0166
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=1, screenW=1) returns -29000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0166 begin`);
      const actual: number = offsetForTimeOf(1000, 1, 1);
      logInfo(`offsetForTimeOf(time=1000, totalTime=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-29000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0167
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0167
     * @tc.desc      offsetForTimeOf(time=2, totalTime=3600000, screenW=10) returns -0.00001111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0167 begin`);
      const actual: number = offsetForTimeOf(2, 3600000, 10);
      logInfo(`offsetForTimeOf(time=2, totalTime=3600000...: actual=${actual}`);
      expect(actual).assertClose(-0.00001111111111111111, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0168
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0168
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=-1, screenW=-1) returns 111569000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0168 begin`);
      const actual: number = offsetForTimeOf(3599000, -1, -1);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=-...: actual=${actual}`);
      expect(actual).assertEqual(111569000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0169
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0169
     * @tc.desc      offsetForTimeOf(time=999, totalTime=3599000, screenW=-1) returns -0.008604890247290914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0169 begin`);
      const actual: number = offsetForTimeOf(999, 3599000, -1);
      logInfo(`offsetForTimeOf(time=999, totalTime=35990...: actual=${actual}`);
      expect(actual).assertClose(-0.008604890247290914, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0170
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0170
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=3600000, screenW=0) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0170 begin`);
      const actual: number = offsetForTimeOf(60000, 3600000, 0);
      logInfo(`offsetForTimeOf(time=60000, totalTime=360...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0171
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0171
     * @tc.desc      offsetForTimeOf(time=2, totalTime=-1, screenW=25) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0171 begin`);
      const actual: number = offsetForTimeOf(2, -1, 25);
      logInfo(`offsetForTimeOf(time=2, totalTime=-1, scr...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}OffsetForTimeOf_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0172
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0172
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=1, screenW=100) returns 4199930
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0172 begin`);
      const actual: number = offsetForTimeOf(59999, 1, 100);
      logInfo(`offsetForTimeOf(time=59999, totalTime=1, ...: actual=${actual}`);
      expect(actual).assertEqual(4199930);
      logInfo(`${BUNDLE}OffsetForTimeOf_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0173
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0173
     * @tc.desc      offsetForTimeOf(time=999, totalTime=61000, screenW=25) returns -0.08188524590163934
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0173 begin`);
      const actual: number = offsetForTimeOf(999, 61000, 25);
      logInfo(`offsetForTimeOf(time=999, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(-0.08188524590163934, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0174
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0174
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=2, screenW=20) returns -18000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0174 begin`);
      const actual: number = offsetForTimeOf(3600000, 2, 20);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=2...: actual=${actual}`);
      expect(actual).assertEqual(-18000000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0175
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0175
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=-1, screenW=20) returns 600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0175 begin`);
      const actual: number = offsetForTimeOf(60000, -1, 20);
      logInfo(`offsetForTimeOf(time=60000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(600000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0176
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0176
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=-1, screenW=5) returns 1525000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0176 begin`);
      const actual: number = offsetForTimeOf(61000, -1, 5);
      logInfo(`offsetForTimeOf(time=61000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1525000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0177
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0177
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=60000, screenW=15) returns -14.99975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0177 begin`);
      const actual: number = offsetForTimeOf(59999, 60000, 15);
      logInfo(`offsetForTimeOf(time=59999, totalTime=600...: actual=${actual}`);
      expect(actual).assertClose(-14.99975, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0178
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0178
     * @tc.desc      offsetForTimeOf(time=500, totalTime=61000, screenW=5) returns -0.20491803278688525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0178 begin`);
      const actual: number = offsetForTimeOf(500, 61000, 5);
      logInfo(`offsetForTimeOf(time=500, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(-0.20491803278688525, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0179
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0179
     * @tc.desc      offsetForTimeOf(time=-1, totalTime=60000, screenW=25) returns 0.00008333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0179 begin`);
      const actual: number = offsetForTimeOf(-1, 60000, 25);
      logInfo(`offsetForTimeOf(time=-1, totalTime=60000,...: actual=${actual}`);
      expect(actual).assertClose(0.00008333333333333334, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0180
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0180
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=3600000, screenW=20) returns -0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0180 begin`);
      const actual: number = offsetForTimeOf(60000, 3600000, 20);
      logInfo(`offsetForTimeOf(time=60000, totalTime=360...: actual=${actual}`);
      expect(actual).assertClose(-0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0181
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0181
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=3599000, screenW=100) returns 70.01944984717977
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0181 begin`);
      const actual: number = offsetForTimeOf(3600000, 3599000, 100);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=3...: actual=${actual}`);
      expect(actual).assertClose(70.01944984717977, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0182
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0182
     * @tc.desc      offsetForTimeOf(time=60000, totalTime=59999, screenW=3) returns -27.000450007500124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0182 begin`);
      const actual: number = offsetForTimeOf(60000, 59999, 3);
      logInfo(`offsetForTimeOf(time=60000, totalTime=599...: actual=${actual}`);
      expect(actual).assertClose(-27.000450007500124, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0183
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0183
     * @tc.desc      offsetForTimeOf(time=2, totalTime=3599000, screenW=5) returns -0.000013892747985551542
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0183 begin`);
      const actual: number = offsetForTimeOf(2, 3599000, 5);
      logInfo(`offsetForTimeOf(time=2, totalTime=3599000...: actual=${actual}`);
      expect(actual).assertClose(-0.000013892747985551542, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0184
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0184
     * @tc.desc      offsetForTimeOf(time=500, totalTime=59999, screenW=1) returns -0.24167069451157522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0184 begin`);
      const actual: number = offsetForTimeOf(500, 59999, 1);
      logInfo(`offsetForTimeOf(time=500, totalTime=59999...: actual=${actual}`);
      expect(actual).assertClose(-0.24167069451157522, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0185
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0185
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=500, screenW=20) returns -71980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0185 begin`);
      const actual: number = offsetForTimeOf(3599000, 500, 20);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=5...: actual=${actual}`);
      expect(actual).assertEqual(-71980);
      logInfo(`${BUNDLE}OffsetForTimeOf_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0186
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0186
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=59999, screenW=20) returns -600.0100001666694
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0186 begin`);
      const actual: number = offsetForTimeOf(3600000, 59999, 20);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=5...: actual=${actual}`);
      expect(actual).assertClose(-600.0100001666694, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0187
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0187
     * @tc.desc      offsetForTimeOf(time=500, totalTime=1, screenW=-1) returns -15500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0187 begin`);
      const actual: number = offsetForTimeOf(500, 1, -1);
      logInfo(`offsetForTimeOf(time=500, totalTime=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-15500);
      logInfo(`${BUNDLE}OffsetForTimeOf_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0188
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0188
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=1, screenW=5) returns -25000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0188 begin`);
      const actual: number = offsetForTimeOf(1000, 1, 5);
      logInfo(`offsetForTimeOf(time=1000, totalTime=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-25000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0189
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0189
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=-1, screenW=15) returns 53985000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0189 begin`);
      const actual: number = offsetForTimeOf(3599000, -1, 15);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=-...: actual=${actual}`);
      expect(actual).assertEqual(53985000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0190
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0190
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=999, screenW=0) returns -108078.07807807808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0190 begin`);
      const actual: number = offsetForTimeOf(3599000, 999, 0);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=9...: actual=${actual}`);
      expect(actual).assertClose(-108078.07807807808, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0191
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0191
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=3600000, screenW=2) returns -0.4744444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0191 begin`);
      const actual: number = offsetForTimeOf(61000, 3600000, 2);
      logInfo(`offsetForTimeOf(time=61000, totalTime=360...: actual=${actual}`);
      expect(actual).assertClose(-0.4744444444444445, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0191 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0192
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0192
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=2, screenW=10) returns -599990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0192 begin`);
      const actual: number = offsetForTimeOf(59999, 2, 10);
      logInfo(`offsetForTimeOf(time=59999, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-599990);
      logInfo(`${BUNDLE}OffsetForTimeOf_0192 end`);
    });
  });
}
