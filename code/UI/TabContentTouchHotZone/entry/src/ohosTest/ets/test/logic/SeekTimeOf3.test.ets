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

/** Logic checks for seekTimeOf (13 cases). */
export default function seekTimeOf3Test(): void {
  describe('SeekTimeOf3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0193
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0193
     * @tc.desc      seekTimeOf(offsetX=1, screenW=9.61, totalTime=59999) returns -2942.57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0193 begin`);
      const actual: number = seekTimeOf(1, 9.61, 59999);
      logInfo(`seekTimeOf(offsetX=1, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-2942.57, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0194
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0194
     * @tc.desc      seekTimeOf(offsetX=2, screenW=100, totalTime=2) returns 0.057
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0194 begin`);
      const actual: number = seekTimeOf(2, 100, 2);
      logInfo(`seekTimeOf(offsetX=2, screenW=100, totalT...: actual=${actual}`);
      expect(actual).assertClose(0.057, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0195
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0195
     * @tc.desc      seekTimeOf(offsetX=3, screenW=5, totalTime=1000) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0195 begin`);
      const actual: number = seekTimeOf(3, 5, 1000);
      logInfo(`seekTimeOf(offsetX=3, screenW=5, totalTim...: actual=${actual}`);
      expect(actual).assertEqual(-120);
      logInfo(`${BUNDLE}SeekTimeOf_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0196
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0196
     * @tc.desc      seekTimeOf(offsetX=100, screenW=100, totalTime=999) returns 1427.143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0196 begin`);
      const actual: number = seekTimeOf(100, 100, 999);
      logInfo(`seekTimeOf(offsetX=100, screenW=100, tota...: actual=${actual}`);
      expect(actual).assertClose(1427.143, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0197
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0197
     * @tc.desc      seekTimeOf(offsetX=4, screenW=15, totalTime=61000) returns -16266.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0197 begin`);
      const actual: number = seekTimeOf(4, 15, 61000);
      logInfo(`seekTimeOf(offsetX=4, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-16266.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0198
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0198
     * @tc.desc      seekTimeOf(offsetX=-100, screenW=0, totalTime=59999) returns 199996.667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0198 begin`);
      const actual: number = seekTimeOf(-100, 0, 59999);
      logInfo(`seekTimeOf(offsetX=-100, screenW=0, total...: actual=${actual}`);
      expect(actual).assertClose(199996.667, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0199
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0199
     * @tc.desc      seekTimeOf(offsetX=3, screenW=9.61, totalTime=60000) returns -8827.857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0199 begin`);
      const actual: number = seekTimeOf(3, 9.61, 60000);
      logInfo(`seekTimeOf(offsetX=3, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-8827.857, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0200
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0200
     * @tc.desc      seekTimeOf(offsetX=100, screenW=100, totalTime=59999) returns 85712.857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeekTimeOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0200 begin`);
      const actual: number = seekTimeOf(100, 100, 59999);
      logInfo(`seekTimeOf(offsetX=100, screenW=100, tota...: actual=${actual}`);
      expect(actual).assertClose(85712.857, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0201
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0201
     * @tc.desc      seekTimeOf(offsetX=100, screenW=-1, totalTime=3) returns -9.677
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeekTimeOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0201 begin`);
      const actual: number = seekTimeOf(100, -1, 3);
      logInfo(`seekTimeOf(offsetX=100, screenW=-1, total...: actual=${actual}`);
      expect(actual).assertClose(-9.677, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0201 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0202
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0202
     * @tc.desc      seekTimeOf(offsetX=4, screenW=9.61, totalTime=3599000) returns -706032.369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0202 begin`);
      const actual: number = seekTimeOf(4, 9.61, 3599000);
      logInfo(`seekTimeOf(offsetX=4, screenW=9.61, total...: actual=${actual}`);
      expect(actual).assertClose(-706032.369, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0203
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0203
     * @tc.desc      seekTimeOf(offsetX=3, screenW=4, totalTime=999) returns -115.269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0203 begin`);
      const actual: number = seekTimeOf(3, 4, 999);
      logInfo(`seekTimeOf(offsetX=3, screenW=4, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-115.269, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0204
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0204
     * @tc.desc      seekTimeOf(offsetX=3, screenW=2, totalTime=4) returns -0.429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0204 begin`);
      const actual: number = seekTimeOf(3, 2, 4);
      logInfo(`seekTimeOf(offsetX=3, screenW=2, totalTim...: actual=${actual}`);
      expect(actual).assertClose(-0.429, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEK_TIME_OF_0205
     * @tc.name      TabContentTouchHotZone_SeekTimeOf_0205
     * @tc.desc      seekTimeOf(offsetX=2, screenW=15, totalTime=59999) returns -7999.867
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_SeekTimeOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}SeekTimeOf_0205 begin`);
      const actual: number = seekTimeOf(2, 15, 59999);
      logInfo(`seekTimeOf(offsetX=2, screenW=15, totalTi...: actual=${actual}`);
      expect(actual).assertClose(-7999.867, PRECISION);
      logInfo(`${BUNDLE}SeekTimeOf_0205 end`);
    });
  });
}
