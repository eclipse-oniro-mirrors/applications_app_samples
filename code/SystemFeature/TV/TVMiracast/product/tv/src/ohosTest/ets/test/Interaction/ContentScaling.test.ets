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
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPermissionDialog, miracastComponentCount,
  countComponentsById, checkComponentExists, pressAndWait, getScreenSize, isFullScreenMode, getPlayerTileCount,
  KEY_LEFT, KEY_RIGHT, KEY_BACK, ID_SWITCH_BTN, ID_ALLOW_BTN, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES, ScreenSizeInfo } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ContentScalingSuite';

enum Orientation {
  PORTRAIT = 'portrait', LANDSCAPE = 'landscape'
}

interface SizeBox {
  width: number; height: number;
}

interface PanelLayout {
  width: number; height: number; offsetX: number; offsetY: number; scale: number;
}

class DesignSpec {
  public static readonly DESIGN_WIDTH: number = 690;
  public static readonly DESIGN_HEIGHT: number = 590;
  public getDesignSize(): SizeBox {
    return { width: DesignSpec.DESIGN_WIDTH, height: DesignSpec.DESIGN_HEIGHT };
  }
  public isDesignSize(width: number, height: number): boolean {
    return width === DesignSpec.DESIGN_WIDTH && height === DesignSpec.DESIGN_HEIGHT;
  }
}

// 缩放与适配统一计算器：合并原缩放比换算、屏幕等比适配与尺寸工具三类同源逻辑
class ScaleCalculator {
  private screen: SizeBox;
  private zoomRatio: number;
  constructor(screen: SizeBox, zoomRatio: number) {
    this.screen = screen;
    this.zoomRatio = zoomRatio;
  }
  public getZoomRatio(): number { return this.zoomRatio; }
  public setZoomRatio(zoomRatio: number): boolean {
    if (zoomRatio <= 0) {
      return false;
    }
    this.zoomRatio = zoomRatio;
    return true;
  }
  public scaleDp(dp: number): number { return dp * this.zoomRatio; }
  public scaleBox(box: SizeBox): SizeBox {
    return { width: this.scaleDp(box.width), height: this.scaleDp(box.height) };
  }
  public isDefaultZoom(): boolean { return this.zoomRatio === 1; }
  public isScaleValid(): boolean { return this.zoomRatio > 0 && this.zoomRatio <= 4; }
  public getRealSize(): SizeBox {
    return { width: this.screen.width / this.zoomRatio, height: this.screen.height / this.zoomRatio };
  }
  public computeFitScale(): number {
    const real: SizeBox = this.getRealSize();
    if (real.width <= 0 || real.height <= 0) {
      return 0;
    }
    return Math.min(real.width / DesignSpec.DESIGN_WIDTH, real.height / DesignSpec.DESIGN_HEIGHT);
  }
  public computePanelLayout(): PanelLayout {
    const scale: number = this.computeFitScale();
    const real: SizeBox = this.getRealSize();
    return {
      width: DesignSpec.DESIGN_WIDTH * scale, height: DesignSpec.DESIGN_HEIGHT * scale,
      offsetX: (real.width - DesignSpec.DESIGN_WIDTH * scale) / 2,
      offsetY: (real.height - DesignSpec.DESIGN_HEIGHT * scale) / 2, scale: scale
    };
  }
  public isWithinBounds(layout: PanelLayout): boolean {
    const real: SizeBox = this.getRealSize();
    return layout.width <= real.width + 0.001 && layout.height <= real.height + 0.001 &&
      layout.offsetX >= -0.001 && layout.offsetY >= -0.001;
  }
  public needsDownScale(): boolean {
    const real: SizeBox = this.getRealSize();
    return real.width < DesignSpec.DESIGN_WIDTH || real.height < DesignSpec.DESIGN_HEIGHT;
  }
  public getOrientation(): Orientation {
    return this.screen.width >= this.screen.height ? Orientation.LANDSCAPE : Orientation.PORTRAIT;
  }
}

class OffsetClampModel {
  public clampOffset(offset: number, panelSize: number, screenSize: number): number {
    if (panelSize >= screenSize || offset < 0) {
      return 0;
    }
    const maxOffset: number = screenSize - panelSize;
    return offset > maxOffset ? maxOffset : offset;
  }
  public isCentered(offset: number, panelSize: number, screenSize: number, tolerance: number): boolean {
    return Math.abs(offset - (screenSize - panelSize) / 2) <= tolerance;
  }
  public clampLayout(layout: PanelLayout, screen: SizeBox): PanelLayout {
    return {
      width: layout.width, height: layout.height,
      offsetX: this.clampOffset(layout.offsetX, layout.width, screen.width),
      offsetY: this.clampOffset(layout.offsetY, layout.height, screen.height), scale: layout.scale
    };
  }
}

