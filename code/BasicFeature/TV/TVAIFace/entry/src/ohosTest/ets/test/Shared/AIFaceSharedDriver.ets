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

import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'AIFaceSharedDriver';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
// Remembers how many DPAD_RIGHT presses opened a home page entry, so that later
// navigations of the same test class need a single key press instead of a scan.
const _entryOffsetCache: Map<string, number> = new Map<string, number>();

// Remote control key codes shared by the TV and tablet variants of the app.
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2054;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

// Focus identifiers declared in pages/index.ets.
export const FOCUS_ID_IMAGE: string = '1';

export const FOCUS_ID_CAMERA: string = '0';

export const FOCUS_ID_DEVICE: string = '-1';

export const FOCUS_IDS: string[] = [FOCUS_ID_IMAGE, FOCUS_ID_CAMERA, FOCUS_ID_DEVICE];

// English resource strings used to identify AIFace pages on every locale.
export const TEXT_HOME_IMAGE: string = 'Image facial recognition';

export const TEXT_HOME_CAMERA: string = 'Camera facial recognition';

export const TEXT_HOME_DEVICE: string = 'Device Connection Authentication';

export const TEXT_IMAGE_SELECT: string = 'local image';

export const TEXT_TRUST_DEVICE: string = 'Trusted Device (Authenticated Device)';

export const TEXT_CONNECT_DEVICE: string = 'Connect Device';

export const TEXT_DELETE_DEVICE: string = 'Delete Device';

export const TEXT_DISCOVER_DEVICES: string = 'Click to start discovering devices';

export const TEXT_DISCOVERING: string = 'discovering devices';

export const TEXT_NO_CAMERA: string = 'Please connect the camera';

export const TEXT_AI_FAIL: string = 'AI model failed to load, please try again!';

export const TEXT_NO_FACE: string = 'No face detected, please try again.';

export const TEXT_IMAGE_FAIL: string = 'Failed to load image, please select the image again.';

// Chinese resource values from resources/zh_CN/element/string.json. The test
// device may run under zh_CN, so every text assertion accepts both locales.
export const TEXT_HOME_IMAGE_ZH: string = '图片人脸识别';

export const TEXT_HOME_CAMERA_ZH: string = '摄像头人脸识别';

export const TEXT_HOME_DEVICE_ZH: string = '设备连接认证';

export const TEXT_IMAGE_SELECT_ZH: string = '本地图片';

export const TEXT_TRUST_DEVICE_ZH: string = '可信设备（已认证设备）';

export const TEXT_DISCOVER_DEVICES_ZH: string = '点击开始发现设备';

export const TEXT_DISCOVERING_ZH: string = '正在发现设备';

export const TEXT_NO_CAMERA_ZH: string = '请接入摄像头';

export const TEXT_AI_FAIL_ZH: string = 'AI模型加载失败，请重试！';

export function localizedVariants(expected: string): string[] {
  if (expected === TEXT_HOME_IMAGE) {
    return [expected, TEXT_HOME_IMAGE_ZH];
  }
  if (expected === TEXT_HOME_CAMERA) {
    return [expected, TEXT_HOME_CAMERA_ZH];
  }
  if (expected === TEXT_HOME_DEVICE) {
    return [expected, TEXT_HOME_DEVICE_ZH];
  }
  if (expected === TEXT_IMAGE_SELECT) {
    return [expected, TEXT_IMAGE_SELECT_ZH];
  }
  if (expected === TEXT_TRUST_DEVICE) {
    return [expected, TEXT_TRUST_DEVICE_ZH];
  }
  if (expected === TEXT_DISCOVER_DEVICES) {
    return [expected, TEXT_DISCOVER_DEVICES_ZH];
  }
  if (expected === TEXT_DISCOVERING) {
    return [expected, TEXT_DISCOVERING_ZH];
  }
  if (expected === TEXT_NO_CAMERA) {
    return [expected, TEXT_NO_CAMERA_ZH];
  }
  if (expected === TEXT_AI_FAIL) {
    return [expected, TEXT_AI_FAIL_ZH];
  }
  return [expected];
}

