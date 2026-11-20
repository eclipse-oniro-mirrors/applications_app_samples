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

/**
 * Shared UI driver facade for the TVFileManager test suite.
 *
 * The file manager sample runs on TV devices where every user action is driven
 * by a remote control. All UI automation therefore has to be serialized: the
 * UiTest framework does not allow concurrent findComponents / triggerKey /
 * delayMs calls from different asynchronous test cases. The helpers below put
 * every driver access on a single promise chain so that suites can be executed
 * in any order without focus races or dropped key events.
 *
 * Only English log content is emitted, through hilog, to keep log collection
 * stable across locales.
 */

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

/**
 * TV remote control key codes. They follow the OpenHarmony key code definition
 * and are used instead of text input because the file manager main page is a
 * pure focus based UI.
 */
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_MENU: number = 2041;

export const KEY_TAB: number = 2049;

/**
 * Timeout budget. Values are deliberately conservative because the file list
 * performs asynchronous media scanning after every directory change.
 */
export const TIMEOUT_PAGE_RENDER: number = 600;

export const TIMEOUT_LIST_RENDER: number = 800;

export const TIMEOUT_DIALOG_RENDER: number = 500;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const TIMEOUT_SEARCH_RENDER: number = 600;

/**
 * Delay between two remote control events. A too small delay makes the list
 * lose key events, a too large delay makes the suite slow on low end boxes.
 */
export const DELAY_KEY_NAVIGATION: number = 30;

export const DELAY_TOUCH_EVENT: number = 50;

export const DELAY_PAGE_SWITCH: number = 500;

/**
 * Tolerances used when validating UI counters. TV rendering may add helper
 * components such as scroll bars and focus boxes, so exact equality is only
 * used for data level assertions.
 */
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/**
 * Component ids declared by the file manager UI. Keeping the ids in one place
 * allows the interaction suites to address elements without duplicating raw
 * strings in every test file.
 */
export const ID_TAB_LOCAL: string = 'index_0';

export const ID_TAB_USB: string = 'index_1';

export const ID_DELETE_CANCEL: string = 'deleteCancel';

export const ID_DELETE_CONFIRM: string = 'deleteConfirm';

export const ID_OVERRIDE_CANCEL: string = 'overrideCancel';

export const ID_OVERRIDE_CONFIRM: string = 'overrideConfirm';

export const ID_RENAME_INPUT: string = 'renameInput';

export const ID_RENAME_SAVE: string = 'renameSave';

export const ID_PROGRESS_CANCEL: string = 'progressCancel';

/**
 * Serializes one UI operation on the shared promise chain.
 * @param action operation to run exclusively.
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

/**
 * Serialized delay. UiTest forbids overlapping delayMs with other driver APIs.
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/**
 * Serialized key trigger.
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/**
 * Returns the process wide driver singleton.
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestDriver: driver created');
  }
  return _driver;
}

/**
 * Tests if a driver instance can be created in the current environment.
 */
export function isDriverAvailable(): boolean {
  try {
    getDriver();
    return true;
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'TestDriver: driver unavailable ' + JSON.stringify(error));
    return false;
  }
}

/**
 * Resets the serialization queue. Only used by controlled teardown paths.
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/**
 * Reads all components on screen. Returns an empty array instead of throwing so
 * that a transient render failure does not abort an entire suite.
 */
export async function findAllComponents(driver: Driver): Promise<Component[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] = await driver.findComponents(ON.type('*'));
      return all ?? [];
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'findAllComponents failed: ' + JSON.stringify(error));
    return [];
  }
}

/**
 * Counts all components. Used as a coarse page-has-content signal.
 */
export async function componentCount(driver: Driver): Promise<number> {
  const all: Component[] = await findAllComponents(driver);
  hilog.info(DOMAIN, TAG, '%{public}s', 'componentCount: ' + all.length);
  return all.length;
}

/**
 * Counts components of one type, for example Text, Image, Button or List.
 */
export async function countByType(driver: Driver, type: string): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const list: Component[] = await driver.findComponents(ON.type(type));
      const count: number = list ? list.length : 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'countByType ' + type + ' = ' + count);
      return count;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'countByType failed: ' + JSON.stringify(error));
    return 0;
  }
}

/**
 * Finds all components of a type.
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const list: Component[] = await driver.findComponents(ON.type(type));
      return list ?? [];
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'findComponentsByType failed: ' + JSON.stringify(error));
    return [];
  }
}

/**
 * Finds one component by component id.
 */
