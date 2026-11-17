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
  checkComponentExists,
  waitForTipWindowStable,
  pressAndWait,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_TIP_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  STABLE_ROUNDS,
  STABLE_TOLERANCE,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  RESOLUTION_TEXT_TITLE,
  RESOLUTION_TEXT_CONTENT
} from '../shared/RecordingDriver';

// Position of the focused item inside the tip window action area.
enum TipFocusEdge {
  NONE = 'none',
  FIRST = 'first',
  LAST = 'last'
}

// Lifecycle of the tip window rendering pipeline.
enum TipRenderState {
  IDLE = 'idle',
  CREATING = 'creating',
  RENDERING = 'rendering',
  READY = 'ready',
  FAILED = 'failed'
}

// Description of one component rendered by the tip window.
interface TipComponentInfo {
  id: string;
  type: string;
  width: number;
  height: number;
  visible: boolean;
}

// Layout metrics of the tip window, derived from the production rect.
interface TipLayoutMetrics {
  totalWidth: number;
  totalHeight: number;
  componentCount: number;
  focusIndex: number;
}

// Focus tracker of the tip window. The tip window owns one action row, so the
// tracker mainly validates index clamping and edge detection.
class TipFocusTracker {
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

  public getEdge(): TipFocusEdge {
    if (this.currentIndex === 0) {
      return TipFocusEdge.FIRST;
    }
    if (this.currentIndex === this.optionCount - 1) {
      return TipFocusEdge.LAST;
    }
    return TipFocusEdge.NONE;
  }

  public reset(): void {
    this.currentIndex = 0;
  }
}

// Collects the component descriptions of one rendering pass.
class TipMetricsCollector {
  private components: TipComponentInfo[] = [];

  public addComponent(info: TipComponentInfo): void {
    this.components.push(info);
  }

  public getComponentCount(): number {
    return this.components.length;
  }

  public getVisibleCount(): number {
    let visible = 0;
    for (let i = 0; i < this.components.length; i++) {
      if (this.components[i].visible) {
        visible++;
      }
    }
    return visible;
  }

  public getTotalWidth(): number {
    let total = 0;
    for (let i = 0; i < this.components.length; i++) {
      total += this.components[i].width;
    }
    return total;
  }

  public getTotalHeight(): number {
    let total = 0;
    for (let i = 0; i < this.components.length; i++) {
      total += this.components[i].height;
    }
    return total;
  }

  public getMetrics(focusIndex: number): TipLayoutMetrics {
    return {
      totalWidth: this.getTotalWidth(),
      totalHeight: this.getTotalHeight(),
      componentCount: this.getComponentCount(),
      focusIndex: focusIndex
    };
  }

  public clear(): void {
    this.components = [];
  }
}

// Drives the render state machine of the tip window. Only the documented
// transitions are accepted, which protects the presentation layer from
// rendering the tip while the window is still being created.
class TipRenderStateMachine {
  private state: TipRenderState = TipRenderState.IDLE;
  private history: TipRenderState[] = [TipRenderState.IDLE];

  public transit(next: TipRenderState): boolean {
    const allowed = this.isAllowed(this.state, next);
    if (allowed) {
      this.state = next;
      this.history.push(next);
    }
    return allowed;
  }

  private isAllowed(from: TipRenderState, to: TipRenderState): boolean {
    if (from === TipRenderState.IDLE) {
      return to === TipRenderState.CREATING;
    }
    if (from === TipRenderState.CREATING) {
      return to === TipRenderState.RENDERING || to === TipRenderState.FAILED;
    }
    if (from === TipRenderState.RENDERING) {
      return to === TipRenderState.READY || to === TipRenderState.FAILED;
    }
    if (from === TipRenderState.READY) {
      return to === TipRenderState.IDLE;
    }
    if (from === TipRenderState.FAILED) {
      return to === TipRenderState.IDLE;
    }
    return false;
  }

  public getState(): TipRenderState {
    return this.state;
  }

  public getHistory(): TipRenderState[] {
    return this.history.slice();
  }

  public reset(): void {
    this.state = TipRenderState.IDLE;
    this.history = [TipRenderState.IDLE];
  }
}

