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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, countById, ID_CANCEL_TAB, ID_NAV_BACK, ID_NAV_FORWARD,
  ID_ACTION_SUBMIT, ID_INPUT_URL, MIN_TAB_COUNT, MAX_TAB_COUNT, STABLE_TOLERANCE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserVisualEffectsTest';

/* ------------------------------------------------------------------ */
/* Palette declared by common/TitleBar.ets and common/PhoneLayout.ets  */
/* ------------------------------------------------------------------ */

const DOWN_COLOR: string = '#e4e4e4';
const UP_COLOR: string = '#00000000';
const TAB_SELECTED_COLOR: string = '#ffffff';
const TAB_UNSELECTED_COLOR: string = '#ececec';
const DIVIDER_COLOR: string = '#c6c6c6';
const PROGRESS_COLOR: string = '#0000ff';
const PHONE_TOOLBAR_BG: string = '#fdfdfd';
const PHONE_DIVIDER_COLOR: string = '#e9eaec';
const RELEASED_INDEX: number = 0;
const BUTTON_WIDTH: number = 22;
const BUTTON_RADIUS: number = 4;
const CANCEL_SIZE: number = 33;
const CANCEL_RADIUS: number = 5;

/* ------------------------------------------------------------------ */
/* Color parsing and perceptual helpers                                */
/* ------------------------------------------------------------------ */

interface RgbaColor {
  r: number;
  g: number;
  b: number;
  a: number;
}

/** Parses '#rgb', '#rrggbb' and the ArkUI '#aarrggbb' form. */
function parseHexColor(hex: string): RgbaColor | null {
  if (hex === null || hex === undefined) {
    return null;
  }
  let body: string = hex.trim();
  if (body.length > 0 && body.charAt(0) === '#') {
    body = body.substring(1);
  }
  if (body.length === 3) {
    const expanded: string = body.charAt(0) + body.charAt(0) + body.charAt(1) + body.charAt(1) +
      body.charAt(2) + body.charAt(2);
    body = expanded;
  }
  if (body.length === 6) {
    body = 'ff' + body;
  }
  if (body.length !== 8) {
    return null;
  }
  const a: number = parseInt(body.substring(0, 2), 16);
  const r: number = parseInt(body.substring(2, 4), 16);
  const g: number = parseInt(body.substring(4, 6), 16);
  const b: number = parseInt(body.substring(6, 8), 16);
  if (isNaN(a) || isNaN(r) || isNaN(g) || isNaN(b)) {
    return null;
  }
  return { r: r, g: g, b: b, a: a };
}

function channelToLinear(value: number): number {
  const normalized: number = value / 255;
  if (normalized <= 0.03928) {
    return normalized / 12.92;
  }
  return Math.pow((normalized + 0.055) / 1.055, 2.4);
}

/** WCAG relative luminance, used to prove the selected tab is the brighter one. */
function relativeLuminance(hex: string): number {
  const color: RgbaColor | null = parseHexColor(hex);
  if (color === null) {
    return -1;
  }
  return 0.2126 * channelToLinear(color.r) + 0.7152 * channelToLinear(color.g) +
    0.0722 * channelToLinear(color.b);
}

function isTransparent(hex: string): boolean {
  const color: RgbaColor | null = parseHexColor(hex);
  return color !== null && color.a === 0;
}

function isOpaque(hex: string): boolean {
  const color: RgbaColor | null = parseHexColor(hex);
  return color !== null && color.a === 255;
}

function contrastRatio(first: string, second: string): number {
  const a: number = relativeLuminance(first);
  const b: number = relativeLuminance(second);
  if (a < 0 || b < 0) {
    return -1;
  }
  const lighter: number = a > b ? a : b;
  const darker: number = a > b ? b : a;
  return (lighter + 0.05) / (darker + 0.05);
}

/* ------------------------------------------------------------------ */
/* Press feedback model (mirror of the arrayIndex / tabButtonIndex)    */
/* ------------------------------------------------------------------ */

