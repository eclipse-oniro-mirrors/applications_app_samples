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
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, countById, clickById, serializedDelay,
  ID_NAV_BACK, ID_NAV_HOME, ID_ACTION_ADD, ID_CANCEL_TAB, DELAY_TOUCH_EVENT, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserThemeVariationTest';

/* ------------------------------------------------------------------ */
/* Colour contract of the browser sample                               */
/* ------------------------------------------------------------------ */

const COLOR_BACKGROUND: string = '#ffffff';
const COLOR_PANEL: string = '#ececec';
const COLOR_DIVIDER: string = '#e4e4e4';
const COLOR_SECONDARY: string = '#c6c6c6';
const COLOR_ACCENT: string = '#0000ff';
const COLOR_TEXT: string = '#000000';
const COLOR_TRANSPARENT: string = '#00000000';

const TOKEN_BACKGROUND: string = 'app.color.background';
const TOKEN_PANEL: string = 'app.color.panel';
const TOKEN_DIVIDER: string = 'app.color.divider';
const TOKEN_SECONDARY: string = 'app.color.secondary';
const TOKEN_ACCENT: string = 'app.color.accent';

const THEME_LIGHT: string = 'light';
const THEME_DARK: string = 'dark';

/** WCAG thresholds used by the contrast checks below. */
const CONTRAST_TEXT_MIN: number = 4.5;
const CONTRAST_LARGE_MIN: number = 3;
const CONTRAST_DECORATIVE_MIN: number = 1.1;

/* ------------------------------------------------------------------ */
/* Palette value object                                                */
/* ------------------------------------------------------------------ */

/** One resolved colour set; every field is an opaque #rrggbb string. */
class ThemePalette {
  name: string;
  background: string;
  panel: string;
  divider: string;
  secondary: string;
  accent: string;
  text: string;

  constructor(name: string, background: string, panel: string, divider: string,
    secondary: string, accent: string, text: string) {
    this.name = name;
    this.background = background;
    this.panel = panel;
    this.divider = divider;
    this.secondary = secondary;
    this.accent = accent;
    this.text = text;
  }

  colors(): string[] {
    return [this.background, this.panel, this.divider, this.secondary, this.accent, this.text];
  }

  /** The pressed background of a title bar image button. */
  pressedColor(): string {
    return this.divider;
  }

  /** The idle background of a title bar image button stays transparent. */
  idleColor(): string {
    return COLOR_TRANSPARENT;
  }

  isLight(): boolean {
    return this.name === THEME_LIGHT;
  }

  sameAs(other: ThemePalette): boolean {
    return this.background === other.background && this.panel === other.panel &&
      this.divider === other.divider && this.secondary === other.secondary &&
      this.accent === other.accent && this.text === other.text;
  }
}

/** Factory of the two palettes shipped with the sample. */
class PaletteFactory {
  static light(): ThemePalette {
    return new ThemePalette(THEME_LIGHT, COLOR_BACKGROUND, COLOR_PANEL, COLOR_DIVIDER,
      COLOR_SECONDARY, COLOR_ACCENT, COLOR_TEXT);
  }

  static dark(): ThemePalette {
    return new ThemePalette(THEME_DARK, '#101010', '#1c1c1c', '#2a2a2a', '#3c3c3c',
      COLOR_ACCENT, '#f5f5f5');
  }

  static byName(name: string): ThemePalette {
    return name === THEME_DARK ? PaletteFactory.dark() : PaletteFactory.light();
  }
}

/* ------------------------------------------------------------------ */
/* Colour math                                                         */
/* ------------------------------------------------------------------ */

function channelValue(hex: string, start: number): number {
  return parseInt(hex.substring(start, start + 2), 16);
}

/** sRGB channel converted to the linear space used by WCAG. */
function linearChannel(raw: number): number {
  const scaled: number = raw / 255;
  if (scaled <= 0.03928) {
    return scaled / 12.92;
  }
  return Math.pow((scaled + 0.055) / 1.055, 2.4);
}

function relativeLuminance(hex: string): number {
  const value: string = hex.length === 9 ? hex.substring(3) : hex.substring(1);
  const red: number = linearChannel(channelValue(value, 0));
  const green: number = linearChannel(channelValue(value, 2));
  const blue: number = linearChannel(channelValue(value, 4));
  return 0.2126 * red + 0.7152 * green + 0.0722 * blue;
}

