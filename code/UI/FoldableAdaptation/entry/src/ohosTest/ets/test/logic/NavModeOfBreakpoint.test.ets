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
import { navModeOfBreakpoint } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for navModeOfBreakpoint (50 cases). */
export default function navModeOfBreakpointTest(): void {
  describe('NavModeOfBreakpointTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0001
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0001
     * @tc.desc      navModeOfBreakpoint(breakpoint="sm") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NavModeOfBreakpoint_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0001 begin`);
      const actual: number = navModeOfBreakpoint('sm');
      logInfo(`navModeOfBreakpoint(breakpoint="sm"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0002
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0002
     * @tc.desc      navModeOfBreakpoint(breakpoint="SM") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NavModeOfBreakpoint_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0002 begin`);
      const actual: number = navModeOfBreakpoint('SM');
      logInfo(`navModeOfBreakpoint(breakpoint="SM"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0003
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0003
     * @tc.desc      navModeOfBreakpoint(breakpoint="s") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0003 begin`);
      const actual: number = navModeOfBreakpoint('s');
      logInfo(`navModeOfBreakpoint(breakpoint="s"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0004
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0004
     * @tc.desc      navModeOfBreakpoint(breakpoint="smx") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0004 begin`);
      const actual: number = navModeOfBreakpoint('smx');
      logInfo(`navModeOfBreakpoint(breakpoint="smx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0005
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0005
     * @tc.desc      navModeOfBreakpoint(breakpoint="") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0005 begin`);
      const actual: number = navModeOfBreakpoint('');
      logInfo(`navModeOfBreakpoint(breakpoint=""): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0006
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0006
     * @tc.desc      navModeOfBreakpoint(breakpoint="a") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0006 begin`);
      const actual: number = navModeOfBreakpoint('a');
      logInfo(`navModeOfBreakpoint(breakpoint="a"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0007
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0007
     * @tc.desc      navModeOfBreakpoint(breakpoint="abc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0007 begin`);
      const actual: number = navModeOfBreakpoint('abc');
      logInfo(`navModeOfBreakpoint(breakpoint="abc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0008
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0008
     * @tc.desc      navModeOfBreakpoint(breakpoint="Hello World") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0008 begin`);
      const actual: number = navModeOfBreakpoint('Hello World');
      logInfo(`navModeOfBreakpoint(breakpoint="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0009
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0009
     * @tc.desc      navModeOfBreakpoint(breakpoint=" ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0009 begin`);
      const actual: number = navModeOfBreakpoint(' ');
      logInfo(`navModeOfBreakpoint(breakpoint=" "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0010
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0010
     * @tc.desc      navModeOfBreakpoint(breakpoint="123") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0010 begin`);
      const actual: number = navModeOfBreakpoint('123');
      logInfo(`navModeOfBreakpoint(breakpoint="123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0011
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0011
     * @tc.desc      navModeOfBreakpoint(breakpoint=" sm ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0011 begin`);
      const actual: number = navModeOfBreakpoint(' sm ');
      logInfo(`navModeOfBreakpoint(breakpoint=" sm "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0012
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0012
     * @tc.desc      navModeOfBreakpoint(breakpoint="smsm") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0012 begin`);
      const actual: number = navModeOfBreakpoint('smsm');
      logInfo(`navModeOfBreakpoint(breakpoint="smsm"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0013
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0013
     * @tc.desc      navModeOfBreakpoint(breakpoint="sm_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0013 begin`);
      const actual: number = navModeOfBreakpoint('sm_1');
      logInfo(`navModeOfBreakpoint(breakpoint="sm_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0014
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0014
     * @tc.desc      navModeOfBreakpoint(breakpoint="xsm") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0014 begin`);
      const actual: number = navModeOfBreakpoint('xsm');
      logInfo(`navModeOfBreakpoint(breakpoint="xsm"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0015
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0015
     * @tc.desc      navModeOfBreakpoint(breakpoint=" SM ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0015 begin`);
      const actual: number = navModeOfBreakpoint(' SM ');
      logInfo(`navModeOfBreakpoint(breakpoint=" SM "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0016
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0016
     * @tc.desc      navModeOfBreakpoint(breakpoint="SMSM") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0016 begin`);
      const actual: number = navModeOfBreakpoint('SMSM');
      logInfo(`navModeOfBreakpoint(breakpoint="SMSM"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0017
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0017
     * @tc.desc      navModeOfBreakpoint(breakpoint="SM_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0017 begin`);
      const actual: number = navModeOfBreakpoint('SM_1');
      logInfo(`navModeOfBreakpoint(breakpoint="SM_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0018
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0018
     * @tc.desc      navModeOfBreakpoint(breakpoint="xSM") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0018 begin`);
      const actual: number = navModeOfBreakpoint('xSM');
      logInfo(`navModeOfBreakpoint(breakpoint="xSM"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0019
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0019
     * @tc.desc      navModeOfBreakpoint(breakpoint=" s ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0019 begin`);
      const actual: number = navModeOfBreakpoint(' s ');
      logInfo(`navModeOfBreakpoint(breakpoint=" s "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0020
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0020
     * @tc.desc      navModeOfBreakpoint(breakpoint="ss") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0020 begin`);
      const actual: number = navModeOfBreakpoint('ss');
      logInfo(`navModeOfBreakpoint(breakpoint="ss"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0021
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0021
     * @tc.desc      navModeOfBreakpoint(breakpoint="s_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0021 begin`);
      const actual: number = navModeOfBreakpoint('s_1');
      logInfo(`navModeOfBreakpoint(breakpoint="s_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0022
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0022
     * @tc.desc      navModeOfBreakpoint(breakpoint="xs") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0022 begin`);
      const actual: number = navModeOfBreakpoint('xs');
      logInfo(`navModeOfBreakpoint(breakpoint="xs"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0023
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0023
     * @tc.desc      navModeOfBreakpoint(breakpoint=" smx ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0023 begin`);
      const actual: number = navModeOfBreakpoint(' smx ');
      logInfo(`navModeOfBreakpoint(breakpoint=" smx "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0024
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0024
     * @tc.desc      navModeOfBreakpoint(breakpoint="smxsmx") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0024 begin`);
      const actual: number = navModeOfBreakpoint('smxsmx');
      logInfo(`navModeOfBreakpoint(breakpoint="smxsmx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0025
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0025
     * @tc.desc      navModeOfBreakpoint(breakpoint="smx_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0025 begin`);
      const actual: number = navModeOfBreakpoint('smx_1');
      logInfo(`navModeOfBreakpoint(breakpoint="smx_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0026
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0026
     * @tc.desc      navModeOfBreakpoint(breakpoint="xsmx") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0026 begin`);
      const actual: number = navModeOfBreakpoint('xsmx');
      logInfo(`navModeOfBreakpoint(breakpoint="xsmx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0027
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0027
     * @tc.desc      navModeOfBreakpoint(breakpoint=" a ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0027 begin`);
      const actual: number = navModeOfBreakpoint(' a ');
      logInfo(`navModeOfBreakpoint(breakpoint=" a "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0028
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0028
     * @tc.desc      navModeOfBreakpoint(breakpoint="aa") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0028 begin`);
      const actual: number = navModeOfBreakpoint('aa');
      logInfo(`navModeOfBreakpoint(breakpoint="aa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0029
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0029
     * @tc.desc      navModeOfBreakpoint(breakpoint="a_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0029 begin`);
      const actual: number = navModeOfBreakpoint('a_1');
      logInfo(`navModeOfBreakpoint(breakpoint="a_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0030
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0030
     * @tc.desc      navModeOfBreakpoint(breakpoint="xa") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0030 begin`);
      const actual: number = navModeOfBreakpoint('xa');
      logInfo(`navModeOfBreakpoint(breakpoint="xa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0031
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0031
     * @tc.desc      navModeOfBreakpoint(breakpoint=" abc ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0031 begin`);
      const actual: number = navModeOfBreakpoint(' abc ');
      logInfo(`navModeOfBreakpoint(breakpoint=" abc "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0032
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0032
     * @tc.desc      navModeOfBreakpoint(breakpoint="abcabc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0032 begin`);
      const actual: number = navModeOfBreakpoint('abcabc');
      logInfo(`navModeOfBreakpoint(breakpoint="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0033
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0033
     * @tc.desc      navModeOfBreakpoint(breakpoint="abc_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0033 begin`);
      const actual: number = navModeOfBreakpoint('abc_1');
      logInfo(`navModeOfBreakpoint(breakpoint="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0034
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0034
     * @tc.desc      navModeOfBreakpoint(breakpoint="xabc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0034 begin`);
      const actual: number = navModeOfBreakpoint('xabc');
      logInfo(`navModeOfBreakpoint(breakpoint="xabc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0035
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0035
     * @tc.desc      navModeOfBreakpoint(breakpoint=" Hello World ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0035 begin`);
      const actual: number = navModeOfBreakpoint(' Hello World ');
      logInfo(`navModeOfBreakpoint(breakpoint=" Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0036
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0036
     * @tc.desc      navModeOfBreakpoint(breakpoint="Hello WorldHello World") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0036 begin`);
      const actual: number = navModeOfBreakpoint('Hello WorldHello World');
      logInfo(`navModeOfBreakpoint(breakpoint="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0037
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0037
     * @tc.desc      navModeOfBreakpoint(breakpoint="Hello World_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0037 begin`);
      const actual: number = navModeOfBreakpoint('Hello World_1');
      logInfo(`navModeOfBreakpoint(breakpoint="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0038
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0038
     * @tc.desc      navModeOfBreakpoint(breakpoint="xHello World") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0038 begin`);
      const actual: number = navModeOfBreakpoint('xHello World');
      logInfo(`navModeOfBreakpoint(breakpoint="xHello Wo...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0039
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0039
     * @tc.desc      navModeOfBreakpoint(breakpoint="   ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0039 begin`);
      const actual: number = navModeOfBreakpoint('   ');
      logInfo(`navModeOfBreakpoint(breakpoint="   "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0040
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0040
     * @tc.desc      navModeOfBreakpoint(breakpoint="  ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0040 begin`);
      const actual: number = navModeOfBreakpoint('  ');
      logInfo(`navModeOfBreakpoint(breakpoint="  "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0041
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0041
     * @tc.desc      navModeOfBreakpoint(breakpoint=" _1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0041 begin`);
      const actual: number = navModeOfBreakpoint(' _1');
      logInfo(`navModeOfBreakpoint(breakpoint=" _1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0042
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0042
     * @tc.desc      navModeOfBreakpoint(breakpoint="x ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0042 begin`);
      const actual: number = navModeOfBreakpoint('x ');
      logInfo(`navModeOfBreakpoint(breakpoint="x "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0043
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0043
     * @tc.desc      navModeOfBreakpoint(breakpoint=" 123 ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0043 begin`);
      const actual: number = navModeOfBreakpoint(' 123 ');
      logInfo(`navModeOfBreakpoint(breakpoint=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0044
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0044
     * @tc.desc      navModeOfBreakpoint(breakpoint="123123") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0044 begin`);
      const actual: number = navModeOfBreakpoint('123123');
      logInfo(`navModeOfBreakpoint(breakpoint="123123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0045
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0045
     * @tc.desc      navModeOfBreakpoint(breakpoint="123_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0045 begin`);
      const actual: number = navModeOfBreakpoint('123_1');
      logInfo(`navModeOfBreakpoint(breakpoint="123_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0046
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0046
     * @tc.desc      navModeOfBreakpoint(breakpoint="x123") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavModeOfBreakpoint_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0046 begin`);
      const actual: number = navModeOfBreakpoint('x123');
      logInfo(`navModeOfBreakpoint(breakpoint="x123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0047
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0047
     * @tc.desc      navModeOfBreakpoint(breakpoint="ua") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0047 begin`);
      const actual: number = navModeOfBreakpoint('ua');
      logInfo(`navModeOfBreakpoint(breakpoint="ua"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0048
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0048
     * @tc.desc      navModeOfBreakpoint(breakpoint="6E") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0048 begin`);
      const actual: number = navModeOfBreakpoint('6E');
      logInfo(`navModeOfBreakpoint(breakpoint="6E"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0049
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0049
     * @tc.desc      navModeOfBreakpoint(breakpoint="5nobfIVp") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0049 begin`);
      const actual: number = navModeOfBreakpoint('5nobfIVp');
      logInfo(`navModeOfBreakpoint(breakpoint="5nobfIVp"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_OF_BREAKPOINT_0050
     * @tc.name      FoldableAdaptation_NavModeOfBreakpoint_0050
     * @tc.desc      navModeOfBreakpoint(breakpoint="MLFWO") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeOfBreakpoint_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0050 begin`);
      const actual: number = navModeOfBreakpoint('MLFWO');
      logInfo(`navModeOfBreakpoint(breakpoint="MLFWO"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeOfBreakpoint_0050 end`);
    });
  });
}
