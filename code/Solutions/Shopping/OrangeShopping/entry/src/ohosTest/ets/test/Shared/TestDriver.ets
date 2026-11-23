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

import { Driver, ON, Component, MatchPattern } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';

/**
 * UI facade shared by the OrangeShopping interaction suites.
 *
 * The sample runs as a single ability with a bottom tab bar. All helpers are
 * idempotent: a suite can call ensureHome() at any point and recover from an
 * unexpected page, dialog or permission prompt. Logs are emitted through
 * hilog in English so that collection stays stable across locales.
 */

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export const BUNDLE_NAME: string = 'ohos.samples.orangeshopping';
export const MAIN_ABILITY: string = 'MainAbility';

export const TIMEOUT_LAUNCH: number = 4000;
export const TIMEOUT_RENDER: number = 1500;
export const TIMEOUT_DIALOG: number = 1000;
export const POLL_INTERVAL: number = 200;
export const DEFAULT_WAIT: number = 3000;

export const TAB_HOME: string = 'homeTab0';
export const TAB_NEW_PRODUCT: string = 'homeTab1';
export const TAB_CART: string = 'homeTab2';
export const TAB_USER: string = 'homeTab3';

export const ID_GOODS_PREFIX: string = 'goods';
export const ID_CART_GOODS_PREFIX: string = 'cart_goods';
export const ID_DETAIL_PREFIX: string = 'goodsDetail';
export const ID_PLAY_BUTTON: string = 'playBtn';
export const ID_PREVIEW_IMAGE: string = 'previewImg';
export const ID_FULL_VIDEO: string = 'fullVideo';
export const ID_FULL_PLAY_BUTTON: string = 'fullPlayBtn';
export const ID_VIDEO_PAGE: string = 'VideoPage';
export const ID_DIRECT_VIDEO: string = 'directVideo';
export const ID_CLOSE_BUTTON: string = 'close';

export const TEXT_ALLOW: Resource = $r('app.string.allow');
export const TEXT_CLOSE: Resource = $r('app.string.close');
export const TEXT_UPDATE: Resource = $r('app.string.update');
export const TEXT_ADD_TO_CART: Resource = $r('app.string.add_to_cart');
export const TEXT_SHOPPING_CART: Resource = $r('app.string.shopping_cart');
export const TEXT_OFFICIAL_SERVICE: Resource = $r('app.string.official_Service');
export const TEXT_HOME_TITLE: Resource = $r('app.string.tab_title_data_home');
export const TEXT_SELECTED_TITLE: Resource = $r('app.string.title_bar_data_title_selected');

let cachedDriver: Driver | null = null;

/**
 * Returns a lazily created, process wide driver. Creating a driver for every
 * test case is expensive and can leave stale component handles behind.
 */
export async function getDriver(): Promise<Driver> {
  if (cachedDriver === null) {
    cachedDriver = await Driver.create();
  }
  return cachedDriver;
}

export async function resetDriver(): Promise<void> {
  cachedDriver = null;
}

export function delay(milliseconds: number = POLL_INTERVAL): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, milliseconds);
  });
}

/** Reads via the resource manager, so labels match the device locale. */
export async function getString(resource: Resource): Promise<string> {
  let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  let value: string = await context.resourceManager.getStringValue(resource);
  return value;
}

/** Swallows failures: a repeat start on a running ability may reject. */
export async function startMainAbility(): Promise<void> {
  let want: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: MAIN_ABILITY
  };
  let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    await abilityDelegator.startAbility(want);
    hilog.info(DOMAIN, TAG, '%{public}s', 'main ability started');
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'main ability start failed');
  }
}

export async function findById(id: string): Promise<Component | null> {
  let driver: Driver = await getDriver();
  return driver.findComponent(ON.id(id));
}

export async function findByText(text: string): Promise<Component | null> {
  let driver: Driver = await getDriver();
  return driver.findComponent(ON.text(text));
}

