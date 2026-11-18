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
import {
  getDriver,
  KEY_RIGHT,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  getScreenSize,
  getPlayerTileCount,
  triggerMiracastHome,
  ScreenSizeInfo,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ConfigurationChangesSuite';

enum ConfigType {
  ORIENTATION = 'orientation',
  SCREEN_SIZE = 'screenSize',
  DENSITY = 'density',
  LOCALE = 'locale'
}

enum Orientation {
  PORTRAIT = 'portrait',
  LANDSCAPE = 'landscape'
}

class ConfigChangeTracker {
  private static instance: ConfigChangeTracker | null = null;
  private types: ConfigType[] = [];
  private applied: boolean[] = [];
  public static getInstance(): ConfigChangeTracker {
    if (ConfigChangeTracker.instance === null) {
      ConfigChangeTracker.instance = new ConfigChangeTracker();
    }
    return ConfigChangeTracker.instance;
  }
  public recordChange(type: ConfigType, applied: boolean): void {
    this.types.push(type);
    this.applied.push(applied);
  }
  public getTotalCount(): number {
    return this.types.length;
  }
  public getAppliedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.applied.length; i++) {
      if (this.applied[i]) {
        count++;
      }
    }
    return count;
  }
  public getSuccessRate(): number {
    if (this.types.length === 0) {
      return 0;
    }
    return this.getAppliedCount() / this.types.length;
  }
  public countByType(type: ConfigType): number {
    let count: number = 0;
    for (let i = 0; i < this.types.length; i++) {
      if (this.types[i] === type) {
        count++;
      }
    }
    return count;
  }
  public reset(): void {
    this.types = [];
    this.applied = [];
  }
}
class PermissionPanelMetrics {
  private designWidth: number = 690;
  private designHeight: number = 590;
  private screenWidth: number = 1920;
  private screenHeight: number = 1080;
  private zoomRatio: number = 1;
  public setScreen(width: number, height: number): void {
    this.screenWidth = width;
    this.screenHeight = height;
  }
  public rescaleForRatio(ratio: number): boolean {
    if (ratio <= 0) {
      return false;
    }
    this.zoomRatio = ratio;
    return this.fitsInScreen();
  }
  public getOrientation(): Orientation {
    return this.screenWidth >= this.screenHeight ? Orientation.LANDSCAPE : Orientation.PORTRAIT;
  }
  public getScreenWidth(): number {
    return this.screenWidth;
  }
  public getPanelWidth(): number {
    return Math.round(this.designWidth * this.zoomRatio);
  }
  public getPanelHeight(): number {
    return Math.round(this.designHeight * this.zoomRatio);
  }
  public getCenterX(): number {
    return Math.round((this.screenWidth - this.getPanelWidth()) / 2);
  }
  public getCenterY(): number {
    return Math.round((this.screenHeight - this.getPanelHeight()) / 2);
  }
  public fitsInScreen(): boolean {
    return this.getPanelWidth() <= this.screenWidth && this.getPanelHeight() <= this.screenHeight;
  }
}