export const TIMEOUT_PAGE_RENDER: number = 2000;

export const TIMEOUT_FOCUS_CHANGE: number = 800;

export const TIMEOUT_TEXT_APPEAR: number = 1500;

export const TIMEOUT_ENTRY_OPEN: number = 1500;

export const DELAY_KEY_NAVIGATION: number = 80;

export const DELAY_TOUCH_EVENT: number = 120;

export const DELAY_PAGE_TRANSITION: number = 600;

export const TOLERANCE_COMPONENT_COUNT: number = 5;

export const STABLE_ROUNDS: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/**
 * Serialize all UiTest operations. The UiTest backend does not allow two
 * concurrent findComponents/triggerKey calls, therefore every helper funnels
 * through one promise chain.
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
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

/** Delay wrapper that participates in the serialized queue. */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** Trigger one key inside the serialized queue. */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** Return the process wide Driver singleton. */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** Allows a suite to drop the cached driver after a forced app restart. */
export function resetDriver(): void {
  _driver = null;
  _uiOperationQueue = Promise.resolve();
}

/** Small numeric helpers used by timing assertions. */
export function clamp(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

export function average(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    total += values[i];
  }
  return total / values.length;
}

export function maxValue(values: number[]): number {
  let result: number = 0;
  for (let i = 0; i < values.length; i++) {
    if (values[i] > result) {
      result = values[i];
    }
  }
  return result;
}

export function isSortedAscending(values: number[]): boolean {
  for (let i = 1; i < values.length; i++) {
    if (values[i] < values[i - 1]) {
      return false;
    }
  }
  return true;
}

/** Launch the AIFace MainAbility through the ability delegator. */
export async function launchAIFaceApp(): Promise<void> {
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const want: Want = {
      bundleName: 'com.ohos.aiface',
      abilityName: 'MainAbility'
    };
    await delegator.startAbility(want);
    await serializedDelay(getDriver(), 800);
    await acceptPermissionDialogs(getDriver());
    hilog.info(0x0000, TAG, '%{public}s', 'launchAIFaceApp success');
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'launchAIFaceApp failed');
  }
}

/** Find all components of a given UiTest type. */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    const components: Component[] = await driver.findComponents(ON.type(type));
    return components ? components : [];
  });
}

/** Count all components, falling back to Text/Image when type '*' is empty. */
export async function getComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const all: Component[] = await driver.findComponents(ON.type('*'));
      if (all && all.length > 0) {
        return all.length;
      }
      const textComponents: Component[] = await driver.findComponents(ON.type('Text'));
      const imageComponents: Component[] = await driver.findComponents(ON.type('Image'));
      const textCount: number = textComponents ? textComponents.length : 0;
      const imageCount: number = imageComponents ? imageComponents.length : 0;
      return textCount > imageCount ? textCount : imageCount;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'getComponentCount failed');
    return 0;
  }
}

/** Count components of one type. */
export async function countComponentsByType(driver: Driver, type: string): Promise<number> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length;
}

/** Check that at least one component with the given id exists. */
export async function componentExistsById(driver: Driver, id: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.id(id));
      return components !== null && components !== undefined && components.length > 0;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'componentExistsById failed');
    return false;
  }
}

/** Check that at least one component of the given type exists. */
export async function componentExistsByType(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

/** Read the text of a component, returning an empty string on failure. */
export async function safeGetText(component: Component): Promise<string> {
  try {
    return await component.getText();
  } catch (error) {
    return '';
  }
}

/** Read the bounds of a component, returning a zero rect on failure. */
export async function safeGetBounds(component: Component): Promise<Rect> {
  try {
    return await component.getBounds();
  } catch (error) {
    return {
      left: 0,
      top: 0,
      right: 0,
      bottom: 0
    };
  }
}

/** Collect every visible text of the current page. */
export async function getVisibleTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      const buttons: Component[] = await driver.findComponents(ON.type('Button'));
      const result: string[] = [];
      const candidates: Component[] = [];
      for (let i = 0; texts && i < texts.length; i++) {
        candidates.push(texts[i]);
      }
      for (let i = 0; buttons && i < buttons.length; i++) {
        candidates.push(buttons[i]);
      }
      for (let i = 0; i < candidates.length; i++) {
        const content: string = await safeGetText(candidates[i]);
        if (content.length > 0) {
          result.push(content);
        }
      }
      return result;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'getVisibleTexts failed');
    return [];
  }
}

