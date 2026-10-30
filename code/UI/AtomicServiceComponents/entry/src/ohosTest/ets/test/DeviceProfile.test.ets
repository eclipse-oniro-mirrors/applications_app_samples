import { describe, it, expect } from '@ohos/hypium';
import {
  BREAKPOINT_LG_VP,
  BREAKPOINT_MD_VP,
  Breakpoint,
  DEFAULT_LAYOUT_PROFILE,
  DeviceForm,
  DisplaySnapshot,
  LayoutProfile,
  buildLayoutProfile,
  pxToVp,
  resolveBreakpoint,
  resolveColumns,
  resolveDeviceForm,
  resolvePageMaxWidth
} from '../../../main/ets/model/DeviceProfile';

export default function deviceProfileTest() {
  describe('deviceProfileTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0100
     * @tc.name resolveDeviceFormMapping001
     * @tc.desc Verify device type strings map to the documented device forms and unknown types fall back to default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('resolveDeviceForm_mapping', 0, () => {
      expect(resolveDeviceForm('phone')).assertEqual(DeviceForm.PHONE);
      expect(resolveDeviceForm('tablet')).assertEqual(DeviceForm.TABLET);
      expect(resolveDeviceForm('2in1')).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(resolveDeviceForm('default')).assertEqual(DeviceForm.DEFAULT);
      expect(resolveDeviceForm('watch')).assertEqual(DeviceForm.DEFAULT);
      expect(resolveDeviceForm('')).assertEqual(DeviceForm.DEFAULT);
      expect(resolveDeviceForm('Phone')).assertEqual(DeviceForm.DEFAULT);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0200
     * @tc.name breakpointBoundaries002
     * @tc.desc Verify breakpoint thresholds at 599/600/839/840 and non-positive widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_boundaries', 0, () => {
      expect(resolveBreakpoint(-100)).assertEqual(Breakpoint.SM);
      expect(resolveBreakpoint(0)).assertEqual(Breakpoint.SM);
      expect(resolveBreakpoint(599)).assertEqual(Breakpoint.SM);
      expect(resolveBreakpoint(600)).assertEqual(Breakpoint.MD);
      expect(resolveBreakpoint(839)).assertEqual(Breakpoint.MD);
      expect(resolveBreakpoint(840)).assertEqual(Breakpoint.LG);
      expect(resolveBreakpoint(1200)).assertEqual(Breakpoint.LG);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0300
     * @tc.name breakpointConstants003
     * @tc.desc Verify the exported breakpoint width constants used by the layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_constants', 0, () => {
      expect(BREAKPOINT_MD_VP).assertEqual(600);
      expect(BREAKPOINT_LG_VP).assertEqual(840);
      expect(Breakpoint.SM).assertEqual('sm');
      expect(Breakpoint.MD).assertEqual('md');
      expect(Breakpoint.LG).assertEqual('lg');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0400
     * @tc.name pxToVpConversion004
     * @tc.desc Verify pixel to vp conversion rounds to one decimal and guards invalid density
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pxToVp_conversion', 0, () => {
      expect(pxToVp(1080, 3)).assertEqual(360);
      expect(pxToVp(720, 2)).assertEqual(360);
      expect(pxToVp(3, 2)).assertEqual(1.5);
      expect(pxToVp(720, 0)).assertEqual(720);
      expect(pxToVp(720, -1)).assertEqual(720);
      expect(pxToVp(0, 2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0500
     * @tc.name columnsPhoneAlwaysSingle005
     * @tc.desc Verify phone layout always uses a single column regardless of breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_phoneAlwaysSingle', 0, () => {
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.SM)).assertEqual(1);
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.MD)).assertEqual(1);
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.LG)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0600
     * @tc.name columnsTabletRules006
     * @tc.desc Verify tablet columns stay single on sm and widen to two from md
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_tabletRules', 0, () => {
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.SM)).assertEqual(1);
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.MD)).assertEqual(2);
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.LG)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0700
     * @tc.name columnsTwoInOneRules007
     * @tc.desc Verify 2in1 columns reach three only on the lg breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_twoInOneRules', 0, () => {
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.SM)).assertEqual(2);
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.MD)).assertEqual(2);
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.LG)).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0800
     * @tc.name columnsDefaultRules008
     * @tc.desc Verify the default form follows the two-column rule above the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('columns_defaultRules', 0, () => {
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.SM)).assertEqual(1);
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.MD)).assertEqual(2);
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.LG)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_0900
     * @tc.name pageMaxWidthByForm009
     * @tc.desc Verify the maximum page width for each device form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pageMaxWidth_byForm', 0, () => {
      expect(resolvePageMaxWidth(DeviceForm.PHONE)).assertEqual(640);
      expect(resolvePageMaxWidth(DeviceForm.TABLET)).assertEqual(840);
      expect(resolvePageMaxWidth(DeviceForm.TWO_IN_ONE)).assertEqual(1200);
      expect(resolvePageMaxWidth(DeviceForm.DEFAULT)).assertEqual(960);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_1000
     * @tc.name displaySnapshotFallback010
     * @tc.desc Verify display snapshots keep valid values and fall back for non-positive inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displaySnapshot_fallback', 0, () => {
      const valid = new DisplaySnapshot(400, 900, 2.5);
      expect(valid.widthVp).assertEqual(400);
      expect(valid.heightVp).assertEqual(900);
      expect(valid.density).assertEqual(2.5);
      const zero = new DisplaySnapshot(0, 0, 0);
      expect(zero.widthVp).assertEqual(360);
      expect(zero.heightVp).assertEqual(780);
      expect(zero.density).assertEqual(1);
      const partial = new DisplaySnapshot(-1, 800, -2);
      expect(partial.widthVp).assertEqual(360);
      expect(partial.heightVp).assertEqual(800);
      expect(partial.density).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_1100
     * @tc.name layoutHeightsClamped011
     * @tc.desc Verify web and tabs heights are clamped to their supported ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('layoutHeights_clamped', 0, () => {
      const tiny = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 100, 1));
      expect(tiny.webHeight).assertEqual(320);
      expect(tiny.tabsHeight).assertEqual(300);
      const huge = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 2000, 1));
      expect(huge.webHeight).assertEqual(640);
      expect(huge.tabsHeight).assertEqual(520);
      const normal = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1));
      expect(normal.webHeight).assertEqual(429);
      expect(normal.tabsHeight).assertEqual(390);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_1200
     * @tc.name navSplitDefaultRules012
     * @tc.desc Verify split navigation defaults on for tablet/2in1 above the sm breakpoint only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navSplitDefault_rules', 0, () => {
      expect(buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(360, 780, 1)).navSplitDefault)
        .assertFalse();
      expect(buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(600, 900, 1)).navSplitDefault)
        .assertTrue();
      expect(buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(840, 900, 1)).navSplitDefault)
        .assertTrue();
      expect(buildLayoutProfile(DeviceForm.PHONE, new DisplaySnapshot(840, 900, 1)).navSplitDefault)
        .assertFalse();
      expect(buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(840, 900, 1)).navSplitDefault)
        .assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_1300
     * @tc.name pickerSupportedByForm013
     * @tc.desc Verify picker support is enabled for phone/tablet/2in1 and disabled for the default form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pickerSupported_byForm', 0, () => {
      const snapshot = new DisplaySnapshot(360, 780, 1);
      expect(buildLayoutProfile(DeviceForm.PHONE, snapshot).pickerSupported).assertTrue();
      expect(buildLayoutProfile(DeviceForm.TABLET, snapshot).pickerSupported).assertTrue();
      expect(buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot).pickerSupported).assertTrue();
      expect(buildLayoutProfile(DeviceForm.DEFAULT, snapshot).pickerSupported).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_1400
     * @tc.name layoutProfileDescribe014
     * @tc.desc Verify the layout profile carries snapshot fields and renders a readable summary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('layoutProfile_describe', 0, () => {
      const profile: LayoutProfile =
        buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1));
      expect(profile.widthVp).assertEqual(360);
      expect(profile.heightVp).assertEqual(780);
      expect(profile.density).assertEqual(1);
      const text = profile.describe();
      expect(text.includes('default/sm')).assertTrue();
      expect(text.includes('360x780vp')).assertTrue();
      expect(text.includes('1列')).assertTrue();
      expect(text.includes('选择器:不可用')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DEVICEPROFILE_1500
     * @tc.name defaultLayoutProfileBaseline015
     * @tc.desc Verify the exported default layout profile matches the 360x780 baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('defaultLayoutProfile_baseline', 0, () => {
      expect(DEFAULT_LAYOUT_PROFILE.form).assertEqual(DeviceForm.DEFAULT);
      expect(DEFAULT_LAYOUT_PROFILE.breakpoint).assertEqual(Breakpoint.SM);
      expect(DEFAULT_LAYOUT_PROFILE.columns).assertEqual(1);
      expect(DEFAULT_LAYOUT_PROFILE.pageMaxWidth).assertEqual(960);
      expect(DEFAULT_LAYOUT_PROFILE.webHeight).assertEqual(429);
      expect(DEFAULT_LAYOUT_PROFILE.tabsHeight).assertEqual(390);
      expect(DEFAULT_LAYOUT_PROFILE.navSplitDefault).assertFalse();
      expect(DEFAULT_LAYOUT_PROFILE.pickerSupported).assertFalse();
    });
  });
}
