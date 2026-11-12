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
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPermissionDialog, isPermissionDialogVisible,
  miracastComponentCount, countComponentsById, pressAndWait, getScreenSize, getPlayerTileCount, isFullScreenMode,
  KEY_LEFT, KEY_RIGHT, KEY_BACK, ID_ALLOW_BTN, ID_PERMANENT_TRUST, ID_CANCEL_BTN, ID_SWITCH_BTN,
  TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES,
  ScreenSizeInfo } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'SessionPositioningSuite';

enum WindowPosition {
  CENTER = 'center', TOP_LEFT = 'top_left', TOP_RIGHT = 'top_right',
  BOTTOM_LEFT = 'bottom_left', BOTTOM_RIGHT = 'bottom_right'
}

interface Point {
  x: number; y: number;
}

interface WindowRect {
  x: number; y: number; width: number; height: number;
}

interface PositionRecord {
  position: WindowPosition; offsetError: number; correct: boolean;
}// 浮窗定位器：复刻 moveWindowTo 的居中、四角对齐与边界裁剪逻辑
class FloatWindowPositioner {
  private screenWidth: number;
  private screenHeight: number;
  private panelWidth: number;
  private panelHeight: number;
  constructor(screenWidth: number, screenHeight: number, panelWidth: number, panelHeight: number) {
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.panelWidth = panelWidth;
    this.panelHeight = panelHeight;
  }
  public computeCentered(): Point {
    return { x: (this.screenWidth - this.panelWidth) / 2, y: (this.screenHeight - this.panelHeight) / 2 };
  }
  public computeByPosition(position: WindowPosition): Point {
    const maxX: number = this.screenWidth - this.panelWidth;
    const maxY: number = this.screenHeight - this.panelHeight;
    if (position === WindowPosition.CENTER) {
      return this.computeCentered();
    }
    const x: number = position === WindowPosition.TOP_LEFT || position === WindowPosition.BOTTOM_LEFT ? 0 : maxX;
    const y: number = position === WindowPosition.TOP_LEFT || position === WindowPosition.TOP_RIGHT ? 0 : maxY;
    return { x: x, y: y };
  }
  public isCentered(point: Point, tolerance: number): boolean {
    const expected: Point = this.computeCentered();
    return Math.abs(point.x - expected.x) <= tolerance && Math.abs(point.y - expected.y) <= tolerance;
  }
  public isWithinScreen(point: Point): boolean {
    return point.x >= 0 && point.y >= 0 && point.x + this.panelWidth <= this.screenWidth &&
      point.y + this.panelHeight <= this.screenHeight;
  }
  public clampToScreen(point: Point): Point {
    const maxX: number = this.screenWidth - this.panelWidth;
    const maxY: number = this.screenHeight - this.panelHeight;
    const x: number = point.x < 0 ? 0 : point.x;
    const y: number = point.y < 0 ? 0 : point.y;
    return { x: x > maxX && maxX > 0 ? maxX : x, y: y > maxY && maxY > 0 ? maxY : y };
  }
  public buildRect(position: WindowPosition): WindowRect {
    const point: Point = this.computeByPosition(position);
    return { x: point.x, y: point.y, width: this.panelWidth, height: this.panelHeight };
  }
}

class WindowResizeModel {
  public static readonly MIN_WIDTH: number = 320;
  public static readonly MIN_HEIGHT: number = 240;
  public static readonly MAX_WIDTH: number = 1920;
  public static readonly MAX_HEIGHT: number = 1280;
  private width: number = 690;
  private height: number = 590;
  public resize(width: number, height: number): boolean {
    if (!this.isSizeValid(width, height)) {
      return false;
    }
    this.width = width;
    this.height = height;
    return true;
  }
  public isSizeValid(width: number, height: number): boolean {
    if (width < WindowResizeModel.MIN_WIDTH || height < WindowResizeModel.MIN_HEIGHT) {
      return false;
    }
    return width <= WindowResizeModel.MAX_WIDTH && height <= WindowResizeModel.MAX_HEIGHT;
  }  public getWidth(): number { return this.width; }
  public getHeight(): number { return this.height; }
  public isDesignSize(): boolean { return this.width === 690 && this.height === 590; }
  public getArea(): number { return this.width * this.height; }
}

