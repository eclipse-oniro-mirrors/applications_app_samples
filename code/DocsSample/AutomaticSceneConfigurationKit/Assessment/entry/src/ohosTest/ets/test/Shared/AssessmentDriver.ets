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

import { Component, Driver, ON, On } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';

// The sample under test. The assessment pages belong to the entry ability of the sample,
// the test ability only hosts the hypium runner.
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';

// Component identifiers declared by the assessment pages, they are kept in sync with
// pages/Index.ets and exam/pages/ExamPage.ets of the sample.
export const ID_INDEX_TITLE: string = 'assessment_index_title';
export const ID_BUNDLE_INPUT: string = 'assessment_bundle_input';
export const ID_ADD_BUTTON: string = 'assessment_add_button';
export const ID_BEGIN_BUTTON: string = 'assessment_begin_button';
export const ID_END_BUTTON: string = 'assessment_end_button';
export const ID_QUERY_STATE_BUTTON: string = 'assessment_query_state_button';
export const ID_QUERY_CONFIG_BUTTON: string = 'assessment_query_config_button';
export const ID_EXAM_TITLE: string = 'assessment_exam_title';

// Component types used by the finders, the entry page root is a List.
export const TYPE_LIST: string = 'List';
export const TYPE_TEXT: string = 'Text';
export const TYPE_BUTTON: string = 'Button';
export const TYPE_TEXT_INPUT: string = 'TextInput';

// Texts that are rendered by the assessment pages, they are the reliable completion signal
// of a page transition because the ids of off-screen list items are not created at all.
export const TEXT_STATE_ACTIVE: string = 'Assessment state: active';
export const TEXT_STATE_INACTIVE: string = 'Assessment state: inactive';
export const TEXT_WHITELIST_EMPTY: string = 'The whitelist is empty';
export const TEXT_NO_ACTIVE_ASSESSMENT: string = 'No active assessment';
export const TEXT_NO_EVENT: string = 'No event yet';
export const TEXT_REMOVE_BUTTON: string = 'Remove';
export const TEXT_DIALOG_CONFIRM: string = 'OK';
export const TEXT_EXAM_PREVIOUS: string = 'Previous';
export const TEXT_EXAM_NEXT: string = 'Next';
export const TEXT_EXAM_SUBMIT: string = 'Submit';

// Keys used to drive the assessment pages. The values are the standard OpenHarmony key codes.
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_TAB: number = 4;
export const KEY_ESCAPE: number = 1;

// Timing thresholds. The assessment pages rebuild their state on every AppStorage update,
// so every observation is retried until the expected event shows up instead of sleeping a
// fixed amount of time.
export const TIMEOUT_PAGE_RENDER: number = 1500;
export const TIMEOUT_PAGE_TRANSITION: number = 3000;
export const TIMEOUT_DIALOG_RENDER: number = 1000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_ACTION: number = 300;

// Tolerances. The component count of a List changes when an item scrolls in or out of the
// viewport, so the count is only compared with a tolerance rather than with equality.
export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;

// Retry parameters of the event driven waits.
export const RETRY_INTERVAL_MS: number = 100;
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 3;

// Rounds of the stress cases, they are shared so that every suite stresses the same way.
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Bundle names used by the whitelist cases. They are not installed, the sample only keeps
// them in the AssessmentConfig and never resolves them.
export const TEST_BUNDLE_PRIMARY: string = 'com.samples.assessment';
export const TEST_BUNDLE_SECONDARY: string = 'com.samples.dictionary';
export const TEST_BUNDLE_TERTIARY: string = 'com.samples.reader';
export const TEST_BUNDLE_INVALID: string = 'not-a-bundle-name';

let driverInstance: Driver | null = null;
let uiOperationQueue: Promise<void> = Promise.resolve();
let queueLocked: boolean = false;

/**
 * Serializes a UI operation.
 *
 * The UiTest APIs must not be entered concurrently, a findComponents call that runs while a
 * delayMs call of another case is in flight fails with a driver busy error. Every helper of
 * this file therefore runs through the same promise chain.
 *
 * @param action operation to run exclusively.
 * @returns the value produced by the operation.
 */
