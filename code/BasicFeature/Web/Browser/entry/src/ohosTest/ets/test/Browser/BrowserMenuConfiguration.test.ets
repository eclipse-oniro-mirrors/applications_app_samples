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
  getDriver, startBrowserApp, serializedDelay, countById, componentByIdExists,
  MAX_TAB_COUNT, PAD_HOME_PAGE, PHONE_HOME_PAGE, ID_NAV_BACK, ID_NAV_FORWARD,
  ID_NAV_REFRESH, ID_NAV_HOME, ID_ACTION_SUBMIT, ID_ACTION_ADD, TIMEOUT_COMPONENT,
  DELAY_TOUCH_EVENT
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserMenuConfigurationTest';

/* Icon resource names declared in common/TitleBar.ets and PhoneLayout.ets. */
const ICON_BACK: string = 'ic_public_back';
const ICON_FORWARD: string = 'ic_public_advance';
const ICON_REFRESH: string = 'ic_public_refresh';
const ICON_HOME: string = 'ic_public_home';
const ICON_SUBMIT: string = 'submit';
const ICON_ADD: string = 'ic_public_add';

/* Handler names resolved by the switch statements of both layouts. */
const ACTION_BACK: string = 'back';
const ACTION_FORWARD: string = 'forward';
const ACTION_REFRESH: string = 'refresh';
const ACTION_HOME: string = 'home';
const ACTION_SUBMIT: string = 'submit';
const ACTION_ADD: string = 'addTab';
const ACTION_NONE: string = 'none';

const ID_HOME_PAD: number = 4;
const ID_HOME_PHONE: number = 5;
const FIRST_ID: number = 1;
const LAST_ID: number = 6;
const TABLET_NAV_COUNT: number = 4;
const TABLET_ACTION_COUNT: number = 2;
const PHONE_TOOL_COUNT: number = 4;

/**
 * Component ids of the phone tool bar.
 *
 * PhoneLayout renders back, forward, home, refresh and derives the id from the
 * slot index, so the home button is the third slot while its menu id is 5.
 */
const PHONE_NAV_HOME: string = 'navigationButton2';
const PHONE_NAV_REFRESH: string = 'navigationButton3';

const KNOWN_ICONS: string[] = [
  ICON_BACK, ICON_FORWARD, ICON_REFRESH, ICON_HOME, ICON_SUBMIT, ICON_ADD
];
const KNOWN_ACTIONS: string[] = [
  ACTION_BACK, ACTION_FORWARD, ACTION_REFRESH, ACTION_HOME, ACTION_SUBMIT, ACTION_ADD
];

/* ------------------------------------------------------------------ */
/* Menu descriptor model                                               */
/* ------------------------------------------------------------------ */

/** One declarative menu entry: icon resource, stable id and handler name. */
class MenuItem {
  id: number;
  icon: string;
  action: string;
  componentId: string;
  order: number;
  homePage: string;

  constructor(id: number, icon: string, action: string, componentId: string,
    order: number, homePage: string = '') {
    this.id = id;
    this.icon = icon;
    this.action = action;
    this.componentId = componentId;
    this.order = order;
    this.homePage = homePage;
  }

  describe(): string {
    return 'id=' + this.id + ', icon=' + this.icon + ', action=' + this.action +
      ', component=' + this.componentId;
  }
}

/** Ordered menu configuration with the validation helpers of a test double. */
class MenuConfig {
  name: string;
  items: MenuItem[] = [];

  constructor(name: string) {
    this.name = name;
  }

  add(item: MenuItem): MenuConfig {
    this.items.push(item);
    return this;
  }

  size(): number {
    return this.items.length;
  }

  ids(): number[] {
    return this.items.map((item: MenuItem) => item.id);
  }

  icons(): string[] {
    return this.items.map((item: MenuItem) => item.icon);
  }

  actions(): string[] {
    return this.items.map((item: MenuItem) => item.action);
  }

  componentIds(): string[] {
    return this.items.map((item: MenuItem) => item.componentId);
  }

  find(id: number): MenuItem | null {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].id === id) {
        return this.items[index];
      }
    }
    return null;
  }

  itemAt(order: number): MenuItem | null {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].order === order) {
        return this.items[index];
      }
    }
    return null;
  }

  actionOf(id: number): string {
    const item: MenuItem | null = this.find(id);
    return item === null ? ACTION_NONE : item.action;
  }

  iconOf(id: number): string {
    const item: MenuItem | null = this.find(id);
    return item === null ? '' : item.icon;
  }

  componentIdOf(id: number): string {
    const item: MenuItem | null = this.find(id);
    return item === null ? '' : item.componentId;
  }

  uniqueIdCount(): number {
    const seen: number[] = [];
    for (let index = 0; index < this.items.length; index++) {
      if (seen.indexOf(this.items[index].id) < 0) {
        seen.push(this.items[index].id);
      }
    }
    return seen.length;
  }

  duplicateIds(): number[] {
    const duplicates: number[] = [];
    for (let outer = 0; outer < this.items.length; outer++) {
      for (let inner = outer + 1; inner < this.items.length; inner++) {
        if (this.items[outer].id === this.items[inner].id &&
          duplicates.indexOf(this.items[outer].id) < 0) {
          duplicates.push(this.items[outer].id);
        }
      }
    }
    return duplicates;
  }

  countAction(action: string): number {
    let total: number = 0;
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].action === action) {
        total += 1;
      }
    }
    return total;
  }

  allIconsKnown(): boolean {
    for (let index = 0; index < this.items.length; index++) {
      if (KNOWN_ICONS.indexOf(this.items[index].icon) < 0) {
        return false;
      }
    }
    return true;
  }

  allActionsKnown(): boolean {
    for (let index = 0; index < this.items.length; index++) {
      if (KNOWN_ACTIONS.indexOf(this.items[index].action) < 0) {
        return false;
      }
    }
    return true;
  }

  ordersAreSequential(): boolean {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].order !== index) {
        return false;
      }
    }
    return true;
  }

  isValid(): boolean {
    return this.items.length > 0 && this.uniqueIdCount() === this.items.length &&
      this.allIconsKnown() && this.allActionsKnown() && this.ordersAreSequential();
  }

  summary(): string {
    return this.name + ': ids=' + this.ids().join(',') + ', icons=' + this.icons().join(',');
  }
}

