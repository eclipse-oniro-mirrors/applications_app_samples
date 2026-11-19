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
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import inputMethod from '@ohos.inputMethod';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { expect } from '@ohos/hypium';
import { PRODUCT_DATA } from '../../../../main/ets/viewmodel/GoodsViewModel';

let driverInstance: Driver | null = null;
let uiOperationQueue: Promise<void> = Promise.resolve();
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const TIMEOUT_EMBED_RENDER: number = 10000;
export const TIMEOUT_FOCUS_CHANGE: number = 3000;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Preserve the reference Promise queue; propagate failure to the calling test.
// Queue recovery lets a failed operation release later operations without masking it.
export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const result: Promise<T> = uiOperationQueue.then(action);
  uiOperationQueue = result.then(
    () => {},
    (error: Error) => {
      hilog.error(0x0000, 'ArkWebTest', 'UI operation failed: %{public}s', error.message);
    },
  );
  return result;
}

export function getDriver(): Driver {
  if (driverInstance === null) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

export async function resetDriver(): Promise<void> {
  await uiOperationQueue;
  driverInstance = null;
}

export function getResources(): resourceManager.ResourceManager {
  return registry.getAbilityDelegator().getAppContext().createModuleContext('entry_test').resourceManager;
}

export function resourceText(resource: Resource): string {
  return getResources().getStringSync(resource.id);
}

export function getProductImage(index: number): Resource {
  return PRODUCT_DATA[index].imageRes as Resource;
}

export function getProductTitle(index: number): Resource {
  return PRODUCT_DATA[index].title as Resource;
}

export function getProductPrice(index: number): Resource {
  return PRODUCT_DATA[index].price as Resource;
}

export async function launchApp(): Promise<void> {
  let message: string = '';
  for (let attempt: number = 0; attempt < 5; attempt++) {
    await new Promise<void>((resolve) => setTimeout(resolve, 500));
    const result = await registry
      .getAbilityDelegator()
      .executeShellCommand('aa start -b com.example.nativeembed -m entry -a EntryAbility');
    message = result.stdResult;
    if (result.exitCode === 0 && message.includes('start ability successfully')) {
      await new Promise<void>((resolve) => setTimeout(resolve, 500));
      return;
    }
    if (!message.includes('10106101')) {
      break;
    }
  }
  throw new Error('EntryAbility launch failed: ' + message);
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async () => {
    const components: Component[] = (await driver.findComponents(ON.type(type))) ?? [];
    return components;
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function checkTextContent(driver: Driver, expected: string): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    const component = await driver.findComponent(ON.text(expected));
    return component !== null && component !== undefined;
  });
}

// Poll actual native title and card text. Never substitute a generic component count.
async function hideKeyboardIfAttached(): Promise<void> {
  try {
    await inputMethod.getController().hideTextInput();
  } catch (error) {
    const failure = error as BusinessError;
    if (!failure.message.includes('client detached')) {
      throw new Error('Input method error ' + failure.code.toString() + ': ' + failure.message);
    }
    hilog.info(0x0000, 'ArkWebTest', 'No attached input method client; keyboard is already inactive');
  }
}

export async function waitForMallStable(driver: Driver, timeoutMs: number = TIMEOUT_EMBED_RENDER): Promise<boolean> {
  await serializedDelay(driver, 300);
  for (let attempt: number = 0; attempt < 2; attempt++) {
    const deadline: number = Date.now() + timeoutMs;
    while (Date.now() < deadline) {
      const titleVisible: boolean = await checkTextContent(driver, resourceText($r('app.string.embed_mall')));
      const firstVisible: boolean = await checkTextContent(driver, resourceText(getProductTitle(0)));
      if (titleVisible && firstVisible) {
        return true;
      }
      await serializedDelay(driver, 100);
    }
    await launchApp();
    await serializedDelay(driver, 500);
  }
  return false;
}

export async function assertCatalogVisible(driver: Driver): Promise<void> {
  await hideKeyboardIfAttached();
  await runSerializedUiOperation(async () => {
    const search = await driver.findComponent(ON.type('Search'));
    if (search) {
      const bounds = await search.getBounds();
      await driver.click(bounds.left + 10, Math.max(1, bounds.top - 30));
      await driver.delayMs(300);
    }
  });
  for (let index: number = 0; index < PRODUCT_DATA.length; index++) {
    const title: string = resourceText(getProductTitle(index));
    const price: string = resourceText(getProductPrice(index));
    const titleVisible: boolean = await checkTextContent(driver, title);
    const priceVisible: boolean = await checkTextContent(driver, price);
    expect(titleVisible).assertTrue();
    expect(priceVisible).assertTrue();
  }
}

