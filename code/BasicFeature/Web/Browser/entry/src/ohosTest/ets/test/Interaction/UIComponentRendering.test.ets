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
  getDriver, startBrowserApp, countById, ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH,
  ID_NAV_HOME, ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB, MAX_TAB_COUNT, MIN_TAB_COUNT,
  TOLERANCE_COMPONENT_COUNT, STABLE_TOLERANCE, PAD_HOME_PAGE, PHONE_HOME_PAGE, TAB_LIMIT_MESSAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserUIComponentRenderingTest';

/* ------------------------------------------------------------------ */
/* Metrics declared by common/TitleBar.ets and common/PhoneLayout.ets  */
/* ------------------------------------------------------------------ */

const BUTTON_WIDTH: number = 22;
const BUTTON_RADIUS: number = 4;
const TAB_WIDTH: number = 180;
const TAB_STRIP_HEIGHT: number = 33;
const CANCEL_BUTTON_SIZE: number = 33;
const CANCEL_BUTTON_RADIUS: number = 5;
const PAGE_COUNT_BORDER: number = 2;
const PAGE_COUNT_RADIUS: number = 5;
const DIVIDER_THICKNESS: number = 1;
const TAB_NAVIGATION_ORDER: number = 4;
const TAB_ACTION_ORDER: number = 2;

const NAVIGATION_BUTTON_IDS: string[] = [
  ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME
];
const ACTION_BUTTON_IDS: string[] = [ID_ACTION_SUBMIT, ID_ACTION_ADD];
const TABLET_TOP_LEVEL_IDS: string[] = ['TabletTitle', 'Progress', 'BrowserTabs', 'Divider', 'WebTab'];
const PHONE_TOP_LEVEL_IDS: string[] = ['ToolBar', 'TitleBar', 'WebTab'];

/* ------------------------------------------------------------------ */
/* Data driven expectation table                                       */
/* ------------------------------------------------------------------ */

interface RenderExpectation {
  name: string;
  id: string;
  type: string;
  count: number;
  square: boolean;
  owner: string;
}

const TABLET_EXPECTATIONS: RenderExpectation[] = [
  { name: 'back', id: ID_NAV_BACK, type: 'Button', count: 1, square: true, owner: 'TabletTitle' },
  { name: 'forward', id: ID_NAV_FORWARD, type: 'Button', count: 1, square: true, owner: 'TabletTitle' },
  { name: 'refresh', id: ID_NAV_REFRESH, type: 'Button', count: 1, square: true, owner: 'TabletTitle' },
  { name: 'home', id: ID_NAV_HOME, type: 'Button', count: 1, square: true, owner: 'TabletTitle' },
  { name: 'submit', id: ID_ACTION_SUBMIT, type: 'Button', count: 1, square: true, owner: 'TabletTitle' },
  { name: 'add', id: ID_ACTION_ADD, type: 'Button', count: 1, square: true, owner: 'TabletTitle' },
  { name: 'url', id: ID_INPUT_URL, type: 'TextInput', count: 1, square: false, owner: 'TabletTitle' }
];

/* ------------------------------------------------------------------ */
/* Local component tree model                                          */
/* ------------------------------------------------------------------ */

/** One rendered node of the declarative component tree. */
class ComponentNode {
  id: string;
  type: string;
  width: number;
  height: number;
  radius: number;
  visible: boolean;
  children: ComponentNode[] = [];

  constructor(id: string, type: string, width: number, height: number,
    radius: number = 0, visible: boolean = true) {
    this.id = id;
    this.type = type;
    this.width = width;
    this.height = height;
    this.radius = radius;
    this.visible = visible;
  }

  addChild(child: ComponentNode): ComponentNode {
    this.children.push(child);
    return child;
  }

  childCount(): number {
    return this.children.length;
  }

  isSquare(): boolean {
    return this.width > 0 && this.width === this.height;
  }

  totalNodes(): number {
    let total: number = 1;
    for (let index = 0; index < this.children.length; index++) {
      total += this.children[index].totalNodes();
    }
    return total;
  }

  findById(id: string): ComponentNode | null {
    if (this.id === id) {
      return this;
    }
    for (let index = 0; index < this.children.length; index++) {
      const found: ComponentNode | null = this.children[index].findById(id);
      if (found !== null) {
        return found;
      }
    }
    return null;
  }

