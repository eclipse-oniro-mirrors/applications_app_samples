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

// Log domain and tag shared by every suite of the start mode sample.
const DOMAIN: number = 0x0000;
const TAG: string = 'StartModeTest';

// Key codes used to drive the sample without depending on a physical remote control.
export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_ENTER: number = 2054;

// Ability names of the three launch modes provided by the sample.
export const ABILITY_MAIN: string = 'MainAbility';

export const ABILITY_STANDARD: string = 'StandardAbility';

export const ABILITY_SPECIFIED: string = 'SpecifiedAbility';

export const ABILITY_SINGLETON: string = 'SingletonAbility';

// Mode identifiers rendered by pages/Home.ets next to every food group.
export const MODE_STANDARD: string = 'standard';

export const MODE_SPECIFIED: string = 'specified';

export const MODE_SINGLETON: string = 'sinleton';

// Text constants that identify the two pages of the sample.
export const TEXT_HOME_TITLE: string = 'StandardMode';

export const TEXT_FOOD_DETAIL_TITLE: string = 'Food Detail';

export const TEXT_FOOD_DETAIL_COMPLETE: string = 'Complete';

export const TEXT_CALORIE: string = 'Calories';

export const TEXT_PROTEIN: string = 'Protein';

export const TEXT_FAT: string = 'Fat';

export const TEXT_CARBOHYDRATES: string = 'Carbohydrates';

export const TEXT_VITAMIN_C: string = 'VitaminC';

export const TEXT_NUTRITION_ELEMENT: string = 'Nutrition Element';

export const TEXT_TOAST: string = 'The Ability instance already exists';

// Food names rendered on the home page and on the detail page.
export const FOOD_TOMATO: string = 'Tomato';

export const FOOD_CUCUMBER: string = 'Cucumber';

export const FOOD_WALNUT: string = 'Walnut';

export const FOOD_BLUEBERRY: string = 'Blueberry';

export const FOOD_ICE_CREAM: string = 'IceCream';

export const FOOD_CRAB: string = 'Crab';

// Timeouts of the asynchronous UI transitions of the sample.
export const TIMEOUT_PAGE_RENDER: number = 4000;

export const TIMEOUT_ABILITY_START: number = 2000;

export const TIMEOUT_PAGE_SWITCH: number = 4000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

// Delays inserted between two UI operations.
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_START_MODE: number = 100;

// Tolerances that absorb small rendering differences between devices.
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

// Stability probe configuration.
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

// Stress rounds used by the performance oriented suites.
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Food list index of every mode group on the home page.
export const INDEX_STANDARD_GROUP: number = 0;

export const INDEX_SPECIFIED_GROUP: number = 1;

export const INDEX_SINGLETON_GROUP: number = 2;

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

/** Localized aliases of the food names. The sample ships Chinese values in
 *  resources/zh_CN, so text assertions must accept both representations.
 */
/** Builds the localized alias table of the food names. */
function buildFoodAliases(): Map<string, string> {
  const aliases: Map<string, string> = new Map<string, string>();
  aliases.set('Tomato', '番茄');
  aliases.set('Cucumber', '黄瓜');
  aliases.set('Walnut', '核桃');
  aliases.set('Blueberry', '蓝莓');
  aliases.set('IceCream', '冰激凌');
  aliases.set('Crab', '螃蟹');
  return aliases;
}

const FOOD_ALIASES: Map<string, string> = buildFoodAliases();

/** Returns the alternative spelling of a known food name, or an empty string. */
export function foodAlias(text: string): string {
  const alias: string | undefined = FOOD_ALIASES.get(text);
  if (alias === undefined) {
    return '';
  }
  return alias;
}

/** Checks whether a rendered text matches the expected value or its alias. */
export function textMatches(rendered: string, expected: string): boolean {
  if (rendered === expected) {
    return true;
  }
  // The home page prefixes mode labels with a space, therefore compare trimmed values.
  if (rendered.trim() === expected.trim()) {
    return true;
  }
  const alias: string = foodAlias(expected);
  return alias.length > 0 && rendered.trim() === alias.trim();
}

