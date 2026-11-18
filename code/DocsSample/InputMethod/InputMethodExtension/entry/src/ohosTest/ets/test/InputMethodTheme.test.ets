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

import { describe, expect, it } from '@ohos/hypium';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../../main/ets/common/Theme';

/**
 * 相对亮度：只用来比较同一套色板里的深浅，不做色彩科学。
 * 权重是常见的 299/587/114，输出 0–255 的整数，便于直接比较大小。
 */
function luma(hex: string): number {
  const r = parseInt(hex.substring(1, 3), 16);
  const g = parseInt(hex.substring(3, 5), 16);
  const b = parseInt(hex.substring(5, 7), 16);
  return Math.round((r * 299 + g * 587 + b * 114) / 1000);
}

/** 全部颜色常量：新增颜色时会先在这里出现，形状断言就能覆盖到 */
function allColors(): string[] {
  return [
    AppColors.PAGE_BG, AppColors.CARD_BG, AppColors.PRIMARY, AppColors.PRIMARY_SOFT,
    AppColors.SUBTLE_BG, AppColors.SOFT_BG, AppColors.TEXT_PRIMARY, AppColors.TEXT_SECONDARY,
    AppColors.TEXT_TERTIARY, AppColors.TEXT_MUTED, AppColors.TEXT_STRONG, AppColors.DANGER,
    AppColors.DANGER_SOFT, AppColors.WARNING, AppColors.WARNING_SOFT, AppColors.SUCCESS,
    AppColors.SUCCESS_SOFT, AppColors.GRADIENT_PRIMARY, AppColors.GRADIENT_SECONDARY, AppColors.WHITE
  ];
}

/** 全部间距常量 */
function allSpacings(): number[] {
  return [AppSpacing.XS, AppSpacing.SM, AppSpacing.MD, AppSpacing.LG, AppSpacing.XL,
    AppSpacing.CARD, AppSpacing.PAGE, AppSpacing.LARGE, AppSpacing.XLARGE];
}

/**
 * 配色与尺寸：颜色写法、深浅阶梯、尺寸阶梯。
 *
 * 这些值不会被逻辑测试覆盖，却会直接决定页面能不能读——一个少写一位的色值会让
 * 组件按默认色渲染而不报错，一组乱序的字号会让层级塌掉。这里守的就是这两类静默问题。
 */