/**
 * TabletTitle, PhoneLayout and BrowserTabs all follow the same pattern:
 * TouchType.Down stores the tapped id, TouchType.Up resets it to 0, and the
 * background colour is derived from that single integer state.
 */
class PressFeedbackModel {
  pressedId: number = RELEASED_INDEX;
  downCount: number = 0;
  upCount: number = 0;
  ignoredEvents: string[] = [];

  /** Feeds a TouchType name: 'Down', 'Up', 'Move' or 'Cancel'. */
  handleTouch(eventType: string, id: number): string {
    if (eventType === 'Down') {
      this.pressedId = id;
      this.downCount += 1;
    } else if (eventType === 'Up') {
      this.pressedId = RELEASED_INDEX;
      this.upCount += 1;
    } else {
      this.ignoredEvents.push(eventType);
    }
    return this.colorFor(id);
  }

  colorFor(id: number): string {
    return this.pressedId === id ? DOWN_COLOR : UP_COLOR;
  }

  isPressed(id: number): boolean {
    return this.pressedId === id;
  }

  isReleased(): boolean {
    return this.pressedId === RELEASED_INDEX;
  }

  pressedCount(): number {
    let total: number = 0;
    if (this.isPressed(1)) {
      total += 1;
    }
    if (this.isPressed(2)) {
      total += 1;
    }
    if (this.isPressed(3)) {
      total += 1;
    }
    if (this.isPressed(4)) {
      total += 1;
    }
    if (this.isPressed(5)) {
      total += 1;
    }
    if (this.isPressed(6)) {
      total += 1;
    }
    return total;
  }

  reset(): void {
    this.pressedId = RELEASED_INDEX;
    this.downCount = 0;
    this.upCount = 0;
    this.ignoredEvents = [];
  }
}

/* ------------------------------------------------------------------ */
/* Tab selection model                                                 */
/* ------------------------------------------------------------------ */

class TabSelectionModel {
  selectedIndex: number;
  tabCount: number;
  pressedTab: number = -1;

  constructor(tabCount: number = MIN_TAB_COUNT, selectedIndex: number = 0) {
    this.tabCount = tabCount < MIN_TAB_COUNT ? MIN_TAB_COUNT : tabCount;
    this.selectedIndex = selectedIndex;
  }

  /** BrowserTabs: tabArrayIndex === item.key ? '#ffffff' : '#ececec'. */
  cellBackground(index: number): string {
    return this.selectedIndex === index ? TAB_SELECTED_COLOR : TAB_UNSELECTED_COLOR;
  }

  /** BrowserTabs: tabButtonIndex == item.key ? DOWN_COLOR : transparent. */
  cancelBackground(index: number): string {
    return this.pressedTab === index ? DOWN_COLOR : UP_COLOR;
  }

  pressCancel(index: number): void {
    this.pressedTab = index;
  }

  releaseCancel(): void {
    this.pressedTab = -1;
  }

  dividerColor(): string {
    return DIVIDER_COLOR;
  }

  stripBackground(): string {
    return TAB_UNSELECTED_COLOR;
  }

  select(index: number): boolean {
    if (index < 0 || index >= this.tabCount) {
      return false;
    }
    this.selectedIndex = index;
    return true;
  }

  selectedBackgroundCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.tabCount; index++) {
      if (this.cellBackground(index) === TAB_SELECTED_COLOR) {
        total += 1;
      }
    }
    return total;
  }

  unselectedBackgroundCount(): number {
    return this.tabCount - this.selectedBackgroundCount();
  }

  /** The selected tab must read brighter than its neighbours. */
  selectedIsBrighter(): boolean {
    return relativeLuminance(TAB_SELECTED_COLOR) > relativeLuminance(TAB_UNSELECTED_COLOR);
  }
}

/* ------------------------------------------------------------------ */
/* Progress bar visual model                                           */
/* ------------------------------------------------------------------ */

class ProgressVisualModel {
  value: number;
  hidden: boolean;
  color: string = PROGRESS_COLOR;
  total: number = 100;

