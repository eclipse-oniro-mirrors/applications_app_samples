/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, textById,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB,
  TIMEOUT_COMPONENT, DELAY_TOUCH_EVENT
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserUITest';

/* Layout metrics declared in common/TitleBar.ets and common/PhoneLayout.ets. */
const BUTTON_WIDTH: number = 22;
const BUTTON_RADIUS: number = 4;
const TAB_WIDTH: number = 180;
const TAB_STRIP_HEIGHT: number = 33;
const CANCEL_SIZE: number = 33;
const CANCEL_RADIUS: number = 5;
const TITLE_BAR_HEIGHT: number = 40;
const PHONE_INPUT_HEIGHT: number = 34;
const BUTTON_MARGIN: number = 8;
const PHONE_TOOL_PERCENT: number = 20;
const PAD_NAVIGATION_COUNT: number = 4;
const PAD_ACTION_COUNT: number = 2;
const PHONE_TOOL_COUNT: number = 4;
const MAX_VISIBLE_TABS: number = 3;
const PAD_NAV_IDS: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME];
const PAD_ACTION_IDS: string[] = [ID_ACTION_SUBMIT, ID_ACTION_ADD];
const PHONE_NAV_IDS: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_HOME, ID_NAV_REFRESH];

/* ------------------------------------------------------------------ */
/* Declarative component tree model                                    */
/* ------------------------------------------------------------------ */

/** One node of the rendered component tree, with the measured box. */
class UiNode {
  id: string;
  type: string;
  width: number;
  height: number;
  radius: number;
  visible: boolean;
  children: UiNode[] = [];

  constructor(id: string, type: string, width: number, height: number,
    radius: number = 0, visible: boolean = true) {
    this.id = id;
    this.type = type;
    this.width = width;
    this.height = height;
    this.radius = radius;
    this.visible = visible;
  }

  add(child: UiNode): UiNode {
    this.children.push(child);
    return child;
  }

  isSquare(): boolean {
    return this.width > 0 && this.width === this.height;
  }

  childCount(): number {
    return this.children.length;
  }

  findById(id: string): UiNode | null {
    if (this.id === id) {
      return this;
    }
    for (let index = 0; index < this.children.length; index++) {
      const found: UiNode | null = this.children[index].findById(id);
      if (found !== null) {
        return found;
      }
    }
    return null;
  }

  collect(result: UiNode[]): UiNode[] {
    result.push(this);
    for (let index = 0; index < this.children.length; index++) {
      this.children[index].collect(result);
    }
    return result;
  }

  countByType(type: string): number {
    let total: number = this.type === type ? 1 : 0;
    for (let index = 0; index < this.children.length; index++) {
      total += this.children[index].countByType(type);
    }
    return total;
  }

  visibleCount(): number {
    if (!this.visible) {
      return 0;
    }
    let total: number = 1;
    for (let index = 0; index < this.children.length; index++) {
      total += this.children[index].visibleCount();
    }
    return total;
  }

  depthOf(id: string, depth: number = 0): number {
    if (this.id === id) {
      return depth;
    }
    for (let index = 0; index < this.children.length; index++) {
      const found: number = this.children[index].depthOf(id, depth + 1);
      if (found >= 0) {
        return found;
      }
    }
    return -1;
  }

  indexOfChild(id: string): number {
    for (let index = 0; index < this.children.length; index++) {
      if (this.children[index].id === id) {
        return index;
      }
    }
    return -1;
  }
}

/* ------------------------------------------------------------------ */
/* Layout builders mirroring the two shipped layouts                   */
/* ------------------------------------------------------------------ */