export async function findByTextContains(text: string): Promise<Component | null> {
  let driver: Driver = await getDriver();
  return driver.findComponent(ON.text(text, MatchPattern.CONTAINS));
}

export async function existsById(id: string): Promise<boolean> {
  let component: Component | null = await findById(id);
  return component !== null;
}

export async function existsByText(text: string): Promise<boolean> {
  let component: Component | null = await findByText(text);
  return component !== null;
}

/**
 * Returns true when any candidate text is on screen. Navigation components
 * resolve strings from their own HAR resources, so a page may render either an
 * English or a Chinese label depending on the device locale. Callers pass both
 * variants and the check stays valid in either locale.
 */
export async function existsAnyText(candidates: string[]): Promise<boolean> {
  for (let index: number = 0; index < candidates.length; index++) {
    if (await existsByText(candidates[index])) {
      return true;
    }
  }
  return false;
}

export async function waitForAnyText(candidates: string[], timeout: number = DEFAULT_WAIT): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() <= deadline) {
    if (await existsAnyText(candidates)) {
      return true;
    }
    await delay(POLL_INTERVAL);
  }
  return false;
}

/** A missing id counts as 0 instead of null. */
export async function countById(id: string): Promise<number> {
  let driver: Driver = await getDriver();
  let components: Component[] | null = await driver.findComponents(ON.id(id));
  return components === null ? 0 : components.length;
}

/**
 * Polls until the component with the given id exists or the timeout expires.
 */
export async function waitForId(id: string, timeout: number = DEFAULT_WAIT): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() <= deadline) {
    if (await existsById(id)) {
      return true;
    }
    await delay(POLL_INTERVAL);
  }
  return false;
}

export async function waitForText(text: string, timeout: number = DEFAULT_WAIT): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() <= deadline) {
    if (await existsByText(text)) {
      return true;
    }
    await delay(POLL_INTERVAL);
  }
  return false;
}

/** The only wait helper that accepts a partial label. */
export async function waitForTextContains(text: string, timeout: number = DEFAULT_WAIT): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() <= deadline) {
    let component: Component | null = await findByTextContains(text);
    if (component !== null) {
      return true;
    }
    await delay(POLL_INTERVAL);
  }
  return false;
}

/**
 * Polls until the component disappears. Used after a dialog is dismissed and
 * after a preview image is replaced by the video view.
 */
export async function waitUntilGoneById(id: string, timeout: number = DEFAULT_WAIT): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() <= deadline) {
    if (!(await existsById(id))) {
      return true;
    }
    await delay(POLL_INTERVAL);
  }
  return false;
}

/** Returns false with a warning when the id is absent, never throws. */
export async function clickById(id: string): Promise<boolean> {
  let component: Component | null = await findById(id);
  if (component === null) {
    hilog.warn(DOMAIN, TAG, 'component %{public}s not found', id);
    return false;
  }
  await component.click();
  await delay(POLL_INTERVAL);
  return true;
}

export async function clickByText(text: string): Promise<boolean> {
  let component: Component | null = await findByText(text);
  if (component === null) {
    hilog.warn(DOMAIN, TAG, 'text %{public}s not found', text);
    return false;
  }
  await component.click();
  await delay(POLL_INTERVAL);
  return true;
}

/**
 * Clicks a component when it is present. The boolean result lets a test assert
 * that an optional entry point existed or was already dismissed.
 */
export async function clickByTextIfExists(text: string): Promise<boolean> {
  let component: Component | null = await findByText(text);
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(POLL_INTERVAL);
  return true;
}

/** Silent on a miss, unlike clickById which logs a warning. */
export async function clickByIdIfExists(id: string): Promise<boolean> {
  let component: Component | null = await findById(id);
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(POLL_INTERVAL);
  return true;
}

/**
 * Dismisses the first run permission prompts, the advertisement dialog and the
 * upgrade dialog. Each prompt is handled at most once per call.
 */