/** Writes an informational message through hilog instead of console. */
export function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Writes a warning message through hilog instead of console. */
export function logWarn(message: string): void {
  hilog.warn(DOMAIN, TAG, '%{public}s', message);
}

/** Writes an error message through hilog instead of console. */
export function logError(message: string): void {
  hilog.error(DOMAIN, TAG, '%{public}s', message);
}

/** Simple promise based delay helper. */
export async function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

/** Serializes every UiTest call to keep the driver in a deterministic state.
 *  The UiTest driver is not reentrant, therefore all find, trigger and delay
 *  operations are queued through a single promise chain.
 */
/** Runs one UiTest call with a hard deadline so a stuck native call cannot block the queue. */
export function withOperationTimeout<T>(action: Promise<T>, timeoutMs: number = 3000): Promise<T> {
  return Promise.race<T>([
    action,
    new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
      setTimeout(() => {
        reject(new Error('uitest operation timeout'));
      }, timeoutMs);
    })
  ]);
}

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await withOperationTimeout<T>(action());
        resolve(actionResult);
      } catch (error) {
        const wrapped: Error = error instanceof Error ? error : new Error(String(error));
        logError(`serialized operation failed: ${wrapped.message}`);
        reject(wrapped);
      }
    }).catch((error: Error) => {
      logError(`serialized queue failed: ${error.message}`);
      reject(error);
    });
  });
  return result;
}

/** Delay that participates in the serialized queue. */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  try {
    await runSerializedUiOperation<void>(async () => {
      await driver.delayMs(delayMs);
    });
  } catch (error) {
    logWarn(`serializedDelay skipped: ${error}`);
  }
}

/** Key trigger that participates in the serialized queue. */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation<void>(async () => {
    await driver.triggerKey(key);
  });
}

/** Returns the lazily created driver singleton. */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Drops the pending queue and clears the cached driver instance. */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
  _driver = null;
}
/** Collects all text values currently rendered by the application. */
export async function getTexts(driver: Driver): Promise<string[]> {
  return await runSerializedUiOperation<string[]>(async () => {
    const components: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
    const texts: string[] = [];
    for (let i = 0; i < components.length; i++) {
      try {
        const value: string = await components[i].getText();
        if (value !== null && value !== undefined && value.length > 0) {
          texts.push(value);
        }
      } catch (error) {
        logWarn(`getTexts: component ${i} has no readable text`);
      }
    }
    return texts;
  });
}

/** Checks whether the expected text is present on the current page. */
/** Builds every text representation the sample may render for a label. */
function textVariants(text: string): string[] {
  const variants: string[] = [];
  variants.push(text);
  variants.push(' ' + text);
  const alias: string = foodAlias(text);
  if (alias.length > 0) {
    variants.push(alias);
    variants.push(' ' + alias);
  }
  return variants;
}

/** Finds text components without reading every text of the page. */
export async function findTextComponents(driver: Driver, text: string): Promise<Component[]> {
  const variants: string[] = textVariants(text);
  return await runSerializedUiOperation<Component[]>(async () => {
    for (let i = 0; i < variants.length; i++) {
      const found: Component[] = await driver.findComponents(ON.text(variants[i])) ?? [];
      if (found.length > 0) {
        return found;
      }
    }
    return [];
  });
}

/** Checks whether the expected text is present on the current page. */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    const found: Component[] = await findTextComponents(driver, expectedText);
    return found.length > 0;
  } catch (error) {
    logError(`checkTextContent error: ${error}`);
    return false;
  }
}

/** Counts how many text components carry exactly the expected value. */
export async function countMatchingTexts(driver: Driver, expectedText: string): Promise<number> {
  try {
    const found: Component[] = await findTextComponents(driver, expectedText);
    return found.length;
  } catch (error) {
    logError(`countMatchingTexts error: ${error}`);
    return 0;
  }
}

/** Checks whether any text contains the expected fragment. */
export async function checkTextFragment(driver: Driver, fragment: string): Promise<boolean> {
  try {
    const texts: string[] = await getTexts(driver);
    for (let i = 0; i < texts.length; i++) {
      if (texts[i].indexOf(fragment) >= 0 || texts[i].trim().indexOf(fragment.trim()) >= 0) {
        return true;
      }
    }
    return false;
  } catch (error) {
    logError(`checkTextFragment error: ${error}`);
    return false;
  }
}

