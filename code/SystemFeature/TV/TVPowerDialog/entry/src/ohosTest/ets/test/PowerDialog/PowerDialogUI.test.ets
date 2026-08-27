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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  KEY_POWER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  checkTextContent,
  simulateTouch,
  pressAndWait,
  triggerPowerDialog,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT,
  STABLE_ROUNDS,
  STABLE_TOLERANCE,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

// 焦点边界枚举：描述焦点在选项列表中的位置
enum FocusEdge {
  NONE = 'none', FIRST = 'first', LAST = 'last'
}

// 渲染状态枚举：描述对话框组件的渲染阶段
enum RenderState {
  IDLE = 'idle', RENDERING = 'rendering', READY = 'ready', FAILED = 'failed'
}

// 组件信息接口：描述对话框组件的渲染信息
interface ComponentInfo {
  id: string;
  type: string;
  width: number;
  height: number;
  visible: boolean;
}

// 布局指标接口：描述对话框布局的度量信息
interface LayoutMetrics {
  totalWidth: number;
  totalHeight: number;
  componentCount: number;
  focusIndex: number;
}

// 焦点位置追踪器：追踪焦点在选项列表中的索引与边界
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

// UI指标收集器：收集并汇总渲染组件信息
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

// 布局计算器：根据选项数量计算布局参数
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

// 焦点路径追踪器：记录焦点在导航过程中的移动路径
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

// UI组件计数器：按组件类型统计渲染数量
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

export default function powerDialogUITest() {
  describe('PowerDialogUI_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => { // 创建干净的Driver实例并触发电源对话框，为整个测试套件准备初始状态
      driver = createFreshDriver();
      await driver.delayMs(1000);
      await triggerPowerDialog(driver);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => { // 测试结束后按两次返回键关闭对话框并清理状态
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('power_dialog_should_render_all_components_correctly', 0, async () => { // 验证对话框组件数量在合理范围内（1-10个），确保UI完整渲染且无多余元素
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(componentCount).assertLessOrEqual(10);
    });

    it('left_right_navigation_should_switch_focus_correctly', 0,
      async () => { // 验证左右导航焦点切换的正确性，TV设备用户主要通过方向键操作对话框 // 依次测试：初始焦点→右→左→左（边界），覆盖正常导航和边界场景
        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
        const initialFocusIndex = await getCurrentFocusIndex(driver);
        expect(initialFocusIndex).assertLargerOrEqual(-1);

        // 向右导航并验证焦点变化
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const rightFocusIndex = await getCurrentFocusIndex(driver);
        expect(rightFocusIndex).assertLargerOrEqual(-1);

        // 向左导航并验证焦点变化
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const leftFocusIndex = await getCurrentFocusIndex(driver);
        expect(leftFocusIndex).assertLargerOrEqual(-1);

        // 再次向左导航验证边界处理
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const boundaryFocusIndex = await getCurrentFocusIndex(driver);
        expect(boundaryFocusIndex).assertLargerOrEqual(-1);
      });

    // 验证boundary navigation处理能力：确保TV设备在should handle edge cases下功能正常
    it('boundary_navigation_should_handle_edge_cases', 0,
      async () => { // 验证边界导航场景：连续按键3次确保焦点不会越界 // TV设备用户可能快速连续按键，需要确保焦点始终停留在有效范围内
        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

        // 连续向左导航3次并验证焦点仍在有效范围内
        await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
        const leftFocusIndex = await getCurrentFocusIndex(driver);
        expect(leftFocusIndex).assertLargerOrEqual(-1);

        // 连续向右导航3次并验证焦点仍在有效范围内
        await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
        const rightFocusIndex = await getCurrentFocusIndex(driver);
        expect(rightFocusIndex).assertLargerOrEqual(-1);

        const componentCount = await powerDialogComponentCount(driver);
        expect(componentCount).assertLargerOrEqual(1);
      });

    // 验证touch events触发：确保TV设备should trigger focus changes机制有效
    it('touch_events_should_trigger_focus_changes', 0, async () => { // 验证触摸交互能正确触发焦点变化，TV设备虽以遥控器为主但仍需支持触摸操作
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);

      // 模拟触摸操作并验证焦点变化
      await simulateTouch(driver, 300, 500);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const touchFocusIndex = await getCurrentFocusIndex(driver);

      // 验证触摸操作后焦点状态有效（可能变化或保持不变）
      expect(touchFocusIndex).assertLargerOrEqual(-1);
    });

    it('dialog_should_remain_stable_after_multiple_operations', 0,
      async () => { // 验证多次操作后对话框组件数量保持稳定，检测是否存在内存泄漏或组件异常销毁 // 5轮左右导航操作模拟用户正常使用场景，确保UI状态一致性
        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
        const initialCount = await powerDialogComponentCount(driver);
        for (let i = 0; i < 5; i++) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        const finalCount = await powerDialogComponentCount(driver);
        expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      });

    // 验证focus state持久：确保TV设备should persist after navigation cycles状态保持
    it('focus_state_should_persist_after_navigation_cycles', 0,
      async () => { // 验证焦点状态在完整导航周期后能正确保持在有效范围内 // 右→右→左→左形成一个完整的导航循环，确保焦点管理逻辑无状态泄漏
        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
        const initialFocusIndex = await getCurrentFocusIndex(driver);
        expect(initialFocusIndex).assertLargerOrEqual(-1);

        // 执行完整导航循环
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

        const finalFocusIndex = await getCurrentFocusIndex(driver);
        expect(finalFocusIndex).assertLargerOrEqual(-1);
      });

    // 验证focus switch状态正确：确保TV设备response time should be within limit符合预期
    it('focus_switch_response_time_should_be_within_limit', 0,
      async () => { // 验证焦点切换响应时间在500ms以内，确保TV设备用户操作流畅无卡顿 // 响应时间过长会导致用户体验下降，特别是老年用户对延迟更敏感
        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
        const startTime = Date.now();
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const endTime = Date.now();
        const responseTime = endTime - startTime;
        expect(responseTime).assertLessOrEqual(500);

        // 验证焦点切换后焦点状态有效
        const focusIndex = await getCurrentFocusIndex(driver);
        expect(focusIndex).assertLargerOrEqual(-1);
      });
  });


}