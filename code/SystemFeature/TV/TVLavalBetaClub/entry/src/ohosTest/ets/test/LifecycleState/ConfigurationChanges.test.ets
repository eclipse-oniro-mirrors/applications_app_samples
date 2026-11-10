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

const ORIENTATION_PORTRAIT: string = 'portrait';

const ORIENTATION_LANDSCAPE: string = 'landscape';

const COLOR_MODE_LIGHT: string = 'light';

const COLOR_MODE_DARK: string = 'dark';

const FONT_SCALE_NORMAL: number = 1;

const FONT_SCALE_LARGE: number = 1.5;

const MIN_COLUMNS: number = 1;

const MAX_COLUMNS: number = 4;

interface ConfigurationSnapshot {
  orientation: string;
  language: string;
  colorMode: string;
  fontScale: number;
  screenWidth: number;
  screenHeight: number;
}

// Produces a default 1080p landscape configuration
class ConfigurationFactory {
  public static landscape(): ConfigurationSnapshot {
    return {
      orientation: ORIENTATION_LANDSCAPE,
      language: 'zh_CN',
      colorMode: COLOR_MODE_DARK,
      fontScale: FONT_SCALE_NORMAL,
      screenWidth: 1920,
      screenHeight: 1080
    };
  }

  public static portrait(): ConfigurationSnapshot {
    return {
      orientation: ORIENTATION_PORTRAIT,
      language: 'zh_CN',
      colorMode: COLOR_MODE_DARK,
      fontScale: FONT_SCALE_NORMAL,
      screenWidth: 1080,
      screenHeight: 1920
    };
  }

  public static copy(source: ConfigurationSnapshot): ConfigurationSnapshot {
    return {
      orientation: source.orientation,
      language: source.language,
      colorMode: source.colorMode,
      fontScale: source.fontScale,
      screenWidth: source.screenWidth,
      screenHeight: source.screenHeight
    };
  }

  public static isValid(config: ConfigurationSnapshot): boolean {
    return config.screenWidth > 0 && config.screenHeight > 0 && config.fontScale > 0 &&
      config.language.length > 0;
  }
}

// Detects which configuration fields changed between snapshots
class ConfigChangeDetector {
  public static changedFields(previous: ConfigurationSnapshot,
    current: ConfigurationSnapshot): string[] {
    const changes: string[] = [];
    if (previous.orientation !== current.orientation) {
      changes.push('orientation');
    }
    if (previous.language !== current.language) {
      changes.push('language');
    }
    if (previous.colorMode !== current.colorMode) {
      changes.push('colorMode');
    }
    if (previous.fontScale !== current.fontScale) {
      changes.push('fontScale');
    }
    if (previous.screenWidth !== current.screenWidth || previous.screenHeight !== current.screenHeight) {
      changes.push('screenSize');
    }
    return changes;
  }

  public static hasChange(previous: ConfigurationSnapshot, current: ConfigurationSnapshot): boolean {
    return ConfigChangeDetector.changedFields(previous, current).length > 0;
  }

  public static isMajorChange(previous: ConfigurationSnapshot, current: ConfigurationSnapshot): boolean {
    const changes = ConfigChangeDetector.changedFields(previous, current);
    return changes.includes('orientation') || changes.includes('language') || changes.includes('screenSize');
  }

  public static isAppearanceOnly(previous: ConfigurationSnapshot, current: ConfigurationSnapshot): boolean {
    const changes = ConfigChangeDetector.changedFields(previous, current);
    if (changes.length === 0) {
      return false;
    }
    for (let i = 0; i < changes.length; i++) {
      if (changes[i] !== 'colorMode' && changes[i] !== 'fontScale') {
        return false;
      }
    }
    return true;
  }
}

// Computes responsive layout values for the current configuration
class LayoutAdapter {
  public static columnsFor(width: number): number {
    if (width <= 0) {
      return MIN_COLUMNS;
    }
    if (width < 720) {
      return 1;
    }
    if (width < 1280) {
      return 2;
    }
    if (width < 1920) {
      return 3;
    }
    return MAX_COLUMNS;
  }

  public static isLandscape(config: ConfigurationSnapshot): boolean {
    return config.screenWidth >= config.screenHeight;
  }

  public static scaledFontSize(baseSize: number, config: ConfigurationSnapshot): number {
    return Math.round(baseSize * config.fontScale);
  }