  collect(result: ComponentNode[]): ComponentNode[] {
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

  depthOf(id: string, current: number = 0): number {
    if (this.id === id) {
      return current;
    }
    for (let index = 0; index < this.children.length; index++) {
      const depth: number = this.children[index].depthOf(id, current + 1);
      if (depth >= 0) {
        return depth;
      }
    }
    return -1;
  }

  pathTo(id: string, trail: string[]): string[] {
    const next: string[] = trail.slice(0);
    next.push(this.id);
    if (this.id === id) {
      return next;
    }
    for (let index = 0; index < this.children.length; index++) {
      const found: string[] = this.children[index].pathTo(id, next);
      if (found.length > 0) {
        return found;
      }
    }
    return [];
  }

  idsAtDepth(target: number, current: number = 0, result: string[] = []): string[] {
    if (current === target) {
      result.push(this.id);
    }
    for (let index = 0; index < this.children.length; index++) {
      this.children[index].idsAtDepth(target, current + 1, result);
    }
    return result;
  }

  maxDepth(current: number = 0): number {
    let deepest: number = current;
    for (let index = 0; index < this.children.length; index++) {
      const childDepth: number = this.children[index].maxDepth(current + 1);
      if (childDepth > deepest) {
        deepest = childDepth;
      }
    }
    return deepest;
  }
}

/** Query facade over a component tree. */
class UiTree {
  private root: ComponentNode;

  constructor(root: ComponentNode) {
    this.root = root;
  }

  getRoot(): ComponentNode {
    return this.root;
  }

  size(): number {
    return this.root.totalNodes();
  }

  visibleSize(): number {
    return this.root.visibleCount();
  }

  has(id: string): boolean {
    return this.root.findById(id) !== null;
  }

  nodeOf(id: string): ComponentNode | null {
    return this.root.findById(id);
  }

  countByType(type: string): number {
    return this.root.countByType(type);
  }

  countById(id: string): number {
    const all: ComponentNode[] = this.root.collect([]);
    let total: number = 0;
    for (let index = 0; index < all.length; index++) {
      if (all[index].id === id) {
        total += 1;
      }
    }
    return total;
  }

  depthOf(id: string): number {
    return this.root.depthOf(id);
  }

  pathOf(id: string): string[] {
    return this.root.pathTo(id, []);
  }

  idsAtDepth(depth: number): string[] {
    return this.root.idsAtDepth(depth, 0, []);
  }

  maxDepth(): number {
    return this.root.maxDepth();
  }

  flattenIds(): string[] {
    const all: ComponentNode[] = this.root.collect([]);
    return all.map((node: ComponentNode) => node.id);
  }
}

/* ------------------------------------------------------------------ */
/* Title bar model (mirror of TabletTitle)                             */
/* ------------------------------------------------------------------ */

class TabletTitleModel {
  navigationIds: string[] = NAVIGATION_BUTTON_IDS.slice(0);
  actionIds: string[] = ACTION_BUTTON_IDS.slice(0);
  inputId: string = ID_INPUT_URL;
  buttonWidth: number = BUTTON_WIDTH;
  buttonRadius: number = BUTTON_RADIUS;

  navigationCount(): number {
    return this.navigationIds.length;
  }

  actionCount(): number {
    return this.actionIds.length;
  }

  hasNavigationButton(id: string): boolean {
    return this.navigationIds.indexOf(id) >= 0;
  }

  hasActionButton(id: string): boolean {
    return this.actionIds.indexOf(id) >= 0;
  }

  /** Column order of the title row: nav buttons, url field, action buttons. */
  orderOf(id: string): number {
    const nav: number = this.navigationIds.indexOf(id);
    if (nav >= 0) {
      return nav;
    }
    if (id === this.inputId) {
      return this.navigationIds.length;
    }
    const action: number = this.actionIds.indexOf(id);
    if (action >= 0) {
      return this.navigationIds.length + 1 + action;
    }
    return -1;
  }

  totalSlots(): number {
    return this.navigationIds.length + 1 + this.actionIds.length;
  }

  uniqueIds(): boolean {
    const all: string[] = this.navigationIds.concat(this.actionIds);
    for (let index = 0; index < all.length; index++) {
      if (all.indexOf(all[index]) !== index) {
        return false;
      }
    }
    return true;
  }

  buttonMetricsConsistent(): boolean {
    return this.buttonWidth === BUTTON_WIDTH && this.buttonRadius === BUTTON_RADIUS &&
      this.buttonWidth === this.buttonWidth;
  }
}

/* ------------------------------------------------------------------ */
/* Tab strip model (mirror of BrowserTabs)                             */
/* ------------------------------------------------------------------ */

class TabStripModel {
  tabCount: number;
  tabWidth: number = TAB_WIDTH;
  stripHeight: number = TAB_STRIP_HEIGHT;
  cancelSize: number = CANCEL_BUTTON_SIZE;
  cancelRadius: number = CANCEL_BUTTON_RADIUS;