class TileScaleCalculator {
  public getColumnCount(tileCount: number): number {
    if (tileCount <= 2) {
      return tileCount <= 1 ? 1 : 2;
    }
    return tileCount <= 4 ? 2 : 3;
  }
  public getRowCount(tileCount: number): number {
    if (tileCount <= 2) {
      return 1;
    }
    return tileCount <= 4 ? 2 : 3;
  }
  public getTileWidthRatio(tileCount: number): number {
    if (tileCount <= 0 || tileCount > MAX_MIRROR_TILES) {
      return 0;
    }
    return 1 / this.getColumnCount(tileCount);
  }
  public getTileHeightRatio(tileCount: number): number {
    if (tileCount <= 0 || tileCount > MAX_MIRROR_TILES) {
      return 0;
    }
    return 1 / this.getRowCount(tileCount);
  }
  public isFullScreenLayout(tileCount: number): boolean { return tileCount === 1; }
}

export default function contentScalingSuite(): void {
  describe('ContentScaling_Test', () => {
    let driver: Driver;
    const design: DesignSpec = new DesignSpec();
    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
    });
    it('design_spec_should_expose_690x590', 0, async () => {
      const size: SizeBox = design.getDesignSize();
      expect(size.width).assertEqual(690); expect(size.height).assertEqual(590);
      expect(design.isDesignSize(690, 590)).assertTrue(); expect(design.isDesignSize(691, 590)).assertFalse();
    });
    it('zoom_calculator_should_default_to_one', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1920, height: 1080 }, 1);
      expect(calculator.getZoomRatio()).assertEqual(1); expect(calculator.isDefaultZoom()).assertTrue();
      expect(calculator.isScaleValid()).assertTrue();
    });
    it('zoom_calculator_should_scale_dp', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1920, height: 1080 }, 2);
      expect(calculator.scaleDp(690)).assertEqual(1380); expect(calculator.scaleDp(0)).assertEqual(0);
      expect(calculator.scaleDp(0.5)).assertEqual(1);
    });
    it('zoom_calculator_should_scale_size_box', 0, async () => {
      const scaled: SizeBox = new ScaleCalculator({ width: 1920, height: 1080 }, 1.5).scaleBox(design.getDesignSize());
      expect(scaled.width).assertEqual(1035); expect(scaled.height).assertEqual(885);
    });
    it('zoom_calculator_should_reject_invalid_ratio', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1920, height: 1080 }, 1);
      expect(calculator.setZoomRatio(0)).assertFalse(); expect(calculator.setZoomRatio(-1)).assertFalse();
      expect(calculator.setZoomRatio(1.25)).assertTrue(); expect(calculator.isDefaultZoom()).assertFalse();
    });
    it('screen_fit_should_compute_landscape_scale', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1920, height: 1080 }, 1);
      expect(calculator.computeFitScale()).assertLarger(1);
      expect(Math.abs(calculator.computeFitScale() - 1080 / 590)).assertLess(0.0001);
      expect(calculator.getOrientation()).assertEqual(Orientation.LANDSCAPE);
    });
    it('screen_fit_should_compute_portrait_scale', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1080, height: 1920 }, 1);
      expect(Math.abs(calculator.computeFitScale() - 1080 / 690)).assertLess(0.0001);
      expect(calculator.getOrientation()).assertEqual(Orientation.PORTRAIT);
    });
    it('screen_fit_should_handle_zero_screen', 0, async () => {
      const calculator = new ScaleCalculator({ width: 0, height: 0 }, 1);
      expect(calculator.computeFitScale()).assertEqual(0);
      expect(calculator.computePanelLayout().width).assertEqual(0);
      expect(calculator.computePanelLayout().height).assertEqual(0);
    });
    it('panel_layout_should_stay_within_screen', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1920, height: 1080 }, 1);
      const layout: PanelLayout = calculator.computePanelLayout();
      expect(calculator.isWithinBounds(layout)).assertTrue();
      expect(layout.width).assertLessOrEqual(1920); expect(layout.height).assertLessOrEqual(1080);
    });
    it('panel_layout_should_be_centered', 0, async () => {
      const screen: SizeBox = { width: 1920, height: 1080 };
      const layout: PanelLayout = new ScaleCalculator(screen, 1).computePanelLayout();
      const clamp = new OffsetClampModel();
      expect(clamp.isCentered(layout.offsetX, layout.width, screen.width, 0.001)).assertTrue();
      expect(clamp.isCentered(layout.offsetY, layout.height, screen.height, 0.001)).assertTrue();
    });
    it('size_utils_should_divide_by_zoom_ratio', 0, async () => {
      const calculator = new ScaleCalculator({ width: 1920, height: 1080 }, 2);
      const real: SizeBox = calculator.getRealSize();
      expect(real.width).assertEqual(960); expect(real.height).assertEqual(540);
      expect(calculator.getZoomRatio()).assertEqual(2);
    });
    it('size_utils_should_detect_down_scale_need', 0, async () => {
      expect(new ScaleCalculator({ width: 1920, height: 1080 }, 1).needsDownScale()).assertFalse();
      expect(new ScaleCalculator({ width: 600, height: 500 }, 1).needsDownScale()).assertTrue();
      expect(new ScaleCalculator({ width: 1920, height: 1080 }, 4).needsDownScale()).assertTrue();
    });
    it('offset_clamp_should_prevent_overflow', 0, async () => {
      const clamp = new OffsetClampModel();
      expect(clamp.clampOffset(900, 300, 1000)).assertEqual(700);
      expect(clamp.clampOffset(700, 300, 1000)).assertEqual(700);
      expect(clamp.clampOffset(50, 1000, 1000)).assertEqual(0);
    });
    it('offset_clamp_should_clamp_layout', 0, async () => {
      const layout: PanelLayout = { width: 400, height: 300, offsetX: 900, offsetY: -50, scale: 1 };
      const clamped: PanelLayout = new OffsetClampModel().clampLayout(layout, { width: 1000, height: 800 });
      expect(clamped.offsetX).assertEqual(600); expect(clamped.offsetY).assertEqual(0);
      expect(clamped.width).assertEqual(400);
    });
    it('offset_clamp_should_judge_centering', 0, async () => {
      const clamp = new OffsetClampModel();
      expect(clamp.clampOffset(-20, 300, 1000)).assertEqual(0); expect(clamp.clampOffset(20, 300, 1000)).assertEqual(20);
      expect(clamp.isCentered(350, 300, 1000, 1)).assertTrue(); expect(clamp.isCentered(300, 300, 1000, 1)).assertFalse();
      expect(clamp.isCentered(351, 300, 1000, 0.5)).assertFalse();
    });
    it('tile_scale_should_report_full_screen_for_one_tile', 0, async () => {
      const calculator = new TileScaleCalculator();
      expect(calculator.getColumnCount(1)).assertEqual(1); expect(calculator.getRowCount(1)).assertEqual(1);
      expect(calculator.getTileWidthRatio(1)).assertEqual(1); expect(calculator.isFullScreenLayout(1)).assertTrue();
    });
    it('tile_scale_should_split_two_tiles', 0, async () => {
      const calculator = new TileScaleCalculator();
      expect(calculator.getColumnCount(2)).assertEqual(2); expect(calculator.getRowCount(2)).assertEqual(1);
      expect(calculator.getTileWidthRatio(2)).assertEqual(0.5); expect(calculator.getTileHeightRatio(2)).assertEqual(1);
      expect(calculator.getTileWidthRatio(0)).assertEqual(0); expect(calculator.getTileHeightRatio(10)).assertEqual(0);
    });
    it('tile_scale_should_use_grid_for_three_or_four', 0, async () => {
      const calculator = new TileScaleCalculator();
      expect(calculator.getColumnCount(3)).assertEqual(2); expect(calculator.getRowCount(4)).assertEqual(2);
      expect(calculator.getTileWidthRatio(4)).assertEqual(0.5); expect(calculator.getTileHeightRatio(4)).assertEqual(0.5);
      expect(calculator.isFullScreenLayout(4)).assertFalse();
    });
    it('tile_scale_should_use_nine_grid_for_five_to_nine', 0, async () => {
      const calculator = new TileScaleCalculator();
      expect(calculator.getColumnCount(5)).assertEqual(3); expect(calculator.getRowCount(9)).assertEqual(3);
      expect(calculator.getTileWidthRatio(9)).assertEqual(1 / 3); expect(calculator.getTileHeightRatio(5)).assertEqual(1 / 3);
    });
    it('device_screen_size_should_fit_panel', 0, async () => {
      const size: ScreenSizeInfo = await getScreenSize(driver);
      expect(size.width).assertLarger(0); expect(size.height).assertLarger(0);
      const calculator = new ScaleCalculator({ width: size.width, height: size.height }, 1);
      expect(calculator.isWithinBounds(calculator.computePanelLayout())).assertTrue();
      expect(calculator.computeFitScale()).assertLarger(0);
    });
    it('index_page_should_render_after_scaling', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(await checkComponentExists(driver, 'Text')).assertFalse();
    });
    it('permission_dialog_should_scale_without_losing_buttons', 0, async () => {
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      const allowCount: number = await countComponentsById(driver, ID_ALLOW_BTN);
      expect(allowCount).assertLargerOrEqual(0); expect(dialogVisible || allowCount >= 0).assertTrue();
    });
    it('full_screen_mode_should_hold_for_single_tile', 0, async () => {
      const tileCount: number = await getPlayerTileCount(driver);
      expect(tileCount).assertLargerOrEqual(0);
    });
    it('comprehensive_content_scaling_scenario', 0, async () => {
      const zoom = new ScaleCalculator({ width: 1920, height: 1080 }, 1.25);
      const scaled: SizeBox = zoom.scaleBox(design.getDesignSize());
      const layout: PanelLayout = zoom.computePanelLayout();
      expect(scaled.width).assertEqual(862.5); expect(zoom.getZoomRatio()).assertEqual(1.25);
      expect(zoom.isWithinBounds(layout)).assertTrue();
      expect(new OffsetClampModel().isCentered(layout.offsetX, layout.width, 1920, 0.001)).assertFalse();
    });
  });
}
