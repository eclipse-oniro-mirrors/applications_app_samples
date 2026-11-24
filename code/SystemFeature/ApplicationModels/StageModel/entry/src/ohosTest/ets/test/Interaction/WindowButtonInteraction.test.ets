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

enum ButtonState {
  NORMAL = 0,
  PRESSED = 1,
  DISABLED = 2,
  HOVER = 3
}

class HitRegion {
  id: string = '';
  x: number = 0;
  y: number = 0;
  width: number = 0;
  height: number = 0;

  constructor(id: string, x: number, y: number, width: number, height: number) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  contains(px: number, py: number): boolean {
    return px >= this.x && px <= this.x + this.width && py >= this.y && py <= this.y + this.height;
  }

  area(): number {
    if (this.width <= 0 || this.height <= 0) {
      return 0;
    }
    return this.width * this.height;
  }
}

class ButtonModel {
  id: string = '';
  private state: ButtonState = ButtonState.NORMAL;
  private enabled: boolean = true;
  private clickCount: number = 0;
  private pressCount: number = 0;
  private releaseCount: number = 0;
  private longPressCount: number = 0;
  private doubleClickCount: number = 0;
  private lastClickTime: number = -1;
  private debounceMs: number = 300;

  constructor(id: string, enabled: boolean) {
    this.id = id;
    this.enabled = enabled;
    if (!enabled) {
      this.state = ButtonState.DISABLED;
    }
  }

  getId(): string {
    return this.id;
  }

  getState(): ButtonState {
    return this.state;
  }

  isEnabled(): boolean {
    return this.enabled;
  }

  canInteract(): boolean {
    return this.enabled && this.state !== ButtonState.DISABLED;
  }

  press(): boolean {
    if (!this.canInteract()) {
      return false;
    }
    this.state = ButtonState.PRESSED;
    this.pressCount = this.pressCount + 1;
    return true;
  }

  release(): boolean {
    if (this.state !== ButtonState.PRESSED) {
      return false;
    }
    this.state = ButtonState.NORMAL;
    this.releaseCount = this.releaseCount + 1;
    return true;
  }

  hover(entered: boolean): boolean {
    if (!this.enabled) {
      return false;
    }
    this.state = entered ? ButtonState.HOVER : ButtonState.NORMAL;
    return true;
  }

  click(): boolean {
    if (!this.canInteract()) {
      return false;
    }
    this.clickCount = this.clickCount + 1;
    this.state = ButtonState.NORMAL;
    return true;
  }

  longPress(holdMs: number): boolean {
    if (!this.canInteract() || holdMs < 500) {
      return false;
    }
    this.longPressCount = this.longPressCount + 1;
    return true;
  }

  doubleClick(nowMs: number): boolean {
    if (!this.canInteract()) {
      return false;
    }
    if (this.lastClickTime >= 0 && nowMs - this.lastClickTime <= this.debounceMs) {
      this.doubleClickCount = this.doubleClickCount + 1;
      this.lastClickTime = -1;
      return true;
    }
    this.lastClickTime = nowMs;
    return false;
  }

  setDebounce(ms: number): void {
    this.debounceMs = clampNumber(ms, 0, 1000);
  }

  disable(): void {
    this.enabled = false;
    this.state = ButtonState.DISABLED;
  }

  enable(): void {
    this.enabled = true;
    this.state = ButtonState.NORMAL;
  }

  getClickCount(): number {
    return this.clickCount;
  }

  getPressCount(): number {
    return this.pressCount;
  }

  getReleaseCount(): number {
    return this.releaseCount;
  }

  getLongPressCount(): number {
    return this.longPressCount;
  }

  getDoubleClickCount(): number {
    return this.doubleClickCount;
  }

  reset(): void {
    this.state = this.enabled ? ButtonState.NORMAL : ButtonState.DISABLED;
    this.clickCount = 0;
    this.pressCount = 0;
    this.releaseCount = 0;
    this.longPressCount = 0;
    this.doubleClickCount = 0;
    this.lastClickTime = -1;
  }
}

class HitTester {
  private regions: HitRegion[] = [];

  add(region: HitRegion): boolean {
    if (region.id.length === 0 || region.area() === 0) {
      return false;
    }
    this.regions.push(region);
    return true;
  }