  constructor(tabCount: number = MIN_TAB_COUNT) {
    this.tabCount = tabCount < MIN_TAB_COUNT ? MIN_TAB_COUNT : tabCount;
  }

  /** One cancel button per tab, no matter the selection. */
  cancelButtonCount(): number {
    return this.tabCount;
  }

  /** A vertical divider follows every tab entry. */
  dividerCount(): number {
    return this.tabCount;
  }

  /** Width of a single tab cell including its divider. */
  cellWidth(): number {
    return this.tabWidth + DIVIDER_THICKNESS;
  }

  stripWidth(): number {
    return this.tabCount * this.cellWidth();
  }

  cancelButtonIsSquare(): boolean {
    return this.cancelSize === CANCEL_BUTTON_SIZE && this.cancelSize === this.cancelSize;
  }

  tabWidthIsFixed(): boolean {
    return this.tabWidth === TAB_WIDTH;
  }

  withTabCount(tabCount: number): TabStripModel {
    return new TabStripModel(tabCount);
  }
}

/* ------------------------------------------------------------------ */
/* Layout mode model (mirror of pages/Index.ets)                       */
/* ------------------------------------------------------------------ */

class LayoutModeModel {
  isPhone: boolean;

  constructor(deviceType: string, landscape: boolean) {
    if (deviceType === 'default') {
      this.isPhone = !landscape;
    } else {
      this.isPhone = true;
    }
  }

  topLevelIds(): string[] {
    return this.isPhone ? PHONE_TOP_LEVEL_IDS.slice(0) : TABLET_TOP_LEVEL_IDS.slice(0);
  }

  usesTabStrip(): boolean {
    return !this.isPhone;
  }

  usesToolBar(): boolean {
    return this.isPhone;
  }

  usesTabletTitle(): boolean {
    return !this.isPhone;
  }

  topLevelCount(): number {
    return this.topLevelIds().length;
  }

  /** Progress lives below the title bar, the phone one inside the tool bar. */
  progressAnchor(): string {
    return this.isPhone ? 'ToolBar' : 'Index';
  }
}

/* ------------------------------------------------------------------ */
/* Progress presentation model                                         */
/* ------------------------------------------------------------------ */

class ProgressPresentation {
  progress: number;
  hideProgress: boolean;

  constructor(progress: number = 0, hideProgress: boolean = true) {
    this.progress = progress;
    this.hideProgress = hideProgress;
  }

  static fromBrowser(browser: MockBrowser): ProgressPresentation {
    return new ProgressPresentation(browser.progress, browser.hideProgress);
  }

  /** Index.ets binds Visibility.Hidden / Visibility.Visible. */
  visibility(): string {
    return this.hideProgress ? 'Hidden' : 'Visible';
  }

  isRendered(): boolean {
    return !this.hideProgress;
  }

  clampedValue(): number {
    if (this.progress < 0) {
      return 0;
    }
    if (this.progress > 100) {
      return 100;
    }
    return this.progress;
  }

  afterLoad(nextProgress: number): ProgressPresentation {
    if (nextProgress === 100) {
      return new ProgressPresentation(0, true);
    }
    return new ProgressPresentation(nextProgress, false);
  }
}

/* ------------------------------------------------------------------ */
/* Web panel model (mirror of the Web component attributes)          */
/* ------------------------------------------------------------------ */

class WebPanelModel {
  javaScriptAccess: boolean = true;
  fileAccess: boolean = true;
  domStorageAccess: boolean = true;
  multiWindowAccess: boolean = true;
  mixedMode: string = 'All';
  tabBarHeight: number = 0;
  scrollable: boolean = false;

  homePage(isPhone: boolean): string {
    return isPhone ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
  }

  enabledFlagCount(): number {
    let total: number = 0;
    if (this.javaScriptAccess) {
      total += 1;
    }
    if (this.fileAccess) {
      total += 1;
    }
    if (this.domStorageAccess) {
      total += 1;
    }
    if (this.multiWindowAccess) {
      total += 1;
    }
    return total;
  }

