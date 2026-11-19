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
import { canLoadMore } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for canLoadMore (50 cases). */
export default function canLoadMoreTest(): void {
  describe('CanLoadMoreTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0001
     * @tc.name      PullToRefresh_CanLoadMore_0001
     * @tc.desc      canLoadMore(newsDataListIndex=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_CanLoadMore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanLoadMore_0001 begin`);
      const actual: boolean = canLoadMore(0);
      logInfo(`canLoadMore(newsDataListIndex=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanLoadMore_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0002
     * @tc.name      PullToRefresh_CanLoadMore_0002
     * @tc.desc      canLoadMore(newsDataListIndex=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_CanLoadMore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CanLoadMore_0002 begin`);
      const actual: boolean = canLoadMore(5);
      logInfo(`canLoadMore(newsDataListIndex=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0003
     * @tc.name      PullToRefresh_CanLoadMore_0003
     * @tc.desc      canLoadMore(newsDataListIndex=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0003 begin`);
      const actual: boolean = canLoadMore(1);
      logInfo(`canLoadMore(newsDataListIndex=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanLoadMore_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0004
     * @tc.name      PullToRefresh_CanLoadMore_0004
     * @tc.desc      canLoadMore(newsDataListIndex=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0004 begin`);
      const actual: boolean = canLoadMore(2);
      logInfo(`canLoadMore(newsDataListIndex=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanLoadMore_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0005
     * @tc.name      PullToRefresh_CanLoadMore_0005
     * @tc.desc      canLoadMore(newsDataListIndex=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_CanLoadMore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanLoadMore_0005 begin`);
      const actual: boolean = canLoadMore(-1);
      logInfo(`canLoadMore(newsDataListIndex=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanLoadMore_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0006
     * @tc.name      PullToRefresh_CanLoadMore_0006
     * @tc.desc      canLoadMore(newsDataListIndex=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0006 begin`);
      const actual: boolean = canLoadMore(10);
      logInfo(`canLoadMore(newsDataListIndex=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0007
     * @tc.name      PullToRefresh_CanLoadMore_0007
     * @tc.desc      canLoadMore(newsDataListIndex=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0007 begin`);
      const actual: boolean = canLoadMore(3);
      logInfo(`canLoadMore(newsDataListIndex=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanLoadMore_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0008
     * @tc.name      PullToRefresh_CanLoadMore_0008
     * @tc.desc      canLoadMore(newsDataListIndex=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0008 begin`);
      const actual: boolean = canLoadMore(100);
      logInfo(`canLoadMore(newsDataListIndex=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0009
     * @tc.name      PullToRefresh_CanLoadMore_0009
     * @tc.desc      canLoadMore(newsDataListIndex=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0009 begin`);
      const actual: boolean = canLoadMore(15);
      logInfo(`canLoadMore(newsDataListIndex=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0010
     * @tc.name      PullToRefresh_CanLoadMore_0010
     * @tc.desc      canLoadMore(newsDataListIndex=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0010 begin`);
      const actual: boolean = canLoadMore(20);
      logInfo(`canLoadMore(newsDataListIndex=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0011
     * @tc.name      PullToRefresh_CanLoadMore_0011
     * @tc.desc      canLoadMore(newsDataListIndex=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0011 begin`);
      const actual: boolean = canLoadMore(25);
      logInfo(`canLoadMore(newsDataListIndex=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0012
     * @tc.name      PullToRefresh_CanLoadMore_0012
     * @tc.desc      canLoadMore(newsDataListIndex=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0012 begin`);
      const actual: boolean = canLoadMore(30);
      logInfo(`canLoadMore(newsDataListIndex=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0013
     * @tc.name      PullToRefresh_CanLoadMore_0013
     * @tc.desc      canLoadMore(newsDataListIndex=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0013 begin`);
      const actual: boolean = canLoadMore(35);
      logInfo(`canLoadMore(newsDataListIndex=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0014
     * @tc.name      PullToRefresh_CanLoadMore_0014
     * @tc.desc      canLoadMore(newsDataListIndex=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0014 begin`);
      const actual: boolean = canLoadMore(40);
      logInfo(`canLoadMore(newsDataListIndex=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0015
     * @tc.name      PullToRefresh_CanLoadMore_0015
     * @tc.desc      canLoadMore(newsDataListIndex=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0015 begin`);
      const actual: boolean = canLoadMore(45);
      logInfo(`canLoadMore(newsDataListIndex=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0016
     * @tc.name      PullToRefresh_CanLoadMore_0016
     * @tc.desc      canLoadMore(newsDataListIndex=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0016 begin`);
      const actual: boolean = canLoadMore(50);
      logInfo(`canLoadMore(newsDataListIndex=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0017
     * @tc.name      PullToRefresh_CanLoadMore_0017
     * @tc.desc      canLoadMore(newsDataListIndex=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0017 begin`);
      const actual: boolean = canLoadMore(55);
      logInfo(`canLoadMore(newsDataListIndex=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0018
     * @tc.name      PullToRefresh_CanLoadMore_0018
     * @tc.desc      canLoadMore(newsDataListIndex=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0018 begin`);
      const actual: boolean = canLoadMore(60);
      logInfo(`canLoadMore(newsDataListIndex=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0019
     * @tc.name      PullToRefresh_CanLoadMore_0019
     * @tc.desc      canLoadMore(newsDataListIndex=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0019 begin`);
      const actual: boolean = canLoadMore(65);
      logInfo(`canLoadMore(newsDataListIndex=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0020
     * @tc.name      PullToRefresh_CanLoadMore_0020
     * @tc.desc      canLoadMore(newsDataListIndex=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0020 begin`);
      const actual: boolean = canLoadMore(70);
      logInfo(`canLoadMore(newsDataListIndex=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0021
     * @tc.name      PullToRefresh_CanLoadMore_0021
     * @tc.desc      canLoadMore(newsDataListIndex=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0021 begin`);
      const actual: boolean = canLoadMore(75);
      logInfo(`canLoadMore(newsDataListIndex=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0022
     * @tc.name      PullToRefresh_CanLoadMore_0022
     * @tc.desc      canLoadMore(newsDataListIndex=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0022 begin`);
      const actual: boolean = canLoadMore(80);
      logInfo(`canLoadMore(newsDataListIndex=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0023
     * @tc.name      PullToRefresh_CanLoadMore_0023
     * @tc.desc      canLoadMore(newsDataListIndex=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0023 begin`);
      const actual: boolean = canLoadMore(85);
      logInfo(`canLoadMore(newsDataListIndex=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0024
     * @tc.name      PullToRefresh_CanLoadMore_0024
     * @tc.desc      canLoadMore(newsDataListIndex=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0024 begin`);
      const actual: boolean = canLoadMore(90);
      logInfo(`canLoadMore(newsDataListIndex=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0025
     * @tc.name      PullToRefresh_CanLoadMore_0025
     * @tc.desc      canLoadMore(newsDataListIndex=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0025 begin`);
      const actual: boolean = canLoadMore(95);
      logInfo(`canLoadMore(newsDataListIndex=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0026
     * @tc.name      PullToRefresh_CanLoadMore_0026
     * @tc.desc      canLoadMore(newsDataListIndex=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0026 begin`);
      const actual: boolean = canLoadMore(105);
      logInfo(`canLoadMore(newsDataListIndex=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0027
     * @tc.name      PullToRefresh_CanLoadMore_0027
     * @tc.desc      canLoadMore(newsDataListIndex=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0027 begin`);
      const actual: boolean = canLoadMore(110);
      logInfo(`canLoadMore(newsDataListIndex=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0028
     * @tc.name      PullToRefresh_CanLoadMore_0028
     * @tc.desc      canLoadMore(newsDataListIndex=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0028 begin`);
      const actual: boolean = canLoadMore(115);
      logInfo(`canLoadMore(newsDataListIndex=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0029
     * @tc.name      PullToRefresh_CanLoadMore_0029
     * @tc.desc      canLoadMore(newsDataListIndex=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0029 begin`);
      const actual: boolean = canLoadMore(120);
      logInfo(`canLoadMore(newsDataListIndex=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0030
     * @tc.name      PullToRefresh_CanLoadMore_0030
     * @tc.desc      canLoadMore(newsDataListIndex=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0030 begin`);
      const actual: boolean = canLoadMore(125);
      logInfo(`canLoadMore(newsDataListIndex=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0031
     * @tc.name      PullToRefresh_CanLoadMore_0031
     * @tc.desc      canLoadMore(newsDataListIndex=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0031 begin`);
      const actual: boolean = canLoadMore(130);
      logInfo(`canLoadMore(newsDataListIndex=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0032
     * @tc.name      PullToRefresh_CanLoadMore_0032
     * @tc.desc      canLoadMore(newsDataListIndex=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0032 begin`);
      const actual: boolean = canLoadMore(135);
      logInfo(`canLoadMore(newsDataListIndex=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0033
     * @tc.name      PullToRefresh_CanLoadMore_0033
     * @tc.desc      canLoadMore(newsDataListIndex=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0033 begin`);
      const actual: boolean = canLoadMore(140);
      logInfo(`canLoadMore(newsDataListIndex=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0034
     * @tc.name      PullToRefresh_CanLoadMore_0034
     * @tc.desc      canLoadMore(newsDataListIndex=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0034 begin`);
      const actual: boolean = canLoadMore(145);
      logInfo(`canLoadMore(newsDataListIndex=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0035
     * @tc.name      PullToRefresh_CanLoadMore_0035
     * @tc.desc      canLoadMore(newsDataListIndex=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0035 begin`);
      const actual: boolean = canLoadMore(150);
      logInfo(`canLoadMore(newsDataListIndex=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0036
     * @tc.name      PullToRefresh_CanLoadMore_0036
     * @tc.desc      canLoadMore(newsDataListIndex=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0036 begin`);
      const actual: boolean = canLoadMore(155);
      logInfo(`canLoadMore(newsDataListIndex=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0037
     * @tc.name      PullToRefresh_CanLoadMore_0037
     * @tc.desc      canLoadMore(newsDataListIndex=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0037 begin`);
      const actual: boolean = canLoadMore(160);
      logInfo(`canLoadMore(newsDataListIndex=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0038
     * @tc.name      PullToRefresh_CanLoadMore_0038
     * @tc.desc      canLoadMore(newsDataListIndex=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0038 begin`);
      const actual: boolean = canLoadMore(165);
      logInfo(`canLoadMore(newsDataListIndex=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0039
     * @tc.name      PullToRefresh_CanLoadMore_0039
     * @tc.desc      canLoadMore(newsDataListIndex=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0039 begin`);
      const actual: boolean = canLoadMore(170);
      logInfo(`canLoadMore(newsDataListIndex=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0040
     * @tc.name      PullToRefresh_CanLoadMore_0040
     * @tc.desc      canLoadMore(newsDataListIndex=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0040 begin`);
      const actual: boolean = canLoadMore(175);
      logInfo(`canLoadMore(newsDataListIndex=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0041
     * @tc.name      PullToRefresh_CanLoadMore_0041
     * @tc.desc      canLoadMore(newsDataListIndex=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0041 begin`);
      const actual: boolean = canLoadMore(180);
      logInfo(`canLoadMore(newsDataListIndex=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0042
     * @tc.name      PullToRefresh_CanLoadMore_0042
     * @tc.desc      canLoadMore(newsDataListIndex=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0042 begin`);
      const actual: boolean = canLoadMore(185);
      logInfo(`canLoadMore(newsDataListIndex=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0043
     * @tc.name      PullToRefresh_CanLoadMore_0043
     * @tc.desc      canLoadMore(newsDataListIndex=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0043 begin`);
      const actual: boolean = canLoadMore(190);
      logInfo(`canLoadMore(newsDataListIndex=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0044
     * @tc.name      PullToRefresh_CanLoadMore_0044
     * @tc.desc      canLoadMore(newsDataListIndex=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0044 begin`);
      const actual: boolean = canLoadMore(195);
      logInfo(`canLoadMore(newsDataListIndex=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0045
     * @tc.name      PullToRefresh_CanLoadMore_0045
     * @tc.desc      canLoadMore(newsDataListIndex=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0045 begin`);
      const actual: boolean = canLoadMore(200);
      logInfo(`canLoadMore(newsDataListIndex=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0046
     * @tc.name      PullToRefresh_CanLoadMore_0046
     * @tc.desc      canLoadMore(newsDataListIndex=-50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_CanLoadMore_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CanLoadMore_0046 begin`);
      const actual: boolean = canLoadMore(-50);
      logInfo(`canLoadMore(newsDataListIndex=-50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanLoadMore_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0047
     * @tc.name      PullToRefresh_CanLoadMore_0047
     * @tc.desc      canLoadMore(newsDataListIndex=138) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0047 begin`);
      const actual: boolean = canLoadMore(138);
      logInfo(`canLoadMore(newsDataListIndex=138): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0048
     * @tc.name      PullToRefresh_CanLoadMore_0048
     * @tc.desc      canLoadMore(newsDataListIndex=159) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0048 begin`);
      const actual: boolean = canLoadMore(159);
      logInfo(`canLoadMore(newsDataListIndex=159): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0049
     * @tc.name      PullToRefresh_CanLoadMore_0049
     * @tc.desc      canLoadMore(newsDataListIndex=96) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0049 begin`);
      const actual: boolean = canLoadMore(96);
      logInfo(`canLoadMore(newsDataListIndex=96): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_CAN_LOAD_MORE_0050
     * @tc.name      PullToRefresh_CanLoadMore_0050
     * @tc.desc      canLoadMore(newsDataListIndex=34) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_CanLoadMore_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CanLoadMore_0050 begin`);
      const actual: boolean = canLoadMore(34);
      logInfo(`canLoadMore(newsDataListIndex=34): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanLoadMore_0050 end`);
    });
  });
}