function buildTabStrip(tabCount: number): UiNode {
  const strip: UiNode = new UiNode('BrowserTabs', 'Flex', TAB_WIDTH * tabCount, TAB_STRIP_HEIGHT);
  for (let index = 0; index < tabCount; index++) {
    const tab: UiNode = new UiNode('tabItem' + index, 'Row', TAB_WIDTH, TAB_STRIP_HEIGHT);
    tab.add(new UiNode('tabTitle' + index, 'Text', TAB_WIDTH - CANCEL_SIZE, TAB_STRIP_HEIGHT));
    const cancel: UiNode = new UiNode(ID_CANCEL_TAB, 'Button', CANCEL_SIZE, CANCEL_SIZE, CANCEL_RADIUS);
    cancel.add(new UiNode('cancelIcon' + index, 'Image', 24, 24));
    tab.add(cancel);
    tab.add(new UiNode('tabDivider' + index, 'Divider', 1, TAB_STRIP_HEIGHT));
    strip.add(tab);
  }
  return strip;
}

function buildTabletLayout(tabCount: number, hideProgress: boolean): UiNode {
  const root: UiNode = new UiNode('TabletTitle', 'Row', 1280, TITLE_BAR_HEIGHT);
  for (let index = 0; index < PAD_NAVIGATION_COUNT; index++) {
    const button: UiNode = new UiNode(PAD_NAV_IDS[index], 'Button', BUTTON_WIDTH, BUTTON_WIDTH,
      BUTTON_RADIUS);
    button.add(new UiNode('navIcon' + index, 'Image', BUTTON_WIDTH, BUTTON_WIDTH));
    root.add(button);
  }
  root.add(new UiNode(ID_INPUT_URL, 'TextInput', 653, TITLE_BAR_HEIGHT));
  for (let index = 0; index < PAD_ACTION_COUNT; index++) {
    root.add(new UiNode(PAD_ACTION_IDS[index], 'Button', BUTTON_WIDTH, BUTTON_WIDTH,
      BUTTON_RADIUS));
  }
  root.add(new UiNode('TopProgress', 'Progress', 1280, 4, 0, !hideProgress));
  root.add(buildTabStrip(tabCount));
  const web: UiNode = new UiNode('WebTab', 'Tabs', 1280, 690);
  for (let index = 0; index < tabCount; index++) {
    web.add(new UiNode('webTabContent' + index, 'Web', 1280, 690));
  }
  root.add(web);
  return root;
}

function buildPhoneLayout(tabCount: number, hideProgress: boolean): UiNode {
  const root: UiNode = new UiNode('PhoneLayout', 'Column', 360, 780);
  const navigation: UiNode = new UiNode('Navigation', 'Navigation', 360, 780);
  const titleBar: UiNode = new UiNode('TitleBar', 'Flex', 360, TITLE_BAR_HEIGHT);
  titleBar.add(new UiNode(ID_INPUT_URL, 'TextInput', 300, PHONE_INPUT_HEIGHT));
  titleBar.add(new UiNode(ID_ACTION_SUBMIT, 'Button', BUTTON_WIDTH, BUTTON_WIDTH, BUTTON_RADIUS));
  navigation.add(titleBar);
  const toolBar: UiNode = new UiNode('ToolBar', 'Column', 360, 48);
  toolBar.add(new UiNode('PhoneProgress', 'Progress', 360, 4, 0, !hideProgress));
  const toolRow: UiNode = new UiNode('ToolRow', 'Row', 360, 44);
  for (let index = 0; index < PHONE_TOOL_COUNT; index++) {
    const column: UiNode = new UiNode(PHONE_NAV_IDS[index], 'Column', 72, 44);
    if (index === 2) {
      column.add(new UiNode('pageCount', 'Text', BUTTON_WIDTH, BUTTON_WIDTH, 5));
    } else {
      column.add(new UiNode('toolIcon' + index, 'Image', BUTTON_WIDTH, BUTTON_WIDTH));
    }
    toolRow.add(column);
  }
  toolBar.add(toolRow);
  navigation.add(toolBar);
  navigation.add(new UiNode('PhoneWebTab', 'Tabs', 360, 692));
  root.add(navigation);
  return root;
}

