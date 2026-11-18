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

const ITEM_WIDTH: number = 200;

const ITEM_HEIGHT: number = 100;

const ITEM_GAP: number = 20;

const CONTENT_PADDING: number = 24;

const MIN_TOUCH_TARGET: number = 48;

const MAX_CONTENT_WIDTH: number = 1920;

interface BoxMetrics {
  width: number;
  height: number;
  padding: number;
  margin: number;
}

// Measures grid and content layouts
class LayoutMeasurer {
  public static contentWidth(columns: number): number {
    if (columns <= 0) {
      return 0;
    }
    return columns * ITEM_WIDTH + (columns - 1) * ITEM_GAP;
  }

  public static contentHeight(rows: number): number {
    if (rows <= 0) {
      return 0;
    }
    return rows * ITEM_HEIGHT + (rows - 1) * ITEM_GAP;
  }

  public static rowsFor(count: number, columns: number): number {
    if (count <= 0 || columns <= 0) {
      return 0;
    }
    return Math.ceil(count / columns);
  }

  public static visibleCount(viewportHeight: number, columns: number): number {
    if (viewportHeight <= 0 || columns <= 0) {
      return 0;
    }
    const rows = Math.floor(viewportHeight / (ITEM_HEIGHT + ITEM_GAP));
    return rows * columns;
  }

  public static outerWidth(columns: number): number {
    return LayoutMeasurer.contentWidth(columns) + CONTENT_PADDING * 2;
  }

  public static outerHeight(rows: number): number {
    return LayoutMeasurer.contentHeight(rows) + CONTENT_PADDING * 2;
  }

  public static fitsWidth(columns: number): boolean {
    return columns > 0 && LayoutMeasurer.outerWidth(columns) <= MAX_CONTENT_WIDTH;
  }

  public static maxColumns(): number {
    let columns: number = 1;
    while (LayoutMeasurer.fitsWidth(columns + 1)) {
      columns++;
    }
    return columns;
  }
}

// Validates box metrics for rendering
class LayoutValidator {
  public static isBoxValid(box: BoxMetrics): boolean {
    return box.width > 0 && box.height > 0 && box.padding >= 0 && box.margin >= 0;
  }

  public static isTouchTargetValid(box: BoxMetrics): boolean {
    return box.width >= MIN_TOUCH_TARGET && box.height >= MIN_TOUCH_TARGET;
  }

  public static innerWidth(box: BoxMetrics): number {
    const inner = box.width - box.padding * 2;
    return inner < 0 ? 0 : inner;
  }

  public static innerHeight(box: BoxMetrics): number {
    const inner = box.height - box.padding * 2;
    return inner < 0 ? 0 : inner;
  }

  public static outerWidth(box: BoxMetrics): number {
    return box.width + box.margin * 2;
  }

  public static outerHeight(box: BoxMetrics): number {
    return box.height + box.margin * 2;
  }

  public static isInside(box: BoxMetrics, containerWidth: number, containerHeight: number): boolean {
    return LayoutValidator.outerWidth(box) <= containerWidth &&
      LayoutValidator.outerHeight(box) <= containerHeight;
  }
}