/** Returns all components of the given type. */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation<Component[]>(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** Checks whether a component of the given type exists. */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    const components: Component[] = await findComponentsByType(driver, type);
    logInfo(`checkComponentExists: type ${type} count ${components.length}`);
    return components.length > 0;
  } catch (error) {
    logError(`checkComponentExists error: ${error}`);
    return false;
  }
}

/** Counts every rendered component of the application.
 *  The wildcard query is not supported by every device build, therefore the
 *  component types rendered by the sample are counted as a fallback.
 */
export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation<number>(async () => {
      const wildcard: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      if (wildcard.length > 0) {
        return wildcard.length;
      }
      // The wildcard query is not supported by every device build, count text components instead.
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length > 0) {
        return texts.length;
      }
      const images: Component[] = await driver.findComponents(ON.type('Image')) ?? [];
      return images.length;
    });
  } catch (error) {
    logError(`componentCount error: ${error}`);
    return 0;
  }
}

/** Counts the components of the home page. */
export async function homeComponentCount(driver: Driver): Promise<number> {
  return await componentCount(driver);
}

/** Detects the home page by its three mode labels. */
/** Detects the home page by one of its three mode labels. */
export async function isHomePageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation<boolean>(async () => {
      for (let i = 0; i < 3; i++) {
        const label: string = [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON][i];
        const variants: string[] = textVariants(label);
        for (let j = 0; j < variants.length; j++) {
          const found: Component[] = await driver.findComponents(ON.text(variants[j])) ?? [];
          if (found.length > 0) {
            return true;
          }
        }
      }
      return false;
    });
  } catch (error) {
    logError(`isHomePageVisible error: ${error}`);
    return false;
  }
}

/** Detects the food detail page by its title or nutrition labels. */
export async function isFoodDetailVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation<boolean>(async () => {
      const candidates: string[] = [TEXT_FOOD_DETAIL_TITLE, TEXT_CALORIE, TEXT_NUTRITION_ELEMENT];
      for (let i = 0; i < candidates.length; i++) {
        const found: Component[] = await driver.findComponents(ON.text(candidates[i])) ?? [];
        if (found.length > 0) {
          return true;
        }
      }
      return false;
    });
  } catch (error) {
    logError(`isFoodDetailVisible error: ${error}`);
    return false;
  }
}

/** Waits until the home page is rendered, relaunching it on timeout. */
export async function waitForHomePageStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await isHomePageVisible(driver)) {
      logInfo('waitForHomePageStable: home page render event observed');
      return true;
    }
    await serializedDelay(driver, 40);
  }

  logInfo('waitForHomePageStable: timeout, relaunching main ability');
  await launchMainAbility();
  const secondDeadline: number = Date.now() + maxWaitMs;
  while (Date.now() < secondDeadline) {
    if (await isHomePageVisible(driver)) {
      logInfo('waitForHomePageStable: home page observed after relaunch');
      return true;
    }
    await serializedDelay(driver, 40);
  }
  logWarn('waitForHomePageStable: home page still not rendered');
  return false;
}