const UI_OP_SETTLE_MS: number = 100;
const UI_CONCURRENT_RETRY_MAX: number = 6;
const UI_CONCURRENT_RETRY_MS: number = 500;

const sleepMs = (ms: number): Promise<void> => new Promise<void>((resolve: (value: void) => void) => {
  setTimeout(resolve, ms);
});

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    uiOperationQueue = currentQueue.then(async () => {
      try {
        let lastError: Error = new Error('ui operation not started');
        for (let attempt = 0; attempt <= UI_CONCURRENT_RETRY_MAX; attempt++) {
          try {
            const actionResult: T = await action();
            resolve(actionResult);
            lastError = new Error('');
            break;
          } catch (error) {
            lastError = error instanceof Error ? error : new Error(String(error));
            // The uitest server may still consider the previous op in flight when
            // its client promise resolves; retry until the server settles.
            if (lastError.message.indexOf('concurrently') < 0 || attempt === UI_CONCURRENT_RETRY_MAX) {
              break;
            }
            await sleepMs(UI_CONCURRENT_RETRY_MS);
          }
        }
        if (lastError.message.length > 0) {
          reject(lastError);
          return;
        }
        // Let the uitest server settle before the next queued op starts.
        await sleepMs(UI_OP_SETTLE_MS);
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

/**
 * Waits inside the UI operation queue, so the wait cannot overlap another driver call.
 *
 * @param driver driver of the running case.
 * @param delayMs milliseconds to wait.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/**
 * Triggers a key inside the UI operation queue.
 *
 * @param driver driver of the running case.
 * @param key key code to trigger.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/**
 * Clicks a component inside the UI operation queue.
 *
 * uitest does not allow concurrent calls; component-level operations issued
 * outside the shared queue collide with queued driver operations and abort
 * both. Always route component actions through these wrappers.
 *
 * @param component target component.
 */
export async function clickSerialized(component: Component): Promise<void> {
  await runSerializedUiOperation(async () => {
    await component.click();
  });
}

/**
 * Types text into a component inside the UI operation queue.
 *
 * @param component target input component.
 * @param text text to type.
 */
export async function inputTextSerialized(component: Component, text: string): Promise<void> {
  await runSerializedUiOperation(async () => {
    await component.inputText(text);
  });
}

/**
 * Reads the text of a component inside the UI operation queue.
 *
 * @param component target component.
 * @returns the text of the component, empty when the read fails.
 */
export async function getTextSerialized(component: Component): Promise<string> {
  return await runSerializedUiOperation(async () => {
    try {
      return await component.getText();
    } catch (error) {
      const err: Error = error instanceof Error ? error : new Error(String(error));
      hilog.error(DOMAIN, TAG, 'getTextSerialized error: %{public}s', err.message);
      return '';
    }
  });
}

/**
 * Clicks a screen coordinate inside the UI operation queue.
 *
 * @param driver driver of the running case.
 * @param x x coordinate.
 * @param y y coordinate.
 */
export async function clickPointSerialized(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(Math.round(x), Math.round(y));
  });
}

/**
 * Returns the driver singleton. The driver is created lazily so that a case that fails
 * before the environment is ready does not leave a broken driver behind.
 *
 * @returns the driver singleton.
 */
export function getDriver(): Driver {
  if (driverInstance === null) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

/**
 * Drops the driver singleton, it is used by the suites that need a fresh bind after the
 * sample application has been restarted.
 *
 * @returns the new driver instance.
 */
export function createFreshDriver(): Driver {
  driverInstance = null;
  driverInstance = Driver.create();
  return driverInstance;
}

/**
 * Resets the UI operation queue. The queue must only be reset when no operation is in
 * flight, a running operation would otherwise lose its serialization context.
 */
export function resetDriver(): void {
  uiOperationQueue = Promise.resolve();
  queueLocked = false;
}

/**
 * Reports whether the queue is currently locked by a running operation.
 *
 * @returns true when an operation is in flight.
 */
export function isQueueLocked(): boolean {
  return queueLocked;
}

/**
 * Launches the entry ability of the sample under test.
 *
 * The assessment pages are only meaningful after the entry ability has been started, the
 * test ability itself hosts nothing but the hypium runner.
 *
 * @returns the promise that is resolved after the launch request has been accepted.
 */
export async function launchAssessmentApp(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: ENTRY_ABILITY_NAME
  };
  try {
    await delegator.startAbility(want);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'launchAssessmentApp failed: %{public}s', err.message);
  }
}