/** Check whether an exact text is present on the current page. */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    const variants: string[] = localizedVariants(expectedText);
    for (let v = 0; v < variants.length; v++) {
      const component: Component | undefined = await runSerializedUiOperation(async () => {
        return await driver.findComponent(ON.text(variants[v]));
      });
      if (component !== undefined && component !== null) {
        return true;
      }
    }
    return false;
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'checkTextContent failed');
    return false;
  }
}

/** Check whether any text contains the given fragment. */
export async function hasTextContaining(driver: Driver, fragment: string): Promise<boolean> {
  const texts: string[] = await getVisibleTexts(driver);
  for (let i = 0; i < texts.length; i++) {
    if (texts[i].indexOf(fragment) >= 0) {
      return true;
    }
  }
  return false;
}

/** Wait until an exact text appears, returning false after the timeout. */
export async function waitForText(driver: Driver, text: string,
  timeoutMs: number = TIMEOUT_TEXT_APPEAR): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await checkTextContent(driver, text)) {
      hilog.info(0x0000, TAG, '%{public}s', 'waitForText observed expected text');
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(0x0000, TAG, '%{public}s', 'waitForText timeout');
  return false;
}

/** Wait until any of the supplied texts appears. */
export async function waitForAnyText(driver: Driver, texts: string[],
  timeoutMs: number = TIMEOUT_TEXT_APPEAR): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    for (let i = 0; i < texts.length; i++) {
      if (await checkTextContent(driver, texts[i])) {
        return true;
      }
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

function textMatchesAny(content: string, expected: string[]): boolean {
  if (expected.includes(content)) {
    return true;
  }
  return false;
}

export async function isHomeVisible(driver: Driver): Promise<boolean> {
  if (!(await checkTextContent(driver, TEXT_HOME_IMAGE))) {
    return false;
  }
  if (await checkTextContent(driver, TEXT_HOME_CAMERA)) {
    return true;
  }
  return await checkTextContent(driver, TEXT_HOME_DEVICE);
}

export async function isImageSelectVisible(driver: Driver): Promise<boolean> {
  return await checkTextContent(driver, TEXT_IMAGE_SELECT);
}

export async function isDeviceAuthVisible(driver: Driver): Promise<boolean> {
  if (await checkTextContent(driver, TEXT_TRUST_DEVICE)) {
    return true;
  }
  if (await checkTextContent(driver, TEXT_DISCOVER_DEVICES)) {
    return true;
  }
  return await checkTextContent(driver, TEXT_DISCOVERING);
}

export async function isCameraPreviewVisible(driver: Driver): Promise<boolean> {
  const exists: boolean = await componentExistsById(driver, 'XComponent');
  if (exists) {
    return true;
  }
  return await componentExistsByType(driver, 'XComponent');
}

/** Wait for the AIFace home page and relaunch the app when necessary. */
export async function waitForHomeStable(driver: Driver,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  await acceptPermissionDialogs(driver);
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await isHomeVisible(driver)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(0x0000, TAG, '%{public}s', 'waitForHomeStable relaunching app');
  await launchAIFaceApp();
  const secondDeadline: number = Date.now() + maxWaitMs;
  while (Date.now() < secondDeadline) {
    if (await isHomeVisible(driver)) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

/** Navigate back to the home page from any nested page. */
export async function ensureHome(driver: Driver): Promise<boolean> {
  if (await isHomeVisible(driver)) {
    return true;
  }
  for (let i = 0; i < 3; i++) {
    await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
    const deadline: number = Date.now() + TIMEOUT_PAGE_RENDER;
    while (Date.now() < deadline) {
      if (await isHomeVisible(driver)) {
        return true;
      }
      await serializedDelay(driver, 100);
    }
  }
  await launchAIFaceApp();
  return await waitForHomeStable(driver);
}

/** Press a key a number of times with a fixed delay between presses. */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** Simulate a tap at the given coordinates. */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** Click a component matched by id, returning false when it is absent. */
export async function clickById(driver: Driver, id: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const component: Component | undefined = await driver.findComponent(ON.id(id));
      if (component === undefined || component === null) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      return true;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'clickById failed');
    return false;
  }
}

/** Click a component matched by exact text, returning false when absent. */
export async function clickByText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const component: Component | undefined = await driver.findComponent(ON.text(text));
      if (component === undefined || component === null) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      return true;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'clickByText failed');
    return false;
  }
}