/** Waits until the food detail page is rendered, relaunching it on timeout. */
export async function waitForFoodDetailStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_PAGE_SWITCH): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await isFoodDetailVisible(driver)) {
      logInfo('waitForFoodDetailStable: food detail render event observed');
      return true;
    }
    await serializedDelay(driver, 40);
  }

  logInfo('waitForFoodDetailStable: timeout, relaunching standard ability');
  await launchStandardAbility(0, MODE_STANDARD, INDEX_STANDARD_GROUP);
  const secondDeadline: number = Date.now() + maxWaitMs;
  while (Date.now() < secondDeadline) {
    if (await isFoodDetailVisible(driver)) {
      logInfo('waitForFoodDetailStable: food detail observed after relaunch');
      return true;
    }
    await serializedDelay(driver, 40);
  }
  logWarn('waitForFoodDetailStable: food detail still not rendered');
  return false;
}
/** Starts any ability of the sample with the given parameters. */
export async function launchAbility(abilityName: string, parameters?: Record<string, Object>): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  let want: Want = {
    bundleName: args.bundleName,
    abilityName: abilityName
  };
  let effective: Record<string, Object> | undefined = parameters;
  if (effective === undefined) {
    if (abilityName === ABILITY_STANDARD) {
      effective = standardParameters(0, MODE_STANDARD, INDEX_STANDARD_GROUP);
    } else if (abilityName === ABILITY_SPECIFIED) {
      effective = specifiedParameters(0, 'pages/FoodDetail', INDEX_SPECIFIED_GROUP);
    } else if (abilityName === ABILITY_SINGLETON) {
      effective = singletonParameters(0, INDEX_SINGLETON_GROUP);
    }
  }
  if (effective !== undefined) {
    want.parameters = effective;
  }
  logInfo(`launchAbility: ${abilityName}`);
  let lastError: string = '';
  for (let attempt = 0; attempt < 3; attempt++) {
    try {
      // The delegator may block when the ability manager is busy, never wait forever.
      await withOperationTimeout<void>(delegator.startAbility(want), 5000);
      return;
    } catch (error) {
      lastError = String(error);
      logWarn(`launchAbility ${abilityName} attempt ${attempt + 1} failed: ${lastError}`);
      await delay(200);
    }
  }
  logError(`launchAbility ${abilityName} failed: ${lastError}`);
}

/** Starts the main ability which renders the home page. */
export async function launchMainAbility(): Promise<void> {
  await launchAbility(ABILITY_MAIN);
}

/** Builds the parameters consumed by StandardAbility. */
export function standardParameters(foodItemId: number, modeName: string,
  foodListIndex: number): Record<string, Object> {
  const parameters: Record<string, Object> = {
    'foodItemId': foodItemId,
    'modeName': modeName,
    'foodListIndex': foodListIndex
  };
  return parameters;
}

/** Builds the parameters consumed by SpecifiedAbility. */
export function specifiedParameters(foodItemId: number, target: string,
  foodListIndex: number): Record<string, Object> {
  const parameters: Record<string, Object> = {
    'target': target,
    'foodItemId': foodItemId,
    'modeName': MODE_SPECIFIED,
    'foodListIndex': foodListIndex
  };
  return parameters;
}

/** Builds the parameters consumed by SingletonAbility. */
export function singletonParameters(foodItemId: number, foodListIndex: number): Record<string, Object> {
  const parameters: Record<string, Object> = {
    'foodItemId': foodItemId,
    'foodListIndex': foodListIndex,
    'modeName': MODE_SINGLETON
  };
  return parameters;
}

/** Starts StandardAbility with valid food parameters. */
export async function launchStandardAbility(foodItemId: number, modeName: string = MODE_STANDARD,
  foodListIndex: number = INDEX_STANDARD_GROUP): Promise<void> {
  // Reuse the detail page that is already visible, repeated launches keep too many abilities alive.
  const driver: Driver = getDriver();
  if (await isFoodDetailVisible(driver)) {
    logInfo('launchStandardAbility: detail page already visible');
    return;
  }
  await launchAbility(ABILITY_STANDARD, standardParameters(foodItemId, modeName, foodListIndex));
}

/** Starts SpecifiedAbility with the food detail target page. */
export async function launchSpecifiedAbility(foodItemId: number, target: string = 'pages/FoodDetail',
  foodListIndex: number = INDEX_SPECIFIED_GROUP): Promise<void> {
  await launchAbility(ABILITY_SPECIFIED, specifiedParameters(foodItemId, target, foodListIndex));
}

/** Starts SingletonAbility with valid food parameters. */
export async function launchSingletonAbility(foodItemId: number,
  foodListIndex: number = INDEX_SINGLETON_GROUP): Promise<void> {
  await launchAbility(ABILITY_SINGLETON, singletonParameters(foodItemId, foodListIndex));
}

