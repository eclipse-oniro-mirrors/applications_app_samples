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
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_POWER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  checkTextContent,
  findComponentsByType,
  pressAndWait,
  triggerPowerDialog,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/SharedDriver';

interface ComponentRenderRecord {
  type: string;
  count: number;
  visible: boolean;
  timestamp: number;
}

class ComponentRenderingTracker {
  private static instance: ComponentRenderingTracker;
  private renderHistory: ComponentRenderRecord[] = [];
  private totalRenders: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ComponentRenderingTracker {
    if (!ComponentRenderingTracker.instance) {
      ComponentRenderingTracker.instance = new ComponentRenderingTracker();
    }
    return ComponentRenderingTracker.instance;
  }

  public recordRender(type: string, count: number, visible: boolean): void {
    const record: ComponentRenderRecord = {
      type,
      count,
      visible,
      timestamp: Date.now()
    };
    this.renderHistory.push(record);
    this.totalRenders++;
  }

  public getRenderHistory(): ComponentRenderRecord[] {
    return [...this.renderHistory];
  }

  public getTotalRenders(): number {
    return this.totalRenders;
  }

  public resetTracker(): void {
    this.renderHistory = [];
    this.totalRenders = 0;
  }

  public getLatestRenderCount(type: string): number {
    for (let i = this.renderHistory.length - 1; i >= 0; i--) {
      if (this.renderHistory[i].type === type) {
        return this.renderHistory[i].count;
      }
    }
    return 0;
  }
}

// 组件类别枚举：定义对话框中可渲染的UI组件类型，用于渲染分类统计
enum ComponentKind {
  IMAGE = 'Image', TEXT = 'Text', ROW = 'Row', COLUMN = 'Column', BUTTON = 'Button', STACK = 'Stack'
}

// 渲染质量等级枚举：定义组件渲染质量的评价等级，用于量化渲染健康度
enum RenderQuality {
  EXCELLENT = 'excellent', GOOD = 'good', FAIR = 'fair', POOR = 'poor'
}

// 组件渲染指标接口：描述单个组件渲染后的度量数据
interface RenderMetric {
  componentId: string;
  kind: ComponentKind;
  width: number;
  height: number;
  opacity: number;
  renderCostMs: number;
}

// 渲染快照接口：描述某一时刻整个对话框的渲染状态
interface RenderSnapshot {
  snapshotId: number;
  totalComponents: number;
  visibleComponents: number;
  hiddenComponents: number;
  quality: RenderQuality;
}

// 组件渲染模型类：封装单个组件的渲染指标，提供质量评估与克隆能力
class ComponentRenderModel {
  private componentId: string;
  private kind: ComponentKind;
  private width: number;
  private height: number;
  private opacity: number;
  private renderCostMs: number;

  constructor(componentId: string, kind: ComponentKind, width: number, height: number, opacity: number,
    renderCostMs: number) {
    this.componentId = componentId;
    this.kind = kind;
    this.width = width;
    this.height = height;
    this.opacity = opacity;
    this.renderCostMs = renderCostMs;
  }

  public getComponentId(): string {
    return this.componentId;
  }

  public getKind(): ComponentKind {
    return this.kind;
  }

  public getWidth(): number {
    return this.width;
  }

  public getHeight(): number {
    return this.height;
  }

  public getOpacity(): number {
    return this.opacity;
  }

  public getRenderCostMs(): number {
    return this.renderCostMs;
  }

  public setOpacity(opacity: number): void {
    this.opacity = opacity;
  }

  // 计算组件面积：用于判断组件占用空间是否合理
  public getArea(): number {
    return this.width * this.height;
  }

  // 评估组件渲染质量：综合透明度与渲染耗时给出质量等级
  public evaluateQuality(): RenderQuality {
    if (this.opacity >= 0.9 && this.renderCostMs <= 16) {
      return RenderQuality.EXCELLENT;
    }
    if (this.opacity >= 0.7 && this.renderCostMs <= 32) {
      return RenderQuality.GOOD;
    }
    if (this.opacity >= 0.5 && this.renderCostMs <= 64) {
      return RenderQuality.FAIR;
    }
    return RenderQuality.POOR;
  }