export default function inputMethodThemeTest() {
  describe('InputMethodThemeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0100
     * @tc.name testTheme0001
     * @tc.desc Verify every colour is an uppercase six digit hex literal, which is the only form the toolkit renders.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0001', 0, () => {
      const colors = allColors();
      expect(colors.length).assertEqual(20);
      colors.forEach((value: string) => {
        expect(value.length).assertEqual(7);
        expect(value.startsWith('#')).assertTrue();
        expect(value.toUpperCase()).assertEqual(value);
      });
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0200
     * @tc.name testTheme0002
     * @tc.desc Verify every character after the hash is a hex digit, so a typo like G cannot slip through.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0002', 0, () => {
      const digits = '0123456789ABCDEF';
      allColors().forEach((value: string) => {
        const body = value.substring(1);
        body.split('').forEach((ch: string) => {
          expect(digits.includes(ch)).assertTrue();
        });
      });
      expect(luma('#FFFFFF')).assertEqual(255);
      expect(luma('#000000')).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0300
     * @tc.name testTheme0003
     * @tc.desc Verify the palette has exactly one intentional duplicate, so no second colour was copy
     * pasted by mistake.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0003', 0, () => {
      const colors = allColors();
      expect(new Set<string>(colors).size).assertEqual(19);
      expect(AppColors.WHITE).assertEqual(AppColors.CARD_BG);
      expect(AppColors.PRIMARY === AppColors.DANGER).assertFalse();
      expect(AppColors.SUCCESS === AppColors.WARNING).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0400
     * @tc.name testTheme0004
     * @tc.desc Verify the five text tones darken in the documented order, so the hierarchy stays readable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0004', 0, () => {
      expect(luma(AppColors.TEXT_PRIMARY) < luma(AppColors.TEXT_STRONG)).assertTrue();
      expect(luma(AppColors.TEXT_STRONG) < luma(AppColors.TEXT_SECONDARY)).assertTrue();
      expect(luma(AppColors.TEXT_SECONDARY) < luma(AppColors.TEXT_TERTIARY)).assertTrue();
      expect(luma(AppColors.TEXT_TERTIARY) < luma(AppColors.TEXT_MUTED)).assertTrue();
      expect(luma(AppColors.TEXT_PRIMARY) < 60).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0500
     * @tc.name testTheme0005
     * @tc.desc Verify each soft background is far lighter than its base colour,
     * so coloured text on it stays readable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0005', 0, () => {
      expect(luma(AppColors.DANGER_SOFT) > luma(AppColors.DANGER)).assertTrue();
      expect(luma(AppColors.SUCCESS_SOFT) > luma(AppColors.SUCCESS)).assertTrue();
      expect(luma(AppColors.WARNING_SOFT) > luma(AppColors.WARNING)).assertTrue();
      expect(luma(AppColors.PRIMARY_SOFT) > luma(AppColors.PRIMARY)).assertTrue();
      expect(luma(AppColors.DANGER_SOFT) > 200).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0600
     * @tc.name testTheme0006
     * @tc.desc Verify the nine spacing steps increase strictly, so a card never ends up tighter than its own padding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0006', 0, () => {
      const steps = allSpacings();
      expect(steps.length).assertEqual(9);
      for (let i = 1; i < steps.length; i++) {
        expect(steps[i] > steps[i - 1]).assertTrue();
      }
      expect(AppSpacing.XS).assertEqual(4);
      expect(AppSpacing.XLARGE).assertEqual(24);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0700
     * @tc.name testTheme0007
     * @tc.desc Verify the corner radius ladder grows with the element size, from tag chip to pill button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0007', 0, () => {
      expect(AppRadius.TAG).assertEqual(4);
      expect(AppRadius.TAG < AppRadius.SMALL).assertTrue();
      expect(AppRadius.SMALL < AppRadius.CARD).assertTrue();
      expect(AppRadius.CARD < AppRadius.LARGE).assertTrue();
      expect(AppRadius.LARGE < AppRadius.PILL).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0800
     * @tc.name testTheme0008
     * @tc.desc Verify the eight font sizes increase strictly, so the page keeps a visible title to body contrast.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0008', 0, () => {
      const sizes: number[] = [AppText.CAPTION, AppText.SMALL, AppText.BODY, AppText.LABEL,
        AppText.TITLE, AppText.SECTION, AppText.HEADING, AppText.DISPLAY];
      expect(sizes.length).assertEqual(8);
      for (let i = 1; i < sizes.length; i++) {
        expect(sizes[i] > sizes[i - 1]).assertTrue();
      }
      expect(AppText.CAPTION).assertEqual(10);
      expect(AppText.DISPLAY).assertEqual(20);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_0900
     * @tc.name testTheme0009
     * @tc.desc Verify button heights increase while the mono chip stays shorter than every button.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0009', 0, () => {
      expect(AppSize.BUTTON_SM).assertEqual(30);
      expect(AppSize.BUTTON_SM < AppSize.BUTTON).assertTrue();
      expect(AppSize.BUTTON < AppSize.BUTTON_MD).assertTrue();
      expect(AppSize.MONO_CHIP_HEIGHT < AppSize.BUTTON_SM).assertTrue();
      expect(AppSize.MONO_CHIP_HEIGHT > 0).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_1000
     * @tc.name testTheme0010
     * @tc.desc Verify no spacing or radius step is zero or negative, which would collapse a gap into an overlap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0010', 0, () => {
      allSpacings().forEach((value: number) => {
        expect(value > 0).assertTrue();
      });
      const radii: number[] = [AppRadius.TAG, AppRadius.SMALL, AppRadius.CARD, AppRadius.LARGE, AppRadius.PILL];
      radii.forEach((value: number) => {
        expect(value > 0).assertTrue();
      });
      expect(radii.every((value: number) => value <= 32)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_THEME_1100
     * @tc.name testTheme0011
     * @tc.desc Verify the hero gradient pair is distinct from each other and both sit far lighter than
     * the brand colour.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0011', 0, () => {
      expect(AppColors.GRADIENT_PRIMARY === AppColors.GRADIENT_SECONDARY).assertFalse();
      expect(luma(AppColors.GRADIENT_PRIMARY) > 200).assertTrue();
      expect(luma(AppColors.GRADIENT_SECONDARY) > 200).assertTrue();
      expect(luma(AppColors.GRADIENT_PRIMARY) > luma(AppColors.PRIMARY)).assertTrue();
      expect(AppColors.GRADIENT_SECONDARY.endsWith('FF')).assertTrue();
    });
  });
}
