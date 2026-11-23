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
import window from '@ohos.window';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';

// The sample under test. The contacts page belongs to the entry ability of the sample, the
// test ability only hosts the hypium runner.
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';

// Texts rendered by the entry page of the sample. The sample does not declare component ids,
// so every lookup is anchored on the text that pages/Index.ets renders. The labels are kept in
// sync with the four buttons of the sample.
export const TEXT_PAGE_TITLE: string = 'Contacts Kit (联系人服务)';
export const TEXT_SELECT_BY_PICKER: string = '1.使用Picker选择联系人';
export const TEXT_ADD_BY_PERMISSION: string = '2.联系人管理（受限开放）API添加联系人';
export const TEXT_ADD_BY_PICKER: string = '3.使用picker新建联系人';
export const TEXT_UPDATE_BY_PICKER: string = '4.使用picker更新联系人';
export const TEXT_PERMISSION_ALLOW: string = '允许';
export const TEXT_PERMISSION_DENY: string = '禁止';
export const TEXT_PICKER_CANCEL: string = '取消';
export const TEXT_PICKER_CONFIRM: string = '完成';

// Ordered labels of the four sample buttons. The suites that walk the whole operation card
// iterate this array instead of repeating four lookups.
export const SAMPLE_BUTTON_TEXTS: string[] = [
  TEXT_SELECT_BY_PICKER,
  TEXT_ADD_BY_PERMISSION,
  TEXT_ADD_BY_PICKER,
  TEXT_UPDATE_BY_PICKER
];

// Component types used by the finders.
export const TYPE_TEXT: string = 'Text';
export const TYPE_BUTTON: string = 'Button';
export const TYPE_COLUMN: string = 'Column';
export const TYPE_IMAGE: string = 'Image';

// Keys used to drive the sample. The values are the standard OpenHarmony key codes.
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_TAB: number = 4;
export const KEY_ESCAPE: number = 1;

// Permissions requested by the sample. The values are the documented names of the contacts
// permissions, the sample requests both of them in EntryAbility and again before addContact.
export const PERMISSION_READ_CONTACTS: string = 'ohos.permission.READ_CONTACTS';
export const PERMISSION_WRITE_CONTACTS: string = 'ohos.permission.WRITE_CONTACTS';
export const CONTACTS_PERMISSIONS: string[] = [PERMISSION_READ_CONTACTS, PERMISSION_WRITE_CONTACTS];

// Result codes of abilityAccessCtrl.requestPermissionsFromUser. A zero auth result means the
// user granted the permission, a negative result means the user denied it.
export const AUTH_RESULT_GRANTED: number = 0;
export const AUTH_RESULT_DENIED: number = -1;
export const AUTH_RESULT_INVALID: number = 2;

// Business error codes that the contacts APIs of the sample are documented to throw.
export const ERR_PERMISSION_DENIED: number = 201;
export const ERR_PARAM_INVALID: number = 401;
export const ERR_NOT_SYSTEM_APP: number = 202;
export const ERR_CAPABILITY_NOT_SUPPORT: number = 801;
export const ERR_OPERATION_FAILED: number = 1000;

// Request codes of the system pickers that the sample opens.
export const REQUEST_SELECT_CONTACTS: number = 1;
export const REQUEST_ADD_CONTACT: number = 2;
export const REQUEST_UPDATE_CONTACT: number = 3;

// Timing thresholds. The contacts page rebuilds its layout on every render pass, so every
// observation is retried until the expected event shows up instead of sleeping a fixed amount
// of time.
export const TIMEOUT_PAGE_RENDER: number = 1500;
export const TIMEOUT_PAGE_TRANSITION: number = 3000;
export const TIMEOUT_DIALOG_RENDER: number = 1000;
export const TIMEOUT_PICKER_RENDER: number = 2000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const TIMEOUT_PERMISSION_DIALOG: number = 1000;

// Waits used between the steps of a case.
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_ACTION: number = 300;
export const DELAY_AFTER_PICKER: number = 1000;
export const DELAY_AFTER_PERMISSION: number = 500;

