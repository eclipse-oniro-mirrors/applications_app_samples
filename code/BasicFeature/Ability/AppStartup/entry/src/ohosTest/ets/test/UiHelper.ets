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
import { Component, Driver, MatchPattern, ON } from '@kit.TestKit';
import {
  ENTRY_ABILITY, getAbilityName, getTopAbility, launchAbility, rememberEntry, sleep, waitForTopAbility
} from './TestHelper';

/** 首页唯一按钮的文案（base 下 Manual_mode），用来判断当前是否停在首页 Index。 */
export const MANUAL_MODE: string = '手动模式';

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

/** 等某段文字出现；找不到直接抛错，让用例以明确的原因失败。 */
export async function findText(text: string, timeoutMs: number = 3000): Promise<Component> {
  const component: Component | null = await getDriver().waitForComponent(ON.text(text), timeoutMs);
  if (component === null) {
    throw new Error(`component ${text} not found`);
  }
  return component;
}

/** 按条件找全部组件；一个都没匹配上时 findComponents 返回 null，这里统一成空数组。 */
async function findAll(type: string): Promise<Component[]> {
  const found: Component[] | null = await getDriver().findComponents(ON.type(type));
  return found === null ? [] : found;
}

/** 当前页面上所有 Text 组件的文字，按出现顺序排列。 */
export async function allTexts(): Promise<string[]> {
  const texts: Component[] = await findAll('Text');
  const out: string[] = [];
  for (let i = 0; i < texts.length; i++) {
    out.push(await texts[i].getText());
  }
  return out;
}

export async function countType(type: string): Promise<number> {
  return (await findAll(type)).length;
}

/** 取第一个文字包含 part 的组件的完整文字；找不到返回空串。 */
export async function textContaining(part: string): Promise<string> {
  const component: Component | null = await getDriver().findComponent(ON.text(part, MatchPattern.CONTAINS));
  if (component === null) {
    return '';
  }
  return await component.getText();
}

async function ensureEntryOnTop(): Promise<UIAbility | undefined> {
  const top: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 500);
  if (getAbilityName(top) === ENTRY_ABILITY) {
    rememberEntry(top);
    return top;
  }
  const launched: UIAbility | undefined = await launchAbility(ENTRY_ABILITY);
  rememberEntry(launched);
  return launched;
}

/** 回到首页：EntryAbility 在栈顶且“手动模式”按钮可见；停在 ImageKnife 页时用 pressBack 退回。 */
export async function backToHome(): Promise<UIAbility | undefined> {
  let top: UIAbility | undefined = await ensureEntryOnTop();
  for (let i = 0; i < 3; i++) {
    if (await exists(MANUAL_MODE)) {
      break;
    }
    await getDriver().pressBack();
    await sleep(800);
    top = await ensureEntryOnTop();
  }
  await sleep(300);
  return top;
}

/** 在首页点击“手动模式”按钮。 */
export async function clickManualMode(waitMs: number = 1500): Promise<void> {
  await (await findText(MANUAL_MODE)).click();
  await sleep(waitMs);
}

/**
 * 结束当前的 EntryAbility 再重新拉起：同一进程内启动任务不会重跑，但首页 aboutToAppear
 * 会重新读文件、键值库与关系型库。返回新实例。
 */
export async function relaunchEntry(): Promise<UIAbility | undefined> {
  const top: UIAbility | undefined = await ensureEntryOnTop();
  if (top !== undefined) {
    await top.context.terminateSelf();
  }
  await sleep(1500);
  const again: UIAbility | undefined = await launchAbility(ENTRY_ABILITY);
  rememberEntry(again);
  await sleep(1500);
  return again;
}

/** 当前栈顶 Ability 的名字；取不到时为空串。 */
export async function topName(): Promise<string> {
  return getAbilityName(await getTopAbility());
}
