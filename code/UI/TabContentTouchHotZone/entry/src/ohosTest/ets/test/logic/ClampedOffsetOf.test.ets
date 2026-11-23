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
export default function clampedOffsetOfTest(): void {
  describe('ClampedOffsetOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0001
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0001
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0001 begin`);
      const actual: number = clampedOffsetOf(0, -100, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0002
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0002
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0002 begin`);
      const actual: number = clampedOffsetOf(0, -100, 1);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}ClampedOffsetOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0003
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0003
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0003 begin`);
      const actual: number = clampedOffsetOf(0, -100, -1);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0004
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0004
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0004 begin`);
      const actual: number = clampedOffsetOf(0, -100, 2);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0005
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0005
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0005 begin`);
      const actual: number = clampedOffsetOf(0, -100, 3);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0006
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0006
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0006 begin`);
      const actual: number = clampedOffsetOf(0, -100, 10);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0007
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0007
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0007 begin`);
      const actual: number = clampedOffsetOf(0, -100, 100);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedOffsetOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0008
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0008
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0008 begin`);
      const actual: number = clampedOffsetOf(0, -100, 5);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0009
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0009
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0009 begin`);
      const actual: number = clampedOffsetOf(0, -100, 15);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0010
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0010
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0010 begin`);
      const actual: number = clampedOffsetOf(0, -100, 20);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0011
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0011
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0011 begin`);
      const actual: number = clampedOffsetOf(0, -100, 25);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0012
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0012
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=0, screenW=100) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0012 begin`);
      const actual: number = clampedOffsetOf(15, 0, 100);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}ClampedOffsetOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0013
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0013
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=-1, screenW=100) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0013 begin`);
      const actual: number = clampedOffsetOf(5, -1, 100);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=-1, s...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ClampedOffsetOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0014
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0014
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=3, screenW=184) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0014 begin`);
      const actual: number = clampedOffsetOf(0, 3, 184);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ClampedOffsetOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0015
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0015
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=3, screenW=100) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0015 begin`);
      const actual: number = clampedOffsetOf(20, 3, 100);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}ClampedOffsetOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0016
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0016
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=0, screenW=184) returns 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0016 begin`);
      const actual: number = clampedOffsetOf(198, 0, 184);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=0, ...: actual=${actual}`);
      expect(actual).assertEqual(154);
      logInfo(`${BUNDLE}ClampedOffsetOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0017
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0017
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=10, screenW=184) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0017 begin`);
      const actual: number = clampedOffsetOf(2, 10, 184);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=10, s...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}ClampedOffsetOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0018
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0018
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=5, screenW=184) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0018 begin`);
      const actual: number = clampedOffsetOf(2, 5, 184);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}ClampedOffsetOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0019
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0019
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=100, screenW=184) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0019 begin`);
      const actual: number = clampedOffsetOf(10, 100, 184);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=100,...: actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}ClampedOffsetOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0020
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0020
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=126, screenW=100) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0020 begin`);
      const actual: number = clampedOffsetOf(10, 126, 100);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}ClampedOffsetOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0021
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0021
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=3, screenW=184) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0021 begin`);
      const actual: number = clampedOffsetOf(-1, 3, 184);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ClampedOffsetOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0022
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0022
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=10, screenW=184) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0022 begin`);
      const actual: number = clampedOffsetOf(15, 10, 184);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ClampedOffsetOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0023
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0023
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=50, screenW=184) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0023 begin`);
      const actual: number = clampedOffsetOf(0, 50, 184);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}ClampedOffsetOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0024
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0024
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=10, screenW=100) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0024 begin`);
      const actual: number = clampedOffsetOf(0, 10, 100);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=10, s...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0025
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0025
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=15, screenW=184) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0025 begin`);
      const actual: number = clampedOffsetOf(2, 15, 184);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=15, s...: actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}ClampedOffsetOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0026
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0026
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=2, screenW=184) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0026 begin`);
      const actual: number = clampedOffsetOf(3, 2, 184);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ClampedOffsetOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0027
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0027
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=-1, screenW=184) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0027 begin`);
      const actual: number = clampedOffsetOf(2, -1, 184);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=-1, s...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampedOffsetOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0028
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0028
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=50, screenW=184) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0028 begin`);
      const actual: number = clampedOffsetOf(2, 50, 184);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}ClampedOffsetOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0029
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0029
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=126, screenW=184) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0029 begin`);
      const actual: number = clampedOffsetOf(-1, 126, 184);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}ClampedOffsetOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0030
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0030
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=3, screenW=184) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0030 begin`);
      const actual: number = clampedOffsetOf(3, 3, 184);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ClampedOffsetOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0031
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0031
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=1, screenW=100) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0031 begin`);
      const actual: number = clampedOffsetOf(15, 1, 100);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ClampedOffsetOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0032
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0032
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=100, screenW=184) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0032 begin`);
      const actual: number = clampedOffsetOf(-1, 100, 184);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=100,...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ClampedOffsetOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0033
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0033
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=1, screenW=184) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0033 begin`);
      const actual: number = clampedOffsetOf(100, 1, 184);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=1, ...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ClampedOffsetOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0034
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0034
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=50, screenW=184) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0034 begin`);
      const actual: number = clampedOffsetOf(10, 50, 184);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}ClampedOffsetOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0035
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0035
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=5, screenW=184) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0035 begin`);
      const actual: number = clampedOffsetOf(100, 5, 184);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=5, ...: actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}ClampedOffsetOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0036
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0036
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=15, screenW=184) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0036 begin`);
      const actual: number = clampedOffsetOf(66, 15, 184);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=15, ...: actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}ClampedOffsetOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0037
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0037
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=126, screenW=184) returns 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0037 begin`);
      const actual: number = clampedOffsetOf(15, 126, 184);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(141);
      logInfo(`${BUNDLE}ClampedOffsetOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0038
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0038
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=50, screenW=184) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0038 begin`);
      const actual: number = clampedOffsetOf(-1, 50, 184);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}ClampedOffsetOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0039
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0039
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=1, screenW=184) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0039 begin`);
      const actual: number = clampedOffsetOf(66, 1, 184);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}ClampedOffsetOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0040
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0040
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=0, screenW=100) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0040 begin`);
      const actual: number = clampedOffsetOf(66, 0, 100);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}ClampedOffsetOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0041
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0041
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=10, screenW=184) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0041 begin`);
      const actual: number = clampedOffsetOf(66, 10, 184);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}ClampedOffsetOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0042
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0042
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=100, screenW=184) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0042 begin`);
      const actual: number = clampedOffsetOf(2, 100, 184);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=100, ...: actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}ClampedOffsetOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0043
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0043
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=10, screenW=100) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0043 begin`);
      const actual: number = clampedOffsetOf(-1, 10, 100);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}ClampedOffsetOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0044
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0044
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=3, screenW=100) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0044 begin`);
      const actual: number = clampedOffsetOf(66, 3, 100);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}ClampedOffsetOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0045
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0045
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=0, screenW=100) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0045 begin`);
      const actual: number = clampedOffsetOf(20, 0, 100);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=0, s...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ClampedOffsetOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0046
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0046
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=-1, screenW=100) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0046 begin`);
      const actual: number = clampedOffsetOf(15, -1, 100);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}ClampedOffsetOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0047
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0047
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=1, screenW=100) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0047 begin`);
      const actual: number = clampedOffsetOf(10, 1, 100);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}ClampedOffsetOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0048
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0048
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=50, screenW=184) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0048 begin`);
      const actual: number = clampedOffsetOf(5, 50, 184);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}ClampedOffsetOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0049
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0049
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=5, screenW=184) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0049 begin`);
      const actual: number = clampedOffsetOf(3, 5, 184);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}ClampedOffsetOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0050
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0050
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=100, screenW=184) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0050 begin`);
      const actual: number = clampedOffsetOf(15, 100, 184);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=100,...: actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}ClampedOffsetOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0051
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0051
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=2, screenW=184) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0051 begin`);
      const actual: number = clampedOffsetOf(20, 2, 184);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=2, s...: actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}ClampedOffsetOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0052
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0052
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=-1, screenW=100) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0052 begin`);
      const actual: number = clampedOffsetOf(20, -1, 100);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}ClampedOffsetOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0053
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0053
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=10, screenW=184) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0053 begin`);
      const actual: number = clampedOffsetOf(20, 10, 184);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=10, ...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0054
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0054
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=126, screenW=184) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0054 begin`);
      const actual: number = clampedOffsetOf(0, 126, 184);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=126, ...: actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}ClampedOffsetOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0055
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0055
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=-100, screenW=184) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0055 begin`);
      const actual: number = clampedOffsetOf(198, -100, 184);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=-10...: actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}ClampedOffsetOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0056
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0056
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=1, screenW=100) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0056 begin`);
      const actual: number = clampedOffsetOf(20, 1, 100);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}ClampedOffsetOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0057
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0057
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=126, screenW=184) returns 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0057 begin`);
      const actual: number = clampedOffsetOf(3, 126, 184);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=126, ...: actual=${actual}`);
      expect(actual).assertEqual(129);
      logInfo(`${BUNDLE}ClampedOffsetOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0058
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0058
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=0, screenW=184) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0058 begin`);
      const actual: number = clampedOffsetOf(100, 0, 184);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=0, ...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedOffsetOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0059
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0059
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=50, screenW=184) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0059 begin`);
      const actual: number = clampedOffsetOf(3, 50, 184);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}ClampedOffsetOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0060
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0060
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=50, screenW=100) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0060 begin`);
      const actual: number = clampedOffsetOf(15, 50, 100);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=50, ...: actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}ClampedOffsetOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0061
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0061
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=126, screenW=184) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0061 begin`);
      const actual: number = clampedOffsetOf(10, 126, 184);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=126,...: actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}ClampedOffsetOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0062
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0062
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=50, screenW=184) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0062 begin`);
      const actual: number = clampedOffsetOf(100, 50, 184);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=50,...: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}ClampedOffsetOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0063
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0063
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=3, screenW=184) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0063 begin`);
      const actual: number = clampedOffsetOf(10, 3, 184);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=3, s...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}ClampedOffsetOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0064
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0064
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=15, screenW=100) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0064 begin`);
      const actual: number = clampedOffsetOf(3, 15, 100);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=15, s...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}ClampedOffsetOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0065
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0065
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0065 begin`);
      const actual: number = clampedOffsetOf(1, -100, 0);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0066
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0066
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0066 begin`);
      const actual: number = clampedOffsetOf(2, -100, 0);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0067
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0067
     * @tc.desc      clampedOffsetOf(positionX=-1, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0067 begin`);
      const actual: number = clampedOffsetOf(-1, -100, 0);
      logInfo(`clampedOffsetOf(positionX=-1, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0068
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0068
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0068 begin`);
      const actual: number = clampedOffsetOf(5, -100, 0);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0069
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0069
     * @tc.desc      clampedOffsetOf(positionX=10, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0069 begin`);
      const actual: number = clampedOffsetOf(10, -100, 0);
      logInfo(`clampedOffsetOf(positionX=10, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0070
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0070
     * @tc.desc      clampedOffsetOf(positionX=3, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0070 begin`);
      const actual: number = clampedOffsetOf(3, -100, 0);
      logInfo(`clampedOffsetOf(positionX=3, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0071
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0071
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0071 begin`);
      const actual: number = clampedOffsetOf(100, -100, 0);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=-10...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0072
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0072
     * @tc.desc      clampedOffsetOf(positionX=15, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0072 begin`);
      const actual: number = clampedOffsetOf(15, -100, 0);
      logInfo(`clampedOffsetOf(positionX=15, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0073
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0073
     * @tc.desc      clampedOffsetOf(positionX=20, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0073 begin`);
      const actual: number = clampedOffsetOf(20, -100, 0);
      logInfo(`clampedOffsetOf(positionX=20, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0074
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0074
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0074 begin`);
      const actual: number = clampedOffsetOf(198, -100, 0);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=-10...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0075
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0075
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=-100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0075 begin`);
      const actual: number = clampedOffsetOf(66, -100, 0);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=-100...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0076
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0076
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-1, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0076 begin`);
      const actual: number = clampedOffsetOf(0, -1, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-1, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0077
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0077
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=0, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0077 begin`);
      const actual: number = clampedOffsetOf(0, 0, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=0, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0078
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0078
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=1, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0078 begin`);
      const actual: number = clampedOffsetOf(0, 1, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=1, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0079
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0079
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=50, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0079 begin`);
      const actual: number = clampedOffsetOf(0, 50, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=50, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0080
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0080
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=100, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0080 begin`);
      const actual: number = clampedOffsetOf(0, 100, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=100, ...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0081
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0081
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=2, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0081 begin`);
      const actual: number = clampedOffsetOf(0, 2, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0082
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0082
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=3, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0082 begin`);
      const actual: number = clampedOffsetOf(0, 3, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0083
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0083
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=10, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0083 begin`);
      const actual: number = clampedOffsetOf(0, 10, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=10, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0084
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0084
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=5, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0084 begin`);
      const actual: number = clampedOffsetOf(0, 5, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=5, sc...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0085
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0085
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=15, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0085 begin`);
      const actual: number = clampedOffsetOf(0, 15, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=15, s...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0086
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0086
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=126, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0086 begin`);
      const actual: number = clampedOffsetOf(0, 126, 0);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=126, ...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0087
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0087
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=-100, screenW=184) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0087 begin`);
      const actual: number = clampedOffsetOf(0, -100, 184);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=-100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedOffsetOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0088
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0088
     * @tc.desc      clampedOffsetOf(positionX=1, deltaX=2, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0088 begin`);
      const actual: number = clampedOffsetOf(1, 2, 3);
      logInfo(`clampedOffsetOf(positionX=1, deltaX=2, sc...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0089
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0089
     * @tc.desc      clampedOffsetOf(positionX=5, deltaX=3, screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0089 begin`);
      const actual: number = clampedOffsetOf(5, 3, 3);
      logInfo(`clampedOffsetOf(positionX=5, deltaX=3, sc...: actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}ClampedOffsetOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0090
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0090
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=2, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0090 begin`);
      const actual: number = clampedOffsetOf(100, 2, 0);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0091
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0091
     * @tc.desc      clampedOffsetOf(positionX=66, deltaX=1, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0091 begin`);
      const actual: number = clampedOffsetOf(66, 1, 20);
      logInfo(`clampedOffsetOf(positionX=66, deltaX=1, s...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0092
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0092
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=15, screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0092 begin`);
      const actual: number = clampedOffsetOf(100, 15, 0);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=15,...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}ClampedOffsetOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0093
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0093
     * @tc.desc      clampedOffsetOf(positionX=2, deltaX=100, screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0093 begin`);
      const actual: number = clampedOffsetOf(2, 100, 20);
      logInfo(`clampedOffsetOf(positionX=2, deltaX=100, ...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ClampedOffsetOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0094
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0094
     * @tc.desc      clampedOffsetOf(positionX=0, deltaX=0, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0094 begin`);
      const actual: number = clampedOffsetOf(0, 0, 2);
      logInfo(`clampedOffsetOf(positionX=0, deltaX=0, sc...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0095
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0095
     * @tc.desc      clampedOffsetOf(positionX=198, deltaX=2, screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0095 begin`);
      const actual: number = clampedOffsetOf(198, 2, 2);
      logInfo(`clampedOffsetOf(positionX=198, deltaX=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}ClampedOffsetOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_CLAMPED_OFFSET_OF_0096
     * @tc.name      TabContentTouchHotZone_ClampedOffsetOf_0096
     * @tc.desc      clampedOffsetOf(positionX=100, deltaX=10, screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ClampedOffsetOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ClampedOffsetOf_0096 begin`);
      const actual: number = clampedOffsetOf(100, 10, -1);
      logInfo(`clampedOffsetOf(positionX=100, deltaX=10,...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}ClampedOffsetOf_0096 end`);
    });
  });
}
