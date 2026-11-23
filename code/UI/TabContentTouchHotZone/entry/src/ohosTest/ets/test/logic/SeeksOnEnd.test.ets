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
import { seeksOnEnd } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for seeksOnEnd (50 cases). */
export default function seeksOnEndTest(): void {
  describe('SeeksOnEndTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0001
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0001
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0001 begin`);
      const actual: boolean = seeksOnEnd(0, -100);
      logInfo(`seeksOnEnd(positionX=0, offsetX=-100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0002
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0002
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0002 begin`);
      const actual: boolean = seeksOnEnd(0, 0);
      logInfo(`seeksOnEnd(positionX=0, offsetX=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeeksOnEnd_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0003
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0003
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0003 begin`);
      const actual: boolean = seeksOnEnd(0, -1);
      logInfo(`seeksOnEnd(positionX=0, offsetX=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0004
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0004
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0004 begin`);
      const actual: boolean = seeksOnEnd(0, 1);
      logInfo(`seeksOnEnd(positionX=0, offsetX=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0005
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0005
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0005 begin`);
      const actual: boolean = seeksOnEnd(0, 50);
      logInfo(`seeksOnEnd(positionX=0, offsetX=50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0006
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0006
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0006 begin`);
      const actual: boolean = seeksOnEnd(0, 100);
      logInfo(`seeksOnEnd(positionX=0, offsetX=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0007
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0007
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0007 begin`);
      const actual: boolean = seeksOnEnd(0, 2);
      logInfo(`seeksOnEnd(positionX=0, offsetX=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0008
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0008
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0008 begin`);
      const actual: boolean = seeksOnEnd(0, 3);
      logInfo(`seeksOnEnd(positionX=0, offsetX=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0009
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0009
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0009 begin`);
      const actual: boolean = seeksOnEnd(0, 10);
      logInfo(`seeksOnEnd(positionX=0, offsetX=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0010
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0010
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0010 begin`);
      const actual: boolean = seeksOnEnd(0, 5);
      logInfo(`seeksOnEnd(positionX=0, offsetX=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0011
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0011
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0011 begin`);
      const actual: boolean = seeksOnEnd(0, 15);
      logInfo(`seeksOnEnd(positionX=0, offsetX=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0012
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0012
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0012 begin`);
      const actual: boolean = seeksOnEnd(0, 20);
      logInfo(`seeksOnEnd(positionX=0, offsetX=20): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0013
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0013
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0013 begin`);
      const actual: boolean = seeksOnEnd(0, 25);
      logInfo(`seeksOnEnd(positionX=0, offsetX=25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0014
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0014
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0014 begin`);
      const actual: boolean = seeksOnEnd(0, 30);
      logInfo(`seeksOnEnd(positionX=0, offsetX=30): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0015
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0015
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0015 begin`);
      const actual: boolean = seeksOnEnd(0, 35);
      logInfo(`seeksOnEnd(positionX=0, offsetX=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0016
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0016
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0016 begin`);
      const actual: boolean = seeksOnEnd(0, 40);
      logInfo(`seeksOnEnd(positionX=0, offsetX=40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0017
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0017
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0017 begin`);
      const actual: boolean = seeksOnEnd(0, 45);
      logInfo(`seeksOnEnd(positionX=0, offsetX=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0018
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0018
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0018 begin`);
      const actual: boolean = seeksOnEnd(0, 55);
      logInfo(`seeksOnEnd(positionX=0, offsetX=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0019
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0019
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0019 begin`);
      const actual: boolean = seeksOnEnd(0, 60);
      logInfo(`seeksOnEnd(positionX=0, offsetX=60): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0020
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0020
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0020 begin`);
      const actual: boolean = seeksOnEnd(0, 65);
      logInfo(`seeksOnEnd(positionX=0, offsetX=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0021
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0021
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0021 begin`);
      const actual: boolean = seeksOnEnd(0, 70);
      logInfo(`seeksOnEnd(positionX=0, offsetX=70): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0022
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0022
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0022 begin`);
      const actual: boolean = seeksOnEnd(0, 75);
      logInfo(`seeksOnEnd(positionX=0, offsetX=75): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0023
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0023
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=80) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0023 begin`);
      const actual: boolean = seeksOnEnd(0, 80);
      logInfo(`seeksOnEnd(positionX=0, offsetX=80): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0024
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0024
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=85) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0024 begin`);
      const actual: boolean = seeksOnEnd(0, 85);
      logInfo(`seeksOnEnd(positionX=0, offsetX=85): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0025
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0025
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=90) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0025 begin`);
      const actual: boolean = seeksOnEnd(0, 90);
      logInfo(`seeksOnEnd(positionX=0, offsetX=90): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0026
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0026
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=95) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0026 begin`);
      const actual: boolean = seeksOnEnd(0, 95);
      logInfo(`seeksOnEnd(positionX=0, offsetX=95): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0027
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0027
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=105) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0027 begin`);
      const actual: boolean = seeksOnEnd(0, 105);
      logInfo(`seeksOnEnd(positionX=0, offsetX=105): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0028
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0028
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=23.58) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0028 begin`);
      const actual: boolean = seeksOnEnd(0, 23.58);
      logInfo(`seeksOnEnd(positionX=0, offsetX=23.58): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0029
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0029
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=-3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0029 begin`);
      const actual: boolean = seeksOnEnd(0, -3);
      logInfo(`seeksOnEnd(positionX=0, offsetX=-3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0030
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0030
     * @tc.desc      seeksOnEnd(positionX=0, offsetX=56.11) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0030 begin`);
      const actual: boolean = seeksOnEnd(0, 56.11);
      logInfo(`seeksOnEnd(positionX=0, offsetX=56.11): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0031
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0031
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0031 begin`);
      const actual: boolean = seeksOnEnd(1, -100);
      logInfo(`seeksOnEnd(positionX=1, offsetX=-100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0032
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0032
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0032 begin`);
      const actual: boolean = seeksOnEnd(1, -1);
      logInfo(`seeksOnEnd(positionX=1, offsetX=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0033
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0033
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0033 begin`);
      const actual: boolean = seeksOnEnd(1, 0);
      logInfo(`seeksOnEnd(positionX=1, offsetX=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0034
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0034
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0034 begin`);
      const actual: boolean = seeksOnEnd(1, 1);
      logInfo(`seeksOnEnd(positionX=1, offsetX=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SeeksOnEnd_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0035
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0035
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0035 begin`);
      const actual: boolean = seeksOnEnd(1, 50);
      logInfo(`seeksOnEnd(positionX=1, offsetX=50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0036
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0036
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0036 begin`);
      const actual: boolean = seeksOnEnd(1, 100);
      logInfo(`seeksOnEnd(positionX=1, offsetX=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0037
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0037
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0037 begin`);
      const actual: boolean = seeksOnEnd(1, 2);
      logInfo(`seeksOnEnd(positionX=1, offsetX=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0038
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0038
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0038 begin`);
      const actual: boolean = seeksOnEnd(1, 3);
      logInfo(`seeksOnEnd(positionX=1, offsetX=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0039
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0039
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0039 begin`);
      const actual: boolean = seeksOnEnd(1, 10);
      logInfo(`seeksOnEnd(positionX=1, offsetX=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0040
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0040
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0040 begin`);
      const actual: boolean = seeksOnEnd(1, 5);
      logInfo(`seeksOnEnd(positionX=1, offsetX=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0041
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0041
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0041 begin`);
      const actual: boolean = seeksOnEnd(1, 15);
      logInfo(`seeksOnEnd(positionX=1, offsetX=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0042
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0042
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0042 begin`);
      const actual: boolean = seeksOnEnd(1, 20);
      logInfo(`seeksOnEnd(positionX=1, offsetX=20): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0043
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0043
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0043 begin`);
      const actual: boolean = seeksOnEnd(1, 25);
      logInfo(`seeksOnEnd(positionX=1, offsetX=25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0044
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0044
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0044 begin`);
      const actual: boolean = seeksOnEnd(1, 30);
      logInfo(`seeksOnEnd(positionX=1, offsetX=30): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0045
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0045
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0045 begin`);
      const actual: boolean = seeksOnEnd(1, 35);
      logInfo(`seeksOnEnd(positionX=1, offsetX=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0046
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0046
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0046 begin`);
      const actual: boolean = seeksOnEnd(1, 40);
      logInfo(`seeksOnEnd(positionX=1, offsetX=40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0047
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0047
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0047 begin`);
      const actual: boolean = seeksOnEnd(1, 45);
      logInfo(`seeksOnEnd(positionX=1, offsetX=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0048
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0048
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0048 begin`);
      const actual: boolean = seeksOnEnd(1, 55);
      logInfo(`seeksOnEnd(positionX=1, offsetX=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0049
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0049
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0049 begin`);
      const actual: boolean = seeksOnEnd(1, 60);
      logInfo(`seeksOnEnd(positionX=1, offsetX=60): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SEEKS_ON_END_0050
     * @tc.name      TabContentTouchHotZone_SeeksOnEnd_0050
     * @tc.desc      seeksOnEnd(positionX=1, offsetX=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_SeeksOnEnd_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SeeksOnEnd_0050 begin`);
      const actual: boolean = seeksOnEnd(1, 65);
      logInfo(`seeksOnEnd(positionX=1, offsetX=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}SeeksOnEnd_0050 end`);
    });
  });
}
