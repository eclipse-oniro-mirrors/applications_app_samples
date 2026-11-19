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

import { Driver, ON, Component, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

export const driver: Driver = Driver.create();
export const delegator = abilityDelegatorRegistry.getAbilityDelegator();
export const BUNDLE_NAME: string = 'com.samples.photosamesource';
const ABILITY_NAME: string = 'EntryAbility';
const SETTLE_MS: number = 500;
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

export async function waitForId(id: string, timeoutMs: number = QUERY_MS): Promise<Component | null> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    let component: Component | null | undefined = null;
    try {
      component = await driver.findComponent(ON.id(id));
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

export async function tapText(text: string): Promise<boolean> {
  const component: Component | null = await waitForText(text);
  if (component === null) {
    return false;
  }
  await component.click();
  await driver.delayMs(SETTLE_MS);
  return true;
}

export async function dismissPermissions(): Promise<void> {
  for (let i: number = 0; i < 4; i++) {
    const allow: Component | null = await waitForText('允许', 1000);
    if (allow === null) {
      return;
    }
    await allow.click();
    await driver.delayMs(SETTLE_MS);
  }
}

export async function startApp(): Promise<boolean> {
  const want: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };
  try {
    await delegator.startAbility(want);
  } catch (err) {
  }
  await driver.delayMs(1200);
  await dismissPermissions();
  return await waitForText('拍照', 5000) !== null;
}

export async function ensureApp(): Promise<boolean> {
  if (await waitForText('拍照', 800) !== null) {
    return true;
  }
  for (let i: number = 0; i < 3; i++) {
    try {
      await driver.pressBack();
    } catch (err) {
    }
    await driver.delayMs(SETTLE_MS);
    if (await waitForText('拍照', 800) !== null) {
      return true;
    }
  }
  return await startApp();
}

export async function openFlashMenu(): Promise<boolean> {
  let glyphs: Component[] = [];
  try {
    glyphs = await driver.findComponents(ON.type('SymbolGlyph'));
  } catch (err) {
    glyphs = [];
  }
  if (glyphs.length === 0) {
    return false;
  }
  await glyphs[0].click();
  await driver.delayMs(SETTLE_MS);
  return await waitForText('off', 2000) !== null;
}

export async function closeFlashMenu(): Promise<void> {
  try {
    await driver.pressBack();
  } catch (err) {
  }
  await driver.delayMs(SETTLE_MS);
}