class MirrorGridLayout {
  public getLayoutName(tileCount: number): string {
    if (tileCount <= 0) {
      return 'empty';
    }
    if (tileCount === 1) {
      return 'fullScreen';
    }
    if (tileCount === 2) {
      return 'splitHalf';
    }
    if (tileCount <= 4) {
      return 'gridQuad';
    }
    if (tileCount <= MAX_MIRROR_TILES) {
      return 'gridNine';
    }
    return 'overflow';
  }
  public isValidTileCount(tileCount: number): boolean {
    return tileCount >= 1 && tileCount <= MAX_MIRROR_TILES;
  }
  public getTileWidth(screenWidth: number, tileCount: number): number {
    if (tileCount === 1) {
      return screenWidth;
    }
    if (tileCount === 2) {
      return Math.round(screenWidth / 2);
    }
    return Math.round(screenWidth / 3);
  }
  public getTileHeight(screenHeight: number, tileCount: number): number {
    return tileCount <= 2 ? screenHeight : Math.round(screenHeight / 3);
  }
  public getColumns(tileCount: number): number {
    if (tileCount <= 1) {
      return 1;
    }
    return tileCount === 2 ? 2 : 3;
  }
}
class LocaleAdapter {
  public normalize(locale: string): string {
    if (locale.length === 0) {
      return 'default';
    }
    return locale.replace('_', '-').toLowerCase();
  }
  public isRightToLeft(locale: string): boolean {
    const normalized: string = this.normalize(locale);
    return normalized.startsWith('ar') || normalized.startsWith('he') || normalized.startsWith('fa');
  }
  public formatDeviceName(locale: string, deviceName: string): string {
    if (this.normalize(locale).startsWith('zh')) {
      return 'Cast device (zh): ' + deviceName;
    }
    return 'Cast device: ' + deviceName;
  }
  public isSupported(locale: string): boolean {
    const normalized: string = this.normalize(locale);
    return normalized === 'zh-cn' || normalized === 'zh-hans' || normalized === 'en-us' || normalized === 'ar-ae';
  }
}

class DensityScaler {
  public bucketOf(dpi: number): string {
    if (dpi < 140) {
      return 'ldpi';
    }
    if (dpi < 200) {
      return 'mdpi';
    }
    if (dpi < 280) {
      return 'hdpi';
    }
    return dpi < 400 ? 'xhdpi' : 'xxhdpi';
  }
  public scaleFactor(dpi: number): number {
    if (dpi <= 0) {
      return 1;
    }
    return dpi / 160;
  }
  public scalePixels(designPixels: number, dpi: number): number {
    return Math.round(designPixels * this.scaleFactor(dpi));
  }
  public isKnownDpi(dpi: number): boolean {
    return dpi > 0 && dpi <= 640;
  }
}

