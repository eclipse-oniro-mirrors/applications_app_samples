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

import { Driver, ON, MatchPattern, Component, Rect, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

export const driver: Driver = Driver.create();
export const delegator = abilityDelegatorRegistry.getAbilityDelegator();
export const INDEX_LABEL: string = 'Tcp客户端';
const BUNDLE_NAME: string = 'com.samples.Socket';
const SETTLE_MS: number = 400;
const QUERY_MS: number = 2500;
const POLL_MS: number = 200;

export async function waitForText(text: string, timeoutMs: number = QUERY_MS): Promise<Component | null> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    let component: Component | null | undefined = null;
    try {
      component = await driver.findComponent(ON.text(text));
    } catch (err) {
      component = null;
    }
    if (component !== null && component !== undefined) {
      return component;
    }
    await driver.delayMs(POLL_MS);
  }
  return null;
}

export async function tap(text: string): Promise<boolean> {
  const component: Component | null = await waitForText(text);
  if (component === null) {
    return false;
  }
  await component.click();
  await driver.delayMs(SETTLE_MS);
  return true;
}

export async function ensureIndex(): Promise<boolean> {
  if (await waitForText(INDEX_LABEL, 800) !== null) {
    return true;
  }
  for (let i: number = 0; i < 3; i++) {
    try {
      await driver.pressBack();
    } catch (err) {
    }
    await driver.delayMs(SETTLE_MS);
    if (await waitForText(INDEX_LABEL, 800) !== null) {
      return true;
    }
  }
  const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
  try {
    await delegator.startAbility(want);
  } catch (err) {
  }
  await driver.delayMs(1500);
  return await waitForText(INDEX_LABEL, 3000) !== null;
}

export async function openPage(indexLabel: string, marker: string): Promise<boolean> {
  if (!(await ensureIndex())) {
    return false;
  }
  if (!(await tap(indexLabel))) {
    return false;
  }
  return await waitForText(marker, 3000) !== null;
}

export async function backToIndex(): Promise<boolean> {
  if (await waitForText(INDEX_LABEL, 300) !== null) {
    return true;
  }
  for (let i: number = 0; i < 3; i++) {
    try {
      await driver.pressBack();
    } catch (err) {
    }
    await driver.delayMs(SETTLE_MS);
    if (await waitForText(INDEX_LABEL, 1500) !== null) {
      return true;
    }
  }
  return false;
}

export async function waitForTextContains(text: string, timeoutMs: number = QUERY_MS): Promise<Component | null> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    let component: Component | null | undefined = null;
    try {
      component = await driver.findComponent(ON.text(text, MatchPattern.CONTAINS));
    } catch (err) {
      component = null;
    }
    if (component !== null && component !== undefined) {
      return component;
    }
    await driver.delayMs(POLL_MS);
  }
  return null;
}

export async function textTop(text: string): Promise<number> {
  const component: Component | null = await waitForText(text, 2500);
  if (component === null) {
    return -1;
  }
  const rect: Rect = await component.getBounds();
  return rect.top;
}

export async function isControlEnabled(text: string): Promise<boolean> {
  const component: Component | null = await waitForText(text, 2500);
  if (component === null) {
    return false;
  }
  return await component.isEnabled();
}

export async function inputIntoField(index: number, value: string): Promise<string> {
  let fields: Component[] = [];
  try {
    fields = await driver.findComponents(ON.type('TextInput'));
  } catch (err) {
    fields = [];
  }
  if (fields.length <= index) {
    return '';
  }
  await fields[index].clearText();
  await fields[index].inputText(value);
  await driver.delayMs(SETTLE_MS);
  return await fields[index].getText();
}
