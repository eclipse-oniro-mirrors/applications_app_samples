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

/** Logic checks for offsetForTimeOf (14 cases). */
export default function offsetForTimeOf3Test(): void {
  describe('OffsetForTimeOf3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0193
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0193
     * @tc.desc      offsetForTimeOf(time=500, totalTime=3600000, screenW=15) returns -0.0020833333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0193 begin`);
      const actual: number = offsetForTimeOf(500, 3600000, 15);
      logInfo(`offsetForTimeOf(time=500, totalTime=36000...: actual=${actual}`);
      expect(actual).assertClose(-0.0020833333333333333, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0194
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0194
     * @tc.desc      offsetForTimeOf(time=3599000, totalTime=999, screenW=2) returns -100872.87287287287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0194 begin`);
      const actual: number = offsetForTimeOf(3599000, 999, 2);
      logInfo(`offsetForTimeOf(time=3599000, totalTime=9...: actual=${actual}`);
      expect(actual).assertClose(-100872.87287287287, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0195
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0195
     * @tc.desc      offsetForTimeOf(time=3600000, totalTime=3599000, screenW=5) returns -25.00694637399278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0195 begin`);
      const actual: number = offsetForTimeOf(3600000, 3599000, 5);
      logInfo(`offsetForTimeOf(time=3600000, totalTime=3...: actual=${actual}`);
      expect(actual).assertClose(-25.00694637399278, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0196
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0196
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=2, screenW=25) returns -149997.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0196 begin`);
      const actual: number = offsetForTimeOf(59999, 2, 25);
      logInfo(`offsetForTimeOf(time=59999, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertClose(-149997.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0197
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0197
     * @tc.desc      offsetForTimeOf(time=500, totalTime=61000, screenW=0) returns -0.24590163934426232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0197 begin`);
      const actual: number = offsetForTimeOf(500, 61000, 0);
      logInfo(`offsetForTimeOf(time=500, totalTime=61000...: actual=${actual}`);
      expect(actual).assertClose(-0.24590163934426232, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0198
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0198
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=60000, screenW=0) returns -29.9995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0198 begin`);
      const actual: number = offsetForTimeOf(59999, 60000, 0);
      logInfo(`offsetForTimeOf(time=59999, totalTime=600...: actual=${actual}`);
      expect(actual).assertClose(-29.9995, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0199
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0199
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=3599000, screenW=25) returns -0.0847457627118644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0199 begin`);
      const actual: number = offsetForTimeOf(61000, 3599000, 25);
      logInfo(`offsetForTimeOf(time=61000, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.0847457627118644, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0200
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0200
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=3599000, screenW=2) returns -0.4667885523756599
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0200 begin`);
      const actual: number = offsetForTimeOf(59999, 3599000, 2);
      logInfo(`offsetForTimeOf(time=59999, totalTime=359...: actual=${actual}`);
      expect(actual).assertClose(-0.4667885523756599, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0201
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0201
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=2, screenW=1) returns -869985.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0201 begin`);
      const actual: number = offsetForTimeOf(59999, 2, 1);
      logInfo(`offsetForTimeOf(time=59999, totalTime=2, ...: actual=${actual}`);
      expect(actual).assertClose(-869985.5, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0201 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0202
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0202
     * @tc.desc      offsetForTimeOf(time=999, totalTime=60000, screenW=20) returns -0.1665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0202 begin`);
      const actual: number = offsetForTimeOf(999, 60000, 20);
      logInfo(`offsetForTimeOf(time=999, totalTime=60000...: actual=${actual}`);
      expect(actual).assertClose(-0.1665, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0203
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0203
     * @tc.desc      offsetForTimeOf(time=1000, totalTime=1, screenW=33.84) returns 3840.0000000000036
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0203 begin`);
      const actual: number = offsetForTimeOf(1000, 1, 33.84);
      logInfo(`offsetForTimeOf(time=1000, totalTime=1, s...: actual=${actual}`);
      expect(actual).assertClose(3840.0000000000036, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0204
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0204
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=500, screenW=5) returns -2999.9500000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0204 begin`);
      const actual: number = offsetForTimeOf(59999, 500, 5);
      logInfo(`offsetForTimeOf(time=59999, totalTime=500...: actual=${actual}`);
      expect(actual).assertClose(-2999.9500000000003, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0205
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0205
     * @tc.desc      offsetForTimeOf(time=61000, totalTime=-1, screenW=100) returns -4270000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0205 begin`);
      const actual: number = offsetForTimeOf(61000, -1, 100);
      logInfo(`offsetForTimeOf(time=61000, totalTime=-1,...: actual=${actual}`);
      expect(actual).assertEqual(-4270000);
      logInfo(`${BUNDLE}OffsetForTimeOf_0205 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_OFFSET_FOR_TIME_OF_0206
     * @tc.name      TabContentTouchHotZone_OffsetForTimeOf_0206
     * @tc.desc      offsetForTimeOf(time=59999, totalTime=1000, screenW=10) returns -1199.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_OffsetForTimeOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetForTimeOf_0206 begin`);
      const actual: number = offsetForTimeOf(59999, 1000, 10);
      logInfo(`offsetForTimeOf(time=59999, totalTime=100...: actual=${actual}`);
      expect(actual).assertClose(-1199.98, PRECISION);
      logInfo(`${BUNDLE}OffsetForTimeOf_0206 end`);
    });
  });
}