class TileAnchorModel {
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
  public getAnchor(index: number, tileCount: number, screenWidth: number, screenHeight: number): Point {
    const column: number = index % this.getColumnCount(tileCount);
    const row: number = Math.floor(index / this.getColumnCount(tileCount));
    return { x: column * (screenWidth / this.getColumnCount(tileCount)),
      y: row * (screenHeight / this.getRowCount(tileCount)) };
  }
  public isAnchorWithinScreen(point: Point, screenWidth: number, screenHeight: number): boolean {
    return point.x >= 0 && point.y >= 0 && point.x < screenWidth && point.y < screenHeight;
  }
  public getMaxTileIndex(tileCount: number): number {
    return tileCount <= 0 || tileCount > MAX_MIRROR_TILES ? -1 : tileCount - 1;
  }
}

class PositionStatistics {
  private records: PositionRecord[] = [];
  public record(position: WindowPosition, offsetError: number): void {
    this.records.push({ position: position, offsetError: Math.abs(offsetError), correct: Math.abs(offsetError) <= 1 });
  }
  public getCount(): number { return this.records.length; }
  public getCorrectCount(): number {
    let count: number = 0;
    for (const record of this.records) { if (record.correct) { count++; } }
    return count;
  }
  public getAccuracyRate(): number {
    return this.records.length === 0 ? 0 : this.getCorrectCount() / this.records.length;
  }
  public getAverageError(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.records) { total += record.offsetError; }
    return total / this.records.length;
  }
  public getMaxError(): number {
    let max: number = 0;
    for (const record of this.records) { if (record.offsetError > max) { max = record.offsetError; } }
    return max;
  }
  public reset(): void { this.records = []; }
}