  public static horizontalPadding(config: ConfigurationSnapshot): number {
    if (LayoutAdapter.isLandscape(config)) {
      return Math.round(config.screenWidth * 0.1);
    }
    return Math.round(config.screenWidth * 0.05);
  }

  public static isPaddingValid(config: ConfigurationSnapshot): boolean {
    const padding = LayoutAdapter.horizontalPadding(config);
    return padding * 2 < config.screenWidth;
  }
}

// Decides whether a page must reload after a configuration change
class ConfigReloadPolicy {
  public static shouldReloadPage(changes: string[]): boolean {
    return changes.includes('language') || changes.includes('screenSize');
  }

  public static shouldRestartActivity(changes: string[]): boolean {
    return changes.includes('orientation') || changes.includes('screenSize');
  }

  public static shouldRequeryMedia(changes: string[]): boolean {
    return changes.includes('screenSize') || changes.includes('orientation');
  }

  public static shouldOnlyRerender(changes: string[]): boolean {
    if (changes.length === 0) {
      return false;
    }
    for (let i = 0; i < changes.length; i++) {
      if (changes[i] !== 'colorMode' && changes[i] !== 'fontScale') {
        return false;
      }
    }
    return true;
  }
}

// Keeps a bounded history of configuration transitions
class ConfigurationHistory {
  private entries: ConfigurationSnapshot[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public push(snapshot: ConfigurationSnapshot): void {
    if (this.capacity <= 0) {
      return;
    }
    if (this.entries.length >= this.capacity) {
      this.entries.shift();
    }
    this.entries.push(ConfigurationFactory.copy(snapshot));
  }

  public size(): number {
    return this.entries.length;
  }

  public latest(): ConfigurationSnapshot | undefined {
    return this.entries.length === 0 ? undefined : this.entries[this.entries.length - 1];
  }

  public previous(): ConfigurationSnapshot | undefined {
    return this.entries.length < 2 ? undefined : this.entries[this.entries.length - 2];
  }

  public transitionCount(): number {
    return this.entries.length <= 1 ? 0 : this.entries.length - 1;
  }

  public clear(): void {
    this.entries = [];
  }
}

// Applies configuration changes and reports required actions
class ConfigurationController {
  private current: ConfigurationSnapshot;

  constructor(initial: ConfigurationSnapshot) {
    this.current = ConfigurationFactory.copy(initial);
  }

  public getCurrent(): ConfigurationSnapshot {
    return ConfigurationFactory.copy(this.current);
  }

  public apply(next: ConfigurationSnapshot): string[] {
    const changes = ConfigChangeDetector.changedFields(this.current, next);
    this.current = ConfigurationFactory.copy(next);
    return changes;
  }

  public rotate(): string[] {
    const next = ConfigurationFactory.copy(this.current);
    if (next.orientation === ORIENTATION_LANDSCAPE) {
      next.orientation = ORIENTATION_PORTRAIT;
      next.screenWidth = 1080;
      next.screenHeight = 1920;
    } else {
      next.orientation = ORIENTATION_LANDSCAPE;
      next.screenWidth = 1920;
      next.screenHeight = 1080;
    }
    return this.apply(next);
  }

  public setColorMode(mode: string): string[] {
    const next = ConfigurationFactory.copy(this.current);
    next.colorMode = mode;
    return this.apply(next);
  }

  public setFontScale(scale: number): string[] {
    const next = ConfigurationFactory.copy(this.current);
    next.fontScale = scale;
    return this.apply(next);
  }

