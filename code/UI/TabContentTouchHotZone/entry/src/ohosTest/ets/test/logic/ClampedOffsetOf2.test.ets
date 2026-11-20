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

/** Logic checks for clampedOffsetOf (96 cases). */
export default function clampedOffsetOf2Test(): void {
  describe('ClampedOffsetOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0097
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0097
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=1, screenW=100) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0097 begin`);
      const actual: number = clampedOffsetOf(3, 1, 100);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ClampedOffsetOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0098
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0098
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=3, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0098 begin`);
      const actual: number = clampedOffsetOf(-1, 3, 3);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0099
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0099
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=126, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0099 begin`);
      const actual: number = clampedOffsetOf(20, 126, 2);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0100
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0100
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=-100, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0100 begin`);
      const actual: number = clampedOffsetOf(-1, -100, 10);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0101
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0101
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=2, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0101 begin`);
      const actual: number = clampedOffsetOf(3, 2, 20);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0102
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0102
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=-100, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0102 begin`);
      const actual: number = clampedOffsetOf(198, -100, 10);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=-10...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0103
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0103
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=1, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0103 begin`);
      const actual: number = clampedOffsetOf(5, 1, 15);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0104
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0104
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=1, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0104 begin`);
      const actual: number = clampedOffsetOf(20, 1, 25);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0105
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0105
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=1, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0105 begin`);
      const actual: number = clampedOffsetOf(3, 1, 1);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0106
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0106
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=5, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0106 begin`);
      const actual: number = clampedOffsetOf(5, 5, 3);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0107
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0107
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=-1, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0107 begin`);
      const actual: number = clampedOffsetOf(1, -1, 3);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=-1, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0108
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0108
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=0, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0108 begin`);
      const actual: number = clampedOffsetOf(66, 0, 3);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0109
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0109
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=50, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0109 begin`);
      const actual: number = clampedOffsetOf(10, 50, 1);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0110
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0110
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0110 begin`);
      const actual: number = clampedOffsetOf(2, 100, 0);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=100, ...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0111
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0111
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=50, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0111 begin`);
      const actual: number = clampedOffsetOf(3, 50, 0);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0112
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0112
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=-1, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0112 begin`);
      const actual: number = clampedOffsetOf(-1, -1, -1);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0113
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0113
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=-1, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0113 begin`);
      const actual: number = clampedOffsetOf(20, -1, -1);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0114
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0114
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=5, screenW=184) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0114 begin`);
      const actual: number = clampedOffsetOf(10, 5, 184);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=5, s...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0115
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0115
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=3, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0115 begin`);
      const actual: number = clampedOffsetOf(15, 3, 2);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0116
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0116
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=0, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0116 begin`);
      const actual: number = clampedOffsetOf(1, 0, 20);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=0, sc...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0117
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0117
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=2, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0117 begin`);
      const actual: number = clampedOffsetOf(66, 2, 2);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=2, s...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0118
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0118
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=1, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0118 begin`);
      const actual: number = clampedOffsetOf(10, 1, 1);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0119
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0119
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=0, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0119 begin`);
      const actual: number = clampedOffsetOf(20, 0, 15);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0120
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0120
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=1, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0120 begin`);
      const actual: number = clampedOffsetOf(5, 1, -1);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0121
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0121
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=50, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0121 begin`);
      const actual: number = clampedOffsetOf(5, 50, 5);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0122
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0122
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=50, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0122 begin`);
      const actual: number = clampedOffsetOf(20, 50, 0);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0123
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0123
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=5, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0123 begin`);
      const actual: number = clampedOffsetOf(-1, 5, 3);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=5, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0124
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0124
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=0, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0124 begin`);
      const actual: number = clampedOffsetOf(-1, 0, 10);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0125
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0125
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=15, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0125 begin`);
      const actual: number = clampedOffsetOf(20, 15, 20);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=15, ...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0126
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0126
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=1, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0126 begin`);
      const actual: number = clampedOffsetOf(15, 1, 1);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0127
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0127
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=3, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0127 begin`);
      const actual: number = clampedOffsetOf(-1, 3, 15);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0128
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0128
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=50, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0128 begin`);
      const actual: number = clampedOffsetOf(15, 50, 5);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0129
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0129
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=2, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0129 begin`);
      const actual: number = clampedOffsetOf(-1, 2, 2);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=2, s...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0130
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0130
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=10, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0130 begin`);
      const actual: number = clampedOffsetOf(10, 10, 20);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0131
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0131
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=-1, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0131 begin`);
      const actual: number = clampedOffsetOf(10, -1, 3);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0132
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0132
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=15, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0132 begin`);
      const actual: number = clampedOffsetOf(1, 15, 1);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=15, s...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0133
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0133
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=-1, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0133 begin`);
      const actual: number = clampedOffsetOf(15, -1, 3);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0134
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0134
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=126, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0134 begin`);
      const actual: number = clampedOffsetOf(20, 126, 15);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0135
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0135
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=-100, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0135 begin`);
      const actual: number = clampedOffsetOf(66, -100, 20);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0136
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0136
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=10, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0136 begin`);
      const actual: number = clampedOffsetOf(-1, 10, 25);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0137
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0137
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=1, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0137 begin`);
      const actual: number = clampedOffsetOf(1, 1, 15);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0138
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0138
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=126, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0138 begin`);
      const actual: number = clampedOffsetOf(5, 126, 15);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=126, ...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0139
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0139
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=5, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0139 begin`);
      const actual: number = clampedOffsetOf(3, 5, 25);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0140
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0140
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=5, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0140 begin`);
      const actual: number = clampedOffsetOf(0, 5, 1);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0141
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0141
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=100, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0141 begin`);
      const actual: number = clampedOffsetOf(10, 100, 25);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=100,...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0142
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0142
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=0, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0142 begin`);
      const actual: number = clampedOffsetOf(10, 0, 3);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0143
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0143
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=1, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0143 begin`);
      const actual: number = clampedOffsetOf(3, 1, 25);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0144
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0144
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=1, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0144 begin`);
      const actual: number = clampedOffsetOf(10, 1, 0);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0145
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0145
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=0, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0145 begin`);
      const actual: number = clampedOffsetOf(66, 0, 0);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0145 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0146
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0146
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=15, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0146 begin`);
      const actual: number = clampedOffsetOf(3, 15, 3);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=15, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0147
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0147
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=50, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0147 begin`);
      const actual: number = clampedOffsetOf(10, 50, 15);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0148
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0148
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=0, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0148 begin`);
      const actual: number = clampedOffsetOf(20, 0, 20);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0149
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0149
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=-1, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0149 begin`);
      const actual: number = clampedOffsetOf(20, -1, 3);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0150
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0150
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=3, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0150 begin`);
      const actual: number = clampedOffsetOf(5, 3, 1);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0151
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0151
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=15, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0151 begin`);
      const actual: number = clampedOffsetOf(0, 15, 1);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=15, s...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0151 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0152
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0152
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=-1, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0152 begin`);
      const actual: number = clampedOffsetOf(15, -1, 2);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0153
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0153
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=10, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0153 begin`);
      const actual: number = clampedOffsetOf(15, 10, -1);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0154
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0154
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=1, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0154 begin`);
      const actual: number = clampedOffsetOf(66, 1, -1);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0155
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0155
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=50, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0155 begin`);
      const actual: number = clampedOffsetOf(5, 50, 2);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0156
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0156
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=-100, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0156 begin`);
      const actual: number = clampedOffsetOf(1, -100, 25);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0157
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0157
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=1, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0157 begin`);
      const actual: number = clampedOffsetOf(-1, 1, 15);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0158
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0158
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=2, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0158 begin`);
      const actual: number = clampedOffsetOf(5, 2, 1);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0159
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0159
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=5, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0159 begin`);
      const actual: number = clampedOffsetOf(5, 5, 0);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0160
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0160
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=2, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0160 begin`);
      const actual: number = clampedOffsetOf(10, 2, 3);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=2, s...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0161
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0161
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=126, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0161 begin`);
      const actual: number = clampedOffsetOf(100, 126, 15);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=126...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0162
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0162
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=2, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0162 begin`);
      const actual: number = clampedOffsetOf(3, 2, 0);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0163
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0163
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=-100, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0163 begin`);
      const actual: number = clampedOffsetOf(66, -100, 15);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0164
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0164
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=-100, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0164 begin`);
      const actual: number = clampedOffsetOf(5, -100, 3);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0165
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0165
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=1, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0165 begin`);
      const actual: number = clampedOffsetOf(3, 1, 0);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0166
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0166
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=126, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0166 begin`);
      const actual: number = clampedOffsetOf(15, 126, 20);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0167
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0167
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=3, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0167 begin`);
      const actual: number = clampedOffsetOf(2, 3, 10);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0168
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0168
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=10, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0168 begin`);
      const actual: number = clampedOffsetOf(2, 10, 1);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=10, s...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0169
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0169
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=-100, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0169 begin`);
      const actual: number = clampedOffsetOf(15, -100, 3);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0170
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0170
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=15, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0170 begin`);
      const actual: number = clampedOffsetOf(15, 15, 5);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=15, ...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0171
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0171
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=5, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0171 begin`);
      const actual: number = clampedOffsetOf(100, 5, 10);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=5, ...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0172
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0172
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=126, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0172 begin`);
      const actual: number = clampedOffsetOf(20, 126, 20);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0173
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0173
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=50, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0173 begin`);
      const actual: number = clampedOffsetOf(5, 50, 15);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0174
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0174
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=15, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0174 begin`);
      const actual: number = clampedOffsetOf(66, 15, -1);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=15, ...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0175
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0175
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=126, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0175 begin`);
      const actual: number = clampedOffsetOf(198, 126, 1);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=126...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0176
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0176
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=2, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0176 begin`);
      const actual: number = clampedOffsetOf(20, 2, 15);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=2, s...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0177
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0177
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=126, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0177 begin`);
      const actual: number = clampedOffsetOf(66, 126, 0);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0178
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0178
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=50, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0178 begin`);
      const actual: number = clampedOffsetOf(100, 50, 2);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=50,...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0179
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0179
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=3, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0179 begin`);
      const actual: number = clampedOffsetOf(3, 3, 2);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0180
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0180
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=100, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0180 begin`);
      const actual: number = clampedOffsetOf(2, 100, 3);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=100, ...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0181
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0181
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=0, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0181 begin`);
      const actual: number = clampedOffsetOf(2, 0, 5);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=0, sc...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0182
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0182
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=5, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0182 begin`);
      const actual: number = clampedOffsetOf(2, 5, 1);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0183
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0183
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=-100, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0183 begin`);
      const actual: number = clampedOffsetOf(3, -100, 3);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0184
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0184
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=0, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0184 begin`);
      const actual: number = clampedOffsetOf(3, 0, 15);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=0, sc...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0185
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0185
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=50, screenW=184) returns 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0185 begin`);
      const actual: number = clampedOffsetOf(198, 50, 184);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=50,...: actual=${actual}`);
      expect(actual).assertEqual(154);
      logInfo(`${BUNDLE}ClampedOffsetOf_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0186
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0186
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=2, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0186 begin`);
      const actual: number = clampedOffsetOf(198, 2, 3);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0187
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0187
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=3, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0187 begin`);
      const actual: number = clampedOffsetOf(2, 3, -1);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0188
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0188
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=10, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0188 begin`);
      const actual: number = clampedOffsetOf(15, 10, 3);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0189
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0189
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=-100, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0189 begin`);
      const actual: number = clampedOffsetOf(198, -100, 1);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=-10...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0190
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0190
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=-100, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0190 begin`);
      const actual: number = clampedOffsetOf(5, -100, 2);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0191
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0191
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=50, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0191 begin`);
      const actual: number = clampedOffsetOf(100, 50, 0);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=50,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0191 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0192
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0192
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=126, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0192 begin`);
      const actual: number = clampedOffsetOf(20, 126, 5);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0192 end`);
    });
  });
}
