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

const TAG = 'BetaClubDriver';

const LOG_DOMAIN: number = 0x0102;

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// Remote control key codes for TV devices, aligned with pages/common/KeyCode.ets
export const KEY_DPAD_UP: number = 2012;

export const KEY_DPAD_DOWN: number = 2013;

export const KEY_DPAD_LEFT: number = 2014;

export const KEY_DPAD_RIGHT: number = 2015;

export const KEY_TAB: number = 2049;

export const KEY_ENTER: number = 2054;

export const KEY_BACK: number = 2;

export const KEY_0: number = 2000;

export const KEY_1: number = 2001;

export const KEY_2: number = 2002;

// Timeout budget for the beta club pages
export const TIMEOUT_PAGE_RENDER: number = 2000;

// Cold start on 4K TV builds takes longer than a page switch, so the first home page
// probe after a (re)launch gets a larger budget.
export const TIMEOUT_APP_START: number = 6000;

export const TIMEOUT_LIST_LOAD: number = 3000;

export const TIMEOUT_UPLOAD: number = 5000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

// Key and touch pacing
export const DELAY_KEY_NAVIGATION: number = 80;

export const DELAY_TOUCH_EVENT: number = 120;

export const DELAY_PAGE_SWITCH: number = 600;

// Tolerances for UI fluctuation
export const TOLERANCE_COMPONENT_COUNT: number = 5;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 2;

export const STABLE_TOLERANCE: number = 5;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// Text rendered only by the home page header (EntryAbility label)
export const TEXT_HOME_HEADER: string = '提单应用';

export const TEXT_HOME_HEADER_EN: string = 'BetaClub';

export const TEXT_HOME_HEADER_CANDIDATES: string[] = [TEXT_HOME_HEADER, TEXT_HOME_HEADER_EN];

// Texts rendered only by the create issue form, used as the form page marker
export const TEXT_FORM_PROBABILITY: string = '问题概率';

export const TEXT_FORM_DESCRIPTION: string = '问题描述';

export const TEXT_FORM_CANDIDATES: string[] = [TEXT_FORM_PROBABILITY, TEXT_FORM_DESCRIPTION];

// Texts rendered by the beta club home page (see resources/zh_CN and base string.json)
export const TEXT_CREATE_ISSUE: string = '新建问题单';

export const TEXT_CREATE_ISSUE_EN: string = 'create a new questionnaire';

export const TEXT_ISSUE_LIST: string = '问题单列表';

export const TEXT_ISSUE_LIST_EN: string = 'list of questions';

export const TEXT_USE_INTRODUCTION: string = '使用说明';

export const TEXT_USE_INTRODUCTION_EN: string = 'instructions';

export const TEXT_SUBMIT: string = '提交';

export const TEXT_SUBMIT_EN: string = 'submit';

export const TEXT_CANCEL: string = '取消';

export const TEXT_ATTACHMENT: string = '附件';

export const TEXT_ATTACHMENT_EN: string = 'attachment';

export const TEXT_NO_ATTACHMENT: string = '未上传附件';

export const TEXT_SELECT_MEDIA: string = '选择图片/视频(最大可选数量为4)';

export const TEXT_OPERATION_HISTORY: string = '操作历史';

export const TEXT_COLLECT_LOGS: string = '收集日志';

export const TEXT_CREATE_ISSUE_CANDIDATES: string[] = [TEXT_CREATE_ISSUE, TEXT_CREATE_ISSUE_EN];

export const TEXT_ISSUE_LIST_CANDIDATES: string[] = [TEXT_ISSUE_LIST, TEXT_ISSUE_LIST_EN];

export const TEXT_INTRODUCTION_CANDIDATES: string[] = [TEXT_USE_INTRODUCTION, TEXT_USE_INTRODUCTION_EN];

export const TEXT_SUBMIT_CANDIDATES: string[] = [TEXT_SUBMIT, TEXT_SUBMIT_EN];

export const TEXT_ATTACHMENT_CANDIDATES: string[] = [TEXT_ATTACHMENT, TEXT_ATTACHMENT_EN];

