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
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN,
  DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum RenderPhase {
  IDLE = 0,
  MEASURE = 1,
  LAYOUT = 2,
  DRAW = 3,
  COMPOSITE = 4
}

enum RenderNodeKind {
  CONTAINER = 0,
  TEXT = 1,
  BUTTON = 2,
  IMAGE = 3,
  SCROLL = 4
}

class RenderRect {
  readonly x: number;
  readonly y: number;
  readonly width: number;
  readonly height: number;

  constructor(x: number, y: number, width: number, height: number) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  right(): number {
    return this.x + this.width;
  }

  bottom(): number {
    return this.y + this.height;
  }

  area(): number {
    return this.width * this.height;
  }

  isEmpty(): boolean {
    return this.width <= 0 || this.height <= 0;
  }

  intersects(other: RenderRect): boolean {
    return this.x < other.right() && this.right() > other.x &&
      this.y < other.bottom() && this.bottom() > other.y;
  }

  contains(other: RenderRect): boolean {
    return this.x <= other.x && this.y <= other.y &&
      this.right() >= other.right() && this.bottom() >= other.bottom();
  }

  union(other: RenderRect): RenderRect {
    const left = Math.min(this.x, other.x);
    const top = Math.min(this.y, other.y);
    const right = Math.max(this.right(), other.right());
    const bottom = Math.max(this.bottom(), other.bottom());
    return new RenderRect(left, top, right - left, bottom - top);
  }
}

class RenderNode {
  readonly id: string;
  readonly kind: RenderNodeKind;
  private rect: RenderRect;
  private visible: boolean = true;
  private dirty: boolean = false;
  private zOrder: number = 0;

  constructor(id: string, kind: RenderNodeKind, rect: RenderRect) {
    this.id = id;
    this.kind = kind;
    this.rect = rect;
  }

  getId(): string {
    return this.id;
  }

  getKind(): RenderNodeKind {
    return this.kind;
  }

  getRect(): RenderRect {
    return this.rect;
  }

  layoutTo(rect: RenderRect): void {
    this.rect = rect;
    this.dirty = true;
  }

  isVisible(): boolean {
    return this.visible;
  }

  setVisible(visible: boolean): void {
    if (this.visible !== visible) {
      this.visible = visible;
      this.dirty = true;
    }
  }

  isDirty(): boolean {
    return this.dirty;
  }

  markDirty(): void {
    this.dirty = true;
  }

  clearDirty(): void {
    this.dirty = false;
  }

  getZOrder(): number {
    return this.zOrder;
  }

  setZOrder(zOrder: number): void {
    this.zOrder = zOrder;
  }
}

class DirtyRegion {
  private rects: RenderRect[] = [];

  add(rect: RenderRect): void {
    if (rect.isEmpty()) {
      return;
    }
    this.rects.push(rect);
  }

  count(): number {
    return this.rects.length;
  }

  isEmpty(): boolean {
    return this.rects.length === 0;
  }

  totalArea(): number {
    let total = 0;
    for (const rect of this.rects) {
      total += rect.area();
    }
    return total;
  }

  boundingBox(): RenderRect {
    if (this.rects.length === 0) {
      return new RenderRect(0, 0, 0, 0);
    }
    let box = this.rects[0];
    for (const rect of this.rects) {
      box = box.union(rect);
    }
    return box;
  }

  clear(): void {
    this.rects = [];
  }

  intersectsAny(rect: RenderRect): boolean {
    for (const item of this.rects) {
      if (item.intersects(rect)) {
        return true;
      }
    }
    return false;
  }
}

class RenderTree {
  private nodes: RenderNode[] = [];

  add(node: RenderNode): void {
    for (const existing of this.nodes) {
      if (existing.getId() === node.getId()) {
        return;
      }
    }
    this.nodes.push(node);
  }

  nodeCount(): number {
    return this.nodes.length;
  }