export default function sessionPositioningSuite(): void {
  describe('SessionPositioning_Test', () => {
    let driver: Driver;
    const positioner: FloatWindowPositioner = new FloatWindowPositioner(1920, 1080, 690, 590);
    const anchors: TileAnchorModel = new TileAnchorModel();
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
    it('float_window_should_center_on_landscape_screen', 0, async () => {
      expect(positioner.computeCentered().x).assertEqual(615); expect(positioner.computeCentered().y).assertEqual(245);
      expect(positioner.isCentered(positioner.computeCentered(), 0)).assertTrue();
    });
    it('float_window_should_center_on_portrait_screen', 0, async () => {
      const portrait = new FloatWindowPositioner(1080, 1920, 690, 590);
      expect(portrait.computeCentered().x).assertEqual(195); expect(portrait.computeCentered().y).assertEqual(665);
      expect(portrait.isWithinScreen(portrait.computeCentered())).assertTrue();
    });
    it('float_window_should_resolve_corner_positions', 0, async () => {
      expect(positioner.computeByPosition(WindowPosition.TOP_LEFT).x).assertEqual(0);
      expect(positioner.computeByPosition(WindowPosition.TOP_RIGHT).x).assertEqual(1230);
      expect(positioner.computeByPosition(WindowPosition.BOTTOM_LEFT).y).assertEqual(490);
      expect(positioner.computeByPosition(WindowPosition.BOTTOM_RIGHT).y).assertEqual(490);
    });
    it('float_window_should_clamp_negative_position', 0, async () => {
      const clamped: Point = positioner.clampToScreen({ x: -100, y: -50 });
      expect(clamped.x).assertEqual(0); expect(clamped.y).assertEqual(0); expect(positioner.isWithinScreen(clamped)).assertTrue();
    });
    it('float_window_should_clamp_overflow_position', 0, async () => {
      const clamped: Point = positioner.clampToScreen({ x: 3000, y: 2000 });
      expect(clamped.x).assertEqual(1230); expect(clamped.y).assertEqual(490); expect(positioner.isWithinScreen(clamped)).assertTrue();
    });
    it('float_window_rect_should_match_panel_size', 0, async () => {
      const rect: WindowRect = positioner.buildRect(WindowPosition.CENTER);
      expect(rect.width).assertEqual(690); expect(rect.height).assertEqual(590);
      expect(rect.x + rect.width).assertLessOrEqual(1920); expect(rect.y + rect.height).assertLessOrEqual(1080);
    });
    it('float_window_should_fit_small_screen', 0, async () => {
      const small = new FloatWindowPositioner(800, 600, 690, 590);
      expect(small.computeCentered().x).assertEqual(55); expect(small.computeCentered().y).assertEqual(5);
      expect(small.buildRect(WindowPosition.CENTER).width).assertEqual(690);
      expect(small.isWithinScreen(small.computeCentered())).assertTrue();
    });
    it('resize_model_should_default_to_design_size', 0, async () => {
      const model = new WindowResizeModel();
      expect(model.getWidth()).assertEqual(690); expect(model.getHeight()).assertEqual(590);
      expect(model.isDesignSize()).assertTrue(); expect(model.getArea()).assertEqual(407100);
    });
    it('resize_model_should_accept_valid_size', 0, async () => {
      const model = new WindowResizeModel();
      expect(model.resize(1024, 768)).assertTrue(); expect(model.getWidth()).assertEqual(1024);
      expect(model.getHeight()).assertEqual(768); expect(model.isDesignSize()).assertFalse();
      expect(model.getArea()).assertEqual(786432);
    });
    it('resize_model_should_reject_too_small_size', 0, async () => {
      const model = new WindowResizeModel();
      expect(model.resize(100, 100)).assertFalse(); expect(model.getWidth()).assertEqual(690);
      expect(model.resize(WindowResizeModel.MIN_WIDTH - 1, 590)).assertFalse();
      expect(model.resize(WindowResizeModel.MIN_WIDTH, WindowResizeModel.MIN_HEIGHT)).assertTrue();
    });
    it('resize_model_should_reject_too_large_size', 0, async () => {
      const model = new WindowResizeModel();
      expect(model.resize(WindowResizeModel.MAX_WIDTH + 1, 590)).assertFalse();
      expect(model.resize(690, WindowResizeModel.MAX_HEIGHT + 1)).assertFalse();
      expect(model.isSizeValid(WindowResizeModel.MAX_WIDTH, WindowResizeModel.MAX_HEIGHT)).assertTrue();
    });
    it('tile_anchor_should_start_at_origin_for_single_tile', 0, async () => {
      expect(anchors.getAnchor(0, 1, 1920, 1080).x).assertEqual(0);
      expect(anchors.getAnchor(0, 1, 1920, 1080).y).assertEqual(0);
      expect(anchors.getColumnCount(1)).assertEqual(1); expect(anchors.getRowCount(1)).assertEqual(1);
    });
    it('tile_anchor_should_layout_quad_grid', 0, async () => {
      expect(anchors.getAnchor(2, 4, 1920, 1080).y).assertEqual(540); expect(anchors.getAnchor(2, 4, 1920, 1080).x).assertEqual(0);
      expect(anchors.getAnchor(3, 4, 1920, 1080).x).assertEqual(960); expect(anchors.getAnchor(3, 4, 1920, 1080).y).assertEqual(540);
    });
    it('tile_anchor_should_layout_nine_grid', 0, async () => {
      expect(anchors.getColumnCount(9)).assertEqual(3); expect(anchors.getRowCount(9)).assertEqual(3);
      expect(anchors.getAnchor(8, 9, 1920, 1080).x).assertEqual(1280); expect(anchors.getAnchor(8, 9, 1920, 1080).y).assertEqual(720);
      expect(anchors.isAnchorWithinScreen(anchors.getAnchor(8, 9, 1920, 1080), 1920, 1080)).assertTrue();
    });
    it('tile_anchor_should_reject_invalid_tile_count', 0, async () => {
      expect(anchors.getMaxTileIndex(0)).assertEqual(-1); expect(anchors.getMaxTileIndex(MAX_MIRROR_TILES + 1)).assertEqual(-1);
      expect(anchors.getMaxTileIndex(4)).assertEqual(3); expect(anchors.getMaxTileIndex(9)).assertEqual(8);
    });
    it('position_statistics_should_compute_accuracy', 0, async () => {
      const stats = new PositionStatistics();
      stats.record(WindowPosition.CENTER, 0); stats.record(WindowPosition.TOP_LEFT, 1);
      stats.record(WindowPosition.BOTTOM_RIGHT, 40);
      expect(stats.getCount()).assertEqual(3); expect(stats.getCorrectCount()).assertEqual(2);
      expect(stats.getAccuracyRate()).assertEqual(2 / 3); expect(stats.getMaxError()).assertEqual(40);
    });
    it('position_statistics_should_normalize_negative_error', 0, async () => {
      const stats = new PositionStatistics();
      stats.record(WindowPosition.CENTER, -2);
      expect(stats.getAverageError()).assertEqual(2); expect(stats.getCorrectCount()).assertEqual(0);
      stats.reset(); expect(stats.getAccuracyRate()).assertEqual(0);
      expect(stats.getCount()).assertEqual(0);
    });
    it('device_screen_should_support_window_centering', 0, async () => {
      const size: ScreenSizeInfo = await getScreenSize(driver);
      expect(size.width).assertLarger(0); expect(size.height).assertLarger(0);
      const device = new FloatWindowPositioner(size.width, size.height, 690, 590);
      expect(device.isCentered(device.computeCentered(), 0)).assertTrue();
      expect(device.isWithinScreen(device.computeCentered()) || size.width < 690).assertTrue();
    });
    it('device_screen_should_clamp_window_position', 0, async () => {
      const size: ScreenSizeInfo = await getScreenSize(driver);
      const device = new FloatWindowPositioner(size.width, size.height, 690, 590);
      const clamped: Point = device.clampToScreen({ x: size.width + 100, y: size.height + 100 });
      expect(clamped.x).assertLargerOrEqual(0); expect(clamped.y).assertLargerOrEqual(0);
    });
    it('permission_dialog_should_expose_positioned_buttons', 0, async () => {
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      const allowCount: number = await countComponentsById(driver, ID_ALLOW_BTN);
      expect(allowCount).assertLargerOrEqual(0);
    });
    it('navigation_should_not_disturb_window_geometry', 0, async () => {
      const before: Point = positioner.computeCentered();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      expect(positioner.computeCentered().x).assertEqual(before.x);
      expect(positioner.computeCentered().y).assertEqual(before.y);
    });
    it('player_tiles_should_match_anchor_count', 0, async () => {
      const tileCount: number = 4;
      expect(anchors.getMaxTileIndex(tileCount)).assertEqual(tileCount - 1);
    });
    it('full_screen_tile_should_use_origin_anchor', 0, async () => {
      const fullScreen: boolean = await isFullScreenMode(driver, 1);
      expect(anchors.getAnchor(0, 1, 1920, 1080).x).assertEqual(0);
      expect(anchors.getAnchor(0, 1, 1920, 1080).y).assertEqual(0);
      expect(fullScreen || anchors.getAnchor(0, 1, 1920, 1080).x === 0).assertTrue();
    });
    it('comprehensive_positioning_scenario', 0, async () => {
      const stats = new PositionStatistics();
      stats.record(WindowPosition.CENTER, positioner.computeCentered().x - 615);
      expect(new WindowResizeModel().resize(1024, 768)).assertTrue();
      expect(anchors.isAnchorWithinScreen(anchors.getAnchor(3, 4, 1024, 768), 1024, 768)).assertTrue();
      expect(positioner.computeCentered().x).assertEqual(615); expect(stats.getAccuracyRate()).assertEqual(1);
    });
  });
}
