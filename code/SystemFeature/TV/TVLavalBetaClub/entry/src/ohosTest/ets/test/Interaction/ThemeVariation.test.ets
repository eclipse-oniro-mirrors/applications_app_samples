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

import { describe, it, expect } from '@ohos/hypium';

const THEME_DARK: string = 'dark';

const THEME_LIGHT: string = 'light';

const THEME_SYSTEM: string = 'system';

const COLOR_BLACK: number = 0;

const COLOR_WHITE: number = 255;

const MIN_TEXT_CONTRAST: number = 3;

interface ThemePalette {
  name: string;
  background: number;
  panel: number;
  textPrimary: number;
  textSecondary: number;
  accent: number;
  focus: number;
}

// Provides the default dark and light palettes for the TV app
class PaletteFactory {
  public static dark(): ThemePalette {
    return {
      name: THEME_DARK,
      background: COLOR_BLACK,
      panel: 16,
      textPrimary: COLOR_WHITE,
      textSecondary: 200,
      accent: 30,
      focus: COLOR_WHITE
    };
  }

  public static light(): ThemePalette {
    return {
      name: THEME_LIGHT,
      background: COLOR_WHITE,
      panel: 240,
      textPrimary: COLOR_BLACK,
      textSecondary: 60,
      accent: 20,
      focus: COLOR_BLACK
    };
  }

  public static isValid(palette: ThemePalette): boolean {
    return palette.name.length > 0 && palette.background !== palette.textPrimary &&
      palette.panel >= 0 && palette.panel <= 255;
  }

  public static copy(palette: ThemePalette): ThemePalette {
    return {
      name: palette.name,
      background: palette.background,
      panel: palette.panel,
      textPrimary: palette.textPrimary,
      textSecondary: palette.textSecondary,
      accent: palette.accent,
      focus: palette.focus
    };
  }
}

// Resolves the active theme from system and user preference
class ThemeResolver {
  public static resolve(systemTheme: string, userPreference: string): string {
    if (userPreference === THEME_DARK || userPreference === THEME_LIGHT) {
      return userPreference;
    }
    if (systemTheme === THEME_DARK || systemTheme === THEME_LIGHT) {
      return systemTheme;
    }
    return THEME_DARK;
  }

  public static paletteFor(theme: string): ThemePalette {
    return theme === THEME_LIGHT ? PaletteFactory.light() : PaletteFactory.dark();
  }

  public static isKnown(theme: string): boolean {
    return theme === THEME_DARK || theme === THEME_LIGHT || theme === THEME_SYSTEM;
  }

  public static isDark(theme: string): boolean {
    return ThemeResolver.resolve(theme, theme) === THEME_DARK;
  }
}

// Tracks theme changes and notifies observers
class ThemeState {
  private current: string = THEME_DARK;
  private changes: number = 0;

  public set(theme: string): boolean {
    if (!ThemeResolver.isKnown(theme)) {
      return false;
    }
    if (theme === this.current) {
      return false;
    }
    this.current = theme;
    this.changes++;
    return true;
  }

  public get(): string {
    return this.current;
  }

  public toggle(): string {
    this.current = this.current === THEME_DARK ? THEME_LIGHT : THEME_DARK;
    this.changes++;
    return this.current;
  }

  public getChangeCount(): number {
    return this.changes;
  }

  public palette(): ThemePalette {
    return ThemeResolver.paletteFor(ThemeResolver.resolve(this.current, this.current));
  }

  public reset(): void {
    this.current = THEME_DARK;
    this.changes = 0;
  }
}

// Audits palette contrast for text and focus visibility
class ContrastAudit {
  public static ratio(foreground: number, background: number): number {
    const lighter = Math.max(foreground, background);
    const darker = Math.min(foreground, background);
    return (lighter + 5) / (darker + 5);
  }

  public static isTextReadable(palette: ThemePalette): boolean {
    return ContrastAudit.ratio(palette.textPrimary, palette.background) >= MIN_TEXT_CONTRAST;
  }

  public static isSecondaryReadable(palette: ThemePalette): boolean {
    return ContrastAudit.ratio(palette.textSecondary, palette.background) >= MIN_TEXT_CONTRAST;
  }

  public static isFocusVisible(palette: ThemePalette): boolean {
    return ContrastAudit.ratio(palette.focus, palette.background) >= MIN_TEXT_CONTRAST;
  }

