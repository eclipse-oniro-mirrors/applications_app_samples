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
import { pullUpArrowAngle } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pullUpArrowAngle (50 cases). */
export default function pullUpArrowAngleTest(): void {
  describe('PullUpArrowAngleTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0001
     * @tc.name      PullToRefresh_PullUpArrowAngle_0001
     * @tc.desc      pullUpArrowAngle(value=0.75) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullUpArrowAngle_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0001 begin`);
      const actual: number = pullUpArrowAngle(0.75);
      logInfo(`pullUpArrowAngle(value=0.75): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0002
     * @tc.name      PullToRefresh_PullUpArrowAngle_0002
     * @tc.desc      pullUpArrowAngle(value=0.375) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullUpArrowAngle_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0002 begin`);
      const actual: number = pullUpArrowAngle(0.375);
      logInfo(`pullUpArrowAngle(value=0.375): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullUpArrowAngle_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0003
     * @tc.name      PullToRefresh_PullUpArrowAngle_0003
     * @tc.desc      pullUpArrowAngle(value=1.5) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0003 begin`);
      const actual: number = pullUpArrowAngle(1.5);
      logInfo(`pullUpArrowAngle(value=1.5): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0004
     * @tc.name      PullToRefresh_PullUpArrowAngle_0004
     * @tc.desc      pullUpArrowAngle(value=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpArrowAngle_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0004 begin`);
      const actual: number = pullUpArrowAngle(0);
      logInfo(`pullUpArrowAngle(value=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullUpArrowAngle_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0005
     * @tc.name      PullToRefresh_PullUpArrowAngle_0005
     * @tc.desc      pullUpArrowAngle(value=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpArrowAngle_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0005 begin`);
      const actual: number = pullUpArrowAngle(-1);
      logInfo(`pullUpArrowAngle(value=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullUpArrowAngle_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0006
     * @tc.name      PullToRefresh_PullUpArrowAngle_0006
     * @tc.desc      pullUpArrowAngle(value=1) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpArrowAngle_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0006 begin`);
      const actual: number = pullUpArrowAngle(1);
      logInfo(`pullUpArrowAngle(value=1): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0007
     * @tc.name      PullToRefresh_PullUpArrowAngle_0007
     * @tc.desc      pullUpArrowAngle(value=180) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpArrowAngle_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0007 begin`);
      const actual: number = pullUpArrowAngle(180);
      logInfo(`pullUpArrowAngle(value=180): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0008
     * @tc.name      PullToRefresh_PullUpArrowAngle_0008
     * @tc.desc      pullUpArrowAngle(value=179) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpArrowAngle_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0008 begin`);
      const actual: number = pullUpArrowAngle(179);
      logInfo(`pullUpArrowAngle(value=179): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0009
     * @tc.name      PullToRefresh_PullUpArrowAngle_0009
     * @tc.desc      pullUpArrowAngle(value=181) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullUpArrowAngle_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0009 begin`);
      const actual: number = pullUpArrowAngle(181);
      logInfo(`pullUpArrowAngle(value=181): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0010
     * @tc.name      PullToRefresh_PullUpArrowAngle_0010
     * @tc.desc      pullUpArrowAngle(value=360) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0010 begin`);
      const actual: number = pullUpArrowAngle(360);
      logInfo(`pullUpArrowAngle(value=360): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0011
     * @tc.name      PullToRefresh_PullUpArrowAngle_0011
     * @tc.desc      pullUpArrowAngle(value=90) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0011 begin`);
      const actual: number = pullUpArrowAngle(90);
      logInfo(`pullUpArrowAngle(value=90): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0012
     * @tc.name      PullToRefresh_PullUpArrowAngle_0012
     * @tc.desc      pullUpArrowAngle(value=2) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0012 begin`);
      const actual: number = pullUpArrowAngle(2);
      logInfo(`pullUpArrowAngle(value=2): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0013
     * @tc.name      PullToRefresh_PullUpArrowAngle_0013
     * @tc.desc      pullUpArrowAngle(value=3) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0013 begin`);
      const actual: number = pullUpArrowAngle(3);
      logInfo(`pullUpArrowAngle(value=3): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0014
     * @tc.name      PullToRefresh_PullUpArrowAngle_0014
     * @tc.desc      pullUpArrowAngle(value=10) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0014 begin`);
      const actual: number = pullUpArrowAngle(10);
      logInfo(`pullUpArrowAngle(value=10): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0015
     * @tc.name      PullToRefresh_PullUpArrowAngle_0015
     * @tc.desc      pullUpArrowAngle(value=100) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0015 begin`);
      const actual: number = pullUpArrowAngle(100);
      logInfo(`pullUpArrowAngle(value=100): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0016
     * @tc.name      PullToRefresh_PullUpArrowAngle_0016
     * @tc.desc      pullUpArrowAngle(value=18) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0016 begin`);
      const actual: number = pullUpArrowAngle(18);
      logInfo(`pullUpArrowAngle(value=18): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0017
     * @tc.name      PullToRefresh_PullUpArrowAngle_0017
     * @tc.desc      pullUpArrowAngle(value=36) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0017 begin`);
      const actual: number = pullUpArrowAngle(36);
      logInfo(`pullUpArrowAngle(value=36): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0018
     * @tc.name      PullToRefresh_PullUpArrowAngle_0018
     * @tc.desc      pullUpArrowAngle(value=54) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0018 begin`);
      const actual: number = pullUpArrowAngle(54);
      logInfo(`pullUpArrowAngle(value=54): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0019
     * @tc.name      PullToRefresh_PullUpArrowAngle_0019
     * @tc.desc      pullUpArrowAngle(value=72) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0019 begin`);
      const actual: number = pullUpArrowAngle(72);
      logInfo(`pullUpArrowAngle(value=72): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0020
     * @tc.name      PullToRefresh_PullUpArrowAngle_0020
     * @tc.desc      pullUpArrowAngle(value=108) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0020 begin`);
      const actual: number = pullUpArrowAngle(108);
      logInfo(`pullUpArrowAngle(value=108): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0021
     * @tc.name      PullToRefresh_PullUpArrowAngle_0021
     * @tc.desc      pullUpArrowAngle(value=126) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0021 begin`);
      const actual: number = pullUpArrowAngle(126);
      logInfo(`pullUpArrowAngle(value=126): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0022
     * @tc.name      PullToRefresh_PullUpArrowAngle_0022
     * @tc.desc      pullUpArrowAngle(value=144) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0022 begin`);
      const actual: number = pullUpArrowAngle(144);
      logInfo(`pullUpArrowAngle(value=144): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0023
     * @tc.name      PullToRefresh_PullUpArrowAngle_0023
     * @tc.desc      pullUpArrowAngle(value=162) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0023 begin`);
      const actual: number = pullUpArrowAngle(162);
      logInfo(`pullUpArrowAngle(value=162): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0024
     * @tc.name      PullToRefresh_PullUpArrowAngle_0024
     * @tc.desc      pullUpArrowAngle(value=198) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0024 begin`);
      const actual: number = pullUpArrowAngle(198);
      logInfo(`pullUpArrowAngle(value=198): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0025
     * @tc.name      PullToRefresh_PullUpArrowAngle_0025
     * @tc.desc      pullUpArrowAngle(value=216) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0025 begin`);
      const actual: number = pullUpArrowAngle(216);
      logInfo(`pullUpArrowAngle(value=216): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0026
     * @tc.name      PullToRefresh_PullUpArrowAngle_0026
     * @tc.desc      pullUpArrowAngle(value=234) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0026 begin`);
      const actual: number = pullUpArrowAngle(234);
      logInfo(`pullUpArrowAngle(value=234): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0027
     * @tc.name      PullToRefresh_PullUpArrowAngle_0027
     * @tc.desc      pullUpArrowAngle(value=252) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0027 begin`);
      const actual: number = pullUpArrowAngle(252);
      logInfo(`pullUpArrowAngle(value=252): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0028
     * @tc.name      PullToRefresh_PullUpArrowAngle_0028
     * @tc.desc      pullUpArrowAngle(value=270) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0028 begin`);
      const actual: number = pullUpArrowAngle(270);
      logInfo(`pullUpArrowAngle(value=270): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0029
     * @tc.name      PullToRefresh_PullUpArrowAngle_0029
     * @tc.desc      pullUpArrowAngle(value=288) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0029 begin`);
      const actual: number = pullUpArrowAngle(288);
      logInfo(`pullUpArrowAngle(value=288): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0030
     * @tc.name      PullToRefresh_PullUpArrowAngle_0030
     * @tc.desc      pullUpArrowAngle(value=306) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0030 begin`);
      const actual: number = pullUpArrowAngle(306);
      logInfo(`pullUpArrowAngle(value=306): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0031
     * @tc.name      PullToRefresh_PullUpArrowAngle_0031
     * @tc.desc      pullUpArrowAngle(value=324) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0031 begin`);
      const actual: number = pullUpArrowAngle(324);
      logInfo(`pullUpArrowAngle(value=324): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0032
     * @tc.name      PullToRefresh_PullUpArrowAngle_0032
     * @tc.desc      pullUpArrowAngle(value=342) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0032 begin`);
      const actual: number = pullUpArrowAngle(342);
      logInfo(`pullUpArrowAngle(value=342): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0033
     * @tc.name      PullToRefresh_PullUpArrowAngle_0033
     * @tc.desc      pullUpArrowAngle(value=378) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0033 begin`);
      const actual: number = pullUpArrowAngle(378);
      logInfo(`pullUpArrowAngle(value=378): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0034
     * @tc.name      PullToRefresh_PullUpArrowAngle_0034
     * @tc.desc      pullUpArrowAngle(value=396) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0034 begin`);
      const actual: number = pullUpArrowAngle(396);
      logInfo(`pullUpArrowAngle(value=396): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0035
     * @tc.name      PullToRefresh_PullUpArrowAngle_0035
     * @tc.desc      pullUpArrowAngle(value=414) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0035 begin`);
      const actual: number = pullUpArrowAngle(414);
      logInfo(`pullUpArrowAngle(value=414): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0036
     * @tc.name      PullToRefresh_PullUpArrowAngle_0036
     * @tc.desc      pullUpArrowAngle(value=432) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0036 begin`);
      const actual: number = pullUpArrowAngle(432);
      logInfo(`pullUpArrowAngle(value=432): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0037
     * @tc.name      PullToRefresh_PullUpArrowAngle_0037
     * @tc.desc      pullUpArrowAngle(value=450) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0037 begin`);
      const actual: number = pullUpArrowAngle(450);
      logInfo(`pullUpArrowAngle(value=450): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0038
     * @tc.name      PullToRefresh_PullUpArrowAngle_0038
     * @tc.desc      pullUpArrowAngle(value=468) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0038 begin`);
      const actual: number = pullUpArrowAngle(468);
      logInfo(`pullUpArrowAngle(value=468): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0039
     * @tc.name      PullToRefresh_PullUpArrowAngle_0039
     * @tc.desc      pullUpArrowAngle(value=486) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0039 begin`);
      const actual: number = pullUpArrowAngle(486);
      logInfo(`pullUpArrowAngle(value=486): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0040
     * @tc.name      PullToRefresh_PullUpArrowAngle_0040
     * @tc.desc      pullUpArrowAngle(value=504) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0040 begin`);
      const actual: number = pullUpArrowAngle(504);
      logInfo(`pullUpArrowAngle(value=504): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0041
     * @tc.name      PullToRefresh_PullUpArrowAngle_0041
     * @tc.desc      pullUpArrowAngle(value=522) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0041 begin`);
      const actual: number = pullUpArrowAngle(522);
      logInfo(`pullUpArrowAngle(value=522): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0042
     * @tc.name      PullToRefresh_PullUpArrowAngle_0042
     * @tc.desc      pullUpArrowAngle(value=540) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0042 begin`);
      const actual: number = pullUpArrowAngle(540);
      logInfo(`pullUpArrowAngle(value=540): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0043
     * @tc.name      PullToRefresh_PullUpArrowAngle_0043
     * @tc.desc      pullUpArrowAngle(value=558) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0043 begin`);
      const actual: number = pullUpArrowAngle(558);
      logInfo(`pullUpArrowAngle(value=558): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0044
     * @tc.name      PullToRefresh_PullUpArrowAngle_0044
     * @tc.desc      pullUpArrowAngle(value=576) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0044 begin`);
      const actual: number = pullUpArrowAngle(576);
      logInfo(`pullUpArrowAngle(value=576): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0045
     * @tc.name      PullToRefresh_PullUpArrowAngle_0045
     * @tc.desc      pullUpArrowAngle(value=594) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0045 begin`);
      const actual: number = pullUpArrowAngle(594);
      logInfo(`pullUpArrowAngle(value=594): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0046
     * @tc.name      PullToRefresh_PullUpArrowAngle_0046
     * @tc.desc      pullUpArrowAngle(value=612) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0046 begin`);
      const actual: number = pullUpArrowAngle(612);
      logInfo(`pullUpArrowAngle(value=612): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0047
     * @tc.name      PullToRefresh_PullUpArrowAngle_0047
     * @tc.desc      pullUpArrowAngle(value=630) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0047 begin`);
      const actual: number = pullUpArrowAngle(630);
      logInfo(`pullUpArrowAngle(value=630): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0048
     * @tc.name      PullToRefresh_PullUpArrowAngle_0048
     * @tc.desc      pullUpArrowAngle(value=648) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0048 begin`);
      const actual: number = pullUpArrowAngle(648);
      logInfo(`pullUpArrowAngle(value=648): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0049
     * @tc.name      PullToRefresh_PullUpArrowAngle_0049
     * @tc.desc      pullUpArrowAngle(value=666) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0049 begin`);
      const actual: number = pullUpArrowAngle(666);
      logInfo(`pullUpArrowAngle(value=666): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_ARROW_ANGLE_0050
     * @tc.name      PullToRefresh_PullUpArrowAngle_0050
     * @tc.desc      pullUpArrowAngle(value=684) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullUpArrowAngle_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullUpArrowAngle_0050 begin`);
      const actual: number = pullUpArrowAngle(684);
      logInfo(`pullUpArrowAngle(value=684): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PullUpArrowAngle_0050 end`);
    });
  });
}
