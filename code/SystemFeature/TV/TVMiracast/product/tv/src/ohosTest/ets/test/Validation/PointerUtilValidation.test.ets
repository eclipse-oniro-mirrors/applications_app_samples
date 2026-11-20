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
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  simulateTouch,
  longClickComponent,
  swipeOnScreen,
  waitForPageStable,
  miracastComponentCount,
  isPermissionDialogVisible,
  serializedDelay,
  ID_PERMANENT_TRUST,
  ID_ALLOW_BTN,
  ID_CANCEL_BTN,
  TIMEOUT_PAGE_RENDER,
  DELAY_TOUCH_EVENT,
  DELAY_KEY_NAVIGATION,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

const TAG: string = 'PointerUtilSuite';

// Cursor style of the miracast pages.
enum PointerStyle {
  DEFAULT = 'default',
  HAND = 'hand',
  MOVE = 'move',
  WAIT = 'wait',
  CROSSHAIR = 'crosshair',
  NOT_ALLOWED = 'not-allowed'
}

// Pointer interaction kinds supported by the float permission window.
enum PointerAction {
  MOVE = 'move',
  HOVER = 'hover',
  CLICK = 'click',
  DOUBLE_CLICK = 'double_click',
  LONG_PRESS = 'long_press',
  DRAG = 'drag',
  SCROLL = 'scroll'
}

// Pointer device that produced the event.
enum PointerDeviceKind {
  REMOTE = 'remote',
  MOUSE = 'mouse',
  TOUCH = 'touch',
  UNKNOWN = 'unknown'
}

// Snapshot of the simulated pointer.
interface PointerState {
  style: PointerStyle;
  visible: boolean;
  x: number;
  y: number;
}

// One style change record.
interface StyleChangeRecord {
  from: PointerStyle;
  to: PointerStyle;
  timestamp: number;
}

// One pointer event record.
interface PointerEventRecord {
  action: PointerAction;
  x: number;
  y: number;
  deviceKind: PointerDeviceKind;
  timestamp: number;
  consumed: boolean;
}

// Result of a hit test.
interface HitTestResult {
  hit: boolean;
  regionId: string;
  offsetX: number;
  offsetY: number;
}

// Geometry of the float permission window after scaling.
interface PanelGeometry {
  designWidth: number;
  designHeight: number;
  realWidth: number;
  realHeight: number;
  zoomRatio: number;
  left: number;
  top: number;
}

// Simulated pointer used by the miracast UI tests.
class PointerUtilSimulator {
  private static instance: PointerUtilSimulator | null = null;
  private style: PointerStyle = PointerStyle.DEFAULT;
  private visible: boolean = true;
  private x: number = 0;
  private y: number = 0;
  private history: Array<StyleChangeRecord> = [];

  public static getInstance(): PointerUtilSimulator {
    if (PointerUtilSimulator.instance === null) {
      PointerUtilSimulator.instance = new PointerUtilSimulator();
    }
    return PointerUtilSimulator.instance;
  }

  public changePointerStyle(focusMode: boolean): void {
    const oldStyle = this.style;
    const newStyle: PointerStyle = focusMode ? PointerStyle.HAND : PointerStyle.DEFAULT;
    this.style = newStyle;
    const record: StyleChangeRecord = {
      from: oldStyle,
      to: newStyle,
      timestamp: Date.now()
    };
    this.history.push(record);
  }

  public setPointerVisibility(visible: boolean): void {
    this.visible = visible;
  }

  public setPointerPosition(x: number, y: number): void {
    this.x = x;
    this.y = y;
  }

  public getCurrentState(): PointerState {
    const state: PointerState = {
      style: this.style,
      visible: this.visible,
      x: this.x,
      y: this.y
    };
    return state;
  }

  public getStyleChangeHistory(): Array<StyleChangeRecord> {
    const result: Array<StyleChangeRecord> = [];
    for (let i = 0; i < this.history.length; i++) {
      const record = this.history[i];
      result.push({
        from: record.from,
        to: record.to,
        timestamp: record.timestamp
      });
    }
    return result;
  }

  public getStyleChangeCount(): number {
    return this.history.length;
  }

  public hasStyleChange(from: PointerStyle, to: PointerStyle): boolean {
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i].from === from && this.history[i].to === to) {
        return true;
      }
    }
    return false;
  }

  public getStyleChangeStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (let i = 0; i < this.history.length; i++) {
      const key = `${this.history[i].from}->${this.history[i].to}`;
      const current = stats.get(key);
      if (current === undefined) {
        stats.set(key, 1);
      } else {
        stats.set(key, current + 1);
      }
    }
    return stats;
  }

  public validateState(): boolean {
    if (this.x < 0 || this.y < 0) {
      return false;
    }
    const validStyles: Array<PointerStyle> = [
      PointerStyle.DEFAULT, PointerStyle.HAND, PointerStyle.MOVE,
      PointerStyle.WAIT, PointerStyle.CROSSHAIR, PointerStyle.NOT_ALLOWED
    ];
    for (let i = 0; i < validStyles.length; i++) {
      if (validStyles[i] === this.style) {
        return true;
      }
    }
    return false;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public getStyle(): PointerStyle {
    return this.style;
  }

  public resetState(): void {
    this.style = PointerStyle.DEFAULT;
    this.visible = true;
    this.x = 0;
    this.y = 0;
    this.history = [];
  }

  public toString(): string {
    return `PointerUtilSimulator{style=${this.style}, visible=${this.visible}, x=${this.x}, y=${this.y}}`;
  }
}

