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

import { describe, it, expect } from '@ohos/hypium';

const MAX_OFFSET: number = 10000;

const FLING_THRESHOLD: number = 500;

const MAX_VELOCITY: number = 5000;

const PAGE_STEP: number = 300;

interface ScrollMetrics {
  offset: number;
  maxOffset: number;
}

// Controls list scrolling with clamped offsets
class ScrollController {
  private offset: number = 0;
  private maxOffset: number;
  private flings: number = 0;

  constructor(maxOffset: number) {
    this.maxOffset = maxOffset;
  }

  public scrollBy(delta: number): number {
    this.offset = ScrollController.clamp(this.offset + delta, 0, this.maxOffset);
    return this.offset;
  }

  public scrollTo(offset: number): number {
    this.offset = ScrollController.clamp(offset, 0, this.maxOffset);
    return this.offset;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public scrollPage(direction: number): number {
    return this.scrollBy(direction >= 0 ? PAGE_STEP : -PAGE_STEP);
  }

  public fling(velocity: number): number {
    const clamped = ScrollController.clamp(velocity, -MAX_VELOCITY, MAX_VELOCITY);
    if (Math.abs(clamped) < FLING_THRESHOLD) {
      return this.offset;
    }
    this.flings++;
    return this.scrollBy(clamped > 0 ? PAGE_STEP * 2 : -PAGE_STEP * 2);
  }

  public getOffset(): number {
    return this.offset;
  }

  public getMaxOffset(): number {
    return this.maxOffset;
  }

  public setMaxOffset(maxOffset: number): boolean {
    if (maxOffset < 0 || maxOffset > MAX_OFFSET) {
      return false;
    }
    this.maxOffset = maxOffset;
    this.offset = ScrollController.clamp(this.offset, 0, maxOffset);
    return true;
  }

  public getFlings(): number {
    return this.flings;
  }

  public isAtTop(): boolean {
    return this.offset <= 0;
  }

  public isAtBottom(): boolean {
    return this.offset >= this.maxOffset;
  }

  public reset(): void {
    this.offset = 0;
    this.flings = 0;
  }
}

// Detects overscroll and edge conditions
class ScrollEdgeDetector {
  public static isOverscroll(metrics: ScrollMetrics): boolean {
    return metrics.offset < 0 || metrics.offset > metrics.maxOffset;
  }

  public static isAtEdge(metrics: ScrollMetrics): boolean {
    return metrics.offset <= 0 || metrics.offset >= metrics.maxOffset;
  }

  public static remaining(metrics: ScrollMetrics): number {
    const remaining = metrics.maxOffset - metrics.offset;
    return remaining < 0 ? 0 : remaining;
  }

  public static progress(metrics: ScrollMetrics): number {
    if (metrics.maxOffset <= 0) {
      return 100;
    }
    const clamped = ScrollEdgeDetector.clampOffset(metrics.offset, metrics.maxOffset);
    return clamped * 100 / metrics.maxOffset;
  }

  public static clampOffset(offset: number, maxOffset: number): number {
    if (offset < 0) {
      return 0;
    }
    if (offset > maxOffset) {
      return maxOffset;
    }
    return offset;
  }
}

// Simulates focus-driven list scrolling for TV remote navigation
class FocusScrollDriver {
  private itemHeight: number;
  private visibleCount: number;
  private focusedIndex: number = 0;

  constructor(itemHeight: number, visibleCount: number) {
    this.itemHeight = itemHeight;
    this.visibleCount = visibleCount;
  }

  public moveTo(index: number, total: number): number {
    if (index < 0) {
      index = 0;
    }
    if (index >= total) {
      index = total - 1;
    }
    this.focusedIndex = index;
    return this.requiredOffset();
  }

  public requiredOffset(): number {
    const focusTop = this.focusedIndex * this.itemHeight;
    const focusBottom = focusTop + this.itemHeight;
    const viewport = this.visibleCount * this.itemHeight;
    if (focusBottom > viewport) {
      return focusBottom - viewport;
    }
    return 0;
  }

  public getFocusedIndex(): number {
    return this.focusedIndex;
  }

  public getVisibleCount(): number {
    return this.visibleCount;
  }

  public isVisible(): boolean {
    return this.focusedIndex >= 0 && this.focusedIndex < this.visibleCount;
  }