/**
 * Finds a component and falls back to scrolling the page list.
 *
 * The entry page is a List, an item that is scrolled out of the viewport has no rendered
 * node and findComponent returns null for it. The List is then scrolled until the target
 * shows up or the list ends.
 *
 * @param driver driver of the running case.
 * @param on finder of the target component.
 * @returns the component, or null when it cannot be found.
 */
export async function findComponent(driver: Driver, on: On): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      const target: Component | null = await driver.findComponent(on);
      if (target !== null) {
        return target;
      }
      const pageList: Component | null = await driver.findComponent(ON.type(TYPE_LIST));
      if (pageList === null) {
        hilog.warn(DOMAIN, TAG, 'findComponent: the page list is not found');
        return null;
      }
      try {
        return await pageList.scrollSearch(on);
      } catch (error) {
        const err: Error = error instanceof Error ? error : new Error(String(error));
        hilog.warn(DOMAIN, TAG, 'findComponent: scrollSearch failed: %{public}s', err.message);
        return null;
      }
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'findComponent error: %{public}s', err.message);
    return null;
  }
}

/**
 * Finds a component by identifier.
 *
 * @param driver driver of the running case.
 * @param id identifier declared by the page.
 * @returns the component, or null when it cannot be found.
 */
export async function findById(driver: Driver, id: string): Promise<Component | null> {
  return await findComponent(driver, ON.id(id));
}

/**
 * Finds every component of a type.
 *
 * @param driver driver of the running case.
 * @param type component type, for example Text or Button.
 * @returns the components, an empty array when none is rendered.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] | null = await driver.findComponents(ON.type(type));
      return components ?? [];
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'findComponentsByType error: %{public}s', err.message);
    return [];
  }
}

/**
 * Counts the rendered components of the page, it is the coarse stability signal of the
 * assessment pages.
 *
 * @param driver driver of the running case.
 * @returns the number of rendered components, 0 when the lookup fails.
 */
export async function indexComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] | null = await driver.findComponents(ON.type('*'));
      const count: number = all === null ? 0 : all.length;
      hilog.info(DOMAIN, TAG, 'indexComponentCount: %{public}d components', count);
      if (count > 0) {
        return count;
      }
      const texts: Component[] = await driver.findComponents(ON.type(TYPE_TEXT)) ?? [];
      const buttons: Component[] = await driver.findComponents(ON.type(TYPE_BUTTON)) ?? [];
      const fallback: number = Math.max(texts.length, buttons.length);
      hilog.info(DOMAIN, TAG, 'indexComponentCount: fallback count %{public}d', fallback);
      return fallback;
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'indexComponentCount error: %{public}s', err.message);
    return 0;
  }
}

/**
 * Checks whether an exact text is rendered by the current page.
 *
 * @param driver driver of the running case.
 * @param expectedText text to look for.
 * @returns true when a Text component carries the expected text.
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type(TYPE_TEXT)) ?? [];
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content === expectedText) {
            hilog.info(DOMAIN, TAG, 'checkTextContent: matched %{public}s', expectedText);
            return true;
          }
        } catch (error) {
          // A single component may drop out of the tree while the list is scrolling, the
          // remaining components are still worth checking.
        }
      }
      hilog.info(DOMAIN, TAG, 'checkTextContent: no match for %{public}s', expectedText);
      return false;
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'checkTextContent error: %{public}s', err.message);
    return false;
  }
}

/**
 * Checks whether a text fragment is contained in any rendered Text component.
 *
 * @param driver driver of the running case.
 * @param fragment fragment to look for.
 * @returns true when a component contains the fragment.
 */
export async function containsTextFragment(driver: Driver, fragment: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type(TYPE_TEXT)) ?? [];
      for (let i = 0; i < texts.length; i++) {
        try {
          const content: string = await texts[i].getText();
          if (content.includes(fragment)) {
            return true;
          }
        } catch (error) {
          // Skip the component and continue with the next one.
        }
      }
      return false;
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'containsTextFragment error: %{public}s', err.message);
    return false;
  }
}

