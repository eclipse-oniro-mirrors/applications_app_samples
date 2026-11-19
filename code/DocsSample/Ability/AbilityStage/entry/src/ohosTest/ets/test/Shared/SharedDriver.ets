/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Driver, ON, Component, On } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';import hilog from '@ohos.hilog';

export const DOMAIN: number = 0x0000;

export const LOG_TAG: string = '[AbilityStage_Test]';

export const BUNDLE_NAME: string = 'com.samples.abilitystage';

export const MODULE_NAME: string = 'entry';

export const ABILITY_STAGE_NAME: string = 'MyAbilityStage';

export const ENTRY_ABILITY_NAME: string = 'EntryAbility';

export const BACKUP_ABILITY_NAME: string = 'EntryBackupAbility';

export const INDEX_PAGE_PATH: string = 'pages/Index';

export const INDEX_PAGE_TEXT_KEY: string = 'HelloWorld';

export const PAGE_TEXT_INITIAL: string = 'Hello World';

export const PAGE_TEXT_CLICKED: string = 'Welcome';

export const COLOR_MODE_NOT_SET: number = -1;

export const ENV_CALLBACK_EVENT: string = 'environment';

export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2054;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 1;

export const KEY_TAB: number = 2049;

export const KEY_SPACE: number = 2050;

export const KEY_ESCAPE: number = 2070;

export const KEY_MENU: number = 2067;

export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_TEXT_APPEAR: number = 1000;

export const TIMEOUT_ABILITY_LAUNCH: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const TIMEOUT_BACKGROUND_SWITCH: number = 1500;

export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_LAUNCH: number = 500;

export const DELAY_AFTER_BACKGROUND: number = 300;

export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

export const STRESS_ROUNDS_LAUNCH: number = 5;

let _driver: Driver | null = null;

let _uiOperationQueue: Promise<void> = Promise.resolve();

let _queueLock: boolean = false;

export function logInfo(message: string): void {
  hilog.info(DOMAIN, LOG_TAG, '%{public}s', message);
}

export function logError(message: string): void {
  hilog.error(DOMAIN, LOG_TAG, '%{public}s', message);
}

export function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    _uiOperationQueue = currentQueue.then(async (): Promise<void> => {
      try {
        const actionResult: T = await action();
        resolve(actionResult);
      } catch (error) {
        reject(new Error(String(error)));
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
  return result;
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.delayMs(delayMs);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.triggerKey(key);
  });
}

export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

export function isQueueBusy(): boolean {
  return _queueLock;
}

export function getAbilityDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

export function getBundleName(): string {
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const bundleName: string = args.bundleName;
  if (bundleName === undefined || bundleName === null || bundleName.length === 0) {
    return BUNDLE_NAME;
  }
  return bundleName;
}

export function buildEntryWant(): Want {
  const want: Want = {
    bundleName: getBundleName(),
    abilityName: ENTRY_ABILITY_NAME
  };
  return want;
}

export async function startAbilityByWant(want: Want): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
  await delegator.startAbility(want);
}

export function isStartAbilityRejected(error: Error): boolean {
  const message: string = error === null || error === undefined ? '' : String(error.message);
  const name: string = error === null || error === undefined ? '' : String(error.name);
  const rejected: boolean = message.indexOf('startAbility') >= 0 || name.indexOf('Ability') >= 0;
  logInfo(`isStartAbilityRejected: name ${name} rejected ${rejected}`);
  return rejected;
}

export async function isEntryAbilityAlive(): Promise<boolean> {
  try {
    const topAbility: UIAbility = await getTopAbility();
    const alive: boolean = topAbility !== null && topAbility !== undefined;
    logInfo(`isEntryAbilityAlive: top ability present: ${alive}`);
    return alive;
  } catch (error) {
    logInfo(`isEntryAbilityAlive: no top ability, error: ${error}`);
    return false;
  }
}