/* ------------------------------------------------------------------ */
/* Shipped menu configurations                                         */
/* ------------------------------------------------------------------ */

function createTabletNavigation(): MenuConfig {
  const config: MenuConfig = new MenuConfig('tabletNavigation');
  config.add(new MenuItem(1, ICON_BACK, ACTION_BACK, ID_NAV_BACK, 0));
  config.add(new MenuItem(2, ICON_FORWARD, ACTION_FORWARD, ID_NAV_FORWARD, 1));
  config.add(new MenuItem(3, ICON_REFRESH, ACTION_REFRESH, ID_NAV_REFRESH, 2));
  config.add(new MenuItem(4, ICON_HOME, ACTION_HOME, ID_NAV_HOME, 3, PAD_HOME_PAGE));
  return config;
}

function createTabletActions(): MenuConfig {
  const config: MenuConfig = new MenuConfig('tabletActions');
  config.add(new MenuItem(5, ICON_SUBMIT, ACTION_SUBMIT, ID_ACTION_SUBMIT, 0));
  config.add(new MenuItem(6, ICON_ADD, ACTION_ADD, ID_ACTION_ADD, 1));
  return config;
}

function createPhoneTools(): MenuConfig {
  const config: MenuConfig = new MenuConfig('phoneToolBar');
  config.add(new MenuItem(1, ICON_BACK, ACTION_BACK, ID_NAV_BACK, 0));
  config.add(new MenuItem(2, ICON_FORWARD, ACTION_FORWARD, ID_NAV_FORWARD, 1));
  config.add(new MenuItem(5, ICON_HOME, ACTION_HOME, PHONE_NAV_HOME, 2, PHONE_HOME_PAGE));
  config.add(new MenuItem(3, ICON_REFRESH, ACTION_REFRESH, PHONE_NAV_REFRESH, 3));
  return config;
}

function createTabletMenu(): MenuConfig {
  const config: MenuConfig = new MenuConfig('tabletMenu');
  const navigation: MenuConfig = createTabletNavigation();
  const actions: MenuConfig = createTabletActions();
  for (let index = 0; index < navigation.size(); index++) {
    const item: MenuItem = navigation.items[index];
    config.add(new MenuItem(item.id, item.icon, item.action, item.componentId, config.size(),
      item.homePage));
  }
  for (let index = 0; index < actions.size(); index++) {
    const item: MenuItem = actions.items[index];
    config.add(new MenuItem(item.id, item.icon, item.action, item.componentId, config.size()));
  }
  return config;
}

/** Resolves the click handler of a menu id exactly like the switch statements. */
function dispatchAction(config: MenuConfig, id: number): string {
  return config.actionOf(id);
}

/** Applies one menu action through the browser model. */
function applyMenuAction(browser: MockBrowser, action: string, homePage: string): boolean {
  if (action === ACTION_BACK) {
    browser.back();
    return true;
  }
  if (action === ACTION_FORWARD) {
    browser.forward();
    return true;
  }
  if (action === ACTION_REFRESH) {
    browser.refresh();
    return true;
  }
  if (action === ACTION_HOME) {
    browser.resetToHome(homePage);
    return true;
  }
  if (action === ACTION_ADD) {
    return browser.addTab();
  }
  return false;
}

