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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// 遥控器/键盘按键码值映射：OpenHarmony 标准键码定义
// 用于 UI 自动化测试中模拟物理按键操作，确保与真实用户行为一致
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_TAB: number = 2049;

// 应用与页面标识常量：与 AppScope/app.json5 及各页面标题保持一致
export const BUNDLE_NAME: string = 'com.samples.systemrouter';

export const ENTRY_ABILITY: string = 'EntryAbility';

export const HOME_TITLE: string = 'NavIndex';

export const ROUTER_NAME: string = 'SystemRouter';

// Home page button texts: entry pages plus HAR/HSP module destination pages
export const BTN_HARA_PAGE1: string = 'toHarAPageOne';

export const BTN_HARA_PAGE2: string = 'toHarAPageTwo';

export const BTN_HARA_PAGE3: string = 'toEntryPageOne';

export const BTN_HARB_PAGE1: string = 'toHspAPageOne';

export const BTN_HARB_PAGE2: string = 'toHspAPageTwo';

export const BTN_HARB_PAGE3: string = 'toEntryPageTwo';

export const BTN_TO_INDEX: string = 'toIndex';

// 目标页面标题：对应各 page 的 NavDestination title
export const TITLE_HARA_PAGE1: string = 'harA-pageOne';

export const TITLE_HARA_PAGE2: string = 'harA-pageTwo';

export const TITLE_HARA_PAGE3: string = 'entry-pageOne';

export const TITLE_HARB_PAGE1: string = 'hspA-pageOne';

export const TITLE_HARB_PAGE2: string = 'hspA-pageTwo';

export const TITLE_HARB_PAGE3: string = 'entry-pageTwo';

// 超时阈值配置：导航页面渲染、路由切换、焦点切换
export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_ROUTE_PUSH: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

// 操作间隔延迟：优化延迟时间，提高测试执行速度
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_ROUTE_OP: number = 500;

// 容差阈值：组件数量容差 3、焦点切换容差 2，用于应对 UI 渲染的微小波动
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

// 稳定性检测参数
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

// 压力测试轮次：导航操作 20 轮、生命周期操作 10 轮
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/** UI 操作串行化执行器：通过 Promise 链确保 UI 操作按序执行
 *  导航栈对操作顺序敏感，并发点击会导致路由竞争和状态混乱
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue = _uiOperationQueue;
  const result = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult = await action();
        resolve(actionResult);
      } catch (error) {
        const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMsg);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
  return result;
}

/** 串行化延迟等待：确保 delayMs 不会与其他 UiTest API 并发调用 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** 触发序列化按键操作：包装 runSerializedUiOperation 确保按键事件按序执行 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** 获取 Driver 单例实例：UI 自动化驱动器的全局唯一实例 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** 重置 Driver 操作队列：仅在明确确认无进行中的 UI 操作时使用 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** 统计当前页面组件数量：采用简化但更可靠的查找策略 */
export async function pageComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      return allComponents.length;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `pageComponentCount error: ${error}`);
    return 0;
  }
}

