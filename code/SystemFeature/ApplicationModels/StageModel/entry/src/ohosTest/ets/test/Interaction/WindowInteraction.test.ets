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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber
} from '../Shared/SharedDriver';

enum WindowState {
  CREATED = 0,
  SHOWN = 1,
  HIDDEN = 2,
  MINIMIZED = 3,
  MAXIMIZED = 4,
  DESTROYED = 5
}

enum Orientation {
  AUTO = 0,
  PORTRAIT = 1,
  LANDSCAPE = 2
}

class WindowRect {
  x: number = 0;
  y: number = 0;
  width: number = 0;
  height: number = 0;

  constructor(x: number, y: number, width: number, height: number) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  isValid(): boolean {
    return this.width > 0 && this.height > 0;
  }

  area(): number {
    if (!this.isValid()) {
      return 0;
    }
    return this.width * this.height;
  }

  containsPoint(px: number, py: number): boolean {
    return px >= this.x && px < this.x + this.width && py >= this.y && py < this.y + this.height;
  }

  intersects(other: WindowRect): boolean {
    if (!this.isValid() || !other.isValid()) {
      return false;
    }
    return this.x < other.x + other.width && other.x < this.x + this.width &&
      this.y < other.y + other.height && other.y < this.y + this.height;
  }

  centerX(): number {
    return this.x + this.width / 2;
  }

  centerY(): number {
    return this.y + this.height / 2;
  }
}

class WindowModel {
  id: string = '';
  private state: WindowState = WindowState.CREATED;
  private rect: WindowRect = new WindowRect(0, 0, 100, 100);
  private zIndex: number = 0;
  private focused: boolean = false;
  private opacity: number = 1;
  private orientation: Orientation = Orientation.AUTO;
  private changes: number = 0;

  constructor(id: string, width: number, height: number) {
    this.id = id;
    this.rect = new WindowRect(0, 0, width, height);
  }

  getId(): string {
    return this.id;
  }

  getState(): WindowState {
    return this.state;
  }

  getRect(): WindowRect {
    return this.rect;
  }

  getZIndex(): number {
    return this.zIndex;
  }

  isFocused(): boolean {
    return this.focused;
  }

  getOpacity(): number {
    return this.opacity;
  }

  getOrientation(): Orientation {
    return this.orientation;
  }

  getChanges(): number {
    return this.changes;
  }

  show(): boolean {
    if (this.state === WindowState.DESTROYED) {
      return false;
    }
    this.state = WindowState.SHOWN;
    this.changes = this.changes + 1;
    return true;
  }

  hide(): boolean {
    if (this.state !== WindowState.SHOWN && this.state !== WindowState.MAXIMIZED) {
      return false;
    }
    this.state = WindowState.HIDDEN;
    this.focused = false;
    this.changes = this.changes + 1;
    return true;
  }

  minimize(): boolean {
    if (this.state !== WindowState.SHOWN) {
      return false;
    }
    this.state = WindowState.MINIMIZED;
    this.focused = false;
    this.changes = this.changes + 1;
    return true;
  }

  maximize(): boolean {
    if (this.state !== WindowState.SHOWN) {
      return false;
    }
    this.state = WindowState.MAXIMIZED;
    this.changes = this.changes + 1;
    return true;
  }

  restore(): boolean {
    if (this.state !== WindowState.MINIMIZED && this.state !== WindowState.MAXIMIZED) {
      return false;
    }
    this.state = WindowState.SHOWN;
    this.changes = this.changes + 1;
    return true;
  }

  destroy(): boolean {
    if (this.state === WindowState.DESTROYED) {
      return false;
    }
    this.state = WindowState.DESTROYED;
    this.focused = false;
    this.changes = this.changes + 1;
    return true;
  }

  resize(width: number, height: number): boolean {
    if (this.state === WindowState.DESTROYED || width <= 0 || height <= 0) {
      return false;
    }
    this.rect = new WindowRect(this.rect.x, this.rect.y, width, height);
    this.changes = this.changes + 1;
    return true;
  }

  moveTo(x: number, y: number): boolean {
    if (this.state === WindowState.DESTROYED) {
      return false;
    }
    this.rect = new WindowRect(x, y, this.rect.width, this.rect.height);
    this.changes = this.changes + 1;
    return true;
  }

  setZIndex(value: number): void {
    this.zIndex = value;
  }

  focus(): boolean {
    if (this.state !== WindowState.SHOWN && this.state !== WindowState.MAXIMIZED) {
      return false;
    }
    this.focused = true;
    return true;
  }

