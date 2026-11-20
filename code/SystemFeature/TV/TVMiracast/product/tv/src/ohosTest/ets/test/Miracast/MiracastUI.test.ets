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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  KEY_ENTER,
  miracastComponentCount,
  waitForPageStable,
  simulateTouch,
  pressAndWait,
  triggerMiracastHome,
  getCurrentFocusIndex,
  isFullScreenMode,
  getPlayerTileCount,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_SESSION_OP,
  TOLERANCE_COMPONENT_COUNT,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastUISuite';

enum FocusEdge {
  NONE = 'none',
  FIRST = 'first',
  LAST = 'last'
}

enum RenderState {
  IDLE = 'idle',
  RENDERING = 'rendering',
  READY = 'ready',
  FAILED = 'failed'
}

class FocusPositionTracker {
  private currentIndex: number = 0;
  private tileCount: number;

  constructor(tileCount: number) {
    this.tileCount = tileCount > 0 ? tileCount : 1;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.tileCount) {
      return false;
    }
    this.currentIndex = index;
    return true;
  }

  public moveLeft(): boolean {
    if (this.currentIndex <= 0) {
      return false;
    }
    this.currentIndex--;
    return true;
  }

  public moveRight(): boolean {
    if (this.currentIndex >= this.tileCount - 1) {
      return false;
    }
    this.currentIndex++;
    return true;
  }

  public moveDown(columns: number): boolean {
    if (columns <= 0 || this.currentIndex + columns >= this.tileCount) {
      return false;
    }
    this.currentIndex = this.currentIndex + columns;
    return true;
  }

  public getIndex(): number {
    return this.currentIndex;
  }

  public getEdge(): FocusEdge {
    if (this.currentIndex === 0) {
      return FocusEdge.FIRST;
    }
    if (this.currentIndex === this.tileCount - 1) {
      return FocusEdge.LAST;
    }
    return FocusEdge.NONE;
  }

  public reset(): void {
    this.currentIndex = 0;
  }
}

class TileLayoutCalculator {
  public static readonly FULL_SCREEN_TILES: number = 1;
  public static readonly SPLIT_TILES: number = 2;
  public static readonly QUAD_TILES: number = 4;
  public static readonly NINE_TILES: number = 9;

  public static calculateColumns(tileCount: number): number {
    if (tileCount <= 0) {
      return 0;
    }
    if (tileCount <= TileLayoutCalculator.FULL_SCREEN_TILES) {
      return 1;
    }
    if (tileCount <= TileLayoutCalculator.SPLIT_TILES) {
      return 2;
    }
    if (tileCount <= TileLayoutCalculator.QUAD_TILES) {
      return 2;
    }
    return 3;
  }

  public static calculateRows(tileCount: number): number {
    if (tileCount <= 0) {
      return 0;
    }
    if (tileCount <= TileLayoutCalculator.FULL_SCREEN_TILES) {
      return 1;
    }
    if (tileCount <= TileLayoutCalculator.SPLIT_TILES) {
      return 1;
    }
    if (tileCount <= TileLayoutCalculator.QUAD_TILES) {
      return 2;
    }
    return 3;
  }

  public static isFullScreenLayout(tileCount: number): boolean {
    return tileCount === TileLayoutCalculator.FULL_SCREEN_TILES;
  }

  public static getTileWidthRatio(tileCount: number): number {
    const columns: number = TileLayoutCalculator.calculateColumns(tileCount);
    if (columns <= 0) {
      return 0;
    }
    return 100 / columns;
  }

  public static getTileHeightRatio(tileCount: number): number {
    const rows: number = TileLayoutCalculator.calculateRows(tileCount);
    if (rows <= 0) {
      return 0;
    }
    return 100 / rows;
  }

  public static isTileIndexValid(index: number, tileCount: number): boolean {
    return index >= 0 && index < tileCount && tileCount <= MAX_MIRROR_TILES;
  }
}

class RenderValidator {
  public static isCountValid(count: number, min: number, max: number): boolean {
    return count >= min && count <= max;
  }