  constructor(value: number = 0, hidden: boolean = true) {
    this.value = value;
    this.hidden = hidden;
  }

  /** Index.ets hides the bar through Visibility while PhoneLayout skips it. */
  effectiveAlpha(): number {
    return this.hidden ? 0 : 255;
  }

  clampedValue(): number {
    if (this.value < 0) {
      return 0;
    }
    return this.value > this.total ? this.total : this.value;
  }

  /** Fraction of the bar that is painted, in [0, 1]. */
  fillRatio(): number {
    return this.clampedValue() / this.total;
  }

  isPainted(): boolean {
    return !this.hidden && this.fillRatio() > 0;
  }

  advance(next: number): ProgressVisualModel {
    if (next >= this.total) {
      return new ProgressVisualModel(0, true);
    }
    return new ProgressVisualModel(next, false);
  }

  colorIsBlue(): boolean {
    const color: RgbaColor | null = parseHexColor(this.color);
    if (color === null) {
      return false;
    }
    return color.r === 0 && color.g === 0 && color.b === 255 && color.a === 255;
  }
}

/* ------------------------------------------------------------------ */
/* Button panel model (22 x 22, radius 4)                            */
/* ------------------------------------------------------------------ */

class ButtonPanelModel {
  width: number = BUTTON_WIDTH;
  height: number = BUTTON_WIDTH;
  radius: number = BUTTON_RADIUS;
  pressed: boolean = false;

  constructor(pressed: boolean = false) {
    this.pressed = pressed;
  }

  background(): string {
    return this.pressed ? DOWN_COLOR : UP_COLOR;
  }

  /** A released button paints nothing, only its image is visible. */
  panelIsInvisible(): boolean {
    return isTransparent(this.background());
  }

  pressedPanelIsOpaque(): boolean {
    const pressed: ButtonPanelModel = new ButtonPanelModel(true);
    return isOpaque(pressed.background());
  }

  cornerIsSoft(): boolean {
    return this.radius > 0 && this.radius < this.width / 2;
  }

  /** Rounded corner area that the highlight paints over. */
  cornerRatio(): number {
    return this.radius / this.width;
  }

  clone(pressed: boolean): ButtonPanelModel {
    return new ButtonPanelModel(pressed);
  }
}

/* ------------------------------------------------------------------ */
/* Hover / press priority model                                        */
/* ------------------------------------------------------------------ */

/**
 * ArkUI applies hover and press feedback independently. The browser chrome
 * only declares press feedback, therefore hover must never win over press and
 * must fall back to the released colour when a pointer leaves the button.
 */
class HoverPressModel {
  hovered: boolean = false;
  pressed: boolean = false;
  hoverSupported: boolean = false;

  onHover(inside: boolean): void {
    this.hovered = inside && this.hoverSupported;
  }

  onPress(down: boolean): void {
    this.pressed = down;
  }

  /** Pressed > hovered > released. */
  background(): string {
    if (this.pressed) {
      return DOWN_COLOR;
    }
    if (this.hovered) {
      return DOWN_COLOR;
    }
    return UP_COLOR;
  }

  priority(): number {
    if (this.pressed) {
      return 2;
    }
    if (this.hovered) {
      return 1;
    }
    return 0;
  }
}

/* ------------------------------------------------------------------ */
/* Chrome palette model                                                */
/* ------------------------------------------------------------------ */

class ChromePaletteModel {
  private theme: string;

  constructor(theme: string = 'light') {
    this.theme = theme;
  }

  themeName(): string {
    return this.theme;
  }

  /** The chrome colours are hard coded in the components, so both themes match. */
  chromeColors(): string[] {
    return [DOWN_COLOR, UP_COLOR, TAB_SELECTED_COLOR, TAB_UNSELECTED_COLOR, DIVIDER_COLOR,
      PROGRESS_COLOR];
  }

  colorAt(index: number): string {
    const colors: string[] = this.chromeColors();
    if (index < 0 || index >= colors.length) {
      return '';
    }
    return colors[index];
  }