export async function inputSearch(driver: Driver, value: string): Promise<void> {
  await runSerializedUiOperation(async () => {
    const search = await driver.findComponent(ON.type('Search'));
    if (!search) {
      throw new Error('Native Search component is unavailable');
    }
    await search.click();
    await driver.delayMs(200);
    const editor = await driver.findComponent(ON.id('__SearchField__'));
    const target: Component = editor ?? search;
    if (value.length === 0) {
      await target.clearText();
    } else {
      await target.clearText();
      await driver.delayMs(150);
      await search.click();
      await driver.delayMs(300);
      await target.inputText(value, { paste: true, addition: false });
    }
  });
}

export async function clearSearch(driver: Driver): Promise<void> {
  await inputSearch(driver, '');
}

export async function getSearchText(driver: Driver): Promise<string> {
  return runSerializedUiOperation(async () => {
    const search = await driver.findComponent(ON.type('Search'));
    if (!search) {
      throw new Error('Native Search component is unavailable');
    }
    const editor = await driver.findComponent(ON.id('__SearchField__'));
    const target: Component = editor ?? search;
    return target.getText();
  });
}

export async function waitForSearchText(driver: Driver, expected: string): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    const actual: string = await getSearchText(driver);
    hilog.info(0x0000, 'ArkWebTest', 'Search actual=%{public}s expected=%{public}s', actual, expected);
    if (actual === expected) {
      return true;
    }
    const visibleValue: boolean = await checkTextContent(driver, expected);
    if (expected.length > 0 && visibleValue) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION,
): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function checkFocusState(driver: Driver): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    const focused = await driver.findComponent(ON.focused(true));
    return focused !== null && focused !== undefined;
  });
}

export async function backgroundAndRestore(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_HOME);
  await serializedDelay(driver, 500);
  await launchApp();
  await serializedDelay(driver, 500);
}

export async function focusNativeSearch(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    const search = await driver.findComponent(ON.type('Search'));
    if (!search) {
      throw new Error('Native Search component is unavailable');
    }
    await search.click();
  });
}

// Validate actual rendered grid bounds, rather than deriving positions from indices.
export async function assertTwoColumnGrid(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    const cards: Component[] = [];
    for (let index: number = 0; index < 6; index++) {
      const card = await driver.findComponent(ON.id('product-card-' + index.toString()));
      if (card !== null && card !== undefined) {
        cards.push(card);
      }
    }
    const count: number = cards.length;
    expect(count).assertEqual(6);
    if (count !== 6) {
      throw new Error('Expected six native product cards');
    }
    const first = await cards[0].getBounds();
    const second = await cards[1].getBounds();
    const third = await cards[2].getBounds();
    const firstWidth: number = first.right - first.left;
    const secondWidth: number = second.right - second.left;
    const firstHeight: number = first.bottom - first.top;
    const topDifference: number = Math.abs(first.top - second.top);
    const nextRowDifference: number = third.top - first.top;
    const nextColumnDifference: number = second.left - first.left;
    expect(firstWidth).assertLarger(0);
    expect(secondWidth).assertLarger(0);
    expect(firstHeight).assertLarger(0);
    expect(topDifference).assertLessOrEqual(2);
    expect(nextRowDifference).assertLarger(0);
    expect(nextColumnDifference).assertLarger(0);
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async () => {
    const searches: Component[] = (await driver.findComponents(ON.type('Search'))) ?? [];
    for (let index: number = 0; index < searches.length; index++) {
      if (await searches[index].isFocused()) {
        return index;
      }
    }
    return -1;
  });
}

export async function readRawPage(): Promise<string> {
  const bytes: Uint8Array = await getResources().getRawFileContent('embed_view.html');
  // The shipped HTML is ASCII. Decode without relying on a browser-only TextDecoder.
  let text: string = '';
  for (let index: number = 0; index < bytes.length; index++) {
    text += String.fromCharCode(bytes[index]);
  }
  return text;
}

// Resolve product 0 image through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product0ImageResource(): Resource {
  const resource: Resource = getProductImage(0);
  return resource;
}

export async function assertProduct0ImageAvailable(): Promise<void> {
  const resource: Resource = product0ImageResource();
  const content: Uint8Array = await getResources().getMediaContent(resource.id);
  const size: number = content.length;
  expect(size).assertLarger(8);
}

// Resolve product 0 title through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product0TitleResource(): Resource {
  const resource: Resource = getProductTitle(0);
  return resource;
}

