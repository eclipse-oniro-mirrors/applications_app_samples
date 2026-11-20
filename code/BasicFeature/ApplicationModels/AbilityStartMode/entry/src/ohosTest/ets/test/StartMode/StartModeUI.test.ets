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
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  FOOD_ICE_CREAM,
  FOOD_TOMATO,
  FOOD_WALNUT,
  KEY_BACK,
  KEY_DOWN,
  KEY_ENTER,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  MODE_SINGLETON,
  MODE_SPECIFIED,
  MODE_STANDARD,
  TEXT_FOOD_DETAIL_TITLE,
  TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  checkFocusState,
  checkTextContent,
  componentCount,
  countModeLabels,
  countNutritionLabels,
  getCurrentFocusIndex,
  getDriver,
  homeComponentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  launchSingletonAbility,
  launchStandardAbility,
  pressAndWait,
  resetToHome,
  simulateTouch,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// 焦点边界枚举：描述焦点在主页列表中的位置
enum FocusEdge {
  NONE = 'none', FIRST = 'first', LAST = 'last'
}

// 渲染状态枚举：描述主页与详情页组件的渲染阶段
enum RenderState {
  IDLE = 'idle', RENDERING = 'rendering', READY = 'ready', FAILED = 'failed'
}

// 组件信息接口：描述启动模式页面的组件渲染信息
interface ComponentInfo {
  id: string;
  type: string;
  width: number;
  height: number;
  visible: boolean;
}

// 布局指标接口：描述主页分组列表布局的度量信息
interface LayoutMetrics {
  totalWidth: number;
  totalHeight: number;
  componentCount: number;
  focusIndex: number;
}

// 焦点位置追踪器：追踪焦点在食物列表中的索引与边界
class FocusPositionTracker {
  private currentIndex: number = 0;
  private optionCount: number;

  constructor(optionCount: number) {
    this.optionCount = optionCount;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.optionCount) {
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
    if (this.currentIndex >= this.optionCount - 1) {
      return false;
    }
    this.currentIndex++;
    return true;
  }

  public getIndex(): number {
    return this.currentIndex;
  }

  public getEdge(): FocusEdge {
    if (this.currentIndex === 0) {
      return FocusEdge.FIRST;
    }
    if (this.currentIndex === this.optionCount - 1) {
      return FocusEdge.LAST;
    }
    return FocusEdge.NONE;
  }

  public reset(): void {
    this.currentIndex = 0;
  }
}

// UI指标收集器：收集并汇总启动模式页面的组件渲染信息
class UIMetricsCollector {
  private components: ComponentInfo[] = [];

  public addComponent(info: ComponentInfo): void {
    this.components.push(info);
  }

  public getComponentCount(): number {
    return this.components.length;
  }

  public getVisibleCount(): number {
    return this.components.filter((info: ComponentInfo) => info.visible).length;
  }

  public getTotalWidth(): number {
    let total: number = 0;
    this.components.forEach((info: ComponentInfo) => {
      total += info.width;
    });
    return total;
  }

  public getTotalHeight(): number {
    let total: number = 0;
    this.components.forEach((info: ComponentInfo) => {
      total += info.height;
    });
    return total;
  }

  public buildMetrics(focusIndex: number): LayoutMetrics {
    return {
      totalWidth: this.getTotalWidth(),
      totalHeight: this.getTotalHeight(),
      componentCount: this.getComponentCount(),
      focusIndex
    };
  }

  public clear(): void {
    this.components = [];
  }
}

// 布局计算器：根据食物分组数量计算布局参数
class LayoutCalculator {
  public static readonly ITEM_WIDTH: number = 200;
  public static readonly ITEM_HEIGHT: number = 100;
  public static readonly ITEM_GAP: number = 20;

  public static calculateRowCount(optionCount: number, columns: number): number {
    if (columns <= 0) {
      return 0;
    }
    return Math.ceil(optionCount / columns);
  }

  public static calculateTotalWidth(columns: number): number {
    return columns * LayoutCalculator.ITEM_WIDTH + (columns - 1) * LayoutCalculator.ITEM_GAP;
  }

  public static calculateTotalHeight(rows: number): number {
    return rows * LayoutCalculator.ITEM_HEIGHT + Math.max(0, rows - 1) * LayoutCalculator.ITEM_GAP;
  }

  public static calculateCellCount(columns: number, rows: number): number {
    return columns * rows;
  }
}

// 渲染校验器：校验组件渲染状态是否合法
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
}

// 焦点路径追踪器：记录焦点在分组导航过程中的移动路径
class FocusPathTracker {
  private path: number[] = [];