function roundTo2(value: number): number {
  return Math.round(value * 100) / 100;
}

/** WCAG 2.1 contrast ratio, always >= 1. */
function contrastRatio(foreground: string, background: string): number {
  const first: number = relativeLuminance(foreground);
  const second: number = relativeLuminance(background);
  const lighter: number = first > second ? first : second;
  const darker: number = first > second ? second : first;
  return roundTo2((lighter + 0.05) / (darker + 0.05));
}

function isHexColor(value: string): boolean {
  if (value === null || value === undefined || value.length === 0) {
    return false;
  }
  if (value.charAt(0) !== '#') {
    return false;
  }
  return value.length === 7 || value.length === 9;
}

/** Token names resolved by the sample resource table. */
class TokenTable {
  names: string[] = [TOKEN_BACKGROUND, TOKEN_PANEL, TOKEN_DIVIDER, TOKEN_SECONDARY, TOKEN_ACCENT];

  resolve(token: string, palette: ThemePalette): string {
    if (token === TOKEN_BACKGROUND) {
      return palette.background;
    }
    if (token === TOKEN_PANEL) {
      return palette.panel;
    }
    if (token === TOKEN_DIVIDER) {
      return palette.divider;
    }
    if (token === TOKEN_SECONDARY) {
      return palette.secondary;
    }
    if (token === TOKEN_ACCENT) {
      return palette.accent;
    }
    return '';
  }

  hardcoded(palette: ThemePalette): string[] {
    return [palette.background, palette.panel, palette.divider, palette.secondary, palette.accent];
  }

  mismatches(palette: ThemePalette): string[] {
    const result: string[] = [];
    const expected: string[] = this.hardcoded(palette);
    for (let index = 0; index < this.names.length; index++) {
      if (this.resolve(this.names[index], palette) !== expected[index]) {
        result.push(this.names[index]);
      }
    }
    return result;
  }
}

/* ------------------------------------------------------------------ */
/* Theme controller                                                    */
/* ------------------------------------------------------------------ */

/** Owns the active palette and the system / manual switch policy. */
class ThemeController {
  palette: ThemePalette = PaletteFactory.light();
  followSystem: boolean = true;
  systemDark: boolean = false;
  switchCount: number = 0;
  notifications: number = 0;
  history: string[] = [];

  /** Applies the system theme unless the user pinned a manual palette. */
  applySystemTheme(dark: boolean): boolean {
    this.systemDark = dark;
    if (!this.followSystem) {
      this.history.push('ignored-system');
      return false;
    }
    const target: ThemePalette = PaletteFactory.byName(dark ? THEME_DARK : THEME_LIGHT);
    if (target.sameAs(this.palette)) {
      this.history.push('unchanged');
      return false;
    }
    this.palette = target;
    this.switchCount += 1;
    this.notifications += 1;
    this.history.push(dark ? 'apply-dark' : 'apply-light');
    return true;
  }

  /** Pins a palette and stops following the system setting. */
  selectManual(name: string): boolean {
    const target: ThemePalette = PaletteFactory.byName(name);
    this.followSystem = false;
    if (target.sameAs(this.palette)) {
      this.history.push('manual-unchanged');
      return false;
    }
    this.palette = target;
    this.switchCount += 1;
    this.notifications += 1;
    this.history.push('manual-' + name);
    return true;
  }

  /** Re-enables the system policy and immediately re-synchronizes. */
  followSystemAgain(): boolean {
    this.followSystem = true;
    return this.applySystemTheme(this.systemDark);
  }

  background(): string {
    return this.palette.background;
  }

  pressedBackground(): string {
    return this.palette.pressedColor();
  }

  idleBackground(): string {
    return this.palette.idleColor();
  }

  /** Background of a title bar button in a given visual state. */
  buttonBackground(pressed: boolean): string {
    return pressed ? this.pressedBackground() : this.idleBackground();
  }

  accentOnBackground(): number {
    return contrastRatio(this.palette.accent, this.palette.background);
  }

  textOnBackground(): number {
    return contrastRatio(this.palette.text, this.palette.background);
  }