export async function launchEntryAbility(): Promise<void> {
  const driver: Driver = getDriver();
  const maxAttempts: number = 3;
  for (let attempt = 1; attempt <= maxAttempts; attempt++) {
    logInfo(`launchEntryAbility: starting EntryAbility, attempt ${attempt}`);
    try {
      await startAbilityByWant(buildEntryWant());
      logInfo('launchEntryAbility: EntryAbility start request finished');
    } catch (error) {
      if (isStartAbilityRejected(error)) {
        logInfo(`launchEntryAbility: start request rejected, reuse running instance: ${error}`);
      } else {
        logError(`launchEntryAbility: start request failed: ${error}`);
      }
    }
    const rendered: boolean = await waitForIndexPageRendered(driver, TIMEOUT_ABILITY_LAUNCH);
    if (rendered) {
      logInfo(`launchEntryAbility: index page rendered on attempt ${attempt}`);
      return;
    }
    logInfo(`launchEntryAbility: index page absent after attempt ${attempt}`);
  }
  const alive: boolean = await isEntryAbilityAlive();
  if (!alive) {
    logError('launchEntryAbility: no entry instance available after all start attempts');
    throw new Error(String('launchEntryAbility: entry ability unavailable'));
  }
  logInfo('launchEntryAbility: entry instance alive but index page not rendered');
}

export async function waitForIndexPageRendered(driver: Driver,
  maxWaitMs: number = TIMEOUT_ABILITY_LAUNCH): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const rendered: boolean = await isIndexPageRendered(driver);
    if (rendered) {
      return true;
    }
    await sleepMs(100);
  }
  return false;
}

export async function isIndexPageRendered(driver: Driver): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    if (component === null || component === undefined) {
      logInfo('isIndexPageRendered: HelloWorld node absent');
      return false;
    }
    const text: string = await component.getText();
    const rendered: boolean = text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
    logInfo(`isIndexPageRendered: text ${text} rendered ${rendered}`);
    return rendered;
  } catch (error) {
    logInfo(`isIndexPageRendered: query failed: ${error}`);
    return false;
  }
}

export async function ensureIndexPageInitial(driver: Driver): Promise<boolean> {
  const currentText: string = await readTextById(driver);
  if (currentText === PAGE_TEXT_INITIAL) {
    logInfo('ensureIndexPageInitial: page already shows the initial text');
    return true;
  }
  if (currentText !== PAGE_TEXT_CLICKED) {
    logInfo(`ensureIndexPageInitial: unexpected text ${currentText}, relaunching`);
    await launchEntryAbility();
    await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
    return false;
  }
  logInfo('ensureIndexPageInitial: page shows the clicked text, restarting the entry ability');
  const restarted: boolean = await restartEntryAbility(driver);
  if (!restarted) {
    logError('ensureIndexPageInitial: restart did not restore the initial text');
    return false;
  }
  const restored: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
  logInfo(`ensureIndexPageInitial: initial text restored: ${restored}`);
  return restored;
}

export async function restartEntryAbility(driver: Driver): Promise<boolean> {
  try {
    const topAbility: UIAbility = await getTopAbility();
    if (topAbility !== null && topAbility !== undefined) {
      await doAbilityBackground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      await terminateTopAbility(topAbility);
    }
    await launchEntryAbility();
    await serializedDelay(driver, DELAY_AFTER_LAUNCH);
    const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
    logInfo(`restartEntryAbility: page stable after restart: ${stable}`);
    return stable;
  } catch (error) {
    logError(`restartEntryAbility failed: ${error}`);
    return false;
  }
}

export async function terminateTopAbility(topAbility: UIAbility): Promise<void> {
  if (topAbility === null || topAbility === undefined) {
    logInfo('terminateTopAbility: no top ability to terminate');
    return;
  }
  const context = topAbility.context;
  if (context === null || context === undefined) {
    logError('terminateTopAbility: top ability exposes no context');
    return;
  }
  try {
    await context.terminateSelf();
    logInfo('terminateTopAbility: terminateSelf finished');
  } catch (error) {
    logError(`terminateTopAbility: terminateSelf failed: ${error}`);
    return;
  }
  await sleepMs(DELAY_AFTER_BACKGROUND);
}

