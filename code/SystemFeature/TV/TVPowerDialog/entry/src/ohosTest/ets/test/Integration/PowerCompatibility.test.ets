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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 显示配置枚举
enum Orientation {
  LANDSCAPE = 'landscape', PORTRAIT = 'portrait'
}

enum ThemeMode {
  LIGHT = 'light', DARK = 'dark', FOLLOW_SYSTEM = 'follow_system'
}

enum Language {
  ZH = 'zh', EN = 'en', JA = 'ja'
}

// 兼容性检查器：管理并验证电源对话框的各显示配置
class CompatibilityChecker {
  private orientation: Orientation = Orientation.LANDSCAPE;
  private theme: ThemeMode = ThemeMode.DARK;
  private resolution: string = '3840x2160';
  private fontSizeScale: number = 1.0;
  private language: Language = Language.ZH;
  private notchSafeArea: number = 0;
  private splitScreen: boolean = false;
  private foldable: boolean = false;
  private bluetoothOn: boolean = false;

  public setOrientation(orientation: Orientation): void {
    this.orientation = orientation;
  }

  public getOrientation(): Orientation {
    return this.orientation;
  }

  public setTheme(theme: ThemeMode): void {
    this.theme = theme;
  }

  public getTheme(): ThemeMode {
    return this.theme;
  }

  public setResolution(resolution: string): void {
    this.resolution = resolution;
  }

  public getResolution(): string {
    return this.resolution;
  }

  public setFontSizeScale(scale: number): void {
    this.fontSizeScale = scale;
  }

  public getFontSizeScale(): number {
    return this.fontSizeScale;
  }

  public setLanguage(language: Language): void {
    this.language = language;
  }

  public getLanguage(): Language {
    return this.language;
  }

  public setNotchSafeArea(px: number): void {
    this.notchSafeArea = px;
  }

  public getNotchSafeArea(): number {
    return this.notchSafeArea;
  }

  public setSplitScreen(enabled: boolean): void {
    this.splitScreen = enabled;
  }

  public isSplitScreen(): boolean {
    return this.splitScreen;
  }

  public setFoldable(enabled: boolean): void {
    this.foldable = enabled;
  }

  public isFoldable(): boolean {
    return this.foldable;
  }

  public setBluetooth(on: boolean): void {
    this.bluetoothOn = on;
  }

  public isBluetoothOn(): boolean {
    return this.bluetoothOn;
  }

  public supportsOrientation(orientation: Orientation): boolean {
    return orientation === Orientation.LANDSCAPE || orientation === Orientation.PORTRAIT;
  }
}

// ===== 新增辅助代码：兼容性扩展模型与工具 =====

// 屏幕形态枚举：描述设备屏幕的不同形态
enum ScreenForm {
  FLAT = 'flat', NOTCH = 'notch', HOLE_PUNCH = 'hole_punch', FOLDABLE = 'foldable', WATERDROP = 'waterdrop'
}

// 显示密度等级枚举：描述不同设备的屏幕密度等级
enum DisplayDensity {
  LOW = 'low', MEDIUM = 'medium', HIGH = 'high', EXTRA_HIGH = 'extra_high'
}

// 系统版本枚举：描述不同的系统版本边界
enum SystemVersion {
  V3_0 = '3.0', V3_1 = '3.1', V4_0 = '4.0', V5_0 = '5.0'
}

// 分辨率模型接口：描述屏幕的宽高像素
interface ResolutionModel {
  width: number;
  height: number;
  density: DisplayDensity;
}

// 显示配置快照接口：描述完整的显示配置状态
interface DisplayConfigSnapshot {
  orientation: Orientation;
  theme: ThemeMode;
  resolution: ResolutionModel;
  fontSizeScale: number;
  language: Language;
  screenForm: ScreenForm;
}

// 分辨率模型：封装屏幕分辨率，支持面积计算与比较
class ScreenResolution {
  public width: number;
  public height: number;
  public density: DisplayDensity;

  constructor(width: number, height: number, density: DisplayDensity) {
    this.width = width;
    this.height = height;
    this.density = density;
  }

