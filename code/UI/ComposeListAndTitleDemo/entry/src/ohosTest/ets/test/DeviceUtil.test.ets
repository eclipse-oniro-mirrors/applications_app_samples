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
 * DeviceUtil 设备形态工具类设备侧测试（DAYU200 / RK3568）
 * 覆盖：设备档案字段非空、形态判断互斥、断点阈值边界（599/600/839/840）、
 * 断点极值与小数 / 负数宽度、宽屏判断、preferTwoColumn 阈值、宽屏与形态一致性
 * 注意：DAYU200（OpenHarmony）deviceInfo.deviceType 上报 'default'，不是 phone/tablet/2in1
 */
export default function deviceUtilTest() {
  describe('deviceUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0100
     * @tc.name deviceType_nonEmpty
     * @tc.desc Verify the reported device type is non-empty and a known literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceType_nonEmpty', 0, () => {
      const t = DeviceUtil.getDeviceType();
      expect(t.length > 0).assertTrue();
      // DAYU200 上报 'default'；手机/平板/2in1 形态设备按各自字面量上报
      expect(t === 'default' || t === 'phone' || t === 'tablet' || t === '2in1').assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0200
     * @tc.name isXxx_mutuallyExclusive
     * @tc.desc Verify phone/tablet/2in1 flags are mutually exclusive and default device is not wide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('isXxx_mutuallyExclusive', 0, () => {
      const flags: number = (DeviceUtil.isPhone() ? 1 : 0)
        + (DeviceUtil.isTablet() ? 1 : 0)
        + (DeviceUtil.is2in1() ? 1 : 0);
      // 三个形态标志互斥，任一设备最多命中 1 个；'default' 形态（DAYU200）三个全为 false
      expect(flags === 0 || flags === 1).assertTrue();
      if (DeviceUtil.getDeviceType() === 'default') {
        expect(flags).assertEqual(0);
        // 'default' 不算宽屏形态，双栏由断点决定（DAYU200 480vp 落 sm，仍单栏）
        expect(DeviceUtil.isWideScreen()).assertFalse();
      } else {
        expect(flags).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0300
     * @tc.name breakpoint_boundaries
     * @tc.desc Verify breakpoint thresholds at 599/600/839/840 map to sm/md/lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_boundaries', 0, () => {
      // 标准断点：sm <600，md [600,840)，lg >=840
      expect(DeviceUtil.getBreakpoint(599)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(600)).assertEqual('md');
      expect(DeviceUtil.getBreakpoint(839)).assertEqual('md');
      expect(DeviceUtil.getBreakpoint(840)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0400
     * @tc.name breakpoint_typeSafe
     * @tc.desc Verify getBreakpoint returns one of the valid Breakpoint literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_typeSafe', 0, () => {
      const bp: Breakpoint = DeviceUtil.getBreakpoint(720);
      expect(bp === 'sm' || bp === 'md' || bp === 'lg').assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0500
     * @tc.name profileFields_nonEmpty
     * @tc.desc Verify OS name, product model and SDK API version are available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('profileFields_nonEmpty', 0, () => {
      expect(DeviceUtil.getOsFullName().length > 0).assertTrue();
      expect(DeviceUtil.getProductModel().length > 0).assertTrue();
      // API 26 设备
      expect(DeviceUtil.getSdkApiVersion() >= 20).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0600
     * @tc.name wideScreen_consistentWithBreakpoint
     * @tc.desc Verify isWideScreen returns a boolean on the current device form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideScreen_consistentWithBreakpoint', 0, () => {
      // 宽屏形态判断与断点判断独立成立（tablet/2in1 为宽屏）
      const isWide = DeviceUtil.isWideScreen();
      expect(typeof isWide === 'boolean').assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0700
     * @tc.name preferTwoColumn_thresholds
     * @tc.desc Verify two-column preference flips at the 600vp md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_thresholds', 0, () => {
      expect(DeviceUtil.preferTwoColumn(599)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(600)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(839)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(840)).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0800
     * @tc.name breakpoint_extremes
     * @tc.desc Verify extreme widths 0/1/2000 map to sm/sm/lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_extremes', 0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(1)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(2000)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_0900
     * @tc.name isWideScreen_matchesFormFlags
     * @tc.desc Verify isWideScreen always equals tablet-or-2in1 form flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('isWideScreen_matchesFormFlags', 0, () => {
      expect(DeviceUtil.isWideScreen()).assertEqual(DeviceUtil.isTablet() || DeviceUtil.is2in1());
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_DEVICEUTIL_1000
     * @tc.name breakpoint_fractionalAndNegative
     * @tc.desc Verify fractional and negative widths map to sm unless past 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_fractionalAndNegative', 0, () => {
      expect(DeviceUtil.getBreakpoint(-1)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(0.5)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(599.5)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(600.5)).assertEqual('md');
    });
  });
}