/**
 * Collects the texts of every rendered Text component.
 *
 * @param driver driver of the running case.
 * @returns the texts, the entries of components that fail to answer are skipped.
 */
export async function collectTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type(TYPE_TEXT)) ?? [];
      const values: string[] = [];
      for (let i = 0; i < texts.length; i++) {
        try {
          values.push(await texts[i].getText());
        } catch (error) {
          // Skip the component that dropped out of the tree.
        }
      }
      return values;
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'collectTexts error: %{public}s', err.message);
    return [];
  }
}

/**
 * Waits until the entry page of the sample is rendered.
 *
 * @param driver driver of the running case.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the entry page title showed up.
 */
export async function waitForIndexPage(driver: Driver, timeoutMs: number = TIMEOUT_PAGE_TRANSITION): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const title: Component | null = await findById(driver, ID_INDEX_TITLE);
    if (title !== null) {
      hilog.info(DOMAIN, TAG, 'waitForIndexPage: entry page rendered');
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  hilog.warn(DOMAIN, TAG, 'waitForIndexPage: entry page not rendered in %{public}d ms', timeoutMs);
  return false;
}

/**
 * Waits until the exam page of the sample is rendered.
 *
 * @param driver driver of the running case.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the exam page title showed up.
 */
export async function waitForExamPage(driver: Driver, timeoutMs: number = TIMEOUT_PAGE_TRANSITION): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const title: Component | null = await findById(driver, ID_EXAM_TITLE);
    if (title !== null) {
      hilog.info(DOMAIN, TAG, 'waitForExamPage: exam page rendered');
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  hilog.warn(DOMAIN, TAG, 'waitForExamPage: exam page not rendered in %{public}d ms', timeoutMs);
  return false;
}

/**
 * Waits until the component count of the entry page stops changing.
 *
 * @param driver driver of the running case.
 * @param rounds number of consecutive stable observations that are required.
 * @param tolerance allowed difference between two consecutive observations.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the count stabilized.
 */
export async function waitForStableIndex(driver: Driver, rounds: number = STABLE_ROUNDS,
  tolerance: number = STABLE_TOLERANCE, timeoutMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  let previousCount: number = await indexComponentCount(driver);
  let stableRounds: number = 0;
  while (Date.now() < deadline) {
    await serializedDelay(driver, RETRY_INTERVAL_MS);
    const currentCount: number = await indexComponentCount(driver);
    if (Math.abs(currentCount - previousCount) <= tolerance) {
      stableRounds++;
      if (stableRounds >= rounds) {
        hilog.info(DOMAIN, TAG, 'waitForStableIndex: stable at %{public}d components', currentCount);
        return true;
      }
    } else {
      stableRounds = 0;
    }
    previousCount = currentCount;
  }
  hilog.warn(DOMAIN, TAG, 'waitForStableIndex: not stable within %{public}d ms', timeoutMs);
  return false;
}

/**
 * Checks whether the assessment state card reports the active state.
 *
 * @param driver driver of the running case.
 * @returns true when the active state text is rendered.
 */
export async function isAssessmentActive(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, TEXT_STATE_ACTIVE);
}

/**
 * Checks whether the assessment state card reports the inactive state.
 *
 * @param driver driver of the running case.
 * @returns true when the inactive state text is rendered.
 */
export async function isAssessmentInactive(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, TEXT_STATE_INACTIVE);
}

/**
 * Reads the enabled state of a component.
 *
 * @param component component to inspect.
 * @returns true when the component accepts input, false when it is missing or disabled.
 */
export async function isComponentEnabled(component: Component | null): Promise<boolean> {
  if (component === null) {
    return false;
  }
  try {
    return await component.isEnabled();
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'isComponentEnabled error: %{public}s', err.message);
    return false;
  }
}

/**
 * Clicks a component when it is present.
 *
 * @param component component to click.
 * @returns true when the click was delivered.
 */