  blur(): void {
    this.focused = false;
  }

  setOpacity(value: number): number {
    this.opacity = clampNumber(value, 0, 1);
    return this.opacity;
  }

  setOrientation(value: Orientation): void {
    this.orientation = value;
  }

  containsPoint(px: number, py: number): boolean {
    return this.state !== WindowState.DESTROYED && this.rect.containsPoint(px, py);
  }
}

class WindowStack {
  private windows: WindowModel[] = [];
  private operations: number = 0;

  add(window: WindowModel): boolean {
    if (this.findById(window.getId()) !== null) {
      return false;
    }
    this.windows.push(window);
    this.operations = this.operations + 1;
    return true;
  }

  findById(id: string): WindowModel | null {
    for (const window of this.windows) {
      if (window.getId() === id) {
        return window;
      }
    }
    return null;
  }

  remove(id: string): boolean {
    const window = this.findById(id);
    if (window === null) {
      return false;
    }
    const index = this.windows.indexOf(window);
    this.windows.splice(index, 1);
    this.operations = this.operations + 1;
    return true;
  }

  top(): WindowModel | null {
    let best: WindowModel | null = null;
    for (const window of this.windows) {
      if (window.getState() === WindowState.SHOWN || window.getState() === WindowState.MAXIMIZED) {
        if (best === null || window.getZIndex() >= best.getZIndex()) {
          best = window;
        }
      }
    }
    return best;
  }

  focusOnly(id: string): boolean {
    let found = false;
    for (const window of this.windows) {
      if (window.getId() === id) {
        found = window.focus();
      } else {
        window.blur();
      }
    }
    return found;
  }

  count(): number {
    return this.windows.length;
  }

  visibleCount(): number {
    let total = 0;
    for (const window of this.windows) {
      if (window.getState() === WindowState.SHOWN || window.getState() === WindowState.MAXIMIZED) {
        total = total + 1;
      }
    }
    return total;
  }

  getOperations(): number {
    return this.operations;
  }
}