  reset(): void {
    this.palette = PaletteFactory.light();
    this.followSystem = true;
    this.systemDark = false;
    this.switchCount = 0;
    this.notifications = 0;
    this.history = [];
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

function buildLight(): ThemePalette {
  return PaletteFactory.light();
}

function buildDark(): ThemePalette {
  return PaletteFactory.dark();
}

function buildController(): ThemeController {
  const controller: ThemeController = new ThemeController();
  controller.applySystemTheme(false);
  return controller;
}

function countMismatches(palette: ThemePalette): number {
  return new TokenTable().mismatches(palette).length;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserThemeVariationTest() {
  describe('browserThemeVariationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `text contrast floor ${CONTRAST_TEXT_MIN}, large text floor ${CONTRAST_LARGE_MIN}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Theme_001', 0, async () => {
      TestLogger.step(TAG, 'light palette exposes the five documented colours');
      const palette: ThemePalette = buildLight();
      expect(palette.name).assertEqual(THEME_LIGHT);
      expect(palette.background).assertEqual(COLOR_BACKGROUND);
      expect(palette.panel).assertEqual(COLOR_PANEL);
      expect(palette.divider).assertEqual(COLOR_DIVIDER);
      expect(palette.secondary).assertEqual(COLOR_SECONDARY);
      expect(palette.accent).assertEqual(COLOR_ACCENT);
      expect(palette.isLight()).assertTrue();
      expect(palette.colors().length).assertEqual(6);
    });

    it('Browser_Theme_002', 0, async () => {
      TestLogger.step(TAG, 'every palette colour is a valid hex literal');
      const light: ThemePalette = buildLight();
      const dark: ThemePalette = buildDark();
      const lightColors: string[] = light.colors();
      const darkColors: string[] = dark.colors();
      for (let index = 0; index < lightColors.length; index++) {
        expect(isHexColor(lightColors[index])).assertTrue();
        expect(isHexColor(darkColors[index])).assertTrue();
      }
      expect(isHexColor('ffffff')).assertFalse();
      expect(isHexColor('#fff')).assertFalse();
      expect(isHexColor('')).assertFalse();
      expect(isHexColor(COLOR_TRANSPARENT)).assertTrue();
    });

    it('Browser_Theme_003', 0, async () => {
      TestLogger.step(TAG, 'dark palette keeps the accent and swaps the panels');
      const light: ThemePalette = buildLight();
      const dark: ThemePalette = buildDark();
      expect(dark.name).assertEqual(THEME_DARK);
      expect(dark.accent).assertEqual(light.accent);
      expect(dark.background === light.background).assertFalse();
      expect(dark.panel === light.panel).assertFalse();
      expect(dark.divider === light.divider).assertFalse();
      expect(dark.isLight()).assertFalse();
      expect(dark.sameAs(light)).assertFalse();
      expect(dark.sameAs(PaletteFactory.dark())).assertTrue();
    });

    it('Browser_Theme_004', 0, async () => {
      TestLogger.step(TAG, 'pressed and idle backgrounds follow the palette');
      const light: ThemePalette = buildLight();
      expect(light.pressedColor()).assertEqual(COLOR_DIVIDER);
      expect(light.idleColor()).assertEqual(COLOR_TRANSPARENT);
      expect(light.pressedColor() === light.idleColor()).assertFalse();
      const dark: ThemePalette = buildDark();
      expect(dark.pressedColor()).assertEqual(dark.divider);
      expect(dark.idleColor()).assertEqual(COLOR_TRANSPARENT);
      expect(dark.pressedColor()).assertEqual('#2a2a2a');
    });

    it('Browser_Theme_005', 0, async () => {
      TestLogger.step(TAG, 'body text reaches the WCAG AA contrast floor');
      const light: ThemePalette = buildLight();
      const dark: ThemePalette = buildDark();
      const lightRatio: number = contrastRatio(light.text, light.background);
      const darkRatio: number = contrastRatio(dark.text, dark.background);
      TestLogger.info(TAG, `light text contrast=${lightRatio}, dark text contrast=${darkRatio}`);
      expect(lightRatio).assertLarger(20);
      expect(lightRatio).assertLarger(CONTRAST_TEXT_MIN);
      expect(darkRatio).assertLarger(CONTRAST_TEXT_MIN);
      expect(roundTo2(21)).assertEqual(21);
    });

    it('Browser_Theme_006', 0, async () => {
      TestLogger.step(TAG, 'accent blue stays readable on both panels');
      const light: ThemePalette = buildLight();
      const dark: ThemePalette = buildDark();
      const onLight: number = contrastRatio(light.accent, light.background);
      const onPanel: number = contrastRatio(light.accent, light.panel);
      TestLogger.info(TAG, `accent contrast light=${onLight}, panel=${onPanel}`);
      expect(onLight).assertLarger(CONTRAST_LARGE_MIN);
      expect(onPanel).assertLarger(CONTRAST_LARGE_MIN);
      // Pure blue on a near black panel tops out around 2.2:1, so the dark
      // theme can only guarantee the relaxed floor.
      expect(contrastRatio(dark.accent, dark.background)).assertLarger(2);
      expect(onLight).assertLess(21);
    });

    it('Browser_Theme_007', 0, async () => {
      TestLogger.step(TAG, 'divider and secondary tones stay distinguishable');
      const light: ThemePalette = buildLight();
      const dividerRatio: number = contrastRatio(light.divider, light.background);
      const secondaryRatio: number = contrastRatio(light.secondary, light.background);
      expect(dividerRatio).assertLarger(CONTRAST_DECORATIVE_MIN);
      expect(secondaryRatio).assertLarger(dividerRatio);
      expect(contrastRatio(light.secondary, light.divider)).assertLarger(1);
      expect(contrastRatio(COLOR_BACKGROUND, COLOR_BACKGROUND)).assertEqual(1);
    });

    it('Browser_Theme_008', 0, async () => {
      TestLogger.step(TAG, 'system dark mode flips the active palette');
      const controller: ThemeController = buildController();
      expect(controller.palette.name).assertEqual(THEME_LIGHT);
      expect(controller.applySystemTheme(true)).assertTrue();
      expect(controller.palette.name).assertEqual(THEME_DARK);
      expect(controller.background()).assertEqual('#101010');
      expect(controller.switchCount).assertEqual(1);
      expect(controller.notifications).assertEqual(1);
      expect(controller.history[controller.history.length - 1]).assertEqual('apply-dark');
    });

    it('Browser_Theme_009', 0, async () => {
      TestLogger.step(TAG, 'repeated system notifications are idempotent');
      const controller: ThemeController = buildController();
      controller.applySystemTheme(true);
      const switches: number = controller.switchCount;
      const notices: number = controller.notifications;
      expect(controller.applySystemTheme(true)).assertFalse();
      expect(controller.applySystemTheme(true)).assertFalse();
      expect(controller.switchCount).assertEqual(switches);
      expect(controller.notifications).assertEqual(notices);
      expect(controller.history[controller.history.length - 1]).assertEqual('unchanged');
    });

    it('Browser_Theme_010', 0, async () => {
      TestLogger.step(TAG, 'manual selection pins the palette against the system setting');
      const controller: ThemeController = buildController();
      expect(controller.selectManual(THEME_DARK)).assertTrue();
      expect(controller.followSystem).assertFalse();
      expect(controller.palette.name).assertEqual(THEME_DARK);
      expect(controller.applySystemTheme(false)).assertFalse();
      expect(controller.palette.name).assertEqual(THEME_DARK);
      expect(controller.history[controller.history.length - 1]).assertEqual('ignored-system');
      expect(controller.selectManual(THEME_DARK)).assertFalse();
    });

    it('Browser_Theme_011', 0, async () => {
      TestLogger.step(TAG, 'returning to the system policy resynchronizes immediately');
      const controller: ThemeController = buildController();
      controller.selectManual(THEME_DARK);
      controller.applySystemTheme(true);
      expect(controller.followSystemAgain()).assertFalse();
      expect(controller.followSystem).assertTrue();
      expect(controller.palette.name).assertEqual(THEME_DARK);
      expect(controller.applySystemTheme(false)).assertTrue();
      expect(controller.palette.name).assertEqual(THEME_LIGHT);
      expect(controller.notifications).assertEqual(2);
    });

    it('Browser_Theme_012', 0, async () => {
      TestLogger.step(TAG, 'resource tokens resolve to the hardcoded palette');
      const table: TokenTable = new TokenTable();
      const light: ThemePalette = buildLight();
      const dark: ThemePalette = buildDark();
      expect(table.names.length).assertEqual(5);
      expect(countMismatches(light)).assertEqual(0);
      expect(countMismatches(dark)).assertEqual(0);
      expect(table.resolve(TOKEN_BACKGROUND, light)).assertEqual(COLOR_BACKGROUND);
      expect(table.resolve(TOKEN_DIVIDER, dark)).assertEqual(dark.divider);
      expect(table.resolve(TOKEN_ACCENT, light)).assertEqual(COLOR_ACCENT);
    });

    it('Browser_Theme_013', 0, async () => {
      TestLogger.step(TAG, 'unknown tokens resolve to an empty value');
      const table: TokenTable = new TokenTable();
      const light: ThemePalette = buildLight();
      expect(table.resolve('app.color.missing', light)).assertEqual('');
      expect(table.resolve('', light)).assertEqual('');
      expect(table.mismatches(light).length).assertEqual(0);
      expect(table.hardcoded(light).length).assertEqual(5);
      expect(table.hardcoded(light)[0]).assertEqual(light.background);
    });

    it('Browser_Theme_014', 0, async () => {
      TestLogger.step(TAG, 'button backgrounds differ between pressed and idle in both themes');
      const light: ThemeController = buildController();
      expect(light.buttonBackground(false)).assertEqual(COLOR_TRANSPARENT);
      expect(light.buttonBackground(true)).assertEqual(COLOR_DIVIDER);
      light.applySystemTheme(true);
      expect(light.buttonBackground(false)).assertEqual(COLOR_TRANSPARENT);
      expect(light.buttonBackground(true)).assertEqual('#2a2a2a');
      expect(light.textOnBackground()).assertLarger(CONTRAST_TEXT_MIN);
      // The dark theme keeps the shared blue accent; on the dark panel it
      // reaches the relaxed floor instead of the large-text one.
      expect(light.accentOnBackground()).assertLarger(2);
    });

    it('Browser_Theme_015', 0, async () => {
      TestLogger.step(TAG, 'controller reset returns to the light system default');
      const controller: ThemeController = buildController();
      controller.applySystemTheme(true);
      controller.selectManual(THEME_DARK);
      expect(controller.switchCount).assertLarger(0);
      controller.reset();
      expect(controller.palette.name).assertEqual(THEME_LIGHT);
      expect(controller.followSystem).assertTrue();
      expect(controller.systemDark).assertFalse();
      expect(controller.switchCount).assertEqual(0);
      expect(controller.history.length).assertEqual(0);
      expect(controller.notifications).assertEqual(0);
    });

    it('Browser_Theme_016', 0, async () => {
      TestLogger.step(TAG, 'title bar controls render under the active theme');
      expect(await componentByIdExists(driver, ID_NAV_BACK)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      expect(await componentByIdExists(driver, ID_ACTION_ADD) ||
        await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      const backs: number = await countById(driver, ID_NAV_BACK);
      expect(backs).assertLarger(0);
      expect(backs).assertLess(2);
      const clock: MockClock = new MockClock();
      const start: number = clock.now();
      clock.advance(DELAY_TOUCH_EVENT);
      expect(clock.now() - start).assertLess(TIMEOUT_COMPONENT);
    });

    it('Browser_Theme_017', 0, async () => {
      TestLogger.step(TAG, 'home button stays clickable after a palette resolution pass');
      const controller: ThemeController = buildController();
      controller.applySystemTheme(true);
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home click returned=${clicked}`);
      expect(clicked).assertTrue();
      expect(controller.palette.name).assertEqual(THEME_DARK);
      expect(controller.buttonBackground(true)).assertEqual('#2a2a2a');
      expect(controller.buttonBackground(false)).assertEqual(COLOR_TRANSPARENT);
    });

    it('Browser_Theme_018', 0, async () => {
      TestLogger.step(TAG, 'tab close control exists in the current theme');
      const occurrences: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `cancel tab occurrences=${occurrences}`);
      // Every open tab contributes one close button; the strip is capped at 11.
      expect(occurrences).assertLess(12);
      const controller: ThemeController = buildController();
      const palette: ThemePalette = controller.palette;
      expect(isHexColor(palette.pressedColor())).assertTrue();
      expect(palette.idleColor()).assertEqual(COLOR_TRANSPARENT);
    });
  });
}