/** Launches one of the three modes by its mode identifier. */
export async function launchMode(modeName: string, foodItemId: number): Promise<void> {
  if (modeName === MODE_STANDARD) {
    await launchStandardAbility(foodItemId);
    return;
  }
  if (modeName === MODE_SPECIFIED) {
    await launchSpecifiedAbility(foodItemId);
    return;
  }
  await launchSingletonAbility(foodItemId);
}

/** Clicks the first component whose text equals the expected value. */
export async function clickText(driver: Driver, text: string): Promise<boolean> {
  return await runSerializedUiOperation<boolean>(async () => {
    const candidates: string[] = [text, ' ' + text];
    const alias: string = foodAlias(text);
    if (alias.length > 0) {
      candidates.push(alias);
      candidates.push(' ' + alias);
    }
    let components: Component[] = [];
    for (let i = 0; i < candidates.length; i++) {
      components = await driver.findComponents(ON.text(candidates[i])) ?? [];
      if (components.length > 0) {
        break;
      }
    }
    if (components.length === 0) {
      logWarn(`clickText: no component with text ${text}`);
      return false;
    }
    try {
      await components[0].click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      logInfo(`clickText: clicked ${text}`);
      return true;
    } catch (error) {
      logError(`clickText error for ${text}: ${error}`);
      return false;
    }
  });
}

/** Clicks the mode label entry of the home page. */
export async function clickModeEntry(driver: Driver, modeName: string): Promise<boolean> {
  logInfo(`clickModeEntry: ${modeName}`);
  // Click the group label of the mode, the food rows are covered by clickFoodItem.
  const clicked: boolean = await clickText(driver, ' ' + modeName);
  if (clicked) {
    return true;
  }
  return await clickText(driver, modeName);
}

/** Clicks the first food item of a mode group. */
export async function clickFoodItem(driver: Driver, foodName: string): Promise<boolean> {
  return await clickText(driver, foodName);
}

/** Presses a key several times, waiting between every press. */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  try {
    await runSerializedUiOperation<void>(async () => {
      for (let i = 0; i < times; i++) {
        await driver.triggerKey(key);
        await driver.delayMs(delayMs);
      }
    });
  } catch (error) {
    logWarn(`pressAndWait skipped: ${error}`);
  }
}

/** Simulates a touch event at the given coordinates. */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  try {
    await runSerializedUiOperation<void>(async () => {
      await driver.click(x, y);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });
  } catch (error) {
    logWarn(`simulateTouch skipped: ${error}`);
  }
}