export async function assertProduct0TitleAvailable(): Promise<void> {
  const resource: Resource = product0TitleResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 0 price through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product0PriceResource(): Resource {
  const resource: Resource = getProductPrice(0);
  return resource;
}

export async function assertProduct0PriceAvailable(): Promise<void> {
  const resource: Resource = product0PriceResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 1 image through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product1ImageResource(): Resource {
  const resource: Resource = getProductImage(1);
  return resource;
}

export async function assertProduct1ImageAvailable(): Promise<void> {
  const resource: Resource = product1ImageResource();
  const content: Uint8Array = await getResources().getMediaContent(resource.id);
  const size: number = content.length;
  expect(size).assertLarger(8);
}

// Resolve product 1 title through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product1TitleResource(): Resource {
  const resource: Resource = getProductTitle(1);
  return resource;
}

export async function assertProduct1TitleAvailable(): Promise<void> {
  const resource: Resource = product1TitleResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 1 price through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product1PriceResource(): Resource {
  const resource: Resource = getProductPrice(1);
  return resource;
}

export async function assertProduct1PriceAvailable(): Promise<void> {
  const resource: Resource = product1PriceResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 2 image through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product2ImageResource(): Resource {
  const resource: Resource = getProductImage(2);
  return resource;
}

export async function assertProduct2ImageAvailable(): Promise<void> {
  const resource: Resource = product2ImageResource();
  const content: Uint8Array = await getResources().getMediaContent(resource.id);
  const size: number = content.length;
  expect(size).assertLarger(8);
}

// Resolve product 2 title through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product2TitleResource(): Resource {
  const resource: Resource = getProductTitle(2);
  return resource;
}

export async function assertProduct2TitleAvailable(): Promise<void> {
  const resource: Resource = product2TitleResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 2 price through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product2PriceResource(): Resource {
  const resource: Resource = getProductPrice(2);
  return resource;
}

export async function assertProduct2PriceAvailable(): Promise<void> {
  const resource: Resource = product2PriceResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 3 image through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product3ImageResource(): Resource {
  const resource: Resource = getProductImage(3);
  return resource;
}

export async function assertProduct3ImageAvailable(): Promise<void> {
  const resource: Resource = product3ImageResource();
  const content: Uint8Array = await getResources().getMediaContent(resource.id);
  const size: number = content.length;
  expect(size).assertLarger(8);
}

// Resolve product 3 title through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product3TitleResource(): Resource {
  const resource: Resource = getProductTitle(3);
  return resource;
}

export async function assertProduct3TitleAvailable(): Promise<void> {
  const resource: Resource = product3TitleResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 3 price through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product3PriceResource(): Resource {
  const resource: Resource = getProductPrice(3);
  return resource;
}

export async function assertProduct3PriceAvailable(): Promise<void> {
  const resource: Resource = product3PriceResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 4 image through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product4ImageResource(): Resource {
  const resource: Resource = getProductImage(4);
  return resource;
}

export async function assertProduct4ImageAvailable(): Promise<void> {
  const resource: Resource = product4ImageResource();
  const content: Uint8Array = await getResources().getMediaContent(resource.id);
  const size: number = content.length;
  expect(size).assertLarger(8);
}

// Resolve product 4 title through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product4TitleResource(): Resource {
  const resource: Resource = getProductTitle(4);
  return resource;
}

export async function assertProduct4TitleAvailable(): Promise<void> {
  const resource: Resource = product4TitleResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 4 price through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product4PriceResource(): Resource {
  const resource: Resource = getProductPrice(4);
  return resource;
}

export async function assertProduct4PriceAvailable(): Promise<void> {
  const resource: Resource = product4PriceResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 5 image through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product5ImageResource(): Resource {
  const resource: Resource = getProductImage(5);
  return resource;
}

export async function assertProduct5ImageAvailable(): Promise<void> {
  const resource: Resource = product5ImageResource();
  const content: Uint8Array = await getResources().getMediaContent(resource.id);
  const size: number = content.length;
  expect(size).assertLarger(8);
}

// Resolve product 5 title through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product5TitleResource(): Resource {
  const resource: Resource = getProductTitle(5);
  return resource;
}

export async function assertProduct5TitleAvailable(): Promise<void> {
  const resource: Resource = product5TitleResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}

// Resolve product 5 price through the production catalog.
// Keep lookup, resource identity and content resolution in separate steps.
export function product5PriceResource(): Resource {
  const resource: Resource = getProductPrice(5);
  return resource;
}

export async function assertProduct5PriceAvailable(): Promise<void> {
  const resource: Resource = product5PriceResource();
  const content: string = resourceText(resource);
  const size: number = content.length;
  expect(size).assertLarger(0);
}
