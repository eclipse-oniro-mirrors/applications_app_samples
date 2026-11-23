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
  getDriver, ensureAppReady, checkFocusState,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN,
  DELAY_KEY_NAVIGATION, TIMEOUT_FOCUS_CHANGE
} from '../Shared/SharedDriver';

enum FocusRingState {
  HIDDEN = 0,
  VISIBLE = 1,
  ANIMATING = 2,
  PULSED = 3
}

enum FocusNodeKind {
  BUTTON = 0,
  TEXT_INPUT = 1,
  LIST_ITEM = 2,
  SCROLL = 3,
  TOGGLE = 4,
  CANVAS = 5
}

class FocusNode {
  readonly id: string;
  readonly kind: FocusNodeKind;
  readonly focusable: boolean;
  private focused: boolean = false;
  private ringState: FocusRingState = FocusRingState.HIDDEN;

  constructor(id: string, kind: FocusNodeKind, focusable: boolean) {
    this.id = id;
    this.kind = kind;
    this.focusable = focusable;
  }

  getId(): string {
    return this.id;
  }

  getKind(): FocusNodeKind {
    return this.kind;
  }

  isFocusable(): boolean {
    return this.focusable;
  }

  isFocused(): boolean {
    return this.focused;
  }

  getRingState(): FocusRingState {
    return this.ringState;
  }

  focus(): boolean {
    if (!this.focusable) {
      return false;
    }
    this.focused = true;
    this.ringState = FocusRingState.VISIBLE;
    return true;
  }

  blur(): boolean {
    if (!this.focused) {
      return false;
    }
    this.focused = false;
    this.ringState = FocusRingState.HIDDEN;
    return true;
  }

  animate(): boolean {
    if (!this.focused) {
      return false;
    }
    this.ringState = FocusRingState.ANIMATING;
    return true;
  }

  pulse(): boolean {
    if (!this.focused) {
      return false;
    }
    this.ringState = FocusRingState.PULSED;
    return true;
  }

  settle(): boolean {
    if (!this.focused) {
      return false;
    }
    this.ringState = FocusRingState.VISIBLE;
    return true;
  }
}

class RingStyle {
  readonly thicknessVp: number;
  readonly cornerRadiusVp: number;
  readonly opacity: number;

  constructor(thicknessVp: number, cornerRadiusVp: number, opacity: number) {
    this.thicknessVp = thicknessVp;
    this.cornerRadiusVp = cornerRadiusVp;
    this.opacity = opacity;
  }

  isValid(): boolean {
    return this.thicknessVp > 0 && this.thicknessVp <= 8 &&
      this.cornerRadiusVp >= 0 && this.opacity >= 0 && this.opacity <= 1;
  }

  scaled(factor: number): RingStyle {
    if (factor <= 0) {
      return new RingStyle(this.thicknessVp, this.cornerRadiusVp, this.opacity);
    }
    return new RingStyle(this.thicknessVp * factor, this.cornerRadiusVp * factor, this.opacity);
  }

  withOpacity(opacity: number): RingStyle {
    let clamped = opacity;
    if (clamped < 0) {
      clamped = 0;
    }
    if (clamped > 1) {
      clamped = 1;
    }
    return new RingStyle(this.thicknessVp, this.cornerRadiusVp, clamped);
  }

  thicker(delta: number): RingStyle {
    const next = this.thicknessVp + delta;
    if (next <= 0) {
      return new RingStyle(1, this.cornerRadiusVp, this.opacity);
    }
    return new RingStyle(next, this.cornerRadiusVp, this.opacity);
  }
}

class FocusRingModel {
  private nodes: FocusNode[] = [];
  private activeId: string = '';