export async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      const component: Component = await driver.findComponent(ON.id(id));
      return component ?? null;
    });
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'findById ' + id + ' failed: ' + JSON.stringify(error));
    return null;
  }
}

/**
 * Checks if a component id is present.
 */
export async function hasComponentId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  return component !== null;
}

/**
 * Finds one component whose text equals expected.
 */
export async function findText(driver: Driver, expected: string): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content: string = await text.getText();
          if (content === expected) {
            return text;
          }
        } catch (innerError) {
          continue;
        }
      }
      return null;
    });
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'findText failed: ' + JSON.stringify(error));
    return null;
  }
}

/**
 * Checks whether a text exists on screen.
 */
export async function hasText(driver: Driver, expected: string): Promise<boolean> {
  const component: Component | null = await findText(driver, expected);
  return component !== null;
}

/**
 * Returns every visible text. Used by localization and consistency suites.
 */
export async function readAllTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      const result: string[] = [];
      for (const text of texts) {
        try {
          const content: string = await text.getText();
          if (content) {
            result.push(content);
          }
        } catch (innerError) {
          continue;
        }
      }
      return result;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'readAllTexts failed: ' + JSON.stringify(error));
    return [];
  }
}

/**
 * Checks if any of the given texts is visible.
 */
export async function hasAnyText(driver: Driver, expected: string[]): Promise<boolean> {
  const texts: string[] = await readAllTexts(driver);
  for (const item of expected) {
    if (texts.indexOf(item) >= 0) {
      return true;
    }
  }
  return false;
}

/**
 * Waits until the text appears, using the render event as completion signal.
 */
export async function waitForText(driver: Driver, expected: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await hasText(driver, expected)) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'waitForText observed: ' + expected);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.warn(DOMAIN, TAG, '%{public}s', 'waitForText timeout: ' + expected);
  return false;
}

/**
 * Waits until the id appears.
 */
export async function waitForId(driver: Driver, id: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await hasComponentId(driver, id)) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'waitForId observed: ' + id);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.warn(DOMAIN, TAG, '%{public}s', 'waitForId timeout: ' + id);
  return false;
}

/**
 * Waits until the component count stops changing.
 */
export async function waitForStableCount(driver: Driver,
  maxWaitMs: number = TIMEOUT_LIST_RENDER): Promise<number> {
  const deadline: number = Date.now() + maxWaitMs;
  let last: number = -1;
  let stable: number = 0;
  while (Date.now() < deadline) {
    const current: number = await componentCount(driver);
    if (current === last && current > 0) {
      stable++;
      if (stable >= STABLE_ROUNDS) {
        return current;
      }
    } else {
      stable = 0;
    }
    last = current;
    await serializedDelay(driver, 100);
  }
  return last < 0 ? 0 : last;
}

/**
 * Checks that at least one component currently owns the focus.
 */
export async function hasFocusedComponent(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const list: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (const component of list) {
        try {
          if (await component.isFocused()) {
            return true;
          }
        } catch (innerError) {
          continue;
        }
      }
      return false;
    });
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'hasFocusedComponent failed: ' + JSON.stringify(error));
    return false;
  }
}

/**
 * Returns the index of the focused component or -1 when focus cannot be found.
 */
export async function currentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const list: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let index = 0; index < list.length; index++) {
        try {
          if (await list[index].isFocused()) {
            return index;
          }
        } catch (innerError) {
          continue;
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'currentFocusIndex failed: ' + JSON.stringify(error));
    return -1;
  }
}

/**
 * Presses one key and waits for the configured navigation delay.
 */
export async function pressKey(driver: Driver, key: number,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
    await driver.delayMs(delayMs);
  });
}

/**
 * Presses one key several times.
 */
export async function pressKeyTimes(driver: Driver, key: number, times: number,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/**
 * Navigates with a key and reports whether the focus is still valid afterwards.
 */
export async function navigateAndCheckFocus(driver: Driver, key: number): Promise<boolean> {
  const before: number = await currentFocusIndex(driver);
  await pressKey(driver, key);
  await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
  const after: number = await currentFocusIndex(driver);
  hilog.info(DOMAIN, TAG, '%{public}s',
    'navigateAndCheckFocus before=' + before + ' after=' + after);
  return before !== after || after >= 0;
}

/**
 * Clicks a screen position and waits for the touch event to settle.
 */
export async function clickAt(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/**
 * Clicks a component when it can be found.
 */
export async function clickById(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return false;
  }
  try {
    await runSerializedUiOperation(async () => {
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });
    return true;
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'clickById ' + id + ' failed: ' + JSON.stringify(error));
    return false;
  }
}