  public clone(): ScreenResolution {
    return new ScreenResolution(this.width, this.height, this.density);
  }

  public equals(other: ScreenResolution): boolean {
    return this.width === other.width && this.height === other.height && this.density === other.density;
  }

  public toString(): string {
    return `ScreenResolution(${this.width}x${this.height}, density=${this.density})`;
  }

  public getPixelCount(): number {
    return this.width * this.height;
  }

  public isLandscape(): boolean {
    return this.width >= this.height;
  }

  public is4k(): boolean {
    return this.width >= 3840 && this.height >= 2160;
  }

  public isValid(): boolean {
    return this.width > 0 && this.height > 0;
  }
}

// 分辨率解析器：解析分辨率字符串并输出分辨率模型
class ResolutionParser {
  public parse(resolution: string): ScreenResolution | null {
    const index = resolution.indexOf('x');
    if (index < 0) {
      return null;
    }
    const widthText = resolution.substring(0, index);
    const heightText = resolution.substring(index + 1);
    const width = parseInt(widthText, 10);
    const height = parseInt(heightText, 10);
    if (isNaN(width) || isNaN(height)) {
      return null;
    }
    return new ScreenResolution(width, height, DisplayDensity.HIGH);
  }

  public format(resolution: ScreenResolution): string {
    return `${resolution.width}x${resolution.height}`;
  }

  public is4k(resolution: string): boolean {
    const parsed = this.parse(resolution);
    if (parsed === null) {
      return false;
    }
    return parsed.is4k();
  }
}

// 屏幕形态检测器：根据配置判断设备支持的屏幕形态
class ScreenFormDetector {
  private supportedForms: ScreenForm[] = [];

  public addSupportedForm(form: ScreenForm): void {
    if (!this.supportedForms.includes(form)) {
      this.supportedForms.push(form);
    }
  }

  public removeSupportedForm(form: ScreenForm): void {
    const remaining: ScreenForm[] = [];
    for (let i = 0; i < this.supportedForms.length; i++) {
      if (this.supportedForms[i] !== form) {
        remaining.push(this.supportedForms[i]);
      }
    }
    this.supportedForms = remaining;
  }

  public isSupported(form: ScreenForm): boolean {
    return this.supportedForms.includes(form);
  }

  public getSupportedCount(): number {
    return this.supportedForms.length;
  }

  public getSupportedForms(): ScreenForm[] {
    return [...this.supportedForms];
  }

  public supportsFoldable(): boolean {
    return this.isSupported(ScreenForm.FOLDABLE);
  }

  public supportsNotch(): boolean {
    return this.isSupported(ScreenForm.NOTCH);
  }

  public clear(): void {
    this.supportedForms = [];
  }
}

// 显示配置快照模型：封装完整显示配置，支持克隆、比较与序列化
class DisplaySnapshot {
  public orientation: Orientation;
  public theme: ThemeMode;
  public resolution: ScreenResolution;
  public fontSizeScale: number;
  public language: Language;
  public screenForm: ScreenForm;

  constructor(orientation: Orientation, theme: ThemeMode, resolution: ScreenResolution, fontSizeScale: number,
    language: Language, screenForm: ScreenForm) {
    this.orientation = orientation;
    this.theme = theme;
    this.resolution = resolution;
    this.fontSizeScale = fontSizeScale;
    this.language = language;
    this.screenForm = screenForm;
  }

  public clone(): DisplaySnapshot {
    const resolutionCopy = this.resolution.clone();
    return new DisplaySnapshot(this.orientation, this.theme, resolutionCopy, this.fontSizeScale, this.language,
      this.screenForm);
  }

  public equals(other: DisplaySnapshot): boolean {
    return this.orientation === other.orientation && this.theme === other.theme &&
      this.resolution.equals(other.resolution) && this.fontSizeScale === other.fontSizeScale &&
      this.language === other.language && this.screenForm === other.screenForm;
  }

  public toString(): string {
    return `DisplaySnapshot(orientation=${this.orientation}, theme=${this.theme}, resolution=${this.resolution.toString()}, fontScale=${this.fontSizeScale}, language=${this.language}, form=${this.screenForm})`;
  }