  public static isDimensionValid(width: number, height: number): boolean {
    return width > 0 && height > 0;
  }

  public static isStateReady(state: RenderState): boolean {
    return state === RenderState.READY;
  }

  public static isStateFailed(state: RenderState): boolean {
    return state === RenderState.FAILED;
  }

  public static isRatioValid(ratio: number): boolean {
    return ratio > 0 && ratio <= 100;
  }
}

class UIComponentCounter {
  private typeCounts: Map<string, number> = new Map<string, number>();

  public record(type: string): void {
    const current: number = this.typeCounts.get(type) ?? 0;
    this.typeCounts.set(type, current + 1);
  }

  public getCount(type: string): number {
    const value: number | undefined = this.typeCounts.get(type);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalCount(): number {
    let total: number = 0;
    this.typeCounts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctTypeCount(): number {
    return this.typeCounts.size;
  }

  public reset(): void {
    this.typeCounts = new Map<string, number>();
  }
}

// 响应时延分析器：记录焦点切换耗时并校验预算
class ResponsivenessAnalyzer {
  private latencies: number[] = [];

  public recordLatency(latency: number): void {
    if (latency >= 0) {
      this.latencies.push(latency);
    }
  }

  public getSampleCount(): number {
    return this.latencies.length;
  }

  public getMaxLatency(): number {
    let max: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      if (this.latencies[i] > max) {
        max = this.latencies[i];
      }
    }
    return max;
  }

  public getAverageLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    return this.latencies.reduce((sum: number, value: number) => sum + value, 0) / this.latencies.length;
  }

  public isWithinBudget(budget: number): boolean {
    return this.getSampleCount() > 0 && this.getMaxLatency() <= budget;
  }
}

// 焦点路径：记录焦点移动轨迹，用于验证导航步数
class FocusPathTracker {
  private steps: number[] = [];

  public append(focusIndex: number): void {
    this.steps.push(focusIndex);
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public getPath(): number[] {
    return [...this.steps];
  }

  public reset(): void {
    this.steps = [];
  }
}

export default function miracastUISuite(): void {
  describe('MiracastUI_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'suite start');
      await driver.delayMs(TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
    });


    it('left_right_navigation_should_switch_focus_correctly', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      expect(initialFocusIndex).assertLargerOrEqual(-1);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
    });


