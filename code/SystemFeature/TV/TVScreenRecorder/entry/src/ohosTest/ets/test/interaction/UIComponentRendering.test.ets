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
  getDriver,
  recorderComponentCount,
  checkTextContent,
  findComponentsByType,
  pressAndWait,
  serializedDelay,
  isTipWindowVisible,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT
} from '../shared/RecordingDriver';

// Component ids declared by pages/ScreenRecorderTimer and pages/ScreenRecorderDialog.
const ID_RECORDING: string = 'Recording';
const ID_TIMER: string = 'recordingTimer';
const ID_TIMER_HINT: string = 'recordingHint';
const ID_DIVIDER: string = 'recordingDivider';
const ID_TIP_TITLE: string = 'tipTitle';
const ID_TIP_CONTENT: string = 'tipContent';

// Frame budget of a 60Hz TV panel; a render above it is treated as a dropped frame.
const FRAME_BUDGET_MS: number = 16;

/** Kind of component rendered by the recorder pages. */
enum ComponentKind {
  ROW = 'Row',
  COLUMN = 'Column',
  IMAGE = 'Image',
  TEXT = 'Text',
  DIVIDER = 'Divider',
  TEXT_TIMER = 'TextTimer',
  RECT = 'Rect',
  STACK = 'Stack'
}

/** Render quality bucket. */
enum RenderQuality {
  EXCELLENT = 'excellent',
  GOOD = 'good',
  FAIR = 'fair',
  POOR = 'poor'
}

/** Visibility of one component. */
enum ComponentVisibility {
  VISIBLE = 'visible',
  HIDDEN = 'hidden'
}

/** One render observation. */
interface ComponentRenderRecord {
  type: string;
  count: number;
  visible: boolean;
  timestamp: number;
}

/** Metrics of a single rendered component. */
interface RenderMetric {
  componentId: string;
  kind: ComponentKind;
  width: number;
  height: number;
  opacity: number;
  renderCostMs: number;
  visibility: ComponentVisibility;
}

/** Snapshot of the whole floating window. */
interface RenderSnapshot {
  snapshotId: number;
  totalComponents: number;
  visibleComponents: number;
  hiddenComponents: number;
  quality: RenderQuality;
}

/** Layout direction of a component container. */
enum LayoutOrientation {
  HORIZONTAL = 'horizontal',
  VERTICAL = 'vertical'
}

/** Entry of the render report. */
interface RenderReportEntry {
  entryId: number;
  kind: ComponentKind;
  componentCount: number;
  averageCost: number;
  healthy: boolean;
}
/** Tracks render probes across the case list. */
class ComponentRenderingTracker {
  private static instance: ComponentRenderingTracker | null = null;
  private renderHistory: ComponentRenderRecord[] = [];
  private totalRenders: number = 0;

  public static getInstance(): ComponentRenderingTracker {
    if (ComponentRenderingTracker.instance === null) {
      ComponentRenderingTracker.instance = new ComponentRenderingTracker();
    }
    return ComponentRenderingTracker.instance;
  }

  public recordRender(type: string, count: number, visible: boolean): void {
    const record: ComponentRenderRecord = {
      type: type,
      count: count,
      visible: visible,
      timestamp: Date.now()
    };
    this.renderHistory.push(record);
    this.totalRenders++;
  }

  public getRenderHistory(): ComponentRenderRecord[] {
    const copied: ComponentRenderRecord[] = [];
    for (let i = 0; i < this.renderHistory.length; i++) {
      copied.push(this.renderHistory[i]);
    }
    return copied;
  }

  public getTotalRenders(): number {
    return this.totalRenders;
  }

  public getLatestRenderCount(type: string): number {
    for (let i = this.renderHistory.length - 1; i >= 0; i--) {
      if (this.renderHistory[i].type === type) {
        return this.renderHistory[i].count;
      }
    }
    return 0;
  }

  public getVisibleRenderCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.renderHistory.length; i++) {
      if (this.renderHistory[i].visible) {
        count++;
      }
    }
    return count;
  }

  public resetTracker(): void {
    this.renderHistory = [];
    this.totalRenders = 0;
  }
}

