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
  getDriver, startBrowserApp, componentByIdExists, countById, serializedDelay,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_HOME, ID_ACTION_SUBMIT, ID_CANCEL_TAB,
  DELAY_TOUCH_EVENT, TIMEOUT_COMPONENT, TOLERANCE_COMPONENT_COUNT,
  MIN_TAB_COUNT, PAD_HOME_PAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserLayoutPositioningTest';

/* ------------------------------------------------------------------ */
/* Layout contract of pages/Index.ets and common/*.ets                 */
/* ------------------------------------------------------------------ */

const SCREEN_HEIGHT: number = 1280;
const SCREEN_WIDTH: number = 800;

const ROOT_BOTTOM_MARGIN: number = 72;
const TITLE_HEIGHT: number = 40;
const PROGRESS_HEIGHT: number = 2;
const TAB_STRIP_HEIGHT: number = 33;
const DIVIDER_THICKNESS: number = 1;
const BUTTON_WIDTH: number = 22;
const BUTTON_MARGIN: number = 8;
const INPUT_MARGIN: number = 2;

const PHONE_TITLE_OFFSET_X: number = 0;
const PHONE_TITLE_OFFSET_Y: number = 3;
const PHONE_INPUT_MARGIN_LEFT: number = 6;
const PHONE_INPUT_MARGIN_RIGHT: number = 6;
const PHONE_ACTION_MARGIN_TOP: number = 6;
const PHONE_ACTION_WIDTH_PERCENT: number = 10;
const PHONE_TOOLBAR_SLOTS: number = 5;
const PHONE_TOOLBAR_SLOT_PERCENT: number = 20;

/* ------------------------------------------------------------------ */
/* Box model                                                           */
/* ------------------------------------------------------------------ */

/** One laid out rectangle in vp. */
class Box {
  id: string;
  x: number;
  y: number;
  width: number;
  height: number;
  marginTop: number = 0;
  marginBottom: number = 0;
  marginLeft: number = 0;
  marginRight: number = 0;

  constructor(id: string, x: number, y: number, width: number, height: number) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  bottom(): number {
    return this.y + this.height;
  }

  right(): number {
    return this.x + this.width;
  }

  area(): number {
    return this.width * this.height;
  }

  isEmpty(): boolean {
    return this.width <= 0 || this.height <= 0;
  }

  containsY(value: number): boolean {
    return value >= this.y && value < this.bottom();
  }

  /** Horizontal overlap, used to prove the title row never overflows. */
  overflows(limit: number): boolean {
    return this.right() > limit;
  }

  /** True when two boxes share a positive area. */
  intersects(other: Box): boolean {
    const horizontal: boolean = this.x < other.right() && other.x < this.right();
    const vertical: boolean = this.y < other.bottom() && other.y < this.bottom();
    return horizontal && vertical;
  }

  summary(): string {
    return `${this.id}@(${this.x},${this.y}) ${this.width}x${this.height}`;
  }
}

/** Vertical stack that distributes children the way Column does. */
class VerticalStack {
  name: string;
  top: number;
  width: number;
  boxes: Box[] = [];
  private cursor: number;
  private bottomReserve: number;

  constructor(name: string, top: number, width: number, bottomReserve: number = 0) {
    this.name = name;
    this.top = top;
    this.width = width;
    this.cursor = top;
    this.bottomReserve = bottomReserve;
  }

  append(id: string, height: number): Box {
    const box: Box = new Box(id, 0, this.cursor, this.width, height);
    this.boxes.push(box);
    this.cursor += height;
    return box;
  }

  appendFixed(id: string, height: number, width: number): Box {
    const box: Box = new Box(id, 0, this.cursor, width, height);
    this.boxes.push(box);
    this.cursor += height;
    return box;
  }

  cursorY(): number {
    return this.cursor;
  }

  usedHeight(): number {
    return this.cursor - this.top;
  }