/** 按类型查找组件：封装 driver.findComponents 调用，统一处理空值情况 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** 检查文本内容：遍历所有 Text 组件验证是否存在预期文本 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === expectedText) {
            return true;
          }
        } catch (e) {
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/** 检查组件是否存在：验证指定类型的组件是否存在于当前 UI 中 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type(type)) ?? [];
      return components.length > 0;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/** 获取当前焦点索引：返回当前焦点组件的索引位置，未找到返回 -1 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let i = 0; i < allComponents.length; i++) {
        try {
          if (await allComponents[i].isFocused()) {
            return i;
          }
        } catch (e) {
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/** 模拟触摸事件：在指定坐标触发点击操作并等待触摸事件处理完成 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** 按键操作封装：连续触发指定按键多次，每次操作后等待固定延迟 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** 检查焦点状态：验证当前是否存在焦点，并在索引可稳定识别时校验索引 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100;
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (expectedFocusedIndex === -1) {
          for (let i = 0; i < allComponents.length; i++) {
            try {
              if (await allComponents[i].isFocused()) {
                return true;
              }
            } catch (e) {
            }
          }
          return false;
        }
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          return false;
        }
        try {
          return await allComponents[expectedFocusedIndex].isFocused();
        } catch (e) {
          return false;
        }
      });
      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(0x0000, 'testTag', '%{public}s', `checkFocusState error: ${error}`);
    }
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

/** 启动主 Ability：通过 AbilityDelegator 冷启动 EntryAbility 显示主页 */
export async function launchApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const bundleName = args.bundleName ? args.bundleName : BUNDLE_NAME;
  const want: Want = {
    bundleName: bundleName,
    abilityName: ENTRY_ABILITY
  };
  await delegator.startAbility(want);
}

/** 判断指定文本是否出现在当前页面 */
export async function isTextVisible(driver: Driver, text: string): Promise<boolean> {
  return await checkTextContent(driver, text);
}

/** 判断是否处于主页：主页标题为 NavIndex */
export async function isHomeVisible(driver: Driver): Promise<boolean> {
  return await isTextVisible(driver, HOME_TITLE);
}

/** 等待指定文本出现：事件驱动循环，超时仅作保护 */
export async function waitForText(driver: Driver, text: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const visible = await isTextVisible(driver, text);
    if (visible) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

/** 等待路由切换稳定：确保目标页面标题已渲染 */
export async function waitForRouteStable(driver: Driver, expectedTitle: string,
  maxWaitMs: number = TIMEOUT_ROUTE_PUSH): Promise<boolean> {
  return await waitForText(driver, expectedTitle, maxWaitMs);
}

/** 点击主页按钮跳转到指定页面：通过文本定位按钮并点击 */
export async function navigateTo(driver: Driver, buttonText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const button: Component | null = await driver.findComponent(ON.text(buttonText));
      if (button === null) {
        return false;
      }
      await button.click();
      await driver.delayMs(DELAY_AFTER_ROUTE_OP);
      return true;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `navigateTo error: ${error}`);
    return false;
  }
}

/** 返回主页：优先点击 toIndex，其次使用 BACK 键逐级返回 */
export async function backToHome(driver: Driver): Promise<void> {
  const hastoIndex = await isTextVisible(driver, BTN_TO_INDEX);
  if (hastoIndex) {
    await navigateTo(driver, BTN_TO_INDEX);
  } else {
    await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
  }
  await serializedDelay(driver, DELAY_AFTER_ROUTE_OP);
}

/** 统计当前可见的文本组件数量 */
export async function countTextComponents(driver: Driver): Promise<number> {
  const texts = await findComponentsByType(driver, 'Text');
  return texts.length;
}

/** 判断按钮是否存在：通过文本定位主页跳转按钮 */
export async function isButtonPresent(driver: Driver, text: string): Promise<boolean> {
  return await isTextVisible(driver, text);
}

/** 统计当前页面的按钮组件数量 */
export async function countButtons(driver: Driver): Promise<number> {
  const buttons = await findComponentsByType(driver, 'Button');
  return buttons.length;
}

/** 安全点击：定位失败时返回 false，不抛出异常 */
export async function safeClick(driver: Driver, text: string): Promise<boolean> {
  return await navigateTo(driver, text);
}

/** 安全返回：触发 BACK 键并等待，忽略异常 */
export async function safeBack(driver: Driver): Promise<void> {
  try {
    await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
    await serializedDelay(driver, DELAY_AFTER_ROUTE_OP);
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `safeBack error: ${error}`);
  }
}

/** 跳转到 harA-pageOne：封装常用导航路径 */
export async function goHarAPage1(driver: Driver): Promise<boolean> {
  const clicked = await navigateTo(driver, BTN_HARA_PAGE1);
  if (!clicked) {
    return false;
  }
  return await waitForRouteStable(driver, TITLE_HARA_PAGE1);
}

