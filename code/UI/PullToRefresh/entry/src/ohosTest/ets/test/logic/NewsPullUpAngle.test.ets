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
import { newsPullUpAngle } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for newsPullUpAngle (50 cases). */
export default function newsPullUpAngleTest(): void {
  describe('NewsPullUpAngleTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0001
     * @tc.name      PullToRefresh_NewsPullUpAngle_0001
     * @tc.desc      newsPullUpAngle(value=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPullUpAngle_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0001 begin`);
      const actual: number = newsPullUpAngle(0);
      logInfo(`newsPullUpAngle(value=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NewsPullUpAngle_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0002
     * @tc.name      PullToRefresh_NewsPullUpAngle_0002
     * @tc.desc      newsPullUpAngle(value=1) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPullUpAngle_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0002 begin`);
      const actual: number = newsPullUpAngle(1);
      logInfo(`newsPullUpAngle(value=1): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0003
     * @tc.name      PullToRefresh_NewsPullUpAngle_0003
     * @tc.desc      newsPullUpAngle(value=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPullUpAngle_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0003 begin`);
      const actual: number = newsPullUpAngle(-1);
      logInfo(`newsPullUpAngle(value=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NewsPullUpAngle_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0004
     * @tc.name      PullToRefresh_NewsPullUpAngle_0004
     * @tc.desc      newsPullUpAngle(value=180) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPullUpAngle_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0004 begin`);
      const actual: number = newsPullUpAngle(180);
      logInfo(`newsPullUpAngle(value=180): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0005
     * @tc.name      PullToRefresh_NewsPullUpAngle_0005
     * @tc.desc      newsPullUpAngle(value=179) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPullUpAngle_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0005 begin`);
      const actual: number = newsPullUpAngle(179);
      logInfo(`newsPullUpAngle(value=179): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0006
     * @tc.name      PullToRefresh_NewsPullUpAngle_0006
     * @tc.desc      newsPullUpAngle(value=181) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPullUpAngle_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0006 begin`);
      const actual: number = newsPullUpAngle(181);
      logInfo(`newsPullUpAngle(value=181): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0007
     * @tc.name      PullToRefresh_NewsPullUpAngle_0007
     * @tc.desc      newsPullUpAngle(value=360) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0007 begin`);
      const actual: number = newsPullUpAngle(360);
      logInfo(`newsPullUpAngle(value=360): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0008
     * @tc.name      PullToRefresh_NewsPullUpAngle_0008
     * @tc.desc      newsPullUpAngle(value=90) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0008 begin`);
      const actual: number = newsPullUpAngle(90);
      logInfo(`newsPullUpAngle(value=90): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0009
     * @tc.name      PullToRefresh_NewsPullUpAngle_0009
     * @tc.desc      newsPullUpAngle(value=2) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0009 begin`);
      const actual: number = newsPullUpAngle(2);
      logInfo(`newsPullUpAngle(value=2): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0010
     * @tc.name      PullToRefresh_NewsPullUpAngle_0010
     * @tc.desc      newsPullUpAngle(value=3) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0010 begin`);
      const actual: number = newsPullUpAngle(3);
      logInfo(`newsPullUpAngle(value=3): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0011
     * @tc.name      PullToRefresh_NewsPullUpAngle_0011
     * @tc.desc      newsPullUpAngle(value=10) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0011 begin`);
      const actual: number = newsPullUpAngle(10);
      logInfo(`newsPullUpAngle(value=10): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0012
     * @tc.name      PullToRefresh_NewsPullUpAngle_0012
     * @tc.desc      newsPullUpAngle(value=100) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0012 begin`);
      const actual: number = newsPullUpAngle(100);
      logInfo(`newsPullUpAngle(value=100): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0013
     * @tc.name      PullToRefresh_NewsPullUpAngle_0013
     * @tc.desc      newsPullUpAngle(value=18) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0013 begin`);
      const actual: number = newsPullUpAngle(18);
      logInfo(`newsPullUpAngle(value=18): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0014
     * @tc.name      PullToRefresh_NewsPullUpAngle_0014
     * @tc.desc      newsPullUpAngle(value=36) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0014 begin`);
      const actual: number = newsPullUpAngle(36);
      logInfo(`newsPullUpAngle(value=36): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0015
     * @tc.name      PullToRefresh_NewsPullUpAngle_0015
     * @tc.desc      newsPullUpAngle(value=54) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0015 begin`);
      const actual: number = newsPullUpAngle(54);
      logInfo(`newsPullUpAngle(value=54): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0016
     * @tc.name      PullToRefresh_NewsPullUpAngle_0016
     * @tc.desc      newsPullUpAngle(value=72) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0016 begin`);
      const actual: number = newsPullUpAngle(72);
      logInfo(`newsPullUpAngle(value=72): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0017
     * @tc.name      PullToRefresh_NewsPullUpAngle_0017
     * @tc.desc      newsPullUpAngle(value=108) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0017 begin`);
      const actual: number = newsPullUpAngle(108);
      logInfo(`newsPullUpAngle(value=108): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0018
     * @tc.name      PullToRefresh_NewsPullUpAngle_0018
     * @tc.desc      newsPullUpAngle(value=126) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0018 begin`);
      const actual: number = newsPullUpAngle(126);
      logInfo(`newsPullUpAngle(value=126): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0019
     * @tc.name      PullToRefresh_NewsPullUpAngle_0019
     * @tc.desc      newsPullUpAngle(value=144) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0019 begin`);
      const actual: number = newsPullUpAngle(144);
      logInfo(`newsPullUpAngle(value=144): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0020
     * @tc.name      PullToRefresh_NewsPullUpAngle_0020
     * @tc.desc      newsPullUpAngle(value=162) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0020 begin`);
      const actual: number = newsPullUpAngle(162);
      logInfo(`newsPullUpAngle(value=162): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0021
     * @tc.name      PullToRefresh_NewsPullUpAngle_0021
     * @tc.desc      newsPullUpAngle(value=198) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0021 begin`);
      const actual: number = newsPullUpAngle(198);
      logInfo(`newsPullUpAngle(value=198): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0022
     * @tc.name      PullToRefresh_NewsPullUpAngle_0022
     * @tc.desc      newsPullUpAngle(value=216) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0022 begin`);
      const actual: number = newsPullUpAngle(216);
      logInfo(`newsPullUpAngle(value=216): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0023
     * @tc.name      PullToRefresh_NewsPullUpAngle_0023
     * @tc.desc      newsPullUpAngle(value=234) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0023 begin`);
      const actual: number = newsPullUpAngle(234);
      logInfo(`newsPullUpAngle(value=234): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0024
     * @tc.name      PullToRefresh_NewsPullUpAngle_0024
     * @tc.desc      newsPullUpAngle(value=252) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0024 begin`);
      const actual: number = newsPullUpAngle(252);
      logInfo(`newsPullUpAngle(value=252): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0025
     * @tc.name      PullToRefresh_NewsPullUpAngle_0025
     * @tc.desc      newsPullUpAngle(value=270) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0025 begin`);
      const actual: number = newsPullUpAngle(270);
      logInfo(`newsPullUpAngle(value=270): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0026
     * @tc.name      PullToRefresh_NewsPullUpAngle_0026
     * @tc.desc      newsPullUpAngle(value=288) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0026 begin`);
      const actual: number = newsPullUpAngle(288);
      logInfo(`newsPullUpAngle(value=288): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0027
     * @tc.name      PullToRefresh_NewsPullUpAngle_0027
     * @tc.desc      newsPullUpAngle(value=306) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0027 begin`);
      const actual: number = newsPullUpAngle(306);
      logInfo(`newsPullUpAngle(value=306): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0028
     * @tc.name      PullToRefresh_NewsPullUpAngle_0028
     * @tc.desc      newsPullUpAngle(value=324) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0028 begin`);
      const actual: number = newsPullUpAngle(324);
      logInfo(`newsPullUpAngle(value=324): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0029
     * @tc.name      PullToRefresh_NewsPullUpAngle_0029
     * @tc.desc      newsPullUpAngle(value=342) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0029 begin`);
      const actual: number = newsPullUpAngle(342);
      logInfo(`newsPullUpAngle(value=342): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0030
     * @tc.name      PullToRefresh_NewsPullUpAngle_0030
     * @tc.desc      newsPullUpAngle(value=378) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0030 begin`);
      const actual: number = newsPullUpAngle(378);
      logInfo(`newsPullUpAngle(value=378): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0031
     * @tc.name      PullToRefresh_NewsPullUpAngle_0031
     * @tc.desc      newsPullUpAngle(value=396) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0031 begin`);
      const actual: number = newsPullUpAngle(396);
      logInfo(`newsPullUpAngle(value=396): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0032
     * @tc.name      PullToRefresh_NewsPullUpAngle_0032
     * @tc.desc      newsPullUpAngle(value=414) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0032 begin`);
      const actual: number = newsPullUpAngle(414);
      logInfo(`newsPullUpAngle(value=414): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0033
     * @tc.name      PullToRefresh_NewsPullUpAngle_0033
     * @tc.desc      newsPullUpAngle(value=432) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0033 begin`);
      const actual: number = newsPullUpAngle(432);
      logInfo(`newsPullUpAngle(value=432): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0034
     * @tc.name      PullToRefresh_NewsPullUpAngle_0034
     * @tc.desc      newsPullUpAngle(value=450) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0034 begin`);
      const actual: number = newsPullUpAngle(450);
      logInfo(`newsPullUpAngle(value=450): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0035
     * @tc.name      PullToRefresh_NewsPullUpAngle_0035
     * @tc.desc      newsPullUpAngle(value=468) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0035 begin`);
      const actual: number = newsPullUpAngle(468);
      logInfo(`newsPullUpAngle(value=468): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0036
     * @tc.name      PullToRefresh_NewsPullUpAngle_0036
     * @tc.desc      newsPullUpAngle(value=486) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0036 begin`);
      const actual: number = newsPullUpAngle(486);
      logInfo(`newsPullUpAngle(value=486): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0037
     * @tc.name      PullToRefresh_NewsPullUpAngle_0037
     * @tc.desc      newsPullUpAngle(value=504) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0037 begin`);
      const actual: number = newsPullUpAngle(504);
      logInfo(`newsPullUpAngle(value=504): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0038
     * @tc.name      PullToRefresh_NewsPullUpAngle_0038
     * @tc.desc      newsPullUpAngle(value=522) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0038 begin`);
      const actual: number = newsPullUpAngle(522);
      logInfo(`newsPullUpAngle(value=522): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0039
     * @tc.name      PullToRefresh_NewsPullUpAngle_0039
     * @tc.desc      newsPullUpAngle(value=540) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0039 begin`);
      const actual: number = newsPullUpAngle(540);
      logInfo(`newsPullUpAngle(value=540): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0040
     * @tc.name      PullToRefresh_NewsPullUpAngle_0040
     * @tc.desc      newsPullUpAngle(value=558) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0040 begin`);
      const actual: number = newsPullUpAngle(558);
      logInfo(`newsPullUpAngle(value=558): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0041
     * @tc.name      PullToRefresh_NewsPullUpAngle_0041
     * @tc.desc      newsPullUpAngle(value=576) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0041 begin`);
      const actual: number = newsPullUpAngle(576);
      logInfo(`newsPullUpAngle(value=576): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0042
     * @tc.name      PullToRefresh_NewsPullUpAngle_0042
     * @tc.desc      newsPullUpAngle(value=594) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0042 begin`);
      const actual: number = newsPullUpAngle(594);
      logInfo(`newsPullUpAngle(value=594): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0043
     * @tc.name      PullToRefresh_NewsPullUpAngle_0043
     * @tc.desc      newsPullUpAngle(value=612) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0043 begin`);
      const actual: number = newsPullUpAngle(612);
      logInfo(`newsPullUpAngle(value=612): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0044
     * @tc.name      PullToRefresh_NewsPullUpAngle_0044
     * @tc.desc      newsPullUpAngle(value=630) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0044 begin`);
      const actual: number = newsPullUpAngle(630);
      logInfo(`newsPullUpAngle(value=630): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0045
     * @tc.name      PullToRefresh_NewsPullUpAngle_0045
     * @tc.desc      newsPullUpAngle(value=648) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0045 begin`);
      const actual: number = newsPullUpAngle(648);
      logInfo(`newsPullUpAngle(value=648): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0046
     * @tc.name      PullToRefresh_NewsPullUpAngle_0046
     * @tc.desc      newsPullUpAngle(value=666) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0046 begin`);
      const actual: number = newsPullUpAngle(666);
      logInfo(`newsPullUpAngle(value=666): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0047
     * @tc.name      PullToRefresh_NewsPullUpAngle_0047
     * @tc.desc      newsPullUpAngle(value=684) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0047 begin`);
      const actual: number = newsPullUpAngle(684);
      logInfo(`newsPullUpAngle(value=684): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0048
     * @tc.name      PullToRefresh_NewsPullUpAngle_0048
     * @tc.desc      newsPullUpAngle(value=702) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0048 begin`);
      const actual: number = newsPullUpAngle(702);
      logInfo(`newsPullUpAngle(value=702): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0049
     * @tc.name      PullToRefresh_NewsPullUpAngle_0049
     * @tc.desc      newsPullUpAngle(value=720) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPullUpAngle_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0049 begin`);
      const actual: number = newsPullUpAngle(720);
      logInfo(`newsPullUpAngle(value=720): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPullUpAngle_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PULL_UP_ANGLE_0050
     * @tc.name      PullToRefresh_NewsPullUpAngle_0050
     * @tc.desc      newsPullUpAngle(value=-139) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsPullUpAngle_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsPullUpAngle_0050 begin`);
      const actual: number = newsPullUpAngle(-139);
      logInfo(`newsPullUpAngle(value=-139): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NewsPullUpAngle_0050 end`);
    });
  });
}