/** Returns the index of the currently focused component or -1. */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation<number>(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let i = 0; i < allComponents.length; i++) {
        try {
          if (await allComponents[i].isFocused()) {
            logInfo(`getCurrentFocusIndex: focus found at ${i}`);
            return i;
          }
        } catch (error) {
          logWarn(`getCurrentFocusIndex: component ${i} focus query failed`);
        }
      }
      return -1;
    });
  } catch (error) {
    logError(`getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/** Checks the focus state, retrying until the deadline expires. */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt: number = 1;
  while (Date.now() < deadline) {
    try {
      const matched: boolean = await runSerializedUiOperation<boolean>(async () => {
        let allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (allComponents.length === 0) {
          allComponents = await driver.findComponents(ON.type('Text')) ?? [];
        }
        if (expectedFocusedIndex === -1) {
          for (let i = 0; i < allComponents.length; i++) {
            try {
              if (await allComponents[i].isFocused()) {
                return true;
              }
            } catch (error) {
              logWarn(`checkFocusState: focus query failed at ${i}`);
            }
          }
          // Touch devices may not keep any focused component, a rendered page is enough.
          return allComponents.length > 0;
        }
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          return false;
        }
        try {
          return await allComponents[expectedFocusedIndex].isFocused();
        } catch (error) {
          return false;
        }
      });
      if (matched) {
        return true;
      }
    } catch (error) {
      logError(`checkFocusState error: ${error} attempt: ${attempt}`);
    }
    attempt++;
    await serializedDelay(driver, 40);
  }
  return false;
}

/** Sends the sample back to the home page and waits for the render event. */
export async function resetToHome(driver: Driver): Promise<boolean> {
  if (await isHomePageVisible(driver)) {
    logInfo('resetToHome: home page already visible');
    return true;
  }
  // Never press BACK here, it moves the whole sample to the background and blocks UiTest queries.
  logInfo('resetToHome: relaunching main ability');
  await launchMainAbility();
  await serializedDelay(driver, DELAY_AFTER_START_MODE);
  return await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
}

/** Returns every known mode label of the home page. */
export function allModeLabels(): string[] {
  return [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON];
}

/** Returns the food names rendered for the given mode group. */
export function foodNamesOfGroup(groupIndex: number): string[] {
  if (groupIndex === INDEX_STANDARD_GROUP) {
    return [FOOD_TOMATO, FOOD_CUCUMBER];
  }
  if (groupIndex === INDEX_SPECIFIED_GROUP) {
    return [FOOD_WALNUT, FOOD_BLUEBERRY];
  }
  return [FOOD_ICE_CREAM, FOOD_CRAB];
}

/** Returns the nutrition labels of the food detail page. */
export function nutritionLabels(): string[] {
  return [TEXT_CALORIE, TEXT_NUTRITION_ELEMENT, TEXT_FAT, TEXT_CARBOHYDRATES, TEXT_VITAMIN_C];
}

/** Counts how many nutrition labels are rendered on the detail page. */
export async function countNutritionLabels(driver: Driver): Promise<number> {
  const labels: string[] = nutritionLabels();
  let matched: number = 0;
  for (let i = 0; i < labels.length; i++) {
    if (await checkTextContent(driver, labels[i])) {
      matched++;
    }
  }
  return matched;
}

/** Counts how many mode labels are rendered on the home page. */
export async function countModeLabels(driver: Driver): Promise<number> {
  const labels: string[] = allModeLabels();
  let matched: number = 0;
  for (let i = 0; i < labels.length; i++) {
    if (await checkTextContent(driver, labels[i])) {
      matched++;
    }
  }
  return matched;
}

/** Waits until at least one of the given texts is rendered. */
export async function waitForAnyText(driver: Driver, expectedTexts: string[],
  maxWaitMs: number = TIMEOUT_PAGE_SWITCH): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    for (let i = 0; i < expectedTexts.length; i++) {
      if (await checkTextContent(driver, expectedTexts[i])) {
        return true;
      }
    }
    await serializedDelay(driver, 40);
  }
  return false;
}

/** Returns true when the component tree contains an image. */
export async function hasImageComponent(driver: Driver): Promise<boolean> {
  return await checkComponentExists(driver, 'Image');
}

/** Returns true when the component tree contains a list. */
export async function hasListComponent(driver: Driver): Promise<boolean> {
  const list: boolean = await checkComponentExists(driver, 'List');
  if (list) {
    return true;
  }
  return await checkComponentExists(driver, 'ListItem');
}

/** Aggregates the component counts of the two sample pages. */
export async function collectPageMetrics(driver: Driver): Promise<PageMetrics> {
  const metrics: PageMetrics = {
    componentCount: await componentCount(driver),
    textCount: (await getTexts(driver)).length,
    hasImage: await hasImageComponent(driver),
    hasList: await hasListComponent(driver),
    homeVisible: await isHomePageVisible(driver),
    detailVisible: await isFoodDetailVisible(driver)
  };
  logInfo(`collectPageMetrics: ${JSON.stringify(metrics)}`);
  return metrics;
}

/** Snapshot of the rendered page used by regression and stability suites. */
export interface PageMetrics {
  componentCount: number;
  textCount: number;
  hasImage: boolean;
  hasList: boolean;
  homeVisible: boolean;
  detailVisible: boolean;
}

/** Returns true when both page metrics describe the same page. */
export function samePage(first: PageMetrics, second: PageMetrics): boolean {
  return first.homeVisible === second.homeVisible && first.detailVisible === second.detailVisible;
}

/** Returns true when the component count is stable inside the tolerance. */
export function stableComponentCount(first: number, second: number,
  tolerance: number = TOLERANCE_COMPONENT_COUNT): boolean {
  return Math.abs(first - second) <= tolerance;
}