// Tolerances. The component count of the page changes when a dialog or a picker overlays the
// page, so the count is only compared with a tolerance rather than with equality.
export const TOLERANCE_COMPONENT_COUNT: number = 5;
export const TOLERANCE_FOCUS_CHANGE: number = 2;

// Retry parameters of the event driven waits.
export const RETRY_INTERVAL_MS: number = 100;
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 5;

// Rounds of the stress cases, they are shared so that every suite stresses the same way.
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Contact fixtures used by the cases that do not talk to the contacts service. The values are
// never written to the real provider, the model cases only carry them through the sample data
// structures.
export const FIXTURE_FULL_NAME: string = '王小明';
export const FIXTURE_PHONE: string = '13912345678';
export const FIXTURE_SECOND_NAME: string = '李小红';
export const FIXTURE_SECOND_PHONE: string = '13800001111';
export const FIXTURE_EMAIL: string = 'xiaoming.wang@example.com';
export const FIXTURE_ORGANIZATION: string = 'OpenHarmony Samples';

const UI_OP_SETTLE_MS: number = 100;
const UI_CONCURRENT_RETRY_MAX: number = 6;
const UI_CONCURRENT_RETRY_MS: number = 300;

let driverInstance: Driver | null = null;
let uiOperationQueue: Promise<void> = Promise.resolve();
let queueLocked: boolean = false;
let testDisplayWindow: window.Window | undefined = undefined;
let testDisplayWindowId: number = -1;

const sleepMs = (ms: number): Promise<void> => new Promise<void>((resolve: (value: void) => void) => {
  setTimeout(resolve, ms);
});

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
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = uiOperationQueue;
  queueLocked = true;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    uiOperationQueue = currentQueue.then(async () => {
      try {
        let lastError: Error = new Error('ui operation not started');
        let completed: boolean = false;
        for (let attempt = 0; attempt <= UI_CONCURRENT_RETRY_MAX; attempt++) {
          try {
            const actionResult: T = await action();
            resolve(actionResult);
            completed = true;
            lastError = new Error('');
            break;
          } catch (error) {
            lastError = error instanceof Error ? error : new Error(String(error));
            // The uitest server may still consider the previous operation in flight when its
            // client promise resolves, retry until the server settles.
            if (lastError.message.indexOf('concurrently') < 0 || attempt === UI_CONCURRENT_RETRY_MAX) {
              break;
            }
            await sleepMs(UI_CONCURRENT_RETRY_MS);
          }
        }
        if (!completed && lastError.message.length > 0) {
          reject(lastError);
          return;
        }
        // Let the uitest server settle before the next queued operation starts.
        await sleepMs(UI_OP_SETTLE_MS);
      } catch (error) {
        const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMsg);
      } finally {
        queueLocked = false;
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
    await sleepMs(delayMs);
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
 * uitest does not allow concurrent calls, component level operations issued outside the shared
 * queue collide with queued driver operations and abort both. Always route component actions
 * through these wrappers.
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
 * Returns the driver singleton. The driver is created lazily so that a case that fails before
 * the environment is ready does not leave a broken driver behind.
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
 * Drops the driver singleton, it is used by the suites that need a fresh bind after the sample
 * application has been restarted.
 *
 * @returns the new driver instance.
 */
export function createFreshDriver(): Driver {
  driverInstance = null;
  driverInstance = Driver.create();
  return driverInstance;
}

/**
 * Resets the UI operation queue. The queue must only be reset when no operation is in flight, a
 * running operation would otherwise lose its serialization context.
 */
export function resetDriver(): void {
  uiOperationQueue = Promise.resolve();
  queueLocked = false;
}

/**
 * Launches the entry ability of the sample under test.
 *
 * The contacts page is only meaningful after the entry ability has been started, the test
 * ability itself hosts nothing but the hypium runner.
 *
 * @returns the promise that is resolved after the launch request has been accepted.
 */
export async function launchContactsApp(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: ENTRY_ABILITY_NAME
  };
  try {
    await runSerializedUiOperation(async () => {
      const driver: Driver = getDriver();
      await driver.wakeUpDisplay();
      const unlockHints: Component[] = await driver.findComponents(ON.text('上滑解锁')) ?? [];
      if (unlockHints.length > 0) {
        const size = await driver.getDisplaySize();
        await driver.swipe(size.x / 2, size.y * 3 / 4, size.x / 2, size.y / 4, 1000);
      }
    });
    await delegator.startAbility(want);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'launchContactsApp failed: %{public}s', err.message);
  }
}

