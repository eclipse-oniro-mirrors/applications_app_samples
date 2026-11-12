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
import { UIAbility, Want } from '@kit.AbilityKit';
import { stationary } from '@kit.MultimodalAwarenessKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export const SHOW_ID: string = 'show';
export const BUTTON_IDS: string[] = ['button1', 'button2', 'button3'];
export const BUTTON_LABELS: string[] = ['订阅', '取消订阅', '获取'];
export const EXPECTED_TEXT: string[] = [
  'stationary subscribe',
  'stationary unsubscribe',
  'stationary getStatus'
];
const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';
export const SETTLE_MS: number = 600;
const ACTION_SETTLE_MS: number = 100;
const ACTION_SETTLE_ATTEMPTS: number = 20;
const SHOW_READ_ATTEMPTS: number = 30;
const SHOW_READ_INTERVAL_MS: number = 1000;

let sharedDriver: Driver | null = null;
let cachedSupport: boolean | null = null;

function noopCallback(_response: Object): void {
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

const LOCK_RETRY: number = 3;
const KEYCODE_WAKEUP: number = 224;

/** 屏幕熄灭后 UiTest 只能看到锁屏窗口，点击按钮不会生效；此时先唤醒屏幕。 */
async function wakeUpScreen(driver: Driver): Promise<void> {
  try {
    await driver.triggerKey(KEYCODE_WAKEUP);
  } catch (err) {
    hilog.warn(DOMAIN, TAG, 'triggerKey wakeup failed');
  }
  await driver.delayMs(SETTLE_MS);
}

async function launchEntry(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    await delegator.startAbility(entryWant());
  } catch (err) {
    hilog.warn(DOMAIN, TAG, 'startAbility EntryAbility failed');
  }
}

/**
 * 把应用拉到前台并确认按钮可见。锁屏时前台是锁屏窗口，按键启动只会落在锁屏层，
 * 因此每轮先唤醒屏幕再拉起 EntryAbility；按钮仍不可见则再重试。
 */
export async function startApp(): Promise<boolean> {
  const driver: Driver = getDriver();
  for (let attempt = 0; attempt < LOCK_RETRY; attempt++) {
    await wakeUpScreen(driver);
    await launchEntry();
    await driver.delayMs(SETTLE_MS);
    if (await driver.waitForComponent(ON.id('button1'), 4000) !== null) {
      return true;
    }
    hilog.warn(DOMAIN, TAG, 'startApp attempt %{public}d: button1 not visible', attempt);
  }
  return await driver.waitForComponent(ON.id('button1'), 1000) !== null;
}

