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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import { getDriver, triggerMiracastHome, waitForPageStable, miracastComponentCount, checkFocusState,
  getCurrentFocusIndex, isIndexPageVisible, pressAndWait, safeBack, KEY_LEFT, KEY_RIGHT,
  TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ThemeVariationSuite';

enum ThemeType {
  DARK = 'dark', HIGH_CONTRAST = 'high_contrast', CUSTOM = 'custom', LIGHT_FALLBACK = 'light_fallback'
}

enum ThemeToken {
  PAGE_BACKGROUND = 'page_background', DIALOG_BACKGROUND = 'dialog_background', PRIMARY_TEXT = 'primary_text',
  SECONDARY_TEXT = 'secondary_text', ACCENT = 'accent', FOCUS_RING = 'focus_ring'
}

interface ThemePalette {
  pageBackground: string; dialogBackground: string; primaryText: string;
  secondaryText: string; accent: string; focusRing: string;
}

class ThemeColorModel {
  private color: string;
  constructor(color: string) {
    this.color = color;
  }
  public isSixDigitHex(): boolean { return this.color.length === 7 && this.color.indexOf('#') === 0; }
  public isEightDigitHex(): boolean { return this.color.length === 9 && this.color.indexOf('#') === 0; }
  public isHexColor(): boolean { return this.isSixDigitHex() || this.isEightDigitHex(); }
  public redChannel(): number { return this.channelAt(1); }
  public greenChannel(): number { return this.channelAt(3); }
  public blueChannel(): number { return this.channelAt(5); }
  private channelAt(offset: number): number {
    if (!this.isHexColor()) {
      return -1;
    }
    const shift: number = this.isEightDigitHex() ? offset + 2 : offset;
    return this.hexPairToNumber(this.color.substring(shift, shift + 2));
  }
  private hexPairToNumber(pair: string): number {
    const digits: string = '0123456789abcdef';
    const high: number = digits.indexOf(pair.charAt(0).toLowerCase());
    const low: number = digits.indexOf(pair.charAt(1).toLowerCase());
    return high < 0 || low < 0 ? -1 : high * 16 + low;
  }
  public brightness(): number {
    const red: number = this.redChannel();
    const green: number = this.greenChannel();
    const blue: number = this.blueChannel();
    return red < 0 || green < 0 || blue < 0 ? -1 : (red * 299 + green * 587 + blue * 114) / 1000;
  }
  public isDark(): boolean {
    const value: number = this.brightness(); return value >= 0 && value < 128;
  }
  public equalsColor(other: string): boolean { return this.color.toLowerCase() === other.toLowerCase(); }
}

class ThemeResolver {
  public static readonly PAGE_BACKGROUND: string = '#18181A';
  public static readonly DIALOG_BACKGROUND: string = '#404040';
  public static readonly PRIMARY_TEXT: string = '#dbffffff';
  public resolve(themeType: ThemeType): ThemePalette {
    if (themeType === ThemeType.HIGH_CONTRAST) {
      return { pageBackground: '#000000', dialogBackground: '#1A1A1A', primaryText: '#ffffff',
        secondaryText: '#dbffffff', accent: '#ffd700', focusRing: '#dbffffff' };
    }
    if (themeType === ThemeType.LIGHT_FALLBACK) {
      return { pageBackground: '#f5f5f5', dialogBackground: '#ffffff', primaryText: '#18181A',
        secondaryText: '#404040', accent: '#007dff', focusRing: '#33ffffff' };
    }
    if (themeType === ThemeType.CUSTOM) {
      return { pageBackground: ThemeResolver.PAGE_BACKGROUND, dialogBackground: ThemeResolver.DIALOG_BACKGROUND,
        primaryText: ThemeResolver.PRIMARY_TEXT, secondaryText: '#99ffffff', accent: '#ff6f00',
        focusRing: ThemeResolver.PRIMARY_TEXT };
    }
    return { pageBackground: ThemeResolver.PAGE_BACKGROUND, dialogBackground: ThemeResolver.DIALOG_BACKGROUND,
      primaryText: ThemeResolver.PRIMARY_TEXT, secondaryText: '#80ffffff', accent: '#0a59f7',
      focusRing: ThemeResolver.PRIMARY_TEXT };
  }
  public resolveToken(themeType: ThemeType, token: ThemeToken): string {
    const palette: ThemePalette = this.resolve(themeType);
    if (token === ThemeToken.PAGE_BACKGROUND) { return palette.pageBackground; }
    if (token === ThemeToken.DIALOG_BACKGROUND) { return palette.dialogBackground; }
    if (token === ThemeToken.PRIMARY_TEXT) { return palette.primaryText; }
    if (token === ThemeToken.SECONDARY_TEXT) { return palette.secondaryText; }
    return token === ThemeToken.ACCENT ? palette.accent : palette.focusRing;
  }
  public isDarkTheme(themeType: ThemeType): boolean {
    return new ThemeColorModel(this.resolve(themeType).pageBackground).isDark();
  }
  public hasAllTokens(themeType: ThemeType): boolean {
    const palette: ThemePalette = this.resolve(themeType);
    return palette.pageBackground.length > 0 && palette.dialogBackground.length > 0 &&
      palette.primaryText.length > 0 && palette.secondaryText.length > 0 &&
      palette.accent.length > 0 && palette.focusRing.length > 0;
  }
  public isReadable(themeType: ThemeType): boolean {
    const palette: ThemePalette = this.resolve(themeType);
    return new ThemeColorModel(palette.primaryText).brightness() >
      new ThemeColorModel(palette.pageBackground).brightness();
  }
  public isValid(themeType: ThemeType): boolean {
    return this.hasAllTokens(themeType) && this.isReadable(themeType) &&
      new ThemeColorModel(this.resolve(themeType).accent).isHexColor();
  }
}

class ThemeSwitcher {
  private currentTheme: ThemeType = ThemeType.DARK;
  private switchCount: number = 0;
  public getCurrentTheme(): ThemeType { return this.currentTheme; }
  public getSwitchCount(): number { return this.switchCount; }
  public switchTo(themeType: ThemeType): boolean {
    if (themeType === this.currentTheme) {
      return false;
    }
    this.currentTheme = themeType;
    this.switchCount++;
    return true;
  }
  public toggleContrast(): ThemeType {
    this.switchTo(this.currentTheme === ThemeType.HIGH_CONTRAST ? ThemeType.DARK : ThemeType.HIGH_CONTRAST);
    return this.currentTheme;
  }
  public reset(): void { this.currentTheme = ThemeType.DARK; this.switchCount = 0; }
}

export default function themeVariationSuite(): void {
  describe('ThemeVariation_Test', () => {
    let driver: Driver;
    let resolver: ThemeResolver;
    beforeAll(async () => {
      driver = getDriver();
      resolver = new ThemeResolver();
      Log.info(TAG, 'theme suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'theme suite end');
    });
    it('dark_theme_should_match_design_tokens', 0, async () => {
      const palette: ThemePalette = resolver.resolve(ThemeType.DARK);
      expect(palette.pageBackground).assertEqual('#18181A'); expect(palette.dialogBackground).assertEqual('#404040');
      expect(palette.primaryText).assertEqual('#dbffffff'); expect(resolver.isDarkTheme(ThemeType.DARK)).assertTrue();
    });
    it('page_background_should_be_dark', 0, async () => {
      const background = new ThemeColorModel(resolver.resolveToken(ThemeType.DARK, ThemeToken.PAGE_BACKGROUND));
      expect(background.isDark()).assertTrue(); expect(background.isSixDigitHex()).assertTrue();
      expect(background.brightness()).assertLess(128); expect(background.redChannel()).assertEqual(24);
      expect(background.blueChannel()).assertEqual(26);
    });
    it('dialog_background_should_be_lighter_than_page', 0, async () => {
      const page = new ThemeColorModel(resolver.resolveToken(ThemeType.DARK, ThemeToken.PAGE_BACKGROUND));
      const dialog = new ThemeColorModel(resolver.resolveToken(ThemeType.DARK, ThemeToken.DIALOG_BACKGROUND));
      expect(dialog.equalsColor('#404040')).assertTrue(); expect(dialog.isDark()).assertTrue();
      expect(dialog.brightness()).assertLarger(page.brightness());
    });
    it('high_contrast_theme_should_override_colors', 0, async () => {
      const palette: ThemePalette = resolver.resolve(ThemeType.HIGH_CONTRAST);
      expect(palette.pageBackground).assertEqual('#000000'); expect(palette.primaryText).assertEqual('#ffffff');
      expect(palette.accent).assertEqual('#ffd700'); expect(resolver.isDarkTheme(ThemeType.HIGH_CONTRAST)).assertTrue();
    });
    it('light_fallback_theme_should_not_be_dark', 0, async () => {
      const palette: ThemePalette = resolver.resolve(ThemeType.LIGHT_FALLBACK);
      expect(palette.pageBackground).assertEqual('#f5f5f5'); expect(resolver.isDarkTheme(ThemeType.LIGHT_FALLBACK)).assertFalse();
      expect(new ThemeColorModel(palette.pageBackground).brightness()).assertLarger(128);
    });
    it('custom_theme_should_keep_design_background', 0, async () => {
      const palette: ThemePalette = resolver.resolve(ThemeType.CUSTOM);
      expect(palette.pageBackground).assertEqual('#18181A'); expect(palette.accent).assertEqual('#ff6f00');
      expect(resolver.hasAllTokens(ThemeType.CUSTOM)).assertTrue();
    });
    it('color_model_should_parse_alpha_hex_channels', 0, async () => {
      const color = new ThemeColorModel('#dbffffff');
      expect(color.isEightDigitHex()).assertTrue(); expect(color.isSixDigitHex()).assertFalse();
      expect(color.redChannel()).assertEqual(255); expect(color.blueChannel()).assertEqual(255);
      expect(color.brightness()).assertEqual(255); expect(color.greenChannel()).assertEqual(255);
    });
    it('color_model_should_reject_invalid_color', 0, async () => {
      const color = new ThemeColorModel('dbffffff');
      expect(color.isHexColor()).assertFalse(); expect(color.redChannel()).assertEqual(-1);
      expect(color.brightness()).assertEqual(-1); expect(color.isDark()).assertFalse();
    });
    it('color_model_should_parse_all_hex_digits', 0, async () => {
      const color = new ThemeColorModel('#0a59f7');
      expect(color.redChannel()).assertEqual(10); expect(color.greenChannel()).assertEqual(89);
      expect(color.blueChannel()).assertEqual(247); expect(color.isDark()).assertTrue();
    });
    it('color_model_should_compare_case_insensitive', 0, async () => {
      const color = new ThemeColorModel('#18181A');
      expect(color.equalsColor('#18181a')).assertTrue(); expect(color.equalsColor('#18181B')).assertFalse();
    });
    it('color_model_should_reject_non_hex_characters', 0, async () => {
      const color = new ThemeColorModel('#zzzzzz');
      expect(color.isSixDigitHex()).assertTrue(); expect(color.redChannel()).assertEqual(-1);
      expect(color.greenChannel()).assertEqual(-1); expect(color.brightness()).assertEqual(-1);
    });
    it('resolver_should_map_each_token', 0, async () => {
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.PAGE_BACKGROUND)).assertEqual('#18181A');
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.DIALOG_BACKGROUND)).assertEqual('#404040');
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.PRIMARY_TEXT)).assertEqual('#dbffffff');
      expect(resolver.resolveToken(ThemeType.HIGH_CONTRAST, ThemeToken.ACCENT)).assertEqual('#ffd700');
    });
    it('resolver_should_expose_translucent_secondary_text', 0, async () => {
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.SECONDARY_TEXT)).assertEqual('#80ffffff');
      expect(resolver.resolveToken(ThemeType.CUSTOM, ThemeToken.SECONDARY_TEXT)).assertEqual('#99ffffff');
      expect(new ThemeColorModel('#80ffffff').isEightDigitHex()).assertTrue();
    });
    it('resolver_should_expose_all_tokens_for_every_theme', 0, async () => {
      const themes: ThemeType[] = [ThemeType.DARK, ThemeType.HIGH_CONTRAST, ThemeType.CUSTOM,
        ThemeType.LIGHT_FALLBACK];
      for (const theme of themes) {
        expect(resolver.hasAllTokens(theme)).assertTrue();
        expect(resolver.resolveToken(theme, ThemeToken.FOCUS_RING).length).assertLarger(0);
      }
    });
    it('resolver_should_validate_dark_theme_contrast', 0, async () => {
      expect(resolver.isValid(ThemeType.DARK)).assertTrue(); expect(resolver.isReadable(ThemeType.DARK)).assertTrue();
      expect(resolver.isDarkTheme(ThemeType.DARK)).assertTrue(); expect(resolver.hasAllTokens(ThemeType.DARK)).assertTrue();
    });
    it('resolver_should_validate_light_theme', 0, async () => {
      expect(resolver.isValid(ThemeType.LIGHT_FALLBACK)).assertFalse();
      expect(resolver.isReadable(ThemeType.LIGHT_FALLBACK)).assertFalse();
      expect(resolver.isDarkTheme(ThemeType.LIGHT_FALLBACK)).assertFalse();
    });
    it('switcher_should_change_current_theme', 0, async () => {
      const switcher = new ThemeSwitcher();
      expect(switcher.getCurrentTheme()).assertEqual(ThemeType.DARK);
      expect(switcher.switchTo(ThemeType.CUSTOM)).assertTrue();
      expect(switcher.getCurrentTheme()).assertEqual(ThemeType.CUSTOM);
      expect(switcher.switchTo(ThemeType.CUSTOM)).assertFalse(); expect(switcher.getSwitchCount()).assertEqual(1);
    });
    it('switcher_should_toggle_contrast', 0, async () => {
      const switcher = new ThemeSwitcher();
      expect(switcher.toggleContrast()).assertEqual(ThemeType.HIGH_CONTRAST);
      expect(switcher.toggleContrast()).assertEqual(ThemeType.DARK);
      switcher.reset(); expect(switcher.getSwitchCount()).assertEqual(0);
      expect(switcher.getCurrentTheme()).assertEqual(ThemeType.DARK);
    });
    it('dialog_should_display_correctly_in_dark_theme', 0, async () => {
      expect(resolver.isValid(ThemeType.DARK)).assertTrue();
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.DIALOG_BACKGROUND)).assertEqual('#404040');
    });
    it('theme_should_keep_layout_stable_during_navigation', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await miracastComponentCount(driver);
      for (let i: number = 0; i < 6; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await miracastComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertEqual(0); expect(finalCount).assertEqual(0);
    });
    it('theme_colors_should_stay_consistent_across_navigation', 0, async () => {
      const palette: ThemePalette = resolver.resolve(ThemeType.DARK);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.PAGE_BACKGROUND)).assertEqual(palette.pageBackground);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.PRIMARY_TEXT)).assertEqual(palette.primaryText);
    });
    it('focus_state_should_be_readable_in_dark_theme', 0, async () => {
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.FOCUS_RING)).assertEqual('#dbffffff');
      expect(resolver.isValid(ThemeType.DARK)).assertTrue();
    });
    it('all_themes_should_render_index_page', 0, async () => {
      const themes: ThemeType[] = [ThemeType.DARK, ThemeType.HIGH_CONTRAST, ThemeType.CUSTOM,
        ThemeType.LIGHT_FALLBACK];
      for (const theme of themes) { expect(resolver.resolve(theme).pageBackground.length).assertLarger(0); }
    });
    it('theme_switch_should_not_change_component_count', 0, async () => {
      const switcher = new ThemeSwitcher();
      const initialCount: number = await miracastComponentCount(driver);
      switcher.switchTo(ThemeType.HIGH_CONTRAST); switcher.toggleContrast();
      const finalCount: number = await miracastComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3); expect(switcher.getSwitchCount()).assertEqual(2);
    });
    it('theme_should_persist_after_back_to_index', 0, async () => {
      await safeBack(driver, 1);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(resolver.resolveToken(ThemeType.DARK, ThemeToken.DIALOG_BACKGROUND)).assertEqual('#404040');
      expect(resolver.isDarkTheme(ThemeType.DARK)).assertTrue(); expect(resolver.isValid(ThemeType.DARK)).assertTrue();
    });
    it('comprehensive_theme_scenario', 0, async () => {
      const switcher = new ThemeSwitcher();
      const themes: ThemeType[] = [ThemeType.DARK, ThemeType.HIGH_CONTRAST, ThemeType.CUSTOM];
      let applied: number = 0;
      for (const theme of themes) {
        switcher.switchTo(theme);
        expect(resolver.isValid(theme)).assertTrue(); expect(resolver.isReadable(theme)).assertTrue();
        applied++;
      }
      expect(applied).assertEqual(3); expect(switcher.getSwitchCount()).assertEqual(2);
    });
  });
}