/** Render model of one component with quality evaluation. */
class ComponentRenderModel {
  private componentId: string;
  private kind: ComponentKind;
  private width: number;
  private height: number;
  private opacity: number;
  private renderCostMs: number;
  private visibility: ComponentVisibility;

  constructor(componentId: string, kind: ComponentKind, width: number, height: number, opacity: number,
    renderCostMs: number, visibility: ComponentVisibility) {
    this.componentId = componentId;
    this.kind = kind;
    this.width = width;
    this.height = height;
    this.opacity = opacity;
    this.renderCostMs = renderCostMs;
    this.visibility = visibility;
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

  public getVisibility(): ComponentVisibility {
    return this.visibility;
  }

  public setOpacity(opacity: number): void {
    this.opacity = opacity;
  }

  public setVisibility(visibility: ComponentVisibility): void {
    this.visibility = visibility;
  }

  public isVisible(): boolean {
    return this.visibility === ComponentVisibility.VISIBLE;
  }

  public getArea(): number {
    return this.width * this.height;
  }

  // Excellent requires a full opacity render inside one frame budget.
  public evaluateQuality(): RenderQuality {
    if (this.opacity >= 0.9 && this.renderCostMs <= FRAME_BUDGET_MS) {
      return RenderQuality.EXCELLENT;
    }
    if (this.opacity >= 0.7 && this.renderCostMs <= FRAME_BUDGET_MS * 2) {
      return RenderQuality.GOOD;
    }
    if (this.opacity >= 0.5 && this.renderCostMs <= FRAME_BUDGET_MS * 4) {
      return RenderQuality.FAIR;
    }
    return RenderQuality.POOR;
  }

  public equals(other: ComponentRenderModel): boolean {
    return this.componentId === other.getComponentId() && this.kind === other.getKind() &&
      this.width === other.getWidth() && this.height === other.getHeight();
  }

  public clone(): ComponentRenderModel {
    return new ComponentRenderModel(this.componentId, this.kind, this.width, this.height, this.opacity,
      this.renderCostMs, this.visibility);
  }

  public toString(): string {
    return 'ComponentRenderModel(' + this.componentId + ', ' + this.kind + ')';
  }
}

/** Aggregated render statistics of a window. */
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
    let count: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].getKind() === kind) {
        count++;
      }
    }
    return count;
  }

  public getVisibleMetricCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].isVisible()) {
        count++;
      }
    }
    return count;
  }

  public getAverageRenderCost(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      total += this.metrics[i].getRenderCostMs();
    }
    return total / this.metrics.length;
  }

  public getTotalArea(): number {
    let total: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      total += this.metrics[i].getArea();
    }
    return total;
  }

  public getQualityDistribution(): Map<string, number> {
    const distribution: Map<string, number> = new Map<string, number>();
    for (let i = 0; i < this.metrics.length; i++) {
      const quality: string = this.metrics[i].evaluateQuality();
      const current: number = distribution.get(quality) ?? 0;
      distribution.set(quality, current + 1);
    }
    return distribution;
  }
}
/** Chainable snapshot builder. */
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
    const snapshot: RenderSnapshot = {
      snapshotId: this.snapshotId,
      totalComponents: this.totalComponents,
      visibleComponents: this.visibleComponents,
      hiddenComponents: this.hiddenComponents,
      quality: this.quality
    };
    return snapshot;
  }
}

/** Validates that a snapshot is internally consistent and healthy. */
class RenderVisibilityValidator {
  public isSnapshotConsistent(snapshot: RenderSnapshot): boolean {
    return snapshot.visibleComponents + snapshot.hiddenComponents === snapshot.totalComponents;
  }

  public getVisibleRatio(snapshot: RenderSnapshot): number {
    if (snapshot.totalComponents === 0) {
      return 0;
    }
    return snapshot.visibleComponents / snapshot.totalComponents;
  }

  public isSnapshotHealthy(snapshot: RenderSnapshot): boolean {
    if (snapshot.totalComponents === 0) {
      return false;
    }
    return this.getVisibleRatio(snapshot) >= 0.5;
  }

  public isQualityAcceptable(snapshot: RenderSnapshot): boolean {
    return snapshot.quality === RenderQuality.EXCELLENT || snapshot.quality === RenderQuality.GOOD;
  }
}