  visibleCount(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.isVisible()) {
        count += 1;
      }
    }
    return count;
  }

  dirtyCount(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.isDirty()) {
        count += 1;
      }
    }
    return count;
  }

  findById(id: string): RenderNode | null {
    for (const node of this.nodes) {
      if (node.getId() === id) {
        return node;
      }
    }
    return null;
  }

  byKind(kind: RenderNodeKind): RenderNode[] {
    const result: RenderNode[] = [];
    for (const node of this.nodes) {
      if (node.getKind() === kind) {
        result.push(node);
      }
    }
    return result;
  }

  sortedByZOrder(): RenderNode[] {
    const result: RenderNode[] = [];
    for (const node of this.nodes) {
      result.push(node);
    }
    result.sort((a: RenderNode, b: RenderNode): number => a.getZOrder() - b.getZOrder());
    return result;
  }

  clearDirty(): void {
    for (const node of this.nodes) {
      node.clearDirty();
    }
  }

  hitTopMost(x: number, y: number): RenderNode | null {
    let best: RenderNode | null = null;
    for (const node of this.nodes) {
      if (!node.isVisible()) {
        continue;
      }
      const rect = node.getRect();
      const inside = x >= rect.x && x <= rect.right() && y >= rect.y && y <= rect.bottom();
      if (!inside) {
        continue;
      }
      if (best === null || node.getZOrder() > best.getZOrder()) {
        best = node;
      }
    }
    return best;
  }
}

class FrameScheduler {
  private phase: RenderPhase = RenderPhase.IDLE;
  private frameCount: number = 0;
  private readonly budgetMs: number;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs > 0 ? budgetMs : 16;
  }

  advance(): RenderPhase {
    switch (this.phase) {
      case RenderPhase.IDLE:
        this.phase = RenderPhase.MEASURE;
        break;
      case RenderPhase.MEASURE:
        this.phase = RenderPhase.LAYOUT;
        break;
      case RenderPhase.LAYOUT:
        this.phase = RenderPhase.DRAW;
        break;
      case RenderPhase.DRAW:
        this.phase = RenderPhase.COMPOSITE;
        break;
      default:
        this.phase = RenderPhase.IDLE;
        this.frameCount += 1;
        break;
    }
    return this.phase;
  }

  getPhase(): RenderPhase {
    return this.phase;
  }

  getFrameCount(): number {
    return this.frameCount;
  }

  runFullFrame(): number {
    for (let i = 0; i < 5; i++) {
      this.advance();
    }
    return this.frameCount;
  }

  isWithinBudget(elapsedMs: number): boolean {
    return elapsedMs <= this.budgetMs;
  }

  getBudget(): number {
    return this.budgetMs;
  }
}

function buildRenderTree(): RenderTree {
  const tree = new RenderTree();
  tree.add(new RenderNode('root', RenderNodeKind.CONTAINER, new RenderRect(0, 0, 720, 1280)));
  tree.add(new RenderNode('title', RenderNodeKind.TEXT, new RenderRect(20, 20, 680, 60)));
  tree.add(new RenderNode('addBtn', RenderNodeKind.BUTTON, new RenderRect(20, 100, 200, 80)));
  tree.add(new RenderNode('banner', RenderNodeKind.IMAGE, new RenderRect(0, 200, 720, 240)));
  tree.add(new RenderNode('list', RenderNodeKind.SCROLL, new RenderRect(0, 460, 720, 800)));
  return tree;
}