/**
 * Serialized UI operation runner.
 * TV devices render on a single UI thread, therefore UiTest calls must be serialized
 * to avoid focus races and dropped key events between concurrent test cases.
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

/** Serialized delay so that delayMs never overlaps other UiTest APIs. */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    if (delayMs <= 0) {
      await driver.delayMs(1);
      return;
    }
    // Driver.delayMs blocks the calling thread while this timer hands control back to
    // the event loop. The polling helpers call this in tight loops, so blocking here
    // keeps the main thread busy for seconds and makes the platform watchdog report
    // THREAD_BLOCK_6S on long runs.
    await new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, delayMs);
    });
  });
}

/** Serialized key trigger. */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Get the singleton UiTest driver, created lazily. */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Reset the serialized queue. Only use when no UI operation is in flight. */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** Count all rendered components, used to detect a fully rendered page. */
export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      // Query concrete component types instead of the unsupported '*' wildcard: the
      // wildcard query returns an empty list on TV builds and stresses the UiTest
      // service with a full accessibility tree dump on every call.
      const textComponents = await driver.findComponents(ON.type('Text')) ?? [];
      const imageComponents = await driver.findComponents(ON.type('Image')) ?? [];
      const listComponents = await driver.findComponents(ON.type('List')) ?? [];
      const count = textComponents.length + imageComponents.length + listComponents.length;
      hilog.info(LOG_DOMAIN, TAG, 'componentCount: %{public}d', count);
      return count;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'componentCount error: %{public}s', `${error}`);
    return 0;
  }
}

/** Find components by type. */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** Find components by text. */
export async function findComponentsByText(driver: Driver, text: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.text(text)) ?? [];
  });
}

/** Check whether a text component with the exact content exists. */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      // Ask the UiTest service for the exact text instead of enumerating and reading
      // every Text component: on TV builds the enumeration allocates a full tree dump
      // per attempt, which is slow and accumulates memory across a long test run.
      const matched = await driver.findComponent(ON.text(expectedText));
      const found = matched !== null && matched !== undefined;
      if (found) {
        hilog.info(LOG_DOMAIN, TAG, 'checkTextContent match: %{public}s', expectedText);
      } else {
        hilog.info(LOG_DOMAIN, TAG, 'checkTextContent miss: %{public}s', expectedText);
      }
      return found;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'checkTextContent error: %{public}s', `${error}`);
    return false;
  }
}

/** Check whether any text contains the expected fragment. */
export async function checkTextContains(driver: Driver, fragment: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content !== undefined && content.indexOf(fragment) >= 0) {
            return true;
          }
        } catch (e) {
          hilog.warn(LOG_DOMAIN, TAG, 'checkTextContains getText failed: %{public}s', `${e}`);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'checkTextContains error: %{public}s', `${error}`);
    return false;
  }
}

/** Event driven wait for a text to appear. Returns true once observed. */
export async function waitForText(driver: Driver, expectedText: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  let attempt = 1;
  while (Date.now() < deadline) {
    const visible = await checkTextContent(driver, expectedText);
    if (visible) {
      hilog.info(LOG_DOMAIN, TAG, 'waitForText observed: %{public}s attempt: %{public}d', expectedText, attempt);
      return true;
    }
    attempt++;
    await serializedDelay(driver, 100);
  }
  hilog.error(LOG_DOMAIN, TAG, 'waitForText timeout: %{public}s', expectedText);
  return false;
}

/** Event driven wait for any of the given texts. Returns the matched text or empty. */
export async function waitForAnyText(driver: Driver, expectedTexts: string[],
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<string> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    for (const text of expectedTexts) {
      const visible = await checkTextContent(driver, text);
      if (visible) {
        return text;
      }
    }
    await serializedDelay(driver, 100);
  }
  return '';
}

/** Check whether a component type is present. */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(LOG_DOMAIN, TAG, 'checkComponentExists %{public}s: %{public}s', type, `${exists}`);
      return exists;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'checkComponentExists error: %{public}s', `${error}`);
    return false;
  }
}

