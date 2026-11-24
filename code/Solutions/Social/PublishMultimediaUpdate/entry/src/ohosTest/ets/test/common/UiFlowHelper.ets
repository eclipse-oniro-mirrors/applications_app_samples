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

import { Driver, ON } from '@ohos.UiTest';
import { Component } from '@ohos.UiTest';
import display from '@ohos.display';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import { ABILITY_NAME, BUNDLE_NAME, ID_ADD_BUTTON, MODULE_NAME, POLL_INTERVAL, SETTLE_DIALOG, SETTLE_MENU, SETTLE_PAGE, SETTLE_UI, TIMEOUT_LAUNCH, TIMEOUT_MENU } from './TestConstant';
/**
* Navigation helpers shared by the page level suites.
* Every helper reports success as a boolean instead of throwing, so a missing
* node turns into a readable assertion failure in the calling test instead of
* aborting the whole suite.
*/
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
    }
    catch (error) {
      await sleep(POLL_INTERVAL);
    }
  }
  return Driver.create();
}
/**
* Starts the sample entry ability. The callback form keeps a launch failure
* inside the suite instead of surfacing as an unhandled rejection.
*/
export function launchApp(): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
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
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const ability: UIAbility = await delegator.getCurrentTopAbility();
    return ability;
  }
  catch (error) {
    return null;
  }
}
export async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component;
  }
  catch (error) {
    return null;
  }
}
export async function findByText(driver: Driver, text: string): Promise<Component | null> {
  try {
    const component: Component = await driver.findComponent(ON.text(text));
    return component;
  }
  catch (error) {
    return null;
  }
}
export async function findByType(driver: Driver, type: string): Promise<Component | null> {
  try {
    const component: Component = await driver.findComponent(ON.type(type));
    return component;
  }
  catch (error) {
    return null;
  }
}
/**
* Number of nodes currently carrying the given text. Used where the same
* label legitimately repeats, for example a moment body that equals a toolbar
* caption.
*/
export async function countByText(driver: Driver, text: string): Promise<number> {
  try {
    const components: Array<Component> = await driver.findComponents(ON.text(text));
    return components.length;
  }
  catch (error) {
    return 0;
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
export async function tapById(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    await sleep(SETTLE_UI);
    return true;
  }
  catch (error) {
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
  }
  catch (error) {
    return false;
  }
}
/**
* Taps a popup menu entry. A menu row is a clickable Option node that wraps a
* plain text node, therefore the clickable filter is required.
*/
export async function tapMenuOption(driver: Driver, text: string): Promise<boolean> {
  try {
    const components: Array<Component> = await driver.findComponents(ON.text(text).clickable(true));
    if (components.length === 0) {
      return false;
    }
    await components[0].click();
    await sleep(SETTLE_MENU);
    return true;
  }
  catch (error) {
    return false;
  }
}
/**
* True while the page under test is on screen. The Following tab caption is
* rendered by the page itself and is absent from every other ability.
*/
export async function pageAlive(driver: Driver): Promise<boolean> {
  return await findByText(driver, 'Following') !== null;
}
/**
* Brings the sample to the foreground. Starting an already running singleton
* ability only moves it forward, so the page keeps its current state.
*/
export async function ensureAppVisible(driver: Driver): Promise<boolean> {
  if (await waitForText(driver, 'Following', 500)) {
    return true;
  }
  for (let attempt: number = 0; attempt < 2; attempt++) {
    await launchApp();
    await sleep(SETTLE_PAGE);
    if (await waitForText(driver, 'Following', TIMEOUT_LAUNCH)) {
      return true;
    }
  }
  return false;
}
/**
* Opens the add menu through the tab bar entry.
*/
export async function openAddMenu(driver: Driver): Promise<boolean> {
  if (!await tapById(driver, ID_ADD_BUTTON)) {
    return false;
  }
  await sleep(SETTLE_MENU);
  return true;
}
/**
* Opens the add menu and selects one entry by its rendered text. Returns true
* when the dialog gained focus, which is the observable result of both the
* Post, Photo and Video entries.
*/
export async function openComposer(driver: Driver, menuText: string): Promise<boolean> {
  if (!await openAddMenu(driver)) {
    return false;
  }
  if (!await waitForText(driver, menuText, TIMEOUT_MENU)) {
    return false;
  }
  if (!await tapMenuOption(driver, menuText)) {
    return false;
  }
  await sleep(SETTLE_DIALOG);
  return await findById(driver, 'id_text_input') !== null;
}
/**
* Types into the composer input and presses the publish button.
*/
export async function composeAndPublish(driver: Driver, body: string): Promise<boolean> {
  const input: Component | null = await findByType(driver, 'TextInput');
  if (input === null) {
    return false;
  }
  try {
    await input.inputText(body);
  }
  catch (error) {
    return false;
  }
  await sleep(SETTLE_UI);
  if (!await tapByText(driver, '发布')) {
    return false;
  }
  await sleep(SETTLE_DIALOG);
  return true;
}
/**
* Presses the publish button without typing anything.
*/
export async function publishEmpty(driver: Driver): Promise<boolean> {
  return await tapByText(driver, '发布');
}
/**
* Dismisses the composer when it is open. The dialog is closed by the system
* back gesture; a page without an open dialog simply reports false.
*/
export async function dismissComposer(driver: Driver): Promise<boolean> {
  if (await findById(driver, 'id_text_input') === null) {
    return false;
  }
  try {
    await driver.pressBack();
    await sleep(SETTLE_DIALOG);
    return true;
  }
  catch (error) {
    return false;
  }
}
export async function swipeVertically(driver: Driver, upward: boolean, rounds: number = 1): Promise<void> {
  const size = display.getDefaultDisplaySync();
  const x: number = Math.floor(size.width / 2);
  const startY: number = upward ? Math.floor(size.height * 0.75) : Math.floor(size.height * 0.35);
  const endY: number = upward ? Math.floor(size.height * 0.35) : Math.floor(size.height * 0.75);
  for (let round: number = 0; round < rounds; round++) {
    await driver.swipe(x, startY, x, endY, 600);
    await sleep(700);
  }
}
export async function dismissMenu(driver: Driver): Promise<boolean> {
  await driver.pressBack();
  await sleep(SETTLE_MENU);
  return true;
}