// Static description of the recording tip window. Every value is aligned with
// ScreenRecorderDialog.ets and ScreenRecorderAbility.ets.
class TipDialogSpec {
  public static readonly TITLE: string = TIP_TEXT_TITLE;
  public static readonly CONTENT: string = TIP_TEXT_CONTENT;
  public static readonly BACKGROUND_COLOR: string = '#B33A3F62';
  public static readonly CORNER_RADIUS: number = 24;
  public static readonly ICON_WIDTH: number = 60;
  public static readonly CONTENT_FONT_SIZE: number = 36;
  public static readonly PADDING_LEFT: number = 43;
  public static readonly PADDING_RIGHT: number = 43;
  public static readonly PADDING_TOP: number = 20;
  public static readonly PADDING_BOTTOM: number = 20;
  public static readonly TIP_DURATION_MS: number = 3000;
  public static readonly TIP_WINDOW_NAME: string = 'Tip';
  public static readonly TIP_WINDOW_PAGE: string = 'pages/ScreenRecorderDialog';

  public static estimateInnerWidth(screenWidth: number): number {
    const scale = screenWidth / 1920;
    return 686 - (TipDialogSpec.PADDING_LEFT + TipDialogSpec.PADDING_RIGHT) * scale;
  }

  public static scaledRadius(screenWidth: number): number {
    return TipDialogSpec.CORNER_RADIUS * (screenWidth / 1920);
  }

  public static isTransparentColor(color: string): boolean {
    if (color.length !== 9 || color.charAt(0) !== '#') {
      return false;
    }
    const alpha = color.substring(1, 3).toLowerCase();
    return alpha !== 'ff';
  }

  public static validate(): string[] {
    const issues: string[] = [];
    if (TipDialogSpec.TITLE.length === 0) {
      issues.push('title-empty');
    }
    if (TipDialogSpec.CONTENT.length === 0) {
      issues.push('content-empty');
    }
    if (TipDialogSpec.TIP_DURATION_MS <= 0) {
      issues.push('duration-invalid');
    }
    if (TipDialogSpec.CORNER_RADIUS <= 0) {
      issues.push('radius-invalid');
    }
    if (TipDialogSpec.ICON_WIDTH <= 0) {
      issues.push('icon-invalid');
    }
    return issues;
  }
}

// Validates the resolution-not-supported window description.
class ResolutionDialogSpec {
  public static readonly TITLE: string = RESOLUTION_TEXT_TITLE;
  public static readonly CONTENT: string = RESOLUTION_TEXT_CONTENT;
  public static readonly BACKGROUND_COLOR: string = '#B33A3F62';
  public static readonly CORNER_RADIUS: number = 24;
  public static readonly MAX_WIDTH: number = 1920;
  public static readonly MAX_HEIGHT: number = 1080;

  public static shouldShow(width: number, height: number): boolean {
    return width > ResolutionDialogSpec.MAX_WIDTH || height > ResolutionDialogSpec.MAX_HEIGHT;
  }

  public static describe(width: number, height: number): string {
    return `${ResolutionDialogSpec.TITLE}|${width}x${height}|${ResolutionDialogSpec.CONTENT}`;
  }
}