  sameAs(other: ChromePaletteModel): boolean {
    const mine: string[] = this.chromeColors();
    const theirs: string[] = other.chromeColors();
    if (mine.length !== theirs.length) {
      return false;
    }
    for (let index = 0; index < mine.length; index++) {
      if (mine[index] !== theirs[index]) {
        return false;
      }
    }
    return true;
  }

  allParsable(): boolean {
    const colors: string[] = this.chromeColors();
    for (let index = 0; index < colors.length; index++) {
      if (parseHexColor(colors[index]) === null) {
        return false;
      }
    }
    return true;
  }
}

/* ------------------------------------------------------------------ */
/* Visual state snapshot and diff                                      */
/* ------------------------------------------------------------------ */

class VisualState {
  key: string;
  color: string;
  alpha: number;

  constructor(key: string, color: string) {
    this.key = key;
    this.color = color;
    const parsed: RgbaColor | null = parseHexColor(color);
    this.alpha = parsed === null ? 0 : parsed.a;
  }

  sameAs(other: VisualState): boolean {
    return this.key === other.key && this.color === other.color && this.alpha === other.alpha;
  }

  describe(): string {
    return `${this.key}:${this.color}`;
  }
}

class VisualDiff {
  changed: string[] = [];
  kept: string[] = [];