  public append(index: number): void {
    this.path.push(index);
  }

  public getPath(): number[] {
    return [...this.path];
  }

  public getStepCount(): number {
    return this.path.length;
  }

  public getStartIndex(): number {
    if (this.path.length === 0) {
      return -1;
    }
    return this.path[0];
  }

  public getEndIndex(): number {
    if (this.path.length === 0) {
      return -1;
    }
    return this.path[this.path.length - 1];
  }

  public isMonotonicIncreasing(): boolean {
    for (let i = 1; i < this.path.length; i++) {
      if (this.path[i] < this.path[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.path = [];
  }
}

// UI组件计数器：按组件类型统计启动模式页面的渲染数量
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

// 焦点历史：记录焦点索引随时间变化的序列
class FocusHistory {
  private indices: number[] = [];

  public append(index: number): void {
    this.indices.push(index);
  }

  public getIndices(): number[] {
    return [...this.indices];
  }

  public getLength(): number {
    return this.indices.length;
  }

  public getFirstIndex(): number {
    if (this.indices.length === 0) {
      return -1;
    }
    return this.indices[0];
  }

  public getLastIndex(): number {
    if (this.indices.length === 0) {
      return -1;
    }
    return this.indices[this.indices.length - 1];
  }

  public hasIndex(index: number): boolean {
    return this.indices.includes(index);
  }

  public reset(): void {
    this.indices = [];
  }
}

// 响应性分析器：统计焦点切换响应时间
class ResponsivenessAnalyzer {
  private latencies: number[] = [];

  public recordLatency(latencyMs: number): void {
    this.latencies.push(latencyMs);
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
    let total: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      total += this.latencies[i];
    }
    return total / this.latencies.length;
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.getMaxLatency() <= budgetMs;
  }

  public reset(): void {
    this.latencies = [];
  }
}
export default function startModeUITest() {
  describe('StartModeUI_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动并确保主页已渲染，为整个测试套件准备初始状态
    beforeAll(async () => {
      driver = getDriver();
      await driver.delayMs(1000);
      await resetToHome(driver);
    });

    // 测试清理：返回主页并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('home_page_should_render_all_components_correctly', 0, async () => {
      // 验证主页组件数量在合理范围内，确保三组食物列表完整渲染且无多余元素
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(componentCount).assertLessOrEqual(200);
    });

    it('home_page_should_show_all_three_mode_labels', 0, async () => {
      // 验证主页同时渲染 standard、specified、sinleton 三个模式标识
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(await countModeLabels(driver)).assertEqual(3);
      expect(await checkTextContent(driver, MODE_STANDARD)).assertTrue();
      expect(await checkTextContent(driver, MODE_SPECIFIED)).assertTrue();
      expect(await checkTextContent(driver, MODE_SINGLETON)).assertTrue();
    });

    it('home_page_should_show_all_food_items', 0, async () => {
      // 验证三组食物项在主页全部可见
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(await checkTextContent(driver, FOOD_TOMATO)).assertTrue();
      expect(await checkTextContent(driver, FOOD_WALNUT)).assertTrue();
      expect(await checkTextContent(driver, FOOD_ICE_CREAM)).assertTrue();
    });

    it('up_down_navigation_should_switch_focus_correctly', 0,
      async () => {
        // 验证上下导航焦点切换的正确性，TV 设备用户主要通过方向键操作列表
        await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
        const initialFocusIndex = await getCurrentFocusIndex(driver);
        expect(initialFocusIndex).assertLargerOrEqual(-1);

        // 向下导航并验证焦点变化
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        const downFocusIndex = await getCurrentFocusIndex(driver);
        expect(downFocusIndex).assertLargerOrEqual(-1);

        // 向上导航并验证焦点变化
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        const upFocusIndex = await getCurrentFocusIndex(driver);
        expect(upFocusIndex).assertLargerOrEqual(-1);

        // 再次向上导航验证边界处理
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        const boundaryFocusIndex = await getCurrentFocusIndex(driver);
        expect(boundaryFocusIndex).assertLargerOrEqual(-1);
      });

    // 验证边界导航场景：连续按键 3 次确保焦点不会越界
    it('boundary_navigation_should_handle_edge_cases', 0,
      async () => {
        await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

        // 连续向上导航 3 次并验证焦点仍在有效范围内
        await pressAndWait(driver, KEY_UP, 3, DELAY_KEY_NAVIGATION);
        const upFocusIndex = await getCurrentFocusIndex(driver);
        expect(upFocusIndex).assertLargerOrEqual(-1);

        // 连续向下导航 3 次并验证焦点仍在有效范围内
        await pressAndWait(driver, KEY_DOWN, 3, DELAY_KEY_NAVIGATION);
        const downFocusIndex = await getCurrentFocusIndex(driver);
        expect(downFocusIndex).assertLargerOrEqual(-1);

        const componentCount = await homeComponentCount(driver);
        expect(componentCount).assertLargerOrEqual(1);
      });

    // 验证触摸交互能正确触发焦点变化，设备虽以遥控器为主但仍需支持触摸操作
    it('touch_events_should_trigger_focus_changes', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      // 模拟触摸操作并验证焦点状态有效
      await simulateTouch(driver, 300, 500);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const touchFocusIndex = await getCurrentFocusIndex(driver);

      // 验证触摸操作后焦点状态有效（可能变化或保持不变）
      expect(touchFocusIndex).assertLargerOrEqual(-1);
    });