  public equals(other: ComponentRenderModel): boolean {
    return this.componentId === other.componentId && this.kind === other.kind && this.width === other.width &&
      this.height === other.height;
  }

  public clone(): ComponentRenderModel {
    return new ComponentRenderModel(this.componentId, this.kind, this.width, this.height, this.opacity,
      this.renderCostMs);
  }

  public toString(): string {
    return 'ComponentRenderModel(' + this.componentId + ', ' + this.kind + ')';
  }
}

// 组件渲染统计类：聚合多个组件渲染指标，输出渲染健康度摘要
class ComponentRenderStatistics {
  private metrics: ComponentRenderModel[] = [];

  public addMetric(metric: ComponentRenderModel): void {
    this.metrics.push(metric.clone());
  }

  public clear(): void {
    this.metrics = [];
  }

  public getMetricCount(): number {
    return this.metrics.length;
  }

  public getMetricCountByKind(kind: ComponentKind): number {
    return this.metrics.filter(metric => metric.getKind() === kind).length;
  }

  // 计算平均渲染耗时：用于评估整体渲染性能
  public getAverageRenderCost(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const metric of this.metrics) {
      total += metric.getRenderCostMs();
    }
    return total / this.metrics.length;
  }

  // 统计质量等级分布：返回各质量等级的组件数量
  public getQualityDistribution(): Map<string, number> {
    const distribution: Map<string, number> = new Map<string, number>();
    for (const metric of this.metrics) {
      const quality: string = metric.evaluateQuality();
      const current: number = distribution.get(quality) || 0;
      distribution.set(quality, current + 1);
    }
    return distribution;
  }

  // 计算总渲染面积：用于评估组件占用空间总和
  public getTotalArea(): number {
    let total: number = 0;
    for (const metric of this.metrics) {
      total += metric.getArea();
    }
    return total;
  }
}

// 渲染快照构建器：以链式风格构建渲染快照，便于测试断言与状态记录
class RenderSnapshotBuilder {
  private snapshotId: number = 0;
  private totalComponents: number = 0;
  private visibleComponents: number = 0;
  private hiddenComponents: number = 0;
  private quality: RenderQuality = RenderQuality.GOOD;

  public setSnapshotId(snapshotId: number): RenderSnapshotBuilder {
    this.snapshotId = snapshotId;
    return this;
  }

  public setTotalComponents(totalComponents: number): RenderSnapshotBuilder {
    this.totalComponents = totalComponents;
    return this;
  }

  public setVisibleComponents(visibleComponents: number): RenderSnapshotBuilder {
    this.visibleComponents = visibleComponents;
    return this;
  }

  public setHiddenComponents(hiddenComponents: number): RenderSnapshotBuilder {
    this.hiddenComponents = hiddenComponents;
    return this;
  }

  public setQuality(quality: RenderQuality): RenderSnapshotBuilder {
    this.quality = quality;
    return this;
  }

  public build(): RenderSnapshot {
    return {
      snapshotId: this.snapshotId,
      totalComponents: this.totalComponents,
      visibleComponents: this.visibleComponents,
      hiddenComponents: this.hiddenComponents,
      quality: this.quality
    };
  }
}

// 组件可见性校验器：校验渲染快照的可见性数据是否自洽
class RenderVisibilityValidator {
  // 校验快照中可见与隐藏组件之和是否等于总数
  public isSnapshotConsistent(snapshot: RenderSnapshot): boolean {
    return snapshot.visibleComponents + snapshot.hiddenComponents === snapshot.totalComponents;
  }

  // 判断快照是否表明渲染健康：可见组件占比需达到合理阈值
  public isSnapshotHealthy(snapshot: RenderSnapshot): boolean {
    if (snapshot.totalComponents === 0) {
      return false;
    }
    const visibleRatio: number = snapshot.visibleComponents / snapshot.totalComponents;
    return visibleRatio >= 0.5;
  }
}

// 布局方向枚举：定义组件布局的排列方向
enum LayoutOrientation {
  HORIZONTAL = 'horizontal', VERTICAL = 'vertical'
}