// Back navigation can destroy EntryAbility. Keep each replacement window awake as well.
async function keepContactsPageAwake(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const ability = await delegator.getCurrentTopAbility();
  const currentWindow: window.Window = await window.getLastWindow(ability.context);
  const currentWindowId: number = currentWindow.getWindowProperties().id;
  if (testDisplayWindowId === currentWindowId) {
    return;
  }
  await currentWindow.setWindowKeepScreenOn(true);
  testDisplayWindow = currentWindow;
  testDisplayWindowId = currentWindowId;
}

export async function releaseContactsTestDisplay(): Promise<void> {
  const currentWindow: window.Window | undefined = testDisplayWindow;
  testDisplayWindow = undefined;
  testDisplayWindowId = -1;
  if (currentWindow !== undefined) {
    try {
      await currentWindow.setWindowKeepScreenOn(false);
    } catch (error) {
      hilog.info(DOMAIN, TAG, 'Test window already released: %{public}s', String(error));
    }
  }
}

/**
 * Finds a component inside the UI queue.
 *
 * @param driver driver of the running case.
 * @param on finder of the target component.
 * @returns the component, or null when it cannot be found.
 */
export async function findComponent(driver: Driver, on: On): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      return await driver.findComponent(on);
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
  return await runSerializedUiOperation(async () => {
    return await driver.findComponent(ON.id(id));
  });
}

/**
 * Finds a component by its exact text.
 *
 * The sample does not declare component ids, the four operation buttons and the page title are
 * therefore located through their text.
 *
 * @param driver driver of the running case.
 * @param text text rendered by the target component.
 * @returns the component, or null when it cannot be found.
 */
export async function findByText(driver: Driver, text: string): Promise<Component | null> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponent(ON.text(text));
  });
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
 * Counts the rendered components of the page, it is the coarse stability signal of the sample.
 *
 * @param driver driver of the running case.
 * @returns the number of rendered components, 0 when the lookup fails.
 */
export async function contactPageComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] | null = await driver.findComponents(ON.type('*'));
      const count: number = all === null ? 0 : all.length;
      hilog.info(DOMAIN, TAG, 'contactPageComponentCount: %{public}d components', count);
      if (count > 0) {
        return count;
      }
      const texts: Component[] = await driver.findComponents(ON.type(TYPE_TEXT)) ?? [];
      const buttons: Component[] = await driver.findComponents(ON.type(TYPE_BUTTON)) ?? [];
      const fallback: number = Math.max(texts.length, buttons.length);
      hilog.info(DOMAIN, TAG, 'contactPageComponentCount: fallback count %{public}d', fallback);
      return fallback;
    });
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.error(DOMAIN, TAG, 'contactPageComponentCount error: %{public}s', err.message);
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
          // A single component may drop out of the tree while the page is rebuilt, the
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
 * Counts the rendered buttons that carry one of the sample labels.
 *
 * @param driver driver of the running case.
 * @returns the number of sample buttons that are rendered.
 */
export async function sampleButtonCount(driver: Driver): Promise<number> {
  const buttons: Component[] = await findComponentsByType(driver, TYPE_BUTTON);
  let count: number = 0;
  for (let i = 0; i < buttons.length; i++) {
    try {
      const text: string = await buttons[i].getText();
      if (SAMPLE_BUTTON_TEXTS.indexOf(text) >= 0) {
        count++;
      }
    } catch (error) {
      // Skip the component that dropped out of the tree.
    }
  }
  hilog.info(DOMAIN, TAG, 'sampleButtonCount: %{public}d buttons', count);
  return count;
}

/**
 * Waits until the contacts page of the sample is rendered.
 *
 * @param driver driver of the running case.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the page title showed up.
 */