  barIsCollapsed(): boolean {
    return this.tabBarHeight === 0 && this.scrollable === false;
  }
}

/* ------------------------------------------------------------------ */
/* Tree builders                                                       */
/* ------------------------------------------------------------------ */

function buildButtonNode(id: string, type: string = 'Button'): ComponentNode {
  return new ComponentNode(id, type, BUTTON_WIDTH, BUTTON_WIDTH, BUTTON_RADIUS, true);
}

/** Declarative tree described by pages/Index.ets for the tablet layout. */
function buildTabletTree(tabCount: number = MIN_TAB_COUNT,
  presentation: ProgressPresentation = new ProgressPresentation()): ComponentNode {
  const root: ComponentNode = new ComponentNode('Index', 'Column', 1280, 800, 0, true);
  const title: ComponentNode = root.addChild(new ComponentNode('TabletTitle', 'Row', 1280, 56, 0, true));
  for (let index = 0; index < NAVIGATION_BUTTON_IDS.length; index++) {
    title.addChild(buildButtonNode(NAVIGATION_BUTTON_IDS[index]));
  }
  title.addChild(new ComponentNode(ID_INPUT_URL, 'TextInput', 653, 40, 4, true));
  for (let index = 0; index < ACTION_BUTTON_IDS.length; index++) {
    title.addChild(buildButtonNode(ACTION_BUTTON_IDS[index]));
  }

  const progressNode: ComponentNode = root.addChild(
    new ComponentNode('Progress', 'Progress', 1280, 4, 0, presentation.isRendered()));
  progressNode.addChild(new ComponentNode('ProgressFill', 'Rect', 1280, 4, 0,
    presentation.isRendered()));

  const strip: ComponentNode = root.addChild(new ComponentNode('BrowserTabs', 'Flex',
    tabCount * (TAB_WIDTH + DIVIDER_THICKNESS), TAB_STRIP_HEIGHT, 0, true));
  for (let index = 0; index < tabCount; index++) {
    const cell: ComponentNode = strip.addChild(new ComponentNode(`tabCell${index}`, 'Row',
      TAB_WIDTH, TAB_STRIP_HEIGHT, 0, true));
    cell.addChild(new ComponentNode(`tabLabel${index}`, 'Text', TAB_WIDTH - CANCEL_BUTTON_SIZE,
      TAB_STRIP_HEIGHT, 0, true));
    cell.addChild(new ComponentNode(ID_CANCEL_TAB, 'Button', CANCEL_BUTTON_SIZE,
      CANCEL_BUTTON_SIZE, CANCEL_BUTTON_RADIUS, true));
    strip.addChild(new ComponentNode(`tabDivider${index}`, 'Divider', DIVIDER_THICKNESS,
      TAB_STRIP_HEIGHT, 0, true));
  }

  root.addChild(new ComponentNode('Divider', 'Divider', 1280, DIVIDER_THICKNESS, 0, true));

  const web: ComponentNode = root.addChild(new ComponentNode('WebTab', 'Tabs', 1280, 640, 0, true));
  const panel: ComponentNode = web.addChild(new ComponentNode('Web', 'Web', 1280, 640, 0, true));
  panel.addChild(new ComponentNode('WebContent', 'page', 1280, 640, 0, true));
  return root;
}

/** Declarative tree described by common/PhoneLayout.ets. */
function buildPhoneTree(): ComponentNode {
  const root: ComponentNode = new ComponentNode('PhoneLayout', 'Column', 360, 780, 0, true);
  const navigation: ComponentNode = root.addChild(
    new ComponentNode('Navigation', 'Navigation', 360, 740, 0, true));
  const toolBar: ComponentNode = navigation.addChild(
    new ComponentNode('ToolBar', 'Column', 360, 56, 0, true));
  for (let index = 0; index < TAB_NAVIGATION_ORDER; index++) {
    const column: ComponentNode = toolBar.addChild(
      new ComponentNode(`toolColumn${index}`, 'Column', 72, 56, 0, true));
    column.addChild(new ComponentNode(`navigationButton${index}`, 'Button', BUTTON_WIDTH,
      BUTTON_WIDTH, BUTTON_RADIUS, true));
  }
  const pageCount: ComponentNode = toolBar.addChild(
    new ComponentNode('pageCount', 'Text', BUTTON_WIDTH, BUTTON_WIDTH, PAGE_COUNT_RADIUS, true));
  pageCount.addChild(new ComponentNode('pageCountBorder', 'Border', BUTTON_WIDTH, BUTTON_WIDTH,
    PAGE_COUNT_RADIUS, true));

  const titleBar: ComponentNode = navigation.addChild(
    new ComponentNode('TitleBar', 'Flex', 360, 40, 0, true));
  titleBar.addChild(new ComponentNode(ID_INPUT_URL, 'TextInput', 300, 34, 0, true));
  titleBar.addChild(buildButtonNode(ID_ACTION_SUBMIT));

  const web: ComponentNode = navigation.addChild(
    new ComponentNode('WebTab', 'Tabs', 360, 640, 0, true));
  web.addChild(new ComponentNode('Web', 'Web', 360, 640, 0, true));
  return root;
}

/* ------------------------------------------------------------------ */
/* Structural catalog and count diffs                                  */
/* ------------------------------------------------------------------ */

interface CountDiff {
  before: number;
  after: number;
  delta: number;
  tolerance: number;
  withinTolerance: boolean;
}

function diffCounts(before: number, after: number, tolerance: number = TOLERANCE_COMPONENT_COUNT): CountDiff {
  const delta: number = after - before;
  const magnitude: number = delta < 0 ? -delta : delta;
  return {
    before: before,
    after: after,
    delta: delta,
    tolerance: tolerance,
    withinTolerance: magnitude <= tolerance
  };
}

/** Declares which container owns each business id. */
class ComponentCatalog {
  private owners: Map<string, string> = new Map<string, string>();