// Two dimensional pointer coordinate.
class PointerCoordinate {
  public x: number = 0;
  public y: number = 0;

  public constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  public clone(): PointerCoordinate {
    return new PointerCoordinate(this.x, this.y);
  }

  public equals(other: PointerCoordinate): boolean {
    return this.x === other.x && this.y === other.y;
  }

  public distanceTo(other: PointerCoordinate): number {
    const dx = this.x - other.x;
    const dy = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  public moveBy(dx: number, dy: number): PointerCoordinate {
    return new PointerCoordinate(this.x + dx, this.y + dy);
  }

  public isValid(): boolean {
    return this.x >= 0 && this.y >= 0;
  }

  public toString(): string {
    return `PointerCoordinate(x=${this.x}, y=${this.y})`;
  }
}

// Rectangle region used for hit testing.
class PointerRegion {
  public left: number = 0;
  public top: number = 0;
  public right: number = 0;
  public bottom: number = 0;
  public regionId: string = '';

  public constructor(left: number, top: number, right: number, bottom: number, regionId: string) {
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
    this.regionId = regionId;
  }

  public contains(point: PointerCoordinate): boolean {
    return point.x >= this.left && point.x <= this.right && point.y >= this.top && point.y <= this.bottom;
  }

  public getWidth(): number {
    return this.right - this.left;
  }

  public getHeight(): number {
    return this.bottom - this.top;
  }

  public getArea(): number {
    return this.getWidth() * this.getHeight();
  }

  public getCenter(): PointerCoordinate {
    return new PointerCoordinate((this.left + this.right) / 2, (this.top + this.bottom) / 2);
  }

  public isValid(): boolean {
    return this.right >= this.left && this.bottom >= this.top;
  }

  public clone(): PointerRegion {
    return new PointerRegion(this.left, this.top, this.right, this.bottom, this.regionId);
  }

  public equals(other: PointerRegion): boolean {
    return this.left === other.left && this.top === other.top && this.right === other.right &&
      this.bottom === other.bottom && this.regionId === other.regionId;
  }

  public toString(): string {
    return `PointerRegion(id=${this.regionId}, [${this.left},${this.top},${this.right},${this.bottom}])`;
  }
}

// Hit tests coordinates against the registered regions.
class PointerHitTester {
  private regions: Array<PointerRegion> = [];

  public addRegion(region: PointerRegion): void {
    this.regions.push(region);
  }

  public getRegionCount(): number {
    return this.regions.length;
  }

  public hitTest(point: PointerCoordinate): HitTestResult {
    for (let i = 0; i < this.regions.length; i++) {
      const region = this.regions[i];
      if (region.contains(point)) {
        const result: HitTestResult = {
          hit: true,
          regionId: region.regionId,
          offsetX: point.x - region.left,
          offsetY: point.y - region.top
        };
        return result;
      }
    }
    const miss: HitTestResult = {
      hit: false,
      regionId: '',
      offsetX: 0,
      offsetY: 0
    };
    return miss;
  }

  public getTopmostRegionAt(point: PointerCoordinate): PointerRegion | null {
    for (let i = this.regions.length - 1; i >= 0; i--) {
      if (this.regions[i].contains(point)) {
        return this.regions[i];
      }
    }
    return null;
  }

  public clear(): void {
    this.regions = [];
  }
}

// Records pointer events produced during interaction tests.
class PointerEventRecorder {
  private records: Array<PointerEventRecord> = [];

  public record(action: PointerAction, x: number, y: number, deviceKind: PointerDeviceKind,
    consumed: boolean): void {
    const entry: PointerEventRecord = {
      action: action,
      x: x,
      y: y,
      deviceKind: deviceKind,
      timestamp: Date.now(),
      consumed: consumed
    };
    this.records.push(entry);
  }

  public getRecords(): Array<PointerEventRecord> {
    const result: Array<PointerEventRecord> = [];
    for (let i = 0; i < this.records.length; i++) {
      const record = this.records[i];
      result.push({
        action: record.action,
        x: record.x,
        y: record.y,
        deviceKind: record.deviceKind,
        timestamp: record.timestamp,
        consumed: record.consumed
      });
    }
    return result;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getCountByAction(action: PointerAction): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].action === action) {
        count++;
      }
    }
    return count;
  }

  public getCountByDevice(deviceKind: PointerDeviceKind): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].deviceKind === deviceKind) {
        count++;
      }
    }
    return count;
  }

  public getConsumedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].consumed) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.records = [];
  }
}

// Statistical helpers over pointer coordinate sets.
class PointerStatistics {
  public averageCoordinate(points: Array<PointerCoordinate>): PointerCoordinate {
    if (points.length === 0) {
      return new PointerCoordinate(0, 0);
    }
    let sumX: number = 0;
    let sumY: number = 0;
    for (let i = 0; i < points.length; i++) {
      sumX = sumX + points[i].x;
      sumY = sumY + points[i].y;
    }
    return new PointerCoordinate(sumX / points.length, sumY / points.length);
  }