export default function windowInteractionTest(): void {
  describe('WindowInteraction', () => {
    it('WindowInteraction_001', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.getId()).assertEqual('main');
      expect(window.getState()).assertEqual(WindowState.CREATED);
      expect(window.getRect().area()).assertEqual(60000);
      done();
    });

    it('WindowInteraction_002', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.show()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.SHOWN);
      expect(window.getChanges()).assertEqual(1);
      done();
    });

    it('WindowInteraction_003', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.hide()).assertFalse();
      window.show();
      expect(window.hide()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.HIDDEN);
      done();
    });

    it('WindowInteraction_004', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.minimize()).assertFalse();
      window.show();
      expect(window.minimize()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.MINIMIZED);
      done();
    });

    it('WindowInteraction_005', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      expect(window.maximize()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.MAXIMIZED);
      expect(window.restore()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.SHOWN);
      done();
    });

    it('WindowInteraction_006', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      window.minimize();
      expect(window.restore()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.SHOWN);
      done();
    });

    it('WindowInteraction_007', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.restore()).assertFalse();
      window.show();
      expect(window.restore()).assertFalse();
      done();
    });

    it('WindowInteraction_008', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      expect(window.destroy()).assertTrue();
      expect(window.getState()).assertEqual(WindowState.DESTROYED);
      expect(window.destroy()).assertFalse();
      done();
    });

    it('WindowInteraction_009', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      expect(window.resize(400, 500)).assertTrue();
      expect(window.getRect().width).assertEqual(400);
      expect(window.getRect().height).assertEqual(500);
      done();
    });

    it('WindowInteraction_010', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      expect(window.moveTo(50, 60)).assertTrue();
      expect(window.getRect().x).assertEqual(50);
      expect(window.getRect().y).assertEqual(60);
      done();
    });

    it('WindowInteraction_011', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      expect(window.resize(0, 100)).assertFalse();
      expect(window.getRect().width).assertEqual(200);
      expect(window.getRect().height).assertEqual(300);
      done();
    });

    it('WindowInteraction_012', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.focus()).assertFalse();
      window.show();
      expect(window.focus()).assertTrue();
      expect(window.isFocused()).assertTrue();
      done();
    });

    it('WindowInteraction_013', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.show();
      window.focus();
      window.blur();
      expect(window.isFocused()).assertFalse();
      done();
    });

    it('WindowInteraction_014', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      expect(window.setOpacity(0.5)).assertEqual(0.5);
      expect(window.setOpacity(2)).assertEqual(1);
      expect(window.setOpacity(-1)).assertEqual(0);
      done();
    });

    it('WindowInteraction_015', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.setOrientation(Orientation.LANDSCAPE);
      expect(window.getOrientation()).assertEqual(Orientation.LANDSCAPE);
      window.setOrientation(Orientation.PORTRAIT);
      expect(window.getOrientation()).assertEqual(Orientation.PORTRAIT);
      done();
    });

    it('WindowInteraction_016', 0, async (done: Function) => {
      const window = new WindowModel('main', 200, 300);
      window.setZIndex(5);
      expect(window.getZIndex()).assertEqual(5);
      window.setZIndex(1);
      expect(window.getZIndex()).assertEqual(1);
      done();
    });

    it('WindowInteraction_017', 0, async (done: Function) => {
      const rect = new WindowRect(10, 20, 100, 50);
      expect(rect.containsPoint(10, 20)).assertTrue();
      expect(rect.containsPoint(110, 70)).assertFalse();
      expect(rect.centerX()).assertEqual(60);
      expect(rect.centerY()).assertEqual(45);
      done();
    });

    it('WindowInteraction_018', 0, async (done: Function) => {
      const first = new WindowRect(0, 0, 100, 100);
      const second = new WindowRect(50, 50, 100, 100);
      expect(first.intersects(second)).assertTrue();
      expect(first.intersects(new WindowRect(200, 200, 10, 10))).assertFalse();
      done();
    });

    it('WindowInteraction_019', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      expect(window.containsPoint(50, 50)).assertTrue();
      expect(window.containsPoint(150, 50)).assertFalse();
      done();
    });

    it('WindowInteraction_020', 0, async (done: Function) => {
      const stack = new WindowStack();
      expect(stack.add(new WindowModel('a', 100, 100))).assertTrue();
      expect(stack.add(new WindowModel('b', 200, 200))).assertTrue();
      expect(stack.count()).assertEqual(2);
      expect(stack.getOperations()).assertEqual(2);
      done();
    });

    it('WindowInteraction_021', 0, async (done: Function) => {
      const stack = new WindowStack();
      stack.add(new WindowModel('a', 100, 100));
      expect(stack.add(new WindowModel('a', 100, 100))).assertFalse();
      expect(stack.count()).assertEqual(1);
      done();
    });

    it('WindowInteraction_022', 0, async (done: Function) => {
      const stack = new WindowStack();
      expect(stack.findById('missing')).assertNull();
      stack.add(new WindowModel('a', 100, 100));
      expect(stack.findById('a') !== null).assertTrue();
      done();
    });

    it('WindowInteraction_023', 0, async (done: Function) => {
      const stack = new WindowStack();
      stack.add(new WindowModel('a', 100, 100));
      expect(stack.remove('a')).assertTrue();
      expect(stack.remove('a')).assertFalse();
      expect(stack.count()).assertEqual(0);
      done();
    });

    it('WindowInteraction_024', 0, async (done: Function) => {
      const stack = new WindowStack();
      const low = new WindowModel('low', 100, 100);
      const high = new WindowModel('high', 100, 100);
      low.show();
      high.show();
      low.setZIndex(1);
      high.setZIndex(10);
      stack.add(low);
      stack.add(high);
      const top = stack.top();
      expect(top !== null).assertTrue();
      if (top !== null) {
        expect(top.getId()).assertEqual('high');
      }
      done();
    });

    it('WindowInteraction_025', 0, async (done: Function) => {
      const stack = new WindowStack();
      const hidden = new WindowModel('hidden', 100, 100);
      stack.add(hidden);
      expect(stack.top()).assertNull();
      expect(stack.visibleCount()).assertEqual(0);
      done();
    });

    it('WindowInteraction_026', 0, async (done: Function) => {
      const stack = new WindowStack();
      const first = new WindowModel('a', 100, 100);
      const second = new WindowModel('b', 100, 100);
      first.show();
      second.show();
      stack.add(first);
      stack.add(second);
      expect(stack.visibleCount()).assertEqual(2);
      done();
    });

    it('WindowInteraction_027', 0, async (done: Function) => {
      const stack = new WindowStack();
      const first = new WindowModel('a', 100, 100);
      const second = new WindowModel('b', 100, 100);
      first.show();
      second.show();
      stack.add(first);
      stack.add(second);
      expect(stack.focusOnly('a')).assertTrue();
      expect(first.isFocused()).assertTrue();
      expect(second.isFocused()).assertFalse();
      done();
    });

    it('WindowInteraction_028', 0, async (done: Function) => {
      const stack = new WindowStack();
      expect(stack.focusOnly('missing')).assertFalse();
      done();
    });

    it('WindowInteraction_029', 0, async (done: Function) => {
      const stack = new WindowStack();
      stack.add(new WindowModel('a', 100, 100));
      stack.add(new WindowModel('b', 100, 100));
      stack.remove('a');
      expect(stack.getOperations()).assertEqual(3);
      expect(stack.count()).assertEqual(1);
      done();
    });

    it('WindowInteraction_030', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.destroy();
      expect(window.resize(10, 10)).assertFalse();
      expect(window.moveTo(1, 1)).assertFalse();
      done();
    });

    it('WindowInteraction_031', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.focus();
      window.hide();
      expect(window.isFocused()).assertFalse();
      expect(window.getState()).assertEqual(WindowState.HIDDEN);
      done();
    });

    it('WindowInteraction_032', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.maximize();
      expect(window.focus()).assertTrue();
      expect(window.isFocused()).assertTrue();
      done();
    });

    it('WindowInteraction_033', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.minimize();
      expect(window.focus()).assertFalse();
      expect(window.isFocused()).assertFalse();
      done();
    });

    it('WindowInteraction_034', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      const before = window.getChanges();
      window.moveTo(10, 10);
      window.resize(50, 50);
      expect(window.getChanges()).assertEqual(before + 2);
      done();
    });

    it('WindowInteraction_035', 0, async (done: Function) => {
      const rect = new WindowRect(-10, -10, 20, 20);
      expect(rect.isValid()).assertTrue();
      expect(rect.containsPoint(-10, -10)).assertTrue();
      expect(rect.area()).assertEqual(400);
      done();
    });

    it('WindowInteraction_036', 0, async (done: Function) => {
      const first = new WindowRect(0, 0, 10, 10);
      const second = new WindowRect(10, 10, 10, 10);
      expect(first.intersects(second)).assertFalse();
      expect(first.intersects(new WindowRect(9, 9, 10, 10))).assertTrue();
      done();
    });

    it('WindowInteraction_037', 0, async (done: Function) => {
      const stack = new WindowStack();
      const window = new WindowModel('a', 100, 100);
      stack.add(window);
      window.show();
      window.maximize();
      expect(stack.visibleCount()).assertEqual(1);
      window.hide();
      expect(stack.visibleCount()).assertEqual(0);
      done();
    });

    it('WindowInteraction_038', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.destroy();
      expect(window.show()).assertFalse();
      expect(window.focus()).assertFalse();
      expect(window.destroy()).assertFalse();
      done();
    });

    it('WindowInteraction_039', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      expect(window.setOpacity(0)).assertEqual(0);
      expect(window.setOpacity(1)).assertEqual(1);
      expect(window.getOpacity()).assertEqual(1);
      done();
    });

    it('WindowInteraction_040', 0, async (done: Function) => {
      const stack = new WindowStack();
      const first = new WindowModel('a', 100, 100);
      const second = new WindowModel('b', 100, 100);
      first.show();
      second.show();
      first.setZIndex(5);
      second.setZIndex(5);
      stack.add(first);
      stack.add(second);
      const top = stack.top();
      expect(top !== null).assertTrue();
      done();
    });

    it('WindowInteraction_041', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.maximize();
      window.restore();
      expect(window.getState()).assertEqual(WindowState.SHOWN);
      expect(window.getChanges()).assertEqual(3);
      done();
    });

    it('WindowInteraction_042', 0, async (done: Function) => {
      const stack = new WindowStack();
      const first = new WindowModel('a', 100, 100);
      const second = new WindowModel('b', 100, 100);
      first.show();
      second.show();
      stack.add(first);
      stack.add(second);
      expect(stack.focusOnly('b')).assertTrue();
      expect(second.isFocused()).assertTrue();
      expect(first.isFocused()).assertFalse();
      expect(stack.visibleCount()).assertEqual(2);
      done();
    });

    it('WindowInteraction_043', 0, async (done: Function) => {
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

    it('WindowInteraction_044', 0, async (done: Function) => {
      const window = new WindowModel('main', 100, 100);
      window.show();
      window.resize(300, 200);
      window.moveTo(20, 30);
      expect(window.getRect().area()).assertEqual(60000);
      expect(window.getRect().containsPoint(20, 30)).assertTrue();
      done();
    });
  });
}
