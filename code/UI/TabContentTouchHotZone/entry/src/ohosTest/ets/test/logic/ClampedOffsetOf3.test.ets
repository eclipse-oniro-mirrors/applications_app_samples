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
import { clampedOffsetOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for clampedOffsetOf (13 cases). */
export default function clampedOffsetOf3Test(): void {
  describe('ClampedOffsetOf3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0193
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0193
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=50, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0193 begin`);
      const actual: number = clampedOffsetOf(2, 50, 15);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0194
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0194
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=126, screenW=184) returns 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0194 begin`);
      const actual: number = clampedOffsetOf(66, 126, 184);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(154);
      logInfo(`${BUNDLE}ClampedOffsetOf_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0195
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0195
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=126, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0195 begin`);
      const actual: number = clampedOffsetOf(2, 126, 1);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=126, ...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0196
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0196
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=-1, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0196 begin`);
      const actual: number = clampedOffsetOf(20, -1, 2);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0197
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0197
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=10, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0197 begin`);
      const actual: number = clampedOffsetOf(198, 10, 2);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=10,...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0198
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0198
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=2, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0198 begin`);
      const actual: number = clampedOffsetOf(2, 2, 5);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0199
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0199
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=50, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0199 begin`);
      const actual: number = clampedOffsetOf(15, 50, -1);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0200
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0200
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=-1, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0200 begin`);
      const actual: number = clampedOffsetOf(20, -1, 0);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0201
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0201
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=2, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0201 begin`);
      const actual: number = clampedOffsetOf(5, 2, 5);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0201 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0202
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0202
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=2, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0202 begin`);
      const actual: number = clampedOffsetOf(198, 2, 20);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0203
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0203
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=5, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0203 begin`);
      const actual: number = clampedOffsetOf(198, 5, 2);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=5, ...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0204
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0204
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=1, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0204 begin`);
      const actual: number = clampedOffsetOf(15, 1, 15);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0205
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0205
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=0, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0205 begin`);
      const actual: number = clampedOffsetOf(66, 0, 25);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0205 end`);
    });
  });
}