export async function dismissStartupDialogs(): Promise<void> {
  let allowText: string = await getString(TEXT_ALLOW);
  let closeText: string = await getString(TEXT_CLOSE);
  let updateText: string = await getString(TEXT_UPDATE);
  for (let attempt: number = 0; attempt < 4; attempt++) {
    let allow: Component | null = await findByText(allowText);
    if (allow !== null) {
      await allow.click();
      await delay(TIMEOUT_DIALOG);
      continue;
    }
    let close: Component | null = await findByText(closeText);
    if (close !== null) {
      await close.click();
      await delay(TIMEOUT_DIALOG);
      continue;
    }
    let update: Component | null = await findByText(updateText);
    if (update !== null) {
      await update.click();
      await delay(TIMEOUT_DIALOG);
      continue;
    }
    break;
  }
  await delay(POLL_INTERVAL);
}

/**
 * Launches the sample and settles on the home tab. Safe to call repeatedly.
 */
export async function ensureHome(): Promise<void> {
  await startMainAbility();
  await delay(TIMEOUT_LAUNCH);
  await dismissStartupDialogs();
  if (!(await waitForId(TAB_HOME, TIMEOUT_RENDER))) {
    await delay(TIMEOUT_LAUNCH);
    await dismissStartupDialogs();
  }
  await clickByIdIfExists(TAB_HOME);
  await delay(TIMEOUT_RENDER);
  await swipeDown();
  await swipeDown();
  if (!(await waitForId('goods0', TIMEOUT_RENDER))) {
    await delay(TIMEOUT_LAUNCH);
    await clickByIdIfExists(TAB_HOME);
    await delay(TIMEOUT_RENDER);
  }
}

/** Index 0 home, 1 new product, 2 cart, 3 user, left to right. */
export async function switchTab(index: number): Promise<boolean> {
  let tabId: string = 'homeTab' + index.toString();
  let clicked: boolean = await clickById(tabId);
  await delay(TIMEOUT_RENDER);
  return clicked;
}

export async function openHomeTab(): Promise<boolean> {
  return switchTab(0);
}

export async function openNewProductTab(): Promise<boolean> {
  return switchTab(1);
}

/** Calls returnToHome first; the tab bar is absent on the detail route. */
export async function openCartTab(): Promise<boolean> {
  // The cart tab lives on the home shell, so a detail page must be left first.
  await returnToHome();
  let clicked: boolean = await switchTab(2);
  if (!clicked) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'openCartTab: cart tab click failed');
    return false;
  }
  // Confirm the page really rendered; a click alone can land before routing.
  let cartLabel: string = await getString(TEXT_SHOPPING_CART);
  let visible: boolean = await waitForText(cartLabel, TIMEOUT_RENDER);
  if (!visible) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'openCartTab: cart header not rendered');
  }
  return visible;
}

export async function openUserTab(): Promise<boolean> {
  return switchTab(3);
}

/** False usually means the tile is below the fold, so scroll first. */
export async function openGoodsById(goodsId: number): Promise<boolean> {
  let id: string = ID_GOODS_PREFIX + goodsId.toString();
  let present: boolean = await waitForId(id, TIMEOUT_RENDER);
  if (!present) {
    // Rewind to the top before trying the next screenful, otherwise a case
    // that inherits a scrolled grid can never reach the first row again.
    await swipeDown();
    present = await waitForId(id, TIMEOUT_RENDER);
  }
  if (!present) {
    await swipeUp();
    present = await waitForId(id, TIMEOUT_RENDER);
  }
  if (!present) {
    hilog.warn(DOMAIN, TAG, 'openGoodsById: %{public}s never became visible', id);
    return false;
  }
  let clicked: boolean = await clickByIdIfExists(id);
  await delay(TIMEOUT_RENDER);
  if (!clicked) {
    hilog.warn(DOMAIN, TAG, 'openGoodsById: click missed for %{public}s', id);
  }
  return clicked;
}

export async function openFirstGoods(): Promise<boolean> {
  return openGoodsById(0);
}

/**
 * Adds the currently visible detail page product to the cart. The detail page
 * exposes the action as a translated text button.
 */
