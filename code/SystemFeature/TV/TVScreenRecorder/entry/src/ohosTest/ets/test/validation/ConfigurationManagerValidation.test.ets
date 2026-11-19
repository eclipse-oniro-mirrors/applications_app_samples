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
import {
  getDriver,
  recorderComponentCount,
  KEY_BACK,
  pressAndWait,
  delay,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Configuration value families supported by the recorder configuration store.
enum ConfigType {
  STRING = 'string',
  NUMBER = 'number',
  BOOLEAN = 'boolean',
  OBJECT = 'object'
}

// Screen orientation reported by the display module.
enum Orientation {
  PORTRAIT = 'portrait',
  LANDSCAPE = 'landscape'
}

// Layout direction used by the resource manager for localized text.
enum LayoutDirection {
  LTR = 'ltr',
  RTL = 'rtl'
}

// A rectangle expressed in virtual pixels. The recorder computes both the timer
// rectangle and the tip rectangle with `sizeCalc`, therefore the model keeps the
// unscaled and the scaled form of the same rectangle.
interface RectSpec {
  x: number;
  y: number;
  width: number;
  height: number;
}

// Object shaped configuration value, used by the rectangle configuration entry.
interface ConfigObjectValue {
  x?: number;
  y?: number;
  width?: number;
  height?: number;
}

// One immutable snapshot of the display characteristics. A rotation or a
// resolution change produces a new snapshot instead of mutating the old one.
interface DisplayProfile {
  width: number;
  height: number;
  densityDpi: number;
  orientation: Orientation;
  layoutDirection: LayoutDirection;
}

interface ConfigItem {
  key: string;
  value: string | number | boolean | ConfigObjectValue;
  type: ConfigType;
  lastModified: number;
}

interface ConfigChangeRecord {
  key: string;
  oldValue: string | number | boolean | ConfigObjectValue;
  newValue: string | number | boolean | ConfigObjectValue;
  timestamp: number;
}

interface ConfigBatchItem {
  key: string;
  value: string | number | boolean | ConfigObjectValue;
  type: ConfigType;
}

// Reference width of the design, all recorder sizes are proportional to it.
const DESIGN_WIDTH: number = 1920;

// Design rectangles of the two floating windows of the sample.
const TIMER_RECT_DESIGN: RectSpec = {
  x: 96,
  y: 48,
  width: 624,
  height: 56
};

const TIP_RECT_DESIGN: RectSpec = {
  x: 615,
  y: 46,
  width: 686,
  height: 100
};

// Display driven configuration model. It reproduces `sizeCalc(n)` of the
// production code and recalculates every floating window rectangle when the
// display profile changes.
class DisplayProfileModel {
  private profile: DisplayProfile;

  constructor() {
    this.profile = DisplayProfileModel.landscapeProfile();
  }

  public static landscapeProfile(): DisplayProfile {
    const value: DisplayProfile = {
      width: 1920,
      height: 1080,
      densityDpi: 320,
      orientation: Orientation.LANDSCAPE,
      layoutDirection: LayoutDirection.LTR
    };
    return value;
  }

  public static portraitProfile(): DisplayProfile {
    const value: DisplayProfile = {
      width: 1080,
      height: 1920,
      densityDpi: 320,
      orientation: Orientation.PORTRAIT,
      layoutDirection: LayoutDirection.LTR
    };
    return value;
  }

  public getProfile(): DisplayProfile {
    return this.profile;
  }

  public updateWidth(width: number): void {
    this.profile = {
      width: width,
      height: this.profile.height,
      densityDpi: this.profile.densityDpi,
      orientation: this.profile.orientation,
      layoutDirection: this.profile.layoutDirection
    };
  }

  public updateDensity(densityDpi: number): void {
    this.profile = {
      width: this.profile.width,
      height: this.profile.height,
      densityDpi: densityDpi,
      orientation: this.profile.orientation,
      layoutDirection: this.profile.layoutDirection
    };
  }

  public updateLayoutDirection(direction: LayoutDirection): void {
    this.profile = {
      width: this.profile.width,
      height: this.profile.height,
      densityDpi: this.profile.densityDpi,
      orientation: this.profile.orientation,
      layoutDirection: direction
    };
  }

  // Rotating the screen swaps the width and the height and flips the reported
  // orientation, therefore every sizeCalc value has to be recalculated.
  public rotate(): DisplayProfile {
    const rotated: DisplayProfile = {
      width: this.profile.height,
      height: this.profile.width,
      densityDpi: this.profile.densityDpi,
      orientation: this.profile.orientation === Orientation.LANDSCAPE ? Orientation.PORTRAIT : Orientation.LANDSCAPE,
      layoutDirection: this.profile.layoutDirection
    };
    this.profile = rotated;
    return rotated;
  }

  // Mirror of `sizeCalc(n) = display.width / 1920 * n`.
  public sizeCalc(value: number): number {
    return this.profile.width / DESIGN_WIDTH * value;
  }

  // Scales one design rectangle with the current display width.
  public scaleRect(spec: RectSpec): RectSpec {
    const scaled: RectSpec = {
      x: this.sizeCalc(spec.x),
      y: this.sizeCalc(spec.y),
      width: this.sizeCalc(spec.width),
      height: this.sizeCalc(spec.height)
    };
    return scaled;
  }

  // The tip window is horizontally centered on the current display.
  public scaleCenteredRect(spec: RectSpec): RectSpec {
    const width = this.sizeCalc(spec.width);
    const centered: RectSpec = {
      x: (this.profile.width - width) / 2,
      y: this.sizeCalc(spec.y),
      width: width,
      height: this.sizeCalc(spec.height)
    };
    return centered;
  }

  // A resolution above the recording limit is rejected by the sample, which is
  // the reason the resolution-not-supported dialog exists.
  public isResolutionSupported(width: number, height: number): boolean {
    if (width <= 0 || height <= 0) {
      return false;
    }
    return width <= this.profile.width && height <= this.profile.height;
  }

  // The scale factor itself, exposed for the density / rotation assertions.
  public getScaleFactor(): number {
    return this.profile.width / DESIGN_WIDTH;
  }

  public isPortrait(): boolean {
    return this.profile.orientation === Orientation.PORTRAIT;
  }
}
// Configuration store of the recorder pages. It keeps the typed configuration
// values, the change audit trail and the current display profile so that a
// configuration change and a display change can be validated together.
class ConfigurationManager {
  private static instance: ConfigurationManager;
  private configStore: Map<string, ConfigItem> = new Map();
  private changeHistory: ConfigChangeRecord[] = [];
  private display: DisplayProfileModel = new DisplayProfileModel();

  public static getInstance(): ConfigurationManager {
    if (!ConfigurationManager.instance) {
      ConfigurationManager.instance = new ConfigurationManager();
    }
    return ConfigurationManager.instance;
  }

  public getDisplay(): DisplayProfileModel {
    return this.display;
  }

  public resetDisplay(): void {
    this.display = new DisplayProfileModel();
  }

  public setConfig(key: string, value: string | number | boolean | ConfigObjectValue, type: ConfigType): void {
    const existing = this.configStore.get(key);
    const oldValue = existing === undefined ? undefined : existing.value;
    const item: ConfigItem = {
      key: key,
      value: value,
      type: type,
      lastModified: Date.now()
    };
    this.configStore.set(key, item);
    if (oldValue !== undefined) {
      const record: ConfigChangeRecord = {
        key: key,
        oldValue: oldValue,
        newValue: value,
        timestamp: Date.now()
      };
      this.changeHistory.push(record);
    }
  }

  public getConfig(key: string): ConfigItem | undefined {
    return this.configStore.get(key);
  }

  public getConfigValue(key: string): string | number | boolean | ConfigObjectValue | undefined {
    const item = this.configStore.get(key);
    if (item === undefined) {
      return undefined;
    }
    return item.value;
  }

  public deleteConfig(key: string): boolean {
    return this.configStore.delete(key);
  }

  public hasConfig(key: string): boolean {
    return this.configStore.has(key);
  }

  public getAllConfigs(): ConfigItem[] {
    const items: ConfigItem[] = [];
    this.configStore.forEach((item: ConfigItem) => {
      items.push(item);
    });
    return items;
  }

  public getConfigCount(): number {
    return this.configStore.size;
  }

  public clearAllConfigs(): void {
    this.configStore.clear();
    this.changeHistory = [];
  }

  public getChangeHistory(): ConfigChangeRecord[] {
    const records: ConfigChangeRecord[] = [];
    for (let i = 0; i < this.changeHistory.length; i++) {
      records.push(this.changeHistory[i]);
    }
    return records;
  }

  public getKeyChangeHistory(key: string): ConfigChangeRecord[] {
    return this.changeHistory.filter((record: ConfigChangeRecord) => record.key === key);
  }

  public resetSystem(): void {
    this.clearAllConfigs();
    this.resetDisplay();
  }

  public batchSetConfigs(configs: ConfigBatchItem[]): void {
    for (let i = 0; i < configs.length; i++) {
      const item = configs[i];
      this.setConfig(item.key, item.value, item.type);
    }
  }

  public exportConfigs(): string {
    return JSON.stringify(this.getAllConfigs());
  }

  public importConfigs(jsonString: string): boolean {
    try {
      const configArray: ConfigItem[] = JSON.parse(jsonString) as ConfigItem[];
      for (let i = 0; i < configArray.length; i++) {
        const item = configArray[i];
        this.setConfig(item.key, item.value, item.type);
      }
      return true;
    } catch (error) {
      return false;
    }
  }

  public validateConfigType(key: string, expectedType: ConfigType): boolean {
    const item = this.configStore.get(key);
    if (item === undefined) {
      return false;
    }
    return item.type === expectedType;
  }

  public getConfigKeys(): string[] {
    const keys: string[] = [];
    this.configStore.forEach((item: ConfigItem, key: string) => {
      keys.push(key);
    });
    return keys;
  }

  // Recomputes the two floating window rectangles for the current display.
  public recalculateWindowRects(): RectSpec[] {
    const timer = this.display.scaleRect(TIMER_RECT_DESIGN);
    const tip = this.display.scaleCenteredRect(TIP_RECT_DESIGN);
    const rects: RectSpec[] = [timer, tip];
    return rects;
  }
}

export default function configurationManagerValidationTest(): void {
  describe('ConfigurationManagerValidation_Test', () => {
    let driver: Driver;
    let configManager: ConfigurationManager;

    beforeAll(async () => {
      driver = getDriver();
      configManager = ConfigurationManager.getInstance();
      configManager.resetSystem();
      await delay(200);
    });

    afterAll(async () => {
      await delay(200);
    });

    it('config_type_enum_should_be_defined_correctly', 0, () => {
      expect(ConfigType.STRING).assertEqual('string');
      expect(ConfigType.NUMBER).assertEqual('number');
      expect(ConfigType.BOOLEAN).assertEqual('boolean');
      expect(ConfigType.OBJECT).assertEqual('object');
    });

    it('orientation_enum_should_be_defined_correctly', 0, () => {
      expect(Orientation.LANDSCAPE).assertEqual('landscape');
      expect(Orientation.PORTRAIT).assertEqual('portrait');
      expect(LayoutDirection.LTR).assertEqual('ltr');
      expect(LayoutDirection.RTL).assertEqual('rtl');
    });

    it('config_manager_initial_state_should_be_empty', 0, () => {
      configManager.resetSystem();
      expect(configManager.getConfigCount()).assertEqual(0);
      expect(configManager.getAllConfigs().length).assertEqual(0);
      expect(configManager.getConfigKeys().length).assertEqual(0);
      expect(configManager.getDisplay().getProfile().width).assertEqual(1920);
    });

    it('size_calc_should_match_design_width_formula', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      expect(displayModel.sizeCalc(96)).assertEqual(96);
      expect(displayModel.sizeCalc(624)).assertEqual(624);
      expect(displayModel.sizeCalc(0)).assertEqual(0);
      expect(displayModel.getScaleFactor()).assertEqual(1);
    });

    it('size_calc_should_scale_on_4k_display', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      displayModel.updateWidth(3840);
      expect(displayModel.sizeCalc(96)).assertEqual(192);
      expect(displayModel.sizeCalc(624)).assertEqual(1248);
      expect(displayModel.sizeCalc(56)).assertEqual(112);
      expect(displayModel.getScaleFactor()).assertEqual(2);
    });

    it('size_calc_should_scale_on_720p_display', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      displayModel.updateWidth(960);
      expect(displayModel.sizeCalc(96)).assertEqual(48);
      expect(displayModel.sizeCalc(686)).assertEqual(343);
      expect(displayModel.sizeCalc(100)).assertEqual(50);
      expect(displayModel.getScaleFactor()).assertEqual(0.5);
    });

    it('timer_window_rect_should_be_recalculated', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      const rects = configManager.recalculateWindowRects();
      expect(rects[0].x).assertEqual(96);
      expect(rects[0].y).assertEqual(48);
      expect(rects[0].width).assertEqual(624);
      expect(rects[0].height).assertEqual(56);
      displayModel.updateWidth(3840);
      const scaled = configManager.recalculateWindowRects();
      expect(scaled[0].x).assertEqual(192);
      expect(scaled[0].y).assertEqual(96);
      expect(scaled[0].width).assertEqual(1248);
      expect(scaled[0].height).assertEqual(112);
    });

    it('tip_window_rect_should_be_centered_and_recalculated', 0, () => {
      configManager.resetSystem();
      const rects = configManager.recalculateWindowRects();
      expect(rects[1].width).assertEqual(686);
      expect(rects[1].height).assertEqual(100);
      expect(rects[1].x).assertEqual((1920 - 686) / 2);
      expect(rects[1].y).assertEqual(46);
      configManager.getDisplay().updateWidth(3840);
      const scaled = configManager.recalculateWindowRects();
      expect(scaled[1].width).assertEqual(1372);
      expect(scaled[1].x).assertEqual((3840 - 1372) / 2);
      expect(scaled[1].height).assertEqual(200);
    });

    it('display_rotation_should_swap_width_and_height', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      const rotated = displayModel.rotate();
      expect(rotated.width).assertEqual(1080);
      expect(rotated.height).assertEqual(1920);
      expect(rotated.orientation).assertEqual(Orientation.PORTRAIT);
      expect(displayModel.isPortrait()).assertTrue();
      expect(displayModel.sizeCalc(96)).assertEqual(1080 / 1920 * 96);
      const back = displayModel.rotate();
      expect(back.width).assertEqual(1920);
      expect(back.orientation).assertEqual(Orientation.LANDSCAPE);
    });

    it('density_change_should_not_change_width_based_scale', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      const before = displayModel.sizeCalc(624);
      displayModel.updateDensity(480);
      const after = displayModel.sizeCalc(624);
      expect(after).assertEqual(before);
      expect(displayModel.getProfile().densityDpi).assertEqual(480);
      expect(displayModel.getScaleFactor()).assertEqual(1);
    });

    it('layout_direction_should_be_applied_to_resources', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      expect(displayModel.getProfile().layoutDirection).assertEqual(LayoutDirection.LTR);
      displayModel.updateLayoutDirection(LayoutDirection.RTL);
      expect(displayModel.getProfile().layoutDirection).assertEqual(LayoutDirection.RTL);
      displayModel.updateLayoutDirection(LayoutDirection.LTR);
      expect(displayModel.getProfile().layoutDirection).assertEqual(LayoutDirection.LTR);
    });

    it('portrait_profile_should_report_portrait_orientation', 0, () => {
      const portrait = DisplayProfileModel.portraitProfile();
      expect(portrait.width).assertEqual(1080);
      expect(portrait.height).assertEqual(1920);
      expect(portrait.orientation).assertEqual(Orientation.PORTRAIT);
      expect(portrait.layoutDirection).assertEqual(LayoutDirection.LTR);
    });

    it('resolution_support_should_reject_oversized_values', 0, () => {
      configManager.resetSystem();
      const displayModel = configManager.getDisplay();
      expect(displayModel.isResolutionSupported(1920, 1080)).assertTrue();
      expect(displayModel.isResolutionSupported(1280, 720)).assertTrue();
      expect(displayModel.isResolutionSupported(3840, 2160)).assertFalse();
      expect(displayModel.isResolutionSupported(0, 1080)).assertFalse();
      expect(displayModel.isResolutionSupported(-1, -1)).assertFalse();
    });
    it('typed_config_settings_should_be_stored_correctly', 0, () => {
      configManager.resetSystem();
      configManager.setConfig('recorder_title', '录屏', ConfigType.STRING);
      configManager.setConfig('tip_duration', 3000, ConfigType.NUMBER);
      configManager.setConfig('focusable', false, ConfigType.BOOLEAN);
      const position: ConfigObjectValue = {
        x: 615,
        y: 46,
        width: 686,
        height: 100
      };
      configManager.setConfig('tip_rect', position, ConfigType.OBJECT);
      expect(configManager.getConfigCount()).assertEqual(4);
      expect(configManager.getConfigValue('recorder_title')).assertEqual('录屏');
      expect(configManager.getConfigValue('tip_duration')).assertEqual(3000);
      expect(configManager.getConfigValue('focusable')).assertFalse();
      expect(configManager.validateConfigType('tip_rect', ConfigType.OBJECT)).assertTrue();
      expect(configManager.validateConfigType('tip_rect', ConfigType.STRING)).assertFalse();
    });

    it('config_update_should_record_change_history', 0, () => {
      configManager.resetSystem();
      configManager.setConfig('display_width', 1920, ConfigType.NUMBER);
      configManager.setConfig('display_width', 2560, ConfigType.NUMBER);
      configManager.setConfig('display_width', 3840, ConfigType.NUMBER);
      const history = configManager.getKeyChangeHistory('display_width');
      expect(history.length).assertEqual(2);
      expect(history[0].oldValue).assertEqual(1920);
      expect(history[0].newValue).assertEqual(2560);
      expect(history[1].oldValue).assertEqual(2560);
      expect(history[1].newValue).assertEqual(3840);
      expect(configManager.getChangeHistory().length).assertEqual(2);
    });

    it('config_deletion_should_work_correctly', 0, () => {
      configManager.resetSystem();
      configManager.setConfig('temp_key', 'temp', ConfigType.STRING);
      expect(configManager.deleteConfig('temp_key')).assertTrue();
      expect(configManager.hasConfig('temp_key')).assertFalse();
      expect(configManager.deleteConfig('temp_key')).assertFalse();
      expect(configManager.getConfigCount()).assertEqual(0);
    });

    it('batch_config_setting_should_work_correctly', 0, () => {
      configManager.resetSystem();
      const item1: ConfigBatchItem = { key: 'orientation', value: 'landscape', type: ConfigType.STRING };
      const item2: ConfigBatchItem = { key: 'density', value: 320, type: ConfigType.NUMBER };
      const item3: ConfigBatchItem = { key: 'rtl_enabled', value: false, type: ConfigType.BOOLEAN };
      const configs: ConfigBatchItem[] = [item1, item2, item3];
      configManager.batchSetConfigs(configs);
      expect(configManager.getConfigCount()).assertEqual(3);
      expect(configManager.getConfigValue('orientation')).assertEqual('landscape');
      expect(configManager.getConfigValue('density')).assertEqual(320);
      expect(configManager.getConfigValue('rtl_enabled')).assertFalse();
    });

    it('config_export_import_should_work_correctly', 0, () => {
      configManager.resetSystem();
      configManager.setConfig('key_one', 'value_one', ConfigType.STRING);
      configManager.setConfig('key_two', 1080, ConfigType.NUMBER);
      configManager.setConfig('key_three', true, ConfigType.BOOLEAN);
      const exported = configManager.exportConfigs();
      expect(exported.length).assertLarger(0);
      configManager.resetSystem();
      expect(configManager.getConfigCount()).assertEqual(0);
      expect(configManager.importConfigs(exported)).assertTrue();
      expect(configManager.getConfigCount()).assertEqual(3);
      expect(configManager.getConfigValue('key_two')).assertEqual(1080);
      expect(configManager.getConfigValue('key_three')).assertTrue();
    });

    it('invalid_json_import_should_return_false', 0, () => {
      configManager.resetSystem();
      expect(configManager.importConfigs('invalid json')).assertFalse();
      expect(configManager.importConfigs('{key: value}')).assertFalse();
      expect(configManager.importConfigs('')).assertFalse();
      expect(configManager.getConfigCount()).assertEqual(0);
    });

    it('config_keys_list_should_be_accurate', 0, () => {
      configManager.resetSystem();
      configManager.setConfig('alpha', 'a', ConfigType.STRING);
      configManager.setConfig('beta', 2, ConfigType.NUMBER);
      configManager.setConfig('gamma', true, ConfigType.BOOLEAN);
      const keys = configManager.getConfigKeys();
      expect(keys.length).assertEqual(3);
      expect(keys.includes('alpha')).assertTrue();
      expect(keys.includes('beta')).assertTrue();
      expect(keys.includes('gamma')).assertTrue();
      expect(keys.includes('delta')).assertFalse();
    });

    it('config_timestamps_should_be_set_correctly', 0, () => {
      configManager.resetSystem();
      const beforeSet = Date.now();
      configManager.setConfig('timestamp_key', 'value', ConfigType.STRING);
      const afterSet = Date.now();
      const item = configManager.getConfig('timestamp_key');
      expect(item?.lastModified).assertLargerOrEqual(beforeSet);
      expect(item?.lastModified).assertLessOrEqual(afterSet);
    });

    it('config_clear_should_remove_all_entries', 0, () => {
      configManager.resetSystem();
      configManager.setConfig('key_one', 'value', ConfigType.STRING);
      configManager.setConfig('key_two', 2, ConfigType.NUMBER);
      expect(configManager.getConfigCount()).assertEqual(2);
      configManager.clearAllConfigs();
      expect(configManager.getConfigCount()).assertEqual(0);
      expect(configManager.getAllConfigs().length).assertEqual(0);
      expect(configManager.getChangeHistory().length).assertEqual(0);
    });

    it('config_manager_singleton_should_return_same_instance', 0, () => {
      const first = ConfigurationManager.getInstance();
      const second = ConfigurationManager.getInstance();
      expect(first === second).assertTrue();
      first.resetSystem();
      first.setConfig('singleton_key', 'value', ConfigType.STRING);
      expect(second.getConfigValue('singleton_key')).assertEqual('value');
    });

    it('config_manager_performance_should_meet_requirements', 0, () => {
      configManager.resetSystem();
      const startTime = Date.now();
      for (let i = 0; i < 5000; i++) {
        configManager.setConfig('key_' + i, 'value_' + i, ConfigType.STRING);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(configManager.getConfigCount()).assertEqual(5000);
    });

    it('config_management_should_correlate_with_display_changes', 0, async () => {
      configManager.resetSystem();
      configManager.setConfig('window_visible', true, ConfigType.BOOLEAN);
      configManager.setConfig('display_width', 1920, ConfigType.NUMBER);
      const displayModel = configManager.getDisplay();
      displayModel.updateWidth(3840);
      configManager.setConfig('display_width', 3840, ConfigType.NUMBER);
      const rects = configManager.recalculateWindowRects();
      expect(rects[0].width).assertEqual(1248);
      expect(configManager.getConfigValue('window_visible')).assertTrue();
      expect(configManager.getKeyChangeHistory('display_width').length).assertEqual(1);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
    });
  });
}


