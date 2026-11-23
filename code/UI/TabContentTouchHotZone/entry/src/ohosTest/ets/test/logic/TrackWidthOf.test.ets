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

/** Logic checks for trackWidthOf (96 cases). */
export default function trackWidthOfTest(): void {
  describe('TrackWidthOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0001
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0001
     * @tc.desc      trackWidthOf(screenW=0) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TrackWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0001 begin`);
      const actual: number = trackWidthOf(0);
      logInfo(`trackWidthOf(screenW=0): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}TrackWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0002
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0002
     * @tc.desc      trackWidthOf(screenW=1) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TrackWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0002 begin`);
      const actual: number = trackWidthOf(1);
      logInfo(`trackWidthOf(screenW=1): actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}TrackWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0003
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0003
     * @tc.desc      trackWidthOf(screenW=-1) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0003 begin`);
      const actual: number = trackWidthOf(-1);
      logInfo(`trackWidthOf(screenW=-1): actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}TrackWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0004
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0004
     * @tc.desc      trackWidthOf(screenW=2) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0004 begin`);
      const actual: number = trackWidthOf(2);
      logInfo(`trackWidthOf(screenW=2): actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}TrackWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0005
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0005
     * @tc.desc      trackWidthOf(screenW=3) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0005 begin`);
      const actual: number = trackWidthOf(3);
      logInfo(`trackWidthOf(screenW=3): actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}TrackWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0006
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0006
     * @tc.desc      trackWidthOf(screenW=10) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0006 begin`);
      const actual: number = trackWidthOf(10);
      logInfo(`trackWidthOf(screenW=10): actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}TrackWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0007
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0007
     * @tc.desc      trackWidthOf(screenW=100) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0007 begin`);
      const actual: number = trackWidthOf(100);
      logInfo(`trackWidthOf(screenW=100): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}TrackWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0008
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0008
     * @tc.desc      trackWidthOf(screenW=5) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0008 begin`);
      const actual: number = trackWidthOf(5);
      logInfo(`trackWidthOf(screenW=5): actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}TrackWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0009
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0009
     * @tc.desc      trackWidthOf(screenW=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0009 begin`);
      const actual: number = trackWidthOf(15);
      logInfo(`trackWidthOf(screenW=15): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}TrackWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0010
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0010
     * @tc.desc      trackWidthOf(screenW=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0010 begin`);
      const actual: number = trackWidthOf(20);
      logInfo(`trackWidthOf(screenW=20): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}TrackWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0011
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0011
     * @tc.desc      trackWidthOf(screenW=25) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0011 begin`);
      const actual: number = trackWidthOf(25);
      logInfo(`trackWidthOf(screenW=25): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}TrackWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0012
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0012
     * @tc.desc      trackWidthOf(screenW=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0012 begin`);
      const actual: number = trackWidthOf(30);
      logInfo(`trackWidthOf(screenW=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TrackWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0013
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0013
     * @tc.desc      trackWidthOf(screenW=35) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0013 begin`);
      const actual: number = trackWidthOf(35);
      logInfo(`trackWidthOf(screenW=35): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TrackWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0014
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0014
     * @tc.desc      trackWidthOf(screenW=40) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0014 begin`);
      const actual: number = trackWidthOf(40);
      logInfo(`trackWidthOf(screenW=40): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TrackWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0015
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0015
     * @tc.desc      trackWidthOf(screenW=45) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0015 begin`);
      const actual: number = trackWidthOf(45);
      logInfo(`trackWidthOf(screenW=45): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}TrackWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0016
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0016
     * @tc.desc      trackWidthOf(screenW=50) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0016 begin`);
      const actual: number = trackWidthOf(50);
      logInfo(`trackWidthOf(screenW=50): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}TrackWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0017
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0017
     * @tc.desc      trackWidthOf(screenW=55) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0017 begin`);
      const actual: number = trackWidthOf(55);
      logInfo(`trackWidthOf(screenW=55): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}TrackWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0018
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0018
     * @tc.desc      trackWidthOf(screenW=60) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0018 begin`);
      const actual: number = trackWidthOf(60);
      logInfo(`trackWidthOf(screenW=60): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TrackWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0019
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0019
     * @tc.desc      trackWidthOf(screenW=65) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0019 begin`);
      const actual: number = trackWidthOf(65);
      logInfo(`trackWidthOf(screenW=65): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}TrackWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0020
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0020
     * @tc.desc      trackWidthOf(screenW=70) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0020 begin`);
      const actual: number = trackWidthOf(70);
      logInfo(`trackWidthOf(screenW=70): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}TrackWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0021
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0021
     * @tc.desc      trackWidthOf(screenW=75) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0021 begin`);
      const actual: number = trackWidthOf(75);
      logInfo(`trackWidthOf(screenW=75): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TrackWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0022
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0022
     * @tc.desc      trackWidthOf(screenW=80) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0022 begin`);
      const actual: number = trackWidthOf(80);
      logInfo(`trackWidthOf(screenW=80): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}TrackWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0023
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0023
     * @tc.desc      trackWidthOf(screenW=85) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0023 begin`);
      const actual: number = trackWidthOf(85);
      logInfo(`trackWidthOf(screenW=85): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}TrackWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0024
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0024
     * @tc.desc      trackWidthOf(screenW=90) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0024 begin`);
      const actual: number = trackWidthOf(90);
      logInfo(`trackWidthOf(screenW=90): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}TrackWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0025
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0025
     * @tc.desc      trackWidthOf(screenW=95) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0025 begin`);
      const actual: number = trackWidthOf(95);
      logInfo(`trackWidthOf(screenW=95): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}TrackWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0026
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0026
     * @tc.desc      trackWidthOf(screenW=105) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0026 begin`);
      const actual: number = trackWidthOf(105);
      logInfo(`trackWidthOf(screenW=105): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}TrackWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0027
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0027
     * @tc.desc      trackWidthOf(screenW=110) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0027 begin`);
      const actual: number = trackWidthOf(110);
      logInfo(`trackWidthOf(screenW=110): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TrackWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0028
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0028
     * @tc.desc      trackWidthOf(screenW=115) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0028 begin`);
      const actual: number = trackWidthOf(115);
      logInfo(`trackWidthOf(screenW=115): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}TrackWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0029
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0029
     * @tc.desc      trackWidthOf(screenW=120) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0029 begin`);
      const actual: number = trackWidthOf(120);
      logInfo(`trackWidthOf(screenW=120): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}TrackWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0030
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0030
     * @tc.desc      trackWidthOf(screenW=125) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0030 begin`);
      const actual: number = trackWidthOf(125);
      logInfo(`trackWidthOf(screenW=125): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}TrackWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0031
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0031
     * @tc.desc      trackWidthOf(screenW=130) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0031 begin`);
      const actual: number = trackWidthOf(130);
      logInfo(`trackWidthOf(screenW=130): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}TrackWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0032
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0032
     * @tc.desc      trackWidthOf(screenW=135) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0032 begin`);
      const actual: number = trackWidthOf(135);
      logInfo(`trackWidthOf(screenW=135): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}TrackWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0033
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0033
     * @tc.desc      trackWidthOf(screenW=140) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0033 begin`);
      const actual: number = trackWidthOf(140);
      logInfo(`trackWidthOf(screenW=140): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}TrackWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0034
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0034
     * @tc.desc      trackWidthOf(screenW=145) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0034 begin`);
      const actual: number = trackWidthOf(145);
      logInfo(`trackWidthOf(screenW=145): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}TrackWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0035
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0035
     * @tc.desc      trackWidthOf(screenW=150) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0035 begin`);
      const actual: number = trackWidthOf(150);
      logInfo(`trackWidthOf(screenW=150): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}TrackWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0036
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0036
     * @tc.desc      trackWidthOf(screenW=155) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0036 begin`);
      const actual: number = trackWidthOf(155);
      logInfo(`trackWidthOf(screenW=155): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}TrackWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0037
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0037
     * @tc.desc      trackWidthOf(screenW=160) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0037 begin`);
      const actual: number = trackWidthOf(160);
      logInfo(`trackWidthOf(screenW=160): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}TrackWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0038
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0038
     * @tc.desc      trackWidthOf(screenW=165) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0038 begin`);
      const actual: number = trackWidthOf(165);
      logInfo(`trackWidthOf(screenW=165): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}TrackWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0039
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0039
     * @tc.desc      trackWidthOf(screenW=170) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0039 begin`);
      const actual: number = trackWidthOf(170);
      logInfo(`trackWidthOf(screenW=170): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}TrackWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0040
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0040
     * @tc.desc      trackWidthOf(screenW=175) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0040 begin`);
      const actual: number = trackWidthOf(175);
      logInfo(`trackWidthOf(screenW=175): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}TrackWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0041
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0041
     * @tc.desc      trackWidthOf(screenW=180) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0041 begin`);
      const actual: number = trackWidthOf(180);
      logInfo(`trackWidthOf(screenW=180): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}TrackWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0042
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0042
     * @tc.desc      trackWidthOf(screenW=185) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0042 begin`);
      const actual: number = trackWidthOf(185);
      logInfo(`trackWidthOf(screenW=185): actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}TrackWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0043
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0043
     * @tc.desc      trackWidthOf(screenW=190) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0043 begin`);
      const actual: number = trackWidthOf(190);
      logInfo(`trackWidthOf(screenW=190): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}TrackWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0044
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0044
     * @tc.desc      trackWidthOf(screenW=195) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0044 begin`);
      const actual: number = trackWidthOf(195);
      logInfo(`trackWidthOf(screenW=195): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}TrackWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0045
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0045
     * @tc.desc      trackWidthOf(screenW=200) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0045 begin`);
      const actual: number = trackWidthOf(200);
      logInfo(`trackWidthOf(screenW=200): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}TrackWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0046
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0046
     * @tc.desc      trackWidthOf(screenW=69) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0046 begin`);
      const actual: number = trackWidthOf(69);
      logInfo(`trackWidthOf(screenW=69): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TrackWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0047
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0047
     * @tc.desc      trackWidthOf(screenW=-63) returns -93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0047 begin`);
      const actual: number = trackWidthOf(-63);
      logInfo(`trackWidthOf(screenW=-63): actual=${actual}`);
      expect(actual).assertEqual(-93);
      logInfo(`${BUNDLE}TrackWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0048
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0048
     * @tc.desc      trackWidthOf(screenW=93) returns 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0048 begin`);
      const actual: number = trackWidthOf(93);
      logInfo(`trackWidthOf(screenW=93): actual=${actual}`);
      expect(actual).assertEqual(63);
      logInfo(`${BUNDLE}TrackWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0049
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0049
     * @tc.desc      trackWidthOf(screenW=27) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0049 begin`);
      const actual: number = trackWidthOf(27);
      logInfo(`trackWidthOf(screenW=27): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}TrackWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0050
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0050
     * @tc.desc      trackWidthOf(screenW=-21) returns -51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0050 begin`);
      const actual: number = trackWidthOf(-21);
      logInfo(`trackWidthOf(screenW=-21): actual=${actual}`);
      expect(actual).assertEqual(-51);
      logInfo(`${BUNDLE}TrackWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0051
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0051
     * @tc.desc      trackWidthOf(screenW=62) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0051 begin`);
      const actual: number = trackWidthOf(62);
      logInfo(`trackWidthOf(screenW=62): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}TrackWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0052
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0052
     * @tc.desc      trackWidthOf(screenW=60.58) returns 30.58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0052 begin`);
      const actual: number = trackWidthOf(60.58);
      logInfo(`trackWidthOf(screenW=60.58): actual=${actual}`);
      expect(actual).assertClose(30.58, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0053
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0053
     * @tc.desc      trackWidthOf(screenW=48) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0053 begin`);
      const actual: number = trackWidthOf(48);
      logInfo(`trackWidthOf(screenW=48): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}TrackWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0054
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0054
     * @tc.desc      trackWidthOf(screenW=43) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0054 begin`);
      const actual: number = trackWidthOf(43);
      logInfo(`trackWidthOf(screenW=43): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}TrackWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0055
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0055
     * @tc.desc      trackWidthOf(screenW=176) returns 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0055 begin`);
      const actual: number = trackWidthOf(176);
      logInfo(`trackWidthOf(screenW=176): actual=${actual}`);
      expect(actual).assertEqual(146);
      logInfo(`${BUNDLE}TrackWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0056
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0056
     * @tc.desc      trackWidthOf(screenW=-85) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0056 begin`);
      const actual: number = trackWidthOf(-85);
      logInfo(`trackWidthOf(screenW=-85): actual=${actual}`);
      expect(actual).assertEqual(-115);
      logInfo(`${BUNDLE}TrackWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0057
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0057
     * @tc.desc      trackWidthOf(screenW=101) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0057 begin`);
      const actual: number = trackWidthOf(101);
      logInfo(`trackWidthOf(screenW=101): actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}TrackWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0058
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0058
     * @tc.desc      trackWidthOf(screenW=-99) returns -129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0058 begin`);
      const actual: number = trackWidthOf(-99);
      logInfo(`trackWidthOf(screenW=-99): actual=${actual}`);
      expect(actual).assertEqual(-129);
      logInfo(`${BUNDLE}TrackWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0059
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0059
     * @tc.desc      trackWidthOf(screenW=67.23) returns 37.230000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0059 begin`);
      const actual: number = trackWidthOf(67.23);
      logInfo(`trackWidthOf(screenW=67.23): actual=${actual}`);
      expect(actual).assertClose(37.230000000000004, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0060
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0060
     * @tc.desc      trackWidthOf(screenW=90.65) returns 60.650000000000006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0060 begin`);
      const actual: number = trackWidthOf(90.65);
      logInfo(`trackWidthOf(screenW=90.65): actual=${actual}`);
      expect(actual).assertClose(60.650000000000006, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0061
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0061
     * @tc.desc      trackWidthOf(screenW=-60) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0061 begin`);
      const actual: number = trackWidthOf(-60);
      logInfo(`trackWidthOf(screenW=-60): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}TrackWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0062
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0062
     * @tc.desc      trackWidthOf(screenW=61.48) returns 31.479999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0062 begin`);
      const actual: number = trackWidthOf(61.48);
      logInfo(`trackWidthOf(screenW=61.48): actual=${actual}`);
      expect(actual).assertClose(31.479999999999997, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0063
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0063
     * @tc.desc      trackWidthOf(screenW=72.64) returns 42.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0063 begin`);
      const actual: number = trackWidthOf(72.64);
      logInfo(`trackWidthOf(screenW=72.64): actual=${actual}`);
      expect(actual).assertClose(42.64, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0064
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0064
     * @tc.desc      trackWidthOf(screenW=179) returns 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0064 begin`);
      const actual: number = trackWidthOf(179);
      logInfo(`trackWidthOf(screenW=179): actual=${actual}`);
      expect(actual).assertEqual(149);
      logInfo(`${BUNDLE}TrackWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0065
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0065
     * @tc.desc      trackWidthOf(screenW=126) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0065 begin`);
      const actual: number = trackWidthOf(126);
      logInfo(`trackWidthOf(screenW=126): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}TrackWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0066
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0066
     * @tc.desc      trackWidthOf(screenW=93.64) returns 63.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0066 begin`);
      const actual: number = trackWidthOf(93.64);
      logInfo(`trackWidthOf(screenW=93.64): actual=${actual}`);
      expect(actual).assertClose(63.64, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0067
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0067
     * @tc.desc      trackWidthOf(screenW=42.66) returns 12.659999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0067 begin`);
      const actual: number = trackWidthOf(42.66);
      logInfo(`trackWidthOf(screenW=42.66): actual=${actual}`);
      expect(actual).assertClose(12.659999999999997, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0068
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0068
     * @tc.desc      trackWidthOf(screenW=94) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0068 begin`);
      const actual: number = trackWidthOf(94);
      logInfo(`trackWidthOf(screenW=94): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TrackWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0069
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0069
     * @tc.desc      trackWidthOf(screenW=78.72) returns 48.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0069 begin`);
      const actual: number = trackWidthOf(78.72);
      logInfo(`trackWidthOf(screenW=78.72): actual=${actual}`);
      expect(actual).assertClose(48.72, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0070
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0070
     * @tc.desc      trackWidthOf(screenW=-68) returns -98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0070 begin`);
      const actual: number = trackWidthOf(-68);
      logInfo(`trackWidthOf(screenW=-68): actual=${actual}`);
      expect(actual).assertEqual(-98);
      logInfo(`${BUNDLE}TrackWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0071
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0071
     * @tc.desc      trackWidthOf(screenW=44) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0071 begin`);
      const actual: number = trackWidthOf(44);
      logInfo(`trackWidthOf(screenW=44): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TrackWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0072
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0072
     * @tc.desc      trackWidthOf(screenW=23.98) returns -6.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0072 begin`);
      const actual: number = trackWidthOf(23.98);
      logInfo(`trackWidthOf(screenW=23.98): actual=${actual}`);
      expect(actual).assertClose(-6.02, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0073
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0073
     * @tc.desc      trackWidthOf(screenW=14.35) returns -15.65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0073 begin`);
      const actual: number = trackWidthOf(14.35);
      logInfo(`trackWidthOf(screenW=14.35): actual=${actual}`);
      expect(actual).assertClose(-15.65, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0074
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0074
     * @tc.desc      trackWidthOf(screenW=141) returns 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0074 begin`);
      const actual: number = trackWidthOf(141);
      logInfo(`trackWidthOf(screenW=141): actual=${actual}`);
      expect(actual).assertEqual(111);
      logInfo(`${BUNDLE}TrackWidthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0075
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0075
     * @tc.desc      trackWidthOf(screenW=-40) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0075 begin`);
      const actual: number = trackWidthOf(-40);
      logInfo(`trackWidthOf(screenW=-40): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}TrackWidthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0076
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0076
     * @tc.desc      trackWidthOf(screenW=49.1) returns 19.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0076 begin`);
      const actual: number = trackWidthOf(49.1);
      logInfo(`trackWidthOf(screenW=49.1): actual=${actual}`);
      expect(actual).assertClose(19.1, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0077
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0077
     * @tc.desc      trackWidthOf(screenW=90.21) returns 60.209999999999994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0077 begin`);
      const actual: number = trackWidthOf(90.21);
      logInfo(`trackWidthOf(screenW=90.21): actual=${actual}`);
      expect(actual).assertClose(60.209999999999994, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0078
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0078
     * @tc.desc      trackWidthOf(screenW=26.52) returns -3.4800000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0078 begin`);
      const actual: number = trackWidthOf(26.52);
      logInfo(`trackWidthOf(screenW=26.52): actual=${actual}`);
      expect(actual).assertClose(-3.4800000000000004, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0079
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0079
     * @tc.desc      trackWidthOf(screenW=47) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0079 begin`);
      const actual: number = trackWidthOf(47);
      logInfo(`trackWidthOf(screenW=47): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}TrackWidthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0080
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0080
     * @tc.desc      trackWidthOf(screenW=38.12) returns 8.119999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0080 begin`);
      const actual: number = trackWidthOf(38.12);
      logInfo(`trackWidthOf(screenW=38.12): actual=${actual}`);
      expect(actual).assertClose(8.119999999999997, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0081
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0081
     * @tc.desc      trackWidthOf(screenW=-97) returns -127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0081 begin`);
      const actual: number = trackWidthOf(-97);
      logInfo(`trackWidthOf(screenW=-97): actual=${actual}`);
      expect(actual).assertEqual(-127);
      logInfo(`${BUNDLE}TrackWidthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0082
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0082
     * @tc.desc      trackWidthOf(screenW=-90) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0082 begin`);
      const actual: number = trackWidthOf(-90);
      logInfo(`trackWidthOf(screenW=-90): actual=${actual}`);
      expect(actual).assertEqual(-120);
      logInfo(`${BUNDLE}TrackWidthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0083
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0083
     * @tc.desc      trackWidthOf(screenW=-6) returns -36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0083 begin`);
      const actual: number = trackWidthOf(-6);
      logInfo(`trackWidthOf(screenW=-6): actual=${actual}`);
      expect(actual).assertEqual(-36);
      logInfo(`${BUNDLE}TrackWidthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0084
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0084
     * @tc.desc      trackWidthOf(screenW=26.54) returns -3.460000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0084 begin`);
      const actual: number = trackWidthOf(26.54);
      logInfo(`trackWidthOf(screenW=26.54): actual=${actual}`);
      expect(actual).assertClose(-3.460000000000001, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0085
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0085
     * @tc.desc      trackWidthOf(screenW=-9) returns -39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0085 begin`);
      const actual: number = trackWidthOf(-9);
      logInfo(`trackWidthOf(screenW=-9): actual=${actual}`);
      expect(actual).assertEqual(-39);
      logInfo(`${BUNDLE}TrackWidthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0086
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0086
     * @tc.desc      trackWidthOf(screenW=167) returns 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0086 begin`);
      const actual: number = trackWidthOf(167);
      logInfo(`trackWidthOf(screenW=167): actual=${actual}`);
      expect(actual).assertEqual(137);
      logInfo(`${BUNDLE}TrackWidthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0087
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0087
     * @tc.desc      trackWidthOf(screenW=106) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0087 begin`);
      const actual: number = trackWidthOf(106);
      logInfo(`trackWidthOf(screenW=106): actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}TrackWidthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0088
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0088
     * @tc.desc      trackWidthOf(screenW=14.27) returns -15.73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0088 begin`);
      const actual: number = trackWidthOf(14.27);
      logInfo(`trackWidthOf(screenW=14.27): actual=${actual}`);
      expect(actual).assertClose(-15.73, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0089
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0089
     * @tc.desc      trackWidthOf(screenW=19.76) returns -10.239999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0089 begin`);
      const actual: number = trackWidthOf(19.76);
      logInfo(`trackWidthOf(screenW=19.76): actual=${actual}`);
      expect(actual).assertClose(-10.239999999999998, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0090
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0090
     * @tc.desc      trackWidthOf(screenW=53) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0090 begin`);
      const actual: number = trackWidthOf(53);
      logInfo(`trackWidthOf(screenW=53): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TrackWidthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0091
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0091
     * @tc.desc      trackWidthOf(screenW=-18) returns -48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0091 begin`);
      const actual: number = trackWidthOf(-18);
      logInfo(`trackWidthOf(screenW=-18): actual=${actual}`);
      expect(actual).assertEqual(-48);
      logInfo(`${BUNDLE}TrackWidthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0092
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0092
     * @tc.desc      trackWidthOf(screenW=-8) returns -38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0092 begin`);
      const actual: number = trackWidthOf(-8);
      logInfo(`trackWidthOf(screenW=-8): actual=${actual}`);
      expect(actual).assertEqual(-38);
      logInfo(`${BUNDLE}TrackWidthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0093
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0093
     * @tc.desc      trackWidthOf(screenW=51.26) returns 21.259999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0093 begin`);
      const actual: number = trackWidthOf(51.26);
      logInfo(`trackWidthOf(screenW=51.26): actual=${actual}`);
      expect(actual).assertClose(21.259999999999998, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0094
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0094
     * @tc.desc      trackWidthOf(screenW=81.84) returns 51.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0094 begin`);
      const actual: number = trackWidthOf(81.84);
      logInfo(`trackWidthOf(screenW=81.84): actual=${actual}`);
      expect(actual).assertClose(51.84, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0095
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0095
     * @tc.desc      trackWidthOf(screenW=25.92) returns -4.079999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TrackWidthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0095 begin`);
      const actual: number = trackWidthOf(25.92);
      logInfo(`trackWidthOf(screenW=25.92): actual=${actual}`);
      expect(actual).assertClose(-4.079999999999998, PRECISION);
      logInfo(`${BUNDLE}TrackWidthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TRACK_WIDTH_OF_0096
     * @tc.name      TabContentTouchHotZone_TrackWidthOf_0096
     * @tc.desc      trackWidthOf(screenW=-43) returns -73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TrackWidthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TrackWidthOf_0096 begin`);
      const actual: number = trackWidthOf(-43);
      logInfo(`trackWidthOf(screenW=-43): actual=${actual}`);
      expect(actual).assertEqual(-73);
      logInfo(`${BUNDLE}TrackWidthOf_0096 end`);
    });
  });
}