  public reset(initial: ConfigurationSnapshot): void {
    this.current = ConfigurationFactory.copy(initial);
  }
}

export default function configurationChangesTest() {
  describe('ConfigurationChanges_Test', () => {

    it('configuration_factory_should_build_valid_snapshots', 0, () => {
      const landscape = ConfigurationFactory.landscape();
      const portrait = ConfigurationFactory.portrait();
      expect(ConfigurationFactory.isValid(landscape)).assertTrue();
      expect(ConfigurationFactory.isValid(portrait)).assertTrue();
      expect(landscape.orientation).assertEqual(ORIENTATION_LANDSCAPE);
      expect(portrait.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(landscape.screenWidth).assertEqual(1920);
      expect(portrait.screenHeight).assertEqual(1920);
    });

    it('configuration_copy_should_not_share_state', 0, () => {
      const source = ConfigurationFactory.landscape();
      const copy = ConfigurationFactory.copy(source);
      copy.orientation = ORIENTATION_PORTRAIT;
      copy.screenWidth = 1;
      expect(source.orientation).assertEqual(ORIENTATION_LANDSCAPE);
      expect(source.screenWidth).assertEqual(1920);
      expect(copy.orientation).assertEqual(ORIENTATION_PORTRAIT);
    });

    it('configuration_validator_should_reject_invalid_values', 0, () => {
      const config = ConfigurationFactory.landscape();
      config.screenWidth = 0;
      expect(ConfigurationFactory.isValid(config)).assertFalse();
      config.screenWidth = 1920;
      config.fontScale = 0;
      expect(ConfigurationFactory.isValid(config)).assertFalse();
      config.fontScale = 1;
      config.language = '';
      expect(ConfigurationFactory.isValid(config)).assertFalse();
    });

    it('detector_should_find_orientation_change', 0, () => {
      const landscape = ConfigurationFactory.landscape();
      const portrait = ConfigurationFactory.portrait();
      const changes = ConfigChangeDetector.changedFields(landscape, portrait);
      expect(changes.includes('orientation')).assertTrue();
      expect(changes.includes('screenSize')).assertTrue();
      expect(ConfigChangeDetector.hasChange(landscape, portrait)).assertTrue();
      expect(ConfigChangeDetector.isMajorChange(landscape, portrait)).assertTrue();
    });

    it('detector_should_find_appearance_only_change', 0, () => {
      const previous = ConfigurationFactory.landscape();
      const current = ConfigurationFactory.copy(previous);
      current.colorMode = COLOR_MODE_LIGHT;
      current.fontScale = FONT_SCALE_LARGE;
      const changes = ConfigChangeDetector.changedFields(previous, current);
      expect(changes.length).assertEqual(2);
      expect(changes.includes('colorMode')).assertTrue();
      expect(changes.includes('fontScale')).assertTrue();
      expect(ConfigChangeDetector.isAppearanceOnly(previous, current)).assertTrue();
      expect(ConfigChangeDetector.isMajorChange(previous, current)).assertFalse();
    });

    it('detector_should_report_no_change', 0, () => {
      const previous = ConfigurationFactory.landscape();
      const current = ConfigurationFactory.copy(previous);
      expect(ConfigChangeDetector.changedFields(previous, current).length).assertEqual(0);
      expect(ConfigChangeDetector.hasChange(previous, current)).assertFalse();
      expect(ConfigChangeDetector.isMajorChange(previous, current)).assertFalse();
      expect(ConfigChangeDetector.isAppearanceOnly(previous, current)).assertFalse();
    });

    it('detector_should_find_language_change', 0, () => {
      const previous = ConfigurationFactory.landscape();
      const current = ConfigurationFactory.copy(previous);
      current.language = 'en_US';
      const changes = ConfigChangeDetector.changedFields(previous, current);
      expect(changes.includes('language')).assertTrue();
      expect(ConfigChangeDetector.isMajorChange(previous, current)).assertTrue();
      expect(ConfigChangeDetector.isAppearanceOnly(previous, current)).assertFalse();
    });

    it('layout_adapter_should_compute_columns', 0, () => {
      expect(LayoutAdapter.columnsFor(0)).assertEqual(MIN_COLUMNS);
      expect(LayoutAdapter.columnsFor(600)).assertEqual(1);
      expect(LayoutAdapter.columnsFor(1000)).assertEqual(2);
      expect(LayoutAdapter.columnsFor(1600)).assertEqual(3);
      expect(LayoutAdapter.columnsFor(1920)).assertEqual(MAX_COLUMNS);
      expect(LayoutAdapter.columnsFor(3840)).assertEqual(MAX_COLUMNS);
    });

    it('layout_adapter_should_scale_font_and_padding', 0, () => {
      const landscape = ConfigurationFactory.landscape();
      const portrait = ConfigurationFactory.portrait();
      expect(LayoutAdapter.isLandscape(landscape)).assertTrue();
      expect(LayoutAdapter.isLandscape(portrait)).assertFalse();
      expect(LayoutAdapter.scaledFontSize(20, landscape)).assertEqual(20);
      landscape.fontScale = FONT_SCALE_LARGE;
      expect(LayoutAdapter.scaledFontSize(20, landscape)).assertEqual(30);
      expect(LayoutAdapter.horizontalPadding(portrait)).assertEqual(54);
      expect(LayoutAdapter.isPaddingValid(portrait)).assertTrue();
    });

    it('reload_policy_should_choose_action', 0, () => {
      expect(ConfigReloadPolicy.shouldReloadPage(['language'])).assertTrue();
      expect(ConfigReloadPolicy.shouldReloadPage(['colorMode'])).assertFalse();
      expect(ConfigReloadPolicy.shouldRestartActivity(['orientation'])).assertTrue();
      expect(ConfigReloadPolicy.shouldRestartActivity(['fontScale'])).assertFalse();
      expect(ConfigReloadPolicy.shouldRequeryMedia(['screenSize'])).assertTrue();
      expect(ConfigReloadPolicy.shouldOnlyRerender(['colorMode', 'fontScale'])).assertTrue();
      expect(ConfigReloadPolicy.shouldOnlyRerender([])).assertFalse();
    });

    it('history_should_be_bounded', 0, () => {
      const history = new ConfigurationHistory(2);
      history.push(ConfigurationFactory.landscape());
      history.push(ConfigurationFactory.portrait());
      expect(history.size()).assertEqual(2);
      expect(history.transitionCount()).assertEqual(1);
      history.push(ConfigurationFactory.landscape());
      expect(history.size()).assertEqual(2);
      expect((history.latest() as ConfigurationSnapshot).orientation).assertEqual(ORIENTATION_LANDSCAPE);
      expect((history.previous() as ConfigurationSnapshot).orientation).assertEqual(ORIENTATION_PORTRAIT);
      history.clear();
      expect(history.size()).assertEqual(0);
      expect(history.latest() === undefined).assertTrue();
    });

    it('history_should_ignore_zero_capacity', 0, () => {
      const history = new ConfigurationHistory(0);
      history.push(ConfigurationFactory.landscape());
      expect(history.size()).assertEqual(0);
      expect(history.latest() === undefined).assertTrue();
      expect(history.previous() === undefined).assertTrue();
      expect(history.transitionCount()).assertEqual(0);
    });

    it('controller_should_rotate_and_report_changes', 0, () => {
      const controller = new ConfigurationController(ConfigurationFactory.landscape());
      const changes = controller.rotate();
      expect(changes.includes('orientation')).assertTrue();
      expect(changes.includes('screenSize')).assertTrue();
      const current = controller.getCurrent();
      expect(current.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(LayoutAdapter.isLandscape(current)).assertFalse();
      const back = controller.rotate();
      expect(back.includes('orientation')).assertTrue();
      expect(controller.getCurrent().orientation).assertEqual(ORIENTATION_LANDSCAPE);
    });

    it('controller_should_apply_appearance_changes', 0, () => {
      const controller = new ConfigurationController(ConfigurationFactory.landscape());
      const colorChanges = controller.setColorMode(COLOR_MODE_LIGHT);
      expect(colorChanges.length).assertEqual(1);
      expect(colorChanges[0]).assertEqual('colorMode');
      expect(controller.getCurrent().colorMode).assertEqual(COLOR_MODE_LIGHT);
      const fontChanges = controller.setFontScale(FONT_SCALE_LARGE);
      expect(fontChanges.length).assertEqual(1);
      expect(ConfigReloadPolicy.shouldOnlyRerender(fontChanges)).assertTrue();
      controller.reset(ConfigurationFactory.landscape());
      expect(controller.getCurrent().fontScale).assertEqual(FONT_SCALE_NORMAL);
    });

    it('controller_should_return_empty_changes_for_same_config', 0, () => {
      const initial = ConfigurationFactory.landscape();
      const controller = new ConfigurationController(initial);
      const changes = controller.apply(ConfigurationFactory.copy(initial));
      expect(changes.length).assertEqual(0);
      expect(ConfigChangeDetector.hasChange(initial, controller.getCurrent())).assertFalse();
      expect(ConfigReloadPolicy.shouldReloadPage(changes)).assertFalse();
    });

    it('configuration_constants_should_be_stable', 0, () => {
      expect(ORIENTATION_PORTRAIT).assertEqual('portrait');
      expect(ORIENTATION_LANDSCAPE).assertEqual('landscape');
      expect(COLOR_MODE_LIGHT).assertEqual('light');
      expect(COLOR_MODE_DARK).assertEqual('dark');
      expect(MIN_COLUMNS).assertEqual(1);
      expect(MAX_COLUMNS).assertEqual(4);
    });
  });
}

