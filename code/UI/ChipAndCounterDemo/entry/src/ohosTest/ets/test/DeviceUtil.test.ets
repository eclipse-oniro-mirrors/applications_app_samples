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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { DeviceUtil, Breakpoint } from '../../../main/ets/model/utils/DeviceUtil';

export default function deviceUtilTest() {
  describe('deviceUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0100
     * @tc.name deviceType_nonEmpty
     * @tc.desc Verify the reported device type is non-empty and a known literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceType_nonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t = DeviceUtil.getDeviceType();
      expect(t.length > 0).assertTrue();
      // 开发板上报 'default'；手机/平板/2in1 形态设备按各自字面量上报
      expect(t === 'default' || t === 'phone' || t === 'tablet' || t === '2in1').assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0200
     * @tc.name isXxx_mutuallyExclusive
     * @tc.desc Verify phone/tablet/2in1 flags are mutually exclusive and default device is not wide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('isXxx_mutuallyExclusive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const flags: number = (DeviceUtil.isPhone() ? 1 : 0)
        + (DeviceUtil.isTablet() ? 1 : 0)
        + (DeviceUtil.is2in1() ? 1 : 0);
      // 三个形态标志互斥，任一设备最多命中 1 个；'default' 形态三个全为 false
      expect(flags === 0 || flags === 1).assertTrue();
      if (DeviceUtil.getDeviceType() === 'default') {
        expect(flags).assertEqual(0);
        // 'default' 不算宽屏形态，双栏由断点决定（480vp 落 sm，仍单栏）
        expect(DeviceUtil.isWideScreen()).assertFalse();
      } else {
        expect(flags).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0300
     * @tc.name breakpoint_boundaries
     * @tc.desc Verify breakpoint thresholds at 599/600/839/840 map to sm/md/lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_boundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 标准断点：sm <600，md [600,840)，lg >=840
      expect(DeviceUtil.getBreakpoint(599)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(600)).assertEqual('md');
      expect(DeviceUtil.getBreakpoint(839)).assertEqual('md');
      expect(DeviceUtil.getBreakpoint(840)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0400
     * @tc.name breakpoint_typeSafe
     * @tc.desc Verify getBreakpoint returns one of the valid Breakpoint literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_typeSafe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const bp: Breakpoint = DeviceUtil.getBreakpoint(720);
      expect(bp === 'sm' || bp === 'md' || bp === 'lg').assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0500
     * @tc.name profileFields_nonEmpty
     * @tc.desc Verify OS name, product model and SDK API version are available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('profileFields_nonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DeviceUtil.getOsFullName().length > 0).assertTrue();
      expect(DeviceUtil.getProductModel().length > 0).assertTrue();
      // API 26 设备
      expect(DeviceUtil.getSdkApiVersion() >= 20).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0600
     * @tc.name wideScreen_consistentWithBreakpoint
     * @tc.desc Verify isWideScreen returns a boolean on the current device form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideScreen_consistentWithBreakpoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 宽屏形态判断与断点判断独立成立（tablet/2in1 为宽屏）
      const isWide = DeviceUtil.isWideScreen();
      expect(typeof isWide === 'boolean').assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0700
     * @tc.name preferTwoColumn_thresholds
     * @tc.desc Verify two-column layout is chosen from md breakpoint onward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_thresholds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DeviceUtil.preferTwoColumn(599)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(600)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(840)).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0800
     * @tc.name breakpoint_extremes
     * @tc.desc Verify breakpoint mapping at zero width and a very large width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_extremes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(100000)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0900
     * @tc.name breakpoint_exactThresholds
     * @tc.desc Verify widths equal to 600vp and 840vp land exactly on md and lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_exactThresholds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DeviceUtil.getBreakpoint(600)).assertEqual('md');
      expect(DeviceUtil.getBreakpoint(840)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_1000
     * @tc.name breakpoint_fractionalAndNegative
     * @tc.desc Verify negative and sub-600 fractional widths stay sm while 600.5 is md
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_fractionalAndNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DeviceUtil.getBreakpoint(-1)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(0.5)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(599.5)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(600.5)).assertEqual('md');
    });
  });
}