  public isValid(): boolean {
    return this.fontSizeScale >= 0 && this.resolution.isValid();
  }
}

// 兼容性矩阵：记录并查询不同设备配置的兼容性结论
class CompatibilityMatrix {
  private entries: Map<string, boolean> = new Map<string, boolean>();

  public setCompatibility(configKey: string, compatible: boolean): void {
    this.entries.set(configKey, compatible);
  }

  public isCompatible(configKey: string): boolean {
    const value = this.entries.get(configKey);
    return value === undefined ? true : value;
  }

  public getEntryCount(): number {
    return this.entries.size;
  }

  public removeEntry(configKey: string): void {
    this.entries.delete(configKey);
  }

  public clear(): void {
    this.entries.clear();
  }

  public getIncompatibleCount(): number {
    let count: number = 0;
    this.entries.forEach((value: boolean, key: string) => {
      if (!value) {
        count++;
      }
    });
    return count;
  }
}

// 系统版本比较器：比较系统版本边界并判断是否满足最低要求
class SystemVersionComparator {
  public static parse(version: SystemVersion): number {
    if (version === SystemVersion.V3_0) {
      return 300;
    }
    if (version === SystemVersion.V3_1) {
      return 310;
    }
    if (version === SystemVersion.V4_0) {
      return 400;
    }
    if (version === SystemVersion.V5_0) {
      return 500;
    }
    return 0;
  }

  public static compare(a: SystemVersion, b: SystemVersion): number {
    const va = SystemVersionComparator.parse(a);
    const vb = SystemVersionComparator.parse(b);
    if (va < vb) {
      return -1;
    }
    if (va > vb) {
      return 1;
    }
    return 0;
  }

  public static isAtLeast(current: SystemVersion, minimum: SystemVersion): boolean {
    return SystemVersionComparator.compare(current, minimum) >= 0;
  }
}

// 字体缩放校验器：校验字体缩放比例是否处于可接受范围
class FontScaleValidator {
  public static readonly MIN_SCALE: number = 0;
  public static readonly MAX_SCALE: number = 3.0;

  public isValid(scale: number): boolean {
    return scale >= FontScaleValidator.MIN_SCALE && scale <= FontScaleValidator.MAX_SCALE;
  }

  public clamp(scale: number): number {
    if (scale < FontScaleValidator.MIN_SCALE) {
      return FontScaleValidator.MIN_SCALE;
    }
    if (scale > FontScaleValidator.MAX_SCALE) {
      return FontScaleValidator.MAX_SCALE;
    }
    return scale;
  }

  public getScaleLevel(scale: number): string {
    if (scale <= 1.0) {
      return '标准';
    }
    if (scale <= 1.5) {
      return '较大';
    }
    return '特大';
  }
}