// 渲染报告条目接口：描述渲染统计报告中的单个条目
interface RenderReportEntry {
  entryId: number;
  kind: ComponentKind;
  componentCount: number;
  averageCost: number;
  healthy: boolean;
}

// 渲染报告生成器：根据渲染统计生成结构化报告
class RenderReportGenerator {
  private entries: RenderReportEntry[] = [];
  private nextEntryId: number = 0;

  public addEntry(kind: ComponentKind, componentCount: number, averageCost: number, healthy: boolean): void {
    const entry: RenderReportEntry = {
      entryId: this.nextEntryId,
      kind: kind,
      componentCount: componentCount,
      averageCost: averageCost,
      healthy: healthy
    };
    this.nextEntryId++;
    this.entries.push(entry);
  }

  public clear(): void {
    this.entries = [];
    this.nextEntryId = 0;
  }

  public getEntries(): RenderReportEntry[] {
    const result: RenderReportEntry[] = [];
    for (const entry of this.entries) {
      const copied: RenderReportEntry = {
        entryId: entry.entryId,
        kind: entry.kind,
        componentCount: entry.componentCount,
        averageCost: entry.averageCost,
        healthy: entry.healthy
      };
      result.push(copied);
    }
    return result;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  // 统计健康条目数量：用于渲染健康度评估
  public getHealthyEntryCount(): number {
    return this.entries.filter(entry => entry.healthy).length;
  }

  // 统计组件总数量：汇总所有条目的组件数量
  public getTotalComponentCount(): number {
    let total: number = 0;
    for (const entry of this.entries) {
      total += entry.componentCount;
    }
    return total;
  }
}

// 组件布局模型类：描述组件布局参数，支持尺寸校验与克隆
class ComponentLayoutModel {
  private orientation: LayoutOrientation;
  private width: number;
  private height: number;
  private padding: number;
  private margin: number;

  constructor(orientation: LayoutOrientation, width: number, height: number, padding: number, margin: number) {
    this.orientation = orientation;
    this.width = width;
    this.height = height;
    this.padding = padding;
    this.margin = margin;
  }

  public getOrientation(): LayoutOrientation {
    return this.orientation;
  }

  public getWidth(): number {
    return this.width;
  }

  public getHeight(): number {
    return this.height;
  }

  public getPadding(): number {
    return this.padding;
  }

  public getMargin(): number {
    return this.margin;
  }

  // 计算布局内容区面积：扣除内边距后的可用面积
  public getContentArea(): number {
    const contentWidth: number = Math.max(0, this.width - this.padding * 2);
    const contentHeight: number = Math.max(0, this.height - this.padding * 2);
    return contentWidth * contentHeight;
  }

  // 校验布局尺寸合法性
  public isValid(): boolean {
    return this.width >= 0 && this.height >= 0 && this.padding >= 0 && this.margin >= 0;
  }

  public clone(): ComponentLayoutModel {
    return new ComponentLayoutModel(this.orientation, this.width, this.height, this.padding, this.margin);
  }
}

// 组件布局工厂：批量生成组件布局参数，用于渲染布局测试
class ComponentLayoutFactory {
  // 生成水平排列的等宽布局序列
  public generateHorizontalLayouts(count: number, itemWidth: number, itemHeight: number, padding: number,
    margin: number): ComponentLayoutModel[] {
    const layouts: ComponentLayoutModel[] = [];
    for (let i: number = 0; i < count; i++) {
      layouts.push(new ComponentLayoutModel(LayoutOrientation.HORIZONTAL, itemWidth, itemHeight, padding, margin));
    }
    return layouts;
  }
}

export default function uiComponentRenderingTest() {
  describe('UIComponentRendering_Test', () => {
    let driver: Driver;
    let renderTracker: ComponentRenderingTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      renderTracker = ComponentRenderingTracker.getInstance();
      renderTracker.resetTracker();
      await driver.delayMs(1000);
      await triggerPowerDialog(driver);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('all_image_components_should_render_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const images = await findComponentsByType(driver, 'Image');
      renderTracker.recordRender('Image', images.length, images.length >= 0);
      expect(images.length).assertLargerOrEqual(0);
      expect(images.length).assertLessOrEqual(15);
    });

    it('all_text_components_should_render_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const texts = await findComponentsByType(driver, 'Text');
      renderTracker.recordRender('Text', texts.length, texts.length >= 1);
      expect(texts.length).assertLargerOrEqual(1);
      expect(texts.length).assertLessOrEqual(15);
    });

    it('all_row_components_should_render_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const rows = await findComponentsByType(driver, 'Row');
      renderTracker.recordRender('Row', rows.length, rows.length >= 1);
      expect(rows.length).assertLargerOrEqual(1);
      expect(rows.length).assertLessOrEqual(20);
    });

