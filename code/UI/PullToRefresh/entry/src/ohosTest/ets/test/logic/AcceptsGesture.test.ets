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
import { acceptsGesture } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for acceptsGesture (50 cases). */
export default function acceptsGestureTest(): void {
  describe('AcceptsGestureTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0001
     * @tc.name      PullToRefresh_AcceptsGesture_0001
     * @tc.desc      acceptsGesture(state=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_AcceptsGesture_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0001 begin`);
      const actual: boolean = acceptsGesture(0);
      logInfo(`acceptsGesture(state=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AcceptsGesture_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0002
     * @tc.name      PullToRefresh_AcceptsGesture_0002
     * @tc.desc      acceptsGesture(state=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_AcceptsGesture_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0002 begin`);
      const actual: boolean = acceptsGesture(1);
      logInfo(`acceptsGesture(state=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0003
     * @tc.name      PullToRefresh_AcceptsGesture_0003
     * @tc.desc      acceptsGesture(state=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_AcceptsGesture_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0003 begin`);
      const actual: boolean = acceptsGesture(-1);
      logInfo(`acceptsGesture(state=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0004
     * @tc.name      PullToRefresh_AcceptsGesture_0004
     * @tc.desc      acceptsGesture(state=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0004 begin`);
      const actual: boolean = acceptsGesture(2);
      logInfo(`acceptsGesture(state=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0005
     * @tc.name      PullToRefresh_AcceptsGesture_0005
     * @tc.desc      acceptsGesture(state=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0005 begin`);
      const actual: boolean = acceptsGesture(3);
      logInfo(`acceptsGesture(state=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0006
     * @tc.name      PullToRefresh_AcceptsGesture_0006
     * @tc.desc      acceptsGesture(state=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0006 begin`);
      const actual: boolean = acceptsGesture(10);
      logInfo(`acceptsGesture(state=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0007
     * @tc.name      PullToRefresh_AcceptsGesture_0007
     * @tc.desc      acceptsGesture(state=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0007 begin`);
      const actual: boolean = acceptsGesture(100);
      logInfo(`acceptsGesture(state=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0008
     * @tc.name      PullToRefresh_AcceptsGesture_0008
     * @tc.desc      acceptsGesture(state=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0008 begin`);
      const actual: boolean = acceptsGesture(5);
      logInfo(`acceptsGesture(state=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0009
     * @tc.name      PullToRefresh_AcceptsGesture_0009
     * @tc.desc      acceptsGesture(state=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0009 begin`);
      const actual: boolean = acceptsGesture(15);
      logInfo(`acceptsGesture(state=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0010
     * @tc.name      PullToRefresh_AcceptsGesture_0010
     * @tc.desc      acceptsGesture(state=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0010 begin`);
      const actual: boolean = acceptsGesture(20);
      logInfo(`acceptsGesture(state=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0011
     * @tc.name      PullToRefresh_AcceptsGesture_0011
     * @tc.desc      acceptsGesture(state=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0011 begin`);
      const actual: boolean = acceptsGesture(25);
      logInfo(`acceptsGesture(state=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0012
     * @tc.name      PullToRefresh_AcceptsGesture_0012
     * @tc.desc      acceptsGesture(state=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0012 begin`);
      const actual: boolean = acceptsGesture(30);
      logInfo(`acceptsGesture(state=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0013
     * @tc.name      PullToRefresh_AcceptsGesture_0013
     * @tc.desc      acceptsGesture(state=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0013 begin`);
      const actual: boolean = acceptsGesture(35);
      logInfo(`acceptsGesture(state=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0014
     * @tc.name      PullToRefresh_AcceptsGesture_0014
     * @tc.desc      acceptsGesture(state=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0014 begin`);
      const actual: boolean = acceptsGesture(40);
      logInfo(`acceptsGesture(state=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0015
     * @tc.name      PullToRefresh_AcceptsGesture_0015
     * @tc.desc      acceptsGesture(state=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0015 begin`);
      const actual: boolean = acceptsGesture(45);
      logInfo(`acceptsGesture(state=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0016
     * @tc.name      PullToRefresh_AcceptsGesture_0016
     * @tc.desc      acceptsGesture(state=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0016 begin`);
      const actual: boolean = acceptsGesture(50);
      logInfo(`acceptsGesture(state=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0017
     * @tc.name      PullToRefresh_AcceptsGesture_0017
     * @tc.desc      acceptsGesture(state=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0017 begin`);
      const actual: boolean = acceptsGesture(55);
      logInfo(`acceptsGesture(state=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0018
     * @tc.name      PullToRefresh_AcceptsGesture_0018
     * @tc.desc      acceptsGesture(state=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0018 begin`);
      const actual: boolean = acceptsGesture(60);
      logInfo(`acceptsGesture(state=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0019
     * @tc.name      PullToRefresh_AcceptsGesture_0019
     * @tc.desc      acceptsGesture(state=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0019 begin`);
      const actual: boolean = acceptsGesture(65);
      logInfo(`acceptsGesture(state=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0020
     * @tc.name      PullToRefresh_AcceptsGesture_0020
     * @tc.desc      acceptsGesture(state=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0020 begin`);
      const actual: boolean = acceptsGesture(70);
      logInfo(`acceptsGesture(state=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0021
     * @tc.name      PullToRefresh_AcceptsGesture_0021
     * @tc.desc      acceptsGesture(state=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0021 begin`);
      const actual: boolean = acceptsGesture(75);
      logInfo(`acceptsGesture(state=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0022
     * @tc.name      PullToRefresh_AcceptsGesture_0022
     * @tc.desc      acceptsGesture(state=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0022 begin`);
      const actual: boolean = acceptsGesture(80);
      logInfo(`acceptsGesture(state=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0023
     * @tc.name      PullToRefresh_AcceptsGesture_0023
     * @tc.desc      acceptsGesture(state=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0023 begin`);
      const actual: boolean = acceptsGesture(85);
      logInfo(`acceptsGesture(state=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0024
     * @tc.name      PullToRefresh_AcceptsGesture_0024
     * @tc.desc      acceptsGesture(state=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0024 begin`);
      const actual: boolean = acceptsGesture(90);
      logInfo(`acceptsGesture(state=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0025
     * @tc.name      PullToRefresh_AcceptsGesture_0025
     * @tc.desc      acceptsGesture(state=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0025 begin`);
      const actual: boolean = acceptsGesture(95);
      logInfo(`acceptsGesture(state=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0026
     * @tc.name      PullToRefresh_AcceptsGesture_0026
     * @tc.desc      acceptsGesture(state=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0026 begin`);
      const actual: boolean = acceptsGesture(105);
      logInfo(`acceptsGesture(state=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0027
     * @tc.name      PullToRefresh_AcceptsGesture_0027
     * @tc.desc      acceptsGesture(state=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0027 begin`);
      const actual: boolean = acceptsGesture(110);
      logInfo(`acceptsGesture(state=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0028
     * @tc.name      PullToRefresh_AcceptsGesture_0028
     * @tc.desc      acceptsGesture(state=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0028 begin`);
      const actual: boolean = acceptsGesture(115);
      logInfo(`acceptsGesture(state=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0029
     * @tc.name      PullToRefresh_AcceptsGesture_0029
     * @tc.desc      acceptsGesture(state=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0029 begin`);
      const actual: boolean = acceptsGesture(120);
      logInfo(`acceptsGesture(state=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0030
     * @tc.name      PullToRefresh_AcceptsGesture_0030
     * @tc.desc      acceptsGesture(state=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0030 begin`);
      const actual: boolean = acceptsGesture(125);
      logInfo(`acceptsGesture(state=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0031
     * @tc.name      PullToRefresh_AcceptsGesture_0031
     * @tc.desc      acceptsGesture(state=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0031 begin`);
      const actual: boolean = acceptsGesture(130);
      logInfo(`acceptsGesture(state=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0032
     * @tc.name      PullToRefresh_AcceptsGesture_0032
     * @tc.desc      acceptsGesture(state=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0032 begin`);
      const actual: boolean = acceptsGesture(135);
      logInfo(`acceptsGesture(state=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0033
     * @tc.name      PullToRefresh_AcceptsGesture_0033
     * @tc.desc      acceptsGesture(state=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0033 begin`);
      const actual: boolean = acceptsGesture(140);
      logInfo(`acceptsGesture(state=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0034
     * @tc.name      PullToRefresh_AcceptsGesture_0034
     * @tc.desc      acceptsGesture(state=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0034 begin`);
      const actual: boolean = acceptsGesture(145);
      logInfo(`acceptsGesture(state=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0035
     * @tc.name      PullToRefresh_AcceptsGesture_0035
     * @tc.desc      acceptsGesture(state=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0035 begin`);
      const actual: boolean = acceptsGesture(150);
      logInfo(`acceptsGesture(state=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0036
     * @tc.name      PullToRefresh_AcceptsGesture_0036
     * @tc.desc      acceptsGesture(state=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0036 begin`);
      const actual: boolean = acceptsGesture(155);
      logInfo(`acceptsGesture(state=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0037
     * @tc.name      PullToRefresh_AcceptsGesture_0037
     * @tc.desc      acceptsGesture(state=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0037 begin`);
      const actual: boolean = acceptsGesture(160);
      logInfo(`acceptsGesture(state=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0038
     * @tc.name      PullToRefresh_AcceptsGesture_0038
     * @tc.desc      acceptsGesture(state=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0038 begin`);
      const actual: boolean = acceptsGesture(165);
      logInfo(`acceptsGesture(state=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0039
     * @tc.name      PullToRefresh_AcceptsGesture_0039
     * @tc.desc      acceptsGesture(state=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0039 begin`);
      const actual: boolean = acceptsGesture(170);
      logInfo(`acceptsGesture(state=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0040
     * @tc.name      PullToRefresh_AcceptsGesture_0040
     * @tc.desc      acceptsGesture(state=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0040 begin`);
      const actual: boolean = acceptsGesture(175);
      logInfo(`acceptsGesture(state=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0041
     * @tc.name      PullToRefresh_AcceptsGesture_0041
     * @tc.desc      acceptsGesture(state=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0041 begin`);
      const actual: boolean = acceptsGesture(180);
      logInfo(`acceptsGesture(state=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0042
     * @tc.name      PullToRefresh_AcceptsGesture_0042
     * @tc.desc      acceptsGesture(state=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0042 begin`);
      const actual: boolean = acceptsGesture(185);
      logInfo(`acceptsGesture(state=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0043
     * @tc.name      PullToRefresh_AcceptsGesture_0043
     * @tc.desc      acceptsGesture(state=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0043 begin`);
      const actual: boolean = acceptsGesture(190);
      logInfo(`acceptsGesture(state=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0044
     * @tc.name      PullToRefresh_AcceptsGesture_0044
     * @tc.desc      acceptsGesture(state=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0044 begin`);
      const actual: boolean = acceptsGesture(195);
      logInfo(`acceptsGesture(state=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0045
     * @tc.name      PullToRefresh_AcceptsGesture_0045
     * @tc.desc      acceptsGesture(state=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0045 begin`);
      const actual: boolean = acceptsGesture(200);
      logInfo(`acceptsGesture(state=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0046
     * @tc.name      PullToRefresh_AcceptsGesture_0046
     * @tc.desc      acceptsGesture(state=41.65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0046 begin`);
      const actual: boolean = acceptsGesture(41.65);
      logInfo(`acceptsGesture(state=41.65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0047
     * @tc.name      PullToRefresh_AcceptsGesture_0047
     * @tc.desc      acceptsGesture(state=52.88) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0047 begin`);
      const actual: boolean = acceptsGesture(52.88);
      logInfo(`acceptsGesture(state=52.88): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0048
     * @tc.name      PullToRefresh_AcceptsGesture_0048
     * @tc.desc      acceptsGesture(state=43.42) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0048 begin`);
      const actual: boolean = acceptsGesture(43.42);
      logInfo(`acceptsGesture(state=43.42): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0049
     * @tc.name      PullToRefresh_AcceptsGesture_0049
     * @tc.desc      acceptsGesture(state=43.9) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0049 begin`);
      const actual: boolean = acceptsGesture(43.9);
      logInfo(`acceptsGesture(state=43.9): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_ACCEPTS_GESTURE_0050
     * @tc.name      PullToRefresh_AcceptsGesture_0050
     * @tc.desc      acceptsGesture(state=178) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_AcceptsGesture_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptsGesture_0050 begin`);
      const actual: boolean = acceptsGesture(178);
      logInfo(`acceptsGesture(state=178): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}AcceptsGesture_0050 end`);
    });
  });
}