/** 跳转到 hspA-pageOne：封装常用导航路径 */
export async function goHarBPage1(driver: Driver): Promise<boolean> {
  const clicked = await navigateTo(driver, BTN_HARB_PAGE1);
  if (!clicked) {
    return false;
  }
  return await waitForRouteStable(driver, TITLE_HARB_PAGE1);
}

/** 路由访问记录：记录单次导航的目标与耗时 */
export interface RouteVisit {
  target: string;
  startedAt: number;
  finishedAt: number;
  succeeded: boolean;
}

/** 路由访问追踪器：聚合导航耗时与成功率指标 */
export class RouteVisitTracker {
  private visits: RouteVisit[] = [];
  private seq: number = 0;

  public record(target: string, startedAt: number, finishedAt: number, succeeded: boolean): number {
    this.seq++;
    const visit: RouteVisit = {
      target: target,
      startedAt: startedAt,
      finishedAt: finishedAt,
      succeeded: succeeded
    };
    this.visits.push(visit);
    return this.visits.length;
  }

  public count(): number {
    return this.visits.length;
  }

  public successCount(): number {
    let total = 0;
    for (let i = 0; i < this.visits.length; i++) {
      if (this.visits[i].succeeded) {
        total++;
      }
    }
    return total;
  }

  public successRate(): number {
    if (this.visits.length === 0) {
      return 0;
    }
    return this.successCount() / this.visits.length;
  }

  public lastTarget(): string {
    if (this.visits.length === 0) {
      return '';
    }
    return this.visits[this.visits.length - 1].target;
  }

  public averageDuration(): number {
    if (this.visits.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.visits.length; i++) {
      total += this.visits[i].finishedAt - this.visits[i].startedAt;
    }
    return total / this.visits.length;
  }

  public clear(): void {
    this.visits = [];
    this.seq = 0;
  }

  public targets(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.visits.length; i++) {
      result.push(this.visits[i].target);
    }
    return result;
  }
}

/** 导航度量计算器：对一组耗时样本做统计分析 */
export class NavigationMetricsCalculator {
  private samples: number[] = [];

  public constructor(samples: number[]) {
    this.samples = samples;
  }

  public size(): number {
    return this.samples.length;
  }

  public total(): number {
    let sum = 0;
    for (let i = 0; i < this.samples.length; i++) {
      sum += this.samples[i];
    }
    return sum;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.total() / this.samples.length;
  }

  public max(): number {
    let maxValue = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i] > maxValue) {
        maxValue = this.samples[i];
      }
    }
    return maxValue;
  }

  public min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let minValue = this.samples[0];
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i] < minValue) {
        minValue = this.samples[i];
      }
    }
    return minValue;
  }

  public aboveThreshold(threshold: number): number {
    let count = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i] > threshold) {
        count++;
      }
    }
    return count;
  }

  public sorted(): number[] {
    const copy: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      copy.push(this.samples[i]);
    }
    copy.sort((a: number, b: number) => a - b);
    return copy;
  }
}

// 主页全部跳转按钮文案：按顺序覆盖 HarA 与 HarB 各三个页面
export const ALL_HOME_BUTTONS: string[] = [
  BTN_HARA_PAGE1, BTN_HARA_PAGE2, BTN_HARA_PAGE3, BTN_HARB_PAGE1, BTN_HARB_PAGE2, BTN_HARB_PAGE3
];

// 全部目标页面标题：与主页按钮一一对应
export const ALL_DESTINATION_TITLES: string[] = [
  TITLE_HARA_PAGE1, TITLE_HARA_PAGE2, TITLE_HARA_PAGE3, TITLE_HARB_PAGE1, TITLE_HARB_PAGE2, TITLE_HARB_PAGE3
];