export async function readTextById(driver: Driver): Promise<string> {
  try {
    return await runSerializedUiOperation(async (): Promise<string> => {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return '';
      }
      return await component.getText();
    });
  } catch (error) {
    logError(`readTextById error: ${error}`);
    return '';
  }
}

let cachedTopAbility: UIAbility | null = null;

export async function getTopAbility(): Promise<UIAbility> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
  const topAbility: UIAbility = await delegator.getCurrentTopAbility();
  if (topAbility !== null && topAbility !== undefined) {
    cachedTopAbility = topAbility;
  }
  return topAbility;
}

async function resolveTopAbility(stage: string): Promise<UIAbility | null> {
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
    const topAbility: UIAbility = await delegator.getCurrentTopAbility();
    if (topAbility !== null && topAbility !== undefined) {
      cachedTopAbility = topAbility;
      return topAbility;
    }
    logInfo(`${stage}: getCurrentTopAbility returned null`);
  } catch (error) {
    logInfo(`${stage}: getCurrentTopAbility rejected: ${error}`);
  }
  if (cachedTopAbility !== null && cachedTopAbility !== undefined) {
    logInfo(`${stage}: reusing the cached ability instance`);
    return cachedTopAbility;
  }
  await launchEntryAbility();
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
    const relaunched: UIAbility = await delegator.getCurrentTopAbility();
    if (relaunched !== null && relaunched !== undefined) {
      cachedTopAbility = relaunched;
      return relaunched;
    }
  } catch (error) {
    logError(`${stage}: getCurrentTopAbility rejected after relaunch: ${error}`);
  }
  return null;
}

export async function doAbilityForeground(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
  const topAbility: UIAbility | null = await resolveTopAbility('doAbilityForeground');
  if (topAbility === null || topAbility === undefined) {
    logError('doAbilityForeground: no ability instance available for the foreground callback');
    await launchEntryAbility();
    return;
  }
  await delegator.doAbilityForeground(topAbility);
  logInfo('doAbilityForeground: foreground callback invoked');
}

export async function doAbilityBackground(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
  const topAbility: UIAbility | null = await resolveTopAbility('doAbilityBackground');
  if (topAbility === null || topAbility === undefined) {
    logError('doAbilityBackground: no ability instance available for the background callback');
    return;
  }
  await delegator.doAbilityBackground(topAbility);
  logInfo('doAbilityBackground: background callback invoked');
}

export async function queryInAppWindow(driver: Driver, matcher: On,
  allowFullScreenFallback: boolean = true): Promise<Component[]> {
  try {
    const scoped: Component[] = await driver.findComponents(matcher.inWindow(getBundleName()));
    if (scoped !== null && scoped !== undefined && scoped.length > 0) {
      return scoped;
    }
    const scopedCount: number = scoped === null || scoped === undefined ? 0 : scoped.length;
    logInfo(`queryInAppWindow: scoped query returned ${scopedCount}, full screen fallback allowed: ` +
      `${allowFullScreenFallback}`);
    if (!allowFullScreenFallback) {
      return [];
    }
  } catch (error) {
    logInfo(`queryInAppWindow: scoped query rejected, full screen fallback allowed: ` +
      `${allowFullScreenFallback}: ${error}`);
    if (!allowFullScreenFallback) {
      return [];
    }
  }
  const plain: Component[] = await driver.findComponents(matcher);
  if (plain === null || plain === undefined) {
    return [];
  }
  return plain;
}

const ALL_COMPONENT_TYPES: string[] = ['RelativeContainer', 'Text', 'Button', 'Image', 'Column', 'Row', 'Stack', 'Flex', 'Grid'];