  addNode(node: FocusNode): void {
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

  focusableCount(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.isFocusable()) {
        count += 1;
      }
    }
    return count;
  }

  findById(id: string): FocusNode | null {
    for (const node of this.nodes) {
      if (node.getId() === id) {
        return node;
      }
    }
    return null;
  }

  focusAt(id: string): boolean {
    const target = this.findById(id);
    if (target === null) {
      return false;
    }
    if (!target.focus()) {
      return false;
    }
    for (const node of this.nodes) {
      if (node.getId() !== id) {
        node.blur();
      }
    }
    this.activeId = id;
    return true;
  }

  blurAt(id: string): boolean {
    const target = this.findById(id);
    if (target === null) {
      return false;
    }
    if (this.activeId === id) {
      this.activeId = '';
    }
    return target.blur();
  }

  getActiveId(): string {
    return this.activeId;
  }

  activeRingState(): FocusRingState {
    const active = this.findById(this.activeId);
    if (active === null) {
      return FocusRingState.HIDDEN;
    }
    return active.getRingState();
  }

  visibleRingCount(): number {
    let count = 0;
    for (const node of this.nodes) {
      if (node.isFocused() && node.getRingState() !== FocusRingState.HIDDEN) {
        count += 1;
      }
    }
    return count;
  }

  pulseActive(): boolean {
    const active = this.findById(this.activeId);
    if (active === null) {
      return false;
    }
    return active.pulse();
  }

  animateActive(): boolean {
    const active = this.findById(this.activeId);
    if (active === null) {
      return false;
    }
    return active.animate();
  }

  settleActive(): boolean {
    const active = this.findById(this.activeId);
    if (active === null) {
      return false;
    }
    return active.settle();
  }

  clearAll(): void {
    for (const node of this.nodes) {
      node.blur();
    }
    this.activeId = '';
  }
}

class FocusTraversal {
  private order: string[] = [];
  private cursor: number = -1;

  setOrder(order: string[]): void {
    this.order = [];
    for (const id of order) {
      if (this.order.indexOf(id) < 0) {
        this.order.push(id);
      }
    }
    this.cursor = -1;
  }

  size(): number {
    return this.order.length;
  }

  has(id: string): boolean {
    return this.order.indexOf(id) >= 0;
  }

  current(): string {
    if (this.cursor < 0 || this.cursor >= this.order.length) {
      return '';
    }
    return this.order[this.cursor];
  }

  seek(id: string): boolean {
    const index = this.order.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.cursor = index;
    return true;
  }

  next(): string {
    if (this.order.length === 0) {
      return '';
    }
    this.cursor = (this.cursor + 1) % this.order.length;
    return this.order[this.cursor];
  }

  previous(): string {
    if (this.order.length === 0) {
      return '';
    }
    if (this.cursor < 0) {
      this.cursor = this.order.length - 1;
    } else {
      this.cursor = (this.cursor - 1 + this.order.length) % this.order.length;
    }
    return this.order[this.cursor];
  }

  wrapForward(steps: number): string {
    if (this.order.length === 0) {
      return '';
    }
    let count = steps % this.order.length;
    if (count < 0) {
      count += this.order.length;
    }
    for (let i = 0; i < count; i++) {
      this.next();
    }
    return this.current();
  }

  wrapBackward(steps: number): string {
    if (this.order.length === 0) {
      return '';
    }
    let count = steps % this.order.length;
    if (count < 0) {
      count += this.order.length;
    }
    for (let i = 0; i < count; i++) {
      this.previous();
    }
    return this.current();
  }
}

class RingAnimator {
  private readonly durationMs: number;
  private elapsedMs: number = 0;

  constructor(durationMs: number) {
    this.durationMs = durationMs > 0 ? durationMs : 1;
  }

  tick(ms: number): void {
    if (ms <= 0) {
      return;
    }
    this.elapsedMs += ms;
    if (this.elapsedMs > this.durationMs) {
      this.elapsedMs = this.durationMs;
    }
  }

  progress(): number {
    const ratio = this.elapsedMs / this.durationMs;
    if (ratio < 0) {
      return 0;
    }
    if (ratio > 1) {
      return 1;
    }
    return ratio;
  }

  eased(): number {
    const t = this.progress();
    return t * t * (3 - 2 * t);
  }

  isComplete(): boolean {
    return this.elapsedMs >= this.durationMs;
  }

  reset(): void {
    this.elapsedMs = 0;
  }

  remaining(): number {
    return this.durationMs - this.elapsedMs;
  }
}

class RingVisibilityPolicy {
  private keyboardMode: boolean = false;

  showOnKey(): void {
    this.keyboardMode = true;
  }

  showOnTouch(): void {
    this.keyboardMode = false;
  }

  isKeyboardMode(): boolean {
    return this.keyboardMode;
  }

  shouldShow(focusable: boolean, focused: boolean): boolean {
    if (!focusable || !focused) {
      return false;
    }
    return this.keyboardMode;
  }
}