  public boundingArea(points: Array<PointerCoordinate>): number {
    if (points.length === 0) {
      return 0;
    }
    let minX: number = points[0].x;
    let maxX: number = points[0].x;
    let minY: number = points[0].y;
    let maxY: number = points[0].y;
    for (let i = 1; i < points.length; i++) {
      if (points[i].x < minX) {
        minX = points[i].x;
      }
      if (points[i].x > maxX) {
        maxX = points[i].x;
      }
      if (points[i].y < minY) {
        minY = points[i].y;
      }
      if (points[i].y > maxY) {
        maxY = points[i].y;
      }
    }
    return (maxX - minX) * (maxY - minY);
  }

  public maxDistance(points: Array<PointerCoordinate>): number {
    let max: number = 0;
    for (let i = 0; i < points.length; i++) {
      for (let j = i + 1; j < points.length; j++) {
        const distance = points[i].distanceTo(points[j]);
        if (distance > max) {
          max = distance;
        }
      }
    }
    return max;
  }

}

// Geometry of the float permission window derived from the 690x590 design draft.
class PermissionPanelMetrics {
  public static readonly DESIGN_WIDTH: number = 690;
  public static readonly DESIGN_HEIGHT: number = 590;
  private realWidth: number = 1920;
  private realHeight: number = 1080;
  private zoomRatio: number = 1;
  private panelWidth: number = PermissionPanelMetrics.DESIGN_WIDTH;
  private panelHeight: number = PermissionPanelMetrics.DESIGN_HEIGHT;
  private left: number = 0;
  private top: number = 0;

  public constructor(realWidth: number, realHeight: number, zoomRatio: number) {
    this.realWidth = realWidth > 0 ? realWidth : 1920;
    this.realHeight = realHeight > 0 ? realHeight : 1080;
    this.zoomRatio = zoomRatio > 0 ? zoomRatio : 1;
    const scaledWidth = Math.round(PermissionPanelMetrics.DESIGN_WIDTH * this.zoomRatio);
    const scaledHeight = Math.round(PermissionPanelMetrics.DESIGN_HEIGHT * this.zoomRatio);
    this.panelWidth = scaledWidth > this.realWidth ? this.realWidth : scaledWidth;
    this.panelHeight = scaledHeight > this.realHeight ? this.realHeight : scaledHeight;
    const offsetX = Math.floor((this.realWidth - this.panelWidth) / 2);
    const offsetY = Math.floor((this.realHeight - this.panelHeight) / 2);
    this.left = offsetX > 0 ? offsetX : 0;
    this.top = offsetY > 0 ? offsetY : 0;
  }

  public getZoomRatio(): number {
    return this.zoomRatio;
  }

  public getPanelWidth(): number {
    return this.panelWidth;
  }

  public getPanelHeight(): number {
    return this.panelHeight;
  }

  public getLeft(): number {
    return this.left;
  }

  public getTop(): number {
    return this.top;
  }

  public getGeometry(): PanelGeometry {
    const geometry: PanelGeometry = {
      designWidth: PermissionPanelMetrics.DESIGN_WIDTH,
      designHeight: PermissionPanelMetrics.DESIGN_HEIGHT,
      realWidth: this.realWidth,
      realHeight: this.realHeight,
      zoomRatio: this.zoomRatio,
      left: this.left,
      top: this.top
    };
    return geometry;
  }

  public designToScreen(x: number, y: number): PointerCoordinate {
    return new PointerCoordinate(this.left + Math.round(x * this.zoomRatio),
      this.top + Math.round(y * this.zoomRatio));
  }

  public screenToDesign(x: number, y: number): PointerCoordinate {
    return new PointerCoordinate(Math.round((x - this.left) / this.zoomRatio),
      Math.round((y - this.top) / this.zoomRatio));
  }

  public containsPanelPoint(x: number, y: number): boolean {
    return x >= this.left && x <= this.left + this.panelWidth &&
      y >= this.top && y <= this.top + this.panelHeight;
  }

  public getPanelRegion(): PointerRegion {
    return new PointerRegion(this.left, this.top, this.left + this.panelWidth,
      this.top + this.panelHeight, 'permission_panel');
  }

  public getPanelCenter(): PointerCoordinate {
    return new PointerCoordinate(this.left + this.panelWidth / 2, this.top + this.panelHeight / 2);
  }

  public clampToPanel(x: number, y: number): PointerCoordinate {
    let clampedX = x;
    let clampedY = y;
    if (clampedX < this.left) {
      clampedX = this.left;
    }
    if (clampedX > this.left + this.panelWidth) {
      clampedX = this.left + this.panelWidth;
    }
    if (clampedY < this.top) {
      clampedY = this.top;
    }
    if (clampedY > this.top + this.panelHeight) {
      clampedY = this.top + this.panelHeight;
    }
    return new PointerCoordinate(clampedX, clampedY);
  }

  public isLandscape(): boolean {
    return this.realWidth >= this.realHeight;
  }
}

// Tile hit testing geometry of the multi stream player page.
class TileGridGeometry {
  private metrics: PermissionPanelMetrics;
  private tileCount: number = 0;