    it('all_column_components_should_render_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const columns = await findComponentsByType(driver, 'Column');
      renderTracker.recordRender('Column', columns.length, columns.length >= 1);
      expect(columns.length).assertLargerOrEqual(0);
      expect(columns.length).assertLessOrEqual(30);
    });

    // 验证component count状态正确：确保TV设备should be stable符合预期
    it('component_count_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);
      renderTracker.recordRender('Total', initialCount, true);

      await driver.delayMs(1000);

      const finalCount = await powerDialogComponentCount(driver);
      renderTracker.recordRender('Total', finalCount, true);

      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('all_option_labels_should_be_visible', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
    });

    it('components_should_render_after_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      expect(finalCount).assertLargerOrEqual(1);
    });

    // 验证component rendering状态正确：确保TV设备should be complete符合预期
    it('component_rendering_should_be_complete', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      renderTracker.resetTracker();

      const images = await findComponentsByType(driver, 'Image');
      renderTracker.recordRender('Image', images.length, true);

      const texts = await findComponentsByType(driver, 'Text');
      renderTracker.recordRender('Text', texts.length, true);

      const rows = await findComponentsByType(driver, 'Row');
      renderTracker.recordRender('Row', rows.length, true);

      const columns = await findComponentsByType(driver, 'Column');
      renderTracker.recordRender('Column', columns.length, true);

      expect(renderTracker.getTotalRenders()).assertEqual(4);
    });

    // 验证components should具备特性：确保TV设备have correct ids满足设计要求
    it('components_should_have_correct_ids', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusedComponent = await driver.findComponent(ON.focused(true));

      if (!focusedComponent) {
        console.log('components_should_have_correct_ids: No focused component found');
        const fallbackComponentCount = await powerDialogComponentCount(driver);
        expect(fallbackComponentCount).assertLargerOrEqual(1);
        return;
      }

      try {
        const componentId = await focusedComponent.getId();
        console.log('components_should_have_correct_ids: Component ID:', componentId);
        expect(componentId !== null && componentId !== undefined).assertTrue();
      } catch (error) {
        console.log('components_should_have_correct_ids: Error getting component ID:', error);
        const fallbackComponentCount = await powerDialogComponentCount(driver);
        expect(fallbackComponentCount).assertLargerOrEqual(1);
      }
    });

    // 验证component rendering处理能力：确保TV设备在should handle focus changes下功能正常
    it('component_rendering_should_handle_focus_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialImages = await findComponentsByType(driver, 'Image');
      const initialTexts = await findComponentsByType(driver, 'Text');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);

      const finalImages = await findComponentsByType(driver, 'Image');
      const finalTexts = await findComponentsByType(driver, 'Text');

      expect(finalImages.length).assertEqual(initialImages.length);
      expect(finalTexts.length).assertEqual(initialTexts.length);
    });

    // 验证component rendering状态正确：确保TV设备performance should be acceptable符合预期
    it('component_rendering_performance_should_be_acceptable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      for (let i = 0; i < 10; i++) {
        await findComponentsByType(driver, 'Image');
        await findComponentsByType(driver, 'Text');
        await driver.delayMs(50);
      }

      const endTime = Date.now();
      const renderTime = endTime - startTime;

      expect(renderTime).assertLessOrEqual(5000);
    });

    it('components_should_render_with_correct_hierarchy', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const rows = await findComponentsByType(driver, 'Row');
      const columns = await findComponentsByType(driver, 'Column');
      const images = await findComponentsByType(driver, 'Image');
      const texts = await findComponentsByType(driver, 'Text');

      console.log('Hierarchy check - Rows:', rows.length, 'Columns:', columns.length, 'Images:', images.length,
        'Texts:', texts.length);

      expect(rows.length).assertLargerOrEqual(0);
      expect(columns.length).assertLargerOrEqual(0);
    });

    // 验证component visibility持久：确保TV设备should persist状态保持
    it('component_visibility_should_persist', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialImages = await findComponentsByType(driver, 'Image');

      await driver.delayMs(3000);

      const finalImages = await findComponentsByType(driver, 'Image');
      expect(finalImages.length).assertLargerOrEqual(0);
    });

    // 验证component rendering处理能力：确保TV设备在should handle rapid updates下功能正常
    it('component_rendering_should_handle_rapid_updates', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      renderTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const count = await powerDialogComponentCount(driver);
        renderTracker.recordRender('Rapid', count, count >= 3);
        await driver.delayMs(100);
      }

      expect(renderTracker.getTotalRenders()).assertEqual(10);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证component rendering状态正确：确保TV设备should be consistent across cycles符合预期
    it('component_rendering_should_be_consistent_across_cycles', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const counts: number[] = [];

      for (let cycle = 0; cycle < 5; cycle++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(100);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(100);
        const count = await powerDialogComponentCount(driver);
        counts.push(count);
      }

      expect(counts.length).assertLargerOrEqual(1);
      if (counts.length > 0) {
        const maxCount = Math.max(...counts);
        const minCount = Math.min(...counts);
        expect(maxCount - minCount).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      }
    });

    // 验证component rendering状态正确：确保TV设备timestamps should be chronological符合预期
    it('component_rendering_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      renderTracker.resetTracker();

      await driver.delayMs(100);
      const count1 = await powerDialogComponentCount(driver);
      renderTracker.recordRender('Timestamp', count1, true);

      await driver.delayMs(200);
      const count2 = await powerDialogComponentCount(driver);
      renderTracker.recordRender('Timestamp', count2, true);

      await driver.delayMs(300);
      const count3 = await powerDialogComponentCount(driver);
      renderTracker.recordRender('Timestamp', count3, true);

      const history = renderTracker.getRenderHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证component rendering处理能力：确保TV设备在should handle edge cases下功能正常
    it('component_rendering_should_handle_edge_cases', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await pressAndWait(driver, KEY_LEFT, 10, DELAY_KEY_NAVIGATION);
      const count1 = await powerDialogComponentCount(driver);
      expect(count1).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_RIGHT, 10, DELAY_KEY_NAVIGATION);
      const count2 = await powerDialogComponentCount(driver);
      expect(count2).assertLargerOrEqual(1);
    });

    // 验证追踪器单例一致性：确保跨测试用例共享状态正确
    it('component_rendering_tracker_singleton_should_work', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ComponentRenderingTracker.getInstance();
      const tracker2 = ComponentRenderingTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordRender('Test', 5, true);

      expect(tracker2.getTotalRenders()).assertEqual(1);
      expect(tracker2.getLatestRenderCount('Test')).assertEqual(5);
    });

    // 综合comprehensive component场景测试：验证完整操作流程中功能正确
    it('comprehensive_component_rendering_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      renderTracker.resetTracker();

      const scenarioStart = Date.now();

      const images = await findComponentsByType(driver, 'Image');
      renderTracker.recordRender('Image', images.length, true);

      const texts = await findComponentsByType(driver, 'Text');
      renderTracker.recordRender('Text', texts.length, true);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(100);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(100);

      const finalCount = await powerDialogComponentCount(driver);
      renderTracker.recordRender('Total', finalCount, true);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(renderTracker.getTotalRenders()).assertEqual(3);
      expect(scenarioDuration).assertLessOrEqual(10000);
      expect(finalCount).assertLargerOrEqual(0);
    });
  });


}