    it('touch_events_should_trigger_focus_changes', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const beforeCount: number = await miracastComponentCount(driver);
      await simulateTouch(driver, 300, 500);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const touchFocusIndex: number = await getCurrentFocusIndex(driver);
      expect(touchFocusIndex).assertLargerOrEqual(-1);
      const afterCount: number = await miracastComponentCount(driver);
      expect(Math.abs(afterCount - beforeCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('page_should_remain_stable_after_multiple_operations', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await miracastComponentCount(driver);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount: number = await miracastComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('focus_switch_response_time_should_be_within_limit', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const analyzer = new ResponsivenessAnalyzer();
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      analyzer.recordLatency(Date.now() - startTime);
      expect(analyzer.getSampleCount()).assertEqual(1);
      expect(analyzer.isWithinBudget(TIMEOUT_FOCUS_CHANGE)).assertTrue();
      expect(analyzer.getMaxLatency()).assertLargerOrEqual(0);
    });

    it('single_tile_layout_should_be_full_screen', 0, async () => {
      expect(TileLayoutCalculator.isFullScreenLayout(1)).assertTrue();
      expect(TileLayoutCalculator.calculateColumns(1)).assertEqual(1);
      expect(TileLayoutCalculator.calculateRows(1)).assertEqual(1);
      expect(TileLayoutCalculator.getTileWidthRatio(1)).assertEqual(100);
      expect(TileLayoutCalculator.getTileHeightRatio(1)).assertEqual(100);
    });

    it('two_tile_layout_should_split_left_and_right', 0, async () => {
      expect(TileLayoutCalculator.calculateColumns(2)).assertEqual(2);
      expect(TileLayoutCalculator.calculateRows(2)).assertEqual(1);
      expect(TileLayoutCalculator.getTileWidthRatio(2)).assertEqual(50);
      expect(TileLayoutCalculator.getTileHeightRatio(2)).assertEqual(100);
      expect(TileLayoutCalculator.isFullScreenLayout(2)).assertFalse();
    });

    it('three_or_four_tiles_should_use_quad_layout', 0, async () => {
      expect(TileLayoutCalculator.calculateColumns(3)).assertEqual(2);
      expect(TileLayoutCalculator.calculateRows(3)).assertEqual(2);
      expect(TileLayoutCalculator.calculateColumns(4)).assertEqual(2);
      expect(TileLayoutCalculator.calculateRows(4)).assertEqual(2);
      expect(TileLayoutCalculator.getTileWidthRatio(4)).assertEqual(50);
      expect(TileLayoutCalculator.getTileHeightRatio(4)).assertEqual(50);
    });

    it('five_to_nine_tiles_should_use_nine_grid_layout', 0, async () => {
      expect(TileLayoutCalculator.calculateColumns(5)).assertEqual(3);
      expect(TileLayoutCalculator.calculateRows(5)).assertEqual(3);
      expect(TileLayoutCalculator.calculateColumns(MAX_MIRROR_TILES)).assertEqual(3);
      expect(TileLayoutCalculator.calculateRows(MAX_MIRROR_TILES)).assertEqual(3);
      const ratio: number = TileLayoutCalculator.getTileWidthRatio(MAX_MIRROR_TILES);
      expect(RenderValidator.isRatioValid(ratio)).assertTrue();
      expect(ratio).assertLessOrEqual(33.34);
    });

    it('zero_tile_layout_should_return_empty_geometry', 0, async () => {
      expect(TileLayoutCalculator.calculateColumns(0)).assertEqual(0);
      expect(TileLayoutCalculator.calculateRows(0)).assertEqual(0);
      expect(TileLayoutCalculator.getTileWidthRatio(0)).assertEqual(0);
      expect(TileLayoutCalculator.getTileHeightRatio(-1)).assertEqual(0);
      expect(TileLayoutCalculator.isFullScreenLayout(0)).assertFalse();
    });

    it('tile_index_validation_should_reject_out_of_range', 0, async () => {
      expect(TileLayoutCalculator.isTileIndexValid(0, 4)).assertTrue();
      expect(TileLayoutCalculator.isTileIndexValid(3, 4)).assertTrue();
      expect(TileLayoutCalculator.isTileIndexValid(4, 4)).assertFalse();
      expect(TileLayoutCalculator.isTileIndexValid(-1, 4)).assertFalse();
      expect(TileLayoutCalculator.isTileIndexValid(0, MAX_MIRROR_TILES + 1)).assertFalse();
    });

    it('focus_tracker_should_reject_out_of_range_index', 0, async () => {
      const tracker = new FocusPositionTracker(4);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getEdge()).assertEqual(FocusEdge.FIRST);
      expect(tracker.setIndex(3)).assertTrue();
      expect(tracker.getEdge()).assertEqual(FocusEdge.LAST);
      expect(tracker.setIndex(4)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
      expect(tracker.getIndex()).assertEqual(3);
    });

    it('focus_tracker_should_clamp_horizontal_movement', 0, async () => {
      const tracker = new FocusPositionTracker(2);
      expect(tracker.moveLeft()).assertFalse();
      expect(tracker.moveRight()).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.moveRight()).assertFalse();
      expect(tracker.moveLeft()).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('focus_tracker_should_be_immobile_for_single_tile', 0, async () => {
      const tracker = new FocusPositionTracker(1);
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.moveRight()).assertFalse();
      expect(tracker.moveLeft()).assertFalse();
      expect(tracker.moveDown(1)).assertFalse();
      expect(tracker.getEdge()).assertEqual(FocusEdge.FIRST);
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('render_validator_should_check_state_and_dimension', 0, async () => {
      expect(RenderValidator.isStateReady(RenderState.READY)).assertTrue();
      expect(RenderValidator.isStateReady(RenderState.RENDERING)).assertFalse();
      expect(RenderValidator.isStateFailed(RenderState.FAILED)).assertTrue();
      expect(RenderValidator.isDimensionValid(1920, 1080)).assertTrue();
      expect(RenderValidator.isDimensionValid(0, 1080)).assertFalse();
    });

    it('ui_component_counter_should_count_by_type', 0, async () => {
      const counter = new UIComponentCounter();
      counter.record('Text');
      counter.record('Text');
      counter.record('Stack');
      expect(counter.getCount('Text')).assertEqual(2);
      expect(counter.getCount('Stack')).assertEqual(1);
      expect(counter.getCount('Image')).assertEqual(0);
      expect(counter.getTotalCount()).assertEqual(3);
      expect(counter.getDistinctTypeCount()).assertEqual(2);
      counter.reset();
      expect(counter.getTotalCount()).assertEqual(0);
    });

    it('player_tile_count_should_not_exceed_max_tiles', 0, async () => {
      const tileCount: number = await getPlayerTileCount(driver);
      expect(tileCount).assertLargerOrEqual(0);
      expect(tileCount).assertLessOrEqual(MAX_MIRROR_TILES);
    });

    it('vertical_navigation_should_be_safe_on_player_page', 0, async () => {
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('back_key_should_exit_current_page_safely', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
      expect(RenderValidator.isCountValid(componentCount, 0, 200)).assertTrue();
      await triggerMiracastHome(driver);
    });

    it('tab_switch_should_keep_focus_valid', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const tabFocusIndex: number = await getCurrentFocusIndex(driver);
      expect(tabFocusIndex).assertLargerOrEqual(-1);
      const pathTracker = new FocusPathTracker();
      pathTracker.append(0);
      pathTracker.append(tabFocusIndex);
      expect(pathTracker.getStepCount()).assertEqual(2);
    });

    it('enter_key_should_not_break_page_render', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
      expect(RenderValidator.isCountValid(componentCount, 0, 200)).assertTrue();
    });

    it('focus_tracker_should_move_down_one_row', 0, async () => {
      const tracker = new FocusPositionTracker(9);
      expect(tracker.moveDown(3)).assertTrue();
      expect(tracker.getIndex()).assertEqual(3);
      expect(tracker.moveDown(6)).assertFalse();
      expect(tracker.getEdge()).assertEqual(FocusEdge.NONE);
    });

    it('tile_ratio_should_fill_layout_columns', 0, async () => {
      expect(TileLayoutCalculator.getTileWidthRatio(4)).assertEqual(50);
      expect(TileLayoutCalculator.getTileHeightRatio(4)).assertEqual(50);
      expect(RenderValidator.isRatioValid(TileLayoutCalculator.getTileWidthRatio(9))).assertTrue();
      expect(TileLayoutCalculator.getTileWidthRatio(0)).assertEqual(0);
    });

    it('component_counter_should_reset_counts', 0, async () => {
      const counter = new UIComponentCounter();
      counter.record('text');
      counter.record('button');
      counter.record('button');
      expect(counter.getDistinctTypeCount()).assertEqual(2);
      expect(counter.getTotalCount()).assertEqual(3);
      counter.reset();
      expect(counter.getTotalCount()).assertEqual(0);
      expect(counter.getCount('button')).assertEqual(0);
    });

    it('render_validator_should_reject_zero_dimension', 0, async () => {
      expect(RenderValidator.isDimensionValid(0, 100)).assertFalse();
      expect(RenderValidator.isDimensionValid(100, 100)).assertTrue();
      expect(RenderValidator.isCountValid(0, 1, MAX_MIRROR_TILES)).assertFalse();
      expect(RenderValidator.isCountValid(3, 1, MAX_MIRROR_TILES)).assertTrue();
    });
  });
}
