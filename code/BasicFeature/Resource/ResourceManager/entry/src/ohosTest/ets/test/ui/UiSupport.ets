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

import { Driver, ON, On, Component, Point, abilityDelegatorRegistry } from '@kit.TestKit';

/** Bundle of the sample under test. */
export const UI_BUNDLE: string = 'ohos.samples.resourcemanager';
/** Ability that hosts the pages under test. */
export const UI_ABILITY: string = 'EntryAbility';

/** Ids of the three pages. Kept in one place so every suite agrees on the nodes. */
export const ID_INDEX_TITLE: string = 'indexTitle';
export const ID_RESOURCES_BTN: string = 'testResourcesBtn';
export const ID_OVERLAY_BTN: string = 'testOverlayBtn';
export const ID_RESOURCES_TITLE: string = 'basicResourcesTitle';
export const ID_OVERLAY_TITLE: string = 'overlayTitle';
export const ID_OVERLAY_MESSAGE: string = 'overlayMessage';
export const ID_OVERLAY_RESOURCE_TEXT: string = 'overlayResourceText';
export const ID_OVERLAY_IMAGE: string = 'overlayImage';
export const ID_DISABLE_BTN: string = 'disableBtn';
export const ID_ENABLE_BTN: string = 'enableBtn';
export const ID_ADD_BTN: string = 'addResourceBtn';
export const ID_REMOVE_BTN: string = 'removeResourceBtn';
/** Ids of the value nodes rendered by the resources page. */
export const ID_STRING_VALUE: string = 'stringValue';
export const ID_STRING_ARRAY_VALUE: string = 'stringArrayValue';
export const ID_PLURAL_VALUE: string = 'pluralValue';
export const ID_CONFIGURATION_VALUE: string = 'configurationValue';
export const ID_CAPABILITY_VALUE: string = 'capabilityValue';
export const ID_MEDIA_VALUE: string = 'mediaValue';
export const ID_MEDIA_BASE64_VALUE: string = 'mediaBase64Value';
export const ID_FORMAT_STRING_VALUE: string = 'formatStringValue';
export const ID_GET_DENSITY_MEDIA: string = 'getDensityMedia';
export const ID_GET_SYSTEM_MEDIA: string = 'getSystemMedia';
export const RESOURCES_VALUE_IDS: string[] = [
  ID_STRING_VALUE, ID_STRING_ARRAY_VALUE, ID_PLURAL_VALUE, ID_CONFIGURATION_VALUE, ID_CAPABILITY_VALUE,
  ID_MEDIA_VALUE, ID_MEDIA_BASE64_VALUE, ID_FORMAT_STRING_VALUE, ID_GET_DENSITY_MEDIA, ID_GET_SYSTEM_MEDIA
];
/** Ids of the four overlay action buttons. */
export const OVERLAY_BUTTON_IDS: string[] = [ID_DISABLE_BTN, ID_ENABLE_BTN, ID_ADD_BTN, ID_REMOVE_BTN];
/** Budget for a node to be mounted after a page switch or a list scroll. */
const READY_TIMEOUT_MS: number = 5000;

/** True when a node with the given selector is on screen right now. */
export async function exists(driver: Driver, on: On): Promise<boolean> {
  try {
    await driver.assertComponentExist(on);
    return true;
  } catch (error) {
    return false;
  }
}

/** True when the node with this id is on screen right now. */
export async function idExists(driver: Driver, id: string): Promise<boolean> {
  return await exists(driver, ON.id(id));
}

/** True when a node showing exactly this text is on screen right now. */
export async function textExists(driver: Driver, text: string): Promise<boolean> {
  return await exists(driver, ON.text(text));
}

/** Waits until the node appears, false when it never does inside the budget. */
export async function waitId(driver: Driver, id: string, timeoutMs: number): Promise<boolean> {
  const step: number = 500;
  for (let waited: number = 0; waited < timeoutMs; waited += step) {
    const found: boolean = await idExists(driver, id);
    if (found) {
      return true;
    }
    await driver.delayMs(step);
  }
  return false;
}

/**
 * Node bound to this id. A page switch and a swipe both rebuild the tree, so the
 * lookup retries until the node is mounted instead of reading a stale null.
 */
async function componentOf(driver: Driver, id: string, timeoutMs: number): Promise<Component> {
  await waitId(driver, id, timeoutMs);
  return await driver.findComponent(ON.id(id));
}

/** Text of the node with this id, read once the node is mounted. */
export async function textOf(driver: Driver, id: string): Promise<string> {
  const component: Component = await componentOf(driver, id, READY_TIMEOUT_MS);
  return await component.getText();
}

