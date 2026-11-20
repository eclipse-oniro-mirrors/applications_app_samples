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

import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import resourceManager from '@ohos.resourceManager';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import Logger from '../../utils/Logger';
import {
  ABILITY_NAME,
  BUNDLE_NAME,
  MODULE_NAME,
  POLL_INTERVAL,
  SETTLE_PAGE,
  SETTLE_UI,
  TAB_BAR_MAX_LEFT,
  TAB_BAR_MAX_WIDTH,
  TAB_CONTENT_MAX_OFFSET,
  TAB_COUNT,
  TIMEOUT_LAUNCH,
  TIMEOUT_MENU,
  TIMEOUT_TEXT,
  ID_SELECT_ANIMATION,
  UiText
} from './TestConstant';

/**
 * Local view of a component rectangle. The UiTest Rect type is not exported on
 * the SDK 9 baseline, so the four values are copied into this interface. The
 * copy is explicit because ArkTS forbids assigning one structural type to
 * another (arkts-no-structural-typing).
 */
export interface BoundsInfo {
  readonly left: number;
  readonly top: number;
  readonly right: number;
  readonly bottom: number;
}

export async function getComponentBounds(component: Component): Promise<BoundsInfo> {
  const rect = await component.getBounds();
  const bounds: BoundsInfo = {
    left: rect.left,
    top: rect.top,
    right: rect.right,
    bottom: rect.bottom
  };
  return bounds;
}

export async function sleep(milliseconds: number): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, milliseconds);
  });
}

export async function createDriver(attempts: number = 3): Promise<Driver> {
  for (let attempt: number = 0; attempt < attempts; attempt++) {
    try {
      const driver: Driver = Driver.create();
      return driver;
    } catch (error) {
      await sleep(POLL_INTERVAL);
    }
  }
  return Driver.create();
}

/**
 * Starts the sample application through its explicit want. The callback form
 * is used so a failed launch is reported as a boolean instead of escaping as
 * an unhandled rejection inside the suite.
 */
export function launchApp(): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = {
    bundleName: BUNDLE_NAME,
    moduleName: MODULE_NAME,
    abilityName: ABILITY_NAME
  };
  return new Promise<boolean>((resolve: (value: boolean) => void): void => {
    delegator.startAbility(want, (error: BusinessError): void => {
      const failed: boolean = error !== undefined && error !== null && error.code !== 0;
      resolve(!failed);
    });
  });
}

export async function getTopAbility(): Promise<UIAbility | null> {
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const ability: UIAbility = await delegator.getCurrentTopAbility();
    return ability;
  } catch (error) {
    return null;
  }
}

export async function getAppResourceManager(): Promise<resourceManager.ResourceManager | null> {
  let ability: UIAbility | null = await getTopAbility();
  if (ability === null) {
    await launchApp();
    await sleep(SETTLE_PAGE);
    ability = await getTopAbility();
  }
  if (ability === null) {
    return null;
  }
  try {
    return ability.context.resourceManager;
  } catch (error) {
    return null;
  }
}

export function getTestResourceManager(): resourceManager.ResourceManager {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
}

/**
 * Reads an application string by name from the ability resource manager. Only
 * the callback overload exists on this API level, so the callback is wrapped
 * into a promise for use from the suites.
 */
export function getAppStringByName(rm: resourceManager.ResourceManager, name: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void,
    reject: (reason: BusinessError) => void): void => {
    rm.getStringByName(name, (error: BusinessError, value: string): void => {
      if (error !== undefined && error !== null && error.code !== 0) {
        reject(error);
      } else {
        resolve(value);
      }
    });
  });
}

export async function getAppMediaByName(rm: resourceManager.ResourceManager,
  name: string): Promise<Uint8Array> {
  return await rm.getMediaByName(name);
}

export async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component;
  } catch (error) {
    return null;
  }
}

export async function findByText(driver: Driver, text: string): Promise<Component | null> {
  try {
    const component: Component = await driver.findComponent(ON.text(text));
    return component;
  } catch (error) {
    return null;
  }
}

export async function waitForText(driver: Driver, text: string, timeoutMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await findByText(driver, text) !== null) {
      return true;
    }
    await sleep(POLL_INTERVAL);
  }
  return false;
}

export async function waitForId(driver: Driver, id: string, timeoutMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await findById(driver, id) !== null) {
      return true;
    }
    await sleep(POLL_INTERVAL);
  }
  return false;
}

export async function tapById(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    await sleep(SETTLE_UI);
    return true;
  } catch (error) {
    return false;
  }
}

