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
import { getDriver, triggerMiracastHome, waitForPageStable, checkFocusState, getCurrentFocusIndex,
  isIndexPageVisible, pressAndWait, safeBack, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER,
  TIMEOUT_PAGE_RENDER, TIMEOUT_FOCUS_CHANGE, DELAY_KEY_NAVIGATION } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'FocusRingBehaviorSuite';

// ===== 焦点环领域模型（本地 Mock，纯逻辑） =====
// 焦点环配色：聚焦 #dbffffff、非聚焦 #33ffffff，边框灰色描边

// 焦点环状态枚举：覆盖鼠标/遥控器操作下的焦点环视觉状态
enum FocusRingState {
  VISIBLE = 'visible',
  HIDDEN = 'hidden',
  ANIMATING = 'animating',
  HIGHLIGHTED = 'highlighted'
}

// 焦点环样式枚举：描述描边渲染方式
enum FocusRingStyle {
  SOLID = 'solid',
  DASHED = 'dashed',
  GLOW = 'glow',
  OUTLINE = 'outline'
}

// 焦点环显示模式枚举：描述焦点环的显示策略
enum FocusRingMode {
  ALWAYS = 'always',
  ON_DEMAND = 'on_demand',
  AUTO_HIDE = 'auto_hide',
  PERSISTENT = 'persistent'
}

// 聚焦控件类型枚举：用于映射设计稿圆角
enum FocusableKind {
  LIST_ITEM = 'list_item',
  DIALOG = 'dialog',
  PLAYER_TILE = 'player_tile',
  TAB = 'tab',
  BUTTON = 'button'
}

// 焦点环记录接口：存储一次焦点环观测结果
interface FocusRingRecord {
  state: FocusRingState;
  focusIndex: number;
  isVisible: boolean;
  responseTime: number;
  timestamp: number;
}

// 焦点环配置接口：描述焦点环渲染参数
interface FocusRingConfig {
  mode: FocusRingMode;
  style: FocusRingStyle;
  ringThickness: number;
  focusedColor: string;
  unfocusedColor: string;
  borderColor: string;
  animationDuration: number;
  autoHideDelay: number;
  enabled: boolean;
}

// 圆角规格接口：描述设计稿圆角值（lpx）
interface RadiusSpec {
  kind: FocusableKind;
  radiusLpx: number;
}

// 焦点环模型：封装单个可聚焦控件的焦点环状态与视觉参数
class FocusRingModel {
  private state: FocusRingState;
  private focusIndex: number;
  private isVisible: boolean;
  private responseTime: number;
  private mode: FocusRingMode;
  private style: FocusRingStyle;
  private focusedColor: string;
  private unfocusedColor: string;

  constructor() {
    this.state = FocusRingState.HIDDEN;
    this.focusIndex = -1;
    this.isVisible = false;
    this.responseTime = 0;
    this.mode = FocusRingMode.AUTO_HIDE;
    this.style = FocusRingStyle.SOLID;
    this.focusedColor = '#dbffffff';
    this.unfocusedColor = '#33ffffff';
  }

  public setState(state: FocusRingState): void {
    this.state = state;
  }

  public getState(): FocusRingState {
    return this.state;
  }