/** Get the index of the currently focused component, or -1 when none. */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let i = 0; i < allComponents.length; i++) {
        try {
          const isFocused = await allComponents[i].isFocused();
          if (isFocused) {
            hilog.info(LOG_DOMAIN, TAG, 'focus found at index: %{public}d', i);
            return i;
          }
        } catch (e) {
          hilog.warn(LOG_DOMAIN, TAG, 'focus query failed at index: %{public}d', i);
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'getCurrentFocusIndex error: %{public}s', `${error}`);
    return -1;
  }
}

/** Check focus existence, and optionally the focused index. */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100;
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const focusedComponent = await driver.findComponent(ON.focused(true));
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (expectedFocusedIndex === -1) {
          let hasFocus = !!focusedComponent;
          if (!hasFocus) {
            for (let i = 0; i < allComponents.length; i++) {
              try {
                if (await allComponents[i].isFocused()) {
                  hasFocus = true;
                  break;
                }
              } catch (e) {
                continue;
              }
            }
          }
          return hasFocus;
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
      hilog.error(LOG_DOMAIN, TAG, 'checkFocusState error: %{public}s', `${error}`);
    }
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

/** Trigger a key several times with a fixed delay. */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** Simulate a touch/click at the given coordinates. */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Simulate a swipe inside a scrollable list. */
export async function simulateSwipe(driver: Driver, fromX: number, fromY: number,
  toX: number, toY: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.swipe(fromX, fromY, toX, toY, 600);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Click the first component matching any of the candidate texts. */
export async function clickAnyText(driver: Driver, candidates: string[]): Promise<string> {
  for (const candidate of candidates) {
    const clicked = await clickText(driver, candidate);
    if (clicked) {
      return candidate;
    }
  }
  return '';
}

/** Click the first component matching the given text. */
export async function clickText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.text(text)) ?? [];
      if (components.length === 0) {
        hilog.warn(LOG_DOMAIN, TAG, 'clickText not found: %{public}s', text);
        return false;
      }
      try {
        await components[0].click();
      } catch (innerError) {
        // Fall back to a raw coordinate click using the component bounds.
        const bounds = await components[0].getBounds();
        const centerX = (bounds.left + bounds.right) / 2;
        const centerY = (bounds.top + bounds.bottom) / 2;
        hilog.warn(LOG_DOMAIN, TAG, 'clickText raw click: %{public}s at %{public}d,%{public}d',
          text, centerX, centerY);
        await driver.click(centerX, centerY);
      }
      await driver.delayMs(DELAY_PAGE_SWITCH);
      return true;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'clickText error: %{public}s', `${error}`);
    return false;
  }
}

/** Launch the beta club main ability through the ability delegator. */
export async function launchBetaClubApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  try {
    await delegator.startAbility(want);
    hilog.info(LOG_DOMAIN, TAG, 'launchBetaClubApp sent: %{public}s', args.bundleName);
  } catch (error) {
    hilog.error(LOG_DOMAIN, TAG, 'launchBetaClubApp failed: %{public}s', `${error}`);
  }
}

/** Extra wait for the menu entries, which render after the header, in milliseconds. */
export const TIMEOUT_HOME_ENTRY: number = 4000;

// Labels of the system permission dialog that the app triggers when it asks for media
// access. The dialog also shows the app label, which makes the home page header check
// succeed while the page behind it is unreachable.
export const TEXT_PERMISSION_ALLOW: string = '允许';

export const TEXT_PERMISSION_ALLOW_EN: string = 'Allow';

export const TEXT_PERMISSION_ALLOW_CANDIDATES: string[] = [TEXT_PERMISSION_ALLOW, TEXT_PERMISSION_ALLOW_EN];

export const TEXT_PERMISSION_DENY: string = '禁止';

export const TEXT_PERMISSION_DENY_EN: string = 'Deny';

export const TEXT_PERMISSION_DENY_CANDIDATES: string[] = [TEXT_PERMISSION_DENY, TEXT_PERMISSION_DENY_EN];

/**
 * Dismiss the system permission dialog that the app shows for media access. It is a
 * separate system window above the app, so every home page probe fails until it is gone.
 */