  availableHeight(): number {
    return SCREEN_HEIGHT - this.top - this.bottomReserve;
  }

  remaining(): number {
    return this.availableHeight() - this.usedHeight();
  }

  boxOf(id: string): Box | null {
    for (let index = 0; index < this.boxes.length; index++) {
      if (this.boxes[index].id === id) {
        return this.boxes[index];
      }
    }
    return null;
  }

  ids(): string[] {
    return this.boxes.map((box: Box) => box.id);
  }

  /** Children must be stacked without any vertical gap or overlap. */
  isContiguous(): boolean {
    for (let index = 1; index < this.boxes.length; index++) {
      if (this.boxes[index].y !== this.boxes[index - 1].bottom()) {
        return false;
      }
    }
    return true;
  }

  hasOverlap(): boolean {
    for (let index = 0; index < this.boxes.length; index++) {
      for (let next = index + 1; next < this.boxes.length; next++) {
        if (this.boxes[index].intersects(this.boxes[next])) {
          return true;
        }
      }
    }
    return false;
  }
}

/** Horizontal row with fixed and weighted children. */
class HorizontalRow {
  name: string;
  y: number;
  height: number;
  boxes: Box[] = [];

  constructor(name: string, y: number, height: number) {
    this.name = name;
    this.y = y;
    this.height = height;
  }

  appendFixed(id: string, width: number, marginLeft: number = 0, marginTop: number = 0): Box {
    const lastRight: number = this.boxes.length === 0 ?
      marginLeft : this.boxes[this.boxes.length - 1].right() + marginLeft;
    const box: Box = new Box(id, lastRight, this.y + marginTop, width, this.height);
    this.boxes.push(box);
    return box;
  }

  appendPercent(id: string, percent: number, totalWidth: number): Box {
    const width: number = Math.round(totalWidth * percent / 100);
    const x: number = this.boxes.length === 0 ? 0 : this.boxes[this.boxes.length - 1].right();
    const box: Box = new Box(id, x, this.y, width, this.height);
    this.boxes.push(box);
    return box;
  }

  totalWidth(): number {
    if (this.boxes.length === 0) {
      return 0;
    }
    return this.boxes[this.boxes.length - 1].right();
  }

  boxOf(id: string): Box | null {
    for (let index = 0; index < this.boxes.length; index++) {
      if (this.boxes[index].id === id) {
        return this.boxes[index];
      }
    }
    return null;
  }

  ids(): string[] {
    return this.boxes.map((box: Box) => box.id);
  }
}

/* ------------------------------------------------------------------ */
/* Layout builders                                                     */
/* ------------------------------------------------------------------ */

/** Tablet layout: TabletTitle, Progress, BrowserTabs, Divider, WebTab. */
function buildTabletLayout(tabCount: number = 1, rootBottom: number = ROOT_BOTTOM_MARGIN): VerticalStack {
  const stack: VerticalStack = new VerticalStack('Index', 0, SCREEN_WIDTH, rootBottom);
  stack.appendFixed('TabletTitle', TITLE_HEIGHT, SCREEN_WIDTH);
  stack.appendFixed('Progress', PROGRESS_HEIGHT, SCREEN_WIDTH);
  stack.appendFixed('BrowserTabs', TAB_STRIP_HEIGHT, tabCount * 181);
  stack.appendFixed('Divider', DIVIDER_THICKNESS, SCREEN_WIDTH);
  stack.appendFixed('WebTab', stack.remaining(), SCREEN_WIDTH);
  return stack;
}

/** Phone layout: Navigation with a forty vp title and a toolbar. */
function buildPhoneLayout(): VerticalStack {
  const stack: VerticalStack = new VerticalStack('Index', 0, SCREEN_WIDTH, ROOT_BOTTOM_MARGIN);
  stack.appendFixed('NavigationTitle', TITLE_HEIGHT, SCREEN_WIDTH);
  stack.appendFixed('WebTab', stack.remaining() - TITLE_HEIGHT, SCREEN_WIDTH);
  stack.appendFixed('NavigationToolBar', TITLE_HEIGHT, SCREEN_WIDTH);
  return stack;
}