export async function queryAllInAppWindow(driver: Driver): Promise<Component[]> {
  const collected: Component[] = await collectScopedComponents(driver);
  if (collected.length > 0) {
    logInfo(`queryAllInAppWindow: collected ${collected.length} components in the app window`);
    return collected;
  }
  logInfo('queryAllInAppWindow: app window scope empty, falling back to the full screen query');
  const fallback: Component[] = [];
  for (let i = 0; i < ALL_COMPONENT_TYPES.length; i++) {
    try {
      const matches: Component[] = await queryInAppWindow(driver, ON.type(ALL_COMPONENT_TYPES[i]), false);
      if (matches !== null && matches !== undefined) {
        for (let j = 0; j < matches.length; j++) {
          fallback.push(matches[j]);
        }
      }
    } catch (error) {
      logInfo(`queryAllInAppWindow: fallback query for ${ALL_COMPONENT_TYPES[i]} failed: ${error}`);
    }
  }
  logInfo(`queryAllInAppWindow: fallback collected ${fallback.length} components`);
  return fallback;
}

async function collectScopedComponents(driver: Driver): Promise<Component[]> {
  const collected: Component[] = [];
  const bundleName: string = getBundleName();
  for (let i = 0; i < ALL_COMPONENT_TYPES.length; i++) {
    try {
      const matches: Component[] = await driver.findComponents(
        ON.type(ALL_COMPONENT_TYPES[i]).inWindow(bundleName));
      if (matches !== null && matches !== undefined) {
        logInfo(`queryAllInAppWindow: type ${ALL_COMPONENT_TYPES[i]} matched ${matches.length}`);
        for (let j = 0; j < matches.length; j++) {
          collected.push(matches[j]);
        }
      }
    } catch (error) {
      logInfo(`queryAllInAppWindow: type ${ALL_COMPONENT_TYPES[i]} query failed: ${error}`);
    }
  }
  return collected;
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async (): Promise<Component[]> => {
    return await queryInAppWindow(driver, ON.type(type));
  });
}

export async function findComponentsByText(driver: Driver, text: string): Promise<Component[]> {
  return await runSerializedUiOperation(async (): Promise<Component[]> => {
    return await queryInAppWindow(driver, ON.text(text));
  });
}

export async function pageComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async (): Promise<number> => {
      const allComponents: Component[] = await queryAllInAppWindow(driver);
      const count: number = allComponents === null || allComponents === undefined ? 0 : allComponents.length;
      logInfo(`pageComponentCount: found ${count} components`);
      return count;
    });
  } catch (error) {
    logError(`pageComponentCount error: ${error}`);
    return 0;
  }
}

export async function collectAllTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async (): Promise<string[]> => {
      const result: string[] = [];
      const texts: Component[] = await queryInAppWindow(driver, ON.type('Text'));
      if (texts === null || texts === undefined) {
        return result;
      }
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          result.push(content);
        } catch (error) {
          logInfo(`collectAllTexts: skip component ${i}, error: ${error}`);
        }
      }
      return result;
    });
  } catch (error) {
    logError(`collectAllTexts error: ${error}`);
    return [];
  }
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const texts: Component[] = await queryInAppWindow(driver, ON.type('Text'));
      if (texts === null || texts === undefined || texts.length === 0) {
        logInfo('checkTextContent: no text components found');
        return false;
      }
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === expectedText) {
            logInfo(`checkTextContent: matched ${expectedText}`);
            return true;
          }
        } catch (error) {
          logInfo(`checkTextContent: read text error at index ${i}: ${error}`);
        }
      }
      logInfo(`checkTextContent: no match for ${expectedText}`);
      return false;
    });
  } catch (error) {
    logError(`checkTextContent error: ${error}`);
    return false;
  }
}