export async function dismissPermissionDialog(driver: Driver): Promise<boolean> {
  const denied = await waitForAnyText(driver, TEXT_PERMISSION_DENY_CANDIDATES, 300);
  if (denied === '') {
    return false;
  }
  hilog.info(LOG_DOMAIN, TAG, 'permission dialog detected, granting access');
  const clicked = await clickAnyText(driver, TEXT_PERMISSION_ALLOW_CANDIDATES);
  if (clicked === '') {
    await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
  }
  await serializedDelay(driver, DELAY_PAGE_SWITCH);
  return clicked !== '';
}

/**
 * Wait for the home menu entries. The first paint after a relaunch can expose the page
 * header while the entry list is still missing from the accessibility tree, so focus
 * moves are used to force the list to be rebuilt.
 */
async function waitForHomeEntries(driver: Driver): Promise<boolean> {
  if (await waitForAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES, TIMEOUT_HOME_ENTRY) !== '') {
    return true;
  }
  if (await dismissPermissionDialog(driver)) {
    return await waitForAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES, TIMEOUT_HOME_ENTRY) !== '';
  }
  hilog.info(LOG_DOMAIN, TAG, 'home entries missing, forcing a focus move');
  await pressAndWait(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
  await pressAndWait(driver, KEY_DPAD_UP, 1, DELAY_KEY_NAVIGATION);
  return await waitForAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES, TIMEOUT_HOME_ENTRY) !== '';
}

/** Ensure the app is in the foreground and the home page has rendered. */
export async function ensureHomePage(driver: Driver): Promise<boolean> {
  // The home page is identified by its header text: sub pages reuse the menu entry
  // titles (for example 新建问题单 is also the create page title), so the entry title
  // alone is not a reliable home page marker.
  //
  // A system permission dialog shows the same app label as the home header, so it has to
  // be dismissed before any probe can be trusted.
  await dismissPermissionDialog(driver);
  if (await waitForText(driver, TEXT_HOME_HEADER, TIMEOUT_PAGE_RENDER)) {
    // The header paints before the menu entries are populated, so let the entries settle
    // before a test starts clicking them.
    await waitForHomeEntries(driver);
    return true;
  }
  // The app may just be on a sub page. Walk back instead of starting the ability again:
  // relaunching on every sub page stacks EntryAbility instances and eventually kills
  // the test process on long runs.
  if (await isInsideBetaClub(driver)) {
    for (let i = 0; i < 3; i++) {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      if (await isHomePage(driver)) {
        await waitForHomeEntries(driver);
        return true;
      }
    }
  }
  hilog.info(LOG_DOMAIN, TAG, 'home page not visible, relaunching app');
  await launchBetaClubApp();
  await serializedDelay(driver, 1500);
  await dismissPermissionDialog(driver);
  if (await waitForText(driver, TEXT_HOME_HEADER, TIMEOUT_APP_START)) {
    await waitForHomeEntries(driver);
    return true;
  }
  // Second attempt: the first start can be dropped while the window manager is still
  // tearing down the previous window.
  await launchBetaClubApp();
  await serializedDelay(driver, 1500);
  await dismissPermissionDialog(driver);
  const visible = await waitForText(driver, TEXT_HOME_HEADER, TIMEOUT_APP_START);
  if (visible) {
    await waitForHomeEntries(driver);
  }
  return visible;
}

/** True when the home page header is on screen. */
export async function isHomePage(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, TEXT_HOME_HEADER);
}

/** True when any beta club page marker is on screen. */
export async function isInsideBetaClub(driver: Driver): Promise<boolean> {
  if (await checkTextContent(driver, TEXT_HOME_HEADER)) {
    return true;
  }
  if (await waitForAnyText(driver, TEXT_FORM_CANDIDATES, 200) !== '') {
    return true;
  }
  if (await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, 200) !== '') {
    return true;
  }
  return await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, 200) !== '';
}

