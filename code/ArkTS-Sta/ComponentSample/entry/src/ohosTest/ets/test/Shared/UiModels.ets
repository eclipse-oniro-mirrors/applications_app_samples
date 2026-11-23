'use static';

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

/**
 * Pure state models shared by the interaction suites. None of these classes
 * render anything; they capture the behaviour the ArkUI structs express in
 * their build methods so the rules can be asserted on a headless runner.
 */

export const GRID_COLUMNS: int = 7;
export const GRID_ROWS: int = 5;
export const GRID_SLOTS: int = 35;
export const MONTHS_PER_YEAR: int = 12;
export const TRANSITION_DURATION_MS: int = 200;
export const GRID_HEIGHT_LARGE: int = 360;
export const GRID_HEIGHT_MEDIUM: int = 300;
export const ELEMENT_MARGIN_LARGE: int = 24;
export const ELEMENT_MARGIN_MEDIUM: int = 8;
export const ELEMENT_MARGIN_BASE: int = 12;
export const FRAME_BUDGET_MS: double = 16.67;

export class ThemeTokens {
  public background: string;
  public foreground: string;
  public accent: string;
  public weekend: string;

  constructor(background: string, foreground: string, accent: string, weekend: string) {
    this.background = background;
    this.foreground = foreground;
    this.accent = accent;
    this.weekend = weekend;
  }
}

export class ThemeResolver {
  public static resolve(darkMode: boolean): ThemeTokens {
    if (darkMode) {
      return new ThemeTokens('#ff000000', '#ffffffff', '#ff1dee06', '#ffff5555');
    }
    return new ThemeTokens('#ffffffff', '#ff000000', '#ff1dee06', '#ffff0000');
  }

  /** Colour of a day cell given its weekday and highlight state. */
  public static dayColor(weekday: int, highlighted: boolean, darkMode: boolean): string {
    if (highlighted) {
      return darkMode ? '#ff1dee06' : '#ff1dee06';
    }
    if (weekday === 0 || weekday === 6) {
      return ThemeResolver.resolve(darkMode).weekend;
    }
    return ThemeResolver.resolve(darkMode).foreground;
  }

  public static gridHeight(screenLarge: boolean): int {
    return screenLarge ? GRID_HEIGHT_LARGE : GRID_HEIGHT_MEDIUM;
  }

  public static margin(screenLarge: boolean): int {
    return screenLarge ? ELEMENT_MARGIN_LARGE : ELEMENT_MARGIN_MEDIUM;
  }
}

export class FocusGrid {
  public columns: int;
  public rows: int;

  constructor(columns: int, rows: int) {
    this.columns = columns;
    this.rows = rows;
  }

  public clamp(index: int): int {
    if (index < 0) {
      return 0;
    }
    if (index >= this.columns * this.rows) {
      return this.columns * this.rows - 1;
    }
    return index;
  }

  public moveRight(index: int): int {
    if (index % this.columns === this.columns - 1) {
      return index;
    }
    return this.clamp(index + 1);
  }

  public moveLeft(index: int): int {
    if (index % this.columns === 0) {
      return index;
    }
    return this.clamp(index - 1);
  }

  public moveDown(index: int): int {
    if (index + this.columns >= this.columns * this.rows) {
      return index;
    }
    return index + this.columns;
  }

  public moveUp(index: int): int {
    if (index - this.columns < 0) {
      return index;
    }
    return index - this.columns;
  }

  public rowOf(index: int): int {
    return Math.floor(index / this.columns).toInt();
  }

  public columnOf(index: int): int {
    return index % this.columns;
  }

  public isWeekendColumn(index: int): boolean {
    const column: number = this.columnOf(index);
    return column === 0 || column === this.columns - 1;
  }
}

export class FocusRingModel {
  public visible: boolean = false;
  public emphasized: boolean = false;

  public show(weekendColumn: boolean): void {
    this.visible = true;
    this.emphasized = weekendColumn;
  }

  public hide(): void {
    this.visible = false;
    this.emphasized = false;
  }

  public borderWidth(): int {
    return this.visible ? (this.emphasized ? 3 : 2) : 0;
  }
}

export class GestureSample {
  public startX: double;
  public startY: double;
  public endX: double;
  public endY: double;

  constructor(startX: double, startY: double, endX: double, endY: double) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
  }

  public dx(): double {
    return this.endX - this.startX;
  }

  public dy(): double {
    return this.endY - this.startY;
  }

  public distance(): double {
    return Math.sqrt(this.dx() * this.dx() + this.dy() * this.dy());
  }
}

export class GestureClassifier {
  public static readonly TAP_DISTANCE: double = 10;
  public static readonly SWIPE_DISTANCE: double = 40;

  public static classify(sample: GestureSample): string {
    const distance: number = sample.distance();
    if (distance <= GestureClassifier.TAP_DISTANCE) {
      return 'tap';
    }
    if (distance < GestureClassifier.SWIPE_DISTANCE) {
      return 'drag';
    }
    if (Math.abs(sample.dx()) > Math.abs(sample.dy())) {
      return sample.dx() > 0 ? 'swipeRight' : 'swipeLeft';
    }
    return sample.dy() > 0 ? 'swipeDown' : 'swipeUp';
  }
}

export class EventNode {
  public name: string;
  public children: EventNode[] = [];

  constructor(name: string) {
    this.name = name;
  }

  public add(child: EventNode): EventNode {
    this.children.push(child);
    return this;
  }
}

export class EventDispatcher {
  public static capturePath(root: EventNode, target: string): string[] {
    const path: string[] = [];
    EventDispatcher.walk(root, target, path);
    return path;
  }

  private static walk(node: EventNode, target: string, path: string[]): boolean {
    path.push(node.name);
    if (node.name === target) {
      return true;
    }
    for (let index = 0; index < node.children.length; index++) {
      if (EventDispatcher.walk(node.children[index], target, path)) {
        return true;
      }
    }
    path.pop();
    return false;
  }

  /** Capture runs root to target, bubble runs target to root. */
  public static bubblePath(root: EventNode, target: string): string[] {
    const path: string[] = EventDispatcher.capturePath(root, target);
    const result: string[] = [];
    for (let index = path.length - 1; index >= 0; index--) {
      result.push(path[index]);
    }
    return result;
  }
}

export class AnimationTimeline {
  public frames: double[] = [];
  public budget: double = FRAME_BUDGET_MS;

  public addFrame(duration: double): void {
    this.frames.push(duration);
  }

  public dropped(): int {
    let total: int = 0;
    for (let index = 0; index < this.frames.length; index++) {
      if (this.frames[index] > this.budget) {
        total = total + 1;
      }
    }
    return total;
  }

  public averageFrame(): double {
    if (this.frames.length === 0) {
      return 0;
    }
    let total: double = 0;
    for (let index = 0; index < this.frames.length; index++) {
      total = total + this.frames[index];
    }
    return total / this.frames.length;
  }

  public smooth(): boolean {
    return this.dropped() === 0;
  }
}

export class ContentScaleModel {
  public fontScale: double = 1;

  constructor(fontScale: double) {
    this.fontScale = fontScale;
  }

  public scaled(base: double): double {
    return base * this.fontScale;
  }

  public rowHeight(base: double): double {
    return Math.ceil(base * this.fontScale);
  }

  public fits(budget: double, base: double): boolean {
    return this.scaled(base) <= budget;
  }
}