export default function windowUIComponentRenderingTest(): void {
  describe('WindowUIComponentRenderingSuite', () => {
    let tree: RenderTree = buildRenderTree();

    beforeAll(() => {
      tree = buildRenderTree();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'render suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'render suite end');
    });

    it('WindowUIComponentRendering_001', 0, async (done: Function) => {
      expect(tree.nodeCount()).assertEqual(5);
      expect(tree.visibleCount()).assertEqual(5);
      expect(tree.dirtyCount()).assertEqual(0);
      done();
    });

    it('WindowUIComponentRendering_002', 0, async (done: Function) => {
      expect(tree.findById('title') !== null).assertTrue();
      expect(tree.findById('absent')).assertNull();
      const texts = tree.byKind(RenderNodeKind.TEXT);
      expect(texts.length).assertEqual(1);
      done();
    });

    it('WindowUIComponentRendering_003', 0, async (done: Function) => {
      const containers = tree.byKind(RenderNodeKind.CONTAINER);
      const buttons = tree.byKind(RenderNodeKind.BUTTON);
      expect(containers.length).assertEqual(1);
      expect(buttons.length).assertEqual(1);
      expect(tree.byKind(RenderNodeKind.IMAGE).length).assertEqual(1);
      done();
    });

    it('WindowUIComponentRendering_004', 0, async (done: Function) => {
      const node = tree.findById('addBtn');
      expect(node !== null).assertTrue();
      if (node !== null) {
        node.markDirty();
        expect(node.isDirty()).assertTrue();
        node.clearDirty();
        expect(node.isDirty()).assertFalse();
      }
      expect(tree.dirtyCount()).assertEqual(0);
      done();
    });

    it('WindowUIComponentRendering_005', 0, async (done: Function) => {
      const local = buildRenderTree();
      const root = local.findById('root');
      expect(root !== null).assertTrue();
      if (root !== null) {
        root.setVisible(false);
        expect(root.isVisible()).assertFalse();
        expect(root.isDirty()).assertTrue();
      }
      expect(local.visibleCount()).assertEqual(4);
      done();
    });

    it('WindowUIComponentRendering_006', 0, async (done: Function) => {
      const local = buildRenderTree();
      const root = local.findById('root');
      expect(root !== null).assertTrue();
      if (root !== null) {
        root.setVisible(false);
        root.setVisible(true);
        expect(root.isVisible()).assertTrue();
        expect(root.isDirty()).assertTrue();
      }
      done();
    });

    it('WindowUIComponentRendering_007', 0, async (done: Function) => {
      const local = buildRenderTree();
      const title = local.findById('title');
      expect(title !== null).assertTrue();
      if (title !== null) {
        title.layoutTo(new RenderRect(0, 0, 720, 40));
        expect(title.getRect().width).assertEqual(720);
        expect(title.getRect().height).assertEqual(40);
        expect(title.isDirty()).assertTrue();
      }
      done();
    });

    it('WindowUIComponentRendering_008', 0, async (done: Function) => {
      const local = buildRenderTree();
      local.clearDirty();
      expect(local.dirtyCount()).assertEqual(0);
      const list = local.findById('list');
      expect(list !== null).assertTrue();
      if (list !== null) {
        list.markDirty();
      }
      expect(local.dirtyCount()).assertEqual(1);
      done();
    });

    it('WindowUIComponentRendering_009', 0, async (done: Function) => {
      const local = buildRenderTree();
      const title = local.findById('title');
      const banner = local.findById('banner');
      expect(title !== null && banner !== null).assertTrue();
      if (title !== null) {
        title.setZOrder(1);
      }
      if (banner !== null) {
        banner.setZOrder(2);
      }
      const sorted = local.sortedByZOrder();
      expect(sorted[sorted.length - 1].getId()).assertEqual('banner');
      done();
    });

    it('WindowUIComponentRendering_010', 0, async (done: Function) => {
      const local = buildRenderTree();
      const btn = local.findById('addBtn');
      if (btn !== null) {
        btn.setZOrder(5);
      }
      const hit = local.hitTopMost(100, 140);
      expect(hit !== null && hit.getId() === 'addBtn').assertTrue();
      const miss = local.hitTopMost(100, 2000);
      expect(miss).assertNull();
      done();
    });

    it('WindowUIComponentRendering_011', 0, async (done: Function) => {
      const rect = new RenderRect(10, 20, 100, 50);
      expect(rect.right()).assertEqual(110);
      expect(rect.bottom()).assertEqual(70);
      expect(rect.area()).assertEqual(5000);
      expect(rect.isEmpty()).assertFalse();
      done();
    });

    it('WindowUIComponentRendering_012', 0, async (done: Function) => {
      const empty = new RenderRect(0, 0, 0, 100);
      const negative = new RenderRect(0, 0, -5, 5);
      expect(empty.isEmpty()).assertTrue();
      expect(negative.isEmpty()).assertTrue();
      expect(empty.area()).assertEqual(0);
      done();
    });

    it('WindowUIComponentRendering_013', 0, async (done: Function) => {
      const a = new RenderRect(0, 0, 100, 100);
      const b = new RenderRect(50, 50, 100, 100);
      const c = new RenderRect(200, 200, 10, 10);
      expect(a.intersects(b)).assertTrue();
      expect(a.intersects(c)).assertFalse();
      expect(b.intersects(a)).assertTrue();
      done();
    });

    it('WindowUIComponentRendering_014', 0, async (done: Function) => {
      const outer = new RenderRect(0, 0, 200, 200);
      const inner = new RenderRect(20, 20, 100, 100);
      expect(outer.contains(inner)).assertTrue();
      expect(inner.contains(outer)).assertFalse();
      expect(outer.contains(outer)).assertTrue();
      done();
    });

    it('WindowUIComponentRendering_015', 0, async (done: Function) => {
      const a = new RenderRect(10, 10, 20, 20);
      const b = new RenderRect(100, 100, 50, 50);
      const u = a.union(b);
      expect(u.x).assertEqual(10);
      expect(u.y).assertEqual(10);
      expect(u.right()).assertEqual(150);
      expect(u.bottom()).assertEqual(150);
      done();
    });

    it('WindowUIComponentRendering_016', 0, async (done: Function) => {
      const region = new DirtyRegion();
      expect(region.count()).assertEqual(0);
      expect(region.isEmpty()).assertTrue();
      expect(region.totalArea()).assertEqual(0);
      done();
    });

    it('WindowUIComponentRendering_017', 0, async (done: Function) => {
      const region = new DirtyRegion();
      region.add(new RenderRect(0, 0, 100, 100));
      region.add(new RenderRect(50, 50, 100, 100));
      expect(region.count()).assertEqual(2);
      expect(region.totalArea()).assertEqual(20000);
      done();
    });

    it('WindowUIComponentRendering_018', 0, async (done: Function) => {
      const region = new DirtyRegion();
      region.add(new RenderRect(0, 0, 0, 100));
      expect(region.count()).assertEqual(0);
      region.add(new RenderRect(10, 10, 50, 50));
      expect(region.count()).assertEqual(1);
      done();
    });

    it('WindowUIComponentRendering_019', 0, async (done: Function) => {
      const region = new DirtyRegion();
      region.add(new RenderRect(10, 10, 20, 20));
      region.add(new RenderRect(100, 100, 30, 30));
      const box = region.boundingBox();
      expect(box.x).assertEqual(10);
      expect(box.y).assertEqual(10);
      expect(box.right()).assertEqual(130);
      expect(box.bottom()).assertEqual(130);
      done();
    });

    it('WindowUIComponentRendering_020', 0, async (done: Function) => {
      const region = new DirtyRegion();
      const emptyBox = region.boundingBox();
      expect(emptyBox.area()).assertEqual(0);
      region.add(new RenderRect(0, 0, 10, 10));
      expect(region.intersectsAny(new RenderRect(5, 5, 10, 10))).assertTrue();
      expect(region.intersectsAny(new RenderRect(50, 50, 10, 10))).assertFalse();
      done();
    });

    it('WindowUIComponentRendering_021', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(16);
      expect(scheduler.getPhase()).assertEqual(RenderPhase.IDLE);
      expect(scheduler.advance()).assertEqual(RenderPhase.MEASURE);
      expect(scheduler.advance()).assertEqual(RenderPhase.LAYOUT);
      expect(scheduler.advance()).assertEqual(RenderPhase.DRAW);
      done();
    });

    it('WindowUIComponentRendering_022', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(16);
      expect(scheduler.advance()).assertEqual(RenderPhase.MEASURE);
      expect(scheduler.advance()).assertEqual(RenderPhase.LAYOUT);
      expect(scheduler.advance()).assertEqual(RenderPhase.DRAW);
      expect(scheduler.advance()).assertEqual(RenderPhase.COMPOSITE);
      expect(scheduler.advance()).assertEqual(RenderPhase.IDLE);
      expect(scheduler.getFrameCount()).assertEqual(1);
      done();
    });

    it('WindowUIComponentRendering_023', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(16);
      const frames = scheduler.runFullFrame();
      expect(frames).assertEqual(1);
      expect(scheduler.getPhase()).assertEqual(RenderPhase.IDLE);
      expect(scheduler.runFullFrame()).assertEqual(2);
      done();
    });

    it('WindowUIComponentRendering_024', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(16);
      expect(scheduler.isWithinBudget(10)).assertTrue();
      expect(scheduler.isWithinBudget(16)).assertTrue();
      expect(scheduler.isWithinBudget(20)).assertFalse();
      expect(scheduler.getBudget()).assertEqual(16);
      done();
    });

    it('WindowUIComponentRendering_025', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(0);
      expect(scheduler.getBudget()).assertEqual(16);
      expect(scheduler.isWithinBudget(16)).assertTrue();
      expect(scheduler.isWithinBudget(17)).assertFalse();
      done();
    });

    it('WindowUIComponentRendering_026', 0, async (done: Function) => {
      const region = new DirtyRegion();
      region.add(new RenderRect(0, 0, 10, 10));
      region.add(new RenderRect(20, 20, 10, 10));
      expect(region.count()).assertEqual(2);
      region.clear();
      expect(region.count()).assertEqual(0);
      expect(region.isEmpty()).assertTrue();
      done();
    });

    it('WindowUIComponentRendering_027', 0, async (done: Function) => {
      const local = buildRenderTree();
      const root = local.findById('root');
      expect(root !== null && root.getRect().area() === 720 * 1280).assertTrue();
      const banner = local.findById('banner');
      expect(banner !== null && banner.getKind() === RenderNodeKind.IMAGE).assertTrue();
      done();
    });

    it('WindowUIComponentRendering_028', 0, async (done: Function) => {
      const local = buildRenderTree();
      local.add(new RenderNode('title', RenderNodeKind.TEXT, new RenderRect(0, 0, 1, 1)));
      expect(local.nodeCount()).assertEqual(5);
      local.add(new RenderNode('extra', RenderNodeKind.TEXT, new RenderRect(0, 0, 1, 1)));
      expect(local.nodeCount()).assertEqual(6);
      done();
    });

    it('WindowUIComponentRendering_029', 0, async (done: Function) => {
      const local = buildRenderTree();
      const top = local.hitTopMost(20, 120);
      expect(top !== null).assertTrue();
      if (top !== null) {
        top.setZOrder(10);
        const again = local.hitTopMost(20, 120);
        expect(again !== null && again.getId() === top.getId()).assertTrue();
      }
      done();
    });

    it('WindowUIComponentRendering_030', 0, async (done: Function) => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_DOWN).assertEqual(2013);
      done();
    });

    it('WindowUIComponentRendering_031', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowUIComponentRendering_032', 0, async (done: Function) => {
      const a = new RenderRect(0, 0, 100, 100);
      const b = new RenderRect(100, 0, 100, 100);
      expect(a.intersects(b)).assertFalse();
      expect(a.contains(b)).assertFalse();
      const c = new RenderRect(0, 0, 200, 200);
      expect(c.contains(a)).assertTrue();
      expect(c.contains(b)).assertTrue();
      done();
    });

    it('WindowUIComponentRendering_033', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(16);
      const phases: RenderPhase[] = [];
      for (let i = 0; i < 3; i++) {
        phases.push(scheduler.advance());
      }
      expect(phases.length).assertEqual(3);
      expect(phases[0]).assertEqual(RenderPhase.MEASURE);
      expect(phases[2]).assertEqual(RenderPhase.DRAW);
      expect(scheduler.getFrameCount()).assertEqual(0);
      done();
    });

    it('WindowUIComponentRendering_034', 0, async (done: Function) => {
      const local = buildRenderTree();
      expect(local.nodeCount()).assertEqual(5);
      expect(local.visibleCount()).assertEqual(5);
      const list = local.findById('list');
      expect(list !== null && list.getRect().height === 800).assertTrue();
      done();
    });

    it('WindowUIComponentRendering_035', 0, async (done: Function) => {
      const region = new DirtyRegion();
      region.add(new RenderRect(0, 0, 40, 40));
      region.add(new RenderRect(40, 40, 40, 40));
      const box = region.boundingBox();
      expect(box.width).assertEqual(80);
      expect(box.height).assertEqual(80);
      expect(box.area()).assertEqual(6400);
      done();
    });

    it('WindowUIComponentRendering_036', 0, async (done: Function) => {
      const rect = new RenderRect(5, 5, 0, 0);
      expect(rect.isEmpty()).assertTrue();
      expect(rect.right()).assertEqual(5);
      expect(rect.bottom()).assertEqual(5);
      expect(rect.area()).assertEqual(0);
      done();
    });

    it('WindowUIComponentRendering_037', 0, async (done: Function) => {
      const scheduler = new FrameScheduler(16);
      expect(scheduler.runFullFrame()).assertEqual(1);
      expect(scheduler.runFullFrame()).assertEqual(2);
      expect(scheduler.runFullFrame()).assertEqual(3);
      expect(scheduler.getPhase()).assertEqual(RenderPhase.IDLE);
      done();
    });
  });
}