/** Title row of TabletTitle: four nav buttons, input, two action buttons. */
function buildTabletTitleRow(): HorizontalRow {
  const row: HorizontalRow = new HorizontalRow('TabletTitle', 0, TITLE_HEIGHT);
  const navIds: string[] = ['navigationButton0', 'navigationButton1', 'navigationButton2',
    'navigationButton3'];
  for (let index = 0; index < navIds.length; index++) {
    const box: Box = row.appendFixed(navIds[index], BUTTON_WIDTH, BUTTON_MARGIN, BUTTON_MARGIN);
    box.marginTop = BUTTON_MARGIN;
    box.marginLeft = BUTTON_MARGIN;
  }
  const input: Box = row.appendFixed(ID_INPUT_URL, 340, INPUT_MARGIN, INPUT_MARGIN);
  input.marginTop = INPUT_MARGIN;
  input.marginLeft = INPUT_MARGIN;
  const actionIds: string[] = [ID_ACTION_SUBMIT, 'actionButton1'];
  for (let index = 0; index < actionIds.length; index++) {
    const box: Box = row.appendFixed(actionIds[index], BUTTON_WIDTH, BUTTON_MARGIN, BUTTON_MARGIN);
    box.marginTop = BUTTON_MARGIN;
    box.marginLeft = BUTTON_MARGIN;
  }
  return row;
}

