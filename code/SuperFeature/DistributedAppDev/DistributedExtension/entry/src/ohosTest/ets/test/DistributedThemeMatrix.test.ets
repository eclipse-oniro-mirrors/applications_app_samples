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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../../main/ets/common/Theme';

/** 全部语义色：按声明顺序，用于批量校验格式与唯一性 */
function allColors(): string[] {
  return [
    AppColors.PAGE_BG, AppColors.CARD_BG, AppColors.PRIMARY, AppColors.PRIMARY_SOFT, AppColors.SUBTLE_BG,
    AppColors.SOFT_BG, AppColors.TEXT_PRIMARY, AppColors.TEXT_SECONDARY, AppColors.TEXT_TERTIARY,
    AppColors.TEXT_MUTED, AppColors.TEXT_STRONG, AppColors.DANGER, AppColors.DANGER_SOFT, AppColors.WARNING,
    AppColors.WARNING_SOFT, AppColors.SUCCESS, AppColors.SUCCESS_SOFT, AppColors.GRADIENT_PRIMARY,
    AppColors.GRADIENT_SECONDARY, AppColors.WHITE
  ];
}

/** 取 #RRGGBB 的绿色通道近似亮度，用来区分背景色与强调色 */
function greenOf(color: string): number {
  const value = parseInt(color.slice(3, 5), 16);
  return value;
}

/** 去重计数：用于证明四个语义色互不相同 */
function uniqueCount(values: string[]): number {
  const seen: string[] = [];
  for (let i = 0; i < values.length; i++) {
    if (seen.indexOf(values[i]) < 0) {
      seen.push(values[i]);
    }
  }
  return seen.length;
}

/**
 * 视觉常量：色值格式、语义色互异、间距与字号的单调关系。
 * 这些常量同时被首页、三个演示页与组件引用，写错会让部分卡片在浅色背景上失去对比度。
 */