/** Id reported by the node itself, used to prove the selector matched the intended node. */
export async function idOf(driver: Driver, id: string): Promise<string> {
  const component: Component = await componentOf(driver, id, READY_TIMEOUT_MS);
  return await component.getId();
}

/** Type name reported by the node, e.g. 'Button' or 'Text'. */
export async function typeOf(driver: Driver, id: string): Promise<string> {
  const component: Component = await componentOf(driver, id, READY_TIMEOUT_MS);
  return await component.getType();
}

/** Clickable flag of the node with this id. */
export async function clickableOf(driver: Driver, id: string): Promise<boolean> {
  const component: Component = await componentOf(driver, id, READY_TIMEOUT_MS);
  return await component.isClickable();
}

/** Starts the sample ability and gives the first page time to render. */
export async function startApp(driver: Driver): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  await delegator.startAbility({ bundleName: UI_BUNDLE, abilityName: UI_ABILITY });
  await waitId(driver, ID_INDEX_TITLE, 6000);
}

/**
 * Puts the sample on its entry page. Every case starts from here, so the cases do
 * not depend on the order the runner executes them in.
 */
export async function backToIndex(driver: Driver): Promise<boolean> {
  for (let attempt: number = 0; attempt < 4; attempt++) {
    const onIndex: boolean = await idExists(driver, ID_INDEX_TITLE);
    if (onIndex) {
      return true;
    }
    const onResources: boolean = await idExists(driver, ID_RESOURCES_TITLE);
    const onOverlay: boolean = await idExists(driver, ID_OVERLAY_TITLE);
    if (onResources || onOverlay) {
      await driver.pressBack();
      await waitId(driver, ID_INDEX_TITLE, 3000);
    } else {
      await startApp(driver);
    }
  }
  return await idExists(driver, ID_INDEX_TITLE);
}

/** Navigates from the entry page to the resources page. */
export async function openResources(driver: Driver): Promise<boolean> {
  const onIndex: boolean = await backToIndex(driver);
  if (!onIndex) {
    return false;
  }
  const button: Component = await componentOf(driver, ID_RESOURCES_BTN, READY_TIMEOUT_MS);
  await button.click();
  return await waitId(driver, ID_RESOURCES_TITLE, 5000);
}

/** Navigates from the entry page to the overlay page. */
export async function openOverlay(driver: Driver): Promise<boolean> {
  const onIndex: boolean = await backToIndex(driver);
  if (!onIndex) {
    return false;
  }
  const button: Component = await componentOf(driver, ID_OVERLAY_BTN, READY_TIMEOUT_MS);
  await button.click();
  return await waitId(driver, ID_OVERLAY_TITLE, 5000);
}

/** Clicks one of the overlay action buttons and waits for the message to settle. */
export async function clickOverlayAction(driver: Driver, id: string): Promise<void> {
  const button: Component = await componentOf(driver, id, READY_TIMEOUT_MS);
  await button.click();
  await driver.delayMs(1500);
}

/** Swipes up inside the page so the lower half of the scrollable list becomes visible. */
export async function scrollDown(driver: Driver): Promise<void> {
  const size: Point = await driver.getDisplaySize();
  const centerX: number = Math.floor(size.x / 2);
  const fromY: number = Math.floor(size.y * 3 / 4);
  const toY: number = Math.floor(size.y / 4);
  await driver.swipe(centerX, fromY, centerX, toY);
  await driver.delayMs(800);
}

/** Swipes down inside the page so the upper half of the list becomes visible again. */
export async function scrollUp(driver: Driver): Promise<void> {
  const size: Point = await driver.getDisplaySize();
  const centerX: number = Math.floor(size.x / 2);
  const fromY: number = Math.floor(size.y / 4);
  const toY: number = Math.floor(size.y * 3 / 4);
  await driver.swipe(centerX, fromY, centerX, toY);
  await driver.delayMs(800);
}

/** Scrolls up to twice until the node is mounted, returns the final presence. */
export async function revealId(driver: Driver, id: string): Promise<boolean> {
  await scrollDown(driver);
  if (await waitId(driver, id, 2000)) {
    return true;
  }
  await scrollDown(driver);
  return await waitId(driver, id, 2000);
}

/** True when the whole body is decimal digits, so the number can be parsed safely. */
export function isDigits(text: string): boolean {
  if (text.length === 0) {
    return false;
  }
  for (let index: number = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if (code < 48 || code > 57) {
      return false;
    }
  }
  return true;
}