  public static audit(palette: ThemePalette): string[] {
    const failures: string[] = [];
    if (!ContrastAudit.isTextReadable(palette)) {
      failures.push('textPrimary');
    }
    if (!ContrastAudit.isSecondaryReadable(palette)) {
      failures.push('textSecondary');
    }
    if (!ContrastAudit.isFocusVisible(palette)) {
      failures.push('focus');
    }
    return failures;
  }
}

// Maps semantic color tokens to the active palette
class ThemeTokenMap {
  private tokenMap: Map<string, number> = new Map<string, number>();

  public apply(palette: ThemePalette): void {
    this.tokenMap.set('background', palette.background);
    this.tokenMap.set('panel', palette.panel);
    this.tokenMap.set('textPrimary', palette.textPrimary);
    this.tokenMap.set('textSecondary', palette.textSecondary);
    this.tokenMap.set('accent', palette.accent);
    this.tokenMap.set('focus', palette.focus);
  }

  public get(token: string): number {
    const value = this.tokenMap.get(token);
    return value === undefined ? -1 : value;
  }

  public size(): number {
    return this.tokenMap.size;
  }

  public tokens(): string[] {
    const result: string[] = [];
    this.tokenMap.forEach((value: number, token: string) => {
      result.push(token);
    });
    return result;
  }

  public clear(): void {
    this.tokenMap = new Map<string, number>();
  }
}