/**
 * Accept the runtime permission dialogs shown by MainAbility on first launch.
 * The dialog belongs to the permission manager process, so it is matched by
 * the localized action text instead of by component id.
 */
export async function acceptPermissionDialogs(driver: Driver): Promise<number> {
  let accepted: number = 0;
  let misses: number = 0;
  while (accepted < 8 && misses < 3) {
    let clicked: boolean = await clickByText(driver, '允许');
    if (!clicked) {
      clicked = await clickByText(driver, 'Allow');
    }
    if (clicked) {
      accepted++;
      misses = 0;
      await serializedDelay(driver, 400);
    } else {
      misses++;
      await serializedDelay(driver, 200);
    }
  }
  if (accepted > 0) {
    hilog.info(0x0000, TAG, '%{public}s', 'accepted permission dialogs: ' + accepted);
  }
  return accepted;
}

/** Open the image selection page from the home page. */
export async function navigateToImageSelect(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (await openHomeEntry(driver, [TEXT_IMAGE_SELECT])) {
    return true;
  }
  const clicked: boolean = await clickById(driver, FOCUS_ID_IMAGE);
  if (clicked) {
    await serializedDelay(driver, DELAY_PAGE_TRANSITION);
  }
  return await waitForText(driver, TEXT_IMAGE_SELECT);
}

/** Open the camera preview page from the home page. */
export async function navigateToCamera(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  if (await openHomeEntry(driver, [TEXT_NO_CAMERA])) {
    return true;
  }
  if (await isCameraPreviewVisible(driver)) {
    return true;
  }
  const clicked: boolean = await clickById(driver, FOCUS_ID_CAMERA);
  if (clicked) {
    await serializedDelay(driver, DELAY_PAGE_TRANSITION);
  }
  return await isCameraPreviewVisible(driver);
}

/** Open the distributed device authentication page from the home page. */
export async function navigateToDeviceAuth(driver: Driver): Promise<boolean> {
  await ensureHome(driver);
  const expected: string[] = [TEXT_TRUST_DEVICE, TEXT_DISCOVER_DEVICES, TEXT_DISCOVERING];
  if (await openHomeEntry(driver, expected)) {
    hilog.info(0x0000, TAG, '%{public}s', 'navigateToDeviceAuth opened by key');
    return true;
  }
  const clicked: boolean = await clickById(driver, FOCUS_ID_DEVICE);
  hilog.info(0x0000, TAG, '%{public}s', 'navigateToDeviceAuth clicked: ' + clicked);
  if (clicked) {
    await serializedDelay(driver, DELAY_PAGE_TRANSITION);
  }
  const visible: boolean = await waitForAnyText(driver, expected, TIMEOUT_PAGE_RENDER);
  hilog.info(0x0000, TAG, '%{public}s', 'navigateToDeviceAuth visible: ' + visible);
  return visible;
}

/**
 * Activate one of the home page entries with the remote control.
 * The home page moves the focus with DPAD_LEFT/RIGHT and opens the focused entry on
 * ENTER. Injected touch events are not delivered on every device (TV boxes often run
 * in pointer mode), so navigation is done with keys and verified by the page text.
 */
