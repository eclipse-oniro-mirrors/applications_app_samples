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
import { isFooterVisible } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isFooterVisible (50 cases). */
export default function isFooterVisibleTest(): void {
  describe('IsFooterVisibleTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0001
     * @tc.name      PullToRefresh_IsFooterVisible_0001
     * @tc.desc      isFooterVisible(state=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsFooterVisible_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0001 begin`);
      const actual: boolean = isFooterVisible(0);
      logInfo(`isFooterVisible(state=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0002
     * @tc.name      PullToRefresh_IsFooterVisible_0002
     * @tc.desc      isFooterVisible(state=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsFooterVisible_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0002 begin`);
      const actual: boolean = isFooterVisible(5);
      logInfo(`isFooterVisible(state=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsFooterVisible_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0003
     * @tc.name      PullToRefresh_IsFooterVisible_0003
     * @tc.desc      isFooterVisible(state=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0003 begin`);
      const actual: boolean = isFooterVisible(1);
      logInfo(`isFooterVisible(state=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0004
     * @tc.name      PullToRefresh_IsFooterVisible_0004
     * @tc.desc      isFooterVisible(state=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsFooterVisible_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0004 begin`);
      const actual: boolean = isFooterVisible(-1);
      logInfo(`isFooterVisible(state=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0005
     * @tc.name      PullToRefresh_IsFooterVisible_0005
     * @tc.desc      isFooterVisible(state=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0005 begin`);
      const actual: boolean = isFooterVisible(2);
      logInfo(`isFooterVisible(state=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0006
     * @tc.name      PullToRefresh_IsFooterVisible_0006
     * @tc.desc      isFooterVisible(state=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0006 begin`);
      const actual: boolean = isFooterVisible(3);
      logInfo(`isFooterVisible(state=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0007
     * @tc.name      PullToRefresh_IsFooterVisible_0007
     * @tc.desc      isFooterVisible(state=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0007 begin`);
      const actual: boolean = isFooterVisible(10);
      logInfo(`isFooterVisible(state=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0008
     * @tc.name      PullToRefresh_IsFooterVisible_0008
     * @tc.desc      isFooterVisible(state=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0008 begin`);
      const actual: boolean = isFooterVisible(100);
      logInfo(`isFooterVisible(state=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0009
     * @tc.name      PullToRefresh_IsFooterVisible_0009
     * @tc.desc      isFooterVisible(state=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0009 begin`);
      const actual: boolean = isFooterVisible(15);
      logInfo(`isFooterVisible(state=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0010
     * @tc.name      PullToRefresh_IsFooterVisible_0010
     * @tc.desc      isFooterVisible(state=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0010 begin`);
      const actual: boolean = isFooterVisible(20);
      logInfo(`isFooterVisible(state=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0011
     * @tc.name      PullToRefresh_IsFooterVisible_0011
     * @tc.desc      isFooterVisible(state=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0011 begin`);
      const actual: boolean = isFooterVisible(25);
      logInfo(`isFooterVisible(state=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0012
     * @tc.name      PullToRefresh_IsFooterVisible_0012
     * @tc.desc      isFooterVisible(state=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0012 begin`);
      const actual: boolean = isFooterVisible(30);
      logInfo(`isFooterVisible(state=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0013
     * @tc.name      PullToRefresh_IsFooterVisible_0013
     * @tc.desc      isFooterVisible(state=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0013 begin`);
      const actual: boolean = isFooterVisible(35);
      logInfo(`isFooterVisible(state=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0014
     * @tc.name      PullToRefresh_IsFooterVisible_0014
     * @tc.desc      isFooterVisible(state=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0014 begin`);
      const actual: boolean = isFooterVisible(40);
      logInfo(`isFooterVisible(state=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0015
     * @tc.name      PullToRefresh_IsFooterVisible_0015
     * @tc.desc      isFooterVisible(state=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0015 begin`);
      const actual: boolean = isFooterVisible(45);
      logInfo(`isFooterVisible(state=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0016
     * @tc.name      PullToRefresh_IsFooterVisible_0016
     * @tc.desc      isFooterVisible(state=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0016 begin`);
      const actual: boolean = isFooterVisible(50);
      logInfo(`isFooterVisible(state=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0017
     * @tc.name      PullToRefresh_IsFooterVisible_0017
     * @tc.desc      isFooterVisible(state=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0017 begin`);
      const actual: boolean = isFooterVisible(55);
      logInfo(`isFooterVisible(state=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0018
     * @tc.name      PullToRefresh_IsFooterVisible_0018
     * @tc.desc      isFooterVisible(state=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0018 begin`);
      const actual: boolean = isFooterVisible(60);
      logInfo(`isFooterVisible(state=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0019
     * @tc.name      PullToRefresh_IsFooterVisible_0019
     * @tc.desc      isFooterVisible(state=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0019 begin`);
      const actual: boolean = isFooterVisible(65);
      logInfo(`isFooterVisible(state=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0020
     * @tc.name      PullToRefresh_IsFooterVisible_0020
     * @tc.desc      isFooterVisible(state=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0020 begin`);
      const actual: boolean = isFooterVisible(70);
      logInfo(`isFooterVisible(state=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0021
     * @tc.name      PullToRefresh_IsFooterVisible_0021
     * @tc.desc      isFooterVisible(state=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0021 begin`);
      const actual: boolean = isFooterVisible(75);
      logInfo(`isFooterVisible(state=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0022
     * @tc.name      PullToRefresh_IsFooterVisible_0022
     * @tc.desc      isFooterVisible(state=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0022 begin`);
      const actual: boolean = isFooterVisible(80);
      logInfo(`isFooterVisible(state=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0023
     * @tc.name      PullToRefresh_IsFooterVisible_0023
     * @tc.desc      isFooterVisible(state=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0023 begin`);
      const actual: boolean = isFooterVisible(85);
      logInfo(`isFooterVisible(state=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0024
     * @tc.name      PullToRefresh_IsFooterVisible_0024
     * @tc.desc      isFooterVisible(state=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0024 begin`);
      const actual: boolean = isFooterVisible(90);
      logInfo(`isFooterVisible(state=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0025
     * @tc.name      PullToRefresh_IsFooterVisible_0025
     * @tc.desc      isFooterVisible(state=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0025 begin`);
      const actual: boolean = isFooterVisible(95);
      logInfo(`isFooterVisible(state=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0026
     * @tc.name      PullToRefresh_IsFooterVisible_0026
     * @tc.desc      isFooterVisible(state=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0026 begin`);
      const actual: boolean = isFooterVisible(105);
      logInfo(`isFooterVisible(state=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0027
     * @tc.name      PullToRefresh_IsFooterVisible_0027
     * @tc.desc      isFooterVisible(state=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0027 begin`);
      const actual: boolean = isFooterVisible(110);
      logInfo(`isFooterVisible(state=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0028
     * @tc.name      PullToRefresh_IsFooterVisible_0028
     * @tc.desc      isFooterVisible(state=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0028 begin`);
      const actual: boolean = isFooterVisible(115);
      logInfo(`isFooterVisible(state=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0029
     * @tc.name      PullToRefresh_IsFooterVisible_0029
     * @tc.desc      isFooterVisible(state=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0029 begin`);
      const actual: boolean = isFooterVisible(120);
      logInfo(`isFooterVisible(state=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0030
     * @tc.name      PullToRefresh_IsFooterVisible_0030
     * @tc.desc      isFooterVisible(state=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0030 begin`);
      const actual: boolean = isFooterVisible(125);
      logInfo(`isFooterVisible(state=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0031
     * @tc.name      PullToRefresh_IsFooterVisible_0031
     * @tc.desc      isFooterVisible(state=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0031 begin`);
      const actual: boolean = isFooterVisible(130);
      logInfo(`isFooterVisible(state=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0032
     * @tc.name      PullToRefresh_IsFooterVisible_0032
     * @tc.desc      isFooterVisible(state=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0032 begin`);
      const actual: boolean = isFooterVisible(135);
      logInfo(`isFooterVisible(state=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0033
     * @tc.name      PullToRefresh_IsFooterVisible_0033
     * @tc.desc      isFooterVisible(state=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0033 begin`);
      const actual: boolean = isFooterVisible(140);
      logInfo(`isFooterVisible(state=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0034
     * @tc.name      PullToRefresh_IsFooterVisible_0034
     * @tc.desc      isFooterVisible(state=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0034 begin`);
      const actual: boolean = isFooterVisible(145);
      logInfo(`isFooterVisible(state=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0035
     * @tc.name      PullToRefresh_IsFooterVisible_0035
     * @tc.desc      isFooterVisible(state=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0035 begin`);
      const actual: boolean = isFooterVisible(150);
      logInfo(`isFooterVisible(state=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0036
     * @tc.name      PullToRefresh_IsFooterVisible_0036
     * @tc.desc      isFooterVisible(state=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0036 begin`);
      const actual: boolean = isFooterVisible(155);
      logInfo(`isFooterVisible(state=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0037
     * @tc.name      PullToRefresh_IsFooterVisible_0037
     * @tc.desc      isFooterVisible(state=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0037 begin`);
      const actual: boolean = isFooterVisible(160);
      logInfo(`isFooterVisible(state=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0038
     * @tc.name      PullToRefresh_IsFooterVisible_0038
     * @tc.desc      isFooterVisible(state=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0038 begin`);
      const actual: boolean = isFooterVisible(165);
      logInfo(`isFooterVisible(state=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0039
     * @tc.name      PullToRefresh_IsFooterVisible_0039
     * @tc.desc      isFooterVisible(state=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0039 begin`);
      const actual: boolean = isFooterVisible(170);
      logInfo(`isFooterVisible(state=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0040
     * @tc.name      PullToRefresh_IsFooterVisible_0040
     * @tc.desc      isFooterVisible(state=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0040 begin`);
      const actual: boolean = isFooterVisible(175);
      logInfo(`isFooterVisible(state=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0041
     * @tc.name      PullToRefresh_IsFooterVisible_0041
     * @tc.desc      isFooterVisible(state=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0041 begin`);
      const actual: boolean = isFooterVisible(180);
      logInfo(`isFooterVisible(state=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0042
     * @tc.name      PullToRefresh_IsFooterVisible_0042
     * @tc.desc      isFooterVisible(state=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0042 begin`);
      const actual: boolean = isFooterVisible(185);
      logInfo(`isFooterVisible(state=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0043
     * @tc.name      PullToRefresh_IsFooterVisible_0043
     * @tc.desc      isFooterVisible(state=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0043 begin`);
      const actual: boolean = isFooterVisible(190);
      logInfo(`isFooterVisible(state=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0044
     * @tc.name      PullToRefresh_IsFooterVisible_0044
     * @tc.desc      isFooterVisible(state=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0044 begin`);
      const actual: boolean = isFooterVisible(195);
      logInfo(`isFooterVisible(state=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0045
     * @tc.name      PullToRefresh_IsFooterVisible_0045
     * @tc.desc      isFooterVisible(state=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0045 begin`);
      const actual: boolean = isFooterVisible(200);
      logInfo(`isFooterVisible(state=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0046
     * @tc.name      PullToRefresh_IsFooterVisible_0046
     * @tc.desc      isFooterVisible(state=31) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0046 begin`);
      const actual: boolean = isFooterVisible(31);
      logInfo(`isFooterVisible(state=31): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0047
     * @tc.name      PullToRefresh_IsFooterVisible_0047
     * @tc.desc      isFooterVisible(state=76) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0047 begin`);
      const actual: boolean = isFooterVisible(76);
      logInfo(`isFooterVisible(state=76): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0048
     * @tc.name      PullToRefresh_IsFooterVisible_0048
     * @tc.desc      isFooterVisible(state=-85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsFooterVisible_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0048 begin`);
      const actual: boolean = isFooterVisible(-85);
      logInfo(`isFooterVisible(state=-85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0049
     * @tc.name      PullToRefresh_IsFooterVisible_0049
     * @tc.desc      isFooterVisible(state=-33) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsFooterVisible_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0049 begin`);
      const actual: boolean = isFooterVisible(-33);
      logInfo(`isFooterVisible(state=-33): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_FOOTER_VISIBLE_0050
     * @tc.name      PullToRefresh_IsFooterVisible_0050
     * @tc.desc      isFooterVisible(state=163) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsFooterVisible_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFooterVisible_0050 begin`);
      const actual: boolean = isFooterVisible(163);
      logInfo(`isFooterVisible(state=163): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFooterVisible_0050 end`);
    });
  });
}