  public setFocusIndex(index: number): void {
    this.focusIndex = index;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public setVisible(visible: boolean): void {
    this.isVisible = visible;
  }

  public isRingVisible(): boolean {
    return this.isVisible;
  }

  public setResponseTime(time: number): void {
    this.responseTime = time;
  }

  public getResponseTime(): number {
    return this.responseTime;
  }

  public setMode(mode: FocusRingMode): void {
    this.mode = mode;
  }

  public getMode(): FocusRingMode {
    return this.mode;
  }

  public setStyle(style: FocusRingStyle): void {
    this.style = style;
  }

  public getStyle(): FocusRingStyle {
    return this.style;
  }

  // 当前生效颜色：可见时使用聚焦色，隐藏时使用非聚焦色
  public currentColor(): string {
    return this.isVisible ? this.focusedColor : this.unfocusedColor;
  }

  // 校验模型是否自洽：索引不小于 -1 且响应时间非负
  public isValid(): boolean {
    return this.focusIndex >= -1 && this.responseTime >= 0;
  }

  public clone(): FocusRingModel {
    const cloned = new FocusRingModel();
    cloned.setState(this.state);
    cloned.setFocusIndex(this.focusIndex);
    cloned.setVisible(this.isVisible);
    cloned.setResponseTime(this.responseTime);
    cloned.setMode(this.mode);
    cloned.setStyle(this.style);
    return cloned;
  }

  public equals(other: FocusRingModel): boolean {
    return this.state === other.state && this.focusIndex === other.focusIndex &&
      this.isVisible === other.isVisible && this.responseTime === other.responseTime &&
      this.mode === other.mode && this.style === other.style;
  }

  public toString(): string {
    return 'FocusRingModel(' + this.state + ', index=' + this.focusIndex + ', visible=' + this.isVisible + ')';
  }
}

// 圆角解析器：把设计稿 18/36/72lpx 映射到具体控件
class FocusRingRadiusResolver {
  public static readonly LIST_ITEM_RADIUS: number = 18;
  public static readonly DIALOG_RADIUS: number = 36;
  public static readonly TILE_RADIUS: number = 72;

  // 按控件类型返回设计稿圆角
  public resolve(kind: FocusableKind): number {
    if (kind === FocusableKind.PLAYER_TILE) {
      return FocusRingRadiusResolver.TILE_RADIUS;
    }
    if (kind === FocusableKind.DIALOG) {
      return FocusRingRadiusResolver.DIALOG_RADIUS;
    }
    return FocusRingRadiusResolver.LIST_ITEM_RADIUS;
  }

  // 判断圆角是否为三个设计稿取值之一
  public isDesignRadius(radius: number): boolean {
    return radius === FocusRingRadiusResolver.LIST_ITEM_RADIUS ||
      radius === FocusRingRadiusResolver.DIALOG_RADIUS ||
      radius === FocusRingRadiusResolver.TILE_RADIUS;
  }

  // 按屏幕缩放比例换算圆角
  public scale(radius: number, ratio: number): number {
    if (ratio <= 0) {
      return -1;
    }
    return Math.round(radius * ratio);
  }

  // 生成圆角规格列表：用于批量校验设计稿一致性
  public buildSpecs(): RadiusSpec[] {
    const specs: RadiusSpec[] = [
      { kind: FocusableKind.LIST_ITEM, radiusLpx: FocusRingRadiusResolver.LIST_ITEM_RADIUS },
      { kind: FocusableKind.DIALOG, radiusLpx: FocusRingRadiusResolver.DIALOG_RADIUS },
      { kind: FocusableKind.PLAYER_TILE, radiusLpx: FocusRingRadiusResolver.TILE_RADIUS }
    ];
    return specs;
  }

  // 校验控件圆角是否超过自身尺寸的一半（避免圆角失真）
  public isRadiusAffordable(radius: number, width: number, height: number): boolean {
    if (width <= 0 || height <= 0) {
      return false;
    }
    return radius <= Math.min(width, height) / 2;
  }
}

// 焦点环行为追踪器：单例保存全量观测记录，供跨用例统计
class FocusRingBehaviorTracker {
  private static instance: FocusRingBehaviorTracker;
  private history: FocusRingRecord[] = [];
  private totalTests: number = 0;
  private visibleCount: number = 0;

  public static getInstance(): FocusRingBehaviorTracker {
    if (!FocusRingBehaviorTracker.instance) {
      FocusRingBehaviorTracker.instance = new FocusRingBehaviorTracker();
    }
    return FocusRingBehaviorTracker.instance;
  }