export async function waitForContactsPage(driver: Driver,
  timeoutMs: number = TIMEOUT_PAGE_TRANSITION): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await acceptPermissionDialog(driver)) {
      continue;
    }
    const title: Component | null = await findByText(driver, TEXT_PAGE_TITLE);
    if (title !== null) {
      await keepContactsPageAwake();
      hilog.info(DOMAIN, TAG, 'waitForContactsPage: entry page rendered');
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  hilog.warn(DOMAIN, TAG, 'waitForContactsPage: entry page not rendered in %{public}d ms', timeoutMs);
  return false;
}

/**
 * Brings the sample back to the foreground when a picker or another dialog took it away.
 *
 * @param driver driver of the running case.
 * @param maxAttempts number of relaunch attempts.
 * @returns true when the contacts page is rendered afterwards.
 */
export async function ensureContactsPage(driver: Driver, maxAttempts: number = 2): Promise<boolean> {
  if (await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER)) {
    return true;
  }
  for (let attempt = 0; attempt < maxAttempts; attempt++) {
    hilog.info(DOMAIN, TAG, 'ensureContactsPage: relaunching the sample, attempt %{public}d', attempt + 1);
    await triggerSerializedKey(driver, KEY_BACK);
    await serializedDelay(driver, DELAY_AFTER_ACTION);
    await launchContactsApp();
    if (await waitForContactsPage(driver, TIMEOUT_PAGE_TRANSITION)) {
      return true;
    }
  }
  return false;
}

/**
 * Waits until the component count of the page stops changing.
 *
 * @param driver driver of the running case.
 * @param rounds number of consecutive stable observations that are required.
 * @param tolerance allowed difference between two consecutive observations.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the count stabilized.
 */
export async function waitForStableContactPage(driver: Driver, rounds: number = STABLE_ROUNDS,
  tolerance: number = STABLE_TOLERANCE, timeoutMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  let previousCount: number = await contactPageComponentCount(driver);
  let stableRounds: number = 0;
  while (Date.now() < deadline) {
    await serializedDelay(driver, RETRY_INTERVAL_MS);
    const currentCount: number = await contactPageComponentCount(driver);
    if (Math.abs(currentCount - previousCount) <= tolerance) {
      stableRounds++;
      if (stableRounds >= rounds) {
        hilog.info(DOMAIN, TAG, 'waitForStableContactPage: stable at %{public}d components', currentCount);
        return true;
      }
    } else {
      stableRounds = 0;
    }
    previousCount = currentCount;
  }
  hilog.warn(DOMAIN, TAG, 'waitForStableContactPage: not stable within %{public}d ms', timeoutMs);
  return false;
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
 * Clicks one of the four operation buttons of the sample by its label.
 *
 * @param driver driver of the running case.
 * @param buttonText label of the button.
 * @returns true when the click was delivered.
 */
export async function clickSampleButton(driver: Driver, buttonText: string): Promise<boolean> {
  const button: Component | null = await findByText(driver, buttonText);
  const clicked: boolean = await clickComponent(button);
  await serializedDelay(driver, DELAY_AFTER_ACTION);
  return clicked;
}

/**
 * Clicks the sample button at the given index of the operation card.
 *
 * @param driver driver of the running case.
 * @param index zero based index of the button.
 * @returns true when the click was delivered.
 */
export async function clickSampleButtonAt(driver: Driver, index: number): Promise<boolean> {
  if (index < 0 || index >= SAMPLE_BUTTON_TEXTS.length) {
    hilog.warn(DOMAIN, TAG, 'clickSampleButtonAt: index %{public}d is out of range', index);
    return false;
  }
  return await clickSampleButton(driver, SAMPLE_BUTTON_TEXTS[index]);
}

/**
 * Reads whether the permission dialog is displayed.
 *
 * The permission dialog of the sample carries the allow and deny labels, the allow label is the
 * reliable signal because the deny label is also used by other system dialogs.
 *
 * @param driver driver of the running case.
 * @returns true when the allow button is rendered.
 */
export async function isPermissionDialogVisible(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, TEXT_PERMISSION_ALLOW);
}

/**
 * Waits until the permission dialog is displayed.
 *
 * @param driver driver of the running case.
 * @param timeoutMs maximum wait before the check gives up.
 * @returns true when the dialog showed up.
 */