export async function tapByText(driver: Driver, text: string): Promise<boolean> {
  const component: Component | null = await findByText(driver, text);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    await sleep(SETTLE_UI);
    return true;
  } catch (error) {
    return false;
  }
}

/**
 * Taps a popup menu entry. The entry is exposed as a clickable Option node that
 * wraps a non-clickable Text node, so the clickable filter is required; tapping
 * the inner text does not activate the menu action.
 */
export async function tapMenuOption(driver: Driver, text: string): Promise<boolean> {
  try {
    const components: Array<Component> = await driver.findComponents(ON.text(text).clickable(true));
    if (components.length === 0) {
      return false;
    }
    await components[0].click();
    await sleep(SETTLE_UI);
    return true;
  } catch (error) {
    return false;
  }
}

/**
 * Brings the sample page to the top. Launching an already-running singleton
 * ability only moves it to the foreground, so the page keeps its state; every
 * suite therefore treats this as a visibility guard rather than a reset.
 */
export async function ensureAppVisible(driver: Driver): Promise<boolean> {
  if (await waitForText(driver, UiText.PAGE_TITLE, 500)) {
    return true;
  }
  for (let attempt: number = 0; attempt < 2; attempt++) {
    await launchApp();
    await sleep(800);
    if (await waitForText(driver, UiText.PAGE_TITLE, 2000)) {
      return true;
    }
    await scrollPageToTop(driver);
    if (await waitForText(driver, UiText.PAGE_TITLE, 2000)) {
      return true;
    }
  }
  return false;
}

async function runShell(command: string): Promise<boolean> {
  try {
    await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(command, 10);
    return true;
  } catch (error) {
    return false;
  }
}

export async function scrollPageToBottom(driver: Driver): Promise<boolean> {
  const target: display.Display = display.getDefaultDisplaySync();
  const x: number = Math.round(target.width / 2);
  const fromY: number = Math.round(target.height * 0.8);
  const toY: number = Math.round(target.height * 0.25);
  let executed: boolean = false;
  for (let round: number = 0; round < 2; round++) {
    const ok: boolean = await runShell('uitest uiInput swipe ' + x.toString() + ' ' +
      fromY.toString() + ' ' + x.toString() + ' ' + toY.toString() + ' 600');
    executed = executed || ok;
    await sleep(250);
  }
  await sleep(300);
  return executed;
}

export async function scrollPageToTop(driver: Driver): Promise<boolean> {
  const target: display.Display = display.getDefaultDisplaySync();
  const x: number = Math.round(target.width / 2);
  const fromY: number = Math.round(target.height * 0.25);
  const toY: number = Math.round(target.height * 0.8);
  let executed: boolean = false;
  for (let round: number = 0; round < 3; round++) {
    const ok: boolean = await runShell('uitest uiInput swipe ' + x.toString() + ' ' +
      fromY.toString() + ' ' + x.toString() + ' ' + toY.toString() + ' 600');
    executed = executed || ok;
    await sleep(250);
  }
  await sleep(500);
  return executed;
}

/**
 * Opens the animation selector and taps one entry. The menu item is located by
 * its rendered text because the popup owns no test id of its own.
 */
export async function selectAnimation(driver: Driver, menuItem: string,
  expectedText: string): Promise<boolean> {
  for (let attempt: number = 0; attempt < 2; attempt++) {
    const button: Component | null = await findById(driver, ID_SELECT_ANIMATION);
    if (button === null) {
      await sleep(SETTLE_UI);
      continue;
    }
    try {
      await button.click();
    } catch (error) {
      await sleep(SETTLE_UI);
      continue;
    }
    await sleep(SETTLE_UI);
    if (!await waitForText(driver, menuItem, TIMEOUT_MENU)) {
      continue;
    }
    if (!await tapMenuOption(driver, menuItem)) {
      continue;
    }
    if (await waitForText(driver, expectedText, 800)) {
      return true;
    }
    const closedMenu: Component | null = await findByText(driver, menuItem);
    if (closedMenu === null && await pageAlive(driver)) {
      return true;
    }
  }
  return false;
}

/**
 * Guarantees that the grunt animation is loaded. Several controls are guarded
 * by `animateItem !== null`, so a case that exercises them must first select an
 * animation asset.
 */
export async function ensureAnimationLoaded(driver: Driver): Promise<boolean> {
  if (await waitForText(driver, UiText.GRUNT, 600)) {
    return true;
  }
  return await selectAnimation(driver, UiText.MENU_GRUNT, UiText.GRUNT);
}

