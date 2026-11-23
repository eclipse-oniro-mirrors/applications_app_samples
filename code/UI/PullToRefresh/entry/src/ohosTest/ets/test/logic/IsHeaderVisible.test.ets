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
import { isHeaderVisible } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isHeaderVisible (50 cases). */
export default function isHeaderVisibleTest(): void {
  describe('IsHeaderVisibleTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0001
     * @tc.name      PullToRefresh_IsHeaderVisible_0001
     * @tc.desc      isHeaderVisible(state=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsHeaderVisible_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0001 begin`);
      const actual: boolean = isHeaderVisible(0);
      logInfo(`isHeaderVisible(state=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0002
     * @tc.name      PullToRefresh_IsHeaderVisible_0002
     * @tc.desc      isHeaderVisible(state=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsHeaderVisible_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0002 begin`);
      const actual: boolean = isHeaderVisible(2);
      logInfo(`isHeaderVisible(state=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsHeaderVisible_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0003
     * @tc.name      PullToRefresh_IsHeaderVisible_0003
     * @tc.desc      isHeaderVisible(state=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0003 begin`);
      const actual: boolean = isHeaderVisible(1);
      logInfo(`isHeaderVisible(state=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0004
     * @tc.name      PullToRefresh_IsHeaderVisible_0004
     * @tc.desc      isHeaderVisible(state=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsHeaderVisible_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0004 begin`);
      const actual: boolean = isHeaderVisible(-1);
      logInfo(`isHeaderVisible(state=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0005
     * @tc.name      PullToRefresh_IsHeaderVisible_0005
     * @tc.desc      isHeaderVisible(state=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0005 begin`);
      const actual: boolean = isHeaderVisible(3);
      logInfo(`isHeaderVisible(state=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0006
     * @tc.name      PullToRefresh_IsHeaderVisible_0006
     * @tc.desc      isHeaderVisible(state=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0006 begin`);
      const actual: boolean = isHeaderVisible(10);
      logInfo(`isHeaderVisible(state=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0007
     * @tc.name      PullToRefresh_IsHeaderVisible_0007
     * @tc.desc      isHeaderVisible(state=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0007 begin`);
      const actual: boolean = isHeaderVisible(100);
      logInfo(`isHeaderVisible(state=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0008
     * @tc.name      PullToRefresh_IsHeaderVisible_0008
     * @tc.desc      isHeaderVisible(state=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0008 begin`);
      const actual: boolean = isHeaderVisible(5);
      logInfo(`isHeaderVisible(state=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0009
     * @tc.name      PullToRefresh_IsHeaderVisible_0009
     * @tc.desc      isHeaderVisible(state=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0009 begin`);
      const actual: boolean = isHeaderVisible(15);
      logInfo(`isHeaderVisible(state=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0010
     * @tc.name      PullToRefresh_IsHeaderVisible_0010
     * @tc.desc      isHeaderVisible(state=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0010 begin`);
      const actual: boolean = isHeaderVisible(20);
      logInfo(`isHeaderVisible(state=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0011
     * @tc.name      PullToRefresh_IsHeaderVisible_0011
     * @tc.desc      isHeaderVisible(state=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0011 begin`);
      const actual: boolean = isHeaderVisible(25);
      logInfo(`isHeaderVisible(state=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0012
     * @tc.name      PullToRefresh_IsHeaderVisible_0012
     * @tc.desc      isHeaderVisible(state=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0012 begin`);
      const actual: boolean = isHeaderVisible(30);
      logInfo(`isHeaderVisible(state=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0013
     * @tc.name      PullToRefresh_IsHeaderVisible_0013
     * @tc.desc      isHeaderVisible(state=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0013 begin`);
      const actual: boolean = isHeaderVisible(35);
      logInfo(`isHeaderVisible(state=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0014
     * @tc.name      PullToRefresh_IsHeaderVisible_0014
     * @tc.desc      isHeaderVisible(state=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0014 begin`);
      const actual: boolean = isHeaderVisible(40);
      logInfo(`isHeaderVisible(state=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0015
     * @tc.name      PullToRefresh_IsHeaderVisible_0015
     * @tc.desc      isHeaderVisible(state=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0015 begin`);
      const actual: boolean = isHeaderVisible(45);
      logInfo(`isHeaderVisible(state=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0016
     * @tc.name      PullToRefresh_IsHeaderVisible_0016
     * @tc.desc      isHeaderVisible(state=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0016 begin`);
      const actual: boolean = isHeaderVisible(50);
      logInfo(`isHeaderVisible(state=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0017
     * @tc.name      PullToRefresh_IsHeaderVisible_0017
     * @tc.desc      isHeaderVisible(state=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0017 begin`);
      const actual: boolean = isHeaderVisible(55);
      logInfo(`isHeaderVisible(state=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0018
     * @tc.name      PullToRefresh_IsHeaderVisible_0018
     * @tc.desc      isHeaderVisible(state=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0018 begin`);
      const actual: boolean = isHeaderVisible(60);
      logInfo(`isHeaderVisible(state=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0019
     * @tc.name      PullToRefresh_IsHeaderVisible_0019
     * @tc.desc      isHeaderVisible(state=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0019 begin`);
      const actual: boolean = isHeaderVisible(65);
      logInfo(`isHeaderVisible(state=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0020
     * @tc.name      PullToRefresh_IsHeaderVisible_0020
     * @tc.desc      isHeaderVisible(state=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0020 begin`);
      const actual: boolean = isHeaderVisible(70);
      logInfo(`isHeaderVisible(state=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0021
     * @tc.name      PullToRefresh_IsHeaderVisible_0021
     * @tc.desc      isHeaderVisible(state=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0021 begin`);
      const actual: boolean = isHeaderVisible(75);
      logInfo(`isHeaderVisible(state=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0022
     * @tc.name      PullToRefresh_IsHeaderVisible_0022
     * @tc.desc      isHeaderVisible(state=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0022 begin`);
      const actual: boolean = isHeaderVisible(80);
      logInfo(`isHeaderVisible(state=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0023
     * @tc.name      PullToRefresh_IsHeaderVisible_0023
     * @tc.desc      isHeaderVisible(state=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0023 begin`);
      const actual: boolean = isHeaderVisible(85);
      logInfo(`isHeaderVisible(state=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0024
     * @tc.name      PullToRefresh_IsHeaderVisible_0024
     * @tc.desc      isHeaderVisible(state=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0024 begin`);
      const actual: boolean = isHeaderVisible(90);
      logInfo(`isHeaderVisible(state=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0025
     * @tc.name      PullToRefresh_IsHeaderVisible_0025
     * @tc.desc      isHeaderVisible(state=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0025 begin`);
      const actual: boolean = isHeaderVisible(95);
      logInfo(`isHeaderVisible(state=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0026
     * @tc.name      PullToRefresh_IsHeaderVisible_0026
     * @tc.desc      isHeaderVisible(state=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0026 begin`);
      const actual: boolean = isHeaderVisible(105);
      logInfo(`isHeaderVisible(state=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0027
     * @tc.name      PullToRefresh_IsHeaderVisible_0027
     * @tc.desc      isHeaderVisible(state=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0027 begin`);
      const actual: boolean = isHeaderVisible(110);
      logInfo(`isHeaderVisible(state=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0028
     * @tc.name      PullToRefresh_IsHeaderVisible_0028
     * @tc.desc      isHeaderVisible(state=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0028 begin`);
      const actual: boolean = isHeaderVisible(115);
      logInfo(`isHeaderVisible(state=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0029
     * @tc.name      PullToRefresh_IsHeaderVisible_0029
     * @tc.desc      isHeaderVisible(state=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0029 begin`);
      const actual: boolean = isHeaderVisible(120);
      logInfo(`isHeaderVisible(state=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0030
     * @tc.name      PullToRefresh_IsHeaderVisible_0030
     * @tc.desc      isHeaderVisible(state=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0030 begin`);
      const actual: boolean = isHeaderVisible(125);
      logInfo(`isHeaderVisible(state=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0031
     * @tc.name      PullToRefresh_IsHeaderVisible_0031
     * @tc.desc      isHeaderVisible(state=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0031 begin`);
      const actual: boolean = isHeaderVisible(130);
      logInfo(`isHeaderVisible(state=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0032
     * @tc.name      PullToRefresh_IsHeaderVisible_0032
     * @tc.desc      isHeaderVisible(state=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0032 begin`);
      const actual: boolean = isHeaderVisible(135);
      logInfo(`isHeaderVisible(state=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0033
     * @tc.name      PullToRefresh_IsHeaderVisible_0033
     * @tc.desc      isHeaderVisible(state=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0033 begin`);
      const actual: boolean = isHeaderVisible(140);
      logInfo(`isHeaderVisible(state=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0034
     * @tc.name      PullToRefresh_IsHeaderVisible_0034
     * @tc.desc      isHeaderVisible(state=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0034 begin`);
      const actual: boolean = isHeaderVisible(145);
      logInfo(`isHeaderVisible(state=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0035
     * @tc.name      PullToRefresh_IsHeaderVisible_0035
     * @tc.desc      isHeaderVisible(state=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0035 begin`);
      const actual: boolean = isHeaderVisible(150);
      logInfo(`isHeaderVisible(state=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0036
     * @tc.name      PullToRefresh_IsHeaderVisible_0036
     * @tc.desc      isHeaderVisible(state=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0036 begin`);
      const actual: boolean = isHeaderVisible(155);
      logInfo(`isHeaderVisible(state=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0037
     * @tc.name      PullToRefresh_IsHeaderVisible_0037
     * @tc.desc      isHeaderVisible(state=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0037 begin`);
      const actual: boolean = isHeaderVisible(160);
      logInfo(`isHeaderVisible(state=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0038
     * @tc.name      PullToRefresh_IsHeaderVisible_0038
     * @tc.desc      isHeaderVisible(state=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0038 begin`);
      const actual: boolean = isHeaderVisible(165);
      logInfo(`isHeaderVisible(state=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0039
     * @tc.name      PullToRefresh_IsHeaderVisible_0039
     * @tc.desc      isHeaderVisible(state=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0039 begin`);
      const actual: boolean = isHeaderVisible(170);
      logInfo(`isHeaderVisible(state=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0040
     * @tc.name      PullToRefresh_IsHeaderVisible_0040
     * @tc.desc      isHeaderVisible(state=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0040 begin`);
      const actual: boolean = isHeaderVisible(175);
      logInfo(`isHeaderVisible(state=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0041
     * @tc.name      PullToRefresh_IsHeaderVisible_0041
     * @tc.desc      isHeaderVisible(state=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0041 begin`);
      const actual: boolean = isHeaderVisible(180);
      logInfo(`isHeaderVisible(state=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0042
     * @tc.name      PullToRefresh_IsHeaderVisible_0042
     * @tc.desc      isHeaderVisible(state=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0042 begin`);
      const actual: boolean = isHeaderVisible(185);
      logInfo(`isHeaderVisible(state=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0043
     * @tc.name      PullToRefresh_IsHeaderVisible_0043
     * @tc.desc      isHeaderVisible(state=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0043 begin`);
      const actual: boolean = isHeaderVisible(190);
      logInfo(`isHeaderVisible(state=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0044
     * @tc.name      PullToRefresh_IsHeaderVisible_0044
     * @tc.desc      isHeaderVisible(state=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0044 begin`);
      const actual: boolean = isHeaderVisible(195);
      logInfo(`isHeaderVisible(state=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0045
     * @tc.name      PullToRefresh_IsHeaderVisible_0045
     * @tc.desc      isHeaderVisible(state=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0045 begin`);
      const actual: boolean = isHeaderVisible(200);
      logInfo(`isHeaderVisible(state=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0046
     * @tc.name      PullToRefresh_IsHeaderVisible_0046
     * @tc.desc      isHeaderVisible(state=-29) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsHeaderVisible_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0046 begin`);
      const actual: boolean = isHeaderVisible(-29);
      logInfo(`isHeaderVisible(state=-29): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0047
     * @tc.name      PullToRefresh_IsHeaderVisible_0047
     * @tc.desc      isHeaderVisible(state=40.9) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0047 begin`);
      const actual: boolean = isHeaderVisible(40.9);
      logInfo(`isHeaderVisible(state=40.9): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0048
     * @tc.name      PullToRefresh_IsHeaderVisible_0048
     * @tc.desc      isHeaderVisible(state=48) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsHeaderVisible_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0048 begin`);
      const actual: boolean = isHeaderVisible(48);
      logInfo(`isHeaderVisible(state=48): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0049
     * @tc.name      PullToRefresh_IsHeaderVisible_0049
     * @tc.desc      isHeaderVisible(state=-12) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsHeaderVisible_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0049 begin`);
      const actual: boolean = isHeaderVisible(-12);
      logInfo(`isHeaderVisible(state=-12): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_HEADER_VISIBLE_0050
     * @tc.name      PullToRefresh_IsHeaderVisible_0050
     * @tc.desc      isHeaderVisible(state=-74) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsHeaderVisible_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeaderVisible_0050 begin`);
      const actual: boolean = isHeaderVisible(-74);
      logInfo(`isHeaderVisible(state=-74): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeaderVisible_0050 end`);
    });
  });
}
