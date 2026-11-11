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
// DeviceProfile 单测：设备形态映射、断点边界、px→vp 换算、列数矩阵、各形态 LayoutProfile 与 describe 文案。
// dayu200（default 形态、480x853vp、sm 断点）的实测行为由这些纯函数推导，改任何阈值前先跑本套用例。

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  BREAKPOINT_LG_VP,
  BREAKPOINT_MD_VP,
  Breakpoint,
  DEFAULT_LAYOUT_PROFILE,
  DeviceForm,
  DisplaySnapshot,
  buildLayoutProfile,
  pxToVp,
  resolveBreakpoint,
  resolveColumns,
  resolveDeviceForm,
  resolvePageMaxWidth
} from '../main/ets/model/DeviceProfile';

export default function deviceProfileTest() {
  describe('DeviceProfileTest', () => {
    // deviceInfo.deviceType → DeviceForm：四个已知形态精确映射，未知类型与空串回落 default
    it('resolveDeviceForm_knownAndUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveDeviceForm('phone')).assertEqual(DeviceForm.PHONE);
      expect(resolveDeviceForm('tablet')).assertEqual(DeviceForm.TABLET);
      expect(resolveDeviceForm('2in1')).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(resolveDeviceForm('default')).assertEqual(DeviceForm.DEFAULT);
      expect(resolveDeviceForm('wearable')).assertEqual(DeviceForm.DEFAULT);
      expect(resolveDeviceForm('')).assertEqual(DeviceForm.DEFAULT);
    });

    // 断点阈值：<600 sm、600–839 md、≥840 lg；阈值常量本身锁定，防止改常量漏改注释
    it('resolveBreakpoint_boundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(BREAKPOINT_MD_VP).assertEqual(600);
      expect(BREAKPOINT_LG_VP).assertEqual(840);
      expect(resolveBreakpoint(0)).assertEqual(Breakpoint.SM);
      expect(resolveBreakpoint(599)).assertEqual(Breakpoint.SM);
      expect(resolveBreakpoint(600)).assertEqual(Breakpoint.MD);
      expect(resolveBreakpoint(601)).assertEqual(Breakpoint.MD);
      expect(resolveBreakpoint(839)).assertEqual(Breakpoint.MD);
      expect(resolveBreakpoint(840)).assertEqual(Breakpoint.LG);
      expect(resolveBreakpoint(1600)).assertEqual(Breakpoint.LG);
    });

    // px→vp：除以密度，结果保留一位小数；密度非法（0）时原样返回避免除零
    it('pxToVp_conversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pxToVp(120, 1.5)).assertEqual(80);
      expect(pxToVp(1280, 1.5)).assertEqual(853.3);
      expect(pxToVp(719, 1.5)).assertEqual(479.3);
      expect(pxToVp(120, 0)).assertEqual(120);
    });

    // px→vp：整除与四舍五入到十分位——3x 屏常见 360/414vp；负密度同样回落 1
    it('pxToVp_roundsToTenth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pxToVp(1080, 3)).assertEqual(360);
      expect(pxToVp(1000, 3)).assertEqual(333.3);
      expect(pxToVp(828, 2)).assertEqual(414);
      expect(pxToVp(120, -2)).assertEqual(120);
    });

    // 列数矩阵：手机任何断点都单列
    it('resolveColumns_phoneAlwaysOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.SM)).assertEqual(1);
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.MD)).assertEqual(1);
      expect(resolveColumns(DeviceForm.PHONE, Breakpoint.LG)).assertEqual(1);
    });

    // 列数矩阵：平板与 default（dayu200）——sm 单列、md/lg 双列
    it('resolveColumns_tabletAndDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.SM)).assertEqual(1);
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.MD)).assertEqual(2);
      expect(resolveColumns(DeviceForm.TABLET, Breakpoint.LG)).assertEqual(2);
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.SM)).assertEqual(1);
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.MD)).assertEqual(2);
      expect(resolveColumns(DeviceForm.DEFAULT, Breakpoint.LG)).assertEqual(2);
    });

    // 列数矩阵：2in1 起步双列，lg 断点三列（无实机，靠本用例锁行为）
    it('resolveColumns_twoInOneLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.SM)).assertEqual(2);
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.MD)).assertEqual(2);
      expect(resolveColumns(DeviceForm.TWO_IN_ONE, Breakpoint.LG)).assertEqual(3);
    });

    // dayu200 基线 profile：default 形态 + 小屏 → sm、单列、无分栏、选择器不可用（与实机行为一致）
    it('profile_boardDefaultKeepsPickerDisabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(360, 780, 1));
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.navSplitDefault).assertFalse();
      expect(profile.pickerSupported).assertFalse();
      expect(profile.pageMaxWidth).assertEqual(resolvePageMaxWidth(DeviceForm.DEFAULT));
    });

    // 平板 profile：800vp 宽落 md、双列、默认开分栏、选择器可用；高度充足时 Web/Tab 取上限 640/520
    it('profile_tabletSplitDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const profile = buildLayoutProfile(DeviceForm.TABLET, new DisplaySnapshot(800, 1280, 2));
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.navSplitDefault).assertTrue();
      expect(profile.pickerSupported).assertTrue();
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
    });

    // 2in1 profile：900vp 宽落 lg、三列、默认开分栏、maxWidth 1200；矮视口下高度按比例缩到 385/350
    it('profile_twoInOneLargeWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, new DisplaySnapshot(900, 700, 1));
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.navSplitDefault).assertTrue();
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(385);
      expect(profile.tabsHeight).assertEqual(350);
    });

    // 高度夹取：过矮取下限 320/300、过高取上限 640/520、中段按公式直出（0.55h 与 0.5h 四舍五入）
    it('profile_heightsClamped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const small = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(400, 400, 1));
      expect(small.webHeight).assertEqual(320);
      expect(small.tabsHeight).assertEqual(300);
      const mid = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(400, 600, 1));
      expect(mid.webHeight).assertEqual(330);
      expect(mid.tabsHeight).assertEqual(300);
      const natural = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(400, 700, 1));
      expect(natural.webHeight).assertEqual(385);
      expect(natural.tabsHeight).assertEqual(350);
      const tall = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(400, 2000, 1));
      expect(tall.webHeight).assertEqual(640);
      expect(tall.tabsHeight).assertEqual(520);
    });

    // 默认 profile（AppStorage 尚未写入时的兜底值）：default/sm、360x780、单列、高度 429/390
    it('defaultProfile_snapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DEFAULT_LAYOUT_PROFILE.form).assertEqual(DeviceForm.DEFAULT);
      expect(DEFAULT_LAYOUT_PROFILE.widthVp).assertEqual(360);
      expect(DEFAULT_LAYOUT_PROFILE.heightVp).assertEqual(780);
      expect(DEFAULT_LAYOUT_PROFILE.breakpoint).assertEqual(Breakpoint.SM);
      expect(DEFAULT_LAYOUT_PROFILE.columns).assertEqual(1);
      expect(DEFAULT_LAYOUT_PROFILE.webHeight).assertEqual(429);
      expect(DEFAULT_LAYOUT_PROFILE.tabsHeight).assertEqual(390);
      expect(DEFAULT_LAYOUT_PROFILE.describe().includes('default')).assertTrue();
    });

    // 内容限宽：四形态各自的 pageMaxWidth（首页目录居中的 maxWidth 来源）
    it('resolvePageMaxWidth_allForms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolvePageMaxWidth(DeviceForm.PHONE)).assertEqual(640);
      expect(resolvePageMaxWidth(DeviceForm.TABLET)).assertEqual(840);
      expect(resolvePageMaxWidth(DeviceForm.TWO_IN_ONE)).assertEqual(1200);
      expect(resolvePageMaxWidth(DeviceForm.DEFAULT)).assertEqual(960);
    });

    // default 形态大屏不越权：即使到 lg 也保持双列、不开分栏、选择器仍禁用（dayu200 行为上限）
    it('profile_defaultFormLargeScreenNoSplit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(1000, 800, 1));
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.navSplitDefault).assertFalse();
      expect(profile.pickerSupported).assertFalse();
    });

    // 手机 profile：900vp 宽已是 lg，但仍单列、无分栏；选择器支持与页面 maxWidth 独立于断点
    it('profile_phoneKeepsSingleColumnWithPicker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const profile = buildLayoutProfile(DeviceForm.PHONE, new DisplaySnapshot(900, 800, 2));
      expect(profile.columns).assertEqual(1);
      expect(profile.navSplitDefault).assertFalse();
      expect(profile.pickerSupported).assertTrue();
      expect(profile.pageMaxWidth).assertEqual(640);
    });

    // describe()：启动日志里的 profile 摘要必须包含形态/断点、视口、密度、列数、分栏与选择器状态
    it('profile_describeFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, new DisplaySnapshot(480, 853, 1.5));
      const text = profile.describe();
      expect(text.includes('default/sm')).assertTrue();
      expect(text.includes('480x853vp')).assertTrue();
      expect(text.includes('x1.5')).assertTrue();
      expect(text.includes('1 columns')).assertTrue();
      expect(text.includes('splitDefault:off')).assertTrue();
      expect(text.includes('picker:unavailable')).assertTrue();
    });

    // DisplaySnapshot：非正数（0/负数/0 密度）整体回落 360x780x1；三个字段各自独立校验，合法字段保留
    it('displaySnapshot_rejectsNonPositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const snapshot = new DisplaySnapshot(0, -5, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
      const partial = new DisplaySnapshot(0, 800, 2);
      expect(partial.widthVp).assertEqual(360);
      expect(partial.heightVp).assertEqual(800);
      expect(partial.density).assertEqual(2);
      const keep = new DisplaySnapshot(720, 1280, 1.5);
      expect(keep.widthVp).assertEqual(720);
      expect(keep.density).assertEqual(1.5);
    });
  });
}
