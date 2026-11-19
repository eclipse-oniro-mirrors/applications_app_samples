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
import { stateName } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for stateName (59 cases). */
export default function stateNameTest(): void {
  describe('StateNameTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0001
     * @tc.name      PullToRefresh_StateName_0001
     * @tc.desc      stateName(state=0) returns "free"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_StateName_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StateName_0001 begin`);
      const actual: string = stateName(0);
      logInfo(`stateName(state=0): actual=${actual}`);
      expect(actual).assertEqual('free');
      logInfo(`${BUNDLE}StateName_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0002
     * @tc.name      PullToRefresh_StateName_0002
     * @tc.desc      stateName(state=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_StateName_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StateName_0002 begin`);
      const actual: string = stateName(1);
      logInfo(`stateName(state=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0003
     * @tc.name      PullToRefresh_StateName_0003
     * @tc.desc      stateName(state=2) returns "refreshing"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0003 begin`);
      const actual: string = stateName(2);
      logInfo(`stateName(state=2): actual=${actual}`);
      expect(actual).assertEqual('refreshing');
      logInfo(`${BUNDLE}StateName_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0004
     * @tc.name      PullToRefresh_StateName_0004
     * @tc.desc      stateName(state=3) returns "refreshed"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0004 begin`);
      const actual: string = stateName(3);
      logInfo(`stateName(state=3): actual=${actual}`);
      expect(actual).assertEqual('refreshed');
      logInfo(`${BUNDLE}StateName_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0005
     * @tc.name      PullToRefresh_StateName_0005
     * @tc.desc      stateName(state=5) returns "loading"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0005 begin`);
      const actual: string = stateName(5);
      logInfo(`stateName(state=5): actual=${actual}`);
      expect(actual).assertEqual('loading');
      logInfo(`${BUNDLE}StateName_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0006
     * @tc.name      PullToRefresh_StateName_0006
     * @tc.desc      stateName(state=11) returns "pullDown1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0006 begin`);
      const actual: string = stateName(11);
      logInfo(`stateName(state=11): actual=${actual}`);
      expect(actual).assertEqual('pullDown1');
      logInfo(`${BUNDLE}StateName_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0007
     * @tc.name      PullToRefresh_StateName_0007
     * @tc.desc      stateName(state=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_StateName_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StateName_0007 begin`);
      const actual: string = stateName(-1);
      logInfo(`stateName(state=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0008
     * @tc.name      PullToRefresh_StateName_0008
     * @tc.desc      stateName(state=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0008 begin`);
      const actual: string = stateName(10);
      logInfo(`stateName(state=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0009
     * @tc.name      PullToRefresh_StateName_0009
     * @tc.desc      stateName(state=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0009 begin`);
      const actual: string = stateName(100);
      logInfo(`stateName(state=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0010
     * @tc.name      PullToRefresh_StateName_0010
     * @tc.desc      stateName(state=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0010 begin`);
      const actual: string = stateName(15);
      logInfo(`stateName(state=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0011
     * @tc.name      PullToRefresh_StateName_0011
     * @tc.desc      stateName(state=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0011 begin`);
      const actual: string = stateName(20);
      logInfo(`stateName(state=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0012
     * @tc.name      PullToRefresh_StateName_0012
     * @tc.desc      stateName(state=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0012 begin`);
      const actual: string = stateName(25);
      logInfo(`stateName(state=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0013
     * @tc.name      PullToRefresh_StateName_0013
     * @tc.desc      stateName(state=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0013 begin`);
      const actual: string = stateName(30);
      logInfo(`stateName(state=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0014
     * @tc.name      PullToRefresh_StateName_0014
     * @tc.desc      stateName(state=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0014 begin`);
      const actual: string = stateName(35);
      logInfo(`stateName(state=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0015
     * @tc.name      PullToRefresh_StateName_0015
     * @tc.desc      stateName(state=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0015 begin`);
      const actual: string = stateName(40);
      logInfo(`stateName(state=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0016
     * @tc.name      PullToRefresh_StateName_0016
     * @tc.desc      stateName(state=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0016 begin`);
      const actual: string = stateName(45);
      logInfo(`stateName(state=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0017
     * @tc.name      PullToRefresh_StateName_0017
     * @tc.desc      stateName(state=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0017 begin`);
      const actual: string = stateName(50);
      logInfo(`stateName(state=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0018
     * @tc.name      PullToRefresh_StateName_0018
     * @tc.desc      stateName(state=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0018 begin`);
      const actual: string = stateName(55);
      logInfo(`stateName(state=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0019
     * @tc.name      PullToRefresh_StateName_0019
     * @tc.desc      stateName(state=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0019 begin`);
      const actual: string = stateName(60);
      logInfo(`stateName(state=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0020
     * @tc.name      PullToRefresh_StateName_0020
     * @tc.desc      stateName(state=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0020 begin`);
      const actual: string = stateName(65);
      logInfo(`stateName(state=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0021
     * @tc.name      PullToRefresh_StateName_0021
     * @tc.desc      stateName(state=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0021 begin`);
      const actual: string = stateName(70);
      logInfo(`stateName(state=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0022
     * @tc.name      PullToRefresh_StateName_0022
     * @tc.desc      stateName(state=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0022 begin`);
      const actual: string = stateName(75);
      logInfo(`stateName(state=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0023
     * @tc.name      PullToRefresh_StateName_0023
     * @tc.desc      stateName(state=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0023 begin`);
      const actual: string = stateName(80);
      logInfo(`stateName(state=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0024
     * @tc.name      PullToRefresh_StateName_0024
     * @tc.desc      stateName(state=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0024 begin`);
      const actual: string = stateName(85);
      logInfo(`stateName(state=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0025
     * @tc.name      PullToRefresh_StateName_0025
     * @tc.desc      stateName(state=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0025 begin`);
      const actual: string = stateName(90);
      logInfo(`stateName(state=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0026
     * @tc.name      PullToRefresh_StateName_0026
     * @tc.desc      stateName(state=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0026 begin`);
      const actual: string = stateName(95);
      logInfo(`stateName(state=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0027
     * @tc.name      PullToRefresh_StateName_0027
     * @tc.desc      stateName(state=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0027 begin`);
      const actual: string = stateName(105);
      logInfo(`stateName(state=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0028
     * @tc.name      PullToRefresh_StateName_0028
     * @tc.desc      stateName(state=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0028 begin`);
      const actual: string = stateName(110);
      logInfo(`stateName(state=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0029
     * @tc.name      PullToRefresh_StateName_0029
     * @tc.desc      stateName(state=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0029 begin`);
      const actual: string = stateName(115);
      logInfo(`stateName(state=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0030
     * @tc.name      PullToRefresh_StateName_0030
     * @tc.desc      stateName(state=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0030 begin`);
      const actual: string = stateName(120);
      logInfo(`stateName(state=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0031
     * @tc.name      PullToRefresh_StateName_0031
     * @tc.desc      stateName(state=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0031 begin`);
      const actual: string = stateName(125);
      logInfo(`stateName(state=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0032
     * @tc.name      PullToRefresh_StateName_0032
     * @tc.desc      stateName(state=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0032 begin`);
      const actual: string = stateName(130);
      logInfo(`stateName(state=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0033
     * @tc.name      PullToRefresh_StateName_0033
     * @tc.desc      stateName(state=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0033 begin`);
      const actual: string = stateName(135);
      logInfo(`stateName(state=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0034
     * @tc.name      PullToRefresh_StateName_0034
     * @tc.desc      stateName(state=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0034 begin`);
      const actual: string = stateName(140);
      logInfo(`stateName(state=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0035
     * @tc.name      PullToRefresh_StateName_0035
     * @tc.desc      stateName(state=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0035 begin`);
      const actual: string = stateName(145);
      logInfo(`stateName(state=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0036
     * @tc.name      PullToRefresh_StateName_0036
     * @tc.desc      stateName(state=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0036 begin`);
      const actual: string = stateName(150);
      logInfo(`stateName(state=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0037
     * @tc.name      PullToRefresh_StateName_0037
     * @tc.desc      stateName(state=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0037 begin`);
      const actual: string = stateName(155);
      logInfo(`stateName(state=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0038
     * @tc.name      PullToRefresh_StateName_0038
     * @tc.desc      stateName(state=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0038 begin`);
      const actual: string = stateName(160);
      logInfo(`stateName(state=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0039
     * @tc.name      PullToRefresh_StateName_0039
     * @tc.desc      stateName(state=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0039 begin`);
      const actual: string = stateName(165);
      logInfo(`stateName(state=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0040
     * @tc.name      PullToRefresh_StateName_0040
     * @tc.desc      stateName(state=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0040 begin`);
      const actual: string = stateName(170);
      logInfo(`stateName(state=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0041
     * @tc.name      PullToRefresh_StateName_0041
     * @tc.desc      stateName(state=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0041 begin`);
      const actual: string = stateName(175);
      logInfo(`stateName(state=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0042
     * @tc.name      PullToRefresh_StateName_0042
     * @tc.desc      stateName(state=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0042 begin`);
      const actual: string = stateName(180);
      logInfo(`stateName(state=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0043
     * @tc.name      PullToRefresh_StateName_0043
     * @tc.desc      stateName(state=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0043 begin`);
      const actual: string = stateName(185);
      logInfo(`stateName(state=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0044
     * @tc.name      PullToRefresh_StateName_0044
     * @tc.desc      stateName(state=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0044 begin`);
      const actual: string = stateName(190);
      logInfo(`stateName(state=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0045
     * @tc.name      PullToRefresh_StateName_0045
     * @tc.desc      stateName(state=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0045 begin`);
      const actual: string = stateName(195);
      logInfo(`stateName(state=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0046
     * @tc.name      PullToRefresh_StateName_0046
     * @tc.desc      stateName(state=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0046 begin`);
      const actual: string = stateName(200);
      logInfo(`stateName(state=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0047
     * @tc.name      PullToRefresh_StateName_0047
     * @tc.desc      stateName(state=-72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_StateName_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StateName_0047 begin`);
      const actual: string = stateName(-72);
      logInfo(`stateName(state=-72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0048
     * @tc.name      PullToRefresh_StateName_0048
     * @tc.desc      stateName(state=43.19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0048 begin`);
      const actual: string = stateName(43.19);
      logInfo(`stateName(state=43.19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0049
     * @tc.name      PullToRefresh_StateName_0049
     * @tc.desc      stateName(state=-12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_StateName_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StateName_0049 begin`);
      const actual: string = stateName(-12);
      logInfo(`stateName(state=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0050
     * @tc.name      PullToRefresh_StateName_0050
     * @tc.desc      stateName(state=112) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0050 begin`);
      const actual: string = stateName(112);
      logInfo(`stateName(state=112): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0051
     * @tc.name      PullToRefresh_StateName_0051
     * @tc.desc      stateName(state=87.57) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0051 begin`);
      const actual: string = stateName(87.57);
      logInfo(`stateName(state=87.57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0052
     * @tc.name      PullToRefresh_StateName_0052
     * @tc.desc      stateName(state=97.94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0052 begin`);
      const actual: string = stateName(97.94);
      logInfo(`stateName(state=97.94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0053
     * @tc.name      PullToRefresh_StateName_0053
     * @tc.desc      stateName(state=87.62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0053 begin`);
      const actual: string = stateName(87.62);
      logInfo(`stateName(state=87.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0054
     * @tc.name      PullToRefresh_StateName_0054
     * @tc.desc      stateName(state=-51) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_StateName_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StateName_0054 begin`);
      const actual: string = stateName(-51);
      logInfo(`stateName(state=-51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0055
     * @tc.name      PullToRefresh_StateName_0055
     * @tc.desc      stateName(state=-85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_StateName_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StateName_0055 begin`);
      const actual: string = stateName(-85);
      logInfo(`stateName(state=-85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0056
     * @tc.name      PullToRefresh_StateName_0056
     * @tc.desc      stateName(state=108) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0056 begin`);
      const actual: string = stateName(108);
      logInfo(`stateName(state=108): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0057
     * @tc.name      PullToRefresh_StateName_0057
     * @tc.desc      stateName(state=-15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_StateName_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StateName_0057 begin`);
      const actual: string = stateName(-15);
      logInfo(`stateName(state=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0058
     * @tc.name      PullToRefresh_StateName_0058
     * @tc.desc      stateName(state=23) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0058 begin`);
      const actual: string = stateName(23);
      logInfo(`stateName(state=23): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_STATE_NAME_0059
     * @tc.name      PullToRefresh_StateName_0059
     * @tc.desc      stateName(state=141) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_StateName_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StateName_0059 begin`);
      const actual: string = stateName(141);
      logInfo(`stateName(state=141): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}StateName_0059 end`);
    });
  });
}