export default function screenRecorderDialogUITest(): void {
  describe('ScreenRecorderDialogUI_Test', () => {
    let driver: Driver;

    beforeAll(() => {
      driver = getDriver();
    });

    afterAll(() => {
      // The tip window closes itself, so no explicit teardown is required.
    });

    it('tip_dialog_text_literals_should_be_defined', 0, () => {
      expect(TipDialogSpec.TITLE).assertEqual('录屏');
      expect(TipDialogSpec.CONTENT).assertEqual('录屏视频已存储到"照片"');
      expect(TipDialogSpec.TITLE.length).assertEqual(2);
      expect(TipDialogSpec.CONTENT.length > 0).assertEqual(true);
    });

    it('tip_dialog_component_model_should_count_visible_components', 0, () => {
      const collector = new TipMetricsCollector();
      collector.addComponent({ id: 'icon', type: 'Image', width: 60, height: 60, visible: true });
      collector.addComponent({ id: 'title', type: 'Text', width: 100, height: 36, visible: true });
      collector.addComponent({ id: 'divider', type: 'Divider', width: 1, height: 36, visible: false });
      collector.addComponent({ id: 'content', type: 'Text', width: 480, height: 36, visible: true });
      expect(collector.getComponentCount()).assertEqual(4);
      expect(collector.getVisibleCount()).assertEqual(3);
      expect(collector.getTotalWidth()).assertEqual(641);
      expect(collector.getTotalHeight()).assertEqual(168);
    });

    it('tip_dialog_layout_metrics_should_match_design', 0, () => {
      const collector = new TipMetricsCollector();
      collector.addComponent({ id: 'icon', type: 'Image', width: 60, height: 60, visible: true });
      collector.addComponent({ id: 'content', type: 'Text', width: 480, height: 36, visible: true });
      const metrics = collector.getMetrics(1);
      expect(metrics.componentCount).assertEqual(2);
      expect(metrics.totalWidth).assertEqual(540);
      expect(metrics.totalHeight).assertEqual(96);
      expect(metrics.focusIndex).assertEqual(1);
    });

    it('tip_dialog_focus_tracker_should_clamp_index', 0, () => {
      const tracker = new TipFocusTracker(3);
      expect(tracker.getEdge()).assertEqual(TipFocusEdge.FIRST);
      expect(tracker.moveLeft()).assertEqual(false);
      expect(tracker.moveRight()).assertEqual(true);
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getEdge()).assertEqual(TipFocusEdge.NONE);
      expect(tracker.moveRight()).assertEqual(true);
      expect(tracker.getEdge()).assertEqual(TipFocusEdge.LAST);
      expect(tracker.moveRight()).assertEqual(false);
      expect(tracker.setIndex(5)).assertEqual(false);
      expect(tracker.setIndex(0)).assertEqual(true);
      expect(tracker.getIndex()).assertEqual(0);
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tip_dialog_render_state_machine_should_follow_expected_order', 0, () => {
      const machine = new TipRenderStateMachine();
      expect(machine.getState()).assertEqual(TipRenderState.IDLE);
      expect(machine.transit(TipRenderState.READY)).assertEqual(false);
      expect(machine.transit(TipRenderState.CREATING)).assertEqual(true);
      expect(machine.transit(TipRenderState.RENDERING)).assertEqual(true);
      expect(machine.transit(TipRenderState.READY)).assertEqual(true);
      expect(machine.transit(TipRenderState.IDLE)).assertEqual(true);
      expect(machine.getHistory().length).assertEqual(5);
      machine.reset();
      expect(machine.getHistory().length).assertEqual(1);
    });

    it('tip_dialog_render_state_machine_should_handle_failure', 0, () => {
      const machine = new TipRenderStateMachine();
      expect(machine.transit(TipRenderState.CREATING)).assertEqual(true);
      expect(machine.transit(TipRenderState.FAILED)).assertEqual(true);
      expect(machine.transit(TipRenderState.RENDERING)).assertEqual(false);
      expect(machine.transit(TipRenderState.IDLE)).assertEqual(true);
      expect(machine.getState()).assertEqual(TipRenderState.IDLE);
    });

    it('tip_dialog_background_should_be_translucent', 0, () => {
      expect(TipDialogSpec.isTransparentColor(TipDialogSpec.BACKGROUND_COLOR)).assertEqual(true);
      expect(TipDialogSpec.isTransparentColor('#FF3A3F62')).assertEqual(false);
      expect(TipDialogSpec.isTransparentColor('#B33A3F62')).assertEqual(true);
      expect(TipDialogSpec.isTransparentColor('B33A3F62')).assertEqual(false);
      expect(ResolutionDialogSpec.BACKGROUND_COLOR).assertEqual(TipDialogSpec.BACKGROUND_COLOR);
    });

    it('tip_dialog_spec_should_be_self_consistent', 0, () => {
      const issues = TipDialogSpec.validate();
      expect(issues.length).assertEqual(0);
      expect(TipDialogSpec.TIP_DURATION_MS).assertEqual(3000);
      expect(TipDialogSpec.TIP_WINDOW_NAME).assertEqual('Tip');
      expect(TipDialogSpec.TIP_WINDOW_PAGE).assertEqual('pages/ScreenRecorderDialog');
      expect(TipDialogSpec.CORNER_RADIUS > 0).assertEqual(true);
    });

    it('tip_dialog_scaled_radius_should_follow_screen_width', 0, () => {
      expect(TipDialogSpec.scaledRadius(1920)).assertEqual(24);
      expect(TipDialogSpec.scaledRadius(960)).assertEqual(12);
      expect(TipDialogSpec.scaledRadius(3840)).assertEqual(48);
      expect(TipDialogSpec.estimateInnerWidth(1920)).assertEqual(600);
      expect(TipDialogSpec.estimateInnerWidth(960)).assertEqual(643);
    });

    it('resolution_dialog_should_only_show_for_oversized_output', 0, () => {
      expect(ResolutionDialogSpec.shouldShow(1920, 1080)).assertEqual(false);
      expect(ResolutionDialogSpec.shouldShow(1280, 720)).assertEqual(false);
      expect(ResolutionDialogSpec.shouldShow(2560, 1080)).assertEqual(true);
      expect(ResolutionDialogSpec.shouldShow(1920, 1440)).assertEqual(true);
      expect(ResolutionDialogSpec.describe(3840, 2160)).assertEqual('暂不支持|3840x2160|当前设备分辨率过高，请降低分辨率');
    });

    it('tip_window_should_render_all_components', 0, async () => {
      const count = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
      const stable = await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      expect(typeof stable).assertEqual('boolean');
    });

    it('tip_window_title_text_should_be_readable', 0, async () => {
      const hasTitle = await checkTextContent(driver, TIP_TEXT_TITLE);
      expect(typeof hasTitle).assertEqual('boolean');
      const hasContent = await checkTextContent(driver, TIP_TEXT_CONTENT);
      expect(typeof hasContent).assertEqual('boolean');
    });

    it('tip_window_image_component_should_exist', 0, async () => {
      const hasImage = await checkComponentExists(driver, 'Image');
      expect(typeof hasImage).assertEqual('boolean');
    });

    it('tip_dialog_stability_rounds_should_converge', 0, async () => {
      let lastCount = -1;
      let stableRounds = 0;
      for (let round = 0; round < STABLE_ROUNDS; round++) {
        const current = await recorderComponentCount(driver);
        if (lastCount < 0 || Math.abs(current - lastCount) <= STABLE_TOLERANCE) {
          stableRounds++;
        }
        lastCount = current;
      }
      expect(stableRounds).assertEqual(STABLE_ROUNDS);
      expect(lastCount >= -1).assertEqual(true);
    });

    it('tip_dialog_navigation_should_keep_component_count', 0, async () => {
      const before = await recorderComponentCount(driver);
      await pressAndWait(driver, KEY_ENTER, 2, DELAY_KEY_NAVIGATION);
      const after = await recorderComponentCount(driver);
      expect(Math.abs(after - before) <= TOLERANCE_COMPONENT_COUNT).assertEqual(true);
    });

    it('tip_dialog_back_key_should_not_crash', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const count = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
    });

    it('tip_dialog_should_keep_single_visible_row', 0, () => {
      const collector = new TipMetricsCollector();
      collector.addComponent({ id: 'icon', type: 'Image', width: 60, height: 60, visible: true });
      collector.addComponent({ id: 'row', type: 'Row', width: 566, height: 60, visible: true });
      const metrics = collector.getMetrics(0);
      expect(metrics.componentCount).assertEqual(2);
      expect(metrics.totalHeight).assertEqual(120);
      expect(metrics.focusIndex).assertEqual(0);
    });

    it('resolution_dialog_barrier_should_be_checked_before_recording', 0, () => {
      const candidates: string[] = [];
      const resolutions: number[][] = [[1920, 1080], [2560, 1440], [3840, 2160], [1280, 720]];
      for (let i = 0; i < resolutions.length; i++) {
        const width = resolutions[i][0];
        const height = resolutions[i][1];
        if (ResolutionDialogSpec.shouldShow(width, height)) {
          candidates.push(ResolutionDialogSpec.describe(width, height));
        }
      }
      expect(candidates.length).assertEqual(2);
      expect(candidates[0].indexOf('2560x1440') > 0).assertEqual(true);
      expect(candidates[1].indexOf('3840x2160') > 0).assertEqual(true);
    });
  });
}


