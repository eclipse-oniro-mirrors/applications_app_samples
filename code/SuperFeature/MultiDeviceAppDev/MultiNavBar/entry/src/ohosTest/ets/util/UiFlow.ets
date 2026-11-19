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

import { Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { expect } from '@ohos/hypium';
import { ComponentId } from '../../../main/ets/common/Constants';

export const UI_LOG_DOMAIN: number = 0xF811;
export const UI_TAG: string = '[Sample_MultiNavBar]';
export const ABILITY_NAME: string = 'EntryAbility';

/** Ids come from main/ets/common/Constants.ets, so a rename in main fails the build instead of the run. */
export const ID_SWITCH: string = ComponentId.SWITCH_BUTTON;
export const ID_SEARCH: string = ComponentId.SEARCH_BUTTON;
export const ID_ADD: string = ComponentId.ADD_TOOLS;
export const ID_MORE: string = ComponentId.MORE_TOOLS;

/** The account rows are located by id because their copy now comes from string.json. */
export const ID_ACCOUNT: string = ComponentId.ACCOUNT_TITLE;

/** Plain text nodes whose value is the same in every locale. */
export const TEXT_PHONE: string = '139******43';
export const TEXT_MENU_FIRST: string = 'Menu1';

/**
 * Rendered in md/lg only; the sm layout keeps the bottom nav and the tab content alone.
 * searchButton is left out on purpose: the home page content reuses the same id inside its
 * search box, so that node stays visible on an sm window.
 */
export const SIDEBAR_ONLY_IDS: string[] = [ID_SWITCH, ID_ADD, ID_MORE, ID_ACCOUNT];

export const WIDE_MODE: string = 'wide';
export const NARROW_MODE: string = 'narrow';

const POLL_MS: number = 100;
const TAP_MS: number = 320;

export interface BoxInfo {
  present: boolean;
  left: number;
  top: number;
  right: number;
  bottom: number;
}

function emptyBox(): BoxInfo {
  return { present: false, left: 0, top: 0, right: 0, bottom: 0 };
}

/**
 * Thin, non throwing wrapper around @ohos.UiTest.
 * Every helper reports a boolean or a BoxInfo so a case can log the observed value
 * and assert on it instead of relying on exceptions.
 */
export class UiFlow {
  private driverInstance: Driver | undefined = undefined;
  wide: boolean = false;
  /** 'wide' for md/lg, 'narrow' for sm; decided once in boot(). */
  mode: string = NARROW_MODE;

  /** Created on first use, so constructing a flow outside a test run never throws. */
  get driver(): Driver {
    let instance: Driver | undefined = this.driverInstance;
    if (instance === undefined) {
      instance = Driver.create();
      this.driverInstance = instance;
    }
    return instance;
  }

  static async boot(retries: number = 3): Promise<UiFlow> {
    const flow = new UiFlow();
    for (let i = 0; i < retries; i++) {
      try {
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
        await delegator.startAbility({ bundleName: bundleName, abilityName: ABILITY_NAME });
      } catch (err) {
        hilog.info(UI_LOG_DOMAIN, UI_TAG, 'startAbility attempt %{public}d failed: %{public}s', i,
          JSON.stringify(err));
      }
      await flow.sleep(600);
      flow.wide = await flow.waitId(ID_SWITCH, 4000);
      flow.mode = flow.wide ? WIDE_MODE : NARROW_MODE;
      if (flow.wide) {
        return flow;
      }
      // A narrow window never hosts the side bar; the tab host proves the page is already up,
      // so there is no reason to spend the remaining retries.
      if (await flow.typeExists('Tabs')) {
        return flow;
      }
    }
    hilog.info(UI_LOG_DOMAIN, UI_TAG, 'boot finished without the wide layout, wide=%{public}s',
      String(flow.wide));
    return flow;
  }

  sleep(ms: number): Promise<void> {
    return this.driver.delayMs(ms);
  }

  async exists(id: string): Promise<boolean> {
    try {
      const component = await this.driver.findComponent(ON.id(id));
      return !!component;
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'exists(%{public}s) raised %{public}s', id, JSON.stringify(err));
      return false;
    }
  }

  async textExists(text: string): Promise<boolean> {
    try {
      const component = await this.driver.findComponent(ON.text(text));
      return !!component;
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'textExists(%{public}s) raised %{public}s', text, JSON.stringify(err));
      return false;
    }
  }

  async typeExists(type: string): Promise<boolean> {
    try {
      const component = await this.driver.findComponent(ON.type(type));
      return !!component;
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'typeExists(%{public}s) raised %{public}s', type, JSON.stringify(err));
      return false;
    }
  }

  /** Side bar widgets that are absent; on an sm window this is the whole list. */
  async sidebarIdsAbsent(): Promise<number> {
    let absent: number = 0;
    for (const id of SIDEBAR_ONLY_IDS) {
      if (!await this.exists(id)) {
        absent++;
      }
    }
    return absent;
  }

  async boxOf(id: string): Promise<BoxInfo> {
    try {
      const component = await this.driver.findComponent(ON.id(id));
      if (!component) {
        return emptyBox();
      }
      const rect = await component.getBounds();
      return {
        present: true, left: rect.left, top: rect.top, right: rect.right, bottom: rect.bottom
      };
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'boxOf(%{public}s) raised %{public}s', id, JSON.stringify(err));
      return emptyBox();
    }
  }

  async boxOfText(text: string): Promise<BoxInfo> {
    try {
      const component = await this.driver.findComponent(ON.text(text));
      if (!component) {
        return emptyBox();
      }
      const rect = await component.getBounds();
      return {
        present: true, left: rect.left, top: rect.top, right: rect.right, bottom: rect.bottom
      };
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'boxOfText(%{public}s) raised %{public}s', text, JSON.stringify(err));
      return emptyBox();
    }
  }

  async waitId(id: string, timeoutMs: number = 5000): Promise<boolean> {
    const rounds = Math.floor(timeoutMs / POLL_MS);
    for (let i = 0; i < rounds; i++) {
      if (await this.exists(id)) {
        return true;
      }
      await this.sleep(POLL_MS);
    }
    return false;
  }

  async waitNoId(id: string, timeoutMs: number = 5000): Promise<boolean> {
    const rounds = Math.floor(timeoutMs / POLL_MS);
    for (let i = 0; i < rounds; i++) {
      if (!await this.exists(id)) {
        return true;
      }
      await this.sleep(POLL_MS);
    }
    return false;
  }

  async waitText(text: string, timeoutMs: number = 5000): Promise<boolean> {
    const rounds = Math.floor(timeoutMs / POLL_MS);
    for (let i = 0; i < rounds; i++) {
      if (await this.textExists(text)) {
        return true;
      }
      await this.sleep(POLL_MS);
    }
    return false;
  }

  async waitNoText(text: string, timeoutMs: number = 5000): Promise<boolean> {
    const rounds = Math.floor(timeoutMs / POLL_MS);
    for (let i = 0; i < rounds; i++) {
      if (!await this.textExists(text)) {
        return true;
      }
      await this.sleep(POLL_MS);
    }
    return false;
  }

  async tap(id: string): Promise<boolean> {
    try {
      const component = await this.driver.findComponent(ON.id(id));
      if (!component) {
        return false;
      }
      await component.click();
      await this.sleep(TAP_MS);
      return true;
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'tap(%{public}s) raised %{public}s', id, JSON.stringify(err));
      return false;
    }
  }

  /** tabs -> list, the add button disappears and the account block is removed. */
  async ensureList(): Promise<boolean> {
    if (!await this.exists(ID_ADD)) {
      return await this.exists(ID_MORE);
    }
    return await this.tap(ID_SWITCH);
  }

  /** list -> tabs, either through the hamburger button or through the search touch handler. */
  async ensureTabs(): Promise<boolean> {
    if (await this.exists(ID_ADD)) {
      return true;
    }
    if (await this.exists(ID_SEARCH)) {
      await this.tap(ID_SEARCH);
      if (await this.waitId(ID_ADD, 3000)) {
        return true;
      }
    }
    if (await this.exists(ID_SWITCH)) {
      await this.tap(ID_SWITCH);
    }
    return await this.waitId(ID_ADD, 3000);
  }

  /** One extra footer tool, only reachable in tabs mode. */
  async addTool(): Promise<boolean> {
    if (!await this.ensureTabs()) {
      return false;
    }
    return await this.tap(ID_ADD);
  }

  async closeMenu(): Promise<boolean> {
    try {
      await this.driver.pressBack();
      await this.sleep(TAP_MS);
      return true;
    } catch (err) {
      hilog.info(UI_LOG_DOMAIN, UI_TAG, 'closeMenu raised %{public}s', JSON.stringify(err));
      return false;
    }
  }

  /** Known clean state: no popup, tabs mode, add button visible. sm has no such modes to reset. */
  async reset(): Promise<boolean> {
    if (!this.wide) {
      return true;
    }
    await this.closeMenu();
    return await this.ensureTabs();
  }
}

/**
 * Replacement body for a side bar case on an sm window: no side bar widget is
 * rendered and the tab content is still mounted.
 */
export async function assertNarrowLayout(flow: UiFlow, caseName: string): Promise<void> {
  const absent: number = await flow.sidebarIdsAbsent();
  hilog.info(UI_LOG_DOMAIN, UI_TAG, '%{public}s layout=%{public}s sidebarAbsent=%{public}d expected=%{public}d',
    caseName, flow.mode, absent, SIDEBAR_ONLY_IDS.length);
  expect(absent).assertEqual(SIDEBAR_ONLY_IDS.length);
  const tabs: boolean = await flow.typeExists('Tabs');
  hilog.info(UI_LOG_DOMAIN, UI_TAG, '%{public}s tabsPresent=%{public}s expected=true', caseName, String(tabs));
  expect(tabs).assertTrue();
}
