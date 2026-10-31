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
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0100
     * @tc.name deviceTypeNonEmpty001
     * @tc.desc Verify device type is reported as one of the known form factors
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
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0200
     * @tc.name isXxxMutuallyExclusive002
     * @tc.desc Verify phone/tablet/2in1 flags are mutually exclusive
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
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0300
     * @tc.name breakpointBoundaries003
     * @tc.desc Verify breakpoint thresholds at 599/600/839/840
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
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0400
     * @tc.name breakpointTypeSafe004
     * @tc.desc Verify breakpoint result is one of sm/md/lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_typeSafe', 0, () => {
      const bp: Breakpoint = DeviceUtil.getBreakpoint(720);
      expect(bp === 'sm' || bp === 'md' || bp === 'lg').assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0500
     * @tc.name profileFieldsNonEmpty005
     * @tc.desc Verify OS name, product model and SDK API version are readable
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
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0600
     * @tc.name wideScreenConsistentWithBreakpoint006
     * @tc.desc Verify the wide-screen flag matches the device form: tablet/2in1 true, phone/default false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideScreen_consistentWithBreakpoint', 0, () => {
      const t = DeviceUtil.getDeviceType();
      const expected: boolean = t === 'tablet' || t === '2in1';
      expect(DeviceUtil.isWideScreen()).assertEqual(expected);
      // 手机与 'default' 形态（DAYU200）不应被视为宽屏
      if (t === 'phone' || t === 'default') {
        expect(DeviceUtil.isWideScreen()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0700
     * @tc.name preferTwoColumnThresholds007
     * @tc.desc Verify preferTwoColumn switches to true exactly at the md threshold (600vp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_thresholds', 0, () => {
      expect(DeviceUtil.preferTwoColumn(0)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(599)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(600)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(839)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(840)).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DEVICEUTIL_0800
     * @tc.name breakpointExtremes008
     * @tc.desc Verify breakpoint classification at zero and very large widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_extremes', 0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(1)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(10000)).assertEqual('lg');
    });
  });
}