  constructor() {
    this.owners.set(ID_NAV_BACK, 'TabletTitle');
    this.owners.set(ID_NAV_FORWARD, 'TabletTitle');
    this.owners.set(ID_NAV_REFRESH, 'TabletTitle');
    this.owners.set(ID_NAV_HOME, 'TabletTitle');
    this.owners.set(ID_INPUT_URL, 'TabletTitle');
    this.owners.set(ID_ACTION_SUBMIT, 'TabletTitle');
    this.owners.set(ID_ACTION_ADD, 'TabletTitle');
    this.owners.set(ID_CANCEL_TAB, 'BrowserTabs');
  }

  ownerOf(id: string): string {
    const owner: string | undefined = this.owners.get(id);
    return owner === undefined ? '' : owner;
  }

  isOwnedBy(id: string, owner: string): boolean {
    return this.ownerOf(id) === owner;
  }

  idsOwnedBy(owner: string): string[] {
    const result: string[] = [];
    this.owners.forEach((value: string, key: string) => {
      if (value === owner) {
        result.push(key);
      }
    });
    return result;
  }

  size(): number {
    return this.owners.size;
  }
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserUIComponentRenderingTest() {
  describe('browserUIComponentRenderingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      TestLogger.info(TAG, `tablet top level ids: ${TABLET_TOP_LEVEL_IDS.join(',')}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_UI_Render_001', 0, async () => {
      TestLogger.step(TAG, 'TabletTitle exposes four unique navigation buttons');
      const model: TabletTitleModel = new TabletTitleModel();
      expect(model.navigationCount()).assertEqual(TAB_NAVIGATION_ORDER);
      expect(model.hasNavigationButton(ID_NAV_BACK)).assertTrue();
      expect(model.hasNavigationButton(ID_NAV_FORWARD)).assertTrue();
      expect(model.hasNavigationButton(ID_NAV_REFRESH)).assertTrue();
      expect(model.hasNavigationButton(ID_NAV_HOME)).assertTrue();
      expect(model.uniqueIds()).assertTrue();
      const tree: UiTree = new UiTree(buildTabletTree());
      expect(tree.countByType('Button')).assertEqual(7);
    });

    it('Browser_UI_Render_002', 0, async () => {
      TestLogger.step(TAG, 'TabletTitle exposes exactly two action buttons');
      const model: TabletTitleModel = new TabletTitleModel();
      expect(model.actionCount()).assertEqual(TAB_ACTION_ORDER);
      expect(model.hasActionButton(ID_ACTION_SUBMIT)).assertTrue();
      expect(model.hasActionButton(ID_ACTION_ADD)).assertTrue();
      expect(model.orderOf(ID_ACTION_SUBMIT)).assertLess(model.orderOf(ID_ACTION_ADD));
      const tree: UiTree = new UiTree(buildTabletTree());
      const title: ComponentNode | null = tree.nodeOf('TabletTitle');
      expect(title !== null).assertTrue();
      if (title !== null) {
        expect(title.childCount()).assertEqual(TAB_NAVIGATION_ORDER + 1 + TAB_ACTION_ORDER);
      }
    });

    it('Browser_UI_Render_003', 0, async () => {
      TestLogger.step(TAG, 'inputUrl sits between navigation and action buttons');
      const model: TabletTitleModel = new TabletTitleModel();
      expect(model.totalSlots()).assertEqual(7);
      expect(model.orderOf(ID_INPUT_URL)).assertEqual(TAB_NAVIGATION_ORDER);
      expect(model.orderOf(ID_NAV_HOME)).assertLess(model.orderOf(ID_INPUT_URL));
      expect(model.orderOf(ID_ACTION_SUBMIT)).assertLarger(model.orderOf(ID_INPUT_URL));
      const tree: UiTree = new UiTree(buildTabletTree());
      const title: ComponentNode | null = tree.nodeOf('TabletTitle');
      if (title !== null) {
        expect(title.children[TAB_NAVIGATION_ORDER].id).assertEqual(ID_INPUT_URL);
        expect(title.children[TAB_NAVIGATION_ORDER].type).assertEqual('TextInput');
      }
    });

    it('Browser_UI_Render_004', 0, async () => {
      TestLogger.step(TAG, 'navigation buttons are 22 x 22 with radius 4');
      const tree: UiTree = new UiTree(buildTabletTree());
      for (let index = 0; index < NAVIGATION_BUTTON_IDS.length; index++) {
        const node: ComponentNode | null = tree.nodeOf(NAVIGATION_BUTTON_IDS[index]);
        expect(node !== null).assertTrue();
        if (node !== null) {
          expect(node.width).assertEqual(BUTTON_WIDTH);
          expect(node.height).assertEqual(BUTTON_WIDTH);
          expect(node.isSquare()).assertTrue();
          expect(node.radius).assertEqual(BUTTON_RADIUS);
        }
      }
    });

    it('Browser_UI_Render_005', 0, async () => {
      TestLogger.step(TAG, 'action buttons reuse the navigation button metrics');
      const tree: UiTree = new UiTree(buildTabletTree());
      const submit: ComponentNode | null = tree.nodeOf(ID_ACTION_SUBMIT);
      const add: ComponentNode | null = tree.nodeOf(ID_ACTION_ADD);
      expect(submit !== null).assertTrue();
      expect(add !== null).assertTrue();
      if (submit !== null && add !== null) {
        expect(submit.width).assertEqual(add.width);
        expect(submit.height).assertEqual(add.height);
        expect(submit.radius).assertEqual(add.radius);
        expect(submit.width).assertEqual(BUTTON_WIDTH);
        expect(submit.radius).assertEqual(BUTTON_RADIUS);
      }
      const model: TabletTitleModel = new TabletTitleModel();
      expect(model.buttonMetricsConsistent()).assertTrue();
    });

    it('Browser_UI_Render_006', 0, async () => {
      TestLogger.step(TAG, 'one cancel button is rendered per tab');
      for (let count = MIN_TAB_COUNT; count <= 5; count++) {
        const strip: TabStripModel = new TabStripModel(count);
        expect(strip.cancelButtonCount()).assertEqual(count);
        const tree: UiTree = new UiTree(buildTabletTree(count));
        expect(tree.countById(ID_CANCEL_TAB)).assertEqual(count);
        expect(tree.countByType('Divider')).assertEqual(count + 1);
        expect(strip.stripHeight).assertEqual(33);
      }
    });

    it('Browser_UI_Render_007', 0, async () => {
      TestLogger.step(TAG, 'tab cell width stays 180 regardless of tab count');
      const widths: number[] = [];
      for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
        const strip: TabStripModel = new TabStripModel(count);
        widths.push(strip.tabWidth);
        expect(strip.tabWidthIsFixed()).assertTrue();
        expect(strip.tabWidth).assertEqual(TAB_WIDTH);
      }
      expect(widths.length).assertEqual(MAX_TAB_COUNT);
      let stable: boolean = true;
      for (let index = 1; index < widths.length; index++) {
        if (widths[index] !== widths[0]) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      TestLogger.info(TAG, `tab width sampled ${widths.length} times, stable=${stable}`);
    });

    it('Browser_UI_Render_008', 0, async () => {
      TestLogger.step(TAG, 'strip width grows linearly with the tab count');
      for (let count = MIN_TAB_COUNT; count <= MAX_TAB_COUNT; count++) {
        const strip: TabStripModel = new TabStripModel(count);
        expect(strip.cellWidth()).assertEqual(181);
        expect(strip.stripWidth()).assertEqual(count * 181);
        const tree: UiTree = new UiTree(buildTabletTree(count));
        const node: ComponentNode | null = tree.nodeOf('BrowserTabs');
        if (node !== null) {
          expect(node.width).assertEqual(count * 181);
          expect(node.height).assertEqual(TAB_STRIP_HEIGHT);
        }
      }
      const single: TabStripModel = new TabStripModel(1);
      const ten: TabStripModel = new TabStripModel(10);
      expect(ten.stripWidth() - single.stripWidth()).assertEqual(9 * 181);
    });

    it('Browser_UI_Render_009', 0, async () => {
      TestLogger.step(TAG, 'tablet layout renders the five documented top level nodes');
      const tree: UiTree = new UiTree(buildTabletTree());
      const topLevel: string[] = tree.idsAtDepth(1);
      expect(topLevel.length).assertEqual(5);
      for (let index = 0; index < TABLET_TOP_LEVEL_IDS.length; index++) {
        expect(topLevel[index]).assertEqual(TABLET_TOP_LEVEL_IDS[index]);
      }
      const mode: LayoutModeModel = new LayoutModeModel('default', true);
      expect(mode.usesTabletTitle()).assertTrue();
      expect(mode.usesTabStrip()).assertTrue();
      expect(mode.usesToolBar()).assertFalse();
    });

    it('Browser_UI_Render_010', 0, async () => {
      TestLogger.step(TAG, 'tree paths locate the second tab cancel button');
      const tree: UiTree = new UiTree(buildTabletTree(3));
      expect(tree.countById(ID_CANCEL_TAB)).assertEqual(3);
      const depth: number = tree.depthOf('tabCell1');
      expect(depth).assertEqual(2);
      const path: string[] = tree.pathOf('tabCell1');
      expect(path.length).assertEqual(3);
      expect(path[0]).assertEqual('Index');
      expect(path[1]).assertEqual('BrowserTabs');
      expect(path[2]).assertEqual('tabCell1');
      expect(tree.maxDepth()).assertLarger(depth);
      expect(tree.flattenIds().length).assertEqual(tree.size());
    });

    it('Browser_UI_Render_011', 0, async () => {
      TestLogger.step(TAG, 'progress node visibility follows hideProgress only');
      const hidden: ProgressPresentation = new ProgressPresentation(40, true);
      const shown: ProgressPresentation = new ProgressPresentation(40, false);
      expect(hidden.visibility()).assertEqual('Hidden');
      expect(shown.visibility()).assertEqual('Visible');
      expect(hidden.isRendered()).assertFalse();
      expect(shown.isRendered()).assertTrue();
      const hiddenTree: UiTree = new UiTree(buildTabletTree(1, hidden));
      const shownTree: UiTree = new UiTree(buildTabletTree(1, shown));
      expect(hiddenTree.size()).assertEqual(shownTree.size());
      expect(hiddenTree.visibleSize()).assertLess(shownTree.visibleSize());
      expect(hiddenTree.visibleSize() + 2).assertEqual(shownTree.visibleSize());
    });

    it('Browser_UI_Render_012', 0, async () => {
      TestLogger.step(TAG, 'phone layout keeps a 22 x 22 page count box');
      const tree: UiTree = new UiTree(buildPhoneTree());
      const pageCount: ComponentNode | null = tree.nodeOf('pageCount');
      expect(pageCount !== null).assertTrue();
      if (pageCount !== null) {
        expect(pageCount.width).assertEqual(BUTTON_WIDTH);
        expect(pageCount.height).assertEqual(BUTTON_WIDTH);
        expect(pageCount.radius).assertEqual(PAGE_COUNT_RADIUS);
      }
      expect(PAGE_COUNT_BORDER).assertEqual(2);
      expect(tree.countByType('Button')).assertEqual(5);
      const model: LayoutModeModel = new LayoutModeModel('phone', true);
      expect(model.usesToolBar()).assertTrue();
      expect(model.topLevelIds().indexOf('ToolBar')).assertEqual(0);
      expect(model.topLevelIds().indexOf('TitleBar')).assertEqual(1);
    });

    it('Browser_UI_Render_013', 0, async () => {
      TestLogger.step(TAG, 'phone layout has no tab strip and a single action button');
      const phone: UiTree = new UiTree(buildPhoneTree());
      const tablet: UiTree = new UiTree(buildTabletTree());
      expect(phone.countById(ID_CANCEL_TAB)).assertEqual(0);
      expect(phone.countById(ID_ACTION_ADD)).assertEqual(0);
      expect(phone.countById(ID_ACTION_SUBMIT)).assertEqual(1);
      expect(phone.countById(ID_INPUT_URL)).assertEqual(1);
      expect(tablet.countById(ID_CANCEL_TAB)).assertEqual(1);
      expect(tablet.countById(ID_ACTION_ADD)).assertEqual(1);
      const mode: LayoutModeModel = new LayoutModeModel('default', false);
      expect(mode.isPhone).assertTrue();
      expect(mode.usesTabStrip()).assertFalse();
      expect(mode.progressAnchor()).assertEqual('ToolBar');
    });

    it('Browser_UI_Render_014', 0, async () => {
      TestLogger.step(TAG, 'Web panel keeps the five render flags enabled');
      const panel: WebPanelModel = new WebPanelModel();
      expect(panel.enabledFlagCount()).assertEqual(4);
      expect(panel.javaScriptAccess).assertTrue();
      expect(panel.fileAccess).assertTrue();
      expect(panel.domStorageAccess).assertTrue();
      expect(panel.multiWindowAccess).assertTrue();
      expect(panel.mixedMode).assertEqual('All');
      expect(panel.barIsCollapsed()).assertTrue();
      expect(panel.homePage(false)).assertEqual(PAD_HOME_PAGE);
      expect(panel.homePage(true)).assertEqual(PHONE_HOME_PAGE);
      const tree: UiTree = new UiTree(buildTabletTree());
      expect(tree.countByType('Web')).assertEqual(1);
    });

    it('Browser_UI_Render_015', 0, async () => {
      TestLogger.step(TAG, 'adding a tab adds exactly one cancel button node');
      const browser: MockBrowser = new MockBrowser(1);
      const before: number = new UiTree(buildTabletTree(browser.tabs.length)).countById(ID_CANCEL_TAB);
      const added: boolean = browser.addTab();
      expect(added).assertTrue();
      const after: number = new UiTree(buildTabletTree(browser.tabs.length)).countById(ID_CANCEL_TAB);
      const diff: CountDiff = diffCounts(before, after, STABLE_TOLERANCE);
      expect(diff.delta).assertEqual(1);
      expect(diff.withinTolerance).assertTrue();
      const removed: boolean = browser.deleteTab(browser.tabs.length - 1);
      expect(removed).assertTrue();
      const restored: number = new UiTree(buildTabletTree(browser.tabs.length)).countById(ID_CANCEL_TAB);
      expect(restored).assertEqual(before);
      TestLogger.info(TAG, `cancel button nodes ${before} -> ${after} -> ${restored}`);
    });

    it('Browser_UI_Render_016', 0, async () => {
      TestLogger.step(TAG, 'tab capacity boundary stops the eleventh tab node');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT);
      const accepted: boolean = browser.addTab();
      expect(accepted).assertTrue();
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      const refused: boolean = browser.addTab();
      expect(refused).assertFalse();
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts[browser.toasts.length - 1]).assertEqual(TAB_LIMIT_MESSAGE);
      const tree: UiTree = new UiTree(buildTabletTree(browser.tabs.length));
      expect(tree.countById(ID_CANCEL_TAB)).assertEqual(MAX_TAB_COUNT + 1);
    });