export function stationarySupported(): boolean {
  if (cachedSupport === null) {
    let opened: boolean = false;
    try {
      stationary.on('still', 1, 1000000000, noopCallback);
      opened = true;
    } catch (err) {
      opened = false;
    }
    if (opened) {
      try {
        stationary.off('still', 1, noopCallback);
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

/** 读取文案；控件不存在时返回 null（区别于“控件存在但文案为空”）。 */
async function readTextOrNull(driver: Driver, id: string): Promise<string | null> {
  try {
    const target: Component | null = await driver.waitForComponent(ON.id(id), 1000);
    return target === null ? null : await target.getText();
  } catch (err) {
    return null;
  }
}

let lastClickApplied: boolean = true;

/**
 * 该动作按钮对应的文案；设备不支持时为 null（点击不会改文案，也无法据此判断点击是否生效）。
 */
function actionTextOf(id: string): string | null {
  const index: number = BUTTON_IDS.indexOf(id);
  if (index < 0 || !stationarySupported()) {
    return null;
  }
  return EXPECTED_TEXT[index];
}

/**
 * 点击后确认动作已生效。
 *
 * 设备上的相邻两次点击可能被系统当作双击/多击而不再派发 click 事件，此时文案不变；
 * 这属于输入环境问题，不是页面功能缺陷。仅在这种“文案完全未变化”的情况下重试一次，
 * 动作已生效时仍严格只点击一次，从而保留“重复点击幂等”的验证语义。
 * 设备不支持 stationary 时文案本就不变，无法据此判断，此时只点击一次。
 */
async function clickUntilApplied(driver: Driver, id: string): Promise<boolean> {
  if (!(await clickButton(driver, id))) {
    return false;
  }
  if (lastClickApplied || !stationarySupported()) {
    return true;
  }
  hilog.warn(DOMAIN, TAG, 'click on %{public}s not applied, retrying once', id);
  if (!(await clickButton(driver, id))) {
    return false;
  }
  expect(lastClickApplied).assertTrue();
  return true;
}

async function clickButton(driver: Driver, id: string): Promise<boolean> {
  lastClickApplied = true;
  const target: Component | null = await driver.waitForComponent(ON.id(id), 4000);
  if (target === null) {
    return false;
  }
  const expected: string | null = actionTextOf(id);
  const before: string | null = await readTextOrNull(driver, SHOW_ID);
  let current: string | null = before;
  await target.click();
  for (let attempt = 0; attempt < ACTION_SETTLE_ATTEMPTS; attempt++) {
    await driver.delayMs(ACTION_SETTLE_MS);
    current = await readTextOrNull(driver, SHOW_ID);
    if (expected === null) {
      continue;
    }
    if (current === expected) {
      return true;
    }
  }
  lastClickApplied = expected === null || current !== before;
  if (!lastClickApplied) {
    hilog.warn(DOMAIN, TAG, 'click on %{public}s produced no status change', id);
  }
  return true;
}

/**
 * 读取状态文本。控件查不到时在 30s 内每 1s 重试，仍失败则断言失败并打印顶层 Ability；
 * 只有文本非空时才返回，避免调用方在“页面不可用”时拿到空串后静默通过。
 */
export async function readShowText(driver: Driver): Promise<string> {
  for (let attempt = 0; attempt < SHOW_READ_ATTEMPTS; attempt++) {
    try {
      const target: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 1000);
      const text: string = target === null ? '' : await target.getText();
      if (text.length > 0) {
        return text;
      }
    } catch (err) {
      hilog.warn(DOMAIN, TAG, 'readShowText attempt %{public}d threw', attempt);
    }
    await driver.delayMs(SHOW_READ_INTERVAL_MS);
  }
  let top: string = 'unknown';
  try {
    const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
    top = ability === null ? 'none' : ability.context.abilityInfo.name;
  } catch (err) {
    top = 'unavailable';
  }
  hilog.error(DOMAIN, TAG, 'readShowText failed: topAbility=%{public}s', top);
  expect(`status text missing (topAbility=${top})`).assertEqual('status text visible');
  return '';
}

/** 读取控件文案。按钮文案与状态文本走同一套等待策略，控件未就绪时不会误判为“文案为空”。 */
export async function labelOf(driver: Driver, id: string): Promise<string> {
  for (let attempt = 0; attempt < SHOW_READ_ATTEMPTS; attempt++) {
    const target: Component | null = await driver.waitForComponent(ON.id(id), 1000);
    const text: string = target === null ? '' : await target.getText();
    if (text.length > 0) {
      return text;
    }
    await driver.delayMs(SHOW_READ_INTERVAL_MS);
  }
  hilog.error(DOMAIN, TAG, 'labelOf failed: %{public}s has no text', id);
  return '';
}

/**
 * 先把文案切到固定起点，使断言不依赖前序用例遗留的状态。
 * 长时间等待时设备可能再次熄屏，此时按钮不可见，重新唤醒并拉起应用后再点击。
 */
export async function resetStatusText(driver: Driver): Promise<string> {
  let clicked: boolean = await clickUntilApplied(driver, 'button2');
  if (!clicked) {
    await startApp();
    clicked = await clickUntilApplied(driver, 'button2');
  }
  if (!clicked) {
    return '';
  }
  return await readShowText(driver);
}

/**
 * 点击按钮并按环境自适应断言：
 * - 支持 stationary：文案必须等于该按钮对应的动作文本；
 * - 不支持：动作异常被页面捕获且不改文案，文案保持点击前的内容（且非空）。
 */
export async function clickAndExpect(driver: Driver, index: number): Promise<boolean> {
  const before: string = await resetStatusText(driver);
  if (!(await clickUntilApplied(driver, BUTTON_IDS[index]))) {
    return false;
  }
  const after: string = await readShowText(driver);
  expect(after).assertEqual(expectedTextFor(index, before));
  return true;
}

/** 依次点击多个按钮，最终文案应为最后一次动作对应的文本（或在不支持时保持不变）。 */
export async function clickAndExpectLast(driver: Driver, ids: string[]): Promise<boolean> {
  const before: string = await resetStatusText(driver);
  for (let i = 0; i < ids.length; i++) {
    const isFirst: boolean = i === 0;
    const applied: boolean = isFirst ? await clickUntilApplied(driver, ids[i]) : await clickButton(driver, ids[i]);
    if (!applied) {
      return false;
    }
  }
  const last: number = BUTTON_IDS.indexOf(ids[ids.length - 1]);
  const after: string = await readShowText(driver);
  expect(after).assertEqual(last < 0 ? before : expectedTextFor(last, before));
  return true;
}

/**
 * 对同一按钮重复点击，每次点击后文案都稳定不变。
 * 仅第一次点击允许在“输入被吞”时重试，后续轮次严格只点击一次，
 * 保证“重复点击幂等”本身仍被真实验证。
 */
export async function repeatClick(driver: Driver, id: string, rounds: number): Promise<boolean> {
  const before: string = await resetStatusText(driver);
  const index: number = BUTTON_IDS.indexOf(id);
  const expected: string = index < 0 ? before : expectedTextFor(index, before);
  for (let round = 0; round < rounds; round++) {
    const applied: boolean = round === 0 ? await clickUntilApplied(driver, id) : await clickButton(driver, id);
    if (!applied) {
      return false;
    }
    expect(await readShowText(driver)).assertEqual(expected);
  }
  return true;
}

/** 两个按钮交替点击若干轮，每轮结束文案都应为第二个动作对应的文本。 */
export async function repeatAlternate(driver: Driver, firstId: string, secondId: string,
  rounds: number): Promise<boolean> {
  const before: string = await resetStatusText(driver);
  const index: number = BUTTON_IDS.indexOf(secondId);
  const expected: string = index < 0 ? before : expectedTextFor(index, before);
  for (let round = 0; round < rounds; round++) {
    const applied: boolean = round === 0 ?
      await clickUntilApplied(driver, firstId) && await clickUntilApplied(driver, secondId) :
      await clickButton(driver, firstId) && await clickButton(driver, secondId);
    if (!applied) {
      return false;
    }
    expect(await readShowText(driver)).assertEqual(expected);
  }
  return true;
}