export async function waitForTextVisible(driver: Driver, expectedText: string,
  maxWaitMs: number = TIMEOUT_TEXT_APPEAR): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  let attempt: number = 1;
  while (Date.now() < deadline) {
    const visible: boolean = await checkTextContent(driver, expectedText);
    if (visible) {
      logInfo(`waitForTextVisible: ${expectedText} visible after attempt ${attempt}`);
      return true;
    }
    attempt++;
    await serializedDelay(driver, 100);
  }
  logInfo(`waitForTextVisible: ${expectedText} not visible within ${maxWaitMs} ms`);
  return false;
}

export async function isIndexPageVisible(driver: Driver): Promise<boolean> {
  const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
  if (initialVisible) {
    return true;
  }
  return await checkTextContent(driver, PAGE_TEXT_CLICKED);
}

export async function waitForIndexPageStable(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  try {
    logInfo(`waitForIndexPageStable: waiting for index page render, maxWaitMs: ${maxWaitMs}`);
    const deadline: number = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible: boolean = await isIndexPageVisible(driver);
      if (visible) {
        logInfo('waitForIndexPageStable: index page render observed');
        return true;
      }
      await serializedDelay(driver, 100);
    }
    logInfo('waitForIndexPageStable: render timeout, relaunching EntryAbility');
    await launchEntryAbility();
    const secondDeadline: number = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible: boolean = await isIndexPageVisible(driver);
      if (visible) {
        logInfo('waitForIndexPageStable: index page render observed after relaunch');
        return true;
      }
      await serializedDelay(driver, 100);
    }
    logInfo('waitForIndexPageStable: index page still not rendered');
    return false;
  } catch (error) {
    logError(`waitForIndexPageStable error: ${error}`);
    return false;
  }
}

export async function triggerEntryAbility(driver: Driver): Promise<void> {
  await serializedDelay(driver, DELAY_AFTER_LAUNCH);
  const visible: boolean = await isIndexPageVisible(driver);
  if (!visible) {
    await launchEntryAbility();
  }
  await serializedDelay(driver, DELAY_AFTER_LAUNCH);
  logInfo('triggerEntryAbility: EntryAbility triggered');
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const components: Component[] = await queryInAppWindow(driver, ON.type(type));
      const exists: boolean = components !== null && components !== undefined && components.length > 0;
      logInfo(`checkComponentExists: type ${type} exists: ${exists}`);
      return exists;
    });
  } catch (error) {
    logError(`checkComponentExists error: ${error}`);
    return false;
  }
}

export async function checkComponentExistsByKey(driver: Driver, key: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const components: Component[] = await queryInAppWindow(driver, ON.id(key));
      const exists: boolean = components !== null && components !== undefined && components.length > 0;
      logInfo(`checkComponentExistsByKey: key ${key} exists: ${exists}`);
      return exists;
    });
  } catch (error) {
    logError(`checkComponentExistsByKey error: ${error}`);
    return false;
  }
}

