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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Driver, Component, MatchPattern, ON, Rect } from '@ohos.UiTest';
import { expect } from '@ohos/hypium';

export const INDEX_ID: string = 'RenderGroup';
export const BACK_ID: string = 'returnBtn';
export const SWITCH_ID: string = 'renderGroupSwitch';
export const HOME_TITLE: string = 'RenderGroup合理使用场景示例';
export const OFF_LABEL: string = 'renderGroup已关闭';
export const ON_LABEL: string = 'renderGroup已开启';
export const ENTRY_ABILITY: string = 'EntryAbility';
const ENTRY_MODULE: string = 'entry';
const UI_TIMEOUT_MS: number = 2500;
const LAUNCH_TIMEOUT_MS: number = 5000;
const POLL_MS: number = 80;
const ITEM_LIMIT: number = 60;

export class Scene {
  public name: string;
  public buttonId: string;
  public title: string;

  constructor(name: string, buttonId: string, title: string) {
    this.name = name;
    this.buttonId = buttonId;
    this.title = title;
  }
}

export const PROFIT: Scene = new Scene('Profit', 'ProfitScenePage', '正例场景示例');
export const NON_PROFIT: Scene = new Scene('NonProfit', 'NonProfitScenePage', '反例场景示例');
export const SCENES: Scene[] = [PROFIT, NON_PROFIT];

let driver: Driver | undefined;
let uiQueue: Promise<void> = Promise.resolve();

export function getDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  return driver;
}

export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const pending: Promise<T> = uiQueue.then(action);
  uiQueue = pending.then(() => {}, () => {});
  return pending;
}

export async function waitId(id: string, timeout: number = UI_TIMEOUT_MS): Promise<Component> {
  const result = await getDriver().waitForComponent(ON.id(id), timeout);
  if (!result) {
    throw new Error(`Timed out waiting for component ID ${id}`);
  }
  return result;
}

export async function clickId(id: string): Promise<void> {
  const component = await waitId(id);
  await component.click();
}

export async function countId(id: string): Promise<number> {
  const components = await getDriver().findComponents(ON.id(id));
  return components?.length ?? 0;
}

export async function countText(text: string): Promise<number> {
  const components = await getDriver().findComponents(ON.type('Text').text(text));
  return components?.length ?? 0;
}

export async function waitText(text: string): Promise<Component> {
  const result = await getDriver().waitForComponent(ON.type('Text').text(text), UI_TIMEOUT_MS);
  if (!result) {
    throw new Error(`Expected Text node was not found: ${text}`);
  }
  return result;
}

export async function assertIndex(): Promise<void> {
  await waitId(INDEX_ID);
  expect(await countId(INDEX_ID)).assertEqual(1);
  expect(await countId(SWITCH_ID)).assertEqual(0);
  expect(await countId(PROFIT.buttonId)).assertEqual(0);
  expect(await countId(NON_PROFIT.buttonId)).assertEqual(0);
  expect(await countId(BACK_ID)).assertEqual(0);
  expect(await countText(HOME_TITLE)).assertEqual(0);
}

export async function assertHome(): Promise<void> {
  await waitId(PROFIT.buttonId);
  await waitId(NON_PROFIT.buttonId);
  await waitText(HOME_TITLE);
  expect(await countId(PROFIT.buttonId)).assertEqual(1);
  expect(await countId(NON_PROFIT.buttonId)).assertEqual(1);
  expect(await countText(HOME_TITLE)).assertEqual(1);
  expect(await countId(BACK_ID)).assertEqual(1);
  expect(await countId(SWITCH_ID)).assertEqual(0);
  expect(await countId(INDEX_ID)).assertEqual(0);
}

export async function startEntryAbility(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    moduleName: ENTRY_MODULE,
    abilityName: ENTRY_ABILITY
  };
  await delegator.startAbility(want);
}

export async function launchEntry(): Promise<void> {
  await startEntryAbility();
  const deadline = Date.now() + LAUNCH_TIMEOUT_MS;
  while (Date.now() < deadline) {
    if (await countId(INDEX_ID) === 1) {
      await assertIndex();
      return;
    }
    if (await countId(SWITCH_ID) === 1) {
      await clickId(BACK_ID);
      await assertHome();
    } else if (await countId(PROFIT.buttonId) === 1) {
      await clickId(BACK_ID);
      await assertIndex();
      return;
    } else {
      await getDriver().delayMs(POLL_MS);
    }
  }
  throw new Error('EntryAbility did not reach the RenderGroup index');
}

export async function openHome(): Promise<void> {
  await clickId(INDEX_ID);
  await assertHome();
}

export async function openScene(scene: Scene): Promise<void> {
  await clickId(scene.buttonId);
  await assertScene(scene);
}