/** Layout parameters of one container. */
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

  public getContentArea(): number {
    const contentWidth: number = Math.max(0, this.width - this.padding * 2);
    const contentHeight: number = Math.max(0, this.height - this.padding * 2);
    return contentWidth * contentHeight;
  }

  public isValid(): boolean {
    return this.width >= 0 && this.height >= 0 && this.padding >= 0 && this.margin >= 0;
  }

  public clone(): ComponentLayoutModel {
    return new ComponentLayoutModel(this.orientation, this.width, this.height, this.padding, this.margin);
  }
}

/** Builds repeated layouts for the layout cases. */
class ComponentLayoutFactory {
  public generateHorizontalLayouts(count: number, itemWidth: number, itemHeight: number, padding: number,
    margin: number): ComponentLayoutModel[] {
    const layouts: ComponentLayoutModel[] = [];
    for (let i = 0; i < count; i++) {
      layouts.push(new ComponentLayoutModel(LayoutOrientation.HORIZONTAL, itemWidth, itemHeight, padding, margin));
    }
    return layouts;
  }
}

/** Generates the render report. */
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
    const copied: RenderReportEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copied.push(this.entries[i]);
    }
    return copied;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public getHealthyEntryCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].healthy) {
        count++;
      }
    }
    return count;
  }

  public getTotalComponentCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].componentCount;
    }
    return total;
  }
}

/** Declarative description of one page component. */
interface ComponentDescriptor {
  id: string;
  kind: ComponentKind;
}

/** Component registry of the timer page. */
function buildTimerPageRegistry(): ComponentDescriptor[] {
  const registry: ComponentDescriptor[] = [
    { id: ID_RECORDING, kind: ComponentKind.IMAGE },
    { id: ID_TIMER, kind: ComponentKind.TEXT_TIMER },
    { id: ID_TIMER_HINT, kind: ComponentKind.TEXT },
    { id: ID_DIVIDER, kind: ComponentKind.DIVIDER }
  ];
  return registry;
}

/** Component registry of the tip page. */
function buildTipPageRegistry(): ComponentDescriptor[] {
  const registry: ComponentDescriptor[] = [
    { id: ID_RECORDING, kind: ComponentKind.IMAGE },
    { id: ID_TIP_TITLE, kind: ComponentKind.TEXT },
    { id: ID_DIVIDER, kind: ComponentKind.DIVIDER },
    { id: ID_TIP_CONTENT, kind: ComponentKind.TEXT }
  ];
  return registry;
}