/**
 * Resolves the single TabBar node of the page. ArkUI exposes the custom
 * vertical bar as one component, not as one text node per entry, so entries
 * are addressed by their geometric slot inside this bar.
 */
export async function findTabBar(driver: Driver): Promise<Component | null> {
  try {
    const bars: Array<Component> = await driver.findComponents(ON.type('TabBar'));
    if (bars.length === 0) {
      return null;
    }
    return bars[0];
  } catch (error) {
    return null;
  }
}

export async function switchTab(driver: Driver, label: string, index: number,
  contentLabel: string): Promise<boolean> {
  let bar: Component | null = await findTabBar(driver);
  let needScroll: boolean = true;
  if (bar !== null) {
    const initialBounds: BoundsInfo = await getComponentBounds(bar);
    needScroll = (initialBounds.bottom - initialBounds.top) < 250;
  }
  if (needScroll) {
    await scrollPageToBottom(driver);
    bar = await findTabBar(driver);
  }
  if (bar === null) {
    return false;
  }
  const bounds: BoundsInfo = await getComponentBounds(bar);
  const width: number = bounds.right - bounds.left;
  const height: number = bounds.bottom - bounds.top;
  if (width <= 0 || height <= 0) {
    return false;
  }
  const x: number = bounds.left + width / 2;
  const y: number = bounds.top + (index + 0.5) * height / TAB_COUNT;
  const clickX: number = Math.round(x);
  const clickY: number = Math.round(y);
  Logger.info('[LottieTest]', 'switchTab index=' + index.toString() + ', x=' + clickX.toString() +
    ', y=' + clickY.toString() + ', bar=' + bounds.left.toString() + ',' +
    bounds.top.toString() + ',' + bounds.right.toString() + ',' + bounds.bottom.toString());
  const executed: boolean = await runShell('uitest uiInput click ' + clickX.toString() +
    ' ' + clickY.toString());
  if (!executed) {
    Logger.info('[LottieTest]', 'switchTab shell click failed index=' + index.toString());
    return false;
  }
  await sleep(800);
  const switched: boolean = await waitForText(driver, contentLabel, 3000);
  Logger.info('[LottieTest]', 'switchTab index=' + index.toString() +
    ' switched=' + JSON.stringify(switched));
  return switched;
}

/**
 * Taps a control inside the active tab content. Only the icon carries the
 * click handler and the popup binding; the text below it is a label. The icon
 * is therefore located by geometry: the image directly above the label in the
 * vertical band of the tab bar, right of the bar.
 */
export async function clickTabContentIcon(driver: Driver, tabLabel: string, tabIndex: number,
  text: string): Promise<boolean> {
  try {
    const bar: Component | null = await findTabBar(driver);
    if (bar === null) {
      return false;
    }
    const barBounds: BoundsInfo = await getComponentBounds(bar);
    const labels: Array<Component> = await driver.findComponents(ON.text(text));
    let labelBounds: BoundsInfo | null = null;
    for (let i: number = 0; i < labels.length; i++) {
      const bounds: BoundsInfo = await getComponentBounds(labels[i]);
      const insideBand: boolean = bounds.top >= barBounds.top - 20 &&
        bounds.top <= barBounds.top + TAB_CONTENT_MAX_OFFSET;
      const rightOfBar: boolean = bounds.left >= barBounds.right - 10;
      if (insideBand && rightOfBar) {
        labelBounds = bounds;
        break;
      }
    }
    if (labelBounds === null) {
      return false;
    }
    const labelCenterX: number = (labelBounds.left + labelBounds.right) / 2;
    const images: Array<Component> = await driver.findComponents(ON.type('Image'));
    for (let i: number = 0; i < images.length; i++) {
      const bounds: BoundsInfo = await getComponentBounds(images[i]);
      const aboveLabel: boolean = bounds.bottom <= labelBounds.top + 10 &&
        bounds.bottom >= labelBounds.top - 60;
      const centerX: number = (bounds.left + bounds.right) / 2;
      const aligned: boolean = Math.abs(centerX - labelCenterX) <= 140;
      if (aboveLabel && aligned) {
        await images[i].click();
        await sleep(SETTLE_UI);
        return true;
      }
    }
    return false;
  } catch (error) {
    return false;
  }
}

export async function pageAlive(driver: Driver): Promise<boolean> {
  return await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
}

export function isLegalAbilityState(state: number): boolean {
  return state >= 0 && state <= 4;
}

export async function waitForAbilityState(ability: UIAbility, expected: number,
  timeoutMs: number): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (delegator.getAbilityState(ability) === expected) {
      return true;
    }
    await sleep(POLL_INTERVAL);
  }
  return false;
}