export async function assertScene(scene: Scene): Promise<void> {
  await waitId(SWITCH_ID);
  await waitText(scene.title);
  expect(await countId(SWITCH_ID)).assertEqual(1);
  expect(await countId(BACK_ID)).assertEqual(1);
  expect(await countId(PROFIT.buttonId)).assertEqual(0);
  expect(await countId(NON_PROFIT.buttonId)).assertEqual(0);
  expect(await countId(INDEX_ID)).assertEqual(0);
  expect(await countText(scene.title)).assertEqual(1);
  const other = scene === PROFIT ? NON_PROFIT : PROFIT;
  expect(await countText(other.title)).assertEqual(0);
}

export async function assertSwitch(enabled: boolean): Promise<void> {
  const expected = enabled ? ON_LABEL : OFF_LABEL;
  const button = await getDriver().waitForComponent(ON.id(SWITCH_ID).text(expected), UI_TIMEOUT_MS);
  if (!button) {
    const current = await waitId(SWITCH_ID);
    throw new Error(`RenderGroup switch expected ${expected}, observed ${await current.getText()}`);
  }
  expect(await button.getText()).assertEqual(expected);
}

export async function toggleTo(enabled: boolean): Promise<void> {
  await clickId(SWITCH_ID);
  await assertSwitch(enabled);
}

export async function backToHome(useSystemBack: boolean = false): Promise<void> {
  if (useSystemBack) {
    await getDriver().pressBack();
  } else {
    await clickId(BACK_ID);
  }
  await assertHome();
}

export async function backToIndex(useSystemBack: boolean = false): Promise<void> {
  if (useSystemBack) {
    await getDriver().pressBack();
  } else {
    await clickId(BACK_ID);
  }
  await assertIndex();
}

export async function assertVisibleItem(number: number): Promise<void> {
  const label = `item${number}`;
  const node = await waitText(label);
  expect(await node.getText()).assertEqual(label);
  expect(await countText(label)).assertEqual(1);
  await visibleBounds(node);
}

export async function readGridLabelIndices(): Promise<number[]> {
  const nodes = (await getDriver().findComponents(ON.type('Text').text('item', MatchPattern.STARTS_WITH))) ?? [];
  const indices: number[] = [];
  const seen: Set<number> = new Set<number>();
  for (const node of nodes) {
    const label = await node.getText();
    if (!/^item[1-9][0-9]*$/.test(label)) {
      throw new Error(`Unexpected grid label: ${label}`);
    }
    const index = Number(label.slice(4));
    if (index > ITEM_LIMIT) {
      throw new Error(`Grid label exceeds ${ITEM_LIMIT}: ${label}`);
    }
    if (seen.has(index)) {
      throw new Error(`Duplicate grid label: ${label}`);
    }
    seen.add(index);
    indices.push(index);
  }
  // UiTest can omit clipped nodes and can expose them in a different order after a rebuild.
  return indices.sort((left, right) => left - right);
}

export async function visibleBounds(node: Component): Promise<Rect> {
  const bounds = await node.getBounds();
  const display = await getDriver().getDisplaySize();
  expect(bounds.right > bounds.left).assertTrue();
  expect(bounds.bottom > bounds.top).assertTrue();
  expect(Math.min(bounds.right, display.x) > Math.max(bounds.left, 0)).assertTrue();
  expect(Math.min(bounds.bottom, display.y) > Math.max(bounds.top, 0)).assertTrue();
  return bounds;
}

export async function assertBounds(id: string): Promise<void> {
  const node = await waitId(id);
  await visibleBounds(node);
}

export async function clickCenter(id: string): Promise<void> {
  const node = await waitId(id);
  await clickComponentCenter(node);
}

export async function clickComponentCenter(node: Component): Promise<void> {
  const bounds = await visibleBounds(node);
  const display = await getDriver().getDisplaySize();
  const x = Math.floor((bounds.left + bounds.right) / 2);
  const y = Math.floor((bounds.top + bounds.bottom) / 2);
  expect(x >= 0 && x < display.x).assertTrue();
  expect(y >= 0 && y < display.y).assertTrue();
  await getDriver().click(x, y);
}

async function waitAbilityState(entry: UIAbility, expected: number): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const deadline = Date.now() + LAUNCH_TIMEOUT_MS;
  while (Date.now() < deadline) {
    if (delegator.getAbilityState(entry) === expected) {
      return;
    }
    await getDriver().delayMs(POLL_MS);
  }
  expect(delegator.getAbilityState(entry)).assertEqual(expected);
}

export async function assertEntryForeground(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const entry = await delegator.getCurrentTopAbility();
  expect(entry.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
  await waitAbilityState(entry, abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
}

export async function backgroundAndRestoreEntry(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const entry = await delegator.getCurrentTopAbility();
  expect(entry.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
  await waitAbilityState(entry, abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
  try {
    await delegator.doAbilityBackground(entry);
    await waitAbilityState(entry, abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
  } finally {
    await delegator.doAbilityForeground(entry);
    await waitAbilityState(entry, abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
  }
  const restored = await delegator.getCurrentTopAbility();
  expect(restored.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
}

export async function withScene(scene: Scene, workflow: () => Promise<void>): Promise<void> {
  await runSerializedUiOperation(async () => {
    await launchEntry();
    await openHome();
    await openScene(scene);
    await workflow();
  });
}