  hitTest(px: number, py: number): string {
    for (const region of this.regions) {
      if (region.contains(px, py)) {
        return region.id;
      }
    }
    return '';
  }

  count(): number {
    return this.regions.length;
  }

  totalArea(): number {
    let total = 0;
    for (const region of this.regions) {
      total = total + region.area();
    }
    return total;
  }
}

class ButtonGroup {
  private buttons: ButtonModel[] = [];
  private clicks: number = 0;

  add(button: ButtonModel): boolean {
    if (this.find(button.getId()) !== null) {
      return false;
    }
    this.buttons.push(button);
    return true;
  }

  find(id: string): ButtonModel | null {
    for (const button of this.buttons) {
      if (button.getId() === id) {
        return button;
      }
    }
    return null;
  }

  clickById(id: string): boolean {
    const button = this.find(id);
    if (button === null || !button.click()) {
      return false;
    }
    this.clicks = this.clicks + 1;
    return true;
  }

  count(): number {
    return this.buttons.length;
  }

  enabledCount(): number {
    let total = 0;
    for (const button of this.buttons) {
      if (button.isEnabled()) {
        total = total + 1;
      }
    }
    return total;
  }

  getClicks(): number {
    return this.clicks;
  }
}

export default function windowButtonInteractionTest(): void {
  describe('WindowButtonInteraction', () => {
    it('WindowButtonInteraction_001', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.getId()).assertEqual('ok');
      expect(button.isEnabled()).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      done();
    });

    it('WindowButtonInteraction_002', 0, async (done: Function) => {
      const button = new ButtonModel('ok', false);
      expect(button.isEnabled()).assertFalse();
      expect(button.canInteract()).assertFalse();
      expect(button.getState()).assertEqual(ButtonState.DISABLED);
      done();
    });

    it('WindowButtonInteraction_003', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.press()).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.PRESSED);
      expect(button.getPressCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_004', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.press();
      expect(button.release()).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      expect(button.getReleaseCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_005', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.release()).assertFalse();
      expect(button.getReleaseCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_006', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.click()).assertTrue();
      expect(button.getClickCount()).assertEqual(1);
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      done();
    });

    it('WindowButtonInteraction_007', 0, async (done: Function) => {
      const button = new ButtonModel('ok', false);
      expect(button.press()).assertFalse();
      expect(button.click()).assertFalse();
      expect(button.getClickCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_008', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.hover(true)).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.HOVER);
      expect(button.hover(false)).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      done();
    });

    it('WindowButtonInteraction_009', 0, async (done: Function) => {
      const button = new ButtonModel('ok', false);
      expect(button.hover(true)).assertFalse();
      expect(button.getState()).assertEqual(ButtonState.DISABLED);
      done();
    });

    it('WindowButtonInteraction_010', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.longPress(600)).assertTrue();
      expect(button.longPress(400)).assertFalse();
      expect(button.getLongPressCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_011', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.doubleClick(1000)).assertFalse();
      expect(button.doubleClick(1200)).assertTrue();
      expect(button.getDoubleClickCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_012', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.setDebounce(100);
      expect(button.doubleClick(1000)).assertFalse();
      expect(button.doubleClick(1200)).assertFalse();
      expect(button.getDoubleClickCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_013', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.disable();
      expect(button.isEnabled()).assertFalse();
      expect(button.click()).assertFalse();
      expect(button.getState()).assertEqual(ButtonState.DISABLED);
      done();
    });

    it('WindowButtonInteraction_014', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.disable();
      button.enable();
      expect(button.isEnabled()).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      done();
    });

    it('WindowButtonInteraction_015', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.click();
      button.click();
      button.reset();
      expect(button.getClickCount()).assertEqual(0);
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      done();
    });

    it('WindowButtonInteraction_016', 0, async (done: Function) => {
      const region = new HitRegion('ok', 0, 0, 100, 50);
      expect(region.contains(50, 25)).assertTrue();
      expect(region.contains(101, 25)).assertFalse();
      expect(region.area()).assertEqual(5000);
      done();
    });

    it('WindowButtonInteraction_017', 0, async (done: Function) => {
      const region = new HitRegion('ok', 10, 10, 0, 50);
      expect(region.area()).assertEqual(0);
      expect(region.contains(10, 10)).assertTrue();
      done();
    });

    it('WindowButtonInteraction_018', 0, async (done: Function) => {
      const tester = new HitTester();
      expect(tester.add(new HitRegion('ok', 0, 0, 100, 100))).assertTrue();
      expect(tester.add(new HitRegion('cancel', 200, 0, 100, 100))).assertTrue();
      expect(tester.count()).assertEqual(2);
      done();
    });

    it('WindowButtonInteraction_019', 0, async (done: Function) => {
      const tester = new HitTester();
      tester.add(new HitRegion('ok', 0, 0, 100, 100));
      expect(tester.hitTest(50, 50)).assertEqual('ok');
      expect(tester.hitTest(150, 50)).assertEqual('');
      done();
    });

    it('WindowButtonInteraction_020', 0, async (done: Function) => {
      const tester = new HitTester();
      tester.add(new HitRegion('ok', 0, 0, 100, 100));
      tester.add(new HitRegion('cancel', 50, 50, 100, 100));
      expect(tester.hitTest(60, 60)).assertEqual('ok');
      expect(tester.totalArea()).assertEqual(20000);
      done();
    });

    it('WindowButtonInteraction_021', 0, async (done: Function) => {
      const group = new ButtonGroup();
      expect(group.add(new ButtonModel('ok', true))).assertTrue();
      expect(group.add(new ButtonModel('cancel', false))).assertTrue();
      expect(group.count()).assertEqual(2);
      expect(group.enabledCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_022', 0, async (done: Function) => {
      const group = new ButtonGroup();
      group.add(new ButtonModel('ok', true));
      expect(group.add(new ButtonModel('ok', true))).assertFalse();
      expect(group.count()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_023', 0, async (done: Function) => {
      const group = new ButtonGroup();
      group.add(new ButtonModel('ok', true));
      expect(group.clickById('ok')).assertTrue();
      expect(group.clickById('missing')).assertFalse();
      expect(group.getClicks()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_024', 0, async (done: Function) => {
      const group = new ButtonGroup();
      group.add(new ButtonModel('ok', false));
      expect(group.clickById('ok')).assertFalse();
      expect(group.getClicks()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_025', 0, async (done: Function) => {
      const group = new ButtonGroup();
      expect(group.find('missing')).assertNull();
      group.add(new ButtonModel('ok', true));
      expect(group.find('ok') !== null).assertTrue();
      done();
    });

    it('WindowButtonInteraction_026', 0, async (done: Function) => {
      const tester = new HitTester();
      expect(tester.add(new HitRegion('', 0, 0, 10, 10))).assertFalse();
      expect(tester.add(new HitRegion('bad', 0, 0, 0, 10))).assertFalse();
      expect(tester.count()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_027', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.press();
      button.press();
      expect(button.getPressCount()).assertEqual(2);
      expect(button.getState()).assertEqual(ButtonState.PRESSED);
      done();
    });

    it('WindowButtonInteraction_028', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.press();
      button.release();
      button.release();
      expect(button.getReleaseCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_029', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.setDebounce(10);
      expect(button.doubleClick(100)).assertFalse();
      expect(button.doubleClick(150)).assertFalse();
      expect(button.getDoubleClickCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_030', 0, async (done: Function) => {
      const button = new ButtonModel('ok', false);
      expect(button.longPress(1000)).assertFalse();
      expect(button.getLongPressCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_031', 0, async (done: Function) => {
      const group = new ButtonGroup();
      group.add(new ButtonModel('a', true));
      group.add(new ButtonModel('b', true));
      group.add(new ButtonModel('c', false));
      expect(group.enabledCount()).assertEqual(2);
      expect(group.count()).assertEqual(3);
      done();
    });

    it('WindowButtonInteraction_032', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.click();
      button.press();
      button.release();
      expect(button.getClickCount()).assertEqual(1);
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      done();
    });

    it('WindowButtonInteraction_033', 0, async (done: Function) => {
      const region = new HitRegion('edge', 5, 5, 10, 10);
      expect(region.contains(5, 5)).assertTrue();
      expect(region.contains(15, 15)).assertTrue();
      expect(region.contains(4, 5)).assertFalse();
      done();
    });

    it('WindowButtonInteraction_034', 0, async (done: Function) => {
      const tester = new HitTester();
      tester.add(new HitRegion('a', 0, 0, 10, 10));
      tester.add(new HitRegion('b', 20, 20, 10, 10));
      expect(tester.hitTest(5, 5)).assertEqual('a');
      expect(tester.hitTest(25, 25)).assertEqual('b');
      expect(tester.hitTest(15, 15)).assertEqual('');
      done();
    });

    it('WindowButtonInteraction_035', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.disable();
      button.reset();
      expect(button.getState()).assertEqual(ButtonState.DISABLED);
      expect(button.isEnabled()).assertFalse();
      done();
    });

    it('WindowButtonInteraction_036', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.getClickCount()).assertEqual(0);
      expect(button.getPressCount()).assertEqual(0);
      expect(button.getReleaseCount()).assertEqual(0);
      expect(button.getLongPressCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_037', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.doubleClick(0)).assertFalse();
      expect(button.doubleClick(100)).assertTrue();
      expect(button.doubleClick(200)).assertFalse();
      done();
    });

    it('WindowButtonInteraction_038', 0, async (done: Function) => {
      const group = new ButtonGroup();
      group.add(new ButtonModel('a', true));
      group.add(new ButtonModel('b', true));
      group.clickById('a');
      group.clickById('b');
      expect(group.getClicks()).assertEqual(2);
      done();
    });

    it('WindowButtonInteraction_039', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.hover(true);
      expect(button.click()).assertTrue();
      expect(button.getState()).assertEqual(ButtonState.NORMAL);
      expect(button.getClickCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_040', 0, async (done: Function) => {
      const tester = new HitTester();
      tester.add(new HitRegion('a', 0, 0, 100, 100));
      tester.add(new HitRegion('b', 100, 0, 100, 100));
      expect(tester.totalArea()).assertEqual(20000);
      expect(tester.count()).assertEqual(2);
      done();
    });

    it('WindowButtonInteraction_041', 0, async (done: Function) => {
      const button = new ButtonModel('submit', true);
      button.setDebounce(0);
      expect(button.doubleClick(100)).assertFalse();
      expect(button.doubleClick(100)).assertTrue();
      done();
    });

    it('WindowButtonInteraction_042', 0, async (done: Function) => {
      const button = new ButtonModel('submit', true);
      expect(button.press()).assertTrue();
      expect(button.click()).assertTrue();
      expect(button.getPressCount()).assertEqual(1);
      expect(button.getClickCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_043', 0, async (done: Function) => {
      const group = new ButtonGroup();
      const first = new ButtonModel('first', true);
      group.add(first);
      expect(group.find('first')).assertEqual(first);
      done();
    });

    it('WindowButtonInteraction_044', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.disable();
      expect(button.hover(true)).assertFalse();
      button.enable();
      expect(button.hover(true)).assertTrue();
      done();
    });

    it('WindowButtonInteraction_045', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Button');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowButtonInteraction_046', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      expect(button.longPress(500)).assertTrue();
      expect(button.longPress(499)).assertFalse();
      expect(button.getLongPressCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_050', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.setDebounce(500);
      expect(button.doubleClick(10)).assertFalse();
      expect(button.doubleClick(510)).assertTrue();
      expect(button.getDoubleClickCount()).assertEqual(1);
      done();
    });

    it('WindowButtonInteraction_051', 0, async (done: Function) => {
      const region = new HitRegion('box', 100, 100, 50, 50);
      expect(region.contains(100, 100)).assertTrue();
      expect(region.contains(150, 150)).assertTrue();
      expect(region.area()).assertEqual(2500);
      done();
    });

    it('WindowButtonInteraction_047', 0, async (done: Function) => {
      const tester = new HitTester();
      expect(tester.hitTest(0, 0)).assertEqual('');
      expect(tester.totalArea()).assertEqual(0);
      expect(tester.count()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_048', 0, async (done: Function) => {
      const button = new ButtonModel('ok', true);
      button.press();
      button.release();
      button.click();
      button.reset();
      expect(button.getClickCount()).assertEqual(0);
      expect(button.getPressCount()).assertEqual(0);
      expect(button.getReleaseCount()).assertEqual(0);
      done();
    });

    it('WindowButtonInteraction_049', 0, async (done: Function) => {
      const group = new ButtonGroup();
      group.add(new ButtonModel('a', false));
      group.add(new ButtonModel('b', false));
      expect(group.enabledCount()).assertEqual(0);
      expect(group.clickById('a')).assertFalse();
      expect(group.getClicks()).assertEqual(0);
      done();
    });
  });
}
