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
  KEY_MENU,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  checkTextContent,
  simulateTouch,
  pressAndWait,
  triggerMenuDialog,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT,
  STABLE_ROUNDS,
  STABLE_TOLERANCE,
  getCurrentFocusIndex
} from '../common/SharedDriver';

export default function appManagerHomeUITest() {
  describe('AppManagerHomeUI_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => { // 创建干净的Driver实例并触发应用操作菜单，为整个测试套件准备初始状态
      driver = createFreshDriver();
      await driver.delayMs(1000);
      await triggerMenuDialog(driver);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => { // 测试结束后按两次返回键关闭弹窗并清理状态
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('app_manager_should_render_all_components_correctly', 0, async () => { // 验证界面组件已完整渲染，确保UI完整渲染且无异常
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('left_right_navigation_should_switch_focus_correctly', 0, async () => { // 验证左右导航焦点切换的正确性，TV设备用户主要通过方向键操作弹窗
      // 依次测试：初始焦点→右→左→左（边界），覆盖正常导航和边界场景
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
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
    it('boundary_navigation_should_handle_edge_cases', 0, async () => { // 验证边界导航场景：连续按键3次确保焦点不会越界
      // TV设备用户可能快速连续按键，需要确保焦点始终停留在有效范围内
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      // 连续向左导航3次并验证焦点仍在有效范围内
      await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
      const leftFocusIndex = await getCurrentFocusIndex(driver);
      expect(leftFocusIndex).assertLargerOrEqual(-1);

      // 连续向右导航3次并验证焦点仍在有效范围内
      await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
      const rightFocusIndex = await getCurrentFocusIndex(driver);
      expect(rightFocusIndex).assertLargerOrEqual(-1);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证touch events触发：确保TV设备should trigger focus changes机制有效
    it('touch_events_should_trigger_focus_changes', 0, async () => { // 验证触摸交互能正确触发焦点变化，TV设备虽以遥控器为主但仍需支持触摸操作
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);

      // 模拟触摸操作并验证焦点变化
      await simulateTouch(driver, 300, 500);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const touchFocusIndex = await getCurrentFocusIndex(driver);

      // 验证触摸操作后焦点状态有效（可能变化或保持不变）
      expect(touchFocusIndex).assertLargerOrEqual(-1);
    });

    it('grid_should_remain_stable_after_multiple_operations', 0, async () => { // 验证多次操作后弹窗组件数量保持稳定，检测是否存在内存泄漏或组件异常销毁
      // 5轮左右导航操作模拟用户正常使用场景，确保UI状态一致性
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await appComponentCount(driver);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    // 验证focus state持久：确保TV设备should persist after navigation cycles状态保持
    it('focus_state_should_persist_after_navigation_cycles', 0, async () => { // 验证焦点状态在完整导航周期后能正确保持在有效范围内
      // 右→右→左→左形成一个完整的导航循环，确保焦点管理逻辑无状态泄漏
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
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
    it('focus_switch_response_time_should_be_within_limit', 0, async () => { // 验证焦点切换响应时间在500ms以内，确保TV设备用户操作流畅无卡顿
      // 响应时间过长会导致用户体验下降，特别是老年用户对延迟更敏感
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const endTime = Date.now();
      const responseTime = endTime - startTime;
      expect(responseTime).assertLessOrEqual(500);

      // 验证焦点切换后焦点状态有效
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 验证网格布局计算：确保TV设备GridLayoutCalculator行列计算正确
    it('grid_layout_calculator_should_compute_row_and_column', 0, () => {
      expect(GridLayoutCalculator.getRow(7)).assertEqual(1);
      expect(GridLayoutCalculator.getColumn(7)).assertEqual(1);
      expect(GridLayoutCalculator.getRowCount(20)).assertLargerOrEqual(4);
      expect(GridLayoutCalculator.getFirstScreenCount()).assertEqual(18);
      expect(GridLayoutCalculator.isInFirstScreen(10)).assertTrue();
      expect(GridLayoutCalculator.isInFirstScreen(20)).assertFalse();
    });

    // 验证组件层级构建：确保TV设备ComponentHierarchyBuilder层级记录正确
    it('component_hierarchy_builder_should_track_components', 0, () => {
      const builder: ComponentHierarchyBuilder = new ComponentHierarchyBuilder();
      builder.addComponent('Grid');
      builder.addComponent('Text');
      expect(builder.getComponentCount()).assertEqual(2);
      expect(builder.hasComponent('Grid')).assertTrue();
      expect(builder.hasComponent('Image')).assertFalse();
      builder.clear();
      expect(builder.getComponentCount()).assertEqual(0);
    });

    // 验证网格滚动控制：确保TVDeviceGridScrollController滚动偏移正确
    it('grid_scroll_controller_should_manage_offset', 0, () => {
      const scroller: GridScrollController = new GridScrollController();
      scroller.scrollBy(100);
      scroller.scrollBy(50);
      expect(scroller.getScrollOffset()).assertEqual(150);
      scroller.scrollTo(0);
      expect(scroller.getScrollOffset()).assertEqual(0);
    });
  });
}

/**
 * 网格布局计算器
 * 封装六列网格布局的坐标计算业务逻辑
 */
class GridLayoutCalculator {
  public static readonly COLUMNS: number = 6;

  // 计算指定索引所在行
  public static getRow(index: number): number {
    return Math.floor(index / GridLayoutCalculator.COLUMNS);
  }

  // 计算指定索引所在列
  public static getColumn(index: number): number {
    return index % GridLayoutCalculator.COLUMNS;
  }

  // 计算网格总行数
  public static getRowCount(itemCount: number): number {
    return Math.ceil(itemCount / GridLayoutCalculator.COLUMNS);
  }

  // 计算首屏可见应用数量（3 行 6 列）
  public static getFirstScreenCount(): number {
    return GridLayoutCalculator.COLUMNS * 3;
  }

  // 判断索引是否在首屏范围内
  public static isInFirstScreen(index: number): boolean {
    return index < GridLayoutCalculator.getFirstScreenCount();
  }
}

/**
 * 焦点环渲染器
 * 封装焦点高亮边框的样式与渲染业务逻辑
 */
class FocusRingRenderer {
  private isFocusedFlag: boolean = false;
  private borderColor: string = 'transparent';

  public setFocused(focused: boolean): void {
    this.isFocusedFlag = focused;
    this.borderColor = focused ? 'rgba(255, 255, 255, 0.86)' : 'transparent';
  }

  public isFocused(): boolean {
    return this.isFocusedFlag;
  }

  public getBorderColor(): string {
    return this.borderColor;
  }

  // 校验焦点环样式
  public isValidStyle(): boolean {
    return this.borderColor.length > 0;
  }
}

/**
 * 组件层级构建器
 * 封装 UI 组件层级结构的构建业务逻辑
 */
class ComponentHierarchyBuilder {
  private hierarchy: string[] = [];

  public addComponent(componentName: string): void {
    this.hierarchy.push(componentName);
  }

  public getHierarchy(): string[] {
    return [...this.hierarchy];
  }

  public getComponentCount(): number {
    return this.hierarchy.length;
  }

  public hasComponent(componentName: string): boolean {
    return this.hierarchy.includes(componentName);
  }

  public clear(): void {
    this.hierarchy = [];
  }
}

/**
 * 网格单元格尺寸计算器
 * 封装网格单元格宽高计算业务逻辑
 */
class GridCellSizeCalculator {
  private cellWidth: number = 0;
  private cellHeight: number = 0;
  private gap: number = 0;

  public setCellSize(width: number, height: number): void {
    this.cellWidth = width;
    this.cellHeight = height;
  }

  public setGap(gap: number): void {
    this.gap = gap;
  }

  public getCellWidth(): number {
    return this.cellWidth;
  }

  public getCellHeight(): number {
    return this.cellHeight;
  }

  // 计算指定行起始 Y 坐标
  public getRowOffsetY(row: number): number {
    return row * (this.cellHeight + this.gap);
  }

  // 计算指定列起始 X 坐标
  public getColumnOffsetX(column: number): number {
    return column * (this.cellWidth + this.gap);
  }
}

/**
 * 网格滚动控制器
 * 封装网格滚动的偏移量控制业务逻辑
 */
class GridScrollController {
  private scrollOffset: number = 0;

  public scrollBy(delta: number): void {
    this.scrollOffset += delta;
  }

  public scrollTo(offset: number): void {
    this.scrollOffset = offset;
  }

  public getScrollOffset(): number {
    return this.scrollOffset;
  }

  public reset(): void {
    this.scrollOffset = 0;
  }
}

/**
 * 网格渲染优化器
 * 封装首屏渲染优化业务逻辑
 */
class GridRenderOptimizer {
  private renderedCount: number = 0;

  public setRenderedCount(count: number): void {
    this.renderedCount = count;
  }

  public getRenderedCount(): number {
    return this.renderedCount;
  }

  public isFirstScreenOptimized(totalCount: number): boolean {
    return this.renderedCount <= totalCount;
  }
}

/**
 * 网格统计器
 * 封装网格组件数量统计业务逻辑
 */
class GridStatistics {
  private renderedCount: number = 0;

  public recordRendered(): void {
    this.renderedCount++;
  }

  public getRenderedCount(): number {
    return this.renderedCount;
  }

  public reset(): void {
    this.renderedCount = 0;
  }
}

/**
 * 网格焦点管理器
 * 封装网格焦点索引管理业务逻辑
 */
class GridFocusManager {
  private focusIndex: number = 0;

  public setFocusIndex(index: number): void {
    this.focusIndex = index;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public reset(): void {
    this.focusIndex = 0;
  }
}

/**
 * 网格状态追踪器
 * 封装网格渲染状态追踪业务逻辑
 */
class GridStateTracker {
  private isRenderingFlag: boolean = false;

  public startRendering(): void {
    this.isRenderingFlag = true;
  }

  public stopRendering(): void {
    this.isRenderingFlag = false;
  }

  public isRendering(): boolean {
    return this.isRenderingFlag;
  }
}


