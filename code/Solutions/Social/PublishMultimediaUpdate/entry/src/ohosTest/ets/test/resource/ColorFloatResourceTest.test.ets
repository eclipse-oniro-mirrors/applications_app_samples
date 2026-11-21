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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
// Byte weights of the ARGB channels as plain decimal numbers; bitwise
// operators are avoided so the extraction stays valid for opaque colours
// whose ARGB value exceeds the signed 32 bit range.
const ALPHA_SHIFT: number = 16777216;
const RED_SHIFT: number = 65536;
const GREEN_SHIFT: number = 256;
const CHANNEL_MASK: number = 256;
/**
 * Colour and opacity contract of the feed chrome.
 * Colours reach the renderer as ARGB integers, so a wrong literal (or a
 * collapsed shorthand) changes the pixel the user sees.
 */
export default function colorFloatResourceTest() {
  describe('ColorFloatResourceTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0100
     * @tc.name StartWindowWhite001
     * @tc.desc Verify start window white
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StartWindowWhite_001', 0, (): void => {
      Logger.info(TAG, 'StartWindowWhite_001 begin');
      const background: number = manager.getColorSync($r('app.color.start_window_background'));
      Logger.info(TAG, 'startWindowBackground=' + background);
      expect(background).assertEqual(0xFFFFFFFF);
      Logger.info(TAG, 'StartWindowWhite_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0200
     * @tc.name StartWindowOpaque002
     * @tc.desc Verify start window opaque
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StartWindowOpaque_002', 0, (): void => {
      Logger.info(TAG, 'StartWindowOpaque_002 begin');
      const background: number = manager.getColorSync($r('app.color.start_window_background'));
      const alpha: number = Math.floor(background / ALPHA_SHIFT);
      Logger.info(TAG, 'startWindowAlpha=' + alpha);
      expect(alpha).assertEqual(255);
      Logger.info(TAG, 'StartWindowOpaque_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0300
     * @tc.name TitleFontColor003
     * @tc.desc Verify title font color
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TitleFontColor_003', 0, (): void => {
      Logger.info(TAG, 'TitleFontColor_003 begin');
      const titleColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color'));
      Logger.info(TAG, 'titleFontColor=' + titleColor);
      expect(titleColor).assertEqual(0xFF182431);
      Logger.info(TAG, 'TitleFontColor_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0400
     * @tc.name TitleFontChannels004
     * @tc.desc Verify title font channels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TitleFontChannels_004', 0, (): void => {
      Logger.info(TAG, 'TitleFontChannels_004 begin');
      const titleColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color'));
      const red: number = Math.floor(titleColor / RED_SHIFT) % CHANNEL_MASK;
      const green: number = Math.floor(titleColor / GREEN_SHIFT) % CHANNEL_MASK;
      const blue: number = titleColor % CHANNEL_MASK;
      Logger.info(TAG, 'titleRed=' + red + ', titleGreen=' + green + ', titleBlue=' + blue);
      expect(red).assertEqual(24);
      expect(green).assertEqual(36);
      expect(blue).assertEqual(49);
      Logger.info(TAG, 'TitleFontChannels_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0500
     * @tc.name TitleFontOpaque005
     * @tc.desc Verify title font opaque
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TitleFontOpaque_005', 0, (): void => {
      Logger.info(TAG, 'TitleFontOpaque_005 begin');
      const titleColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color'));
      const alpha: number = Math.floor(titleColor / ALPHA_SHIFT);
      Logger.info(TAG, 'titleAlpha=' + alpha);
      expect(alpha).assertEqual(255);
      const solid: boolean = alpha === 255;
      expect(solid).assertTrue();
      Logger.info(TAG, 'TitleFontOpaque_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0600
     * @tc.name DividerColor006
     * @tc.desc Verify divider color
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DividerColor_006', 0, (): void => {
      Logger.info(TAG, 'DividerColor_006 begin');
      const dividerColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_divider_color'));
      Logger.info(TAG, 'dividerColor=' + dividerColor);
      expect(dividerColor).assertEqual(0x0C000000);
      Logger.info(TAG, 'DividerColor_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0700
     * @tc.name DividerAlpha007
     * @tc.desc Verify divider alpha
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DividerAlpha_007', 0, (): void => {
      Logger.info(TAG, 'DividerAlpha_007 begin');
      const dividerColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_divider_color'));
      const alpha: number = Math.floor(dividerColor / ALPHA_SHIFT);
      const red: number = Math.floor(dividerColor / RED_SHIFT) % CHANNEL_MASK;
      Logger.info(TAG, 'dividerAlpha=' + alpha + ', dividerRed=' + red);
      expect(alpha).assertEqual(12);
      expect(red).assertEqual(0);
      const translucent: boolean = alpha !== 255;
      expect(translucent).assertTrue();
      Logger.info(TAG, 'DividerAlpha_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0800
     * @tc.name DividerDiffersFromTitle008
     * @tc.desc Verify divider differs from title
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DividerDiffersFromTitle_008', 0, (): void => {
      Logger.info(TAG, 'DividerDiffersFromTitle_008 begin');
      const dividerColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_divider_color'));
      const titleColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color'));
      const distinct: boolean = dividerColor !== titleColor;
      Logger.info(TAG, 'dividerColor=' + dividerColor + ', titleColor=' + titleColor
        + ', distinct=' + distinct);
      expect(distinct).assertTrue();
      const dividerAlpha: number = Math.floor(dividerColor / ALPHA_SHIFT);
      const titleAlpha: number = Math.floor(titleColor / ALPHA_SHIFT);
      const alphaGap: number = titleAlpha - dividerAlpha;
      expect(alphaGap).assertEqual(243);
      Logger.info(TAG, 'DividerDiffersFromTitle_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_0900
     * @tc.name JumpButtonBackground009
     * @tc.desc Verify jump button background
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JumpButtonBackground_009', 0, (): void => {
      Logger.info(TAG, 'JumpButtonBackground_009 begin');
      const buttonBgc: number = manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_bgc'));
      Logger.info(TAG, 'jumpButtonBgc=' + buttonBgc);
      expect(buttonBgc).assertEqual(0xFFAEAEAE);
      Logger.info(TAG, 'JumpButtonBackground_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1000
     * @tc.name JumpButtonGrey010
     * @tc.desc Verify jump button grey
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JumpButtonGrey_010', 0, (): void => {
      Logger.info(TAG, 'JumpButtonGrey_010 begin');
      const buttonBgc: number = manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_bgc'));
      const red: number = Math.floor(buttonBgc / RED_SHIFT) % CHANNEL_MASK;
      const green: number = Math.floor(buttonBgc / GREEN_SHIFT) % CHANNEL_MASK;
      const blue: number = buttonBgc % CHANNEL_MASK;
      Logger.info(TAG, 'grey channels=' + red + ',' + green + ',' + blue);
      expect(red).assertEqual(174);
      expect(green).assertEqual(174);
      expect(blue).assertEqual(174);
      const neutral: boolean = red === green;
      expect(neutral).assertTrue();
      Logger.info(TAG, 'JumpButtonGrey_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1100
     * @tc.name JumpButtonFontColor011
     * @tc.desc Verify jump button font color
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JumpButtonFontColor_011', 0, (): void => {
      Logger.info(TAG, 'JumpButtonFontColor_011 begin');
      const fontColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_font_color'));
      Logger.info(TAG, 'jumpButtonFontColor=' + fontColor);
      expect(fontColor).assertEqual(0xFF000000);
      const expandedShorthand: boolean = fontColor === 0xFF000000;
      expect(expandedShorthand).assertTrue();
      Logger.info(TAG, 'JumpButtonFontColor_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1200
     * @tc.name JumpButtonContrast012
     * @tc.desc Verify jump button contrast
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JumpButtonContrast_012', 0, (): void => {
      Logger.info(TAG, 'JumpButtonContrast_012 begin');
      const fontColor: number = manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_font_color'));
      const buttonBgc: number = manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_bgc'));
      const readable: boolean = fontColor !== buttonBgc;
      Logger.info(TAG, 'fontColor=' + fontColor + ', bgc=' + buttonBgc + ', readable=' + readable);
      expect(readable).assertTrue();
      const fontRed: number = Math.floor(fontColor / RED_SHIFT) % CHANNEL_MASK;
      const bgcRed: number = Math.floor(buttonBgc / RED_SHIFT) % CHANNEL_MASK;
      const redGap: number = bgcRed - fontRed;
      expect(redGap).assertEqual(174);
      Logger.info(TAG, 'JumpButtonContrast_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1300
     * @tc.name PublishButtonBackground013
     * @tc.desc Verify publish button background
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishButtonBackground_013', 0, (): void => {
      Logger.info(TAG, 'PublishButtonBackground_013 begin');
      const publishBgc: number = manager.getColorSync($r('app.color.image_comment_button_publish_background'));
      Logger.info(TAG, 'publishBackground=' + publishBgc);
      expect(publishBgc).assertEqual(0xFFBE1D1D);
      Logger.info(TAG, 'PublishButtonBackground_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1400
     * @tc.name PublishButtonChannels014
     * @tc.desc Verify publish button channels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishButtonChannels_014', 0, (): void => {
      Logger.info(TAG, 'PublishButtonChannels_014 begin');
      const publishBgc: number = manager.getColorSync($r('app.color.image_comment_button_publish_background'));
      const red: number = Math.floor(publishBgc / RED_SHIFT) % CHANNEL_MASK;
      const green: number = Math.floor(publishBgc / GREEN_SHIFT) % CHANNEL_MASK;
      const blue: number = publishBgc % CHANNEL_MASK;
      Logger.info(TAG, 'publish channels=' + red + ',' + green + ',' + blue);
      expect(red).assertEqual(190);
      expect(green).assertEqual(29);
      expect(blue).assertEqual(29);
      const redDominant: number = red - green;
      expect(redDominant).assertEqual(161);
      Logger.info(TAG, 'PublishButtonChannels_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1500
     * @tc.name PublishButtonOpaque015
     * @tc.desc Verify publish button opaque
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishButtonOpaque_015', 0, (): void => {
      Logger.info(TAG, 'PublishButtonOpaque_015 begin');
      const publishBgc: number = manager.getColorSync($r('app.color.image_comment_button_publish_background'));
      const alpha: number = Math.floor(publishBgc / ALPHA_SHIFT);
      Logger.info(TAG, 'publishAlpha=' + alpha);
      expect(alpha).assertEqual(255);
      Logger.info(TAG, 'PublishButtonOpaque_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1600
     * @tc.name AllColorsAreIntegers016
     * @tc.desc Verify all colors are integers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllColorsAreIntegers_016', 0, (): void => {
      Logger.info(TAG, 'AllColorsAreIntegers_016 begin');
      const colors: Array<Resource> = [
        $r('app.color.start_window_background'),
        $r('app.color.publish_multimedia_updates_title_font_color'),
        $r('app.color.publish_multimedia_updates_divider_color'),
        $r('app.color.publish_multimedia_updates_jump_button_bgc'),
        $r('app.color.publish_multimedia_updates_jump_button_font_color'),
        $r('app.color.image_comment_button_publish_background')
      ];
      let fractional: number = 0;
      for (let index: number = 0; index < colors.length; index++) {
        const value: number = manager.getColorSync(colors[index]);
        const remainder: number = value % 1;
        Logger.info(TAG, 'colour ' + index + '=' + value + ', remainder=' + remainder);
        if (remainder !== 0) {
          fractional += 1;
        }
      }
      expect(colors.length).assertEqual(6);
      expect(fractional).assertEqual(0);
      Logger.info(TAG, 'AllColorsAreIntegers_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1700
     * @tc.name OnlyDividerTranslucent017
     * @tc.desc Verify only divider translucent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OnlyDividerTranslucent_017', 0, (): void => {
      Logger.info(TAG, 'OnlyDividerTranslucent_017 begin');
      const colors: Array<Resource> = [
        $r('app.color.start_window_background'),
        $r('app.color.publish_multimedia_updates_title_font_color'),
        $r('app.color.publish_multimedia_updates_divider_color'),
        $r('app.color.publish_multimedia_updates_jump_button_bgc'),
        $r('app.color.publish_multimedia_updates_jump_button_font_color'),
        $r('app.color.image_comment_button_publish_background')
      ];
      let opaqueCount: number = 0;
      let translucentCount: number = 0;
      for (let index: number = 0; index < colors.length; index++) {
        const value: number = manager.getColorSync(colors[index]);
        const alpha: number = Math.floor(value / ALPHA_SHIFT);
        Logger.info(TAG, 'colour ' + index + ' alpha=' + alpha);
        if (alpha === 255) {
          opaqueCount += 1;
        }
        if (alpha !== 255) {
          translucentCount += 1;
        }
      }
      expect(opaqueCount).assertEqual(5);
      expect(translucentCount).assertEqual(1);
      Logger.info(TAG, 'OnlyDividerTranslucent_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1800
     * @tc.name OpacityExact018
     * @tc.desc Verify opacity exact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OpacityExact_018', 0, (): void => {
      Logger.info(TAG, 'OpacityExact_018 begin');
      const opacity: number = manager.getNumber($r('app.float.publish_multimedia_updates_opacity'));
      Logger.info(TAG, 'opacity=' + opacity);
      const tenths: number = Math.round(opacity * 10);
      Logger.info(TAG, 'tenths=' + tenths);
      expect(tenths).assertEqual(6);
      const withinUnit: boolean = opacity === Math.min(opacity, 1);
      Logger.info(TAG, 'withinUnit=' + withinUnit);
      expect(withinUnit).assertTrue();
      Logger.info(TAG, 'OpacityExact_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_1900
     * @tc.name OpacityFraction019
     * @tc.desc Verify opacity fraction
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OpacityFraction_019', 0, (): void => {
      Logger.info(TAG, 'OpacityFraction_019 begin');
      const opacity: number = manager.getNumber($r('app.float.publish_multimedia_updates_opacity'));
      const belowOne: boolean = opacity === Math.min(opacity, 1);
      Logger.info(TAG, 'belowOne=' + belowOne);
      expect(belowOne).assertTrue();
      const aboveZero: boolean = opacity === Math.max(opacity, 0);
      Logger.info(TAG, 'aboveZero=' + aboveZero);
      expect(aboveZero).assertTrue();
      const scaled: number = Math.round(opacity * 10);
      Logger.info(TAG, 'scaled=' + scaled);
      expect(scaled).assertEqual(6);
      Logger.info(TAG, 'OpacityFraction_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_2000
     * @tc.name OpacityNotWhole020
     * @tc.desc Verify opacity not whole
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OpacityNotWhole_020', 0, (): void => {
      Logger.info(TAG, 'OpacityNotWhole_020 begin');
      const opacity: number = manager.getNumber($r('app.float.publish_multimedia_updates_opacity'));
      const floored: number = Math.floor(opacity);
      const whole: boolean = opacity === floored;
      Logger.info(TAG, 'opacity=' + opacity + ', floored=' + floored + ', whole=' + whole);
      expect(whole).assertFalse();
      const hundredfold: number = Math.round(opacity * 100);
      Logger.info(TAG, 'hundredfold=' + hundredfold);
      expect(hundredfold).assertEqual(60);
      Logger.info(TAG, 'OpacityNotWhole_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_2100
     * @tc.name TitleReadIsStable021
     * @tc.desc Verify title read is stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TitleReadIsStable_021', 0, (): void => {
      Logger.info(TAG, 'TitleReadIsStable_021 begin');
      const first: number = manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color'));
      const second: number = manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color'));
      const stable: boolean = first === second;
      Logger.info(TAG, 'first=' + first + ', second=' + second + ', stable=' + stable);
      expect(stable).assertTrue();
      expect(second).assertEqual(0xFF182431);
      Logger.info(TAG, 'TitleReadIsStable_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_COLOR_2200
     * @tc.name SixColoursDistinct022
     * @tc.desc Verify six colours distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SixColoursDistinct_022', 0, (): void => {
      Logger.info(TAG, 'SixColoursDistinct_022 begin');
      const values: Array<number> = [
        manager.getColorSync($r('app.color.start_window_background')),
        manager.getColorSync($r('app.color.publish_multimedia_updates_title_font_color')),
        manager.getColorSync($r('app.color.publish_multimedia_updates_divider_color')),
        manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_bgc')),
        manager.getColorSync($r('app.color.publish_multimedia_updates_jump_button_font_color')),
        manager.getColorSync($r('app.color.image_comment_button_publish_background'))
      ];
      let unique: Array<number> = [];
      for (let index: number = 0; index < values.length; index++) {
        if (unique.indexOf(values[index]) < 0) {
          unique.push(values[index]);
        }
      }
      Logger.info(TAG, 'unique colour count=' + unique.length);
      expect(unique.length).assertEqual(6);
      Logger.info(TAG, 'SixColoursDistinct_022 end');
    });
  });
}