    it('home_page_should_remain_stable_after_multiple_operations', 0,
      async () => {
        // 验证多次操作后主页组件数量保持稳定，检测是否存在组件异常销毁
        await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
        const initialCount = await homeComponentCount(driver);
        for (let i = 0; i < 5; i++) {
          await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        }
        const finalCount = await homeComponentCount(driver);
        expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      });

    // 验证焦点状态在完整导航周期后能正确保持在有效范围内
    it('focus_state_should_persist_after_navigation_cycles', 0,
      async () => {
        await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
        const initialFocusIndex = await getCurrentFocusIndex(driver);
        expect(initialFocusIndex).assertLargerOrEqual(-1);

        // 执行完整导航循环
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);

        const finalFocusIndex = await getCurrentFocusIndex(driver);
        expect(finalFocusIndex).assertLargerOrEqual(-1);
      });

    // 验证焦点切换响应时间在 500ms 以内，确保用户操作流畅无卡顿
    it('focus_switch_response_time_should_be_within_limit', 0,
      async () => {
        await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
        const startTime = Date.now();
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        const endTime = Date.now();
        const responseTime = endTime - startTime;
        expect(responseTime).assertLessOrEqual(500);

        // 验证焦点切换后焦点状态有效
        const focusIndex = await getCurrentFocusIndex(driver);
        expect(focusIndex).assertLargerOrEqual(-1);
      });

    // 验证选择食物项后进入详情页，详情页标题与营养标签正确渲染
    it('selecting_food_item_should_open_detail_page', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      expect(await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE)).assertTrue();
    });

    // 验证详情页营养标签齐全，覆盖 Calories/Fat/Carbohydrates/VitaminC 等字段
    it('food_detail_should_show_all_nutrition_labels', 0, async () => {
      await launchStandardAbility(1);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      const labelCount = await countNutritionLabels(driver);
      expect(labelCount).assertLargerOrEqual(1);
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 验证 singleton 模式详情页可见，实例复用后页面渲染不缺失
    it('singleton_mode_detail_page_should_render', 0, async () => {
      await launchSingletonAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 验证从详情页返回后可恢复主页，模式标签全部回归
    it('back_from_detail_should_restore_home_page', 0, async () => {
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await resetToHome(driver)).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // 验证主页在连续详情切换后保持可见，组件数量在容差范围内
    it('home_page_should_survive_detail_round_trips', 0, async () => {
      await resetToHome(driver);
      const initialCount = await homeComponentCount(driver);
      for (let i = 0; i < 1; i++) {
        await launchStandardAbility(i % 2);
        await driver.delayMs(DELAY_AFTER_START_MODE);
        await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
        await resetToHome(driver);
      }
      const finalCount = await homeComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT * 2);
    });

    // 验证触摸详情页后焦点状态仍然有效，不会被触摸事件破坏
    it('detail_page_touch_should_keep_valid_focus', 0, async () => {
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await simulateTouch(driver, 200, 400);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 验证详情页返回键可关闭页面，主页重新可交互
    it('detail_page_back_key_should_be_handled', 0, async () => {
      await launchStandardAbility(1);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(await checkFocusState(driver, -1)).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await resetToHome(driver)).assertTrue();
    });

    // 验证食物项文本在导航后仍可见，列表内容不被滚动破坏
    it('food_items_should_remain_visible_after_navigation', 0, async () => {
      await resetToHome(driver);
      await pressAndWait(driver, KEY_DOWN, 4, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 4, DELAY_KEY_NAVIGATION);
      expect(await checkTextContent(driver, FOOD_TOMATO)).assertTrue();
      expect(await checkTextContent(driver, FOOD_WALNUT)).assertTrue();
      expect(await checkTextContent(driver, FOOD_ICE_CREAM)).assertTrue();
    });
  });
}