/**
 * Permission dialog components.
 *
 * The file manager requests READ_MEDIA / WRITE_MEDIA / MEDIA_LOCATION /
 * STORAGE_MANAGER at first launch. The system permission panel is rendered by
 * com.ohos.permissionmanager (page pages/dialogPlus) and shows one page per
 * permission group, so the "允许" button has to be pressed several times before
 * the file manager page becomes interactive. Nothing else in the test process
 * can grant those permissions (there is no accesstoken/bm grant command on the
 * TV image), therefore the test driver accepts the panel by itself.
 */
export const ID_PERMISSION_ALLOW: string = 'allow';

export const ID_PERMISSION_DENY: string = 'ban';

export const TEXT_PERMISSION_ALLOW: string = '允许';

export const TEXT_PERMISSION_ALLOW_ALWAYS: string = '始终允许';

export const TEXT_PERMISSION_ALLOW_ONCE: string = '仅使用期间允许';

export const PERMISSION_WAIT_MS: number = 5000;

export const PERMISSION_POLL_MS: number = 200;

export const PERMISSION_MAX_PAGES: number = 8;

/**
 * Upper bound of inspect/click rounds. The panel is multi page and may repaint
 * between two clicks, so the loop keeps inspecting for a while after the last
 * visible page instead of stopping at the first negative lookup: a partially
 * accepted request makes the application deny the remaining permissions and
 * terminate itself.
 */
const PERMISSION_MAX_STEPS: number = 24;

const PERMISSION_IDLE_ROUNDS: number = 3;

/**
 * Checks whether the system permission panel is currently displayed.
 */
export async function isPermissionDialogVisible(driver: Driver): Promise<boolean> {
  const byId: Component | null = await findById(driver, ID_PERMISSION_ALLOW);
  if (byId !== null) {
    return true;
  }
  // Older builds expose the button without an id, the localized label is used
  // as fallback so that the panel is never left blocking the file manager.
  return await hasText(driver, TEXT_PERMISSION_ALLOW);
}

/**
 * Clicks the "允许" button of the current permission page.
 */
export async function clickPermissionAllow(driver: Driver): Promise<boolean> {
  if (await clickById(driver, ID_PERMISSION_ALLOW)) {
    return true;
  }
  const candidates: string[] = [TEXT_PERMISSION_ALLOW, TEXT_PERMISSION_ALLOW_ALWAYS,
    TEXT_PERMISSION_ALLOW_ONCE];
  for (const candidate of candidates) {
    try {
      const component: Component | null = await runSerializedUiOperation(async () => {
        return await driver.findComponent(ON.text(candidate)) ?? null;
      });
      if (component !== null) {
        await runSerializedUiOperation(async () => {
          await component.click();
          await driver.delayMs(DELAY_TOUCH_EVENT);
        });
        hilog.info(DOMAIN, TAG, '%{public}s', 'permission accepted by text: ' + candidate);
        return true;
      }
    } catch (innerError) {
      continue;
    }
  }
  return false;
}

/**
 * Accepts the whole permission panel: waits until it appears (the application
 * cold start takes about one second) and presses "允许" once per page.
 *
 * @param maxWaitMs how long the panel is waited for before giving up.
 * @returns how many pages were accepted, 0 when the panel never appeared.
 */
export async function grantAppPermissions(maxWaitMs: number = PERMISSION_WAIT_MS): Promise<number> {
  const driver: Driver = getDriver();
  const deadline: number = Date.now() + maxWaitMs;
  let appeared: boolean = false;
  while (Date.now() < deadline) {
    if (await isPermissionDialogVisible(driver)) {
      appeared = true;
      break;
    }
    await serializedDelay(driver, PERMISSION_POLL_MS);
  }
  if (!appeared) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'permission panel not shown, already granted');
    return 0;
  }
  let granted: number = 0;
  let idleRounds: number = 0;
  for (let step = 0; step < PERMISSION_MAX_STEPS; step++) {
    if (await isPermissionDialogVisible(driver)) {
      idleRounds = 0;
      if (await clickPermissionAllow(driver)) {
        granted++;
        hilog.info(DOMAIN, TAG, '%{public}s', 'permission page accepted, total=' + granted);
      }
      await serializedDelay(driver, TIMEOUT_DIALOG_RENDER);
    } else {
      idleRounds++;
      if (idleRounds >= PERMISSION_IDLE_ROUNDS) {
        break;
      }
      // The next page of the panel may still be painting.
      await serializedDelay(driver, 300);
    }
  }
  hilog.info(DOMAIN, TAG, '%{public}s', 'permission pages accepted: ' + granted);
  return granted;
}