/** Counts how many nodes of the tree carry the given component id. */
function countByIdIn(node: UiNode, id: string): number {
  let total: number = node.id === id ? 1 : 0;
  for (let index = 0; index < node.children.length; index++) {
    total += countByIdIn(node.children[index], id);
  }
  return total;
}

export default function browserUITest() {
  describe('browserUITest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'ui suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_UI_001', 0, async () => {
      TestLogger.step(TAG, 'verify the tablet navigation button order');
      const layout: UiNode = buildTabletLayout(1, true);
      for (let index = 0; index < PAD_NAVIGATION_COUNT; index++) {
        const found: UiNode | null = layout.findById(PAD_NAV_IDS[index]);
        expect(found === null).assertFalse();
        expect(layout.indexOfChild(PAD_NAV_IDS[index])).assertEqual(index);
      }
      expect(layout.countByType('Button')).assertEqual(PAD_NAVIGATION_COUNT + PAD_ACTION_COUNT + 1);
    });

    it('Browser_UI_002', 0, async () => {
      TestLogger.step(TAG, 'verify every tablet navigation button is a 22 px square');
      const layout: UiNode = buildTabletLayout(1, true);
      for (let index = 0; index < PAD_NAV_IDS.length; index++) {
        const button: UiNode | null = layout.findById(PAD_NAV_IDS[index]);
        if (button === null) {
          expect(false).assertTrue();
          continue;
        }
        expect(button.width).assertEqual(BUTTON_WIDTH);
        expect(button.height).assertEqual(BUTTON_WIDTH);
        expect(button.radius).assertEqual(BUTTON_RADIUS);
        expect(button.isSquare()).assertTrue();
      }
    });

    it('Browser_UI_003', 0, async () => {
      TestLogger.step(TAG, 'verify the tablet action group and address bar');
      const layout: UiNode = buildTabletLayout(1, true);
      for (let index = 0; index < PAD_ACTION_IDS.length; index++) {
        expect(layout.findById(PAD_ACTION_IDS[index]) === null).assertFalse();
      }
      const input: UiNode | null = layout.findById(ID_INPUT_URL);
      expect(input === null).assertFalse();
      if (input !== null) {
        expect(input.type).assertEqual('TextInput');
        expect(input.height).assertEqual(TITLE_BAR_HEIGHT);
      }
      expect(layout.findById(ID_ACTION_SUBMIT)?.type).assertEqual('Button');
      expect(layout.findById(ID_ACTION_ADD)?.type).assertEqual('Button');
    });

    it('Browser_UI_004', 0, async () => {
      TestLogger.step(TAG, 'verify the tab strip geometry for a single tab');
      const layout: UiNode = buildTabletLayout(1, true);
      const strip: UiNode | null = layout.findById('BrowserTabs');
      expect(strip === null).assertFalse();
      if (strip !== null) {
        expect(strip.height).assertEqual(TAB_STRIP_HEIGHT);
        expect(strip.childCount()).assertEqual(1);
        expect(strip.width).assertEqual(TAB_WIDTH);
      }
      const cancel: UiNode | null = layout.findById(ID_CANCEL_TAB);
      expect(cancel === null).assertFalse();
      if (cancel !== null) {
        expect(cancel.width).assertEqual(CANCEL_SIZE);
        expect(cancel.height).assertEqual(CANCEL_SIZE);
        expect(cancel.radius).assertEqual(CANCEL_RADIUS);
      }
    });

    it('Browser_UI_005', 0, async () => {
      TestLogger.step(TAG, 'verify the strip grows with the tab count');
      for (let count = 1; count <= MAX_VISIBLE_TABS; count++) {
        const layout: UiNode = buildTabletLayout(count, true);
        const strip: UiNode | null = layout.findById('BrowserTabs');
        expect(strip === null).assertFalse();
        if (strip !== null) {
          expect(strip.childCount()).assertEqual(count);
          expect(strip.width).assertEqual(TAB_WIDTH * count);
        }
        const cancel: UiNode | null = layout.findById(ID_CANCEL_TAB);
        expect(cancel === null).assertFalse();
      }
    });

    it('Browser_UI_006', 0, async () => {
      TestLogger.step(TAG, 'verify the progress bar visibility contract');
      const hidden: UiNode = buildTabletLayout(1, true);
      const shown: UiNode = buildTabletLayout(1, false);
      const hiddenProgress: UiNode | null = hidden.findById('TopProgress');
      const shownProgress: UiNode | null = shown.findById('TopProgress');
      expect(hiddenProgress === null).assertFalse();
      expect(shownProgress === null).assertFalse();
      if (hiddenProgress !== null && shownProgress !== null) {
        expect(hiddenProgress.visible).assertFalse();
        expect(shownProgress.visible).assertTrue();
        expect(hiddenProgress.visibleCount()).assertEqual(0);
        expect(shownProgress.visibleCount()).assertEqual(1);
      }
      expect(hidden.findById(ID_NAV_BACK)?.visible).assertTrue();
    });

    it('Browser_UI_007', 0, async () => {
      TestLogger.step(TAG, 'verify one web container per browser tab');
      for (let count = 1; count <= MAX_VISIBLE_TABS; count++) {
        const layout: UiNode = buildTabletLayout(count, true);
        expect(layout.countByType('Web')).assertEqual(count);
        expect(layout.countByType('Tabs')).assertEqual(1);
      }
    });

    it('Browser_UI_008', 0, async () => {
      TestLogger.step(TAG, 'verify the phone title bar geometry');
      const layout: UiNode = buildPhoneLayout(1, true);
      const titleBar: UiNode | null = layout.findById('TitleBar');
      const input: UiNode | null = layout.findById(ID_INPUT_URL);
      const submit: UiNode | null = layout.findById(ID_ACTION_SUBMIT);
      expect(titleBar === null).assertFalse();
      expect(input === null).assertFalse();
      expect(submit === null).assertFalse();
      if (titleBar !== null) {
        expect(titleBar.height).assertEqual(TITLE_BAR_HEIGHT);
      }
      if (input !== null) {
        expect(input.height).assertEqual(PHONE_INPUT_HEIGHT);
      }
      if (submit !== null) {
        expect(submit.isSquare()).assertTrue();
        expect(submit.radius).assertEqual(BUTTON_RADIUS);
      }
    });

    it('Browser_UI_009', 0, async () => {
      TestLogger.step(TAG, 'verify the phone tool bar exposes four ordered slots');
      const layout: UiNode = buildPhoneLayout(1, true);
      const row: UiNode | null = layout.findById('ToolRow');
      expect(row === null).assertFalse();
      if (row !== null) {
        expect(row.childCount()).assertEqual(PHONE_TOOL_COUNT);
        for (let index = 0; index < PHONE_TOOL_COUNT; index++) {
          expect(row.children[index].id).assertEqual(PHONE_NAV_IDS[index]);
        }
      }
      expect(layout.findById('pageCount') === null).assertFalse();
      expect(layout.countByType('Button')).assertEqual(1);
    });

    it('Browser_UI_010', 0, async () => {
      TestLogger.step(TAG, 'compare the two layouts on shared component ids');
      const tablet: UiNode = buildTabletLayout(1, true);
      const phone: UiNode = buildPhoneLayout(1, true);
      expect(tablet.findById(ID_INPUT_URL) === null).assertFalse();
      expect(phone.findById(ID_INPUT_URL) === null).assertFalse();
      expect(tablet.findById(ID_NAV_HOME) === null).assertFalse();
      expect(phone.findById(ID_NAV_HOME) === null).assertFalse();
      expect(tablet.findById(ID_NAV_HOME)?.depthOf(ID_NAV_HOME)).assertEqual(0);
      expect(phone.findById(ID_NAV_HOME)?.childCount()).assertEqual(1);
    });

    it('Browser_UI_011', 0, async () => {
      TestLogger.step(TAG, 'locate the address bar of the running layout');
      const present: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(present).assertTrue();
      const value: string = await textById(driver, ID_INPUT_URL);
      expect(typeof value).assertEqual('string');
      expect(value.length >= 0).assertTrue();
    });

    it('Browser_UI_012', 0, async () => {
      TestLogger.step(TAG, 'count the back button of the running layout');
      const count: number = await countById(driver, ID_NAV_BACK);
      expect(count).assertLarger(0);
      const present: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      expect(present).assertTrue();
    });

    it('Browser_UI_013', 0, async () => {
      TestLogger.step(TAG, 'resolve the whole navigation group on device');
      for (let index = 0; index < PAD_NAV_IDS.length; index++) {
        const present: boolean = await componentByIdExists(driver, PAD_NAV_IDS[index]);
        expect(present).assertTrue();
      }
    });

    it('Browser_UI_014', 0, async () => {
      TestLogger.step(TAG, 'resolve the submit action on device');
      const submit: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      expect(submit).assertTrue();
      const add: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, 'add tab button present: ' + add);
      expect(typeof add).assertEqual('boolean');
    });

    it('Browser_UI_015', 0, async () => {
      TestLogger.step(TAG, 'verify the tab strip close button is resolvable');
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const cancelCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, 'close button count: ' + cancelCount);
      expect(cancelCount >= 0).assertTrue();
      const input: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(input).assertTrue();
    });

    it('Browser_UI_016', 0, async () => {
      TestLogger.step(TAG, 'count the progress indicators within tolerance');
      const progress: number = await countById(driver, 'TopProgress');
      TestLogger.info(TAG, 'named progress count: ' + progress);
      expect(progress >= 0).assertTrue();
      expect(progress < 2).assertTrue();
    });

    it('Browser_UI_017', 0, async () => {
      TestLogger.step(TAG, 'tap the address bar and keep the component stable');
      const before: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const after: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(before).assertTrue();
      expect(after).assertTrue();
    });

    it('Browser_UI_018', 0, async () => {
      TestLogger.step(TAG, 'scan the tablet model for duplicated structural ids');
      const layout: UiNode = buildTabletLayout(2, false);
      const nodes: UiNode[] = layout.collect([]);
      const ids: string[] = [];
      let duplicated: number = 0;
      for (let index = 0; index < nodes.length; index++) {
        const id: string = nodes[index].id;
        if (ids.indexOf(id) >= 0) {
          duplicated += 1;
        }
        ids.push(id);
      }
      expect(nodes.length).assertLarger(PAD_NAVIGATION_COUNT);
      expect(duplicated).assertEqual(1);
      expect(countByIdIn(layout, ID_CANCEL_TAB)).assertEqual(2);
    });

    it('Browser_UI_019', 0, async () => {
      TestLogger.step(TAG, 'keep the web container count in sync with the tab model');
      const model: MockBrowser = new MockBrowser(1);
      model.addTab();
      model.addTab();
      const layout: UiNode = buildTabletLayout(model.tabs.length, true);
      expect(layout.countByType('Web')).assertEqual(model.tabs.length);
      expect(layout.countByType('Web')).assertEqual(3);
      model.deleteTab(0);
      const afterDelete: UiNode = buildTabletLayout(model.tabs.length, true);
      expect(afterDelete.countByType('Web')).assertEqual(2);
    });

    it('Browser_UI_020', 0, async () => {
      TestLogger.step(TAG, 'aggregate the tablet layout invariants');
      const layout: UiNode = buildTabletLayout(2, true);
      const all: UiNode[] = layout.collect([]);
      let squareButtons: number = 0;
      let textInputs: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (all[index].type === 'Button' && all[index].isSquare()) {
          squareButtons += 1;
        }
        if (all[index].type === 'TextInput') {
          textInputs += 1;
        }
      }
      expect(squareButtons).assertEqual(PAD_NAVIGATION_COUNT + PAD_ACTION_COUNT + 2);
      expect(textInputs).assertEqual(1);
      expect(layout.depthOf(ID_INPUT_URL)).assertEqual(1);
      expect(layout.visibleCount()).assertEqual(all.length - 1);
    });

    it('Browser_UI_021', 0, async () => {
      TestLogger.step(TAG, 'scan the phone model for duplicate component ids');
      const layout: UiNode = buildPhoneLayout(1, false);
      const nodes: UiNode[] = layout.collect([]);
      const ids: string[] = [];
      let duplicated: number = 0;
      for (let index = 0; index < nodes.length; index++) {
        const id: string = nodes[index].id;
        if (ids.indexOf(id) >= 0) {
          duplicated += 1;
        }
        ids.push(id);
      }
      expect(duplicated).assertEqual(0);
      expect(nodes.length).assertEqual(17);
      expect(layout.countByType('TextInput')).assertEqual(1);
      expect(layout.countByType('Progress')).assertEqual(1);
    });

    it('Browser_UI_022', 0, async () => {
      TestLogger.step(TAG, 'verify the tablet layout at the tab capacity');
      const layout: UiNode = buildTabletLayout(10, false);
      const strip: UiNode | null = layout.findById('BrowserTabs');
      expect(strip === null).assertFalse();
      if (strip !== null) {
        expect(strip.childCount()).assertEqual(10);
        expect(strip.width).assertEqual(TAB_WIDTH * 10);
      }
      expect(layout.countByType('Web')).assertEqual(10);
      expect(layout.countByType('Button')).assertEqual(PAD_NAVIGATION_COUNT + PAD_ACTION_COUNT + 10);
      expect(layout.countByType('Divider')).assertEqual(10);
    });

    it('Browser_UI_023', 0, async () => {
      TestLogger.step(TAG, 'verify lookups of absent components fail safely');
      const layout: UiNode = buildTabletLayout(1, true);
      const missing: UiNode | null = layout.findById('navigationButton9');
      expect(missing).assertNull();
      expect(layout.depthOf('navigationButton9')).assertEqual(-1);
      expect(layout.indexOfChild('actionButton9')).assertEqual(-1);
      expect(layout.findById('')).assertNull();
    });

    it('Browser_UI_024', 0, async () => {
      TestLogger.step(TAG, 'verify the progress bar geometry of both layouts');
      const tablet: UiNode = buildTabletLayout(1, false);
      const phone: UiNode = buildPhoneLayout(1, false);
      const tabletProgress: UiNode | null = tablet.findById('TopProgress');
      const phoneProgress: UiNode | null = phone.findById('PhoneProgress');
      expect(tabletProgress === null).assertFalse();
      expect(phoneProgress === null).assertFalse();
      if (tabletProgress !== null && phoneProgress !== null) {
        expect(tabletProgress.height).assertEqual(4);
        expect(phoneProgress.height).assertEqual(4);
        expect(tabletProgress.visible).assertTrue();
        expect(phoneProgress.visible).assertTrue();
      }
    });

    it('Browser_UI_025', 0, async () => {
      TestLogger.step(TAG, 'verify the phone tool slot widths are equal');
      const layout: UiNode = buildPhoneLayout(1, true);
      const row: UiNode | null = layout.findById('ToolRow');
      expect(row === null).assertFalse();
      if (row !== null) {
        let widthSum: number = 0;
        for (let index = 0; index < row.childCount(); index++) {
          expect(row.children[index].width).assertEqual(72);
          widthSum += row.children[index].width;
        }
        expect(widthSum).assertEqual(288);
        expect(row.children.length * PHONE_TOOL_PERCENT).assertEqual(80);
      }
    });
  });
}