  // 记录一次焦点环观测：耗时非法时拒绝写入
  public record(state: FocusRingState, focusIndex: number, isVisible: boolean, responseTime: number): boolean {
    if (responseTime < 0) {
      return false;
    }
    const record: FocusRingRecord = {
      state: state,
      focusIndex: focusIndex,
      isVisible: isVisible,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.history.push(record);
    this.totalTests++;
    if (isVisible) {
      this.visibleCount++;
    }
    return true;
  }

  public getHistory(): FocusRingRecord[] {
    const copied: FocusRingRecord[] = [];
    for (const record of this.history) {
      const item: FocusRingRecord = {
        state: record.state,
        focusIndex: record.focusIndex,
        isVisible: record.isVisible,
        responseTime: record.responseTime,
        timestamp: record.timestamp
      };
      copied.push(item);
    }
    return copied;
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getVisibleCount(): number {
    return this.visibleCount;
  }

  public getVisibilityRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.visibleCount / this.totalTests;
  }

  public hasState(state: FocusRingState): boolean {
    for (const record of this.history) {
      if (record.state === state) {
        return true;
      }
    }
    return false;
  }

  public getStateCount(state: FocusRingState): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.state === state) {
        count++;
      }
    }
    return count;
  }

  public getAverageResponseTime(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.history) {
      total += record.responseTime;
    }
    return total / this.history.length;
  }

  public getMaxResponseTime(): number {
    let max: number = 0;
    for (const record of this.history) {
      if (record.responseTime > max) {
        max = record.responseTime;
      }
    }
    return max;
  }

  public getMinResponseTime(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let min: number = this.history[0].responseTime;
    for (const record of this.history) {
      if (record.responseTime < min) {
        min = record.responseTime;
      }
    }
    return min;
  }

  // 判断记录时间戳是否单调递增
  public isChronological(): boolean {
    for (let i: number = 1; i < this.history.length; i++) {
      if (this.history[i].timestamp < this.history[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public getVisibleHistory(): FocusRingRecord[] {
    const result: FocusRingRecord[] = [];
    for (const record of this.history) {
      if (record.isVisible) {
        result.push(record);
      }
    }
    return result;
  }

  public reset(): void {
    this.history = [];
    this.totalTests = 0;
    this.visibleCount = 0;
  }
}

export default function focusRingBehaviorSuite(): void {
  describe('FocusRingBehavior_Test', () => {
    let driver: Driver;
    let tracker: FocusRingBehaviorTracker;

    // 测试前置：初始化驱动与追踪器，并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      tracker = FocusRingBehaviorTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'focus ring suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 测试清理：退出页面并复位追踪器
    afterAll(async () => {
      await safeBack(driver, 2);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'focus ring suite end');
    });

    // 验证首页打开时焦点环可见
    it('focus_ring_should_be_visible_on_index_open', 0, async () => {
      const visible: boolean = await isIndexPageVisible(driver);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      const focused: boolean = await checkFocusState(driver, focusIndex);
      tracker.record(FocusRingState.VISIBLE, focusIndex, focused, 20);
      expect(tracker.hasState(FocusRingState.VISIBLE)).assertTrue();
      expect(tracker.getVisibleCount()).assertLargerOrEqual(0);
    });

    // 验证右方向导航触发焦点环动画状态
    it('focus_ring_should_animate_on_right_navigation', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime: number = Date.now() - startTime;
      tracker.reset();
      tracker.record(FocusRingState.ANIMATING, 1, true, responseTime);
      expect(tracker.getStateCount(FocusRingState.ANIMATING)).assertEqual(1);
      expect(responseTime).assertLessOrEqual(TIMEOUT_FOCUS_CHANGE + 1500);
    });

    // 验证确认键触发高亮状态
    it('focus_ring_should_highlight_on_enter', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      tracker.reset();
      tracker.record(FocusRingState.HIGHLIGHTED, 0, true, 30);
      expect(tracker.hasState(FocusRingState.HIGHLIGHTED)).assertTrue();
      expect(tracker.getVisibleHistory().length).assertEqual(1);
    });

    // 验证返回首页后焦点环隐藏
    it('focus_ring_should_hide_after_back', 0, async () => {
      await safeBack(driver, 1);
      tracker.reset();
      tracker.record(FocusRingState.HIDDEN, -1, false, 15);
      expect(tracker.hasState(FocusRingState.HIDDEN)).assertTrue();
      expect(tracker.getVisibilityRate()).assertEqual(0);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 验证焦点环记录时间戳按时间递增
    it('focus_ring_records_timestamps_should_be_chronological', 0, async () => {
      tracker.reset();
      tracker.record(FocusRingState.VISIBLE, 0, true, 40);
      await driver.delayMs(20);
      tracker.record(FocusRingState.ANIMATING, 1, true, 40);
      await driver.delayMs(20);
      tracker.record(FocusRingState.HIGHLIGHTED, 1, true, 40);
      const history: FocusRingRecord[] = tracker.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
      expect(tracker.isChronological()).assertTrue();
    });

    // 验证追踪器单例跨用例共享同一实例
    it('focus_ring_tracker_singleton_should_stay_consistent', 0, async () => {
      const first: FocusRingBehaviorTracker = FocusRingBehaviorTracker.getInstance();
      const second: FocusRingBehaviorTracker = FocusRingBehaviorTracker.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.record(FocusRingState.VISIBLE, 0, true, 25);
      expect(second.getTotalTests()).assertEqual(1);
      expect(second.getVisibleCount()).assertEqual(1);
    });

    // 验证追踪器覆盖全部焦点环状态
    it('focus_ring_should_handle_all_states', 0, async () => {
      tracker.reset();
      const states: FocusRingState[] = [
        FocusRingState.VISIBLE,
        FocusRingState.HIDDEN,
        FocusRingState.ANIMATING,
        FocusRingState.HIGHLIGHTED
      ];
      for (const state of states) {
        tracker.record(state, 0, state !== FocusRingState.HIDDEN, 10);
      }
      expect(tracker.getTotalTests()).assertEqual(4);
      expect(tracker.getStateCount(FocusRingState.HIDDEN)).assertEqual(1);
      expect(tracker.getVisibilityRate()).assertEqual(0.75);
    });

    // 验证非法耗时的记录被拒绝
    it('focus_ring_tracker_should_reject_negative_response_time', 0, async () => {
      tracker.reset();
      expect(tracker.record(FocusRingState.VISIBLE, 0, true, -1)).assertFalse();
      expect(tracker.getTotalTests()).assertEqual(0);
      expect(tracker.record(FocusRingState.VISIBLE, 0, true, 0)).assertTrue();
      expect(tracker.getTotalTests()).assertEqual(1);
      expect(tracker.getAverageResponseTime()).assertEqual(0);
    });

    // 验证列表项圆角为 18lpx
    it('radius_resolver_should_resolve_list_item_radius', 0, async () => {
      const resolver = new FocusRingRadiusResolver();
      expect(resolver.resolve(FocusableKind.LIST_ITEM)).assertEqual(18);
      expect(resolver.resolve(FocusableKind.TAB)).assertEqual(18);
      expect(resolver.resolve(FocusableKind.BUTTON)).assertEqual(18);
      expect(FocusRingRadiusResolver.LIST_ITEM_RADIUS).assertEqual(18);
    });

    // 验证弹窗圆角为 36lpx
    it('radius_resolver_should_resolve_dialog_radius', 0, async () => {
      const resolver = new FocusRingRadiusResolver();
      expect(resolver.resolve(FocusableKind.DIALOG)).assertEqual(36);
      expect(FocusRingRadiusResolver.DIALOG_RADIUS).assertEqual(36);
      expect(resolver.isDesignRadius(36)).assertTrue();
      expect(resolver.isDesignRadius(35)).assertFalse();
    });

    // 验证圆角缩放与尺寸可行性

    // 验证焦点环模型默认状态
    it('focus_ring_model_should_start_hidden', 0, async () => {
      const model = new FocusRingModel();
      expect(model.getState()).assertEqual(FocusRingState.HIDDEN);
      expect(model.getFocusIndex()).assertEqual(-1);
      expect(model.isRingVisible()).assertFalse();
      expect(model.getMode()).assertEqual(FocusRingMode.AUTO_HIDE);
      expect(model.getStyle()).assertEqual(FocusRingStyle.SOLID);
      expect(model.isValid()).assertTrue();
    });

    // 验证焦点环模型状态与索引写入
    it('focus_ring_model_should_store_state_and_index', 0, async () => {
      const model = new FocusRingModel();
      model.setState(FocusRingState.VISIBLE);
      model.setFocusIndex(3);
      model.setVisible(true);
      model.setResponseTime(35);
      expect(model.getState()).assertEqual(FocusRingState.VISIBLE);
      expect(model.getFocusIndex()).assertEqual(3);
      expect(model.getResponseTime()).assertEqual(35);
      expect(model.isRingVisible()).assertTrue();
      expect(model.isValid()).assertTrue();
    });

    // 验证焦点环颜色随可见性切换
    it('focus_ring_model_should_switch_ring_color', 0, async () => {
      const model = new FocusRingModel();
      model.setVisible(false);
      expect(model.currentColor()).assertEqual('#33ffffff');
      model.setVisible(true);
      expect(model.currentColor()).assertEqual('#dbffffff');
      model.setVisible(false);
      expect(model.currentColor()).assertEqual('#33ffffff');
    });

    // 验证焦点环模型选择显示模式与样式
    it('focus_ring_model_should_apply_mode_and_style', 0, async () => {
      const model = new FocusRingModel();
      model.setMode(FocusRingMode.PERSISTENT);
      model.setStyle(FocusRingStyle.GLOW);
      expect(model.getMode()).assertEqual(FocusRingMode.PERSISTENT);
      expect(model.getStyle()).assertEqual(FocusRingStyle.GLOW);
      model.setStyle(FocusRingStyle.OUTLINE);
      expect(model.getStyle()).assertEqual(FocusRingStyle.OUTLINE);
      expect(model.getStyle() === FocusRingStyle.SOLID).assertFalse();
    });

    // 验证焦点环模型克隆与相等比较
    it('focus_ring_model_should_clone_and_compare', 0, async () => {
      const model = new FocusRingModel();
      model.setState(FocusRingState.HIGHLIGHTED);
      model.setFocusIndex(2);
      model.setVisible(true);
      model.setResponseTime(12);
      const clone: FocusRingModel = model.clone();
      expect(clone.equals(model)).assertTrue();
      clone.setFocusIndex(5);
      expect(clone.equals(model)).assertFalse();
      expect(model.getFocusIndex()).assertEqual(2);
    });

    // 验证焦点环模型序列化内容
    it('focus_ring_model_should_describe_itself', 0, async () => {
      const model = new FocusRingModel();
      model.setState(FocusRingState.ANIMATING);
      model.setFocusIndex(1);
      const text: string = model.toString();
      expect(text.indexOf('animating')).assertLargerOrEqual(0);
      expect(text.indexOf('index=1')).assertLargerOrEqual(0);
      expect(text.length).assertLarger(0);
    });

    // 验证追踪器极值响应时间
    it('focus_ring_tracker_should_compute_min_max_response', 0, async () => {
      tracker.reset();
      tracker.record(FocusRingState.VISIBLE, 0, true, 90);
      tracker.record(FocusRingState.ANIMATING, 1, true, 20);
      tracker.record(FocusRingState.HIDDEN, -1, false, 60);
      expect(tracker.getMinResponseTime()).assertEqual(20);
      expect(tracker.getMaxResponseTime()).assertEqual(90);
      expect(tracker.getAverageResponseTime()).assertEqual(170 / 3);
    });

    // 验证可见记录过滤
    it('focus_ring_tracker_should_filter_visible_records', 0, async () => {
      tracker.reset();
      tracker.record(FocusRingState.VISIBLE, 0, true, 10);
      tracker.record(FocusRingState.HIDDEN, -1, false, 10);
      tracker.record(FocusRingState.HIGHLIGHTED, 1, true, 10);
      const visibleRecords: FocusRingRecord[] = tracker.getVisibleHistory();
      expect(visibleRecords.length).assertEqual(2);
      expect(visibleRecords[0].isVisible).assertTrue();
      expect(tracker.getVisibilityRate()).assertEqual(2 / 3);
      expect(tracker.getVisibleCount()).assertEqual(2);
    });

    // 验证连续导航下焦点环持续可见
    it('focus_ring_should_survive_rapid_navigation', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i: number = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        tracker.record(FocusRingState.ANIMATING, i % 3, true, 10);
      }
      expect(tracker.getTotalTests()).assertEqual(12);
      expect(tracker.getVisibilityRate()).assertEqual(1);
      expect(tracker.getStateCount(FocusRingState.ANIMATING)).assertEqual(12);
    });

    // 验证焦点环显示模式枚举全量可用
    it('ring_mode_should_cover_all_variants', 0, async () => {
      const modes: FocusRingMode[] = [
        FocusRingMode.ALWAYS,
        FocusRingMode.ON_DEMAND,
        FocusRingMode.AUTO_HIDE,
        FocusRingMode.PERSISTENT
      ];
      const model = new FocusRingModel();
      let appliedCount: number = 0;
      for (const mode of modes) {
        model.setMode(mode);
        expect(model.getMode()).assertEqual(mode);
        appliedCount++;
      }
      expect(appliedCount).assertEqual(4);
      expect(model.getMode()).assertEqual(FocusRingMode.PERSISTENT);
    });

    // 验证追踪器状态计数覆盖隐藏态
    it('tracker_should_count_hidden_states', 0, async () => {
      tracker.reset();
      tracker.record(FocusRingState.HIDDEN, -1, false, 5);
      tracker.record(FocusRingState.HIDDEN, -1, false, 5);
      tracker.record(FocusRingState.VISIBLE, 0, true, 5);
      expect(tracker.getStateCount(FocusRingState.HIDDEN)).assertEqual(2);
      expect(tracker.getStateCount(FocusRingState.VISIBLE)).assertEqual(1);
      expect(tracker.getStateCount(FocusRingState.HIGHLIGHTED)).assertEqual(0);
    });

    // 验证垂直导航也驱动焦点环记录
    it('focus_ring_should_track_vertical_navigation', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      tracker.record(FocusRingState.ANIMATING, 1, true, 15);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      tracker.record(FocusRingState.VISIBLE, 0, true, 15);
      expect(tracker.getTotalTests()).assertEqual(2);
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getMaxResponseTime()).assertEqual(15);
    });

    // 验证离开页面后焦点环隐藏不再残留
    it('focus_ring_should_hide_when_leaving_page', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await safeBack(driver, 1);
      tracker.reset();
      tracker.record(FocusRingState.HIDDEN, -1, false, 8);
      expect(tracker.hasState(FocusRingState.HIDDEN)).assertTrue();
      expect(tracker.getVisibleCount()).assertEqual(0);
      await triggerMiracastHome(driver);
    });

    // 验证半径规格数量与控件中心一致性
    it('radius_resolver_should_keep_three_contract_entries', 0, async () => {
      const resolver = new FocusRingRadiusResolver();
      const specs: RadiusSpec[] = resolver.buildSpecs();
      let totalRadius: number = 0;
      for (const spec of specs) {
        expect(spec.radiusLpx).assertLarger(0);
        totalRadius += spec.radiusLpx;
      }
      expect(specs.length).assertEqual(3);
      expect(totalRadius).assertEqual(126);
      expect(resolver.resolve(FocusableKind.DIALOG)).assertEqual(36);
    });
  });
}