class ConfigChangeValidator {
  public isValidValue(type: ConfigType, value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    if (type === ConfigType.ORIENTATION) {
      return value === Orientation.PORTRAIT || value === Orientation.LANDSCAPE;
    }
    if (type === ConfigType.SCREEN_SIZE) {
      return value.indexOf('x') > 0;
    }
    return true;
  }
  public parseScreenSize(value: string): number[] {
    const parts: string[] = value.split('x');
    if (parts.length !== 2) {
      return [];
    }
    const width: number = Number(parts[0]);
    const height: number = Number(parts[1]);
    if (isNaN(width) || isNaN(height) || width <= 0 || height <= 0) {
      return [];
    }
    return [width, height];
  }
}
export default function configurationChangesSuite(): void {
  describe('ConfigurationChanges_Suite', () => {
    let driver: Driver;
    let tracker: ConfigChangeTracker;
    beforeAll(async () => {
      driver = getDriver();
      tracker = ConfigChangeTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite start');
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      tracker.reset();
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'suite end');
    });

    it('permission_panel_should_recenter_after_screen_size_change', 0, async () => {
      const metrics = new PermissionPanelMetrics();
      metrics.setScreen(1920, 1080);
      metrics.setScreen(1280, 720);
      expect(metrics.getCenterX()).assertEqual(Math.round((1280 - 690) / 2));
    });
    it('permission_panel_should_rescale_with_zoom_ratio', 0, async () => {
      const metrics = new PermissionPanelMetrics();
      metrics.setScreen(1920, 1080);
      expect(metrics.rescaleForRatio(1.5) && metrics.getPanelWidth() === 1035).assertTrue();
      expect(metrics.getPanelHeight() === 885 && !metrics.rescaleForRatio(0)).assertTrue();
    });
    it('permission_panel_should_switch_to_portrait_orientation', 0, async () => {
      const metrics = new PermissionPanelMetrics();
      metrics.setScreen(1080, 1920);
      expect(metrics.getOrientation()).assertEqual(Orientation.PORTRAIT);
      expect(metrics.getCenterY() === Math.round((1920 - 590) / 2)).assertTrue();
    });
    it('permission_panel_should_report_mismatch_on_small_screen', 0, async () => {
      const metrics = new PermissionPanelMetrics();
      metrics.setScreen(640, 480);
      expect(!metrics.fitsInScreen() && !metrics.rescaleForRatio(1)).assertTrue();
    });
    it('player_grid_should_use_full_screen_for_single_stream', 0, async () => {
      const grid = new MirrorGridLayout();
      expect(grid.getLayoutName(1)).assertEqual('fullScreen');
      expect(grid.getTileWidth(1920, 1) === 1920 && grid.getColumns(1) === 1).assertTrue();
    });
    it('player_grid_should_use_half_split_for_two_streams', 0, async () => {
      const grid = new MirrorGridLayout();
      expect(grid.getLayoutName(2)).assertEqual('splitHalf');
      expect(grid.getTileWidth(1920, 2) === 960 && grid.getColumns(2) === 2).assertTrue();
    });
    it('player_grid_should_use_quad_layout_for_three_or_four_streams', 0, async () => {
      const grid = new MirrorGridLayout();
      expect(grid.getLayoutName(3) === 'gridQuad' && grid.getLayoutName(4) === 'gridQuad').assertTrue();
      expect(grid.getTileWidth(1080, 4)).assertEqual(360);
    });
    it('player_grid_should_use_nine_grid_until_max_tiles', 0, async () => {
      const grid = new MirrorGridLayout();
      expect(grid.getLayoutName(MAX_MIRROR_TILES)).assertEqual('gridNine');
      expect(grid.getLayoutName(MAX_MIRROR_TILES + 1) === 'overflow' && !grid.isValidTileCount(0)).assertTrue();
    });
    it('player_grid_should_return_empty_layout_for_no_stream', 0, async () => {
      const grid = new MirrorGridLayout();
      expect(grid.getLayoutName(0) === 'empty' && grid.getLayoutName(-1) === 'empty').assertTrue();
      expect(grid.isValidTileCount(1)).assertTrue();
    });
    it('locale_change_should_switch_device_name_format', 0, async () => {
      const adapter = new LocaleAdapter();
      expect(adapter.formatDeviceName('zh_CN', 'LivingRoom')).assertEqual('Cast device (zh): LivingRoom');
      expect(adapter.formatDeviceName('en_US', 'LivingRoom') === 'Cast device: LivingRoom').assertTrue();
    });
    it('locale_change_should_detect_right_to_left_language', 0, async () => {
      const adapter = new LocaleAdapter();
      expect(adapter.isRightToLeft('ar_AE') && adapter.isRightToLeft('he_IL')).assertTrue();
      expect(!adapter.isRightToLeft('zh_CN') && !adapter.isRightToLeft('')).assertTrue();
    });
    it('locale_change_should_reject_unsupported_language', 0, async () => {
      const adapter = new LocaleAdapter();
      expect(adapter.isSupported('zh_CN') && adapter.isSupported('en_US')).assertTrue();
      expect(!adapter.isSupported('fr_FR') && adapter.normalize('') === 'default').assertTrue();
    });
    it('density_change_should_bucket_dpi_correctly', 0, async () => {
      const scaler = new DensityScaler();
      expect(scaler.bucketOf(120) === 'ldpi' && scaler.bucketOf(160) === 'mdpi').assertTrue();
      expect(scaler.bucketOf(240) === 'hdpi' && scaler.bucketOf(480) === 'xxhdpi').assertTrue();
    });
    it('density_change_should_scale_icon_pixels', 0, async () => {
      const scaler = new DensityScaler();
      expect(scaler.scaleFactor(320)).assertEqual(2);
      expect(scaler.scalePixels(24, 320)).assertEqual(48);
    });
    it('density_bucket_boundaries_should_be_stable', 0, async () => {
      const scaler = new DensityScaler();
      expect(scaler.bucketOf(139) === 'ldpi' && scaler.bucketOf(140) === 'mdpi').assertTrue();
      expect(scaler.bucketOf(399) === 'xhdpi' && scaler.bucketOf(400) === 'xxhdpi').assertTrue();
    });
    it('config_validator_should_validate_orientation_and_size', 0, async () => {
      const validator = new ConfigChangeValidator();
      expect(validator.isValidValue(ConfigType.ORIENTATION, 'portrait')).assertTrue();
      expect(!validator.isValidValue(ConfigType.ORIENTATION, 'diagonal')).assertTrue();
      expect(validator.isValidValue(ConfigType.SCREEN_SIZE, '1920x1080')).assertTrue();
    });
    it('config_validator_should_parse_screen_size_text', 0, async () => {
      const validator = new ConfigChangeValidator();
      const parsed: number[] = validator.parseScreenSize('3840x2160');
      expect(parsed[0] === 3840 && parsed[1] === 2160).assertTrue();
      expect(validator.parseScreenSize('3840').length === 0).assertTrue();
    });
    it('config_validator_should_reject_empty_values', 0, async () => {
      const validator = new ConfigChangeValidator();
      expect(!validator.isValidValue(ConfigType.LOCALE, '') && validator.isValidValue(ConfigType.LOCALE, 'en-US')).assertTrue();
    });
    it('config_tracker_should_count_applied_changes', 0, async () => {
      tracker.reset();
      tracker.recordChange(ConfigType.ORIENTATION, true);
      tracker.recordChange(ConfigType.LOCALE, false);
      expect(tracker.getTotalCount() === 2 && tracker.getSuccessRate() === 0.5).assertTrue();
    });
    it('config_tracker_should_handle_empty_history', 0, async () => {
      tracker.reset();
      expect(tracker.getTotalCount()).assertEqual(0);
      expect(tracker.getSuccessRate()).assertEqual(0);
    });
    it('config_tracker_should_count_changes_by_type', 0, async () => {
      tracker.reset();
      tracker.recordChange(ConfigType.SCREEN_SIZE, true);
      tracker.recordChange(ConfigType.SCREEN_SIZE, true);
      expect(tracker.countByType(ConfigType.SCREEN_SIZE)).assertEqual(2);
      expect(tracker.countByType(ConfigType.LOCALE)).assertEqual(0);
    });
    it('config_tracker_singleton_should_share_history', 0, async () => {
      const first: ConfigChangeTracker = ConfigChangeTracker.getInstance();
      first.reset();
      first.recordChange(ConfigType.DENSITY, true);
      expect(tracker.countByType(ConfigType.DENSITY)).assertEqual(1);
    });
    it('config_changes_should_count_failures', 0, async () => {
      tracker.reset();
      tracker.recordChange(ConfigType.SCREEN_SIZE, true);
      tracker.recordChange(ConfigType.SCREEN_SIZE, false);
      expect(tracker.getAppliedCount() === 1 && tracker.countByType(ConfigType.SCREEN_SIZE) === 2).assertTrue();
    });
    it('real_screen_size_should_feed_panel_metrics', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const size: ScreenSizeInfo = await getScreenSize(driver);
      const metrics = new PermissionPanelMetrics();
      metrics.setScreen(size.width, size.height);
      expect(size.width > 0 && metrics.getScreenWidth() === size.width).assertTrue();
      expect(metrics.getCenterX() >= 0).assertTrue();
    });
    it('real_screen_orientation_should_match_dimensions', 0, async () => {
      const size: ScreenSizeInfo = await getScreenSize(driver);
      const metrics = new PermissionPanelMetrics();
      metrics.setScreen(size.width, size.height);
      const expected: Orientation = size.width >= size.height ? Orientation.LANDSCAPE : Orientation.PORTRAIT;
      expect(metrics.getOrientation()).assertEqual(expected);
    });
    it('real_player_tile_count_should_be_within_limit', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      const grid = new MirrorGridLayout();
      expect(tiles >= 0 && tiles <= MAX_MIRROR_TILES).assertTrue();
      expect(grid.getLayoutName(tiles) !== 'overflow').assertTrue();
    });
  });
}