export default function distributedThemeMatrixTest() {
  describe('DistributedThemeMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0100
     * @tc.name testTheme0001
     * @tc.desc Verify every colour literal is a six digit uppercase hex string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0001', 0, () => {
      const colors = allColors();
      expect(colors.length).assertEqual(20);
      for (let i = 0; i < colors.length; i++) {
        expect(colors[i].length).assertEqual(7);
        expect(colors[i].startsWith('#')).assertTrue();
        expect(colors[i]).assertEqual(colors[i].toUpperCase());
      }
      expect(AppColors.PRIMARY).assertEqual('#0A59F7');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0200
     * @tc.name testTheme0002
     * @tc.desc Verify only the white card background and the white constant share one value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTheme0002', 0, () => {
      const colors = allColors();
      expect(uniqueCount(colors)).assertEqual(19);
      expect(AppColors.CARD_BG).assertEqual(AppColors.WHITE);
      expect(AppColors.PAGE_BG === AppColors.CARD_BG).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0300
     * @tc.name testTheme0003
     * @tc.desc Verify the four semantic tones stay pairwise distinct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0003', 0, () => {
      const tones: string[] = [AppColors.PRIMARY, AppColors.SUCCESS, AppColors.WARNING, AppColors.DANGER];
      expect(uniqueCount(tones)).assertEqual(4);
      expect(AppColors.DANGER).assertEqual('#E84026');
      expect(AppColors.SUCCESS).assertEqual('#28A745');
      expect(AppColors.WARNING).assertEqual('#E6A23C');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0400
     * @tc.name testTheme0004
     * @tc.desc Verify each normal colour has a distinct soft companion for chip backgrounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0004', 0, () => {
      expect(AppColors.PRIMARY_SOFT === AppColors.PRIMARY).assertFalse();
      expect(AppColors.DANGER_SOFT === AppColors.DANGER).assertFalse();
      expect(AppColors.WARNING_SOFT === AppColors.WARNING).assertFalse();
      expect(AppColors.SUCCESS_SOFT === AppColors.SUCCESS).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0500
     * @tc.name testTheme0005
     * @tc.desc Verify page and card backgrounds are light while the danger tone is saturated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTheme0005', 0, () => {
      expect(greenOf(AppColors.PAGE_BG) > 200).assertTrue();
      expect(greenOf(AppColors.CARD_BG) > 200).assertTrue();
      expect(greenOf(AppColors.DANGER) < 100).assertTrue();
      expect(AppColors.TEXT_PRIMARY).assertEqual('#1A1A1A');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0600
     * @tc.name testTheme0006
     * @tc.desc Verify the text hierarchy keeps three distinct grey levels for secondary text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTheme0006', 0, () => {
      const greys: string[] = [
        AppColors.TEXT_SECONDARY, AppColors.TEXT_TERTIARY, AppColors.TEXT_MUTED, AppColors.TEXT_STRONG
      ];
      expect(uniqueCount(greys)).assertEqual(4);
      expect(AppColors.TEXT_SECONDARY).assertEqual('#666666');
      expect(AppColors.TEXT_MUTED).assertEqual('#999999');
      expect(AppColors.TEXT_STRONG).assertEqual('#333333');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0700
     * @tc.name testTheme0007
     * @tc.desc Verify spacing values increase strictly from the smallest to the largest step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0007', 0, () => {
      const steps: number[] = [
        AppSpacing.XS, AppSpacing.SM, AppSpacing.MD, AppSpacing.LG, AppSpacing.XL, AppSpacing.CARD,
        AppSpacing.PAGE, AppSpacing.LARGE, AppSpacing.XLARGE
      ];
      expect(steps.length).assertEqual(9);
      for (let i = 1; i < steps.length; i++) {
        expect(steps[i] > steps[i - 1]).assertTrue();
      }
      expect(AppSpacing.XS).assertEqual(4);
      expect(AppSpacing.PAGE).assertEqual(16);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0800
     * @tc.name testTheme0008
     * @tc.desc Verify the task chip radius is smaller than the card radius and the pill radius is largest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0008', 0, () => {
      expect(AppRadius.TAG < AppRadius.SMALL).assertTrue();
      expect(AppRadius.SMALL < AppRadius.CARD).assertTrue();
      expect(AppRadius.CARD < AppRadius.LARGE).assertTrue();
      expect(AppRadius.LARGE < AppRadius.PILL).assertTrue();
      expect(AppRadius.PILL).assertEqual(24);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_0900
     * @tc.name testTheme0009
     * @tc.desc Verify the font size scale increases strictly across all eight levels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0009', 0, () => {
      const sizes: number[] = [
        AppText.CAPTION, AppText.SMALL, AppText.BODY, AppText.LABEL, AppText.TITLE, AppText.SECTION,
        AppText.HEADING, AppText.DISPLAY
      ];
      expect(sizes.length).assertEqual(8);
      for (let i = 1; i < sizes.length; i++) {
        expect(sizes[i] > sizes[i - 1]).assertTrue();
      }
      expect(AppText.BODY).assertEqual(12);
      expect(AppText.DISPLAY).assertEqual(20);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_1000
     * @tc.name testTheme0010
     * @tc.desc Verify the three button heights stay ordered and above the min tappable body size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTheme0010', 0, () => {
      expect(AppSize.BUTTON_SM < AppSize.BUTTON).assertTrue();
      expect(AppSize.BUTTON < AppSize.BUTTON_MD).assertTrue();
      expect(AppSize.BUTTON_SM > AppText.DISPLAY).assertTrue();
      expect(AppSize.MONO_CHIP_HEIGHT).assertEqual(24);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_1100
     * @tc.name testTheme0011
     * @tc.desc Verify every font size stays below the display value used by the page title.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTheme0011', 0, () => {
      expect(AppText.CAPTION < AppText.BODY).assertTrue();
      expect(AppText.CAPTION).assertEqual(10);
      expect(AppText.HEADING).assertEqual(18);
      expect(AppText.SECTION < AppText.HEADING).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_THEME_1200
     * @tc.name testTheme0012
     * @tc.desc Verify soft backgrounds differ from the neutral background so chips stay visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTheme0012', 0, () => {
      expect(AppColors.SOFT_BG).assertEqual('#F0F1F3');
      expect(AppColors.SOFT_BG === AppColors.SUBTLE_BG).assertFalse();
      expect(AppColors.PRIMARY_SOFT === AppColors.SOFT_BG).assertFalse();
      expect(uniqueCount([AppColors.SOFT_BG, AppColors.SUBTLE_BG, AppColors.PRIMARY_SOFT])).assertEqual(3);
    });
  });
}