/**
 * Launches the file manager EntryAbility. Used by suites that need to reset the
 * navigation stack before checking the home page.
 */
export async function launchEntryAbility(): Promise<boolean> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: 'EntryAbility'
    };
    await delegator.startAbility(want);
    // The first launch right after installation asks for the media permissions:
    // the panel must be accepted before the suites interact with the file list.
    await grantAppPermissions(2000);
    return true;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'launchEntryAbility failed: ' + JSON.stringify(error));
    return false;
  }
}

/**
 * Checks whether the local storage tab is selected by comparing tab colors is
 * not possible through UiTest, therefore the home page texts are used as the
 * stable signal.
 */
export async function isHomePageVisible(driver: Driver): Promise<boolean> {
  // The system permission panel also renders text, so it must never be taken for
  // the application page: accept it first and re-read the screen afterwards.
  if (await isPermissionDialogVisible(driver)) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'permission panel in front of the app, accept it');
    await grantAppPermissions(200);
  }
  const texts: string[] = await readAllTexts(driver);
  return texts.length > 0;
}

/**
 * Checks whether the file list page shows at least one row.
 */
export async function isFileListVisible(driver: Driver): Promise<boolean> {
  const listCount: number = await countByType(driver, 'List');
  const itemCount: number = await countByType(driver, 'ListItem');
  hilog.info(DOMAIN, TAG, '%{public}s', 'isFileListVisible list=' + listCount + ' item=' + itemCount);
  return listCount > 0 || itemCount > 0;
}

/**
 * Checks whether a confirmation dialog is on screen by looking for the cancel
 * and confirm ids used by DeleteDialog and OverrideDialog.
 */
export async function isConfirmDialogVisible(driver: Driver): Promise<boolean> {
  const hasDelete: boolean = await hasComponentId(driver, ID_DELETE_CANCEL);
  const hasOverride: boolean = await hasComponentId(driver, ID_OVERRIDE_CANCEL);
  return hasDelete || hasOverride;
}

/**
 * Checks whether the rename dialog is on screen.
 */
export async function isRenameDialogVisible(driver: Driver): Promise<boolean> {
  return await hasComponentId(driver, ID_RENAME_INPUT);
}

/**
 * Checks whether the copy or move progress dialog is on screen.
 */
export async function isProgressDialogVisible(driver: Driver): Promise<boolean> {
  return await hasComponentId(driver, ID_PROGRESS_CANCEL);
}

/**
 * Reads the storage summary text containing the free and total size.
 */
export async function readStorageSummary(driver: Driver): Promise<string> {
  const texts: string[] = await readAllTexts(driver);
  for (const text of texts) {
    if (text.indexOf('/') >= 0 && (text.indexOf('B') >= 0 || text.indexOf('K') >= 0 ||
      text.indexOf('M') >= 0 || text.indexOf('G') >= 0)) {
      return text;
    }
  }
  return '';
}

/**
 * Presses back repeatedly until the home page is reached or the budget is
 * exhausted. Used by recovery suites to normalize the device state.
 */
export async function backToHome(driver: Driver, maxSteps: number = 5): Promise<boolean> {
  for (let step = 0; step < maxSteps; step++) {
    await pressKey(driver, KEY_BACK);
    await serializedDelay(driver, DELAY_PAGE_SWITCH);
    if (await isHomePageVisible(driver)) {
      return true;
    }
  }
  return await isHomePageVisible(driver);
}

/**
 * Counts the amount of components that expose non empty text. This is a useful
 * proxy for "the page is fully rendered" on TV where the component tree is
 * flattened and scroll containers may be empty during the first frame.
 */
export async function nonEmptyTextCount(driver: Driver): Promise<number> {
  const texts: string[] = await readAllTexts(driver);
  let count: number = 0;
  for (const text of texts) {
    if (text.trim().length > 0) {
      count++;
    }
  }
  hilog.info(DOMAIN, TAG, '%{public}s', 'nonEmptyTextCount=' + count);
  return count;
}