export default function themeVariationTest() {
  describe('ThemeVariation_Test', () => {

    it('palette_factory_should_build_valid_themes', 0, () => {
      const dark = PaletteFactory.dark();
      const light = PaletteFactory.light();
      expect(PaletteFactory.isValid(dark)).assertTrue();
      expect(PaletteFactory.isValid(light)).assertTrue();
      expect(dark.name).assertEqual(THEME_DARK);
      expect(light.name).assertEqual(THEME_LIGHT);
      expect(dark.background).assertEqual(COLOR_BLACK);
      expect(light.background).assertEqual(COLOR_WHITE);
    });

    it('palette_copy_should_be_independent', 0, () => {
      const source = PaletteFactory.dark();
      const copy = PaletteFactory.copy(source);
      copy.background = COLOR_WHITE;
      copy.textPrimary = COLOR_BLACK;
      expect(source.background).assertEqual(COLOR_BLACK);
      expect(source.textPrimary).assertEqual(COLOR_WHITE);
      expect(copy.background).assertEqual(COLOR_WHITE);
      expect(PaletteFactory.isValid(copy)).assertTrue();
    });

    it('resolver_should_prefer_user_preference', 0, () => {
      expect(ThemeResolver.resolve(THEME_DARK, THEME_LIGHT)).assertEqual(THEME_LIGHT);
      expect(ThemeResolver.resolve(THEME_LIGHT, THEME_DARK)).assertEqual(THEME_DARK);
      expect(ThemeResolver.resolve(THEME_DARK, THEME_SYSTEM)).assertEqual(THEME_DARK);
      expect(ThemeResolver.resolve(THEME_LIGHT, THEME_SYSTEM)).assertEqual(THEME_LIGHT);
    });

    it('resolver_should_fall_back_to_dark', 0, () => {
      expect(ThemeResolver.resolve('unknown', 'unknown')).assertEqual(THEME_DARK);
      expect(ThemeResolver.resolve('', '')).assertEqual(THEME_DARK);
      expect(ThemeResolver.resolve(THEME_SYSTEM, '')).assertEqual(THEME_DARK);
      expect(ThemeResolver.isKnown(THEME_SYSTEM)).assertTrue();
      expect(ThemeResolver.isKnown('unknown')).assertFalse();
    });

    it('resolver_should_return_palette_by_theme', 0, () => {
      expect(ThemeResolver.paletteFor(THEME_DARK).background).assertEqual(COLOR_BLACK);
      expect(ThemeResolver.paletteFor(THEME_LIGHT).background).assertEqual(COLOR_WHITE);
      expect(ThemeResolver.paletteFor('unknown').name).assertEqual(THEME_DARK);
      expect(ThemeResolver.isDark(THEME_DARK)).assertTrue();
      expect(ThemeResolver.isDark(THEME_LIGHT)).assertFalse();
    });

    it('theme_state_should_track_changes', 0, () => {
      const state = new ThemeState();
      expect(state.get()).assertEqual(THEME_DARK);
      expect(state.set(THEME_LIGHT)).assertTrue();
      expect(state.get()).assertEqual(THEME_LIGHT);
      expect(state.getChangeCount()).assertEqual(1);
      expect(state.set(THEME_LIGHT)).assertFalse();
      expect(state.getChangeCount()).assertEqual(1);
      expect(state.set('unknown')).assertFalse();
      expect(state.get()).assertEqual(THEME_LIGHT);
    });

    it('theme_state_should_toggle', 0, () => {
      const state = new ThemeState();
      expect(state.toggle()).assertEqual(THEME_LIGHT);
      expect(state.toggle()).assertEqual(THEME_DARK);
      expect(state.getChangeCount()).assertEqual(2);
      expect(state.palette().name).assertEqual(THEME_DARK);
      state.reset();
      expect(state.get()).assertEqual(THEME_DARK);
      expect(state.getChangeCount()).assertEqual(0);
    });

    it('contrast_audit_should_pass_default_palettes', 0, () => {
      expect(ContrastAudit.isTextReadable(PaletteFactory.dark())).assertTrue();
      expect(ContrastAudit.isTextReadable(PaletteFactory.light())).assertTrue();
      expect(ContrastAudit.isFocusVisible(PaletteFactory.dark())).assertTrue();
      expect(ContrastAudit.audit(PaletteFactory.dark()).length).assertEqual(0);
      expect(ContrastAudit.audit(PaletteFactory.light()).length).assertEqual(0);
    });

    it('contrast_audit_should_detect_low_contrast', 0, () => {
      const palette = PaletteFactory.dark();
      palette.textPrimary = 2;
      const failures = ContrastAudit.audit(palette);
      expect(failures.includes('textPrimary')).assertTrue();
      expect(ContrastAudit.isTextReadable(palette)).assertFalse();
      palette.textSecondary = 255;
      expect(ContrastAudit.isSecondaryReadable(palette)).assertTrue();
    });

    it('contrast_ratio_should_be_symmetric', 0, () => {
      expect(ContrastAudit.ratio(0, 255)).assertEqual(ContrastAudit.ratio(255, 0));
      expect(ContrastAudit.ratio(0, 0)).assertEqual(1);
      expect(ContrastAudit.ratio(0, 255)).assertLarger(MIN_TEXT_CONTRAST);
      expect(ContrastAudit.ratio(100, 110)).assertLess(MIN_TEXT_CONTRAST);
    });

    it('token_map_should_resolve_palette_colors', 0, () => {
      const map = new ThemeTokenMap();
      const dark = PaletteFactory.dark();
      map.apply(dark);
      expect(map.size()).assertEqual(6);
      expect(map.get('background')).assertEqual(COLOR_BLACK);
      expect(map.get('textPrimary')).assertEqual(COLOR_WHITE);
      expect(map.get('focus')).assertEqual(COLOR_WHITE);
      expect(map.get('missing')).assertEqual(-1);
      expect(map.tokens().length).assertEqual(6);
    });

    it('token_map_should_switch_theme', 0, () => {
      const map = new ThemeTokenMap();
      map.apply(PaletteFactory.dark());
      expect(map.get('background')).assertEqual(COLOR_BLACK);
      map.apply(PaletteFactory.light());
      expect(map.get('background')).assertEqual(COLOR_WHITE);
      expect(map.get('textPrimary')).assertEqual(COLOR_BLACK);
      expect(map.size()).assertEqual(6);
      map.clear();
      expect(map.size()).assertEqual(0);
      expect(map.get('background')).assertEqual(-1);
    });

    it('theme_flow_should_keep_contrast_valid', 0, () => {
      const state = new ThemeState();
      const map = new ThemeTokenMap();
      const themes: string[] = [THEME_DARK, THEME_LIGHT];
      for (let i = 0; i < themes.length; i++) {
        state.set(themes[i]);
        const palette = state.palette();
        map.apply(palette);
        expect(PaletteFactory.isValid(palette)).assertTrue();
        expect(ContrastAudit.audit(palette).length).assertEqual(0);
        expect(map.get('background')).assertEqual(palette.background);
        expect(map.get('textPrimary')).assertEqual(palette.textPrimary);
      }
      expect(state.getChangeCount()).assertEqual(1);
    });

    it('theme_constants_should_be_stable', 0, () => {
      expect(THEME_DARK).assertEqual('dark');
      expect(THEME_LIGHT).assertEqual('light');
      expect(THEME_SYSTEM).assertEqual('system');
      expect(COLOR_BLACK).assertEqual(0);
      expect(COLOR_WHITE).assertEqual(255);
      expect(MIN_TEXT_CONTRAST).assertEqual(3);
    });
  });
}