export async function clickComponent(component: Component | null): Promise<boolean> {
  if (component === null) {
    hilog.warn(DOMAIN, TAG, 'clickComponent: the component is absent');
    return false;
  }
  try {
    await clickSerialized(component);
    return true;
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'clickComponent error: %{public}s', err.message);
    return false;
  }
}

/**
 * Types a bundle name into the whitelist input of the entry page.
 *
 * @param driver driver of the running case.
 * @param bundleName bundle name to type.
 * @returns true when the text was delivered.
 */
export async function typeBundleName(driver: Driver, bundleName: string): Promise<boolean> {
  const input: Component | null = await findById(driver, ID_BUNDLE_INPUT);
  if (input === null) {
    hilog.warn(DOMAIN, TAG, 'typeBundleName: the input box is absent');
    return false;
  }
  try {
    await inputTextSerialized(input, bundleName);
    await serializedDelay(driver, DELAY_AFTER_ACTION);
    return true;
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'typeBundleName error: %{public}s', err.message);
    return false;
  }
}

/**
 * Dismisses the soft keyboard raised by the whitelist input.
 *
 * The keyboard shrinks the ability window, which pushes the cards below the input out of
 * the List viewport, so it is closed before any further component is looked up. When the
 * Back key already left the page, the entry ability is brought back to the foreground.
 *
 * @param driver driver of the running case.
 * @returns true when the page is in the foreground afterwards.
 */
export async function hideSoftKeyboard(driver: Driver): Promise<boolean> {
  await triggerSerializedKey(driver, KEY_BACK);
  await serializedDelay(driver, DELAY_AFTER_ACTION);
  const title: Component | null = await findById(driver, ID_INDEX_TITLE);
  if (title !== null) {
    return true;
  }
  hilog.warn(DOMAIN, TAG, 'hideSoftKeyboard: the entry page is left, restart the ability');
  await launchAssessmentApp();
  return await waitForIndexPage(driver);
}

/**
 * Adds a bundle name to the whitelist through the entry page.
 *
 * @param driver driver of the running case.
 * @param bundleName bundle name to add.
 * @returns true when the add button was clicked.
 */
export async function addAllowedApp(driver: Driver, bundleName: string): Promise<boolean> {
  const typed: boolean = await typeBundleName(driver, bundleName);
  if (!typed) {
    return false;
  }
  await hideSoftKeyboard(driver);
  const addButton: Component | null = await findById(driver, ID_ADD_BUTTON);
  const clicked: boolean = await clickComponent(addButton);
  await serializedDelay(driver, DELAY_AFTER_ACTION);
  return clicked;
}

/**
 * Counts the remove buttons of the whitelist, every whitelist entry carries exactly one.
 *
 * @param driver driver of the running case.
 * @returns the number of remove buttons that are rendered.
 */
export async function allowedAppRowCount(driver: Driver): Promise<number> {
  const buttons: Component[] = await findComponentsByType(driver, TYPE_BUTTON);
  let count: number = 0;
  for (let i = 0; i < buttons.length; i++) {
    try {
      const text: string = await buttons[i].getText();
      if (text === TEXT_REMOVE_BUTTON) {
        count++;
      }
    } catch (error) {
      // Skip the component that dropped out of the tree while the list was scrolled.
    }
  }
  hilog.info(DOMAIN, TAG, 'allowedAppRowCount: %{public}d rows', count);
  return count;
}

/**
 * Removes the first whitelist entry through the entry page.
 *
 * @param driver driver of the running case.
 * @returns true when a remove button was clicked.
 */
export async function removeFirstAllowedApp(driver: Driver): Promise<boolean> {
  const buttons: Component[] = await findComponentsByType(driver, TYPE_BUTTON);
  for (let i = 0; i < buttons.length; i++) {
    try {
      const text: string = await buttons[i].getText();
      if (text === TEXT_REMOVE_BUTTON) {
        await buttons[i].click();
        await serializedDelay(driver, DELAY_AFTER_ACTION);
        return true;
      }
    } catch (error) {
      // Continue with the next button.
    }
  }
  hilog.warn(DOMAIN, TAG, 'removeFirstAllowedApp: no remove button is rendered');
  return false;
}

