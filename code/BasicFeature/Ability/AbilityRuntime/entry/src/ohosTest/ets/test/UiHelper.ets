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

import { UIAbility } from '@kit.AbilityKit';
import { Component, Driver, ON } from '@kit.TestKit';
import { ENTRY_ABILITY, getAbilityName, launchAbility, sleep, waitForTopAbility } from './TestHelper';

/** 首页第一个入口的 id，用来判断当前是否停在首页 Index。 */
export const HOME_MARK: string = 'AppManager';

let driver: Driver | undefined = undefined;

export function getDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  return driver;
}

export async function exists(text: string): Promise<boolean> {
  return (await getDriver().findComponent(ON.text(text))) !== null;
}

export async function existsId(id: string): Promise<boolean> {
  return (await getDriver().findComponent(ON.id(id))) !== null;
}

/** 等某个 id 的组件出现；找不到直接抛错，让用例以明确的原因失败。 */
export async function findId(id: string, timeoutMs: number = 3000): Promise<Component> {
  const component: Component | null = await getDriver().waitForComponent(ON.id(id), timeoutMs);
  if (component === null) {
    throw new Error(`component ${id} not found`);
  }
  return component;
}

export async function clickId(id: string, waitMs: number = 800): Promise<void> {
  await (await findId(id)).click();
  await sleep(waitMs);
}

async function ensureEntryOnTop(): Promise<UIAbility | undefined> {
  const top: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 500);
  if (getAbilityName(top) === ENTRY_ABILITY) {
    return top;
  }
  return await launchAbility(ENTRY_ABILITY);
}

/** 回到首页：EntryAbility 在栈顶且首页入口可见；停在子页面时用 pressBack 逐级退回。 */
export async function backToHome(): Promise<UIAbility | undefined> {
  let top: UIAbility | undefined = await ensureEntryOnTop();
  for (let i = 0; i < 4; i++) {
    if (await existsId(HOME_MARK)) {
      break;
    }
    await getDriver().pressBack();
    await sleep(800);
    top = await ensureEntryOnTop();
  }
  await sleep(300);
  return top;
}

/** 从首页点某个入口进入示例页面，返回页面上的 readyId 组件是否已出现。 */
export async function openPage(entryId: string, readyId: string): Promise<boolean> {
  await backToHome();
  await clickId(entryId, 1000);
  return (await getDriver().waitForComponent(ON.id(readyId), 3000)) !== null;
}

/** 在示例页面按返回键，返回首页入口是否重新可见。 */
export async function pressBackToHome(): Promise<boolean> {
  await getDriver().pressBack();
  await sleep(800);
  return (await getDriver().waitForComponent(ON.id(HOME_MARK), 3000)) !== null;
}