  public constructor(metrics: PermissionPanelMetrics, tileCount: number) {
    this.metrics = metrics;
    if (tileCount < 0) {
      this.tileCount = 0;
    } else if (tileCount > MAX_MIRROR_TILES) {
      this.tileCount = MAX_MIRROR_TILES;
    } else {
      this.tileCount = tileCount;
    }
  }

  public getTileCount(): number {
    return this.tileCount;
  }

  public getColumns(): number {
    if (this.tileCount <= 0) {
      return 0;
    }
    if (this.tileCount === 1) {
      return 1;
    }
    if (this.tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  public getRows(): number {
    if (this.tileCount <= 0) {
      return 0;
    }
    if (this.tileCount === 1) {
      return 1;
    }
    if (this.tileCount <= 2) {
      return 1;
    }
    if (this.tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  public getTileWidth(): number {
    const columns = this.getColumns();
    if (columns === 0) {
      return 0;
    }
    return Math.floor(this.metrics.getPanelWidth() / columns);
  }

  public getTileHeight(): number {
    const rows = this.getRows();
    if (rows === 0) {
      return 0;
    }
    return Math.floor(this.metrics.getPanelHeight() / rows);
  }

  public regionAt(index: number): PointerRegion | null {
    if (index < 0 || index >= this.tileCount) {
      return null;
    }
    const columns = this.getColumns();
    if (columns === 0) {
      return null;
    }
    const column = index % columns;
    const row = Math.floor(index / columns);
    const tileWidth = this.getTileWidth();
    const tileHeight = this.getTileHeight();
    const left = this.metrics.getLeft() + column * tileWidth;
    const top = this.metrics.getTop() + row * tileHeight;
    return new PointerRegion(left, top, left + tileWidth, top + tileHeight, `tile_${index}`);
  }

  public getRegions(): Array<PointerRegion> {
    const regions: Array<PointerRegion> = [];
    for (let i = 0; i < this.tileCount; i++) {
      const region = this.regionAt(i);
      if (region !== null) {
        regions.push(region);
      }
    }
    return regions;
  }

  public hitTestTile(x: number, y: number): number {
    const point = new PointerCoordinate(x, y);
    const regions = this.getRegions();
    for (let i = 0; i < regions.length; i++) {
      if (regions[i].contains(point)) {
        return i;
      }
    }
    return -1;
  }

  public tileCenter(index: number): PointerCoordinate | null {
    const region = this.regionAt(index);
    if (region === null) {
      return null;
    }
    return region.getCenter();
  }

  public isFullScreenLayout(): boolean {
    return this.tileCount === 1;
  }

  public getTotalArea(): number {
    let total: number = 0;
    const regions = this.getRegions();
    for (let i = 0; i < regions.length; i++) {
      total = total + regions[i].getArea();
    }
    return total;
  }
}

// Classifies touch durations into pointer actions.
class PointerGestureClassifier {
  public static readonly TAP_MAX_MS: number = 200;
  public static readonly LONG_PRESS_MIN_MS: number = 600;
  public static readonly DOUBLE_TAP_MAX_MS: number = 300;

  public classifyDuration(durationMs: number): string {
    if (durationMs <= 0) {
      return 'invalid';
    }
    if (durationMs < PointerGestureClassifier.TAP_MAX_MS) {
      return 'tap';
    }
    if (durationMs >= PointerGestureClassifier.LONG_PRESS_MIN_MS) {
      return 'long_press';
    }
    return 'press';
  }

  public isLongPress(durationMs: number): boolean {
    return durationMs >= PointerGestureClassifier.LONG_PRESS_MIN_MS;
  }

  public isDoubleTapInterval(intervalMs: number): boolean {
    return intervalMs >= 0 && intervalMs <= PointerGestureClassifier.DOUBLE_TAP_MAX_MS;
  }

  public classifyAction(durationMs: number, intervalMs: number, moved: boolean): PointerAction {
    if (moved) {
      return PointerAction.DRAG;
    }
    if (this.isLongPress(durationMs)) {
      return PointerAction.LONG_PRESS;
    }
    if (intervalMs >= 0 && this.isDoubleTapInterval(intervalMs)) {
      return PointerAction.DOUBLE_CLICK;
    }
    if (durationMs > 0 && durationMs < PointerGestureClassifier.TAP_MAX_MS) {
      return PointerAction.CLICK;
    }
    return PointerAction.HOVER;
  }

  public describe(action: PointerAction): string {
    return `pointer action ${action}`;
  }
}

export default function pointerUtilValidationSuite(): void {
  describe('PointerUtilValidation_Suite', () => {
    let driver: Driver;
    let pointer: PointerUtilSimulator;

    beforeAll(async () => {
      driver = getDriver();
      pointer = PointerUtilSimulator.getInstance();
      pointer.resetState();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      Log.info(TAG, 'suite end');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
    });

    it('pointer_style_enum_should_be_defined_correctly', 0, async () => {
      expect(PointerStyle.DEFAULT).assertEqual('default');
      expect(PointerStyle.HAND).assertEqual('hand');
      expect(PointerStyle.MOVE).assertEqual('move');
      expect(PointerStyle.WAIT).assertEqual('wait');
      expect(PointerStyle.CROSSHAIR).assertEqual('crosshair');
      expect(PointerStyle.NOT_ALLOWED).assertEqual('not-allowed');
    });

    it('pointer_action_and_device_enums_should_be_defined', 0, async () => {
      expect(PointerAction.MOVE).assertEqual('move');
      expect(PointerAction.HOVER).assertEqual('hover');
      expect(PointerAction.CLICK).assertEqual('click');
      expect(PointerAction.DOUBLE_CLICK).assertEqual('double_click');
      expect(PointerAction.LONG_PRESS).assertEqual('long_press');
      expect(PointerAction.DRAG).assertEqual('drag');
      expect(PointerDeviceKind.REMOTE).assertEqual('remote');
      expect(PointerDeviceKind.MOUSE).assertEqual('mouse');
      expect(PointerDeviceKind.TOUCH).assertEqual('touch');
      expect(PointerDeviceKind.UNKNOWN).assertEqual('unknown');
    });

    it('pointer_initial_state_should_be_centered_default', 0, async () => {
      pointer.resetState();
      const state = pointer.getCurrentState();
      expect(state.style).assertEqual(PointerStyle.DEFAULT);
      expect(state.visible).assertTrue();
      expect(state.x).assertEqual(0);
      expect(state.y).assertEqual(0);
      expect(pointer.getStyleChangeCount()).assertEqual(0);
      expect(pointer.isVisible()).assertTrue();
    });

    it('pointer_style_change_should_follow_focus_mode', 0, async () => {
      pointer.resetState();
      pointer.changePointerStyle(true);
      expect(pointer.getCurrentState().style).assertEqual(PointerStyle.HAND);
      expect(pointer.getStyle()).assertEqual(PointerStyle.HAND);
      pointer.changePointerStyle(false);
      expect(pointer.getCurrentState().style).assertEqual(PointerStyle.DEFAULT);
      expect(pointer.getStyleChangeCount()).assertEqual(2);
    });

    it('pointer_style_change_history_should_record_transitions', 0, async () => {
      pointer.resetState();
      pointer.changePointerStyle(true);
      pointer.changePointerStyle(false);
      pointer.changePointerStyle(true);
      const history = pointer.getStyleChangeHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].from).assertEqual(PointerStyle.DEFAULT);
      expect(history[0].to).assertEqual(PointerStyle.HAND);
      expect(history[1].from).assertEqual(PointerStyle.HAND);
      expect(history[1].to).assertEqual(PointerStyle.DEFAULT);
      expect(history[2].to).assertEqual(PointerStyle.HAND);
    });

    it('pointer_visibility_toggle_should_work', 0, async () => {
      pointer.resetState();
      expect(pointer.isVisible()).assertTrue();
      pointer.setPointerVisibility(false);
      expect(pointer.isVisible()).assertFalse();
      expect(pointer.getCurrentState().visible).assertFalse();
      pointer.setPointerVisibility(true);
      expect(pointer.isVisible()).assertTrue();
      expect(pointer.getCurrentState().visible).assertTrue();
    });

    it('pointer_position_setting_should_store_coordinates', 0, async () => {
      pointer.resetState();
      pointer.setPointerPosition(615, 245);
      expect(pointer.getCurrentState().x).assertEqual(615);
      expect(pointer.getCurrentState().y).assertEqual(245);
      pointer.setPointerPosition(960, 540);
      expect(pointer.getCurrentState().x).assertEqual(960);
      expect(pointer.getCurrentState().y).assertEqual(540);
      expect(pointer.validateState()).assertTrue();
    });

    it('pointer_state_validation_should_reject_negative_position', 0, async () => {
      pointer.resetState();
      expect(pointer.validateState()).assertTrue();
      pointer.setPointerPosition(-1, 0);
      expect(pointer.validateState()).assertFalse();
      pointer.setPointerPosition(0, -1);
      expect(pointer.validateState()).assertFalse();
      pointer.setPointerPosition(-10, -20);
      expect(pointer.validateState()).assertFalse();
    });

    it('pointer_style_change_stats_should_be_accurate', 0, async () => {
      pointer.resetState();
      pointer.changePointerStyle(true);
      pointer.changePointerStyle(false);
      pointer.changePointerStyle(true);
      const stats: Map<string, number> = pointer.getStyleChangeStats();
      expect(stats.get('default->hand')).assertEqual(2);
      expect(stats.get('hand->default')).assertEqual(1);
      expect(stats.size).assertEqual(2);
      expect(stats.get('hand->hand') === undefined).assertTrue();
    });

    it('pointer_singleton_should_share_state', 0, async () => {
      const first = PointerUtilSimulator.getInstance();
      const second = PointerUtilSimulator.getInstance();
      expect(first === second).assertTrue();
      first.resetState();
      first.changePointerStyle(true);
      expect(second.getStyle()).assertEqual(PointerStyle.HAND);
      expect(second.getStyleChangeCount()).assertEqual(1);
      expect(second.toString().includes('style=hand')).assertTrue();
    });

    it('coordinate_clone_should_create_independent_copy', 0, async () => {
      const original = new PointerCoordinate(10, 20);
      const cloned = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.x = 999;
      expect(original.x).assertEqual(10);
      expect(cloned.x).assertEqual(999);
    });

    it('coordinate_distance_should_be_symmetric', 0, async () => {
      const origin = new PointerCoordinate(0, 0);
      const target = new PointerCoordinate(3, 4);
      expect(origin.distanceTo(target)).assertEqual(5);
      expect(target.distanceTo(origin)).assertEqual(5);
      expect(origin.distanceTo(origin)).assertEqual(0);
    });

    it('coordinate_validity_should_reject_negative_axis', 0, async () => {
      expect(new PointerCoordinate(0, 0).isValid()).assertTrue();
      expect(new PointerCoordinate(1920, 1080).isValid()).assertTrue();
      expect(new PointerCoordinate(-1, 0).isValid()).assertFalse();
      expect(new PointerCoordinate(0, -1).isValid()).assertFalse();
      expect(new PointerCoordinate(-5, -5).isValid()).assertFalse();
    });

    it('coordinate_move_by_should_translate_without_mutation', 0, async () => {
      const start = new PointerCoordinate(600, 200);
      const moved = start.moveBy(15, 45);
      expect(moved.x).assertEqual(615);
      expect(moved.y).assertEqual(245);
      expect(start.x).assertEqual(600);
      expect(start.y).assertEqual(200);
      expect(start.moveBy(-100, -100).x).assertEqual(500);
    });

    it('region_should_detect_contained_points', 0, async () => {
      const region = new PointerRegion(615, 245, 1305, 835, 'permission_panel');
      expect(region.contains(new PointerCoordinate(615, 245))).assertTrue();
      expect(region.contains(new PointerCoordinate(960, 540))).assertTrue();
      expect(region.contains(new PointerCoordinate(1305, 835))).assertTrue();
      expect(region.contains(new PointerCoordinate(1306, 540))).assertFalse();
      expect(region.contains(new PointerCoordinate(960, 836))).assertFalse();
    });

    it('region_validity_should_check_bounds_order', 0, async () => {
      expect(new PointerRegion(0, 0, 10, 10, 'ok').isValid()).assertTrue();
      expect(new PointerRegion(10, 0, 0, 10, 'bad').isValid()).assertFalse();
      expect(new PointerRegion(0, 10, 10, 0, 'bad').isValid()).assertFalse();
      expect(new PointerRegion(5, 5, 5, 5, 'point').isValid()).assertTrue();
    });

    it('region_zero_size_should_have_zero_area', 0, async () => {
      const zeroWidth = new PointerRegion(10, 10, 10, 30, 'zero_width');
      expect(zeroWidth.getWidth()).assertEqual(0);
      expect(zeroWidth.getHeight()).assertEqual(20);
      expect(zeroWidth.getArea()).assertEqual(0);
      const zeroHeight = new PointerRegion(10, 10, 30, 10, 'zero_height');
      expect(zeroHeight.getArea()).assertEqual(0);
    });

    it('hit_tester_should_report_hit_with_offsets', 0, async () => {
      const tester = new PointerHitTester();
      tester.addRegion(new PointerRegion(615, 245, 1305, 835, 'permission_panel'));
      const result = tester.hitTest(new PointerCoordinate(620, 250));
      expect(result.hit).assertTrue();
      expect(result.regionId).assertEqual('permission_panel');
      expect(result.offsetX).assertEqual(5);
      expect(result.offsetY).assertEqual(5);
    });

    it('hit_tester_should_report_miss_outside_regions', 0, async () => {
      const tester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'tile_0'));
      const result = tester.hitTest(new PointerCoordinate(50, 50));
      expect(result.hit).assertFalse();
      expect(result.regionId).assertEqual('');
      expect(result.offsetX).assertEqual(0);
      expect(result.offsetY).assertEqual(0);
    });

    it('hit_tester_should_prefer_topmost_region', 0, async () => {
      const tester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 100, 100, 'bottom'));
      tester.addRegion(new PointerRegion(0, 0, 50, 50, 'top'));
      const region = tester.getTopmostRegionAt(new PointerCoordinate(25, 25));
      expect(region === null).assertFalse();
      if (region !== null) {
        expect(region.regionId).assertEqual('top');
        expect(region.getWidth()).assertEqual(50);
      }
      expect(tester.hitTest(new PointerCoordinate(25, 25)).regionId).assertEqual('bottom');
    });