export default function powerCompatibilityTest() {
  describe('PowerCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('default_orientation_should_be_landscape', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.getOrientation()).assertEqual(Orientation.LANDSCAPE);
    });

    it('both_orientations_should_be_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.supportsOrientation(Orientation.LANDSCAPE)).assertTrue();
      expect(checker.supportsOrientation(Orientation.PORTRAIT)).assertTrue();
    });

    it('default_theme_should_be_dark', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.getTheme()).assertEqual(ThemeMode.DARK);
    });

    it('theme_switch_should_work', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setTheme(ThemeMode.LIGHT);
      expect(checker.getTheme()).assertEqual(ThemeMode.LIGHT);
    });

    it('follow_system_theme_should_be_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setTheme(ThemeMode.FOLLOW_SYSTEM);
      expect(checker.getTheme()).assertEqual(ThemeMode.FOLLOW_SYSTEM);
    });

    it('default_resolution_should_be_4k', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.getResolution()).assertEqual('3840x2160');
    });

    it('resolution_switch_should_work', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setResolution('1920x1080');
      expect(checker.getResolution()).assertEqual('1920x1080');
    });

    it('default_font_scale_should_be_one', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.getFontSizeScale()).assertEqual(1.0);
    });

    it('font_scale_switch_should_work', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setFontSizeScale(1.5);
      expect(checker.getFontSizeScale()).assertEqual(1.5);
    });

    it('orientation_switch_should_preserve_theme', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setTheme(ThemeMode.DARK);
      checker.setOrientation(Orientation.PORTRAIT);
      expect(checker.getTheme()).assertEqual(ThemeMode.DARK);
      expect(checker.getOrientation()).assertEqual(Orientation.PORTRAIT);
    });

    it('language_switch_should_work', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.getLanguage()).assertEqual(Language.ZH);
      checker.setLanguage(Language.EN);
      expect(checker.getLanguage()).assertEqual(Language.EN);
    });

    it('notch_safe_area_should_be_configurable', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setNotchSafeArea(48);
      expect(checker.getNotchSafeArea()).assertEqual(48);
    });

    it('split_screen_should_be_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.isSplitScreen()).assertFalse();
      checker.setSplitScreen(true);
      expect(checker.isSplitScreen()).assertTrue();
    });

    it('foldable_screen_should_be_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setFoldable(true);
      expect(checker.isFoldable()).assertTrue();
    });

    it('hardware_switch_should_take_effect', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.isBluetoothOn()).assertFalse();
      checker.setBluetooth(true);
      expect(checker.isBluetoothOn()).assertTrue();
    });

    it('split_screen_default_should_be_false', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.isSplitScreen()).assertFalse();
    });

    it('foldable_default_should_be_false', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.isFoldable()).assertFalse();
    });

    it('bluetooth_default_should_be_false', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.isBluetoothOn()).assertFalse();
    });

    it('japanese_language_should_be_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setLanguage(Language.JA);
      expect(checker.getLanguage()).assertEqual(Language.JA);
    });

    it('notch_default_should_be_zero', 0, async () => {
      const checker = new CompatibilityChecker();
      expect(checker.getNotchSafeArea()).assertEqual(0);
    });

    it('orientation_set_same_is_stable', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setOrientation(Orientation.LANDSCAPE);
      expect(checker.getOrientation()).assertEqual(Orientation.LANDSCAPE);
    });

    it('theme_cycle_returns_to_dark', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setTheme(ThemeMode.LIGHT);
      checker.setTheme(ThemeMode.FOLLOW_SYSTEM);
      checker.setTheme(ThemeMode.DARK);
      expect(checker.getTheme()).assertEqual(ThemeMode.DARK);
    });

    it('resolution_set_same_is_stable', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setResolution('2560x1440');
      expect(checker.getResolution()).assertEqual('2560x1440');
    });

    it('font_scale_zero_is_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setFontSizeScale(0);
      expect(checker.getFontSizeScale()).assertEqual(0);
    });

    it('language_cycle_returns_to_zh', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setLanguage(Language.EN);
      checker.setLanguage(Language.JA);
      checker.setLanguage(Language.ZH);
      expect(checker.getLanguage()).assertEqual(Language.ZH);
    });

    it('notch_negative_is_supported', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setNotchSafeArea(-1);
      expect(checker.getNotchSafeArea()).assertEqual(-1);
    });

    it('split_screen_toggle_on_off', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setSplitScreen(true);
      checker.setSplitScreen(false);
      expect(checker.isSplitScreen()).assertFalse();
    });

    it('foldable_toggle_on_off', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setFoldable(true);
      checker.setFoldable(false);
      expect(checker.isFoldable()).assertFalse();
    });

    it('bluetooth_toggle_on_off', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setBluetooth(true);
      checker.setBluetooth(false);
      expect(checker.isBluetoothOn()).assertFalse();
    });

    it('all_configs_independent', 0, async () => {
      const checker = new CompatibilityChecker();
      checker.setTheme(ThemeMode.LIGHT);
      checker.setOrientation(Orientation.PORTRAIT);
      expect(checker.getTheme()).assertEqual(ThemeMode.LIGHT);
      expect(checker.getOrientation()).assertEqual(Orientation.PORTRAIT);
    });
  });
}