  public reset(): void {
    this.focusedIndex = 0;
  }
}

export default function scrollBehaviorTest() {
  describe('ScrollBehavior_Test', () => {

    it('controller_should_scroll_and_clamp', 0, () => {
      const controller = new ScrollController(1000);
      expect(controller.scrollBy(100)).assertEqual(100);
      expect(controller.scrollBy(200)).assertEqual(300);
      expect(controller.scrollBy(-400)).assertEqual(0);
      expect(controller.scrollBy(-100)).assertEqual(0);
      expect(controller.isAtTop()).assertTrue();
      expect(ScrollController.clamp(-5, 0, 10)).assertEqual(0);
      expect(ScrollController.clamp(15, 0, 10)).assertEqual(10);
    });

    it('controller_should_scroll_to_bottom', 0, () => {
      const controller = new ScrollController(1000);
      expect(controller.scrollTo(2000)).assertEqual(1000);
      expect(controller.isAtBottom()).assertTrue();
      expect(controller.scrollTo(-100)).assertEqual(0);
      expect(controller.isAtTop()).assertTrue();
    });

    it('controller_should_scroll_pages', 0, () => {
      const controller = new ScrollController(1000);
      expect(controller.scrollPage(1)).assertEqual(PAGE_STEP);
      expect(controller.scrollPage(1)).assertEqual(PAGE_STEP * 2);
      expect(controller.scrollPage(-1)).assertEqual(PAGE_STEP);
      expect(controller.scrollPage(-5)).assertEqual(0);
    });

    it('controller_should_handle_fling', 0, () => {
      const controller = new ScrollController(2000);
      expect(controller.fling(100)).assertEqual(0);
      expect(controller.getFlings()).assertEqual(0);
      expect(controller.fling(FLING_THRESHOLD)).assertEqual(PAGE_STEP * 2);
      expect(controller.getFlings()).assertEqual(1);
      expect(controller.fling(-FLING_THRESHOLD)).assertEqual(0);
      expect(controller.getFlings()).assertEqual(2);
    });

    it('controller_should_update_max_offset', 0, () => {
      const controller = new ScrollController(1000);
      controller.scrollTo(800);
      expect(controller.setMaxOffset(500)).assertTrue();
      expect(controller.getOffset()).assertEqual(500);
      expect(controller.setMaxOffset(-1)).assertFalse();
      expect(controller.setMaxOffset(MAX_OFFSET + 1)).assertFalse();
      expect(controller.getMaxOffset()).assertEqual(500);
      controller.reset();
      expect(controller.getOffset()).assertEqual(0);
      expect(controller.getFlings()).assertEqual(0);
    });

    it('edge_detector_should_detect_overscroll', 0, () => {
      expect(ScrollEdgeDetector.isOverscroll({ offset: -1, maxOffset: 100 })).assertTrue();
      expect(ScrollEdgeDetector.isOverscroll({ offset: 101, maxOffset: 100 })).assertTrue();
      expect(ScrollEdgeDetector.isOverscroll({ offset: 50, maxOffset: 100 })).assertFalse();
      expect(ScrollEdgeDetector.isAtEdge({ offset: 0, maxOffset: 100 })).assertTrue();
      expect(ScrollEdgeDetector.isAtEdge({ offset: 100, maxOffset: 100 })).assertTrue();
      expect(ScrollEdgeDetector.isAtEdge({ offset: 50, maxOffset: 100 })).assertFalse();
    });

    it('edge_detector_should_compute_progress', 0, () => {
      expect(ScrollEdgeDetector.remaining({ offset: 40, maxOffset: 100 })).assertEqual(60);
      expect(ScrollEdgeDetector.remaining({ offset: 120, maxOffset: 100 })).assertEqual(0);
      expect(ScrollEdgeDetector.progress({ offset: 50, maxOffset: 100 })).assertEqual(50);
      expect(ScrollEdgeDetector.progress({ offset: 0, maxOffset: 0 })).assertEqual(100);
      expect(ScrollEdgeDetector.clampOffset(-5, 100)).assertEqual(0);
      expect(ScrollEdgeDetector.clampOffset(105, 100)).assertEqual(100);
    });

    it('focus_driver_should_scroll_to_focus', 0, () => {
      const driver = new FocusScrollDriver(100, 3);
      expect(driver.moveTo(0, 10)).assertEqual(0);
      expect(driver.moveTo(2, 10)).assertEqual(0);
      expect(driver.moveTo(3, 10)).assertEqual(100);
      expect(driver.moveTo(5, 10)).assertEqual(300);
      expect(driver.getFocusedIndex()).assertEqual(5);
    });

    it('focus_driver_should_clamp_index', 0, () => {
      const driver = new FocusScrollDriver(100, 3);
      expect(driver.moveTo(-5, 10)).assertEqual(0);
      expect(driver.getFocusedIndex()).assertEqual(0);
      expect(driver.moveTo(99, 10)).assertEqual(700);
      expect(driver.getFocusedIndex()).assertEqual(9);
      expect(driver.isVisible()).assertFalse();
      driver.reset();
      expect(driver.getFocusedIndex()).assertEqual(0);
      expect(driver.getVisibleCount()).assertEqual(3);
    });

    it('scroll_flow_should_follow_focus', 0, () => {
      const controller = new ScrollController(1000);
      const driver = new FocusScrollDriver(100, 3);
      for (let i = 0; i < 8; i++) {
        const offset = driver.moveTo(i, 20);
        controller.scrollTo(offset);
      }
      expect(driver.getFocusedIndex()).assertEqual(7);
      expect(controller.getOffset()).assertEqual(500);
      expect(controller.isAtBottom()).assertFalse();
      expect(ScrollEdgeDetector.progress({
        offset: controller.getOffset(), maxOffset: controller.getMaxOffset()
      })).assertEqual(50);
    });

    it('scroll_constants_should_be_stable', 0, () => {
      expect(MAX_OFFSET).assertEqual(10000);
      expect(FLING_THRESHOLD).assertEqual(500);
      expect(MAX_VELOCITY).assertEqual(5000);
      expect(PAGE_STEP).assertEqual(300);
    });
  });
}

