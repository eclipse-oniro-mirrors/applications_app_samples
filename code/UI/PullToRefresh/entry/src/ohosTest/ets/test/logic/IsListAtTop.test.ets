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
import { isListAtTop } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isListAtTop (50 cases). */
export default function isListAtTopTest(): void {
  describe('IsListAtTopTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0001
     * @tc.name      PullToRefresh_IsListAtTop_0001
     * @tc.desc      isListAtTop(yOffset=-100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsListAtTop_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsListAtTop_0001 begin`);
      const actual: boolean = isListAtTop(-100);
      logInfo(`isListAtTop(yOffset=-100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0002
     * @tc.name      PullToRefresh_IsListAtTop_0002
     * @tc.desc      isListAtTop(yOffset=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsListAtTop_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsListAtTop_0002 begin`);
      const actual: boolean = isListAtTop(0);
      logInfo(`isListAtTop(yOffset=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListAtTop_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0003
     * @tc.name      PullToRefresh_IsListAtTop_0003
     * @tc.desc      isListAtTop(yOffset=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsListAtTop_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsListAtTop_0003 begin`);
      const actual: boolean = isListAtTop(-1);
      logInfo(`isListAtTop(yOffset=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0004
     * @tc.name      PullToRefresh_IsListAtTop_0004
     * @tc.desc      isListAtTop(yOffset=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_IsListAtTop_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}IsListAtTop_0004 begin`);
      const actual: boolean = isListAtTop(1);
      logInfo(`isListAtTop(yOffset=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0005
     * @tc.name      PullToRefresh_IsListAtTop_0005
     * @tc.desc      isListAtTop(yOffset=-0.0001) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_IsListAtTop_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}IsListAtTop_0005 begin`);
      const actual: boolean = isListAtTop(-0.0001);
      logInfo(`isListAtTop(yOffset=-0.0001): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0006
     * @tc.name      PullToRefresh_IsListAtTop_0006
     * @tc.desc      isListAtTop(yOffset=-0.0002) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0006 begin`);
      const actual: boolean = isListAtTop(-0.0002);
      logInfo(`isListAtTop(yOffset=-0.0002): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0007
     * @tc.name      PullToRefresh_IsListAtTop_0007
     * @tc.desc      isListAtTop(yOffset=-0.00005) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0007 begin`);
      const actual: boolean = isListAtTop(-0.00005);
      logInfo(`isListAtTop(yOffset=-0.00005): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListAtTop_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0008
     * @tc.name      PullToRefresh_IsListAtTop_0008
     * @tc.desc      isListAtTop(yOffset=0.001) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_IsListAtTop_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}IsListAtTop_0008 begin`);
      const actual: boolean = isListAtTop(0.001);
      logInfo(`isListAtTop(yOffset=0.001): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0009
     * @tc.name      PullToRefresh_IsListAtTop_0009
     * @tc.desc      isListAtTop(yOffset=0.002) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0009 begin`);
      const actual: boolean = isListAtTop(0.002);
      logInfo(`isListAtTop(yOffset=0.002): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0010
     * @tc.name      PullToRefresh_IsListAtTop_0010
     * @tc.desc      isListAtTop(yOffset=0.0005) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0010 begin`);
      const actual: boolean = isListAtTop(0.0005);
      logInfo(`isListAtTop(yOffset=0.0005): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListAtTop_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0011
     * @tc.name      PullToRefresh_IsListAtTop_0011
     * @tc.desc      isListAtTop(yOffset=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0011 begin`);
      const actual: boolean = isListAtTop(50);
      logInfo(`isListAtTop(yOffset=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0012
     * @tc.name      PullToRefresh_IsListAtTop_0012
     * @tc.desc      isListAtTop(yOffset=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0012 begin`);
      const actual: boolean = isListAtTop(100);
      logInfo(`isListAtTop(yOffset=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0013
     * @tc.name      PullToRefresh_IsListAtTop_0013
     * @tc.desc      isListAtTop(yOffset=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0013 begin`);
      const actual: boolean = isListAtTop(2);
      logInfo(`isListAtTop(yOffset=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0014
     * @tc.name      PullToRefresh_IsListAtTop_0014
     * @tc.desc      isListAtTop(yOffset=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0014 begin`);
      const actual: boolean = isListAtTop(3);
      logInfo(`isListAtTop(yOffset=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0015
     * @tc.name      PullToRefresh_IsListAtTop_0015
     * @tc.desc      isListAtTop(yOffset=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0015 begin`);
      const actual: boolean = isListAtTop(10);
      logInfo(`isListAtTop(yOffset=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0016
     * @tc.name      PullToRefresh_IsListAtTop_0016
     * @tc.desc      isListAtTop(yOffset=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0016 begin`);
      const actual: boolean = isListAtTop(5);
      logInfo(`isListAtTop(yOffset=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0017
     * @tc.name      PullToRefresh_IsListAtTop_0017
     * @tc.desc      isListAtTop(yOffset=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0017 begin`);
      const actual: boolean = isListAtTop(15);
      logInfo(`isListAtTop(yOffset=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0018
     * @tc.name      PullToRefresh_IsListAtTop_0018
     * @tc.desc      isListAtTop(yOffset=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0018 begin`);
      const actual: boolean = isListAtTop(20);
      logInfo(`isListAtTop(yOffset=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0019
     * @tc.name      PullToRefresh_IsListAtTop_0019
     * @tc.desc      isListAtTop(yOffset=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0019 begin`);
      const actual: boolean = isListAtTop(25);
      logInfo(`isListAtTop(yOffset=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0020
     * @tc.name      PullToRefresh_IsListAtTop_0020
     * @tc.desc      isListAtTop(yOffset=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0020 begin`);
      const actual: boolean = isListAtTop(30);
      logInfo(`isListAtTop(yOffset=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0021
     * @tc.name      PullToRefresh_IsListAtTop_0021
     * @tc.desc      isListAtTop(yOffset=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0021 begin`);
      const actual: boolean = isListAtTop(35);
      logInfo(`isListAtTop(yOffset=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0022
     * @tc.name      PullToRefresh_IsListAtTop_0022
     * @tc.desc      isListAtTop(yOffset=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0022 begin`);
      const actual: boolean = isListAtTop(40);
      logInfo(`isListAtTop(yOffset=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0023
     * @tc.name      PullToRefresh_IsListAtTop_0023
     * @tc.desc      isListAtTop(yOffset=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0023 begin`);
      const actual: boolean = isListAtTop(45);
      logInfo(`isListAtTop(yOffset=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0024
     * @tc.name      PullToRefresh_IsListAtTop_0024
     * @tc.desc      isListAtTop(yOffset=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0024 begin`);
      const actual: boolean = isListAtTop(55);
      logInfo(`isListAtTop(yOffset=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0025
     * @tc.name      PullToRefresh_IsListAtTop_0025
     * @tc.desc      isListAtTop(yOffset=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0025 begin`);
      const actual: boolean = isListAtTop(60);
      logInfo(`isListAtTop(yOffset=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0026
     * @tc.name      PullToRefresh_IsListAtTop_0026
     * @tc.desc      isListAtTop(yOffset=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0026 begin`);
      const actual: boolean = isListAtTop(65);
      logInfo(`isListAtTop(yOffset=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0027
     * @tc.name      PullToRefresh_IsListAtTop_0027
     * @tc.desc      isListAtTop(yOffset=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0027 begin`);
      const actual: boolean = isListAtTop(70);
      logInfo(`isListAtTop(yOffset=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0028
     * @tc.name      PullToRefresh_IsListAtTop_0028
     * @tc.desc      isListAtTop(yOffset=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0028 begin`);
      const actual: boolean = isListAtTop(75);
      logInfo(`isListAtTop(yOffset=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0029
     * @tc.name      PullToRefresh_IsListAtTop_0029
     * @tc.desc      isListAtTop(yOffset=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0029 begin`);
      const actual: boolean = isListAtTop(80);
      logInfo(`isListAtTop(yOffset=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0030
     * @tc.name      PullToRefresh_IsListAtTop_0030
     * @tc.desc      isListAtTop(yOffset=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0030 begin`);
      const actual: boolean = isListAtTop(85);
      logInfo(`isListAtTop(yOffset=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0031
     * @tc.name      PullToRefresh_IsListAtTop_0031
     * @tc.desc      isListAtTop(yOffset=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0031 begin`);
      const actual: boolean = isListAtTop(90);
      logInfo(`isListAtTop(yOffset=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0032
     * @tc.name      PullToRefresh_IsListAtTop_0032
     * @tc.desc      isListAtTop(yOffset=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0032 begin`);
      const actual: boolean = isListAtTop(95);
      logInfo(`isListAtTop(yOffset=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0033
     * @tc.name      PullToRefresh_IsListAtTop_0033
     * @tc.desc      isListAtTop(yOffset=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0033 begin`);
      const actual: boolean = isListAtTop(105);
      logInfo(`isListAtTop(yOffset=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0034
     * @tc.name      PullToRefresh_IsListAtTop_0034
     * @tc.desc      isListAtTop(yOffset=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0034 begin`);
      const actual: boolean = isListAtTop(110);
      logInfo(`isListAtTop(yOffset=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0035
     * @tc.name      PullToRefresh_IsListAtTop_0035
     * @tc.desc      isListAtTop(yOffset=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0035 begin`);
      const actual: boolean = isListAtTop(115);
      logInfo(`isListAtTop(yOffset=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0036
     * @tc.name      PullToRefresh_IsListAtTop_0036
     * @tc.desc      isListAtTop(yOffset=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0036 begin`);
      const actual: boolean = isListAtTop(120);
      logInfo(`isListAtTop(yOffset=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0037
     * @tc.name      PullToRefresh_IsListAtTop_0037
     * @tc.desc      isListAtTop(yOffset=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0037 begin`);
      const actual: boolean = isListAtTop(125);
      logInfo(`isListAtTop(yOffset=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0038
     * @tc.name      PullToRefresh_IsListAtTop_0038
     * @tc.desc      isListAtTop(yOffset=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0038 begin`);
      const actual: boolean = isListAtTop(130);
      logInfo(`isListAtTop(yOffset=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0039
     * @tc.name      PullToRefresh_IsListAtTop_0039
     * @tc.desc      isListAtTop(yOffset=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0039 begin`);
      const actual: boolean = isListAtTop(135);
      logInfo(`isListAtTop(yOffset=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0040
     * @tc.name      PullToRefresh_IsListAtTop_0040
     * @tc.desc      isListAtTop(yOffset=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0040 begin`);
      const actual: boolean = isListAtTop(140);
      logInfo(`isListAtTop(yOffset=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0041
     * @tc.name      PullToRefresh_IsListAtTop_0041
     * @tc.desc      isListAtTop(yOffset=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0041 begin`);
      const actual: boolean = isListAtTop(145);
      logInfo(`isListAtTop(yOffset=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0042
     * @tc.name      PullToRefresh_IsListAtTop_0042
     * @tc.desc      isListAtTop(yOffset=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0042 begin`);
      const actual: boolean = isListAtTop(150);
      logInfo(`isListAtTop(yOffset=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0043
     * @tc.name      PullToRefresh_IsListAtTop_0043
     * @tc.desc      isListAtTop(yOffset=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0043 begin`);
      const actual: boolean = isListAtTop(155);
      logInfo(`isListAtTop(yOffset=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0044
     * @tc.name      PullToRefresh_IsListAtTop_0044
     * @tc.desc      isListAtTop(yOffset=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0044 begin`);
      const actual: boolean = isListAtTop(160);
      logInfo(`isListAtTop(yOffset=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0045
     * @tc.name      PullToRefresh_IsListAtTop_0045
     * @tc.desc      isListAtTop(yOffset=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0045 begin`);
      const actual: boolean = isListAtTop(165);
      logInfo(`isListAtTop(yOffset=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0046
     * @tc.name      PullToRefresh_IsListAtTop_0046
     * @tc.desc      isListAtTop(yOffset=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0046 begin`);
      const actual: boolean = isListAtTop(170);
      logInfo(`isListAtTop(yOffset=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0047
     * @tc.name      PullToRefresh_IsListAtTop_0047
     * @tc.desc      isListAtTop(yOffset=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0047 begin`);
      const actual: boolean = isListAtTop(175);
      logInfo(`isListAtTop(yOffset=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0048
     * @tc.name      PullToRefresh_IsListAtTop_0048
     * @tc.desc      isListAtTop(yOffset=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0048 begin`);
      const actual: boolean = isListAtTop(180);
      logInfo(`isListAtTop(yOffset=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0049
     * @tc.name      PullToRefresh_IsListAtTop_0049
     * @tc.desc      isListAtTop(yOffset=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0049 begin`);
      const actual: boolean = isListAtTop(185);
      logInfo(`isListAtTop(yOffset=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_LIST_AT_TOP_0050
     * @tc.name      PullToRefresh_IsListAtTop_0050
     * @tc.desc      isListAtTop(yOffset=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsListAtTop_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsListAtTop_0050 begin`);
      const actual: boolean = isListAtTop(190);
      logInfo(`isListAtTop(yOffset=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListAtTop_0050 end`);
    });
  });
}