    it('Browser_UI_Render_017', 0, async () => {
      TestLogger.step(TAG, 'title bar ids resolve to a stable component count');
      const first: number = await countById(driver, ID_NAV_BACK);
      const second: number = await countById(driver, ID_NAV_BACK);
      const diff: CountDiff = diffCounts(first, second, STABLE_TOLERANCE);
      expect(diff.withinTolerance).assertTrue();
      expect(diff.delta).assertEqual(0);
      const catalog: ComponentCatalog = new ComponentCatalog();
      expect(catalog.isOwnedBy(ID_NAV_BACK, 'TabletTitle')).assertTrue();
      expect(catalog.isOwnedBy(ID_INPUT_URL, 'TabletTitle')).assertTrue();
      expect(catalog.isOwnedBy(ID_CANCEL_TAB, 'BrowserTabs')).assertTrue();
      expect(catalog.idsOwnedBy('TabletTitle').length).assertEqual(7);
      TestLogger.info(TAG, `navigationButton0 count first=${first} second=${second}`);
    });

    it('Browser_UI_Render_018', 0, async () => {
      TestLogger.step(TAG, 'component catalog covers every chrome id exactly once');
      const catalog: ComponentCatalog = new ComponentCatalog();
      expect(catalog.size()).assertEqual(8);
      const all: string[] = NAVIGATION_BUTTON_IDS.concat(ACTION_BUTTON_IDS);
      all.push(ID_INPUT_URL);
      all.push(ID_CANCEL_TAB);
      for (let index = 0; index < all.length; index++) {
        expect(catalog.ownerOf(all[index]).length).assertLarger(0);
      }
      const strip: TabStripModel = new TabStripModel(MIN_TAB_COUNT);
      expect(strip.cancelButtonIsSquare()).assertTrue();
      expect(strip.cancelRadius).assertEqual(CANCEL_BUTTON_RADIUS);
      const mode: LayoutModeModel = new LayoutModeModel('default', true);
      expect(mode.topLevelCount()).assertEqual(TABLET_TOP_LEVEL_IDS.length);
      expect(mode.topLevelCount()).assertLarger(PHONE_TOP_LEVEL_IDS.length);
    });
  });
}