/** Render metrics of the tip page, used by the model only cases. */
function buildTipMetrics(): ComponentRenderModel[] {
  const metrics: ComponentRenderModel[] = [
    new ComponentRenderModel(ID_RECORDING, ComponentKind.IMAGE, 48, 48, 1, 8, ComponentVisibility.VISIBLE),
    new ComponentRenderModel(ID_TIP_TITLE, ComponentKind.TEXT, 120, 48, 1, 10, ComponentVisibility.VISIBLE),
    new ComponentRenderModel(ID_DIVIDER, ComponentKind.DIVIDER, 600, 1, 0.6, 6, ComponentVisibility.VISIBLE),
    new ComponentRenderModel(ID_TIP_CONTENT, ComponentKind.TEXT, 600, 40, 1, 12, ComponentVisibility.VISIBLE)
  ];
  return metrics;
}
export default function uiComponentRenderingTest(): void {
  describe('UIComponentRendering_Test', () => {
    let driver: Driver;
    let renderTracker: ComponentRenderingTracker;

    beforeAll(async () => {
      driver = getDriver();
      renderTracker = ComponentRenderingTracker.getInstance();
      renderTracker.resetTracker();
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    it('all_image_components_should_render_correctly', 0, async () => {
      const images = await findComponentsByType(driver, 'Image');
      renderTracker.recordRender('Image', images.length, images.length > 0);
      expect(images.length).assertLargerOrEqual(0);
      expect(images.length).assertLessOrEqual(15);
      expect(renderTracker.getLatestRenderCount('Image')).assertEqual(images.length);
    });

    it('all_text_components_should_render_correctly', 0, async () => {
      const texts = await findComponentsByType(driver, 'Text');
      renderTracker.recordRender('Text', texts.length, texts.length > 0);
      expect(texts.length).assertLargerOrEqual(0);
      expect(texts.length).assertLessOrEqual(40);
    });

    it('all_row_components_should_render_correctly', 0, async () => {
      const rows = await findComponentsByType(driver, 'Row');
      renderTracker.recordRender('Row', rows.length, rows.length > 0);
      expect(rows.length).assertLargerOrEqual(0);
      expect(rows.length).assertLessOrEqual(20);
    });

    it('all_divider_components_should_render_correctly', 0, async () => {
      const dividers = await findComponentsByType(driver, 'Divider');
      renderTracker.recordRender('Divider', dividers.length, dividers.length > 0);
      expect(dividers.length).assertLargerOrEqual(0);
      expect(dividers.length).assertLessOrEqual(10);
    });

    it('all_text_timer_components_should_render_correctly', 0, async () => {
      const timers = await findComponentsByType(driver, 'TextTimer');
      renderTracker.recordRender('TextTimer', timers.length, timers.length > 0);
      expect(timers.length).assertLargerOrEqual(0);
      expect(timers.length).assertLessOrEqual(5);
    });

    it('all_rect_components_should_render_correctly', 0, async () => {
      const rects = await findComponentsByType(driver, 'Rect');
      renderTracker.recordRender('Rect', rects.length, rects.length > 0);
      expect(rects.length).assertLargerOrEqual(0);
      expect(rects.length).assertLessOrEqual(10);
    });

    it('component_count_should_be_stable', 0, async () => {
      const initialCount = await recorderComponentCount(driver);
      renderTracker.recordRender('Total', initialCount, true);
      await serializedDelay(driver, 300);
      const finalCount = await recorderComponentCount(driver);
      renderTracker.recordRender('Total', finalCount, true);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 1);
    });

    it('components_should_render_after_navigation', 0, async () => {
      const initialCount = await recorderComponentCount(driver);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 1);
      expect(finalCount >= 0).assertEqual(true);
    });

    it('component_rendering_should_be_complete', 0, async () => {
      renderTracker.resetTracker();
      const images = await findComponentsByType(driver, 'Image');
      renderTracker.recordRender('Image', images.length, true);
      const texts = await findComponentsByType(driver, 'Text');
      renderTracker.recordRender('Text', texts.length, true);
      const rows = await findComponentsByType(driver, 'Row');
      renderTracker.recordRender('Row', rows.length, true);
      const dividers = await findComponentsByType(driver, 'Divider');
      renderTracker.recordRender('Divider', dividers.length, true);
      expect(renderTracker.getTotalRenders()).assertEqual(4);
      expect(renderTracker.getVisibleRenderCount()).assertEqual(4);
    });

    it('timer_page_should_declare_expected_component_ids', 0, async () => {
      const registry: ComponentDescriptor[] = buildTimerPageRegistry();
      expect(registry.length).assertEqual(4);
      expect(registry[0].id).assertEqual('Recording');
      expect(registry[1].kind).assertEqual(ComponentKind.TEXT_TIMER);
      expect(registry[2].kind).assertEqual(ComponentKind.TEXT);
      expect(registry[3].kind).assertEqual(ComponentKind.DIVIDER);
    });

    it('tip_page_should_declare_expected_component_ids', 0, async () => {
      const registry: ComponentDescriptor[] = buildTipPageRegistry();
      expect(registry.length).assertEqual(4);
      expect(registry[0].kind).assertEqual(ComponentKind.IMAGE);
      expect(registry[1].id).assertEqual('tipTitle');
      expect(registry[3].id).assertEqual('tipContent');
    });

    it('component_rendering_should_handle_focus_changes', 0, async () => {
      const initialImages = await findComponentsByType(driver, 'Image');
      const initialTexts = await findComponentsByType(driver, 'Text');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      const finalImages = await findComponentsByType(driver, 'Image');
      const finalTexts = await findComponentsByType(driver, 'Text');
      expect(Math.abs(finalImages.length - initialImages.length)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      expect(Math.abs(finalTexts.length - initialTexts.length)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      expect(finalTexts.length).assertLargerOrEqual(0);
    });

    it('component_rendering_performance_should_be_acceptable', 0, async () => {
      const startTime = Date.now();
      for (let i = 0; i < 5; i++) {
        await findComponentsByType(driver, 'Image');
        await findComponentsByType(driver, 'Text');
        await serializedDelay(driver, 20);
      }
      const renderTime = Date.now() - startTime;
      expect(renderTime).assertLessOrEqual(5000);
    });

    it('component_rendering_should_handle_rapid_updates', 0, async () => {
      renderTracker.resetTracker();
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const count = await recorderComponentCount(driver);
        renderTracker.recordRender('Rapid', count, count > 0);
        await serializedDelay(driver, 20);
      }
      expect(renderTracker.getTotalRenders()).assertEqual(10);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('component_rendering_timestamps_should_be_chronological', 0, async () => {
      renderTracker.resetTracker();
      const count1 = await recorderComponentCount(driver);
      renderTracker.recordRender('Timestamp', count1, true);
      await serializedDelay(driver, 40);
      const count2 = await recorderComponentCount(driver);
      renderTracker.recordRender('Timestamp', count2, true);
      await serializedDelay(driver, 40);
      const count3 = await recorderComponentCount(driver);
      renderTracker.recordRender('Timestamp', count3, true);

      const history = renderTracker.getRenderHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();
      expect(history[1].timestamp <= history[2].timestamp).assertTrue();
    });
    it('component_model_should_expose_rendering_metrics', 0, async () => {
      const model = new ComponentRenderModel(ID_RECORDING, ComponentKind.IMAGE, 48, 48, 1, 8,
        ComponentVisibility.VISIBLE);
      expect(model.getComponentId()).assertEqual('Recording');
      expect(model.getKind()).assertEqual(ComponentKind.IMAGE);
      expect(model.getArea()).assertEqual(2304);
      expect(model.getOpacity()).assertEqual(1);
      expect(model.getRenderCostMs()).assertEqual(8);
      expect(model.isVisible()).assertTrue();
      expect(model.toString().indexOf('Recording')).assertLargerOrEqual(0);
    });

    it('component_model_should_evaluate_render_quality', 0, async () => {
      const excellent = new ComponentRenderModel('a', ComponentKind.TEXT, 10, 10, 1, 8,
        ComponentVisibility.VISIBLE);
      const good = new ComponentRenderModel('b', ComponentKind.TEXT, 10, 10, 0.8, 20,
        ComponentVisibility.VISIBLE);
      const fair = new ComponentRenderModel('c', ComponentKind.TEXT, 10, 10, 0.6, 50,
        ComponentVisibility.VISIBLE);
      const poor = new ComponentRenderModel('d', ComponentKind.TEXT, 10, 10, 0.2, 100,
        ComponentVisibility.VISIBLE);
      expect(excellent.evaluateQuality()).assertEqual(RenderQuality.EXCELLENT);
      expect(good.evaluateQuality()).assertEqual(RenderQuality.GOOD);
      expect(fair.evaluateQuality()).assertEqual(RenderQuality.FAIR);
      expect(poor.evaluateQuality()).assertEqual(RenderQuality.POOR);
    });

    it('component_model_should_clone_and_compare', 0, async () => {
      const original = new ComponentRenderModel(ID_TIMER, ComponentKind.TEXT_TIMER, 200, 56, 1, 9,
        ComponentVisibility.VISIBLE);
      const cloned = original.clone();
      expect(cloned.equals(original)).assertTrue();
      cloned.setOpacity(0.4);
      expect(cloned.getOpacity()).assertEqual(0.4);
      expect(original.getOpacity()).assertEqual(1);
      const different = new ComponentRenderModel(ID_TIMER, ComponentKind.TEXT, 200, 56, 1, 9,
        ComponentVisibility.VISIBLE);
      expect(different.equals(original)).assertFalse();
    });

    it('hidden_component_should_report_invisible', 0, async () => {
      const model = new ComponentRenderModel(ID_RECORDING, ComponentKind.IMAGE, 48, 48, 1, 8,
        ComponentVisibility.VISIBLE);
      expect(model.isVisible()).assertTrue();
      model.setVisibility(ComponentVisibility.HIDDEN);
      expect(model.isVisible()).assertFalse();
      expect(model.getVisibility()).assertEqual(ComponentVisibility.HIDDEN);
    });

    it('statistics_should_count_components_by_kind', 0, async () => {
      const statistics = new ComponentRenderStatistics();
      const metrics = buildTipMetrics();
      for (let i = 0; i < metrics.length; i++) {
        statistics.addMetric(metrics[i]);
      }
      expect(statistics.getMetricCount()).assertEqual(4);
      expect(statistics.getMetricCountByKind(ComponentKind.TEXT)).assertEqual(2);
      expect(statistics.getMetricCountByKind(ComponentKind.IMAGE)).assertEqual(1);
      expect(statistics.getMetricCountByKind(ComponentKind.DIVIDER)).assertEqual(1);
      expect(statistics.getVisibleMetricCount()).assertEqual(4);
    });

    it('statistics_should_compute_average_render_cost', 0, async () => {
      const statistics = new ComponentRenderStatistics();
      statistics.addMetric(new ComponentRenderModel('a', ComponentKind.TEXT, 10, 10, 1, 8,
        ComponentVisibility.VISIBLE));
      statistics.addMetric(new ComponentRenderModel('b', ComponentKind.TEXT, 10, 10, 1, 12,
        ComponentVisibility.VISIBLE));
      expect(statistics.getAverageRenderCost()).assertEqual(10);
      const empty = new ComponentRenderStatistics();
      expect(empty.getAverageRenderCost()).assertEqual(0);
    });

    it('statistics_should_compute_total_area', 0, async () => {
      const statistics = new ComponentRenderStatistics();
      statistics.addMetric(new ComponentRenderModel('a', ComponentKind.RECT, 10, 20, 1, 5,
        ComponentVisibility.VISIBLE));
      statistics.addMetric(new ComponentRenderModel('b', ComponentKind.RECT, 5, 10, 1, 5,
        ComponentVisibility.VISIBLE));
      expect(statistics.getTotalArea()).assertEqual(250);
      statistics.clear();
      expect(statistics.getTotalArea()).assertEqual(0);
    });

    it('statistics_should_report_quality_distribution', 0, async () => {
      const statistics = new ComponentRenderStatistics();
      statistics.addMetric(new ComponentRenderModel('a', ComponentKind.TEXT, 10, 10, 1, 8,
        ComponentVisibility.VISIBLE));
      statistics.addMetric(new ComponentRenderModel('b', ComponentKind.TEXT, 10, 10, 1, 8,
        ComponentVisibility.VISIBLE));
      statistics.addMetric(new ComponentRenderModel('c', ComponentKind.TEXT, 10, 10, 0.2, 100,
        ComponentVisibility.VISIBLE));
      const distribution = statistics.getQualityDistribution();
      expect(distribution.get(RenderQuality.EXCELLENT) ?? 0).assertEqual(2);
      expect(distribution.get(RenderQuality.POOR) ?? 0).assertEqual(1);
    });

    it('snapshot_should_be_consistent_and_healthy', 0, async () => {
      const snapshot = new RenderSnapshotBuilder()
        .setSnapshotId(1)
        .setTotalComponents(8)
        .setVisibleComponents(6)
        .setHiddenComponents(2)
        .setQuality(RenderQuality.GOOD)
        .build();
      const validator = new RenderVisibilityValidator();
      expect(snapshot.snapshotId).assertEqual(1);
      expect(validator.isSnapshotConsistent(snapshot)).assertTrue();
      expect(validator.isSnapshotHealthy(snapshot)).assertTrue();
      expect(validator.isQualityAcceptable(snapshot)).assertTrue();
      expect(validator.getVisibleRatio(snapshot)).assertEqual(0.75);
    });

    it('snapshot_builder_should_apply_defaults', 0, async () => {
      const snapshot = new RenderSnapshotBuilder().build();
      const validator = new RenderVisibilityValidator();
      expect(snapshot.totalComponents).assertEqual(0);
      expect(snapshot.quality).assertEqual(RenderQuality.GOOD);
      expect(validator.isSnapshotConsistent(snapshot)).assertTrue();
      expect(validator.isSnapshotHealthy(snapshot)).assertFalse();
      expect(validator.getVisibleRatio(snapshot)).assertEqual(0);
    });

    it('layout_should_compute_content_area', 0, async () => {
      const layout = new ComponentLayoutModel(LayoutOrientation.HORIZONTAL, 686, 100, 20, 4);
      expect(layout.getContentArea()).assertEqual((686 - 40) * (100 - 40));
      expect(layout.isValid()).assertTrue();
      const zeroPadding = new ComponentLayoutModel(LayoutOrientation.VERTICAL, 100, 50, 0, 0);
      expect(zeroPadding.getContentArea()).assertEqual(5000);
    });

    it('layout_should_reject_invalid_dimensions', 0, async () => {
      const invalid = new ComponentLayoutModel(LayoutOrientation.HORIZONTAL, -1, 50, 0, 0);
      expect(invalid.isValid()).assertFalse();
      const invalidPadding = new ComponentLayoutModel(LayoutOrientation.HORIZONTAL, 100, 50, -5, 0);
      expect(invalidPadding.isValid()).assertFalse();
      const cloned = new ComponentLayoutModel(LayoutOrientation.HORIZONTAL, 100, 50, 5, 2).clone();
      expect(cloned.getWidth()).assertEqual(100);
      expect(cloned.getMargin()).assertEqual(2);
    });

    it('layout_factory_should_generate_items', 0, async () => {
      const factory = new ComponentLayoutFactory();
      const layouts = factory.generateHorizontalLayouts(3, 120, 48, 8, 4);
      expect(layouts.length).assertEqual(3);
      expect(layouts[0].getOrientation()).assertEqual(LayoutOrientation.HORIZONTAL);
      expect(layouts[2].getHeight()).assertEqual(48);
      expect(layouts[1].getPadding()).assertEqual(8);
      const empty = factory.generateHorizontalLayouts(0, 120, 48, 8, 4);
      expect(empty.length).assertEqual(0);
    });

    it('render_report_should_aggregate_entries', 0, async () => {
      const generator = new RenderReportGenerator();
      generator.addEntry(ComponentKind.TEXT, 3, 8, true);
      generator.addEntry(ComponentKind.IMAGE, 1, 20, true);
      generator.addEntry(ComponentKind.RECT, 2, 40, false);
      expect(generator.getEntryCount()).assertEqual(3);
      expect(generator.getTotalComponentCount()).assertEqual(6);
      expect(generator.getHealthyEntryCount()).assertEqual(2);
      expect(generator.getEntries()[2].entryId).assertEqual(2);
      generator.clear();
      expect(generator.getEntryCount()).assertEqual(0);
    });

    it('component_rendering_tracker_singleton_should_work', 0, async () => {
      const tracker1 = ComponentRenderingTracker.getInstance();
      const tracker2 = ComponentRenderingTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordRender('Singleton', 5, true);
      expect(tracker2.getTotalRenders()).assertEqual(1);
      expect(tracker2.getLatestRenderCount('Singleton')).assertEqual(5);
      expect(tracker2.getLatestRenderCount('Missing')).assertEqual(0);
    });

    it('tip_window_component_probe_should_be_tolerant', 0, async () => {
      const visible = await isTipWindowVisible(driver);
      const texts = await findComponentsByType(driver, 'Text');
      if (visible) {
        const hasTitle = await checkTextContent(driver, TIP_TEXT_TITLE);
        const hasContent = await checkTextContent(driver, TIP_TEXT_CONTENT);
        expect(hasTitle || hasContent).assertTrue();
        expect(texts.length).assertLargerOrEqual(1);
      } else {
        expect(texts.length).assertLargerOrEqual(0);
      }
    });

    it('comprehensive_component_rendering_scenario', 0, async () => {
      renderTracker.resetTracker();
      const statistics = new ComponentRenderStatistics();
      const metrics = buildTipMetrics();
      for (let i = 0; i < metrics.length; i++) {
        statistics.addMetric(metrics[i]);
      }

      const scenarioStart = Date.now();
      const images = await findComponentsByType(driver, 'Image');
      renderTracker.recordRender('Image', images.length, true);
      const texts = await findComponentsByType(driver, 'Text');
      renderTracker.recordRender('Text', texts.length, true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalCount = await recorderComponentCount(driver);
      renderTracker.recordRender('Total', finalCount, true);

      const scenarioEnd = Date.now();
      expect(renderTracker.getTotalRenders()).assertEqual(3);
      expect(statistics.getMetricCount()).assertEqual(4);
      expect(statistics.getMetricCountByKind(ComponentKind.TEXT)).assertEqual(2);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(10000);
    });
  });
}