export async function openHomeEntry(driver: Driver, expectedTexts: string[]): Promise<boolean> {
  const cacheKey: string = expectedTexts.join('|');
  const cachedOffset: number | undefined = _entryOffsetCache.get(cacheKey);
  if (cachedOffset !== undefined) {
    for (let i = 0; i < cachedOffset; i++) {
      await triggerSerializedKey(driver, KEY_RIGHT);
    }
    await triggerSerializedKey(driver, KEY_ENTER);
    if (await waitForAnyText(driver, expectedTexts, TIMEOUT_ENTRY_OPEN)) {
      return true;
    }
    if (!(await isHomeVisible(driver))) {
      await triggerSerializedKey(driver, KEY_BACK);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    }
    _entryOffsetCache.delete(cacheKey);
  }
  for (let attempt = 0; attempt < FOCUS_IDS.length; attempt++) {
    await triggerSerializedKey(driver, KEY_ENTER);
    if (await waitForAnyText(driver, expectedTexts, TIMEOUT_ENTRY_OPEN)) {
      _entryOffsetCache.set(cacheKey, attempt);
      return true;
    }
    if (!(await isHomeVisible(driver))) {
      await triggerSerializedKey(driver, KEY_BACK);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    }
    await triggerSerializedKey(driver, KEY_RIGHT);
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  }
  await ensureHome(driver);
  // One more pass: the first scan can miss when the device is still rendering the page.
  for (let attempt = 0; attempt < FOCUS_IDS.length; attempt++) {
    await triggerSerializedKey(driver, KEY_ENTER);
    if (await waitForAnyText(driver, expectedTexts, TIMEOUT_ENTRY_OPEN)) {
      _entryOffsetCache.set(cacheKey, attempt);
      return true;
    }
    if (!(await isHomeVisible(driver))) {
      await triggerSerializedKey(driver, KEY_BACK);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    }
    await triggerSerializedKey(driver, KEY_RIGHT);
    await serializedDelay(driver, DELAY_KEY_NAVIGATION);
  }
  await ensureHome(driver);
  return false;
}

/** Locate the focused component index, -1 when focus cannot be resolved. */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*'));
      if (!components || components.length === 0) {
        return -1;
      }
      for (let i = 0; i < components.length; i++) {
        try {
          const focused: boolean = await components[i].isFocused();
          if (focused) {
            return i;
          }
        } catch (error) {
          continue;
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'getCurrentFocusIndex failed');
    return -1;
  }
}

/** Check whether a component at the expected index owns the focus. */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt: number = 1;
  while (Date.now() < deadline) {
    const result: boolean = await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*'));
      if (!components || components.length === 0) {
        return false;
      }
      if (expectedFocusedIndex === -1) {
        for (let i = 0; i < components.length; i++) {
          try {
            if (await components[i].isFocused()) {
              return true;
            }
          } catch (error) {
            continue;
          }
        }
        return false;
      }
      if (expectedFocusedIndex >= components.length) {
        return false;
      }
      try {
        return await components[expectedFocusedIndex].isFocused();
      } catch (error) {
        return false;
      }
    });
    if (result) {
      hilog.info(0x0000, TAG, '%{public}s', 'checkFocusState resolved at attempt ' + attempt);
      return true;
    }
    attempt++;
    await serializedDelay(driver, 100);
  }
  return false;
}

/** Obtain the id of the currently focused component, empty when unknown. */
export async function getFocusedComponentId(driver: Driver): Promise<string> {
  try {
    return await runSerializedUiOperation(async () => {
      const component: Component | undefined = await driver.findComponent(ON.focused(true));
      if (component === undefined || component === null) {
        return '';
      }
      try {
        return await component.getId();
      } catch (error) {
        return '';
      }
    });
  } catch (error) {
    return '';
  }
}

/** Measure the elapsed milliseconds of a navigation operation. */
export async function measureNavigationLatency(driver: Driver, key: number): Promise<number> {
  const start: number = Date.now();
  await pressAndWait(driver, key, 1, DELAY_KEY_NAVIGATION);
  return Date.now() - start;
}

