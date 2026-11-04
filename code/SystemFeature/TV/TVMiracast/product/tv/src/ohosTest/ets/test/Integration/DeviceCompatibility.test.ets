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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount, isIndexPageVisible,
  countComponentsById, waitForPageStable, getScreenSize, ScreenSizeInfo, pressAndWait,
  serializedDelay, triggerMiracastHome, safeBack, ID_SWITCH_BTN, ID_TAB_MIRACAST,
  ID_TAB_SETTINGS, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION
} from '../Shared/MiracastDriver';
import { Log } from 'library';
const TAG: string = 'DeviceCompatibilitySuite';
enum TvModel {
  HI3751V352 = 'Hi3751V352',
  HI3751V550 = 'Hi3751V550',
  HI3751MODEL_811 = 'Hi3751MODEL_811',
  GENERIC = 'generic'
}
interface TvProfile {
  model: TvModel;
  width: number;
  height: number;
  apiLevel: number;
}
// TV 型号注册表：默认档案、按型号查找与首页开关能力判定
class TvModelRegistry {
  private profiles: Map<string, TvProfile> = new Map<string, TvProfile>();
  public constructor() {
    this.register(TvModel.HI3751V352, 1920, 1080, 12);
    this.register(TvModel.HI3751V550, 1920, 1080, 11);
    this.register(TvModel.HI3751MODEL_811, 3840, 2160, 12);
    this.register(TvModel.GENERIC, 1280, 720, 10);
  }
  public register(model: TvModel, width: number, height: number, apiLevel: number): boolean {
    if (width <= 0 || height <= 0 || this.profiles.has(model)) { return false; }
    const profile: TvProfile = { model: model, width: width, height: height, apiLevel: apiLevel };
    this.profiles.set(model, profile);
    return true;
  }
  public resolve(model: TvModel): TvProfile | null {
    const profile: TvProfile | undefined = this.profiles.get(model);
    return profile === undefined ? null : profile;
  }
  // 首页投屏开关仅在 Hi3751V352 上生效
  public isSwitchEnabled(model: TvModel): boolean { return model === TvModel.HI3751V352; }
  public supports4k(model: TvModel): boolean {
    const profile: TvProfile | null = this.resolve(model);
    return profile !== null && profile.width >= 3840 && profile.height >= 2160;
  }
  public getApiLevel(model: TvModel): number {
    const profile: TvProfile | null = this.resolve(model);
    return profile === null ? -1 : profile.apiLevel;
  }
  public getModelCount(): number { return this.profiles.size; }
}
// 屏幕布局模型：按分辨率推导列数与设计稿缩放比
class PanelLayoutModel {
  public static readonly DESIGN_WIDTH: number = 690;
  public static isLandscape(width: number, height: number): boolean { return width >= height; }
  public static is4k(width: number, height: number): boolean { return width >= 3840 && height >= 2160; }
  public static columnsFor(width: number, height: number): number {
    if (PanelLayoutModel.is4k(width, height)) { return 3; }
    return width === 1920 && height === 1080 ? 2 : 1;
  }
  public static rowsFor(tileCount: number): number {
    if (tileCount <= 1) { return 1; }
    return tileCount <= 4 ? 2 : 3;
  }
  public static zoomFor(targetWidth: number): number {
    if (PanelLayoutModel.DESIGN_WIDTH <= 0) { return 0; }
    return targetWidth / PanelLayoutModel.DESIGN_WIDTH;
  }
}