/** Navigate the home page to the create issue entry. */
export async function openCreateIssuePage(driver: Driver): Promise<boolean> {
  await ensureHomePage(driver);
  const clicked = await clickAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES);
  const navigatedByClick = clicked !== '' &&
    await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER) !== '';
  if (navigatedByClick) {
    return true;
  }
  // The entry may be scrolled out of the visible area (4K or rotated displays), so the
  // click has no effect. Fall back to remote key navigation.
  await pressAndWait(driver, KEY_DPAD_UP, 3, DELAY_KEY_NAVIGATION);
  await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
  await serializedDelay(driver, DELAY_PAGE_SWITCH);
  return await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER) !== '';
}

/** Navigate the home page to the issue list entry. */
export async function openIssueListPage(driver: Driver): Promise<boolean> {
  await ensureHomePage(driver);
  const clicked = await clickAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES);
  if (clicked !== '') {
    await serializedDelay(driver, DELAY_PAGE_SWITCH);
  }
  const navigatedByClick = clicked !== '' && !(await isHomePage(driver));
  if (!navigatedByClick) {
    await pressAndWait(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
    await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
    await serializedDelay(driver, DELAY_PAGE_SWITCH);
  }
  const listVisible = await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, TIMEOUT_LIST_LOAD) !== '';
  const homeHeaderGone = !(await isHomePage(driver));
  return listVisible && homeHeaderGone;
}

/** Navigate the home page to the use introduction entry. */
export async function openIntroductionPage(driver: Driver): Promise<boolean> {
  await ensureHomePage(driver);
  const clicked = await clickAnyText(driver, TEXT_INTRODUCTION_CANDIDATES);
  if (clicked !== '') {
    await serializedDelay(driver, DELAY_PAGE_SWITCH);
  }
  const navigatedByClick = clicked !== '' && !(await isHomePage(driver));
  if (!navigatedByClick) {
    // The entry may be scrolled out of the visible area (4K or rotated displays), so
    // the click has no effect. Fall back to remote key navigation.
    await pressAndWait(driver, KEY_DPAD_DOWN, 2, DELAY_KEY_NAVIGATION);
    await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
    await serializedDelay(driver, DELAY_PAGE_SWITCH);
  }
  const introVisible = await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, TIMEOUT_PAGE_RENDER) !== '';
  const homeHeaderGone = !(await isHomePage(driver));
  return introVisible && homeHeaderGone;
}

/** Press back until the home page is visible again. */
export async function backToHome(driver: Driver, maxAttempts: number = 3): Promise<boolean> {
  for (let i = 0; i < maxAttempts; i++) {
    if (await isHomePage(driver)) {
      return true;
    }
    await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
  }
  return await ensureHomePage(driver);
}

/** Wait until the component count becomes stable across consecutive samples. */
export async function waitForStableComponentCount(driver: Driver, rounds: number = STABLE_ROUNDS,
  tolerance: number = STABLE_TOLERANCE): Promise<number> {
  let previous = await componentCount(driver);
  let stableRounds = 0;
  let attempts = 0;
  while (attempts < 10 && stableRounds < rounds) {
    await serializedDelay(driver, 100);
    const current = await componentCount(driver);
    if (Math.abs(current - previous) <= tolerance) {
      stableRounds++;
    } else {
      stableRounds = 0;
    }
    previous = current;
    attempts++;
  }
  return previous;
}

/** Simple retry policy shared by flaky UI assertions. */
export class RetryPolicy {
  public static readonly DEFAULT_ATTEMPTS: number = 3;
  public static readonly DEFAULT_INTERVAL_MS: number = 200;

  public static async execute<T>(action: () => Promise<T>, attempts: number = RetryPolicy.DEFAULT_ATTEMPTS,
    intervalMs: number = RetryPolicy.DEFAULT_INTERVAL_MS): Promise<T | undefined> {
    for (let i = 0; i < attempts; i++) {
      try {
        return await action();
      } catch (error) {
        hilog.warn(LOG_DOMAIN, TAG, 'retry %{public}d failed: %{public}s', i + 1, `${error}`);
        await new Promise<void>((resolve) => {
          setTimeout(() => resolve(), intervalMs);
        });
      }
    }
    return undefined;
  }
}

