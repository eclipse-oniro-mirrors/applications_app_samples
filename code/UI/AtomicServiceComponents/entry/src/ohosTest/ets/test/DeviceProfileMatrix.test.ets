import { describe, it, expect } from '@ohos/hypium';
import {
  Breakpoint,
  DeviceForm,
  DisplaySnapshot,
  buildLayoutProfile,
  pxToVp,
  resolveBreakpoint,
  resolveColumns,
  resolvePageMaxWidth
} from '../../../main/ets/model/DeviceProfile';

export default function deviceProfileMatrixTest() {
  describe('deviceProfileMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0100
     * @tc.name columnsPhoneSm010
     * @tc.desc Verify a phone keeps a single column on the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_phone_sm', 0, () => {
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.SM)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0200
     * @tc.name columnsPhoneMd020
     * @tc.desc Verify a phone keeps a single column on the md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_phone_md', 0, () => {
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.MD)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0300
     * @tc.name columnsPhoneLg030
     * @tc.desc Verify a phone keeps a single column on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_phone_lg', 0, () => {
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.LG)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0400
     * @tc.name columnsTabletSm040
     * @tc.desc Verify a tablet stays single column on the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_tablet_sm', 0, () => {
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.SM)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0500
     * @tc.name columnsTabletMd050
     * @tc.desc Verify a tablet widens to two columns on the md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_tablet_md', 0, () => {
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.MD)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0600
     * @tc.name columnsTabletLg060
     * @tc.desc Verify a tablet keeps two columns on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_tablet_lg', 0, () => {
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.LG)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0700
     * @tc.name columnsTwoInOneSm070
     * @tc.desc Verify a 2in1 device keeps two columns on the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_twoInOne_sm', 0, () => {
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.SM)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0800
     * @tc.name columnsTwoInOneMd080
     * @tc.desc Verify a 2in1 device keeps two columns on the md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_twoInOne_md', 0, () => {
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.MD)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_0900
     * @tc.name columnsTwoInOneLg090
     * @tc.desc Verify a 2in1 device widens to three columns on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_twoInOne_lg', 0, () => {
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.LG)).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1000
     * @tc.name columnsDefaultSm100
     * @tc.desc Verify the default form stays single column on the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_default_sm', 0, () => {
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.SM)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1100
     * @tc.name columnsDefaultMd110
     * @tc.desc Verify the default form widens to two columns on the md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_default_md', 0, () => {
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.MD)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1200
     * @tc.name columnsDefaultLg120
     * @tc.desc Verify the default form keeps two columns on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_default_lg', 0, () => {
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.LG)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1300
     * @tc.name pageMaxWidthPhone130
     * @tc.desc Verify the phone page content is limited to 640vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pageMaxWidth_phone', 0, () => {
      expect(resolvePageMaxWidth(DeviceForm.PHONE)).assertEqual(640);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1400
     * @tc.name pageMaxWidthTablet140
     * @tc.desc Verify the tablet page content is limited to 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pageMaxWidth_tablet', 0, () => {
      expect(resolvePageMaxWidth(DeviceForm.TABLET)).assertEqual(840);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1500
     * @tc.name pageMaxWidthTwoInOne150
     * @tc.desc Verify the 2in1 page content is limited to 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pageMaxWidth_twoInOne', 0, () => {
      expect(resolvePageMaxWidth(DeviceForm.TWO_IN_ONE)).assertEqual(1200);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1600
     * @tc.name pageMaxWidthDefault160
     * @tc.desc Verify the default page content is limited to 960vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pageMaxWidth_default', 0, () => {
      expect(resolvePageMaxWidth(DeviceForm.DEFAULT)).assertEqual(960);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1700
     * @tc.name breakpointZero170
     * @tc.desc Verify a zero width resolves to the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_zero', 0, () => {
      expect(resolveBreakpoint(0)).assertEqual(Breakpoint.SM);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1800
     * @tc.name breakpoint599180
     * @tc.desc Verify 599vp stays on the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_599', 0, () => {
      expect(resolveBreakpoint(599)).assertEqual(Breakpoint.SM);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_1900
     * @tc.name breakpoint600190
     * @tc.desc Verify 600vp enters the md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_600', 0, () => {
      expect(resolveBreakpoint(600)).assertEqual(Breakpoint.MD);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2000
     * @tc.name breakpoint839200
     * @tc.desc Verify 839vp stays on the md breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_839', 0, () => {
      expect(resolveBreakpoint(839)).assertEqual(Breakpoint.MD);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2100
     * @tc.name breakpoint840210
     * @tc.desc Verify 840vp enters the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_840', 0, () => {
      expect(resolveBreakpoint(840)).assertEqual(Breakpoint.LG);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2200
     * @tc.name breakpoint1200220
     * @tc.desc Verify a wide desktop width stays on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_1200', 0, () => {
      expect(resolveBreakpoint(1200)).assertEqual(Breakpoint.LG);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2300
     * @tc.name navSplitTabletSm230
     * @tc.desc Verify a tablet on the sm breakpoint keeps split navigation off by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_tablet_sm', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(360, 780, 1)).navSplitDefault)
        .assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2400
     * @tc.name navSplitTabletMd240
     * @tc.desc Verify a tablet on the md breakpoint enables split navigation by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_tablet_md', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(600, 780, 1)).navSplitDefault)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2500
     * @tc.name navSplitTabletLg250
     * @tc.desc Verify a tablet on the lg breakpoint enables split navigation by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_tablet_lg', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(840, 780, 1)).navSplitDefault)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2600
     * @tc.name navSplitTwoInOneSm260
     * @tc.desc Verify a 2in1 device on the sm breakpoint keeps split navigation off by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_twoInOne_sm', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(360, 780, 1)).navSplitDefault)
        .assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2700
     * @tc.name navSplitTwoInOneMd270
     * @tc.desc Verify a 2in1 device on the md breakpoint enables split navigation by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_twoInOne_md', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(600, 780, 1)).navSplitDefault)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2800
     * @tc.name navSplitTwoInOneLg280
     * @tc.desc Verify a 2in1 device on the lg breakpoint enables split navigation by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_twoInOne_lg', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(840, 780, 1)).navSplitDefault)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_2900
     * @tc.name navSplitPhoneLg290
     * @tc.desc Verify a phone never enables split navigation even on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplit_phone_lg', 0, () => {
      expect(buildLayoutProfile(DeviceForm.PHONE, new DisplaySnapshot(840, 780, 1)).navSplitDefault)
        .assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3000
     * @tc.name pickerPhone300
     * @tc.desc Verify the phone form supports the document picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_phone', 0, () => {
      expect(buildLayoutProfile(DeviceForm.PHONE, new DisplaySnapshot(360, 780, 1)).pickerSupported)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3100
     * @tc.name pickerTablet310
     * @tc.desc Verify the tablet form supports the document picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_tablet', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(840, 780, 1)).pickerSupported)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3200
     * @tc.name pickerTwoInOne320
     * @tc.desc Verify the 2in1 form supports the document picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_twoInOne', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(1200, 780, 1)).pickerSupported)
        .assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3300
     * @tc.name pickerDefault330
     * @tc.desc Verify the default form reports the picker as unavailable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_default', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1)).pickerSupported)
        .assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3400
     * @tc.name pxToVpDensityOne340
     * @tc.desc Verify density 1 leaves the pixel value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_densityOne', 0, () => {
      expect(pxToVp(720, 1)).assertEqual(720);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3500
     * @tc.name pxToVpDensityTwo350
     * @tc.desc Verify density 2 halves 720px to 360vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_densityTwo', 0, () => {
      expect(pxToVp(720, 2)).assertEqual(360);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3600
     * @tc.name pxToVpDensityThree360
     * @tc.desc Verify density 3 converts 1080px to 360vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_densityThree', 0, () => {
      expect(pxToVp(1080, 3)).assertEqual(360);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3700
     * @tc.name pxToVpFractional370
     * @tc.desc Verify fractional results keep one decimal place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_fractional', 0, () => {
      expect(pxToVp(3, 2)).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3800
     * @tc.name pxToVpRepeating380
     * @tc.desc Verify a repeating decimal is rounded to one decimal place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_repeating', 0, () => {
      expect(pxToVp(100, 3)).assertEqual(33.3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_3900
     * @tc.name pxToVpDensityGuard390
     * @tc.desc Verify non-positive density falls back to treating pixels as vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_densityGuard', 0, () => {
      expect(pxToVp(720, 0)).assertEqual(720);
      expect(pxToVp(720, -2)).assertEqual(720);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4000
     * @tc.name webHeightTiny400
     * @tc.desc Verify a tiny viewport clamps the web height up to 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('webHeight_tiny', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 100, 1)).webHeight)
        .assertEqual(320);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4100
     * @tc.name webHeightClampLow410
     * @tc.desc Verify a 500vp viewport still clamps the web height up to 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('webHeight_clampLow', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 500, 1)).webHeight)
        .assertEqual(320);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4200
     * @tc.name webHeightBaseline420
     * @tc.desc Verify the 780vp baseline yields a 429vp web height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('webHeight_baseline', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1)).webHeight)
        .assertEqual(429);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4300
     * @tc.name webHeightClampHigh430
     * @tc.desc Verify a 2000vp viewport clamps the web height down to 640vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('webHeight_clampHigh', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 2000, 1)).webHeight)
        .assertEqual(640);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4400
     * @tc.name tabsHeightTiny440
     * @tc.desc Verify a tiny viewport clamps the tabs height up to 300vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tabsHeight_tiny', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 100, 1)).tabsHeight)
        .assertEqual(300);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4500
     * @tc.name tabsHeightBaseline450
     * @tc.desc Verify the 780vp baseline yields a 390vp tabs height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tabsHeight_baseline', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1)).tabsHeight)
        .assertEqual(390);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4600
     * @tc.name tabsHeightClampHigh460
     * @tc.desc Verify a 2000vp viewport clamps the tabs height down to 520vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tabsHeight_clampHigh', 0, () => {
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 2000, 1)).tabsHeight)
        .assertEqual(520);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4700
     * @tc.name describeDefault470
     * @tc.desc Verify the default profile summary reports form, breakpoint, size, columns, split and picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_default', 0, () => {
      const text = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1)).describe();
      expect(text.includes('default/sm')).assertTrue();
      expect(text.includes('360x780vp')).assertTrue();
      expect(text.includes('1列')).assertTrue();
      expect(text.includes('分栏默认:关')).assertTrue();
      expect(text.includes('选择器:不可用')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4800
     * @tc.name describeTwoInOne480
     * @tc.desc Verify a wide 2in1 summary reports three columns, split on and picker supported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_twoInOne', 0, () => {
      const text = buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(1200, 900, 1)).describe();
      expect(text.includes('2in1/lg')).assertTrue();
      expect(text.includes('1200x900vp')).assertTrue();
      expect(text.includes('3列')).assertTrue();
      expect(text.includes('分栏默认:开')).assertTrue();
      expect(text.includes('选择器:支持')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_4900
     * @tc.name snapshotZeroFallback490
     * @tc.desc Verify a zero snapshot falls back to the 360x780 baseline with density 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('snapshot_zeroFallback', 0, () => {
      const snapshot = new DisplaySnapshot(0, 0, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILEMATRIX_5000
     * @tc.name snapshotPartialFallback500
     * @tc.desc Verify only the invalid snapshot fields fall back while valid ones are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('snapshot_partialFallback', 0, () => {
      const snapshot = new DisplaySnapshot(-1, 800, -2);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(800);
      expect(snapshot.density).assertEqual(1);
    });
  });
}