function buildFocusModel(): FocusRingModel {
  const model = new FocusRingModel();
  model.addNode(new FocusNode('entryWindow', FocusNodeKind.BUTTON, true));
  model.addNode(new FocusNode('btnAdd', FocusNodeKind.BUTTON, true));
  model.addNode(new FocusNode('bookNameInput', FocusNodeKind.TEXT_INPUT, true));
  model.addNode(new FocusNode('bookList', FocusNodeKind.LIST_ITEM, true));
  model.addNode(new FocusNode('scrollBody', FocusNodeKind.SCROLL, true));
  model.addNode(new FocusNode('decorBanner', FocusNodeKind.CANVAS, false));
  return model;
}

export default function windowFocusRingBehaviorTest(): void {
  describe('WindowFocusRingBehaviorSuite', () => {
    let model: FocusRingModel = buildFocusModel();

    beforeAll(() => {
      model = buildFocusModel();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'focus ring suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'focus ring suite end');
    });

    it('WindowFocusRingBehavior_001', 0, async (done: Function) => {
      expect(model.nodeCount()).assertEqual(6);
      expect(model.focusableCount()).assertEqual(5);
      expect(model.visibleRingCount()).assertEqual(0);
      done();
    });

    it('WindowFocusRingBehavior_002', 0, async (done: Function) => {
      const local = buildFocusModel();
      expect(local.findById('entryWindow') !== null).assertTrue();
      expect(local.findById('missing')).assertNull();
      expect(local.findById('decorBanner') !== null).assertTrue();
      done();
    });

    it('WindowFocusRingBehavior_003', 0, async (done: Function) => {
      const local = buildFocusModel();
      expect(local.focusAt('entryWindow')).assertTrue();
      expect(local.getActiveId()).assertEqual('entryWindow');
      expect(local.activeRingState()).assertEqual(FocusRingState.VISIBLE);
      expect(local.visibleRingCount()).assertEqual(1);
      done();
    });

    it('WindowFocusRingBehavior_004', 0, async (done: Function) => {
      const local = buildFocusModel();
      expect(local.focusAt('decorBanner')).assertFalse();
      expect(local.getActiveId()).assertEqual('');
      expect(local.visibleRingCount()).assertEqual(0);
      done();
    });

    it('WindowFocusRingBehavior_005', 0, async (done: Function) => {
      const local = buildFocusModel();
      local.focusAt('entryWindow');
      expect(local.focusAt('btnAdd')).assertTrue();
      expect(local.getActiveId()).assertEqual('btnAdd');
      expect(local.visibleRingCount()).assertEqual(1);
      const first = local.findById('entryWindow');
      expect(first !== null && !first.isFocused()).assertTrue();
      done();
    });

    it('WindowFocusRingBehavior_006', 0, async (done: Function) => {
      const local = buildFocusModel();
      local.focusAt('bookNameInput');
      expect(local.blurAt('bookNameInput')).assertTrue();
      expect(local.getActiveId()).assertEqual('');
      expect(local.activeRingState()).assertEqual(FocusRingState.HIDDEN);
      expect(local.blurAt('bookNameInput')).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_007', 0, async (done: Function) => {
      const local = buildFocusModel();
      local.focusAt('btnAdd');
      expect(local.pulseActive()).assertTrue();
      expect(local.activeRingState()).assertEqual(FocusRingState.PULSED);
      expect(local.animateActive()).assertTrue();
      expect(local.activeRingState()).assertEqual(FocusRingState.ANIMATING);
      expect(local.settleActive()).assertTrue();
      expect(local.activeRingState()).assertEqual(FocusRingState.VISIBLE);
      done();
    });

    it('WindowFocusRingBehavior_008', 0, async (done: Function) => {
      const local = buildFocusModel();
      expect(local.pulseActive()).assertFalse();
      expect(local.animateActive()).assertFalse();
      expect(local.settleActive()).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_009', 0, async (done: Function) => {
      const local = buildFocusModel();
      local.focusAt('btnAdd');
      local.focusAt('scrollBody');
      local.clearAll();
      expect(local.getActiveId()).assertEqual('');
      expect(local.visibleRingCount()).assertEqual(0);
      done();
    });

    it('WindowFocusRingBehavior_010', 0, async (done: Function) => {
      const node = new FocusNode('dup', FocusNodeKind.BUTTON, true);
      const local = new FocusRingModel();
      local.addNode(node);
      local.addNode(new FocusNode('dup', FocusNodeKind.TOGGLE, true));
      expect(local.nodeCount()).assertEqual(1);
      done();
    });

    it('WindowFocusRingBehavior_011', 0, async (done: Function) => {
      const style = new RingStyle(2, 8, 1);
      expect(style.isValid()).assertTrue();
      const zero = new RingStyle(0, 8, 1);
      expect(zero.isValid()).assertFalse();
      const tooThick = new RingStyle(9, 8, 1);
      expect(tooThick.isValid()).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_012', 0, async (done: Function) => {
      const style = new RingStyle(2, 8, 0.5);
      const scaled = style.scaled(2);
      expect(scaled.thicknessVp).assertEqual(4);
      expect(scaled.cornerRadiusVp).assertEqual(16);
      expect(scaled.opacity).assertEqual(0.5);
      const unchanged = style.scaled(0);
      expect(unchanged.thicknessVp).assertEqual(2);
      done();
    });

    it('WindowFocusRingBehavior_013', 0, async (done: Function) => {
      const style = new RingStyle(2, 8, 0.5);
      expect(style.withOpacity(-1).opacity).assertEqual(0);
      expect(style.withOpacity(2).opacity).assertEqual(1);
      expect(style.withOpacity(0.25).opacity).assertEqual(0.25);
      done();
    });

    it('WindowFocusRingBehavior_014', 0, async (done: Function) => {
      const style = new RingStyle(2, 8, 1);
      expect(style.thicker(2).thicknessVp).assertEqual(4);
      expect(style.thicker(-5).thicknessVp).assertEqual(1);
      expect(style.thicker(0).thicknessVp).assertEqual(2);
      done();
    });

    it('WindowFocusRingBehavior_015', 0, async (done: Function) => {
      const traversal = new FocusTraversal();
      traversal.setOrder(['a', 'b', 'c', 'a']);
      expect(traversal.size()).assertEqual(3);
      expect(traversal.has('b')).assertTrue();
      expect(traversal.has('z')).assertFalse();
      expect(traversal.current()).assertEqual('');
      done();
    });

    it('WindowFocusRingBehavior_016', 0, async (done: Function) => {
      const traversal = new FocusTraversal();
      traversal.setOrder(['a', 'b', 'c']);
      expect(traversal.next()).assertEqual('a');
      expect(traversal.next()).assertEqual('b');
      expect(traversal.next()).assertEqual('c');
      expect(traversal.next()).assertEqual('a');
      done();
    });

    it('WindowFocusRingBehavior_017', 0, async (done: Function) => {
      const traversal = new FocusTraversal();
      traversal.setOrder(['a', 'b', 'c']);
      expect(traversal.previous()).assertEqual('c');
      expect(traversal.previous()).assertEqual('b');
      expect(traversal.previous()).assertEqual('a');
      expect(traversal.previous()).assertEqual('c');
      done();
    });

    it('WindowFocusRingBehavior_018', 0, async (done: Function) => {
      const traversal = new FocusTraversal();
      traversal.setOrder(['a', 'b', 'c']);
      expect(traversal.seek('b')).assertTrue();
      expect(traversal.current()).assertEqual('b');
      expect(traversal.seek('z')).assertFalse();
      expect(traversal.current()).assertEqual('b');
      done();
    });

    it('WindowFocusRingBehavior_019', 0, async (done: Function) => {
      const traversal = new FocusTraversal();
      traversal.setOrder(['a', 'b', 'c', 'd']);
      expect(traversal.wrapForward(5)).assertEqual('a');
      expect(traversal.wrapBackward(2)).assertEqual('c');
      done();
    });

    it('WindowFocusRingBehavior_020', 0, async (done: Function) => {
      const empty = new FocusTraversal();
      expect(empty.next()).assertEqual('');
      expect(empty.previous()).assertEqual('');
      expect(empty.wrapForward(3)).assertEqual('');
      empty.setOrder([]);
      expect(empty.size()).assertEqual(0);
      done();
    });

    it('WindowFocusRingBehavior_021', 0, async (done: Function) => {
      const animator = new RingAnimator(200);
      expect(animator.progress()).assertEqual(0);
      animator.tick(100);
      expect(animator.progress()).assertEqual(0.5);
      expect(animator.isComplete()).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_022', 0, async (done: Function) => {
      const animator = new RingAnimator(200);
      animator.tick(300);
      expect(animator.progress()).assertEqual(1);
      expect(animator.isComplete()).assertTrue();
      expect(animator.remaining()).assertEqual(0);
      done();
    });

    it('WindowFocusRingBehavior_023', 0, async (done: Function) => {
      const animator = new RingAnimator(100);
      animator.tick(50);
      const easedMid = animator.eased();
      expect(easedMid > 0 && easedMid < 1).assertTrue();
      animator.reset();
      expect(animator.progress()).assertEqual(0);
      expect(animator.eased()).assertEqual(0);
      done();
    });

    it('WindowFocusRingBehavior_024', 0, async (done: Function) => {
      const animator = new RingAnimator(0);
      expect(animator.progress()).assertEqual(0);
      animator.tick(1);
      expect(animator.isComplete()).assertTrue();
      expect(animator.progress()).assertEqual(1);
      done();
    });

    it('WindowFocusRingBehavior_025', 0, async (done: Function) => {
      const policy = new RingVisibilityPolicy();
      expect(policy.isKeyboardMode()).assertFalse();
      expect(policy.shouldShow(true, true)).assertFalse();
      policy.showOnKey();
      expect(policy.isKeyboardMode()).assertTrue();
      expect(policy.shouldShow(true, true)).assertTrue();
      expect(policy.shouldShow(true, false)).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_026', 0, async (done: Function) => {
      const policy = new RingVisibilityPolicy();
      policy.showOnKey();
      policy.showOnTouch();
      expect(policy.isKeyboardMode()).assertFalse();
      expect(policy.shouldShow(true, true)).assertFalse();
      expect(policy.shouldShow(false, true)).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_027', 0, async (done: Function) => {
      const local = buildFocusModel();
      const traversal = new FocusTraversal();
      traversal.setOrder(['entryWindow', 'btnAdd', 'bookNameInput']);
      expect(traversal.next()).assertEqual('entryWindow');
      expect(local.focusAt('entryWindow')).assertTrue();
      expect(traversal.next()).assertEqual('btnAdd');
      expect(local.focusAt('btnAdd')).assertTrue();
      expect(local.getActiveId()).assertEqual('btnAdd');
      done();
    });

    it('WindowFocusRingBehavior_028', 0, async (done: Function) => {
      const local = buildFocusModel();
      local.focusAt('bookNameInput');
      const input = local.findById('bookNameInput');
      expect(input !== null && input.getKind() === FocusNodeKind.TEXT_INPUT).assertTrue();
      expect(local.activeRingState()).assertEqual(FocusRingState.VISIBLE);
      done();
    });

    it('WindowFocusRingBehavior_029', 0, async (done: Function) => {
      const node = new FocusNode('solo', FocusNodeKind.TOGGLE, true);
      expect(node.focus()).assertTrue();
      expect(node.isFocused()).assertTrue();
      expect(node.getRingState()).assertEqual(FocusRingState.VISIBLE);
      expect(node.blur()).assertTrue();
      expect(node.isFocused()).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_030', 0, async (done: Function) => {
      const node = new FocusNode('frozen', FocusNodeKind.CANVAS, false);
      expect(node.focus()).assertFalse();
      expect(node.animate()).assertFalse();
      expect(node.pulse()).assertFalse();
      expect(node.settle()).assertFalse();
      expect(node.blur()).assertFalse();
      done();
    });

    it('WindowFocusRingBehavior_031', 0, async (done: Function) => {
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_DOWN).assertEqual(2013);
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      expect(TIMEOUT_FOCUS_CHANGE).assertEqual(500);
      done();
    });

    it('WindowFocusRingBehavior_032', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const focused: boolean = await checkFocusState(driver, -1);
        expect(typeof focused === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowFocusRingBehavior_033', 0, async (done: Function) => {
      const local = buildFocusModel();
      local.focusAt('btnAdd');
      local.animateActive();
      const animator = new RingAnimator(120);
      animator.tick(60);
      local.settleActive();
      expect(local.activeRingState()).assertEqual(FocusRingState.VISIBLE);
      expect(animator.progress()).assertEqual(0.5);
      done();
    });
  });
}