/** Records the navigation path so tests can assert ordering without UI coupling. */
export class NavigationPathTracker {
  private path: string[] = [];

  public append(page: string): void {
    this.path.push(page);
  }

  public getPath(): string[] {
    return [...this.path];
  }

  public getStepCount(): number {
    return this.path.length;
  }

  public getFirstPage(): string {
    return this.path.length === 0 ? '' : this.path[0];
  }

  public getLastPage(): string {
    return this.path.length === 0 ? '' : this.path[this.path.length - 1];
  }

  public contains(page: string): boolean {
    return this.path.includes(page);
  }

  public reset(): void {
    this.path = [];
  }
}

/** Tracks focus movement latency for responsiveness assertions. */
export class FocusLatencyAnalyzer {
  private latencies: number[] = [];

  public record(latencyMs: number): void {
    this.latencies.push(latencyMs);
  }

  public getSampleCount(): number {
    return this.latencies.length;
  }

  public getMaxLatency(): number {
    let max: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      if (this.latencies[i] > max) {
        max = this.latencies[i];
      }
    }
    return max;
  }

  public getAverageLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      total += this.latencies[i];
    }
    return total / this.latencies.length;
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.getMaxLatency() <= budgetMs;
  }

  public reset(): void {
    this.latencies = [];
  }
}

/** Counts rendered components per type. */
export class ComponentTypeCounter {
  private typeCounts: Map<string, number> = new Map<string, number>();

  public record(type: string): void {
    const current: number = this.typeCounts.get(type) ?? 0;
    this.typeCounts.set(type, current + 1);
  }

  public getCount(type: string): number {
    const value: number | undefined = this.typeCounts.get(type);
    return value === undefined ? 0 : value;
  }

  public getTotalCount(): number {
    let total: number = 0;
    this.typeCounts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctTypeCount(): number {
    return this.typeCounts.size;
  }

  public reset(): void {
    this.typeCounts = new Map<string, number>();
  }
}

/** Focus position tracker for the three-entry home menu. */
export class HomeMenuFocusTracker {
  private currentIndex: number = 0;
  private optionCount: number;

  constructor(optionCount: number) {
    this.optionCount = optionCount;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.optionCount) {
      return false;
    }
    this.currentIndex = index;
    return true;
  }

  public moveUp(): boolean {
    if (this.currentIndex <= 0) {
      return false;
    }
    this.currentIndex--;
    return true;
  }

  public moveDown(): boolean {
    if (this.currentIndex >= this.optionCount - 1) {
      return false;
    }
    this.currentIndex++;
    return true;
  }

  public getIndex(): number {
    return this.currentIndex;
  }

  public isFirst(): boolean {
    return this.currentIndex === 0;
  }

  public isLast(): boolean {
    return this.currentIndex === this.optionCount - 1;
  }

  public reset(): void {
    this.currentIndex = 0;
  }
}

/** Validates text content used by issue report form assertions. */
export class IssueTextValidator {
  public static readonly MAX_DESCRIPTION_LENGTH: number = 500;
  public static readonly MAX_REMARK_LENGTH: number = 200;
  public static readonly PHONE_PATTERN: RegExp = new RegExp('^[0-9]{6,15}$');

  public static isDescriptionValid(description: string): boolean {
    return description.length > 0 && description.length <= IssueTextValidator.MAX_DESCRIPTION_LENGTH;
  }

  public static isRemarkValid(remark: string): boolean {
    return remark.length <= IssueTextValidator.MAX_REMARK_LENGTH;
  }

  public static isPhoneValid(phone: string): boolean {
    return IssueTextValidator.PHONE_PATTERN.test(phone);
  }

  public static hasChinese(text: string): boolean {
    return new RegExp('[\\u4e00-\\u9fa5]').test(text);
  }
}

/** Wrap a promise with a hard timeout so a stuck UI never blocks the suite. */
export async function withTimeout<T>(action: Promise<T>, timeoutMs: number,
  fallback: T): Promise<T> {
  const timeout = new Promise<T>((resolve) => {
    setTimeout(() => resolve(fallback), timeoutMs);
  });
  return Promise.race([action, timeout]);
}