/** Count how many of the given texts are visible on the current page. */
export async function countVisibleTexts(driver: Driver, expected: string[]): Promise<number> {
  let count: number = 0;
  for (let i = 0; i < expected.length; i++) {
    const found: boolean = await checkTextContent(driver, expected[i]);
    if (found) {
      count++;
    }
  }
  return count;
}

/** Average width of all Image components on the current page. */
export async function averageImageWidth(driver: Driver): Promise<number> {
  const images: Component[] = await findComponentsByType(driver, 'Image');
  const widths: number[] = [];
  for (let i = 0; i < images.length; i++) {
    const bounds: Rect = await safeGetBounds(images[i]);
    widths.push(bounds.right - bounds.left);
  }
  return average(widths);
}

/** Total area currently occupied by Text components. */
export async function totalTextArea(driver: Driver): Promise<number> {
  const texts: Component[] = await findComponentsByType(driver, 'Text');
  let area: number = 0;
  for (let i = 0; i < texts.length; i++) {
    const bounds: Rect = await safeGetBounds(texts[i]);
    area += (bounds.right - bounds.left) * (bounds.bottom - bounds.top);
  }
  return area;
}

/** True when every provided numeric sample is within the given budget. */
export function samplesWithinBudget(samples: number[], budgetMs: number): boolean {
  for (let i = 0; i < samples.length; i++) {
    if (samples[i] > budgetMs) {
      return false;
    }
  }
  return true;
}

/** Normalize a face rectangle to the [0, 1] range used by imagePreview. */
export function normalizeFaceBox(x: number, y: number, w: number, h: number,
  imageW: number, imageH: number): number[] {
  if (imageW <= 0 || imageH <= 0) {
    return [0, 0, 0, 0];
  }
  return [clamp(x / imageW, 0, 1), clamp(y / imageH, 0, 1),
    clamp(w / imageW, 0, 1), clamp(h / imageH, 0, 1)];
}

/** Compute the IoU of two rectangles, used by face de-duplication checks. */
export function intersectionOverUnion(ax1: number, ay1: number, ax2: number, ay2: number,
  bx1: number, by1: number, bx2: number, by2: number): number {
  const interLeft: number = Math.max(ax1, bx1);
  const interTop: number = Math.max(ay1, by1);
  const interRight: number = Math.min(ax2, bx2);
  const interBottom: number = Math.min(ay2, by2);
  const interW: number = Math.max(0, interRight - interLeft);
  const interH: number = Math.max(0, interBottom - interTop);
  const interArea: number = interW * interH;
  const areaA: number = Math.max(0, ax2 - ax1) * Math.max(0, ay2 - ay1);
  const areaB: number = Math.max(0, bx2 - bx1) * Math.max(0, by2 - by1);
  const union: number = areaA + areaB - interArea;
  if (union <= 0) {
    return 0;
  }
  return interArea / union;
}

/** Wait for the device list page to finish its first discovery tick. */
export async function waitForDeviceListStable(driver: Driver): Promise<boolean> {
  const deadline: number = Date.now() + TIMEOUT_PAGE_RENDER;
  while (Date.now() < deadline) {
    if (await isDeviceAuthVisible(driver)) {
      await serializedDelay(driver, DELAY_PAGE_TRANSITION);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

/** Toggle the discovery button on the distributed authentication page. */
export async function toggleDeviceDiscovery(driver: Driver): Promise<boolean> {
  const clicked: boolean = await clickById(driver, 'button');
  if (clicked) {
    await serializedDelay(driver, DELAY_PAGE_TRANSITION);
  }
  return clicked;
}

/** Reset the display rotation and return to the home screen. */
export async function cleanupEnvironment(driver: Driver): Promise<void> {
  try {
    await ensureHome(driver);
    hilog.info(0x0000, TAG, '%{public}s', 'cleanupEnvironment returned to home');
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', 'cleanupEnvironment failed');
  }
}