export async function waitForPermissionDialog(driver: Driver,
  timeoutMs: number = TIMEOUT_PERMISSION_DIALOG): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await isPermissionDialogVisible(driver)) {
      hilog.info(DOMAIN, TAG, 'waitForPermissionDialog: dialog rendered');
      return true;
    }
    await serializedDelay(driver, RETRY_INTERVAL_MS);
  }
  hilog.warn(DOMAIN, TAG, 'waitForPermissionDialog: dialog not rendered in %{public}d ms', timeoutMs);
  return false;
}

/**
 * Accepts the permission dialog when it is displayed.
 *
 * The dialog only shows up while the permission is not granted yet, so a missing dialog is not
 * an error and the helper reports false instead of throwing.
 *
 * @param driver driver of the running case.
 * @returns true when the allow button was clicked.
 */
export async function acceptPermissionDialog(driver: Driver): Promise<boolean> {
  const allow: Component | null = await findByText(driver, TEXT_PERMISSION_ALLOW);
  if (allow === null) {
    hilog.info(DOMAIN, TAG, 'acceptPermissionDialog: the permission is already granted');
    return false;
  }
  const clicked: boolean = await clickComponent(allow);
  await serializedDelay(driver, DELAY_AFTER_PERMISSION);
  return clicked;
}

/**
 * Denies the permission dialog when it is displayed.
 *
 * @param driver driver of the running case.
 * @returns true when the deny button was clicked.
 */
export async function denyPermissionDialog(driver: Driver): Promise<boolean> {
  const deny: Component | null = await findByText(driver, TEXT_PERMISSION_DENY);
  if (deny === null) {
    hilog.info(DOMAIN, TAG, 'denyPermissionDialog: the dialog is not rendered');
    return false;
  }
  const clicked: boolean = await clickComponent(deny);
  await serializedDelay(driver, DELAY_AFTER_PERMISSION);
  return clicked;
}

/**
 * Reads whether a system picker is displayed.
 *
 * The contacts picker is a system panel, its layout differs between images. The title of the
 * sample is not part of the picker, so the picker is detected by the absence of the sample
 * title while the contacts window still owns the foreground.
 *
 * @param driver driver of the running case.
 * @returns true when the sample page is covered by a system panel.
 */
export async function isPickerVisible(driver: Driver): Promise<boolean> {
  const title: Component | null = await findByText(driver, TEXT_PAGE_TITLE);
  if (title !== null) {
    return false;
  }
  const cancel: Component | null = await findByText(driver, TEXT_PICKER_CANCEL);
  const confirm: Component | null = await findByText(driver, TEXT_PICKER_CONFIRM);
  return cancel !== null || confirm !== null;
}

/**
 * Dismisses a system picker that a case opened and brings the sample back.
 *
 * @param driver driver of the running case.
 * @param presses number of Back presses before the relaunch.
 * @returns true when the contacts page is rendered afterwards.
 */
export async function dismissPickerAndRestore(driver: Driver, presses: number = 2): Promise<boolean> {
  await pressAndWait(driver, KEY_BACK, presses, DELAY_AFTER_ACTION);
  await serializedDelay(driver, DELAY_AFTER_PICKER);
  return await ensureContactsPage(driver);
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
      await sleepMs(delayMs);
    }
  });
}

/**
 * Returns the index of the focused component.
 *
 * ON.focused(true) is unreliable on some images, so the components are enumerated and the focus
 * is read one by one.
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

/**
 * Reports whether the queue is currently locked by a running operation.
 *
 * @returns true when an operation is in flight.
 */
export function isQueueLocked(): boolean {
  return queueLocked;
}

/**
 * Returns the page title text of the sample, it is used by the suites that expect a specific
 * label without importing the constant themselves.
 *
 * @returns the title text.
 */
export function pageTitle(): string {
  return TEXT_PAGE_TITLE;
}

/**
 * Returns the labels of the four sample buttons.
 *
 * @returns a copy of the label list.
 */
export function sampleButtons(): string[] {
  return SAMPLE_BUTTON_TEXTS.slice();
}