// Records layout measurements across configurations
class LayoutSampleLog {
  private widths: number[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(width: number): boolean {
    if (width < 0 || this.capacity <= 0) {
      return false;
    }
    if (this.widths.length >= this.capacity) {
      this.widths.shift();
    }
    this.widths.push(width);
    return true;
  }

  public count(): number {
    return this.widths.length;
  }

  public max(): number {
    let max: number = 0;
    for (let i = 0; i < this.widths.length; i++) {
      if (this.widths[i] > max) {
        max = this.widths[i];
      }
    }
    return max;
  }

  public latest(): number {
    return this.widths.length === 0 ? 0 : this.widths[this.widths.length - 1];
  }

  public isStable(tolerance: number): boolean {
    if (this.widths.length < 2) {
      return true;
    }
    let min: number = this.widths[0];
    const max = this.max();
    for (let i = 1; i < this.widths.length; i++) {
      if (this.widths[i] < min) {
        min = this.widths[i];
      }
    }
    return max - min <= tolerance;
  }

  public clear(): void {
    this.widths = [];
  }
}

export default function layoutMeasurementTest() {
  describe('LayoutMeasurementTest', () => {

    it('measurer_should_compute_content_size', 0, () => {
      expect(LayoutMeasurer.contentWidth(1)).assertEqual(ITEM_WIDTH);
      expect(LayoutMeasurer.contentWidth(3)).assertEqual(640);
      expect(LayoutMeasurer.contentWidth(0)).assertEqual(0);
      expect(LayoutMeasurer.contentHeight(2)).assertEqual(220);
      expect(LayoutMeasurer.contentHeight(0)).assertEqual(0);
    });

    it('measurer_should_compute_rows', 0, () => {
      expect(LayoutMeasurer.rowsFor(10, 3)).assertEqual(4);
      expect(LayoutMeasurer.rowsFor(9, 3)).assertEqual(3);
      expect(LayoutMeasurer.rowsFor(0, 3)).assertEqual(0);
      expect(LayoutMeasurer.rowsFor(10, 0)).assertEqual(0);
      expect(LayoutMeasurer.rowsFor(1, 4)).assertEqual(1);
    });

    it('measurer_should_compute_visible_count', 0, () => {
      expect(LayoutMeasurer.visibleCount(120, 3)).assertEqual(3);
      expect(LayoutMeasurer.visibleCount(240, 2)).assertEqual(4);
      expect(LayoutMeasurer.visibleCount(0, 3)).assertEqual(0);
      expect(LayoutMeasurer.visibleCount(120, 0)).assertEqual(0);
      expect(LayoutMeasurer.visibleCount(119, 3)).assertEqual(0);
    });

    it('measurer_should_add_padding', 0, () => {
      expect(LayoutMeasurer.outerWidth(1)).assertEqual(ITEM_WIDTH + CONTENT_PADDING * 2);
      expect(LayoutMeasurer.outerHeight(1)).assertEqual(ITEM_HEIGHT + CONTENT_PADDING * 2);
      expect(LayoutMeasurer.outerWidth(0)).assertEqual(CONTENT_PADDING * 2);
      expect(LayoutMeasurer.outerHeight(0)).assertEqual(CONTENT_PADDING * 2);
    });

    it('measurer_should_compute_max_columns', 0, () => {
      expect(LayoutMeasurer.fitsWidth(1)).assertTrue();
      expect(LayoutMeasurer.fitsWidth(0)).assertFalse();
      const max = LayoutMeasurer.maxColumns();
      expect(max).assertLarger(0);
      expect(LayoutMeasurer.outerWidth(max)).assertLessOrEqual(MAX_CONTENT_WIDTH);
      expect(LayoutMeasurer.fitsWidth(max + 1)).assertFalse();
    });

    it('validator_should_check_boxes', 0, () => {
      const box: BoxMetrics = { width: 200, height: 100, padding: 10, margin: 5 };
      expect(LayoutValidator.isBoxValid(box)).assertTrue();
      box.width = 0;
      expect(LayoutValidator.isBoxValid(box)).assertFalse();
      box.width = 200;
      box.padding = -1;
      expect(LayoutValidator.isBoxValid(box)).assertFalse();
      box.padding = 10;
      box.margin = -1;
      expect(LayoutValidator.isBoxValid(box)).assertFalse();
    });

    it('validator_should_check_touch_targets', 0, () => {
      expect(LayoutValidator.isTouchTargetValid({
        width: MIN_TOUCH_TARGET, height: MIN_TOUCH_TARGET, padding: 0, margin: 0
      })).assertTrue();
      expect(LayoutValidator.isTouchTargetValid({
        width: MIN_TOUCH_TARGET - 1, height: MIN_TOUCH_TARGET, padding: 0, margin: 0
      })).assertFalse();
      expect(LayoutValidator.isTouchTargetValid({
        width: MIN_TOUCH_TARGET, height: MIN_TOUCH_TARGET - 1, padding: 0, margin: 0
      })).assertFalse();
    });

    it('validator_should_compute_inner_and_outer', 0, () => {
      const box: BoxMetrics = { width: 200, height: 100, padding: 10, margin: 5 };
      expect(LayoutValidator.innerWidth(box)).assertEqual(180);
      expect(LayoutValidator.innerHeight(box)).assertEqual(80);
      expect(LayoutValidator.outerWidth(box)).assertEqual(210);
      expect(LayoutValidator.outerHeight(box)).assertEqual(110);
      box.padding = 200;
      expect(LayoutValidator.innerWidth(box)).assertEqual(0);
      expect(LayoutValidator.innerHeight(box)).assertEqual(0);
    });

    it('validator_should_check_container_fit', 0, () => {
      const box: BoxMetrics = { width: 200, height: 100, padding: 10, margin: 5 };
      expect(LayoutValidator.isInside(box, 300, 200)).assertTrue();
      expect(LayoutValidator.isInside(box, 200, 200)).assertFalse();
      expect(LayoutValidator.isInside(box, 300, 100)).assertFalse();
      expect(LayoutValidator.isInside(box, 210, 110)).assertTrue();
    });

    it('log_should_track_width_stability', 0, () => {
      const log = new LayoutSampleLog(5);
      expect(log.record(640)).assertTrue();
      log.record(642);
      log.record(641);
      expect(log.count()).assertEqual(3);
      expect(log.max()).assertEqual(642);
      expect(log.latest()).assertEqual(641);
      expect(log.isStable(2)).assertTrue();
      expect(log.isStable(0)).assertFalse();
      log.clear();
      expect(log.count()).assertEqual(0);
    });

    it('log_should_handle_bounds', 0, () => {
      const log = new LayoutSampleLog(0);
      expect(log.record(100)).assertFalse();
      expect(log.latest()).assertEqual(0);
      expect(log.isStable(0)).assertTrue();
      const bounded = new LayoutSampleLog(2);
      bounded.record(100);
      bounded.record(200);
      bounded.record(300);
      expect(bounded.count()).assertEqual(2);
      expect(bounded.latest()).assertEqual(300);
      expect(bounded.record(-1)).assertFalse();
    });

    it('layout_flow_should_measure_grid', 0, () => {
      const count = 11;
      const columns = 3;
      const rows = LayoutMeasurer.rowsFor(count, columns);
      const width = LayoutMeasurer.outerWidth(columns);
      const height = LayoutMeasurer.outerHeight(rows);
      expect(rows).assertEqual(4);
      expect(width).assertEqual(688);
      expect(height).assertEqual(508);
      expect(LayoutMeasurer.fitsWidth(columns)).assertTrue();
      const box: BoxMetrics = { width: width, height: height, padding: 0, margin: 0 };
      expect(LayoutValidator.isInside(box, 1920, 1080)).assertTrue();
      expect(LayoutMeasurer.visibleCount(1080, columns)).assertEqual(27);
    });

    it('layout_constants_should_be_stable', 0, () => {
      expect(ITEM_WIDTH).assertEqual(200);
      expect(ITEM_HEIGHT).assertEqual(100);
      expect(ITEM_GAP).assertEqual(20);
      expect(CONTENT_PADDING).assertEqual(24);
      expect(MIN_TOUCH_TARGET).assertEqual(48);
      expect(MAX_CONTENT_WIDTH).assertEqual(1920);
    });
  });
}

