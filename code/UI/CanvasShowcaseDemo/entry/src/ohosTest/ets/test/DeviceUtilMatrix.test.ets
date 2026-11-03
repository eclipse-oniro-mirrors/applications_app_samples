import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { DeviceUtil, Breakpoint } from '../../../main/ets/model/utils/DeviceUtil';

/**
 * DeviceUtil 设备形态工具类矩阵套件
 * 在 DeviceUtil.test 基础上补齐宽度矩阵与形态一致性：
 * 0/320/599.9/600.1/839.9/840.1/1280 断点、断点单调性、preferTwoColumn 三档、
 * preferTwoColumn 与断点一致、宽屏=平板∨2in1、设备类型与形态标志一致、
 * marketName 类型、SDK 版本整数性、设备档案日志不抛异常。
 */

/** 断点排序权重：sm<md<lg */
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0100
     * @tc.name breakpointWidthZero0100
     * @tc.desc Verify width 0 falls into the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_widthZero', 0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0200
     * @tc.name breakpointWidth320_0200
     * @tc.desc Verify a 320vp phone width falls into sm
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_width320', 0, () => {
      expect(DeviceUtil.getBreakpoint(320)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0300
     * @tc.name breakpointFractional599Point90300
     * @tc.desc Verify 599.9vp stays below the md threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_fractional599_9', 0, () => {
      expect(DeviceUtil.getBreakpoint(599.9)).assertEqual('sm');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0400
     * @tc.name breakpointFractional600Point10400
     * @tc.desc Verify 600.1vp crosses into the md threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_fractional600_1', 0, () => {
      expect(DeviceUtil.getBreakpoint(600.1)).assertEqual('md');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0500
     * @tc.name breakpointFractional839Point90500
     * @tc.desc Verify 839.9vp stays below the lg threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_fractional839_9', 0, () => {
      expect(DeviceUtil.getBreakpoint(839.9)).assertEqual('md');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0600
     * @tc.name breakpointFractional840Point10600
     * @tc.desc Verify 840.1vp crosses into the lg threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_fractional840_1', 0, () => {
      expect(DeviceUtil.getBreakpoint(840.1)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0700
     * @tc.name breakpointWidth12800700
     * @tc.desc Verify a large desktop width stays in lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_width1280', 0, () => {
      expect(DeviceUtil.getBreakpoint(1280)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0800
     * @tc.name breakpointMonotonic0800
     * @tc.desc Verify the breakpoint rank never decreases as width grows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_monotonic', 0, () => {
      const widths: number[] = [0, 320, 599, 600, 839, 840, 1280];
      const expected: number[] = [0, 0, 0, 1, 1, 2, 2];
      for (let i = 0; i < widths.length; i++) {
        expect(breakpointRank(DeviceUtil.getBreakpoint(widths[i]))).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_0900
     * @tc.name preferTwoColumnSmFalse0900
     * @tc.desc Verify sm widths prefer a single column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_sm_false', 0, () => {
      expect(DeviceUtil.preferTwoColumn(0)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(320)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(599)).assertFalse();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1000
     * @tc.name preferTwoColumnMdTrue1000
     * @tc.desc Verify md widths prefer two columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_md_true', 0, () => {
      expect(DeviceUtil.preferTwoColumn(600)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(839)).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1100
     * @tc.name preferTwoColumnLgTrue1100
     * @tc.desc Verify lg widths prefer two columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_lg_true', 0, () => {
      expect(DeviceUtil.preferTwoColumn(840)).assertTrue();
      expect(DeviceUtil.preferTwoColumn(1280)).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1200
     * @tc.name preferTwoColumnMatchesBreakpoint1200
     * @tc.desc Verify preferTwoColumn is exactly the non-sm predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preferTwoColumn_matchesBreakpoint', 0, () => {
      const widths: number[] = [0, 320, 599, 600, 720, 839, 840, 1280];
      for (const w of widths) {
        const expected: boolean = DeviceUtil.getBreakpoint(w) !== 'sm';
        expect(DeviceUtil.preferTwoColumn(w)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1300
     * @tc.name wideScreenEqualsTabletOr2in1_1300
     * @tc.desc Verify isWideScreen equals the tablet-or-2in1 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wideScreen_equalsTabletOr2in1', 0, () => {
      const expected: boolean = DeviceUtil.isTablet() || DeviceUtil.is2in1();
      expect(DeviceUtil.isWideScreen()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1400
     * @tc.name deviceTypeFlagConsistency1400
     * @tc.desc Verify form flags agree with the reported device type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceType_flagConsistency', 0, () => {
      const t: string = DeviceUtil.getDeviceType();
      if (t === 'phone') {
        expect(DeviceUtil.isPhone()).assertTrue();
        expect(DeviceUtil.isTablet()).assertFalse();
        expect(DeviceUtil.is2in1()).assertFalse();
      } else if (t === 'tablet') {
        expect(DeviceUtil.isTablet()).assertTrue();
        expect(DeviceUtil.isPhone()).assertFalse();
      } else if (t === '2in1') {
        expect(DeviceUtil.is2in1()).assertTrue();
        expect(DeviceUtil.isPhone()).assertFalse();
      } else {
        // 'default' 形态（DAYU200）三个标志全为 false
        expect(DeviceUtil.isPhone()).assertFalse();
        expect(DeviceUtil.isTablet()).assertFalse();
        expect(DeviceUtil.is2in1()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1500
     * @tc.name marketNameIsString1500
     * @tc.desc Verify marketName is exposed as a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('marketName_isString', 0, () => {
      expect(typeof DeviceUtil.getMarketName() === 'string').assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1600
     * @tc.name sdkVersionPositiveInteger1600
     * @tc.desc Verify the SDK API version is a positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sdkVersion_positiveInteger', 0, () => {
      const api: number = DeviceUtil.getSdkApiVersion();
      expect(api > 0).assertTrue();
      expect(Math.floor(api)).assertEqual(api);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_DEVICEUTILMATRIX_1700
     * @tc.name logDeviceProfileNoThrow1700
     * @tc.desc Verify emitting the device profile log does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logDeviceProfile_noThrow', 0, () => {
      DeviceUtil.logDeviceProfile();
    });
  });
}