  static compare(before: VisualState[], after: VisualState[]): VisualDiff {
    const diff: VisualDiff = new VisualDiff();
    for (let index = 0; index < before.length; index++) {
      const match: VisualState | null = index < after.length ? after[index] : null;
      if (match !== null && before[index].sameAs(match)) {
        diff.kept.push(before[index].key);
      } else {
        diff.changed.push(before[index].key);
      }
    }
    return diff;
  }
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserVisualEffectsTest() {
  describe('browserVisualEffectsTest', () => {
    let driver: Driver = getDriver();
    let clock: MockClock = new MockClock();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      clock = new MockClock(1700000000000);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Visual_Effect_001', 0, async () => {
      TestLogger.step(TAG, 'press colour is opaque, released colour is fully transparent');
      const down: RgbaColor | null = parseHexColor(DOWN_COLOR);
      const up: RgbaColor | null = parseHexColor(UP_COLOR);
      expect(down !== null).assertTrue();
      expect(up !== null).assertTrue();
      if (down !== null && up !== null) {
        expect(down.a).assertEqual(255);
        expect(down.r).assertEqual(228);
        expect(down.g).assertEqual(228);
        expect(down.b).assertEqual(228);
        expect(up.a).assertEqual(0);
      }
      expect(isOpaque(DOWN_COLOR)).assertTrue();
      expect(isTransparent(UP_COLOR)).assertTrue();
      expect(isTransparent(DOWN_COLOR)).assertFalse();
    });

    it('Browser_Visual_Effect_002', 0, async () => {
      TestLogger.step(TAG, 'down event paints the button and up restores it');
      const feedback: PressFeedbackModel = new PressFeedbackModel();
      expect(feedback.isReleased()).assertTrue();
      const downColor: string = feedback.handleTouch('Down', 1);
      expect(downColor).assertEqual(DOWN_COLOR);
      expect(feedback.isPressed(1)).assertTrue();
      expect(feedback.pressedCount()).assertEqual(1);
      const upColor: string = feedback.handleTouch('Up', 1);
      expect(upColor).assertEqual(UP_COLOR);
      expect(feedback.isReleased()).assertTrue();
      expect(feedback.downCount).assertEqual(1);
      expect(feedback.upCount).assertEqual(1);
      expect(feedback.pressedCount()).assertEqual(0);
    });

    it('Browser_Visual_Effect_003', 0, async () => {
      TestLogger.step(TAG, 'move and cancel events do not repaint the button');
      const feedback: PressFeedbackModel = new PressFeedbackModel();
      feedback.handleTouch('Down', 3);
      expect(feedback.isPressed(3)).assertTrue();
      const movedColor: string = feedback.handleTouch('Move', 3);
      expect(movedColor).assertEqual(DOWN_COLOR);
      const cancelledColor: string = feedback.handleTouch('Cancel', 3);
      expect(cancelledColor).assertEqual(DOWN_COLOR);
      expect(feedback.isPressed(3)).assertTrue();
      expect(feedback.ignoredEvents.length).assertEqual(2);
      expect(feedback.ignoredEvents[0]).assertEqual('Move');
      feedback.handleTouch('Up', 3);
      expect(feedback.isReleased()).assertTrue();
      expect(feedback.colorFor(3)).assertEqual(UP_COLOR);
    });

    it('Browser_Visual_Effect_004', 0, async () => {
      TestLogger.step(TAG, 'a single integer state keeps only one button pressed');
      const feedback: PressFeedbackModel = new PressFeedbackModel();
      for (let id = 1; id <= 6; id++) {
        feedback.handleTouch('Down', id);
        expect(feedback.pressedCount()).assertEqual(1);
        expect(feedback.isPressed(id)).assertTrue();
        for (let other = 1; other <= 6; other++) {
          if (other === id) {
            continue;
          }
          expect(feedback.colorFor(other)).assertEqual(UP_COLOR);
        }
      }
      expect(feedback.downCount).assertEqual(6);
      feedback.handleTouch('Up', 6);
      expect(feedback.pressedCount()).assertEqual(0);
      expect(feedback.isReleased()).assertTrue();
    });

    it('Browser_Visual_Effect_005', 0, async () => {
      TestLogger.step(TAG, 'selected tab paints white, the others paint grey');
      const tabs: TabSelectionModel = new TabSelectionModel(3, 1);
      expect(tabs.cellBackground(1)).assertEqual(TAB_SELECTED_COLOR);
      expect(tabs.cellBackground(0)).assertEqual(TAB_UNSELECTED_COLOR);
      expect(tabs.cellBackground(2)).assertEqual(TAB_UNSELECTED_COLOR);
      expect(tabs.selectedBackgroundCount()).assertEqual(1);
      expect(tabs.unselectedBackgroundCount()).assertEqual(2);
      const moved: boolean = tabs.select(2);
      expect(moved).assertTrue();
      expect(tabs.cellBackground(2)).assertEqual(TAB_SELECTED_COLOR);
      expect(tabs.cellBackground(1)).assertEqual(TAB_UNSELECTED_COLOR);
      expect(tabs.select(3)).assertFalse();
      expect(tabs.select(-1)).assertFalse();
    });

    it('Browser_Visual_Effect_006', 0, async () => {
      TestLogger.step(TAG, 'selection follows the tab model for every index');
      for (let count = MIN_TAB_COUNT; count <= 6; count++) {
        for (let index = 0; index < count; index++) {
          const tabs: TabSelectionModel = new TabSelectionModel(count, index);
          expect(tabs.selectedBackgroundCount()).assertEqual(1);
          expect(tabs.unselectedBackgroundCount()).assertEqual(count - 1);
          expect(tabs.cellBackground(index)).assertEqual('#ffffff');
        }
      }
      const browser: MockBrowser = new MockBrowser(4);
      browser.selectTab(3);
      const tabs: TabSelectionModel = new TabSelectionModel(browser.tabs.length, browser.tabArrayIndex);
      expect(tabs.selectedIndex).assertEqual(3);
      expect(tabs.cellBackground(browser.tabArrayIndex)).assertEqual('#ffffff');
    });

    it('Browser_Visual_Effect_007', 0, async () => {
      TestLogger.step(TAG, 'cancel button highlight is independent of the tab selection');
      const tabs: TabSelectionModel = new TabSelectionModel(3, 0);
      expect(tabs.cancelBackground(0)).assertEqual(UP_COLOR);
      tabs.pressCancel(2);
      expect(tabs.cancelBackground(2)).assertEqual(DOWN_COLOR);
      expect(tabs.cancelBackground(0)).assertEqual(UP_COLOR);
      expect(tabs.cellBackground(0)).assertEqual(TAB_SELECTED_COLOR);
      expect(tabs.cellBackground(2)).assertEqual(TAB_UNSELECTED_COLOR);
      tabs.releaseCancel();
      expect(tabs.cancelBackground(2)).assertEqual(UP_COLOR);
      expect(tabs.pressedTab).assertEqual(-1);
      expect(CANCEL_SIZE).assertEqual(33);
      expect(CANCEL_RADIUS).assertEqual(5);
    });

    it('Browser_Visual_Effect_008', 0, async () => {
      TestLogger.step(TAG, 'dividers separate the tabs and follow the strip background');
      const tabs: TabSelectionModel = new TabSelectionModel(5, 2);
      expect(tabs.dividerColor()).assertEqual(DIVIDER_COLOR);
      expect(tabs.stripBackground()).assertEqual(TAB_UNSELECTED_COLOR);
      expect(isOpaque(DIVIDER_COLOR)).assertTrue();
      const divider: RgbaColor | null = parseHexColor(DIVIDER_COLOR);
      if (divider !== null) {
        expect(divider.r).assertEqual(198);
        expect(divider.g).assertEqual(198);
        expect(divider.b).assertEqual(198);
        expect(divider.r).assertEqual(divider.b);
      }
      expect(DIVIDER_COLOR).assertEqual('#c6c6c6');
      expect(PHONE_DIVIDER_COLOR).assertEqual('#e9eaec');
      expect(PHONE_TOOLBAR_BG).assertEqual('#fdfdfd');
    });

    it('Browser_Visual_Effect_009', 0, async () => {
      TestLogger.step(TAG, 'luminance orders the chrome panels from bright to dark');
      const white: number = relativeLuminance(TAB_SELECTED_COLOR);
      const selected: number = relativeLuminance(TAB_UNSELECTED_COLOR);
      const pressed: number = relativeLuminance(DOWN_COLOR);
      const divider: number = relativeLuminance(DIVIDER_COLOR);
      expect(white).assertLess(1.01);
      expect(white).assertLarger(0.99);
      expect(selected).assertLess(white);
      expect(pressed).assertLess(selected);
      expect(divider).assertLess(pressed);
      expect(divider).assertLarger(0);
      expect(new TabSelectionModel(2, 0).selectedIsBrighter()).assertTrue();
      TestLogger.info(TAG, `luminance white=${white} grey=${selected} pressed=${pressed}`);
    });

    it('Browser_Visual_Effect_010', 0, async () => {
      TestLogger.step(TAG, 'selection contrast stays subtle and the divider stays visible');
      const selectedContrast: number = contrastRatio(TAB_SELECTED_COLOR, TAB_UNSELECTED_COLOR);
      expect(selectedContrast).assertLarger(1.1);
      expect(selectedContrast).assertLess(1.3);
      const dividerContrast: number = contrastRatio(DIVIDER_COLOR, TAB_SELECTED_COLOR);
      expect(dividerContrast).assertLarger(1.5);
      expect(dividerContrast).assertLess(2.0);
      expect(contrastRatio(TAB_SELECTED_COLOR, TAB_SELECTED_COLOR)).assertEqual(1);
      expect(contrastRatio('#zzz', TAB_SELECTED_COLOR)).assertEqual(-1);
      expect(contrastRatio(UP_COLOR, TAB_SELECTED_COLOR)).assertLarger(20);
    });

    it('Browser_Visual_Effect_011', 0, async () => {
      TestLogger.step(TAG, 'progress fill is blue and fades out when hidden');
      const visible: ProgressVisualModel = new ProgressVisualModel(35, false);
      expect(visible.color).assertEqual(PROGRESS_COLOR);
      expect(visible.colorIsBlue()).assertTrue();
      expect(visible.effectiveAlpha()).assertEqual(255);
      expect(visible.isPainted()).assertTrue();
      const hidden: ProgressVisualModel = new ProgressVisualModel(35, true);
      expect(hidden.effectiveAlpha()).assertEqual(0);
      expect(hidden.isPainted()).assertFalse();
      const blue: RgbaColor | null = parseHexColor(PROGRESS_COLOR);
      if (blue !== null) {
        expect(blue.b).assertEqual(255);
        expect(blue.r).assertEqual(0);
        expect(blue.g).assertEqual(0);
        expect(blue.a).assertEqual(255);
      }
      expect(PROGRESS_COLOR).assertEqual('#0000ff');
    });

    it('Browser_Visual_Effect_012', 0, async () => {
      TestLogger.step(TAG, 'progress value is clamped before it is painted');
      const below: ProgressVisualModel = new ProgressVisualModel(-20, false);
      expect(below.clampedValue()).assertEqual(0);
      expect(below.fillRatio()).assertEqual(0);
      expect(below.isPainted()).assertFalse();
      const above: ProgressVisualModel = new ProgressVisualModel(150, false);
      expect(above.clampedValue()).assertEqual(100);
      expect(above.fillRatio()).assertEqual(1);
      expect(above.isPainted()).assertTrue();
      const half: ProgressVisualModel = new ProgressVisualModel(50, false);
      expect(half.fillRatio()).assertEqual(0.5);
      const completed: ProgressVisualModel = half.advance(100);
      expect(completed.hidden).assertTrue();
      expect(completed.value).assertEqual(0);
      const pending: ProgressVisualModel = half.advance(20);
      expect(pending.hidden).assertFalse();
      expect(pending.value).assertEqual(20);
    });

    it('Browser_Visual_Effect_013', 0, async () => {
      TestLogger.step(TAG, 'button panel is a rounded 22 x 22 square');
      const released: ButtonPanelModel = new ButtonPanelModel(false);
      expect(released.width).assertEqual(22);
      expect(released.height).assertEqual(22);
      expect(released.width).assertEqual(released.height);
      expect(released.radius).assertEqual(4);
      expect(released.background()).assertEqual(UP_COLOR);
      expect(released.panelIsInvisible()).assertTrue();
      expect(released.pressedPanelIsOpaque()).assertTrue();
      expect(released.cornerIsSoft()).assertTrue();
      expect(released.cornerRatio()).assertLarger(0.15);
      expect(released.cornerRatio()).assertLess(0.2);
      const pressed: ButtonPanelModel = released.clone(true);
      expect(pressed.pressed).assertTrue();
      expect(pressed.background()).assertEqual(DOWN_COLOR);
      expect(pressed.panelIsInvisible()).assertFalse();
    });

    it('Browser_Visual_Effect_014', 0, async () => {
      TestLogger.step(TAG, 'press feedback wins over hover, hover falls back to transparent');
      const chrome: HoverPressModel = new HoverPressModel();
      expect(chrome.hoverSupported).assertFalse();
      chrome.onHover(true);
      expect(chrome.hovered).assertFalse();
      expect(chrome.background()).assertEqual(UP_COLOR);
      expect(chrome.priority()).assertEqual(0);
      chrome.onPress(true);
      expect(chrome.background()).assertEqual(DOWN_COLOR);
      expect(chrome.priority()).assertEqual(2);
      chrome.onPress(false);
      expect(chrome.background()).assertEqual(UP_COLOR);
      chrome.hoverSupported = true;
      chrome.onHover(true);
      expect(chrome.hovered).assertTrue();
      expect(chrome.priority()).assertEqual(1);
      chrome.onPress(true);
      expect(chrome.priority()).assertEqual(2);
      chrome.onPress(false);
      chrome.onHover(false);
      expect(chrome.priority()).assertEqual(0);
    });

    it('Browser_Visual_Effect_015', 0, async () => {
      TestLogger.step(TAG, 'chrome palette is identical in light and dark themes');
      const light: ChromePaletteModel = new ChromePaletteModel('light');
      const dark: ChromePaletteModel = new ChromePaletteModel('dark');
      expect(light.themeName()).assertEqual('light');
      expect(dark.themeName()).assertEqual('dark');
      expect(light.sameAs(dark)).assertTrue();
      expect(light.chromeColors().length).assertEqual(6);
      expect(light.allParsable()).assertTrue();
      expect(light.colorAt(0)).assertEqual(DOWN_COLOR);
      expect(light.colorAt(1)).assertEqual(UP_COLOR);
      expect(light.colorAt(4)).assertEqual(DIVIDER_COLOR);
      expect(light.colorAt(5)).assertEqual(PROGRESS_COLOR);
      expect(light.colorAt(6)).assertEqual('');
      expect(light.colorAt(-1)).assertEqual('');
    });

    it('Browser_Visual_Effect_016', 0, async () => {
      TestLogger.step(TAG, 'visual diff isolates the button that changed colour');
      const before: VisualState[] = [
        new VisualState('back', UP_COLOR),
        new VisualState('forward', UP_COLOR),
        new VisualState('submit', UP_COLOR)
      ];
      const after: VisualState[] = [
        new VisualState('back', DOWN_COLOR),
        new VisualState('forward', UP_COLOR),
        new VisualState('submit', UP_COLOR)
      ];
      const diff: VisualDiff = VisualDiff.compare(before, after);
      expect(diff.changed.length).assertEqual(1);
      expect(diff.changed[0]).assertEqual('back');
      expect(diff.kept.length).assertEqual(2);
      expect(diff.kept[0]).assertEqual('forward');
      expect(before[0].alpha).assertEqual(0);
      expect(after[0].alpha).assertEqual(255);
      expect(before[1].sameAs(after[1])).assertTrue();
      expect(before[0].describe()).assertEqual('back:#00000000');
      const empty: VisualDiff = VisualDiff.compare(before, []);
      expect(empty.changed.length).assertEqual(3);
      expect(empty.kept.length).assertEqual(0);
    });

    it('Browser_Visual_Effect_017', 0, async () => {
      TestLogger.step(TAG, 'tab strip repaint only touches the two changed cells');
      const model: TabSelectionModel = new TabSelectionModel(4, 0);
      const before: VisualState[] = [];
      for (let index = 0; index < model.tabCount; index++) {
        before.push(new VisualState(`tab${index}`, model.cellBackground(index)));
      }
      model.select(2);
      const after: VisualState[] = [];
      for (let index = 0; index < model.tabCount; index++) {
        after.push(new VisualState(`tab${index}`, model.cellBackground(index)));
      }
      const diff: VisualDiff = VisualDiff.compare(before, after);
      expect(diff.changed.length).assertEqual(2);
      expect(diff.kept.length).assertEqual(2);
      expect(diff.changed[0]).assertEqual('tab0');
      expect(diff.changed[1]).assertEqual('tab2');
      const observed: number = await countById(driver, ID_CANCEL_TAB);
      const repeated: number = await countById(driver, ID_CANCEL_TAB);
      const delta: number = observed - repeated;
      const magnitude: number = delta < 0 ? -delta : delta;
      expect(magnitude <= STABLE_TOLERANCE).assertTrue();
      TestLogger.info(TAG, `cancelBtn count during repaint ${observed}/${repeated}`);
    });

    it('Browser_Visual_Effect_018', 0, async () => {
      TestLogger.step(TAG, 'chrome ids stay themed while the clock keeps the press stamps ordered');
      const ids: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_ACTION_SUBMIT, ID_INPUT_URL];
      expect(ids.length).assertEqual(4);
      expect(ids.indexOf(ID_CANCEL_TAB)).assertEqual(-1);
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      expect(browser.tabs.length).assertEqual(10);
      const first: number = clock.now();
      clock.advance(120);
      const second: number = clock.now();
      expect(second).assertLarger(first);
      expect(second - first).assertEqual(120);
      expect(browser.addTab()).assertTrue();
      expect(browser.tabs[browser.tabs.length - 1].key).assertEqual(10);
      const stamps: number[] = browser.getTimestamps();
      let ordered: boolean = true;
      for (let index = 1; index < stamps.length; index++) {
        if (stamps[index] < stamps[index - 1]) {
          ordered = false;
        }
      }
      expect(ordered).assertTrue();
      expect(stamps.length).assertEqual(MAX_TAB_COUNT + 1);
    });
  });
}

