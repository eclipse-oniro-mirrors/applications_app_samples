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

import { Want } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { CommonEventConstants } from '../../../main/ets/util/Constants';

export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_CustomCommonEventRely]';
export const BUNDLE: string = 'CustomCommonEventRely_';
export const UI_IDLE_TIME: number = 300;
export const COMPONENT_WAIT_TIMEOUT: number = 5000;
const POLL_INTERVAL: number = 100;

export function logBegin(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}${caseName} begin`);
}

export function logEnd(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}${caseName} end`);
}

export function logError(caseName: string, message: string): void {
  hilog.error(DOMAIN, TAG, '%{public}s', `${BUNDLE}${caseName} failed: ${message}`);
}

export function logPair(caseName: string, label: string, actual: string, expected: string): void {
  hilog.info(DOMAIN, TAG, 'label=%{public}s actual=%{public}s expected=%{public}s', label, actual, expected);
}

export function logStep(caseName: string, step: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}${caseName} step: ${step}`);
}

/**
 * Waits without blocking the event loop, used by the polling helpers below.
 */
export function sleep(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, durationMs);
  });
}

/**
 * Polls a condition until it becomes true or the timeout expires.
 */
export async function waitForCondition(condition: () => boolean,
  timeoutMs: number = COMPONENT_WAIT_TIMEOUT): Promise<boolean> {
  let waited: number = 0;
  while (waited < timeoutMs) {
    if (condition()) {
      return true;
    }
    await sleep(POLL_INTERVAL);
    waited += POLL_INTERVAL;
  }
  return condition();
}

/**
 * Starts the home page of this sample through the ability delegator.
 */
export async function startHomeAbility(): Promise<void> {
  let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let want: Want = {
    bundleName: CommonEventConstants.BUNDLE_NAME,
    abilityName: CommonEventConstants.ABILITY_NAME
  };
  await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    delegator.startAbility(want, (error: BusinessError) => {
      if (error && error.code !== 0) {
        reject(new Error(`Failed to start the home page, code: ${error.code}`));
        return;
      }
      resolve();
    });
  });
}

/**
 * Reads the text of a component, returns an empty string when the component is missing.
 */
export async function tryGetTextById(driver: Driver, componentId: string): Promise<string> {
  try {
    let component: Component | null | undefined = await driver.findComponent(ON.id(componentId));
    if (component === null || component === undefined) {
      return '';
    }
    return await component.getText();
  } catch (error) {
    return '';
  }
}

/**
 * Waits until the text of a component equals the expected value.
 */
export async function waitForTextById(driver: Driver, componentId: string, expected: string,
  timeoutMs: number = COMPONENT_WAIT_TIMEOUT): Promise<boolean> {
  let waited: number = 0;
  while (waited < timeoutMs) {
    let text: string = await tryGetTextById(driver, componentId);
    if (text === expected) {
      return true;
    }
    await sleep(POLL_INTERVAL);
    waited += POLL_INTERVAL;
  }
  return false;
}

/**
 * Waits until the text of a component differs from the given value.
 */
export async function waitForTextChanged(driver: Driver, componentId: string, previous: string,
  timeoutMs: number = COMPONENT_WAIT_TIMEOUT): Promise<string> {
  let waited: number = 0;
  while (waited < timeoutMs) {
    let text: string = await tryGetTextById(driver, componentId);
    if (text.length > 0 && text !== previous) {
      return text;
    }
    await sleep(POLL_INTERVAL);
    waited += POLL_INTERVAL;
  }
  return await tryGetTextById(driver, componentId);
}

/**
 * Waits until a component identified by id exists on the screen.
 * The driver resolves the search with null instead of rejecting it when nothing matches.
 */
export async function waitForComponent(driver: Driver, componentId: string,
  timeoutMs: number = COMPONENT_WAIT_TIMEOUT): Promise<boolean> {
  let waited: number = 0;
  while (waited < timeoutMs) {
    if (await isComponentExists(driver, componentId)) {
      return true;
    }
    await sleep(POLL_INTERVAL);
    waited += POLL_INTERVAL;
  }
  return await isComponentExists(driver, componentId);
}

/**
 * Checks whether a component identified by id exists on the screen.
 */
export async function isComponentExists(driver: Driver, componentId: string): Promise<boolean> {
  try {
    let component: Component | null | undefined = await driver.findComponent(ON.id(componentId));
    return component !== null && component !== undefined;
  } catch (error) {
    return false;
  }
}

/**
 * Waits until the component identified by id disappears from the screen.
 */
export async function waitForComponentAbsent(driver: Driver, componentId: string,
  timeoutMs: number = COMPONENT_WAIT_TIMEOUT): Promise<boolean> {
  let waited: number = 0;
  while (waited < timeoutMs) {
    if (!(await isComponentExists(driver, componentId))) {
      return true;
    }
    await sleep(POLL_INTERVAL);
    waited += POLL_INTERVAL;
  }
  return !(await isComponentExists(driver, componentId));
}

/**
 * Clicks the component identified by id, returns false when the component is missing.
 */
export async function clickById(driver: Driver, componentId: string): Promise<boolean> {
  try {
    let component: Component | null | undefined = await driver.findComponent(ON.id(componentId));
    if (component === null || component === undefined) {
      hilog.error(DOMAIN, TAG, 'Missing component %{public}s', componentId);
      return false;
    }
    await component.click();
    return true;
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'Failed to click %{public}s', componentId);
    return false;
  }
}

/**
 * Waits for the given duration, used after operations that change the user interface.
 */
export async function delay(driver: Driver, durationMs: number): Promise<void> {
  try {
    await driver.delayMs(durationMs);
  } catch (error) {
    hilog.warn(DOMAIN, TAG, 'Failed to delay the test: %{public}s', (error as BusinessError).message);
  }
}

/**
 * Collects the events published with the custom event name of the sample.
 */
export class EventCollector {
  private events: commonEventManager.CommonEventData[] = [];
  private subscriber: commonEventManager.CommonEventSubscriber | null = null;
  private onEvent = (error: BusinessError, event: commonEventManager.CommonEventData): void => {
    if (error && error.code !== 0) {
      hilog.error(DOMAIN, TAG, 'Failed to receive the event, code: %{public}d', error.code);
      return;
    }
    this.events.push(event);
  };

  async start(): Promise<void> {
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: [CommonEventConstants.EVENT_NAME]
    };
    this.subscriber = await commonEventManager.createSubscriber(subscribeInfo);
    commonEventManager.subscribe(this.subscriber, this.onEvent);
  }

  async stop(): Promise<void> {
    let currentSubscriber: commonEventManager.CommonEventSubscriber | null = this.subscriber;
    if (currentSubscriber === null) {
      return;
    }
    this.subscriber = null;
    await new Promise<void>((resolve: (value: void) => void) => {
      commonEventManager.unsubscribe(currentSubscriber, () => {
        resolve();
      });
    });
  }

  getCount(): number {
    return this.events.length;
  }

  getEventAt(index: number): commonEventManager.CommonEventData | null {
    if (index < 0 || index >= this.events.length) {
      return null;
    }
    return this.events[index];
  }

  clear(): void {
    this.events = [];
  }

  async waitForCount(expectedCount: number, timeoutMs: number = COMPONENT_WAIT_TIMEOUT): Promise<boolean> {
    return waitForCondition(() => this.events.length >= expectedCount, timeoutMs);
  }
}