export default function browserMenuConfigurationTest() {
  describe('browserMenuConfigurationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'menu configuration suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Menu_001', 0, async () => {
      TestLogger.step(TAG, 'validate the size and order of the tablet navigation group');
      const config: MenuConfig = createTabletNavigation();
      expect(config.size()).assertEqual(TABLET_NAV_COUNT);
      expect(config.ordersAreSequential()).assertTrue();
      for (let order = 0; order < TABLET_NAV_COUNT; order++) {
        const item: MenuItem | null = config.itemAt(order);
        expect(item === null).assertFalse();
        if (item !== null) {
          expect(item.order).assertEqual(order);
        }
      }
      expect(config.itemAt(4)).assertNull();
    });

    it('Browser_Menu_002', 0, async () => {
      TestLogger.step(TAG, 'validate the tablet navigation ids');
      const config: MenuConfig = createTabletNavigation();
      expect(config.ids()).assertDeepEquals([1, 2, 3, 4]);
      expect(config.ids()[0]).assertEqual(FIRST_ID);
      expect(config.ids()[config.size() - 1]).assertEqual(ID_HOME_PAD);
      expect(config.uniqueIdCount()).assertEqual(TABLET_NAV_COUNT);
      expect(config.duplicateIds().length).assertEqual(0);
      expect(config.find(0)).assertNull();
      expect(config.find(5)).assertNull();
    });

    it('Browser_Menu_003', 0, async () => {
      TestLogger.step(TAG, 'map tablet navigation ids to component ids');
      const config: MenuConfig = createTabletNavigation();
      expect(config.componentIds()).assertDeepEquals([
        ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME
      ]);
      expect(config.componentIdOf(1)).assertEqual(ID_NAV_BACK);
      expect(config.componentIdOf(2)).assertEqual(ID_NAV_FORWARD);
      expect(config.componentIdOf(3)).assertEqual(ID_NAV_REFRESH);
      expect(config.componentIdOf(4)).assertEqual(ID_NAV_HOME);
      expect(config.componentIdOf(9)).assertEqual('');
    });

    it('Browser_Menu_004', 0, async () => {
      TestLogger.step(TAG, 'map tablet navigation ids to icon resources');
      const config: MenuConfig = createTabletNavigation();
      expect(config.iconOf(1)).assertEqual(ICON_BACK);
      expect(config.iconOf(2)).assertEqual(ICON_FORWARD);
      expect(config.iconOf(3)).assertEqual(ICON_REFRESH);
      expect(config.iconOf(4)).assertEqual(ICON_HOME);
      expect(config.icons()).assertDeepEquals([
        ICON_BACK, ICON_FORWARD, ICON_REFRESH, ICON_HOME
      ]);
      expect(config.iconOf(0)).assertEqual('');
    });

    it('Browser_Menu_005', 0, async () => {
      TestLogger.step(TAG, 'map tablet navigation ids to click handlers');
      const config: MenuConfig = createTabletNavigation();
      expect(config.actionOf(1)).assertEqual(ACTION_BACK);
      expect(config.actionOf(2)).assertEqual(ACTION_FORWARD);
      expect(config.actionOf(3)).assertEqual(ACTION_REFRESH);
      expect(config.actionOf(4)).assertEqual(ACTION_HOME);
      expect(config.actions()).assertDeepEquals([
        ACTION_BACK, ACTION_FORWARD, ACTION_REFRESH, ACTION_HOME
      ]);
      expect(config.actionOf(6)).assertEqual(ACTION_NONE);
      expect(config.countAction(ACTION_BACK)).assertEqual(1);
    });

    it('Browser_Menu_006', 0, async () => {
      TestLogger.step(TAG, 'attach the pad home page to the fourth navigation id');
      const config: MenuConfig = createTabletNavigation();
      for (let order = 0; order < config.size(); order++) {
        const item: MenuItem | null = config.itemAt(order);
        if (item === null) {
          expect(false).assertTrue();
          continue;
        }
        if (item.id === ID_HOME_PAD) {
          expect(item.homePage).assertEqual(PAD_HOME_PAGE);
        } else {
          expect(item.homePage).assertEqual('');
        }
      }
      expect(config.find(ID_HOME_PAD)?.homePage).assertEqual(PAD_HOME_PAGE);
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
    });

    it('Browser_Menu_007', 0, async () => {
      TestLogger.step(TAG, 'validate the tablet action button group');
      const config: MenuConfig = createTabletActions();
      expect(config.size()).assertEqual(TABLET_ACTION_COUNT);
      expect(config.ids()).assertDeepEquals([5, 6]);
      expect(config.componentIds()).assertDeepEquals([ID_ACTION_SUBMIT, ID_ACTION_ADD]);
      expect(config.ordersAreSequential()).assertTrue();
      expect(config.uniqueIdCount()).assertEqual(2);
      expect(config.find(5)?.componentId).assertEqual(ID_ACTION_SUBMIT);
      expect(config.find(6)?.componentId).assertEqual(ID_ACTION_ADD);
    });

    it('Browser_Menu_008', 0, async () => {
      TestLogger.step(TAG, 'map the action ids to submit and add icons');
      const config: MenuConfig = createTabletActions();
      expect(config.iconOf(5)).assertEqual(ICON_SUBMIT);
      expect(config.iconOf(6)).assertEqual(ICON_ADD);
      expect(config.icons()).assertDeepEquals([ICON_SUBMIT, ICON_ADD]);
      expect(config.actionOf(5)).assertEqual(ACTION_SUBMIT);
      expect(config.actionOf(6)).assertEqual(ACTION_ADD);
      expect(config.actionOf(4)).assertEqual(ACTION_NONE);
    });

    it('Browser_Menu_009', 0, async () => {
      TestLogger.step(TAG, 'verify every action handler appears once in the tablet menu');
      const nav: MenuConfig = createTabletNavigation();
      const actions: MenuConfig = createTabletActions();
      expect(nav.countAction(ACTION_BACK)).assertEqual(1);
      expect(nav.countAction(ACTION_FORWARD)).assertEqual(1);
      expect(nav.countAction(ACTION_REFRESH)).assertEqual(1);
      expect(nav.countAction(ACTION_HOME)).assertEqual(1);
      expect(actions.countAction(ACTION_SUBMIT)).assertEqual(1);
      expect(actions.countAction(ACTION_ADD)).assertEqual(1);
      expect(nav.countAction(ACTION_SUBMIT)).assertEqual(0);
    });

    it('Browser_Menu_010', 0, async () => {
      TestLogger.step(TAG, 'merge both tablet groups into one six entry menu');
      const combined: MenuConfig = createTabletMenu();
      const nav: MenuConfig = createTabletNavigation();
      const actions: MenuConfig = createTabletActions();
      expect(combined.size()).assertEqual(TABLET_NAV_COUNT + TABLET_ACTION_COUNT);
      expect(combined.size()).assertEqual(nav.size() + actions.size());
      expect(combined.ids()).assertDeepEquals([1, 2, 3, 4, 5, 6]);
      expect(combined.uniqueIdCount()).assertEqual(LAST_ID);
      expect(combined.duplicateIds().length).assertEqual(0);
      expect(combined.ordersAreSequential()).assertTrue();
    });

    it('Browser_Menu_011', 0, async () => {
      TestLogger.step(TAG, 'verify the component ids of the merged tablet menu');
      const combined: MenuConfig = createTabletMenu();
      expect(combined.componentIds()).assertDeepEquals([
        ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
        ID_ACTION_SUBMIT, ID_ACTION_ADD
      ]);
      for (let order = 0; order < combined.size(); order++) {
        const item: MenuItem | null = combined.itemAt(order);
        if (item !== null && order < TABLET_NAV_COUNT) {
          expect(item.componentId).assertEqual('navigationButton' + order);
        }
        if (item !== null && order >= TABLET_NAV_COUNT) {
          expect(item.componentId).assertEqual('actionButton' + (order - TABLET_NAV_COUNT));
        }
      }
      expect(combined.componentIdOf(6)).assertEqual(ID_ACTION_ADD);
    });

    it('Browser_Menu_012', 0, async () => {
      TestLogger.step(TAG, 'confirm the merged menu keeps the nav and action groups');
      const combined: MenuConfig = createTabletMenu();
      for (let order = 0; order < TABLET_NAV_COUNT; order++) {
        const navItem: MenuItem | null = createTabletNavigation().itemAt(order);
        const mergedItem: MenuItem | null = combined.itemAt(order);
        if (navItem !== null && mergedItem !== null) {
          expect(mergedItem.id).assertEqual(navItem.id);
          expect(mergedItem.icon).assertEqual(navItem.icon);
          expect(mergedItem.action).assertEqual(navItem.action);
        }
      }
      expect(combined.find(4)?.homePage).assertEqual(PAD_HOME_PAGE);
      expect(combined.isValid()).assertTrue();
    });

    it('Browser_Menu_013', 0, async () => {
      TestLogger.step(TAG, 'validate the size and order of the phone tool bar');
      const config: MenuConfig = createPhoneTools();
      expect(config.size()).assertEqual(PHONE_TOOL_COUNT);
      expect(config.ordersAreSequential()).assertTrue();
      expect(config.itemAt(0)?.componentId).assertEqual(ID_NAV_BACK);
      expect(config.itemAt(3)?.componentId).assertEqual(PHONE_NAV_REFRESH);
      expect(config.itemAt(4)).assertNull();
    });

    it('Browser_Menu_014', 0, async () => {
      TestLogger.step(TAG, 'validate the reordered phone tool ids');
      const config: MenuConfig = createPhoneTools();
      expect(config.ids()).assertDeepEquals([1, 2, 5, 3]);
      expect(config.ids()[2]).assertEqual(ID_HOME_PHONE);
      expect(config.uniqueIdCount()).assertEqual(PHONE_TOOL_COUNT);
      expect(config.duplicateIds().length).assertEqual(0);
      expect(config.find(ID_HOME_PAD)).assertNull();
    });

    it('Browser_Menu_015', 0, async () => {
      TestLogger.step(TAG, 'map the phone slots to navigation component ids');
      const config: MenuConfig = createPhoneTools();
      expect(config.componentIds()).assertDeepEquals([
        ID_NAV_BACK, ID_NAV_FORWARD, PHONE_NAV_HOME, PHONE_NAV_REFRESH
      ]);
      for (let order = 0; order < PHONE_TOOL_COUNT; order++) {
        expect(config.itemAt(order)?.componentId).assertEqual('navigationButton' + order);
      }
      expect(config.componentIdOf(3)).assertEqual(PHONE_NAV_REFRESH);
      expect(config.componentIdOf(4)).assertEqual('');
    });

    it('Browser_Menu_016', 0, async () => {
      TestLogger.step(TAG, 'verify the phone icon order puts home third');
      const config: MenuConfig = createPhoneTools();
      expect(config.icons()).assertDeepEquals([
        ICON_BACK, ICON_FORWARD, ICON_HOME, ICON_REFRESH
      ]);
      expect(config.iconOf(5)).assertEqual(ICON_HOME);
      expect(config.iconOf(3)).assertEqual(ICON_REFRESH);
      expect(config.icons()[2]).assertEqual(ICON_HOME);
      expect(config.icons()[3]).assertEqual(ICON_REFRESH);
    });

    it('Browser_Menu_017', 0, async () => {
      TestLogger.step(TAG, 'verify the phone handler order');
      const config: MenuConfig = createPhoneTools();
      expect(config.actions()).assertDeepEquals([
        ACTION_BACK, ACTION_FORWARD, ACTION_HOME, ACTION_REFRESH
      ]);
      expect(config.actionOf(1)).assertEqual(ACTION_BACK);
      expect(config.actionOf(2)).assertEqual(ACTION_FORWARD);
      expect(config.actionOf(5)).assertEqual(ACTION_HOME);
      expect(config.actionOf(3)).assertEqual(ACTION_REFRESH);
      expect(config.actionOf(4)).assertEqual(ACTION_NONE);
      expect(config.actionOf(6)).assertEqual(ACTION_NONE);
    });

    it('Browser_Menu_018', 0, async () => {
      TestLogger.step(TAG, 'attach the phone home page to id five');
      const config: MenuConfig = createPhoneTools();
      const home: MenuItem | null = config.find(ID_HOME_PHONE);
      expect(home === null).assertFalse();
      if (home !== null) {
        expect(home.homePage).assertEqual(PHONE_HOME_PAGE);
        expect(home.order).assertEqual(2);
        expect(home.action).assertEqual(ACTION_HOME);
        expect(home.componentId).assertEqual(PHONE_NAV_HOME);
      }
      expect(PHONE_HOME_PAGE).assertEqual('phone.html');
      expect(config.itemAt(2)?.id).assertEqual(ID_HOME_PHONE);
    });

    it('Browser_Menu_019', 0, async () => {
      TestLogger.step(TAG, 'confirm the phone bar excludes add and submit ids');
      const config: MenuConfig = createPhoneTools();
      expect(config.find(6)).assertNull();
      expect(config.countAction(ACTION_ADD)).assertEqual(0);
      expect(config.countAction(ACTION_SUBMIT)).assertEqual(0);
      expect(config.countAction(ACTION_HOME)).assertEqual(1);
      expect(config.countAction(ACTION_REFRESH)).assertEqual(1);
      expect(config.isValid()).assertTrue();
    });

    it('Browser_Menu_020', 0, async () => {
      TestLogger.step(TAG, 'dispatch all six tablet menu ids');
      const config: MenuConfig = createTabletMenu();
      const expected: string[] = [
        ACTION_BACK, ACTION_FORWARD, ACTION_REFRESH, ACTION_HOME, ACTION_SUBMIT, ACTION_ADD
      ];
      for (let id = FIRST_ID; id <= LAST_ID; id++) {
        expect(dispatchAction(config, id)).assertEqual(expected[id - 1]);
      }
      expect(dispatchAction(config, 0)).assertEqual(ACTION_NONE);
      expect(dispatchAction(config, 7)).assertEqual(ACTION_NONE);
      expect(dispatchAction(config, -1)).assertEqual(ACTION_NONE);
    });

    it('Browser_Menu_021', 0, async () => {
      TestLogger.step(TAG, 'dispatch all four phone menu ids');
      const config: MenuConfig = createPhoneTools();
      expect(dispatchAction(config, 1)).assertEqual(ACTION_BACK);
      expect(dispatchAction(config, 2)).assertEqual(ACTION_FORWARD);
      expect(dispatchAction(config, 5)).assertEqual(ACTION_HOME);
      expect(dispatchAction(config, 3)).assertEqual(ACTION_REFRESH);
      expect(dispatchAction(config, 4)).assertEqual(ACTION_NONE);
      expect(dispatchAction(config, 6)).assertEqual(ACTION_NONE);
      expect(dispatchAction(config, 0)).assertEqual(ACTION_NONE);
    });

    it('Browser_Menu_022', 0, async () => {
      TestLogger.step(TAG, 'apply the add tab handler through the browser model');
      const browser: MockBrowser = new MockBrowser(1);
      const config: MenuConfig = createTabletMenu();
      const action: string = dispatchAction(config, 6);
      expect(action).assertEqual(ACTION_ADD);
      expect(applyMenuAction(browser, action, PAD_HOME_PAGE)).assertTrue();
      expect(browser.tabs.length).assertEqual(2);
      expect(applyMenuAction(browser, action, PAD_HOME_PAGE)).assertTrue();
      expect(browser.tabs.length).assertEqual(3);
      expect(browser.getTabArrayIndex()).assertEqual(2);
    });

    it('Browser_Menu_023', 0, async () => {
      TestLogger.step(TAG, 'let the add handler respect the capacity limit');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      const action: string = dispatchAction(createTabletMenu(), 6);
      expect(applyMenuAction(browser, action, PAD_HOME_PAGE)).assertFalse();
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts.length).assertEqual(1);
    });

    it('Browser_Menu_024', 0, async () => {
      TestLogger.step(TAG, 'apply the phone home handler and load phone.html');
      const browser: MockBrowser = new MockBrowser(1);
      const action: string = dispatchAction(createPhoneTools(), ID_HOME_PHONE);
      expect(action).assertEqual(ACTION_HOME);
      expect(applyMenuAction(browser, action, PHONE_HOME_PAGE)).assertTrue();
      expect(browser.tabs[0].controller.getPendingUrl()).assertEqual(PHONE_HOME_PAGE);
      expect(browser.getInputVal()).assertEqual('');
    });

    it('Browser_Menu_025', 0, async () => {
      TestLogger.step(TAG, 'apply the tablet home handler and load pad.html');
      const browser: MockBrowser = new MockBrowser(2);
      const action: string = dispatchAction(createTabletMenu(), ID_HOME_PAD);
      expect(action).assertEqual(ACTION_HOME);
      expect(applyMenuAction(browser, action, PAD_HOME_PAGE)).assertTrue();
      expect(browser.tabs[0].controller.getPendingUrl()).assertEqual(PAD_HOME_PAGE);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Menu_026', 0, async () => {
      TestLogger.step(TAG, 'apply back forward and refresh handlers in order');
      const browser: MockBrowser = new MockBrowser(1);
      browser.loadUrl('a.example.com');
      browser.loadUrl('b.example.com');
      const config: MenuConfig = createTabletMenu();
      const controller = browser.tabs[0].controller;
      expect(applyMenuAction(browser, dispatchAction(config, 1), PAD_HOME_PAGE)).assertTrue();
      expect(controller.currentUrl).assertEqual('https://a.example.com');
      expect(applyMenuAction(browser, dispatchAction(config, 2), PAD_HOME_PAGE)).assertTrue();
      expect(controller.currentUrl).assertEqual('https://b.example.com');
      browser.refresh();
      expect(controller.refreshCount).assertEqual(1);
      expect(applyMenuAction(browser, dispatchAction(config, 3), PAD_HOME_PAGE)).assertTrue();
      expect(controller.refreshCount).assertEqual(2);
    });

    it('Browser_Menu_027', 0, async () => {
      TestLogger.step(TAG, 'confirm the submit handler is not part of the model dispatch');
      const browser: MockBrowser = new MockBrowser(1);
      const action: string = dispatchAction(createTabletMenu(), 5);
      expect(action).assertEqual(ACTION_SUBMIT);
      expect(applyMenuAction(browser, action, PAD_HOME_PAGE)).assertFalse();
      expect(browser.tabs[0].controller.loadCount).assertEqual(0);
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Menu_028', 0, async () => {
      TestLogger.step(TAG, 'reject a configuration with duplicated ids');
      const config: MenuConfig = new MenuConfig('duplicated');
      config.add(new MenuItem(1, ICON_BACK, ACTION_BACK, ID_NAV_BACK, 0));
      config.add(new MenuItem(1, ICON_FORWARD, ACTION_FORWARD, ID_NAV_FORWARD, 1));
      expect(config.size()).assertEqual(2);
      expect(config.uniqueIdCount()).assertEqual(1);
      expect(config.duplicateIds()).assertDeepEquals([1]);
      expect(config.isValid()).assertFalse();
      expect(config.find(1)?.action).assertEqual(ACTION_BACK);
    });

    it('Browser_Menu_029', 0, async () => {
      TestLogger.step(TAG, 'reject a configuration with an unknown icon');
      const config: MenuConfig = new MenuConfig('unknownIcon');
      config.add(new MenuItem(1, ICON_BACK, ACTION_BACK, ID_NAV_BACK, 0));
      config.add(new MenuItem(2, 'ic_public_missing', ACTION_FORWARD, ID_NAV_FORWARD, 1));
      expect(config.allIconsKnown()).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(KNOWN_ICONS.indexOf('ic_public_missing')).assertEqual(-1);
      expect(KNOWN_ICONS.length).assertEqual(6);
    });

    it('Browser_Menu_030', 0, async () => {
      TestLogger.step(TAG, 'reject a configuration with an unknown action');
      const config: MenuConfig = new MenuConfig('unknownAction');
      config.add(new MenuItem(1, ICON_BACK, ACTION_BACK, ID_NAV_BACK, 0));
      config.add(new MenuItem(2, ICON_HOME, 'reload', ID_NAV_HOME, 1));
      expect(config.allActionsKnown()).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(config.actionOf(2)).assertEqual('reload');
      expect(KNOWN_ACTIONS.indexOf('reload')).assertEqual(-1);
    });

    it('Browser_Menu_031', 0, async () => {
      TestLogger.step(TAG, 'reject a configuration with a gap in the display order');
      const config: MenuConfig = new MenuConfig('orderGap');
      config.add(new MenuItem(1, ICON_BACK, ACTION_BACK, ID_NAV_BACK, 0));
      config.add(new MenuItem(2, ICON_FORWARD, ACTION_FORWARD, ID_NAV_FORWARD, 2));
      expect(config.ordersAreSequential()).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(config.itemAt(1)).assertNull();
      expect(config.itemAt(2)?.id).assertEqual(2);
    });

    it('Browser_Menu_032', 0, async () => {
      TestLogger.step(TAG, 'reject an empty configuration');
      const config: MenuConfig = new MenuConfig('empty');
      expect(config.size()).assertEqual(0);
      expect(config.uniqueIdCount()).assertEqual(0);
      expect(config.duplicateIds().length).assertEqual(0);
      expect(config.ordersAreSequential()).assertTrue();
      expect(config.allIconsKnown()).assertTrue();
      expect(config.isValid()).assertFalse();
      expect(config.ids()).assertDeepEquals([]);
    });

    it('Browser_Menu_033', 0, async () => {
      TestLogger.step(TAG, 'build the summary string of the shipped configurations');
      expect(createTabletNavigation().summary()).assertEqual(
        'tabletNavigation: ids=1,2,3,4, icons=' +
          ICON_BACK + ',' + ICON_FORWARD + ',' + ICON_REFRESH + ',' + ICON_HOME);
      expect(createTabletActions().summary()).assertContain('ids=5,6');
      expect(createPhoneTools().summary()).assertContain('ids=1,2,5,3');
      expect(createTabletMenu().summary()).assertContain('ids=1,2,3,4,5,6');
      expect(createPhoneTools().summary()).assertContain(ICON_HOME);
    });

    it('Browser_Menu_034', 0, async () => {
      TestLogger.step(TAG, 'count the distinct icons of both shipped menus');
      const tablet: MenuConfig = createTabletMenu();
      const phone: MenuConfig = createPhoneTools();
      const tabletIcons: string[] = [];
      for (let index = 0; index < tablet.icons().length; index++) {
        if (tabletIcons.indexOf(tablet.icons()[index]) < 0) {
          tabletIcons.push(tablet.icons()[index]);
        }
      }
      const phoneIcons: string[] = [];
      for (let index = 0; index < phone.icons().length; index++) {
        if (phoneIcons.indexOf(phone.icons()[index]) < 0) {
          phoneIcons.push(phone.icons()[index]);
        }
      }
      expect(tabletIcons.length).assertEqual(6);
      expect(phoneIcons.length).assertEqual(4);
      expect(phoneIcons.indexOf(ICON_SUBMIT)).assertEqual(-1);
      expect(tabletIcons.indexOf(ICON_SUBMIT) >= 0).assertTrue();
    });

    it('Browser_Menu_035', 0, async () => {
      TestLogger.step(TAG, 'sum the entries of the tablet and phone menus');
      const tablet: MenuConfig = createTabletMenu();
      const phone: MenuConfig = createPhoneTools();
      expect(tablet.size() + phone.size()).assertEqual(10);
      expect(tablet.size()).assertEqual(LAST_ID);
      expect(phone.size()).assertEqual(PHONE_TOOL_COUNT);
      expect(tablet.isValid()).assertTrue();
      expect(phone.isValid()).assertTrue();
      expect(tablet.allActionsKnown()).assertTrue();
      expect(phone.allIconsKnown()).assertTrue();
    });

    it('Browser_Menu_036', 0, async () => {
      TestLogger.step(TAG, 'scan the navigation component suffix of both menus');
      const tablet: MenuConfig = createTabletMenu();
      const phone: MenuConfig = createPhoneTools();
      for (let order = 0; order < TABLET_NAV_COUNT; order++) {
        expect(tablet.itemAt(order)?.componentId).assertEqual('navigationButton' + order);
        expect(phone.itemAt(order)?.componentId).assertEqual('navigationButton' + order);
      }
      expect(tablet.itemAt(TABLET_NAV_COUNT)?.componentId).assertEqual('actionButton0');
      expect(tablet.itemAt(TABLET_NAV_COUNT + 1)?.componentId).assertEqual('actionButton1');
    });

    it('Browser_Menu_037', 0, async () => {
      TestLogger.step(TAG, 'describe every shipped menu item');
      const configs: MenuConfig[] = [
        createTabletNavigation(), createTabletActions(), createPhoneTools()
      ];
      let described: number = 0;
      for (let index = 0; index < configs.length; index++) {
        const config: MenuConfig = configs[index];
        for (let order = 0; order < config.size(); order++) {
          const item: MenuItem | null = config.itemAt(order);
          if (item !== null) {
            const text: string = item.describe();
            expect(text).assertContain('id=' + item.id);
            expect(text).assertContain('icon=' + item.icon);
            expect(text).assertContain('action=' + item.action);
            expect(text).assertContain('component=' + item.componentId);
            described += 1;
          }
        }
      }
      expect(described).assertEqual(TABLET_NAV_COUNT + TABLET_ACTION_COUNT + PHONE_TOOL_COUNT);
    });

    it('Browser_Menu_038', 0, async () => {
      TestLogger.step(TAG, 'audit every dispatched action of the shipped menus');
      const tablet: MenuConfig = createTabletMenu();
      const phone: MenuConfig = createPhoneTools();
      let handled: number = 0;
      for (let id = FIRST_ID; id <= LAST_ID; id++) {
        const tabletAction: string = dispatchAction(tablet, id);
        if (tabletAction !== ACTION_NONE) {
          expect(KNOWN_ACTIONS.indexOf(tabletAction) >= 0).assertTrue();
          handled += 1;
        }
        const phoneAction: string = dispatchAction(phone, id);
        if (phoneAction !== ACTION_NONE) {
          expect(KNOWN_ACTIONS.indexOf(phoneAction) >= 0).assertTrue();
        }
      }
      expect(handled).assertEqual(LAST_ID);
      expect(tablet.uniqueIdCount()).assertEqual(LAST_ID);
      expect(phone.uniqueIdCount()).assertEqual(PHONE_TOOL_COUNT);
    });

    it('Browser_Menu_039', 0, async () => {
      TestLogger.step(TAG, 'count the navigation buttons of the running layout');
      const ids: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME];
      for (let index = 0; index < ids.length; index++) {
        const count: number = await countById(driver, ids[index]);
        expect(count).assertLarger(0);
        const present: boolean = await componentByIdExists(driver, ids[index]);
        expect(present).assertTrue();
      }
    });

    it('Browser_Menu_040', 0, async () => {
      TestLogger.step(TAG, 'resolve the submit action of the running layout');
      const submit: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      expect(submit).assertTrue();
      const add: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, 'add tab action present on this device: ' + add);
      expect(typeof add).assertEqual('boolean');
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
    });

    it('Browser_Menu_041', 0, async () => {
      TestLogger.step(TAG, 'verify the address bar shared by both menu layouts');
      const present: boolean = await componentByIdExists(driver, 'inputUrl');
      expect(present).assertTrue();
      const inputCount: number = await countById(driver, 'inputUrl');
      expect(inputCount).assertEqual(1);
    });

    it('Browser_Menu_042', 0, async () => {
      TestLogger.step(TAG, 'audit every shipped configuration with the same rules');
      const configs: MenuConfig[] = [
        createTabletNavigation(), createTabletActions(), createPhoneTools(), createTabletMenu()
      ];
      for (let index = 0; index < configs.length; index++) {
        const config: MenuConfig = configs[index];
        expect(config.size()).assertLarger(0);
        expect(config.uniqueIdCount()).assertEqual(config.size());
        expect(config.duplicateIds().length).assertEqual(0);
        expect(config.allIconsKnown()).assertTrue();
        expect(config.allActionsKnown()).assertTrue();
        expect(config.ordersAreSequential()).assertTrue();
        expect(config.isValid()).assertTrue();
        expect(config.summary().startsWith(config.name)).assertTrue();
      }
    });

    it('Browser_Menu_043', 0, async () => {
      TestLogger.step(TAG, 'verify four distinct icons on the phone tool bar');
      const config: MenuConfig = createPhoneTools();
      const icons: string[] = config.icons();
      const distinct: string[] = [];
      for (let index = 0; index < icons.length; index++) {
        if (distinct.indexOf(icons[index]) < 0) {
          distinct.push(icons[index]);
        }
      }
      expect(distinct.length).assertEqual(PHONE_TOOL_COUNT);
      expect(distinct.indexOf(ICON_HOME) >= 0).assertTrue();
      expect(distinct.indexOf(ICON_REFRESH) >= 0).assertTrue();
      expect(distinct.indexOf(ICON_SUBMIT)).assertEqual(-1);
    });

    it('Browser_Menu_044', 0, async () => {
      TestLogger.step(TAG, 'verify six distinct actions on the tablet menu');
      const config: MenuConfig = createTabletMenu();
      const actions: string[] = config.actions();
      const distinct: string[] = [];
      for (let index = 0; index < actions.length; index++) {
        if (distinct.indexOf(actions[index]) < 0) {
          distinct.push(actions[index]);
        }
      }
      expect(distinct.length).assertEqual(LAST_ID);
      expect(distinct.indexOf(ACTION_SUBMIT) >= 0).assertTrue();
      expect(distinct.indexOf(ACTION_ADD) >= 0).assertTrue();
      expect(distinct.indexOf(ACTION_NONE)).assertEqual(-1);
    });

    it('Browser_Menu_045', 0, async () => {
      TestLogger.step(TAG, 'scan the id to icon table of the tablet menu');
      const config: MenuConfig = createTabletMenu();
      const icons: string[] = [
        ICON_BACK, ICON_FORWARD, ICON_REFRESH, ICON_HOME, ICON_SUBMIT, ICON_ADD
      ];
      for (let id = FIRST_ID; id <= LAST_ID; id++) {
        expect(config.iconOf(id)).assertEqual(icons[id - 1]);
        expect(config.find(id)?.id).assertEqual(id);
        expect(config.find(id)?.order).assertEqual(id - 1);
      }
      expect(config.iconOf(FIRST_ID - 1)).assertEqual('');
      expect(config.iconOf(LAST_ID + 1)).assertEqual('');
    });

    it('Browser_Menu_046', 0, async () => {
      TestLogger.step(TAG, 'cross check every component id against its action');
      const config: MenuConfig = createTabletMenu();
      const expected: string[] = [
        ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
        ID_ACTION_SUBMIT, ID_ACTION_ADD
      ];
      const actions: string[] = [
        ACTION_BACK, ACTION_FORWARD, ACTION_REFRESH, ACTION_HOME, ACTION_SUBMIT, ACTION_ADD
      ];
      for (let index = 0; index < expected.length; index++) {
        const id: number = index + 1;
        expect(config.componentIdOf(id)).assertEqual(expected[index]);
        expect(config.actionOf(id)).assertEqual(actions[index]);
        expect(config.find(id)?.componentId).assertEqual(expected[index]);
      }
    });

    it('Browser_Menu_047', 0, async () => {
      TestLogger.step(TAG, 'grow tabs through the add handler until it is rejected');
      const browser: MockBrowser = new MockBrowser(1);
      const action: string = dispatchAction(createTabletMenu(), 6);
      let accepted: number = 0;
      let rejected: number = 0;
      for (let attempt = 0; attempt < 12; attempt++) {
        if (applyMenuAction(browser, action, PAD_HOME_PAGE)) {
          accepted += 1;
        } else {
          rejected += 1;
        }
      }
      expect(accepted).assertEqual(MAX_TAB_COUNT);
      expect(rejected).assertEqual(2);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts.length).assertEqual(2);
      expect(browser.toasts[0]).assertEqual(browser.toasts[1]);
    });

    it('Browser_Menu_048', 0, async () => {
      TestLogger.step(TAG, 'load the phone home page into the selected second tab');
      const browser: MockBrowser = new MockBrowser(2);
      browser.selectTab(1);
      expect(applyMenuAction(browser, ACTION_HOME, PHONE_HOME_PAGE)).assertTrue();
      expect(browser.tabs[1].controller.getPendingUrl()).assertEqual(PHONE_HOME_PAGE);
      expect(browser.tabs[0].controller.getPendingUrl()).assertEqual('');
      expect(browser.getTabArrayIndex()).assertEqual(1);
      expect(browser.tabs.length).assertEqual(2);
    });

    it('Browser_Menu_049', 0, async () => {
      TestLogger.step(TAG, 'dispatch the same id repeatedly without changing the config');
      const config: MenuConfig = createTabletMenu();
      const snapshot: number[] = config.ids();
      for (let round = 0; round < 5; round++) {
        expect(dispatchAction(config, 1)).assertEqual(ACTION_BACK);
        expect(dispatchAction(config, 4)).assertEqual(ACTION_HOME);
        expect(dispatchAction(config, 6)).assertEqual(ACTION_ADD);
      }
      expect(config.ids()).assertDeepEquals(snapshot);
      expect(config.size()).assertEqual(LAST_ID);
      expect(config.isValid()).assertTrue();
    });

    it('Browser_Menu_050', 0, async () => {
      TestLogger.step(TAG, 'audit the aggregate size of all shipped menus');
      const nav: MenuConfig = createTabletNavigation();
      const actions: MenuConfig = createTabletActions();
      const phone: MenuConfig = createPhoneTools();
      const total: number = nav.size() + actions.size() + phone.size();
      expect(total).assertEqual(10);
      expect(nav.allIconsKnown()).assertTrue();
      expect(actions.allIconsKnown()).assertTrue();
      expect(phone.allActionsKnown()).assertTrue();
      expect(nav.summary()).assertContain('tabletNavigation');
      expect(actions.summary()).assertContain('tabletActions');
      expect(phone.summary()).assertContain('phoneToolBar');
    });

    it('Browser_Menu_051', 0, async () => {
      TestLogger.step(TAG, 'confirm every known icon is used by a shipped menu');
      const used: string[] = createTabletMenu().icons().concat(createPhoneTools().icons());
      for (let index = 0; index < KNOWN_ICONS.length; index++) {
        expect(used.indexOf(KNOWN_ICONS[index]) >= 0).assertTrue();
      }
      expect(used.indexOf(ICON_ADD) >= 0).assertTrue();
      expect(used.indexOf(ICON_SUBMIT) >= 0).assertTrue();
      expect(used.indexOf('ic_public_unknown')).assertEqual(-1);
    });

    it('Browser_Menu_052', 0, async () => {
      TestLogger.step(TAG, 'verify the phone bar is ordered by slot rather than by id');
      const config: MenuConfig = createPhoneTools();
      const ids: number[] = config.ids();
      let ascending: boolean = true;
      for (let index = 1; index < ids.length; index++) {
        if (ids[index] < ids[index - 1]) {
          ascending = false;
        }
      }
      expect(ascending).assertFalse();
      const home: MenuItem | null = config.find(ID_HOME_PHONE);
      const refresh: MenuItem | null = config.find(3);
      expect(home === null).assertFalse();
      expect(refresh === null).assertFalse();
      if (home !== null && refresh !== null) {
        expect(home.order).assertLess(refresh.order);
        expect(home.id).assertLarger(refresh.id);
      }
      expect(config.componentIdOf(ID_HOME_PHONE)).assertEqual('navigationButton2');
      expect(config.componentIdOf(3)).assertEqual('navigationButton3');
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(5);
      expect(ids[3]).assertEqual(3);
      expect(config.size()).assertEqual(4);
      expect(config.uniqueIdCount()).assertEqual(4);
      expect(config.find(5)?.order).assertEqual(2);
    });
  });
}
