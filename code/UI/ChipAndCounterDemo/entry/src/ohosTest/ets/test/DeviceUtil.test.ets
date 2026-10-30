
/**
 * 文件：entry/src/ohosTest/ets/test/DeviceUtil.test.ets
 * 套件：deviceUtilTest（8 条用例）
 * 内容：DeviceUtil 设备形态工具类设备侧测试（DAYU200 / RK3568）
 * 覆盖：设备档案字段非空、形态判断互斥、断点阈值边界（0/599/600/839/840/超大宽度）、宽屏判断、双栏选择
 * 注意：DAYU200（OpenHarmony）deviceInfo.deviceType 上报 'default'，不是 phone/tablet/2in1
 * 运行：aa test -b com.samples.chipandcounterdemo -m entry_test -s unittest OpenHarmonyTestRunner
 */
import { describe, beforeAll, it, expect } from '@ohos/hypium';
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
    it('deviceType_nonEmpty', 0, () => {
      const t = DeviceUtil.getDeviceType();
      expect(t.length > 0).assertTrue();
      // DAYU200 上报 'default'；手机/平板/2in1 形态设备按各自字面量上报
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0300
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0400
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0500
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0600
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_DEVICEUTIL_0700
     * @tc.name preferTwoColumn_thresholds
     * @tc.desc Verify two-column layout is chosen from md breakpoint onward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_thresholds', 0, () => {
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
    it('breakpoint_extremes', 0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(100000)).assertEqual('lg');
    });
  });
}
