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
import { expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { stationary } from '@kit.MultimodalAwarenessKit';

export const SHOW_ID: string = 'show';
export const BUTTON_IDS: string[] = ['button1', 'button2', 'button3'];
export const BUTTON_LABELS: string[] = ['订阅', '取消订阅', '获取'];
export const EXPECTED_TEXT: string[] = [
  'stationary subscribe',
  'stationary unsubscribe',
  'stationary getStatus'
];
export const SETTLE_MS: number = 600;

let sharedDriver: Driver | null = null;
let cachedSupport: boolean | null = null;

function noopCallback(_response: stationary.ActivityResponse): void {
}

export function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

export function entryWant(): Want {
  return {
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    abilityName: 'EntryAbility'
  };
}

export async function startApp(): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    await delegator.startAbility(entryWant());
  } catch (err) {
  }
  const driver: Driver = getDriver();
  await driver.delayMs(1000);
  return await driver.waitForComponent(ON.id('button1'), 8000) !== null;
}

/**
 * 设备/系统是否支持 stationary。
 *
 * 以一次真实的 on 调用为准：能成功订阅说明能力可用；抛出异常视为不支持。
 * 订阅成功后立即 off 释放，避免影响页面自身的订阅状态。结果只探测一次。
 */
export function stationarySupported(): boolean {
  if (cachedSupport === null) {
    let opened: boolean = false;
    try {
      stationary.on('still', stationary.ActivityEvent.ENTER, 1000000000, noopCallback);
      opened = true;
    } catch (err) {
      opened = false;
    }
    if (opened) {
      try {
        stationary.off('still', stationary.ActivityEvent.ENTER, noopCallback);
      } catch (err) {
      }
    }
    cachedSupport = opened;
  }
  return cachedSupport;
}

/** 支持时返回动作文案；不支持时按钮不改文案，应保持操作前的文本。 */
export function expectedTextFor(index: number, fallback: string): string {
  return stationarySupported() ? EXPECTED_TEXT[index] : fallback;
}

export async function clickButton(driver: Driver, id: string): Promise<boolean> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), 4000);
  if (target === null) {
    return false;
  }
  await target.click();
  await driver.delayMs(SETTLE_MS);
  return true;
}

export async function readShowText(driver: Driver): Promise<string> {
  const target: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 3000);
  return target === null ? '' : await target.getText();
}

export async function labelOf(driver: Driver, id: string): Promise<string> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), 3000);
  return target === null ? '' : await target.getText();
}

/**
 * 点击按钮并按环境自适应断言：
 * - 支持 stationary：文案必须等于该按钮对应的动作文本；
 * - 不支持：动作异常被页面捕获且不改文案，点击后文案必须保持点击前的内容（且非空）。
 */
export async function clickAndExpect(driver: Driver, index: number): Promise<boolean> {
  const before: string = await readShowText(driver);
  expect(before.length > 0).assertTrue();
  if (!(await clickButton(driver, BUTTON_IDS[index]))) {
    return false;
  }
  const after: string = await readShowText(driver);
  expect(after).assertEqual(expectedTextFor(index, before));
  return true;
}

/** 依次点击多个按钮，最终文案应为最后一次动作对应的文本（或在不支持时保持不变）。 */
export async function clickAndExpectLast(driver: Driver, ids: string[]): Promise<boolean> {
  const before: string = await readShowText(driver);
  expect(before.length > 0).assertTrue();
  for (const id of ids) {
    if (!(await clickButton(driver, id))) {
      return false;
    }
  }
  const last: number = BUTTON_IDS.indexOf(ids[ids.length - 1]);
  const after: string = await readShowText(driver);
  expect(after).assertEqual(last < 0 ? before : expectedTextFor(last, before));
  return true;
}

/** 对同一按钮重复点击，每次点击后文案都稳定不变。 */
export async function repeatClick(driver: Driver, id: string, rounds: number): Promise<boolean> {
  const before: string = await readShowText(driver);
  expect(before.length > 0).assertTrue();
  const index: number = BUTTON_IDS.indexOf(id);
  const expected: string = index < 0 ? before : expectedTextFor(index, before);
  for (let round = 0; round < rounds; round++) {
    if (!(await clickButton(driver, id))) {
      return false;
    }
    expect(await readShowText(driver)).assertEqual(expected);
  }
  return true;
}

/** 两个按钮交替点击若干轮，每轮结束文案都应为第二个动作对应的文本。 */
export async function repeatAlternate(driver: Driver, firstId: string, secondId: string,
  rounds: number): Promise<boolean> {
  const before: string = await readShowText(driver);
  expect(before.length > 0).assertTrue();
  const index: number = BUTTON_IDS.indexOf(secondId);
  const expected: string = index < 0 ? before : expectedTextFor(index, before);
  for (let round = 0; round < rounds; round++) {
    if (!(await clickButton(driver, firstId))) {
      return false;
    }
    if (!(await clickButton(driver, secondId))) {
      return false;
    }
    expect(await readShowText(driver)).assertEqual(expected);
  }
  return true;
}
