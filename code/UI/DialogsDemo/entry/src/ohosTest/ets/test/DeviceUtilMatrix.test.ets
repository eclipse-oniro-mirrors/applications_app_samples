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
 
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { DeviceUtil, Breakpoint } from '../../../main/ets/model/utils/DeviceUtil';

/**
 * DeviceUtil 矩阵套件
 * 补充基线未覆盖的分支：常见窗口宽度、分数宽度边界、档位单调性、
 * 双栏结论与断点一致、逐标志与 deviceType 精确一致、重复查询稳定
 */

function breakpointRank(bp: Breakpoint): number {
  if (bp === 'sm') {
    return 0;
  }
  if (bp === 'md') {
    return 1;
  }
  return 2;
}

export default function deviceUtilMatrixTest() {
  describe('deviceUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0100
     * @tc.name portrait480001
     * @tc.desc Verify a 480vp portrait window falls into sm
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('portrait_480', 0, () => {
      expect(DeviceUtil.getBreakpoint(480)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0200
     * @tc.name tablet1024002
     * @tc.desc Verify a 1024vp window falls into lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tablet_1024', 0, () => {
      expect(DeviceUtil.getBreakpoint(1024)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0300
     * @tc.name desktop1366003
     * @tc.desc Verify a 1366vp desktop-class window falls into lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('desktop_1366', 0, () => {
      expect(DeviceUtil.getBreakpoint(1366)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0400
     * @tc.name fractional599_9004
     * @tc.desc Verify 599.9vp is still sm (fractional width below the md threshold)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fractional_599_9', 0, () => {
      expect(DeviceUtil.getBreakpoint(599.9)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0500
     * @tc.name fractional600_1005
     * @tc.desc Verify 600.1vp is md (fractional width just above the md threshold)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fractional_600_1', 0, () => {
      expect(DeviceUtil.getBreakpoint(600.1)).assertEqual('md');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0600
     * @tc.name fractional839_9006
     * @tc.desc Verify 839.9vp is still md (fractional width below the lg threshold)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fractional_839_9', 0, () => {
      expect(DeviceUtil.getBreakpoint(839.9)).assertEqual('md');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0700
     * @tc.name fractional840_1007
     * @tc.desc Verify 840.1vp is lg (fractional width just above the lg threshold)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fractional_840_1', 0, () => {
      expect(DeviceUtil.getBreakpoint(840.1)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0800
     * @tc.name breakpointRanksMonotonic008
     * @tc.desc Verify the breakpoint rank never decreases as window width grows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_ranksMonotonic', 0, () => {
      const widths: number[] = [320, 480, 599, 600, 720, 839, 840, 1024, 1366];
      let last: number = -1;
      let monotonic: boolean = true;
      for (let i = 0; i < widths.length; i++) {
        const rank: number = breakpointRank(DeviceUtil.getBreakpoint(widths[i]));
        if (rank < last) {
          monotonic = false;
        }
        last = rank;
      }
      expect(monotonic).assertTrue();
      expect(breakpointRank(DeviceUtil.getBreakpoint(320))).assertEqual(0);
      expect(breakpointRank(DeviceUtil.getBreakpoint(1366))).assertEqual(2);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_0900
     * @tc.name preferTwoColumnSmFalse009
     * @tc.desc Verify a 480vp window uses the single-column layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_smFalse', 0, () => {
      expect(DeviceUtil.preferTwoColumn(480)).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1000
     * @tc.name preferTwoColumnMdTrue010
     * @tc.desc Verify a 700vp window uses the two-column layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_mdTrue', 0, () => {
      expect(DeviceUtil.preferTwoColumn(700)).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1100
     * @tc.name preferTwoColumnLgTrue011
     * @tc.desc Verify a 1024vp window uses the two-column layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_lgTrue', 0, () => {
      expect(DeviceUtil.preferTwoColumn(1024)).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1200
     * @tc.name twoColumnMatchesBreakpoint012
     * @tc.desc Verify preferTwoColumn equals "breakpoint is not sm" across widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('twoColumn_matchesBreakpoint', 0, () => {
      const widths: number[] = [320, 599, 600, 839, 840, 1366];
      for (let i = 0; i < widths.length; i++) {
        const expected: boolean = DeviceUtil.getBreakpoint(widths[i]) !== 'sm';
        expect(DeviceUtil.preferTwoColumn(widths[i])).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1300
     * @tc.name formFlagsMatchDeviceType013
     * @tc.desc Verify each form flag is true exactly when deviceType equals its literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formFlags_matchDeviceType', 0, () => {
      const t: string = DeviceUtil.getDeviceType();
      expect(DeviceUtil.isPhone()).assertEqual(t === 'phone');
      expect(DeviceUtil.isTablet()).assertEqual(t === 'tablet');
      expect(DeviceUtil.is2in1()).assertEqual(t === '2in1');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1400
     * @tc.name sdkApiVersionPositiveInteger014
     * @tc.desc Verify the reported SDK API version is a positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sdkApiVersion_positiveInteger', 0, () => {
      const v: number = DeviceUtil.getSdkApiVersion();
      expect(v > 0).assertTrue();
      expect(Math.floor(v) === v).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1500
     * @tc.name logDeviceProfileNoThrow015
     * @tc.desc Verify logDeviceProfile completes without throwing on this device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logDeviceProfile_noThrow', 0, () => {
      let threw: boolean = false;
      try {
        DeviceUtil.logDeviceProfile();
      } catch (e) {
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTILMATRIX_1600
     * @tc.name repeatedQueriesStable016
     * @tc.desc Verify repeated queries of the same width and device type return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('repeatedQueries_stable', 0, () => {
      const firstBp: Breakpoint = DeviceUtil.getBreakpoint(720);
      const secondBp: Breakpoint = DeviceUtil.getBreakpoint(720);
      expect(firstBp).assertEqual(secondBp);
      expect(DeviceUtil.preferTwoColumn(720)).assertEqual(DeviceUtil.preferTwoColumn(720));
      expect(DeviceUtil.getDeviceType()).assertEqual(DeviceUtil.getDeviceType());
    });
  });
}