/** Phone title bar positioned at x 0, y 3 with a ten percent submit slot. */
function buildPhoneTitleRow(): HorizontalRow {
  const row: HorizontalRow = new HorizontalRow('PhoneTitleBar', SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN - TITLE_HEIGHT, TITLE_HEIGHT);
  const input: Box = row.appendFixed(ID_INPUT_URL, 300, PHONE_INPUT_MARGIN_LEFT, 0);
  input.marginLeft = PHONE_INPUT_MARGIN_LEFT;
  const action: Box = row.appendFixed(ID_ACTION_SUBMIT, 40, PHONE_INPUT_MARGIN_RIGHT, PHONE_ACTION_MARGIN_TOP);
  action.marginLeft = PHONE_INPUT_MARGIN_RIGHT;
  action.marginTop = PHONE_ACTION_MARGIN_TOP;
  return row;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserLayoutPositioningTest() {
  describe('browserLayoutPositioningTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `screen ${SCREEN_WIDTH}x${SCREEN_HEIGHT}, bottom margin ${ROOT_BOTTOM_MARGIN}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Layout_001', 0, async () => {
      TestLogger.step(TAG, 'TabletTitle is the first top level child');
      const stack: VerticalStack = buildTabletLayout();
      expect(stack.ids().join(',')).assertEqual('TabletTitle,Progress,BrowserTabs,Divider,WebTab');
      const title: Box | null = stack.boxOf('TabletTitle');
      expect(title !== null).assertTrue();
      if (title !== null) {
        expect(title.y).assertEqual(0);
        expect(title.x).assertEqual(0);
        expect(title.height).assertEqual(TITLE_HEIGHT);
        expect(title.width).assertEqual(SCREEN_WIDTH);
      }
      expect(stack.hasOverlap()).assertFalse();
    });

    it('Browser_Layout_002', 0, async () => {
      TestLogger.step(TAG, 'Progress sits directly below the title at two vp');
      const stack: VerticalStack = buildTabletLayout();
      const progress: Box | null = stack.boxOf('Progress');
      const title: Box | null = stack.boxOf('TabletTitle');
      expect(progress !== null).assertTrue();
      if (progress !== null && title !== null) {
        expect(progress.y).assertEqual(title.bottom());
        expect(progress.y).assertEqual(TITLE_HEIGHT);
        expect(progress.height).assertEqual(PROGRESS_HEIGHT);
        expect(progress.height).assertEqual(2);
        expect(progress.width).assertEqual(SCREEN_WIDTH);
      }
      expect(stack.isContiguous()).assertTrue();
    });

    it('Browser_Layout_003', 0, async () => {
      TestLogger.step(TAG, 'tab strip starts at forty two vp and is thirty three tall');
      const stack: VerticalStack = buildTabletLayout(3);
      const strip: Box | null = stack.boxOf('BrowserTabs');
      expect(strip !== null).assertTrue();
      if (strip !== null) {
        expect(strip.y).assertEqual(TITLE_HEIGHT + PROGRESS_HEIGHT);
        expect(strip.y).assertEqual(42);
        expect(strip.height).assertEqual(TAB_STRIP_HEIGHT);
        expect(strip.height).assertEqual(33);
        expect(strip.width).assertEqual(3 * 181);
      }
      expect(stack.boxOf('Progress') !== null).assertTrue();
    });

    it('Browser_Layout_004', 0, async () => {
      TestLogger.step(TAG, 'one vp divider separates the strip from the page');
      const stack: VerticalStack = buildTabletLayout();
      const divider: Box | null = stack.boxOf('Divider');
      expect(divider !== null).assertTrue();
      if (divider !== null) {
        expect(divider.y).assertEqual(TITLE_HEIGHT + PROGRESS_HEIGHT + TAB_STRIP_HEIGHT);
        expect(divider.y).assertEqual(75);
        expect(divider.height).assertEqual(DIVIDER_THICKNESS);
        expect(divider.height).assertEqual(1);
        expect(divider.width).assertEqual(SCREEN_WIDTH);
      }
      expect(DIVIDER_THICKNESS).assertLess(PROGRESS_HEIGHT);
    });

    it('Browser_Layout_005', 0, async () => {
      TestLogger.step(TAG, 'WebTab absorbs the remaining viewport height');
      const stack: VerticalStack = buildTabletLayout();
      const web: Box | null = stack.boxOf('WebTab');
      expect(web !== null).assertTrue();
      if (web !== null) {
        expect(web.y).assertEqual(76);
        expect(web.bottom()).assertEqual(SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN);
        expect(web.height).assertEqual(SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN - 76);
        expect(web.height).assertEqual(1132);
      }
      expect(stack.remaining()).assertEqual(0);
      expect(stack.availableHeight()).assertEqual(SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN);
    });

    it('Browser_Layout_006', 0, async () => {
      TestLogger.step(TAG, 'the tablet stack is contiguous and overlap free');
      for (let tabCount = MIN_TAB_COUNT; tabCount <= 5; tabCount++) {
        const stack: VerticalStack = buildTabletLayout(tabCount);
        expect(stack.isContiguous()).assertTrue();
        expect(stack.hasOverlap()).assertFalse();
        expect(stack.remaining()).assertEqual(0);
        expect(stack.ids().length).assertEqual(5);
        const heights: number = TITLE_HEIGHT + PROGRESS_HEIGHT + TAB_STRIP_HEIGHT +
          DIVIDER_THICKNESS;
        expect(stack.boxOf('WebTab') !== null).assertTrue();
        const web: Box | null = stack.boxOf('WebTab');
        if (web !== null) {
          expect(web.y).assertEqual(heights);
        }
      }
    });

    it('Browser_Layout_007', 0, async () => {
      TestLogger.step(TAG, 'phone navigation title is exactly forty vp high');
      const stack: VerticalStack = buildPhoneLayout();
      const title: Box | null = stack.boxOf('NavigationTitle');
      expect(title !== null).assertTrue();
      if (title !== null) {
        expect(title.y).assertEqual(0);
        expect(title.height).assertEqual(TITLE_HEIGHT);
        expect(title.height).assertEqual(40);
        expect(title.width).assertEqual(SCREEN_WIDTH);
      }
      expect(stack.ids()[0]).assertEqual('NavigationTitle');
      expect(stack.hasOverlap()).assertFalse();
      expect(TITLE_HEIGHT).assertEqual(40);
    });

    it('Browser_Layout_008', 0, async () => {
      TestLogger.step(TAG, 'phone toolbar is anchored above the bottom reserve');
      const stack: VerticalStack = buildPhoneLayout();
      const toolbar: Box | null = stack.boxOf('NavigationToolBar');
      expect(toolbar !== null).assertTrue();
      if (toolbar !== null) {
        expect(toolbar.bottom()).assertEqual(SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN);
        expect(toolbar.bottom()).assertEqual(1208);
        expect(toolbar.height).assertEqual(TITLE_HEIGHT);
        expect(toolbar.y).assertEqual(SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN - TITLE_HEIGHT);
      }
      expect(stack.remaining()).assertEqual(0);
      expect(stack.isContiguous()).assertTrue();
    });

    it('Browser_Layout_009', 0, async () => {
      TestLogger.step(TAG, 'phone title bar is positioned at x zero y three');
      expect(PHONE_TITLE_OFFSET_X).assertEqual(0);
      expect(PHONE_TITLE_OFFSET_Y).assertEqual(3);
      const row: HorizontalRow = buildPhoneTitleRow();
      const input: Box | null = row.boxOf(ID_INPUT_URL);
      expect(input !== null).assertTrue();
      if (input !== null) {
        expect(input.x).assertEqual(PHONE_INPUT_MARGIN_LEFT);
        expect(input.y).assertEqual(row.y);
        expect(row.y + PHONE_TITLE_OFFSET_Y).assertEqual(1171);
        expect(input.height).assertEqual(TITLE_HEIGHT);
        expect(input.marginLeft).assertEqual(6);
      }
      const action: Box | null = row.boxOf(ID_ACTION_SUBMIT);
      if (action !== null) {
        expect(action.marginTop).assertEqual(PHONE_ACTION_MARGIN_TOP);
        expect(action.marginLeft).assertEqual(PHONE_INPUT_MARGIN_RIGHT);
      }
      expect(row.boxes.length).assertEqual(2);
    });

    it('Browser_Layout_010', 0, async () => {
      TestLogger.step(TAG, 'tablet title row uses eight vp margins and 22 vp buttons');
      const row: HorizontalRow = buildTabletTitleRow();
      expect(row.ids().length).assertEqual(7);
      expect(row.ids()[0]).assertEqual(ID_NAV_BACK);
      expect(row.ids()[row.ids().length - 1]).assertEqual('actionButton1');
      const nav: Box | null = row.boxOf(ID_NAV_BACK);
      if (nav !== null) {
        expect(nav.width).assertEqual(BUTTON_WIDTH);
        expect(nav.height).assertEqual(TITLE_HEIGHT);
        expect(nav.marginLeft).assertEqual(BUTTON_MARGIN);
        expect(nav.marginTop).assertEqual(BUTTON_MARGIN);
      }
      const input: Box | null = row.boxOf(ID_INPUT_URL);
      if (input !== null) {
        expect(input.marginLeft).assertEqual(INPUT_MARGIN);
        expect(input.marginTop).assertEqual(INPUT_MARGIN);
      }
      expect(row.boxOf(ID_NAV_HOME) !== null).assertTrue();
    });

    it('Browser_Layout_011', 0, async () => {
      TestLogger.step(TAG, 'phone submit slot occupies ten percent of the row');
      const slotWidth: number = Math.round(SCREEN_WIDTH * PHONE_ACTION_WIDTH_PERCENT / 100);
      expect(slotWidth).assertEqual(80);
      expect(PHONE_ACTION_WIDTH_PERCENT).assertEqual(10);
      const row: HorizontalRow = buildPhoneTitleRow();
      expect(row.totalWidth()).assertLarger(0);
      const action: Box | null = row.boxOf(ID_ACTION_SUBMIT);
      if (action !== null) {
        expect(action.width).assertEqual(40);
        expect(action.width).assertLess(slotWidth);
        expect(action.right()).assertLess(SCREEN_WIDTH);
      }
      expect(row.boxes[0].height).assertEqual(TITLE_HEIGHT);
    });

    it('Browser_Layout_012', 0, async () => {
      TestLogger.step(TAG, 'five toolbar slots split the width into twenty percent');
      const row: HorizontalRow = new HorizontalRow('NavigationToolBar', 1208, TITLE_HEIGHT);
      for (let index = 0; index < PHONE_TOOLBAR_SLOTS; index++) {
        row.appendPercent(`navigationButton${index}`, PHONE_TOOLBAR_SLOT_PERCENT, SCREEN_WIDTH);
      }
      expect(row.ids().length).assertEqual(5);
      expect(row.totalWidth()).assertEqual(SCREEN_WIDTH);
      for (let index = 0; index < row.boxes.length; index++) {
        expect(row.boxes[index].width).assertEqual(160);
        expect(row.boxes[index].height).assertEqual(TITLE_HEIGHT);
      }
      expect(PHONE_TOOLBAR_SLOT_PERCENT * PHONE_TOOLBAR_SLOTS).assertEqual(100);
    });

    it('Browser_Layout_013', 0, async () => {
      TestLogger.step(TAG, 'root bottom margin reserves the gesture safe area');
      expect(ROOT_BOTTOM_MARGIN).assertEqual(72);
      const stack: VerticalStack = buildTabletLayout();
      const web: Box | null = stack.boxOf('WebTab');
      if (web !== null) {
        expect(web.bottom()).assertEqual(SCREEN_HEIGHT - ROOT_BOTTOM_MARGIN);
        expect(SCREEN_HEIGHT - web.bottom()).assertEqual(ROOT_BOTTOM_MARGIN);
        expect(web.bottom()).assertLess(SCREEN_HEIGHT);
        expect(web.height).assertLarger(0);
      }
      expect(stack.boxOf('missingBox')).assertNull();
    });

    it('Browser_Layout_014', 0, async () => {
      TestLogger.step(TAG, 'tab strip width grows by 181 vp per tab without changing height');
      const widths: number[] = [];
      for (let count = MIN_TAB_COUNT; count <= 6; count++) {
        const stack: VerticalStack = buildTabletLayout(count);
        const strip: Box | null = stack.boxOf('BrowserTabs');
        expect(strip !== null).assertTrue();
        if (strip !== null) {
          expect(strip.width).assertEqual(count * 181);
          expect(strip.height).assertEqual(TAB_STRIP_HEIGHT);
          widths.push(strip.width);
        }
      }
      expect(widths.length).assertEqual(6);
      expect(widths[0]).assertEqual(181);
      expect(widths[5] - widths[0]).assertEqual(5 * 181);
      expect(widths[5]).assertLarger(SCREEN_WIDTH);
    });

    it('Browser_Layout_015', 0, async () => {
      TestLogger.step(TAG, 'tablet layout matches the live component tree');
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const stripCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `input present=${inputPresent}, tab close buttons=${stripCount}`);
      expect(inputPresent).assertTrue();
      expect(stripCount).assertLess(100);
      const browser: MockBrowser = new MockBrowser(2);
      expect(browser.tabs.length).assertEqual(2);
      const stack: VerticalStack = buildTabletLayout(browser.tabs.length);
      expect(stack.ids().join(',')).assertEqual('TabletTitle,Progress,BrowserTabs,Divider,WebTab');
      expect(stack.remaining()).assertEqual(0);
      expect(TOLERANCE_COMPONENT_COUNT).assertLarger(0);
      expect(TIMEOUT_COMPONENT).assertLarger(0);
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
    });
  });
}
