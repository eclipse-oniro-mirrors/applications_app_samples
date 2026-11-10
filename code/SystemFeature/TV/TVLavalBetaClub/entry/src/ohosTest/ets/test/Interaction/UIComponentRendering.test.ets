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

const TYPE_TEXT: string = 'Text';

const TYPE_IMAGE: string = 'Image';

const TYPE_BUTTON: string = 'Button';

const TYPE_LIST: string = 'List';

const TYPE_STACK: string = 'Stack';

const MAX_COMPONENTS: number = 200;

const MAX_DIMENSION: number = 10000;

interface ComponentSpec {
  id: string;
  type: string;
  width: number;
  height: number;
  visible: boolean;
}

// Represents a rendered component tree
class RenderTree {
  private components: ComponentSpec[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(spec: ComponentSpec): boolean {
    if (spec.id.length === 0 || this.has(spec.id) || this.components.length >= this.capacity) {
      return false;
    }
    this.components.push({
      id: spec.id,
      type: spec.type,
      width: spec.width,
      height: spec.height,
      visible: spec.visible
    });
    return true;
  }

  public has(id: string): boolean {
    for (let i = 0; i < this.components.length; i++) {
      if (this.components[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public remove(id: string): boolean {
    for (let i = 0; i < this.components.length; i++) {
      if (this.components[i].id === id) {
        this.components.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public size(): number {
    return this.components.length;
  }

  public countOfType(type: string): number {
    return this.components.filter((spec: ComponentSpec) => spec.type === type).length;
  }

  public visibleCount(): number {
    return this.components.filter((spec: ComponentSpec) => spec.visible).length;
  }

  public types(): string[] {
    const seen: Set<string> = new Set<string>();
    const result: string[] = [];
    for (let i = 0; i < this.components.length; i++) {
      if (!seen.has(this.components[i].type)) {
        seen.add(this.components[i].type);
        result.push(this.components[i].type);
      }
    }
    return result;
  }

  public setVisible(id: string, visible: boolean): boolean {
    for (let i = 0; i < this.components.length; i++) {
      if (this.components[i].id === id) {
        this.components[i].visible = visible;
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.components = [];
  }
}

// Computes simple flow layout metrics
class FlowLayout {
  public static rows(count: number, columns: number): number {
    if (count <= 0 || columns <= 0) {
      return 0;
    }
    return Math.ceil(count / columns);
  }

  public static cells(rows: number, columns: number): number {
    return rows <= 0 || columns <= 0 ? 0 : rows * columns;
  }

  public static totalWidth(columns: number, itemWidth: number, gap: number): number {
    if (columns <= 0 || itemWidth <= 0) {
      return 0;
    }
    return columns * itemWidth + Math.max(0, columns - 1) * gap;
  }

  public static totalHeight(rows: number, itemHeight: number, gap: number): number {
    if (rows <= 0 || itemHeight <= 0) {
      return 0;
    }
    return rows * itemHeight + Math.max(0, rows - 1) * gap;
  }

  public static fits(width: number, height: number, maxWidth: number, maxHeight: number): boolean {
    return width > 0 && height > 0 && width <= maxWidth && height <= maxHeight;
  }
}

// Validates component dimensions and render state
class RenderValidator {
  public static isDimensionValid(value: number): boolean {
    return value >= 0 && value <= MAX_DIMENSION;
  }

  public static isComponentValid(spec: ComponentSpec): boolean {
    return spec.id.length > 0 && RenderValidator.isTypeKnown(spec.type) &&
      RenderValidator.isDimensionValid(spec.width) && RenderValidator.isDimensionValid(spec.height);
  }

  public static isTypeKnown(type: string): boolean {
    return type === TYPE_TEXT || type === TYPE_IMAGE || type === TYPE_BUTTON ||
      type === TYPE_LIST || type === TYPE_STACK;
  }

  public static isCountReasonable(count: number, max: number): boolean {
    return count >= 0 && count <= max;
  }

  public static isVisibleAreaValid(spec: ComponentSpec): boolean {
    return spec.visible && spec.width > 0 && spec.height > 0;
  }
}

// Records render snapshots for stability checks
class RenderSnapshot {
  private counts: number[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public capture(count: number): boolean {
    if (count < 0 || this.capacity <= 0) {
      return false;
    }
    if (this.counts.length >= this.capacity) {
      this.counts.shift();
    }
    this.counts.push(count);
    return true;
  }

  public count(): number {
    return this.counts.length;
  }

  public maxDelta(): number {
    if (this.counts.length < 2) {
      return 0;
    }
    let min: number = this.counts[0];
    let max: number = this.counts[0];
    for (let i = 1; i < this.counts.length; i++) {
      if (this.counts[i] < min) {
        min = this.counts[i];
      }
      if (this.counts[i] > max) {
        max = this.counts[i];
      }
    }
    return max - min;
  }

  public isStable(tolerance: number): boolean {
    return this.maxDelta() <= tolerance;
  }

  public latest(): number {
    return this.counts.length === 0 ? 0 : this.counts[this.counts.length - 1];
  }

  public clear(): void {
    this.counts = [];
  }
}

export default function uiComponentRenderingTest() {
  describe('UIComponentRendering_Test', () => {

    it('tree_should_add_and_remove_components', 0, () => {
      const tree = new RenderTree(MAX_COMPONENTS);
      expect(tree.add({
        id: 'title', type: TYPE_TEXT, width: 200, height: 40, visible: true
      })).assertTrue();
      expect(tree.has('title')).assertTrue();
      expect(tree.add({
        id: 'title', type: TYPE_TEXT, width: 200, height: 40, visible: true
      })).assertFalse();
      expect(tree.add({
        id: '', type: TYPE_TEXT, width: 200, height: 40, visible: true
      })).assertFalse();
      expect(tree.size()).assertEqual(1);
      expect(tree.remove('title')).assertTrue();
      expect(tree.remove('title')).assertFalse();
    });

    it('tree_should_count_by_type', 0, () => {
      const tree = new RenderTree(MAX_COMPONENTS);
      tree.add({ id: 'a', type: TYPE_TEXT, width: 1, height: 1, visible: true });
      tree.add({ id: 'b', type: TYPE_TEXT, width: 1, height: 1, visible: true });
      tree.add({ id: 'c', type: TYPE_IMAGE, width: 1, height: 1, visible: true });
      tree.add({ id: 'd', type: TYPE_BUTTON, width: 1, height: 1, visible: false });
      expect(tree.size()).assertEqual(4);
      expect(tree.countOfType(TYPE_TEXT)).assertEqual(2);
      expect(tree.countOfType(TYPE_IMAGE)).assertEqual(1);
      expect(tree.countOfType(TYPE_LIST)).assertEqual(0);
      expect(tree.visibleCount()).assertEqual(3);
      expect(tree.types().length).assertEqual(3);
    });

    it('tree_should_toggle_visibility', 0, () => {
      const tree = new RenderTree(MAX_COMPONENTS);
      tree.add({ id: 'a', type: TYPE_TEXT, width: 1, height: 1, visible: true });
      tree.add({ id: 'b', type: TYPE_IMAGE, width: 1, height: 1, visible: false });
      expect(tree.visibleCount()).assertEqual(1);
      expect(tree.setVisible('b', true)).assertTrue();
      expect(tree.visibleCount()).assertEqual(2);
      expect(tree.setVisible('missing', true)).assertFalse();
      tree.clear();
      expect(tree.size()).assertEqual(0);
      expect(tree.visibleCount()).assertEqual(0);
    });

    it('tree_should_enforce_capacity', 0, () => {
      const tree = new RenderTree(2);
      expect(tree.add({ id: 'a', type: TYPE_TEXT, width: 1, height: 1, visible: true })).assertTrue();
      expect(tree.add({ id: 'b', type: TYPE_TEXT, width: 1, height: 1, visible: true })).assertTrue();
      expect(tree.add({ id: 'c', type: TYPE_TEXT, width: 1, height: 1, visible: true })).assertFalse();
      expect(tree.size()).assertEqual(2);
    });

    it('layout_should_compute_rows_and_cells', 0, () => {
      expect(FlowLayout.rows(10, 3)).assertEqual(4);
      expect(FlowLayout.rows(9, 3)).assertEqual(3);
      expect(FlowLayout.rows(0, 3)).assertEqual(0);
      expect(FlowLayout.rows(10, 0)).assertEqual(0);
      expect(FlowLayout.cells(4, 3)).assertEqual(12);
      expect(FlowLayout.cells(0, 3)).assertEqual(0);
    });

    it('layout_should_compute_total_size', 0, () => {
      expect(FlowLayout.totalWidth(3, 200, 20)).assertEqual(640);
      expect(FlowLayout.totalWidth(1, 200, 20)).assertEqual(200);
      expect(FlowLayout.totalWidth(0, 200, 20)).assertEqual(0);
      expect(FlowLayout.totalHeight(2, 100, 20)).assertEqual(220);
      expect(FlowLayout.totalHeight(1, 100, 20)).assertEqual(100);
    });

    it('layout_should_check_fit', 0, () => {
      expect(FlowLayout.fits(640, 480, 1920, 1080)).assertTrue();
      expect(FlowLayout.fits(2000, 480, 1920, 1080)).assertFalse();
      expect(FlowLayout.fits(640, 2000, 1920, 1080)).assertFalse();
      expect(FlowLayout.fits(0, 480, 1920, 1080)).assertFalse();
      expect(FlowLayout.fits(640, 480, 640, 480)).assertTrue();
    });

    it('validator_should_check_types', 0, () => {
      expect(RenderValidator.isTypeKnown(TYPE_TEXT)).assertTrue();
      expect(RenderValidator.isTypeKnown(TYPE_IMAGE)).assertTrue();
      expect(RenderValidator.isTypeKnown(TYPE_BUTTON)).assertTrue();
      expect(RenderValidator.isTypeKnown(TYPE_LIST)).assertTrue();
      expect(RenderValidator.isTypeKnown(TYPE_STACK)).assertTrue();
      expect(RenderValidator.isTypeKnown('Video')).assertFalse();
    });

    it('validator_should_check_dimensions', 0, () => {
      expect(RenderValidator.isDimensionValid(0)).assertTrue();
      expect(RenderValidator.isDimensionValid(MAX_DIMENSION)).assertTrue();
      expect(RenderValidator.isDimensionValid(-1)).assertFalse();
      expect(RenderValidator.isDimensionValid(MAX_DIMENSION + 1)).assertFalse();
      expect(RenderValidator.isCountReasonable(0, 200)).assertTrue();
      expect(RenderValidator.isCountReasonable(201, 200)).assertFalse();
    });

    it('validator_should_check_component', 0, () => {
      expect(RenderValidator.isComponentValid({
        id: 'a', type: TYPE_TEXT, width: 100, height: 20, visible: true
      })).assertTrue();
      expect(RenderValidator.isComponentValid({
        id: '', type: TYPE_TEXT, width: 100, height: 20, visible: true
      })).assertFalse();
      expect(RenderValidator.isComponentValid({
        id: 'a', type: 'Video', width: 100, height: 20, visible: true
      })).assertFalse();
      expect(RenderValidator.isVisibleAreaValid({
        id: 'a', type: TYPE_TEXT, width: 100, height: 20, visible: true
      })).assertTrue();
    });

    it('snapshot_should_track_stability', 0, () => {
      const snapshot = new RenderSnapshot(5);
      snapshot.capture(10);
      snapshot.capture(11);
      snapshot.capture(10);
      expect(snapshot.count()).assertEqual(3);
      expect(snapshot.maxDelta()).assertEqual(1);
      expect(snapshot.isStable(1)).assertTrue();
      expect(snapshot.isStable(0)).assertFalse();
      expect(snapshot.latest()).assertEqual(10);
    });

    it('snapshot_should_handle_empty_and_bounds', 0, () => {
      const snapshot = new RenderSnapshot(2);
      expect(snapshot.latest()).assertEqual(0);
      expect(snapshot.maxDelta()).assertEqual(0);
      expect(snapshot.capture(-1)).assertFalse();
      snapshot.capture(1);
      snapshot.capture(2);
      snapshot.capture(100);
      expect(snapshot.count()).assertEqual(2);
      expect(snapshot.latest()).assertEqual(100);
      snapshot.clear();
      expect(snapshot.count()).assertEqual(0);
    });

    it('render_flow_should_track_component_stability', 0, () => {
      const tree = new RenderTree(MAX_COMPONENTS);
      const snapshot = new RenderSnapshot(5);
      const types: string[] = [TYPE_TEXT, TYPE_IMAGE, TYPE_BUTTON];
      for (let i = 0; i < types.length; i++) {
        tree.add({
          id: `c-${i}`, type: types[i], width: 200, height: 100, visible: true
        });
        snapshot.capture(tree.size());
      }
      expect(tree.size()).assertEqual(3);
      expect(tree.visibleCount()).assertEqual(3);
      expect(snapshot.isStable(0)).assertFalse();
      expect(snapshot.latest()).assertEqual(3);
      expect(FlowLayout.cells(FlowLayout.rows(3, 3), 3)).assertEqual(3);
    });

    it('rendering_constants_should_be_stable', 0, () => {
      expect(TYPE_TEXT).assertEqual('Text');
      expect(TYPE_IMAGE).assertEqual('Image');
      expect(TYPE_BUTTON).assertEqual('Button');
      expect(TYPE_LIST).assertEqual('List');
      expect(TYPE_STACK).assertEqual('Stack');
      expect(MAX_COMPONENTS).assertEqual(200);
      expect(MAX_DIMENSION).assertEqual(10000);
    });
  });
}