export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs: number = 100;
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt: number = 1;
  while (Date.now() < deadline) {
    try {
      const result: boolean = await runSerializedUiOperation(async (): Promise<boolean> => {
        let focusedComponent: Component | null = null;
        try {
          focusedComponent = await driver.findComponent(ON.focused(true).inWindow(getBundleName()));
        } catch (error) {
          logInfo(`checkFocusState: no focused component matched, attempt: ${attempt}`);
        }
        const allComponents: Component[] = await queryAllInAppWindow(driver);
        const componentCount: number = allComponents === null || allComponents === undefined ? 0 : allComponents.length;
        if (expectedFocusedIndex === -1) {
          let hasFocus: boolean = focusedComponent !== null && focusedComponent !== undefined;
          if (!hasFocus) {
            for (let i = 0; i < componentCount; i++) {
              try {
                const focused: boolean = await allComponents[i].isFocused();
                if (focused) {
                  hasFocus = true;
                  break;
                }
              } catch (error) {
                logInfo(`checkFocusState: focus query failed at index ${i}`);
              }
            }
          }
          logInfo(`checkFocusState: existence check hasFocus: ${hasFocus} attempt: ${attempt}`);
          return hasFocus;
        }
        if (componentCount === 0 || expectedFocusedIndex >= componentCount) {
          logInfo(`checkFocusState: invalid component count ${componentCount} attempt: ${attempt}`);
          return false;
        }
        try {
          const targetComponent: Component = allComponents[expectedFocusedIndex];
          const isFocused: boolean = await targetComponent.isFocused();
          logInfo(`checkFocusState: index ${expectedFocusedIndex} focused: ${isFocused} attempt: ${attempt}`);
          return isFocused;
        } catch (error) {
          logInfo(`checkFocusState: focus query error at index ${expectedFocusedIndex}`);
          return false;
        }
      });
      if (result) {
        return true;
      }
    } catch (error) {
      logError(`checkFocusState error: ${error} attempt: ${attempt}`);
    }
    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async (): Promise<number> => {
      const allComponents: Component[] = await queryAllInAppWindow(driver);
      if (allComponents === null || allComponents === undefined || allComponents.length === 0) {
        logInfo('getCurrentFocusIndex: no components found');
        return -1;
      }
      logInfo(`getCurrentFocusIndex: total components ${allComponents.length}`);
      for (let i = 0; i < allComponents.length; i++) {
        try {
          const isFocused: boolean = await allComponents[i].isFocused();
          if (isFocused) {
            logInfo(`getCurrentFocusIndex: focus found at index ${i}`);
            return i;
          }
        } catch (error) {
          logInfo(`getCurrentFocusIndex: focus query failed at index ${i}`);
        }
      }
      logInfo('getCurrentFocusIndex: no focused component found');
      return -1;
    });
  } catch (error) {
    logError(`getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function tapComponentByText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async (): Promise<boolean> => {
      const components: Component[] = await queryInAppWindow(driver, ON.text(text));
      if (components === null || components === undefined || components.length === 0) {
        logInfo(`tapComponentByText: no component with text ${text}`);
        return false;
      }
      await components[0].click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      logInfo(`tapComponentByText: clicked component with text ${text}`);
      return true;
    });
  } catch (error) {
    logError(`tapComponentByText error: ${error}`);
    return false;
  }
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function pressBackAndWait(driver: Driver): Promise<void> {
  await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_BACKGROUND);
  const gone: boolean = await waitForAppWindowGone(driver, TIMEOUT_ABILITY_LAUNCH);
  logInfo(`pressBackAndWait: app window gone after BACK: ${gone}`);
}

export async function pressHomeAndWait(driver: Driver): Promise<void> {
  await pressAndWait(driver, KEY_HOME, 1, DELAY_AFTER_BACKGROUND);
  const gone: boolean = await waitForAppWindowGone(driver, TIMEOUT_ABILITY_LAUNCH);
  logInfo(`pressHomeAndWait: app window gone after HOME: ${gone}`);
}

export async function waitForAppWindowGone(driver: Driver, maxWaitMs: number = TIMEOUT_ABILITY_LAUNCH): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const rendered: boolean = await isIndexPageRendered(driver);
    if (!rendered) {
      logInfo('waitForAppWindowGone: index page no longer rendered');
      return true;
    }
    await sleepMs(100);
  }
  logInfo('waitForAppWindowGone: index page still rendered after the wait budget');
  return false;
}

export function measureElapsed(startTime: number): number {
  return Date.now() - startTime;
}

export function isWithinBudget(elapsed: number, budget: number): boolean {
  return elapsed <= budget;
}

export function averageOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let sum: number = 0;
  for (let i = 0; i < values.length; i++) {
    sum += values[i];
  }
  return sum / values.length;
}

export function maxOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let max: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] > max) {
      max = values[i];
    }
  }
  return max;
}

export function minOf(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let min: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] < min) {
      min = values[i];
    }
  }
  return min;
}

export function isEmptyString(value: string): boolean {
  return value === undefined || value === null || value.length === 0;
}

export function isNonEmptyString(value: string): boolean {
  return !isEmptyString(value);
}