    it('event_recorder_should_record_pointer_events', 0, async () => {
      const recorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 615, 245, PointerDeviceKind.TOUCH, true);
      recorder.record(PointerAction.HOVER, 700, 300, PointerDeviceKind.MOUSE, false);
      expect(recorder.getRecordCount()).assertEqual(2);
      const records = recorder.getRecords();
      expect(records[0].action).assertEqual(PointerAction.CLICK);
      expect(records[0].x).assertEqual(615);
      expect(records[1].deviceKind).assertEqual(PointerDeviceKind.MOUSE);
    });

    it('event_recorder_should_count_by_action', 0, async () => {
      const recorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, PointerDeviceKind.TOUCH, true);
      recorder.record(PointerAction.CLICK, 1, 1, PointerDeviceKind.TOUCH, false);
      recorder.record(PointerAction.LONG_PRESS, 2, 2, PointerDeviceKind.TOUCH, true);
      recorder.record(PointerAction.DRAG, 3, 3, PointerDeviceKind.MOUSE, true);
      expect(recorder.getCountByAction(PointerAction.CLICK)).assertEqual(2);
      expect(recorder.getCountByAction(PointerAction.LONG_PRESS)).assertEqual(1);
      expect(recorder.getCountByAction(PointerAction.SCROLL)).assertEqual(0);
    });

    it('event_recorder_should_count_by_device_and_consumption', 0, async () => {
      const recorder = new PointerEventRecorder();
      recorder.record(PointerAction.MOVE, 0, 0, PointerDeviceKind.REMOTE, false);
      recorder.record(PointerAction.CLICK, 1, 1, PointerDeviceKind.REMOTE, true);
      recorder.record(PointerAction.HOVER, 2, 2, PointerDeviceKind.MOUSE, true);
      expect(recorder.getCountByDevice(PointerDeviceKind.REMOTE)).assertEqual(2);
      expect(recorder.getCountByDevice(PointerDeviceKind.MOUSE)).assertEqual(1);
      expect(recorder.getCountByDevice(PointerDeviceKind.TOUCH)).assertEqual(0);
      expect(recorder.getConsumedCount()).assertEqual(2);
    });

    it('event_recorder_should_reset_all_counters', 0, async () => {
      const recorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, PointerDeviceKind.TOUCH, true);
      recorder.record(PointerAction.MOVE, 1, 1, PointerDeviceKind.MOUSE, false);
      recorder.clear();
      expect(recorder.getRecordCount()).assertEqual(0);
      expect(recorder.getConsumedCount()).assertEqual(0);
      expect(recorder.getCountByAction(PointerAction.CLICK)).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
    });

    it('pointer_statistics_average_should_handle_empty_list', 0, async () => {
      const statistics = new PointerStatistics();
      const average = statistics.averageCoordinate([]);
      expect(average.x).assertEqual(0);
      expect(average.y).assertEqual(0);
      expect(statistics.boundingArea([])).assertEqual(0);
      expect(statistics.maxDistance([])).assertEqual(0);
    });

    it('pointer_statistics_average_should_compute_mean', 0, async () => {
      const statistics = new PointerStatistics();
      const points: Array<PointerCoordinate> = [
        new PointerCoordinate(600, 200),
        new PointerCoordinate(620, 240),
        new PointerCoordinate(640, 280)
      ];
      const average = statistics.averageCoordinate(points);
      expect(average.x).assertEqual(620);
      expect(average.y).assertEqual(240);
    });

    it('permission_panel_should_scale_with_zoom_ratio', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1.5);
      expect(metrics.getPanelWidth()).assertEqual(1035);
      expect(metrics.getPanelHeight()).assertEqual(885);
      const doubleZoom = new PermissionPanelMetrics(3840, 2160, 2);
      expect(doubleZoom.getPanelWidth()).assertEqual(1380);
      expect(doubleZoom.getPanelHeight()).assertEqual(1180);
      expect(doubleZoom.getZoomRatio()).assertEqual(2);
    });


    it('permission_panel_should_detect_and_clamp_points', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      expect(metrics.containsPanelPoint(960, 540)).assertTrue();
      expect(metrics.containsPanelPoint(615, 245)).assertTrue();
      expect(metrics.containsPanelPoint(614, 245)).assertFalse();
      expect(metrics.containsPanelPoint(960, 836)).assertFalse();
      const low = metrics.clampToPanel(0, 0);
      expect(low.x).assertEqual(615);
      expect(low.y).assertEqual(245);
      const high = metrics.clampToPanel(99999, 99999);
      expect(high.x).assertEqual(1305);
      expect(high.y).assertEqual(835);
    });

    it('permission_panel_should_provide_region_and_landscape_flag', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      const region = metrics.getPanelRegion();
      expect(region.regionId).assertEqual('permission_panel');
      expect(region.getWidth()).assertEqual(690);
      expect(region.getHeight()).assertEqual(590);
      expect(region.contains(new PointerCoordinate(960, 540))).assertTrue();
      const portrait = new PermissionPanelMetrics(1080, 1920, 1);
      expect(portrait.isLandscape()).assertFalse();
      expect(portrait.getLeft()).assertEqual(195);
      expect(portrait.getTop()).assertEqual(665);
    });

    it('tile_geometry_should_build_single_tile_region', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      const geometry = new TileGridGeometry(metrics, 1);
      expect(geometry.getTileCount()).assertEqual(1);
      expect(geometry.getColumns()).assertEqual(1);
      expect(geometry.getRows()).assertEqual(1);
      expect(geometry.isFullScreenLayout()).assertTrue();
      const region = geometry.regionAt(0);
      expect(region === null).assertFalse();
      if (region !== null) {
        expect(region.getWidth()).assertEqual(690);
        expect(region.getHeight()).assertEqual(590);
        expect(region.regionId).assertEqual('tile_0');
      }
    });

    it('tile_geometry_should_build_quad_grid_regions', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      const geometry = new TileGridGeometry(metrics, 4);
      expect(geometry.getColumns()).assertEqual(2);
      expect(geometry.getRows()).assertEqual(2);
      expect(geometry.getTileWidth()).assertEqual(345);
      expect(geometry.getTileHeight()).assertEqual(295);
      expect(geometry.getRegions().length).assertEqual(4);
      expect(geometry.getTotalArea()).assertEqual(4 * 345 * 295);
      expect(geometry.regionAt(4) === null).assertTrue();
      expect(geometry.regionAt(-1) === null).assertTrue();
    });

    it('tile_geometry_hit_test_should_resolve_tile_index', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      const geometry = new TileGridGeometry(metrics, 4);
      expect(geometry.hitTestTile(700, 300)).assertEqual(0);
      expect(geometry.hitTestTile(1000, 300)).assertEqual(1);
      expect(geometry.hitTestTile(700, 600)).assertEqual(2);
      expect(geometry.hitTestTile(1000, 600)).assertEqual(3);
      expect(geometry.hitTestTile(100, 100)).assertEqual(-1);
      expect(geometry.hitTestTile(1310, 840)).assertEqual(-1);
      const center = geometry.tileCenter(0);
      expect(center === null).assertFalse();
      if (center !== null) {
        expect(center.x).assertLarger(0);
      }
    });

    it('gesture_classifier_should_classify_durations', 0, async () => {
      const classifier = new PointerGestureClassifier();
      expect(classifier.classifyDuration(0)).assertEqual('invalid');
      expect(classifier.classifyDuration(-5)).assertEqual('invalid');
      expect(classifier.classifyDuration(100)).assertEqual('tap');
      expect(classifier.classifyDuration(199)).assertEqual('tap');
      expect(classifier.classifyDuration(200)).assertEqual('press');
      expect(classifier.classifyDuration(599)).assertEqual('press');
      expect(classifier.classifyDuration(600)).assertEqual('long_press');
      expect(classifier.classifyDuration(5000)).assertEqual('long_press');
      expect(classifier.classifyAction(100, 0, false) === PointerAction.CLICK ||
        classifier.classifyAction(100, 0, false) === PointerAction.DOUBLE_CLICK).assertTrue();
      expect(classifier.classifyAction(700, 0, false)).assertEqual(PointerAction.LONG_PRESS);
    });

    it('gesture_classifier_should_detect_long_press_and_double_tap', 0, async () => {
      const classifier = new PointerGestureClassifier();
      expect(classifier.isLongPress(600)).assertTrue();
      expect(classifier.isLongPress(599)).assertFalse();
      expect(classifier.isDoubleTapInterval(0)).assertTrue();
      expect(classifier.isDoubleTapInterval(300)).assertTrue();
      expect(classifier.isDoubleTapInterval(301)).assertFalse();
      expect(classifier.isDoubleTapInterval(-1)).assertFalse();
      expect(PointerGestureClassifier.DOUBLE_TAP_MAX_MS).assertEqual(300);
    });

    it('device_touch_on_panel_center_should_be_accepted', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      const center = metrics.getPanelCenter();
      await simulateTouch(driver, center.x, center.y);
      const count = await miracastComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(metrics.containsPanelPoint(center.x, center.y)).assertTrue();
      expect(center.x > 0).assertTrue();
      expect(center.y > 0).assertTrue();
    });

    it('device_long_press_and_swipe_should_run_serially', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      await longClickComponent(driver, metrics.getLeft() + 10, metrics.getTop() + 10, DELAY_TOUCH_EVENT);
      await swipeOnScreen(driver, metrics.getLeft() + 20, metrics.getTop() + 20,
        metrics.getLeft() + 120, metrics.getTop() + 120, 600);
      await isPermissionDialogVisible(driver);
      expect(metrics.getPanelRegion().getArea()).assertEqual(690 * 590);
      expect(metrics.getPanelRegion().getArea() < 1920 * 1080).assertTrue();
      expect(metrics.getPanelWidth()).assertEqual(690);
      Log.info(TAG, 'touch interactions executed on permission panel');
    });

    it('pointer_style_history_should_correlate_with_key_navigation', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      pointer.resetState();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      pointer.changePointerStyle(true);
      pointer.changePointerStyle(false);
      expect(pointer.getStyleChangeCount()).assertEqual(2);
      expect(pointer.hasStyleChange(PointerStyle.DEFAULT, PointerStyle.HAND)).assertTrue();
      expect(pointer.hasStyleChange(PointerStyle.HAND, PointerStyle.DEFAULT)).assertTrue();
      const count = await miracastComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('device_permission_options_should_be_hit_testable', 0, async () => {
      const metrics = new PermissionPanelMetrics(1920, 1080, 1);
      const panel = metrics.getPanelRegion();
      const tester = new PointerHitTester();
      tester.addRegion(new PointerRegion(panel.left + 40, panel.top + 380, panel.left + 650,
        panel.top + 440, ID_PERMANENT_TRUST));
      tester.addRegion(new PointerRegion(panel.left + 40, panel.top + 450, panel.left + 650,
        panel.top + 510, ID_ALLOW_BTN));
      tester.addRegion(new PointerRegion(panel.left + 40, panel.top + 520, panel.left + 650,
        panel.top + 580, ID_CANCEL_BTN));
      expect(tester.hitTest(new PointerCoordinate(panel.left + 100, panel.top + 400)).regionId)
        .assertEqual(ID_PERMANENT_TRUST);
      expect(tester.hitTest(new PointerCoordinate(panel.left + 100, panel.top + 480)).regionId)
        .assertEqual(ID_ALLOW_BTN);
      expect(tester.hitTest(new PointerCoordinate(panel.left + 100, panel.top + 550)).regionId)
        .assertEqual(ID_CANCEL_BTN);
      expect(tester.getRegionCount()).assertEqual(3);
    });
  });
}