export default function deviceCompatibilitySuite(): void {
  describe('DeviceCompatibility_Suite', () => {
    let driver: Driver;
    let registry: TvModelRegistry;
    beforeAll(async () => {
      driver = getDriver();
      registry = new TvModelRegistry();
      Log.info(TAG, 'device compatibility suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, 500);
      Log.info(TAG, 'device compatibility suite end');
    });

    it('registry_registers_four_default_models', 0, async () => { expect(registry.getModelCount()).assertEqual(4); expect(registry.resolve(TvModel.HI3751V352) === null).assertFalse(); });
    it('hi3751v352_profile_is_full_hd', 0, async () => { const profile: TvProfile | null = registry.resolve(TvModel.HI3751V352); expect(profile === null).assertFalse(); if (profile !== null) { expect(profile.width).assertEqual(1920); expect(profile.height).assertEqual(1080); expect(profile.apiLevel).assertEqual(12); } });
    it('hi3751_model_811_profile_is_4k', 0, async () => { const profile: TvProfile | null = registry.resolve(TvModel.HI3751MODEL_811); expect(registry.supports4k(TvModel.HI3751MODEL_811)).assertTrue(); expect(profile === null).assertFalse(); if (profile !== null) { expect(profile.width).assertEqual(3840); expect(profile.height).assertEqual(2160); } });
    it('duplicate_model_registration_is_rejected', 0, async () => { expect(registry.register(TvModel.HI3751V352, 1920, 1080, 12)).assertFalse(); expect(registry.getModelCount()).assertEqual(4); });
    it('registration_rejects_invalid_resolution', 0, async () => { expect(registry.register(TvModel.GENERIC, 0, 0, 10)).assertFalse(); expect(registry.register(TvModel.GENERIC, -1, 1080, 10)).assertFalse(); expect(registry.getModelCount()).assertEqual(4); });
    it('switch_is_enabled_only_on_hi3751v352', 0, async () => { expect(registry.isSwitchEnabled(TvModel.HI3751V352)).assertTrue(); expect(registry.isSwitchEnabled(TvModel.HI3751V550)).assertFalse(); expect(registry.isSwitchEnabled(TvModel.HI3751MODEL_811)).assertFalse(); });
    it('api_level_is_reported_for_every_model', 0, async () => { expect(registry.getApiLevel(TvModel.HI3751V352)).assertEqual(12); expect(registry.getApiLevel(TvModel.HI3751V550)).assertEqual(11); expect(registry.getApiLevel(TvModel.GENERIC)).assertEqual(10); });
    it('4k_support_matches_profile_pixels', 0, async () => { expect(registry.supports4k(TvModel.HI3751V352)).assertFalse(); expect(registry.supports4k(TvModel.HI3751MODEL_811)).assertTrue(); });
    it('generic_profile_uses_720p_frame', 0, async () => { const profile: TvProfile | null = registry.resolve(TvModel.GENERIC); expect(profile === null).assertFalse(); if (profile !== null) { expect(PanelLayoutModel.isLandscape(profile.width, profile.height)).assertTrue(); expect(profile.width).assertEqual(1280); } });
    it('uhd_model_api_matches_switch_model_api', 0, async () => { expect(registry.getApiLevel(TvModel.HI3751MODEL_811)).assertEqual(registry.getApiLevel(TvModel.HI3751V352)); expect(registry.getApiLevel(TvModel.HI3751MODEL_811)).assertEqual(12); });
    it('full_hd_models_share_resolution', 0, async () => { const first: TvProfile | null = registry.resolve(TvModel.HI3751V352); const second: TvProfile | null = registry.resolve(TvModel.HI3751V550); expect(first === null || second === null).assertFalse(); if (first !== null && second !== null) { expect(first.width).assertEqual(second.width); expect(first.height).assertEqual(second.height); } });
    it('layout_reports_landscape_for_supported_profiles', 0, async () => { expect(PanelLayoutModel.isLandscape(1920, 1080)).assertTrue(); expect(PanelLayoutModel.isLandscape(1080, 1920)).assertFalse(); });
    it('resolution_recognises_4k_only_for_uhd', 0, async () => { expect(PanelLayoutModel.is4k(1920, 1080)).assertFalse(); expect(PanelLayoutModel.is4k(3840, 2160)).assertTrue(); });
    it('columns_two_for_full_hd', 0, async () => { expect(PanelLayoutModel.columnsFor(1920, 1080)).assertEqual(2); });
    it('columns_three_for_4k_panel', 0, async () => { expect(PanelLayoutModel.columnsFor(3840, 2160)).assertEqual(3); });
    it('columns_one_for_hd_panel', 0, async () => { expect(PanelLayoutModel.columnsFor(1280, 720)).assertEqual(1); });
    it('rows_follow_tile_count', 0, async () => { expect(PanelLayoutModel.rowsFor(1)).assertEqual(1); expect(PanelLayoutModel.rowsFor(4)).assertEqual(2); expect(PanelLayoutModel.rowsFor(9)).assertEqual(3); });
    it('design_zoom_scales_with_target_width', 0, async () => { expect(PanelLayoutModel.zoomFor(1380)).assertEqual(2); expect(PanelLayoutModel.zoomFor(3840)).assertLarger(PanelLayoutModel.zoomFor(1920)); });
    it('switch_gate_keeps_non_352_models_closed', 0, async () => { expect(registry.isSwitchEnabled(TvModel.HI3751V550)).assertFalse(); expect(registry.isSwitchEnabled(TvModel.GENERIC)).assertFalse(); expect(registry.resolve(TvModel.HI3751V550) === null).assertFalse(); });
    it('screen_size_probe_returns_landscape', 0, async () => { const size: ScreenSizeInfo = await getScreenSize(driver); expect(size.width).assertLargerOrEqual(1280); expect(size.height).assertLargerOrEqual(720); expect(PanelLayoutModel.isLandscape(size.width, size.height)).assertTrue(); });
    it('player_placeholder_layout_matches_three_columns', 0, async () => { expect(PanelLayoutModel.columnsFor(3840, 2160) * PanelLayoutModel.rowsFor(9)).assertEqual(9); expect(PanelLayoutModel.columnsFor(1920, 1080) * PanelLayoutModel.rowsFor(4)).assertEqual(4); });
  });
}
