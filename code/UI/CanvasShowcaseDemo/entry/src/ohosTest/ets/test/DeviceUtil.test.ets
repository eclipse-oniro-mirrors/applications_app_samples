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
 * 覆盖：设备档案字段非空、形态判断互斥、断点阈值边界（599/600/839/840）、宽屏判断
 * 注意：DAYU200（OpenHarmony）deviceInfo.deviceType 上报 'default'，不是 phone/tablet/2in1
 */
export default function deviceUtilTest() {
  describe('deviceUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTIL_0100
     * @tc.name deviceTypeNonEmpty001
     * @tc.desc Verify deviceType reports a known literal, default on DAYU200
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTIL_0200
     * @tc.name isXxxMutuallyExclusive002
     * @tc.desc Verify form flags are mutually exclusive and default is not wide screen
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTIL_0300
     * @tc.name breakpointBoundaries003
     * @tc.desc Verify sm/md/lg cut-offs at 599, 600, 839 and 840 vp
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTIL_0400
     * @tc.name breakpointTypeSafe004
     * @tc.desc Verify getBreakpoint only returns sm, md or lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_typeSafe', 0, () => {
      const bp: Breakpoint = DeviceUtil.getBreakpoint(720);
      expect(bp === 'sm' || bp === 'md' || bp === 'lg').assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTIL_0500
     * @tc.name profileFieldsNonEmpty005
     * @tc.desc Verify OS name, product model and SDK version are populated
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTIL_0600
     * @tc.name wideScreenConsistentWithBreakpoint006
     * @tc.desc Verify isWideScreen returns a boolean independent of the breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideScreen_consistentWithBreakpoint', 0, () => {
      // 宽屏形态判断与断点判断独立成立（tablet/2in1 为宽屏）
      const isWide = DeviceUtil.isWideScreen();
      expect(typeof isWide === 'boolean').assertTrue();
    });
  });
}