export async function addCurrentGoodsToCart(): Promise<boolean> {
  let label: string = await getString(TEXT_ADD_TO_CART);
  let visible: boolean = await waitForText(label, TIMEOUT_RENDER);
  if (!visible) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'addCurrentGoodsToCart: add button missing');
    return false;
  }
  let clicked: boolean = await clickByText(label);
  await delay(TIMEOUT_RENDER);
  if (!clicked) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'addCurrentGoodsToCart: click missed');
  }
  return clicked;
}

export async function pressBack(): Promise<void> {
  let driver: Driver = await getDriver();
  await driver.pressBack();
  await delay(POLL_INTERVAL);
}

export async function pressBackTimes(times: number): Promise<void> {
  for (let index: number = 0; index < times; index++) {
    await pressBack();
  }
}

/**
 * Navigates back until the home tab bar is visible, with a bounded number of
 * back presses so a broken page cannot hang a suite.
 */
export async function returnToHome(): Promise<void> {
  for (let attempt: number = 0; attempt < 4; attempt++) {
    if (await existsById(TAB_HOME)) {
      await clickByIdIfExists(TAB_HOME);
      await waitForId('goods0', TIMEOUT_RENDER);
      await swipeDown();
      await swipeDown();
      let gridVisible: boolean = await waitForId('goods0', TIMEOUT_RENDER);
      if (gridVisible) {
        return;
      }
    }
    await pressBack();
    await delay(TIMEOUT_RENDER);
  }
  // Only restart the ability when the tab shell is really gone; a restart
  // would clear AppStorage and lose the cart that the case just built.
  if (await existsById(TAB_HOME)) {
    await clickByIdIfExists(TAB_HOME);
    await waitForId('goods0', TIMEOUT_RENDER);
    return;
  }
  await ensureHome();
}

/**
 * Returns the visible text of a component. Falls back to an empty string when
 * the component has disappeared, which lets callers decide the expectation.
 */
export async function textOfId(id: string): Promise<string> {
  let component: Component | null = await findById(id);
  if (component === null) {
    return '';
  }
  return component.getText();
}

export async function isHomeVisible(): Promise<boolean> {
  return existsById(TAB_HOME);
}

/** Looks for the cart header text, not the tab id, so blank pages fail. */
export async function isCartVisible(): Promise<boolean> {
  let cartLabel: string = await getString(TEXT_SHOPPING_CART);
  return existsByText(cartLabel);
}

/**
 * Scrolls a component into view when the list is longer than the viewport.
 * The sample uses Scroll containers, so a swipe up is enough for the first
 * page of recommendations.
 */
export async function swipeUp(): Promise<void> {
  let driver: Driver = await getDriver();
  await driver.swipe(360, 900, 360, 300, 300);
  await delay(POLL_INTERVAL);
}

export async function swipeDown(): Promise<void> {
  let driver: Driver = await getDriver();
  await driver.swipe(360, 300, 360, 900, 300);
  await delay(POLL_INTERVAL);
}

/**
 * Waits for the cart entry of a product. The cart page renders one image per
 * added product with the id cart_goods<productId>.
 */
export async function waitForCartGoods(goodsId: number, timeout: number = DEFAULT_WAIT): Promise<boolean> {
  return waitForId(ID_CART_GOODS_PREFIX + goodsId.toString(), timeout);
}

/**
 * Ends the current main-thread loop task between test cases.
 *
 * Hypium runs cases back to back inside one uv loop task. A setTimeout(0) based
 * yield does not end that task, so hiview's watchdog may kill the process with
 * THREAD_BLOCK_6S. Awaiting a real native round trip hands the loop back and
 * resets the watchdog window.
 */
export async function yieldToEventLoop(): Promise<void> {
  try {
    await bundleManager.getBundleInfoForSelf(0);
    return;
  } catch (error) {
    // Fall back to a non-zero timer when the bundle service rejects the call.
  }
  await new Promise<void>((resolve: Function) => {
    setTimeout(() => {
      resolve();
    }, 5);
  });
}