/**
 * Clicks a navigation button of the entry page by its identifier.
 *
 * @param driver driver of the running case.
 * @param id identifier of the button.
 * @returns true when the click was delivered.
 */
export async function clickIndexButton(driver: Driver, id: string): Promise<boolean> {
  const button: Component | null = await findById(driver, id);
  const clicked: boolean = await clickComponent(button);
  await serializedDelay(driver, DELAY_AFTER_ACTION);
  return clicked;
}

/**
 * Reads whether an alert dialog of the sample is displayed.
 *
 * The exam page shows an alert dialog when the assessment is interrupted or ends, the
 * confirm button of the dialog carries the OK text.
 *
 * @param driver driver of the running case.
 * @returns true when the confirm button is rendered.
 */
export async function isAlertDialogVisible(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, TEXT_DIALOG_CONFIRM);
}

/**
 * Waits until an alert dialog of the sample is displayed.
 *
 * @param driver driver of the running case.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the dialog showed up.
 */
export async function waitForAlertDialog(driver: Driver,
  timeoutMs: number = TIMEOUT_DIALOG_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await isAlertDialogVisible(driver)) {
      hilog.info(DOMAIN, TAG, 'waitForAlertDialog: dialog rendered');
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  hilog.warn(DOMAIN, TAG, 'waitForAlertDialog: dialog not rendered in %{public}d ms', timeoutMs);
  return false;
}

/**
 * Triggers a key several times and waits after every trigger.
 *
 * @param driver driver of the running case.
 * @param key key code to trigger.
 * @param times number of triggers.
 * @param delayMs wait after every trigger.
 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/**
 * Returns the index of the focused component.
 *
 * ON.focused(true) is unreliable on some images, so the components are enumerated and the
 * focus is read one by one.
 *
 * @param driver driver of the running case.
 * @returns the focus index, -1 when no component holds the focus.
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] | null = await driver.findComponents(ON.type('*'));
      if (all === null || all.length === 0) {
        return -1;
      }
      for (let i = 0; i < all.length; i++) {
        try {
          if (await all[i].isFocused()) {
            hilog.info(DOMAIN, TAG, 'getCurrentFocusIndex: focus at %{public}d', i);
            return i;
          }
        } catch (error) {
          // Continue with the next component.
        }
      }
      return -1;
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'getCurrentFocusIndex error: %{public}s', err.message);
    return -1;
  }
}

/**
 * Checks whether the focus sits on the expected component index.
 *
 * @param driver driver of the running case.
 * @param expectedFocusedIndex expected index, -1 only checks that some component is focused.
 * @returns true when the focus matches the expectation before the timeout expires.
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    const currentIndex: number = await getCurrentFocusIndex(driver);
    if (expectedFocusedIndex === -1) {
      if (currentIndex >= 0) {
        return true;
      }
    } else if (currentIndex === expectedFocusedIndex) {
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  return false;
}

/**
 * Counts how often each text is rendered, it is used to verify that a page does not render
 * duplicated entries after repeated operations.
 *
 * @param driver driver of the running case.
 * @returns the text to occurrence count mapping.
 */
export async function textFrequency(driver: Driver): Promise<Map<string, number>> {
  const values: string[] = await collectTexts(driver);
  const frequency: Map<string, number> = new Map<string, number>();
  for (let i = 0; i < values.length; i++) {
    const key: string = values[i];
    const current: number = frequency.get(key) ?? 0;
    frequency.set(key, current + 1);
  }
  return frequency;
}

/**
 * Measures the elapsed time of an action.
 *
 * @param action action to measure.
 * @returns the elapsed milliseconds, the action result itself is dropped.
 */
export async function measureActionMs(action: () => Promise<void>): Promise<number> {
  const start: number = Date.now();
  try {
    await action();
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'measureActionMs: action failed: %{public}s', err.message);
  }
  return Date.now() - start;
}

/**
 * Waits for a condition inside the UI queue.
 *
 * @param driver driver of the running case.
 * @param condition condition to evaluate, it is polled until it returns true.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the condition became true.
 */
export async function waitUntil(driver: Driver, condition: () => Promise<boolean>,
  timeoutMs: number = TIMEOUT_PAGE_TRANSITION): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await condition()) {
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  return false;
}
