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
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';

/** 断点档位序号：sm=0，md=1，lg=2 */
function breakpointRank(bp: Breakpoint): number {
  if (bp === 'lg') {
    return 2;
  }
  if (bp === 'md') {
    return 1;
  }
  return 0;
}

export default function deviceUtilMatrixTest() {
  describe('deviceUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0100
     * @tc.name breakpointZeroWidth001
     * @tc.desc Verify zero window width maps to the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointZeroWidth001', 0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0200
     * @tc.name breakpointSmallWidth320002
     * @tc.desc Verify a typical phone width of 320vp maps to sm
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointSmallWidth320002', 0, () => {
      expect(DeviceUtil.getBreakpoint(320)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0300
     * @tc.name breakpointJustBelowMd599Point9003
     * @tc.desc Verify 599.9vp is still sm, just below the 600vp threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointJustBelowMd599Point9003', 0, () => {
      expect(DeviceUtil.getBreakpoint(599.9)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0400
     * @tc.name breakpointJustAboveMd600Point1004
     * @tc.desc Verify 600.1vp maps to md, just above the 600vp threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointJustAboveMd600Point1004', 0, () => {
      expect(DeviceUtil.getBreakpoint(600.1)).assertEqual('md');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0500
     * @tc.name breakpointJustBelowLg839Point9005
     * @tc.desc Verify 839.9vp is still md, just below the 840vp threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointJustBelowLg839Point9005', 0, () => {
      expect(DeviceUtil.getBreakpoint(839.9)).assertEqual('md');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0600
     * @tc.name breakpointJustAboveLg840Point1006
     * @tc.desc Verify 840.1vp maps to lg, just above the 840vp threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointJustAboveLg840Point1006', 0, () => {
      expect(DeviceUtil.getBreakpoint(840.1)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0700
     * @tc.name breakpointLarge1280007
     * @tc.desc Verify a 1280vp window maps to lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointLarge1280007', 0, () => {
      expect(DeviceUtil.getBreakpoint(1280)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0800
     * @tc.name breakpointMonotonicRanks008
     * @tc.desc Verify breakpoint ranks increase monotonically with window width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpointMonotonicRanks008', 0, () => {
      const widths: number[] = [0, 320, 599.9, 600.1, 839.9, 840.1, 1280];
      const ranks: number[] = widths.map((w: number): number => breakpointRank(DeviceUtil.getBreakpoint(w)));
      expect(ranks.join(',')).assertEqual('0,0,0,1,1,2,2');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_0900
     * @tc.name preferTwoColumnSmFalse009
     * @tc.desc Verify a 480vp phone window keeps the single-column layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumnSmFalse009', 0, () => {
      expect(DeviceUtil.preferTwoColumn(480)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(320)).assertFalse();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1000
     * @tc.name preferTwoColumnMdTrue010
     * @tc.desc Verify an md window selects the two-column layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumnMdTrue010', 0, () => {
      expect(DeviceUtil.preferTwoColumn(720)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(839.9)).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1100
     * @tc.name preferTwoColumnLgTrue011
     * @tc.desc Verify an lg window selects the two-column layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumnLgTrue011', 0, () => {
      expect(DeviceUtil.preferTwoColumn(1024)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(840.1)).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1200
     * @tc.name preferTwoColumnConsistentWithBreakpoint012
     * @tc.desc Verify preferTwoColumn agrees with the breakpoint for every sampled width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumnConsistentWithBreakpoint012', 0, () => {
      const widths: number[] = [0, 320, 599, 600, 720, 839, 840, 1280];
      let consistent: number = 0;
      for (const w of widths) {
        if (DeviceUtil.preferTwoColumn(w) === (DeviceUtil.getBreakpoint(w) !== 'sm')) {
          consistent++;
        }
      }
      expect(consistent).assertEqual(widths.length);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1300
     * @tc.name wideScreenMatchesFlags013
     * @tc.desc Verify isWideScreen equals the OR of the tablet and 2in1 flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideScreenMatchesFlags013', 0, () => {
      expect(DeviceUtil.isWideScreen()).assertEqual(DeviceUtil.isTablet() || DeviceUtil.is2in1());
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1400
     * @tc.name deviceTypeFlagsConsistent014
     * @tc.desc Verify each form flag matches the deviceType literal exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceTypeFlagsConsistent014', 0, () => {
      const type: string = DeviceUtil.getDeviceType();
      expect(DeviceUtil.isPhone()).assertEqual(type === 'phone');
      expect(DeviceUtil.isTablet()).assertEqual(type === 'tablet');
      expect(DeviceUtil.is2in1()).assertEqual(type === '2in1');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1500
     * @tc.name sdkApiVersionPositiveInteger015
     * @tc.desc Verify sdkApiVersion is a positive integer and market name is a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sdkApiVersionPositiveInteger015', 0, () => {
      const api: number = DeviceUtil.getSdkApiVersion();
      expect(api > 0).assertTrue();
      expect(Math.floor(api)).assertEqual(api);
      expect(typeof DeviceUtil.getMarketName() === 'string').assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1600
     * @tc.name logDeviceProfileNoThrow016
     * @tc.desc Verify logging the device profile completes without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logDeviceProfileNoThrow016', 0, () => {
      let ok: boolean = false;
      try {
        DeviceUtil.logDeviceProfile();
        ok = true;
      } catch (e) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTILMATRIX_1700
     * @tc.name logDeviceProfileDeliversLine017
     * @tc.desc Verify logDeviceProfile writes one sink line carrying device profile fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logDeviceProfileDeliversLine017', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      const before: number = lines.length;
      DeviceUtil.logDeviceProfile();
      expect(lines.length > before).assertTrue();
      const last: string = lines[lines.length - 1];
      expect(last.includes('[I][Device]')).assertTrue();
      expect(last.includes('设备类型=')).assertTrue();
      expect(last.includes('产品型号=')).assertTrue();
      expect(last.includes('SDK API=')).assertTrue();
    });
  });
}
