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
import screenLock from '@ohos.screenLock';

const LOG_TAG: string = 'SensorCapiTest';
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_ENTER: number = 2049;
export const TIMEOUT_PAGE_RENDER: number = 5000;
export const TIMEOUT_SENSOR_OPERATION: number = 5000;
export const DELAY_POLL: number = 100;
export const SENSOR_INFO_BUTTON: string = 'getSensorInfosId';
export const SUBSCRIBER_BUTTON: string = 'subscriberId';
export const SENSOR_RESULT: string = 'sensorCapiResult';
let sharedDriver: Driver | undefined = undefined;
let uiOperationQueue: Promise<void> = Promise.resolve();

export interface SensorPageSnapshot {
  infoText: string;
  subscriberText: string;
  resultText: string;
  infoEnabled: boolean;
  subscriberEnabled: boolean;
  infoClickable: boolean;
  subscriberClickable: boolean;
  resultCount: number;
  buttonCount: number;
}

export interface OperationRecord {
  buttonId: string;
  expectedText: string;
  actualText: string;
  durationMs: number;
}

export class ScenarioStepModel {
  buttonId: string;
  expectedText: string;

  constructor(buttonId: string, expectedText: string) {
    this.buttonId = buttonId;
    this.expectedText = expectedText;
  }
}

export class RegressionTestRecorder {
  private records: OperationRecord[] = [];

  add(record: OperationRecord): void {
    if (!Number.isFinite(record.durationMs) || record.durationMs < 0) {
      throw new Error('Operation duration must be finite and nonnegative');
    }
    if (record.buttonId.length === 0) {
      throw new Error('Operation record requires a component identifier');
    }
    this.records.push(record);
  }

  size(): number {
    return this.records.length;
  }

  allMatched(): boolean {
    for (const record of this.records) {
      if (record.actualText !== record.expectedText) {
        return false;
      }
    }
    return true;
  }

  totalDuration(): number {
    let total: number = 0;
    for (const record of this.records) {
      total += record.durationMs;
    }
    return total;
  }

  get(index: number): OperationRecord {
    if (index < 0 || index >= this.records.length) {
      throw new Error('Operation record index is outside the recorded sequence');
    }
    return this.records[index];
  }

  clear(): void {
    this.records = [];
  }
}

export function getDriver(): Driver {
  if (sharedDriver === undefined) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

export async function resetDriver(): Promise<void> {
  await uiOperationQueue;
  sharedDriver = undefined;
}

export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const result: Promise<T> = uiOperationQueue.then(action);
  uiOperationQueue = result.then(
    (): void => {},
    (error: Error): void => {
      hilog.error(0x0000, LOG_TAG, 'UI operation failed: %{public}s', error.message);
    },
  );
  return result;
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  if (delayMs < 0) {
    throw new Error('Delay must be nonnegative');
  }
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.delayMs(delayMs);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.triggerKey(key);
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    const components: Component[] = (await driver.findComponents(ON.type(type))) ?? [];
    return components;
  });
}

export async function requireComponent(driver: Driver, id: string): Promise<Component> {
  return runSerializedUiOperation(async (): Promise<Component> => {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === null || component === undefined) {
      throw new Error('Required component was not found: ' + id);
    }
    return component;
  });
}

export async function componentExists(driver: Driver, id: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const components: Component[] = (await driver.findComponents(ON.id(id))) ?? [];
    return components.length === 1;
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function sensorPageComponentCount(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async (): Promise<number> => {
    const info: Component[] = (await driver.findComponents(ON.id(SENSOR_INFO_BUTTON))) ?? [];
    const subscriber: Component[] = (await driver.findComponents(ON.id(SUBSCRIBER_BUTTON))) ?? [];
    const result: Component[] = (await driver.findComponents(ON.id(SENSOR_RESULT))) ?? [];
    return info.length + subscriber.length + result.length;
  });
}

export async function isSensorPageVisible(driver: Driver): Promise<boolean> {
  const infoVisible: boolean = await componentExists(driver, SENSOR_INFO_BUTTON);
  const subscriberVisible: boolean = await componentExists(driver, SUBSCRIBER_BUTTON);
  return infoVisible && subscriberVisible;
}

/* UI tests can start while the device is asleep or showing a swipe-only lock screen. */
/* Prepare that state inside the fixture so IDE and command-line runs behave alike. */
export async function prepareSensorDisplay(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.wakeUpDisplay();
    if (!(await screenLock.isScreenLocked())) {
      return;
    }
    if (await screenLock.isSecureMode()) {
      throw new Error('Unlock the credential-protected device before running Sensor UI tests');
    }
    hilog.info(0x0000, LOG_TAG, 'Dismissing the non-secure lock screen before launching Sensor');
    const size = await driver.getDisplaySize();
    await driver.swipe(
      Math.floor(size.x / 2),
      Math.floor(size.y * 0.8),
      Math.floor(size.x / 2),
      Math.floor(size.y * 0.2),
      600,
    );
    const deadline: number = Date.now() + TIMEOUT_PAGE_RENDER;
    while (Date.now() <= deadline) {
      if (!(await screenLock.isScreenLocked())) {
        return;
      }
      await driver.delayMs(DELAY_POLL);
    }
    throw new Error('The non-secure lock screen remained visible after the unlock gesture');
  });
}

export async function launchSensorApp(): Promise<void> {
  const driver: Driver = getDriver();
  await prepareSensorDisplay(driver);
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility',
  };
  await delegator.startAbility(want);
  await waitForSensorPageStable(driver);
  /* Empty Text nodes are absent from the accessibility tree until the first operation. */
  if (!(await componentExists(driver, SENSOR_RESULT))) {
    await invokeSensorOperation(driver, new ScenarioStepModel(SENSOR_INFO_BUTTON, 'getSensorInfos:success'));
  }
}

export async function waitForSensorPageStable(driver: Driver, timeoutMs: number = TIMEOUT_PAGE_RENDER): Promise<void> {
  const deadline: number = Date.now() + timeoutMs;
  let consecutiveMatches: number = 0;
  while (Date.now() <= deadline) {
    const visible: boolean = await isSensorPageVisible(driver);
    if (visible) {
      consecutiveMatches++;
      if (consecutiveMatches === 2) {
        return;
      }
    } else {
      consecutiveMatches = 0;
    }
    await serializedDelay(driver, DELAY_POLL);
  }
  const infoVisible: boolean = await componentExists(driver, SENSOR_INFO_BUTTON);
  const subscriberVisible: boolean = await componentExists(driver, SUBSCRIBER_BUTTON);
  const locked: boolean = await screenLock.isScreenLocked();
  throw new Error(
    'Sensor page did not become stable before the deadline; locked=' +
      locked +
      '; infoButton=' +
      infoVisible +
      '; subscriberButton=' +
      subscriberVisible,
  );
}

export async function readComponentText(driver: Driver, id: string): Promise<string> {
  return runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === null || component === undefined) {
      throw new Error('Cannot read missing component: ' + id);
    }
    return component.getText();
  });
}

export async function readResultText(driver: Driver): Promise<string> {
  return readComponentText(driver, SENSOR_RESULT);
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  const actual: string = await readResultText(driver);
  return actual === expectedText;
}

export async function waitForResult(
  driver: Driver,
  expectedText: string,
  timeoutMs: number = TIMEOUT_SENSOR_OPERATION,
): Promise<string> {
  const deadline: number = Date.now() + timeoutMs;
  let actual: string = '';
  while (Date.now() <= deadline) {
    actual = await readResultText(driver);
    if (actual === expectedText) {
      return actual;
    }
    await serializedDelay(driver, DELAY_POLL);
  }
  throw new Error('Unexpected sensor result. Expected: ' + expectedText + '; actual: ' + actual);
}

export async function clickComponent(driver: Driver, id: string): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === null || component === undefined) {
      throw new Error('Cannot click missing component: ' + id);
    }
    if (!(await component.isEnabled()) || !(await component.isClickable())) {
      throw new Error('Component is not actionable: ' + id);
    }
    await component.click();
  });
}

export async function invokeSensorOperation(driver: Driver, step: ScenarioStepModel): Promise<OperationRecord> {
  const start: number = Date.now();
  await clickComponent(driver, step.buttonId);
  const actual: string = await waitForResult(driver, step.expectedText);
  const record: OperationRecord = {
    buttonId: step.buttonId,
    expectedText: step.expectedText,
    actualText: actual,
    durationMs: Date.now() - start,
  };
  return record;
}

export async function executeScenario(driver: Driver, steps: ScenarioStepModel[]): Promise<RegressionTestRecorder> {
  const recorder: RegressionTestRecorder = new RegressionTestRecorder();
  for (const step of steps) {
    const record: OperationRecord = await invokeSensorOperation(driver, step);
    recorder.add(record);
  }
  return recorder;
}

export async function readPageSnapshot(driver: Driver): Promise<SensorPageSnapshot> {
  return runSerializedUiOperation(async (): Promise<SensorPageSnapshot> => {
    const info: Component = await driver.findComponent(ON.id(SENSOR_INFO_BUTTON));
    const subscriber: Component = await driver.findComponent(ON.id(SUBSCRIBER_BUTTON));
    const result: Component = await driver.findComponent(ON.id(SENSOR_RESULT));
    if (!info || !subscriber || !result) {
      throw new Error('Cannot snapshot an incomplete sensor page');
    }
    const results: Component[] = (await driver.findComponents(ON.id(SENSOR_RESULT))) ?? [];
    const buttons: Component[] = (await driver.findComponents(ON.type('Button'))) ?? [];
    const snapshot: SensorPageSnapshot = {
      infoText: await info.getText(),
      subscriberText: await subscriber.getText(),
      resultText: await result.getText(),
      infoEnabled: await info.isEnabled(),
      subscriberEnabled: await subscriber.isEnabled(),
      infoClickable: await info.isClickable(),
      subscriberClickable: await subscriber.isClickable(),
      resultCount: results.length,
      buttonCount: buttons.length,
    };
    return snapshot;
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async (): Promise<number> => {
    const ids: string[] = [SENSOR_INFO_BUTTON, SUBSCRIBER_BUTTON];
    for (let index: number = 0; index < ids.length; index++) {
      const component: Component = await driver.findComponent(ON.id(ids[index]));
      if (component && (await component.isFocused())) {
        return index;
      }
    }
    return -1;
  });
}

export async function checkFocusState(driver: Driver, expectedIndex: number): Promise<boolean> {
  const actual: number = await getCurrentFocusIndex(driver);
  return actual === expectedIndex;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.click(x, y);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  delayMs: number = DELAY_POLL,
): Promise<void> {
  for (let count: number = 0; count < times; count++) {
    await triggerSerializedKey(driver, key);
    await serializedDelay(driver, delayMs);
  }
}

export async function backgroundAndRestore(driver: Driver): Promise<void> {
  await triggerSerializedKey(driver, KEY_HOME);
  await launchSensorApp();
}

export async function assertSensorPageStructure(driver: Driver): Promise<void> {
  const snapshot: SensorPageSnapshot = await readPageSnapshot(driver);
  if (snapshot.infoText !== 'getSensorInfos') {
    throw new Error('Enumeration button label changed');
  }
  if (snapshot.subscriberText !== 'subscriber') {
    throw new Error('Subscription button label changed');
  }
  if (snapshot.buttonCount !== 2 || snapshot.resultCount !== 1) {
    throw new Error('Sensor page has an unexpected component count');
  }
  if (!snapshot.infoEnabled || !snapshot.subscriberEnabled) {
    throw new Error('Sensor buttons are disabled');
  }
  if (!snapshot.infoClickable || !snapshot.subscriberClickable) {
    throw new Error('Sensor buttons do not expose click actions');
  }
}

export async function assertButtonBounds(driver: Driver, id: string): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component = await driver.findComponent(ON.id(id));
    if (!component) {
      throw new Error('Cannot inspect bounds of missing component: ' + id);
    }
    const bounds = await component.getBounds();
    if (bounds.right <= bounds.left || bounds.bottom <= bounds.top) {
      throw new Error('Sensor button has empty bounds: ' + id);
    }
    if (bounds.left < 0 || bounds.top < 0) {
      throw new Error('Sensor button extends outside the visible origin: ' + id);
    }
  });
}

export async function tapButtonCenter(driver: Driver, id: string): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component = await driver.findComponent(ON.id(id));
    if (!component) {
      throw new Error('Cannot tap missing component: ' + id);
    }
    const bounds = await component.getBounds();
    const centerX: number = Math.floor((bounds.left + bounds.right) / 2);
    const centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
    await driver.click(centerX, centerY);
  });
}

export async function assertResultIsReadOnly(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component = await driver.findComponent(ON.id(SENSOR_RESULT));
    if (!component) {
      throw new Error('Sensor result component is missing');
    }
    const type: string = await component.getType();
    if (type !== 'Text') {
      throw new Error('Sensor result must use a read-only Text component');
    }
  });
}

export async function assertVerticalButtonOrder(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const info: Component = await driver.findComponent(ON.id(SENSOR_INFO_BUTTON));
    const subscriber: Component = await driver.findComponent(ON.id(SUBSCRIBER_BUTTON));
    if (!info || !subscriber) {
      throw new Error('Sensor operation buttons are missing');
    }
    const upper = await info.getBounds();
    const lower = await subscriber.getBounds();
    if (upper.bottom > lower.top) {
      throw new Error('Sensor operation buttons overlap or appear in reverse order');
    }
  });
}

export async function assertUniqueComponentIds(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const ids: string[] = [SENSOR_INFO_BUTTON, SUBSCRIBER_BUTTON, SENSOR_RESULT];
    for (const id of ids) {
      const matches: Component[] = (await driver.findComponents(ON.id(id))) ?? [];
      if (matches.length !== 1) {
        throw new Error('Sensor component ID is missing or duplicated: ' + id);
      }
    }
  });
}

export async function assertOperationLabelsPersist(driver: Driver): Promise<void> {
  const info: string = await readComponentText(driver, SENSOR_INFO_BUTTON);
  const subscriber: string = await readComponentText(driver, SUBSCRIBER_BUTTON);
  if (info !== 'getSensorInfos' || subscriber !== 'subscriber') {
    throw new Error('Invoking a sensor operation changed an action label');
  }
}

export async function assertResultPrecedesActions(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const result: Component = await driver.findComponent(ON.id(SENSOR_RESULT));
    const info: Component = await driver.findComponent(ON.id(SENSOR_INFO_BUTTON));
    if (!result || !info) {
      throw new Error('Cannot inspect result and action layout');
    }
    const resultBounds = await result.getBounds();
    const infoBounds = await info.getBounds();
    if (resultBounds.top > infoBounds.top) {
      throw new Error('Sensor result panel must precede the operation buttons');
    }
  });
}

export async function assertResultPersistsAcrossForeground(driver: Driver): Promise<void> {
  const before: string = await readResultText(driver);
  await backgroundAndRestore(driver);
  const after: string = await readResultText(driver);
  if (after !== before) {
    throw new Error('Foreground transition changed the last sensor operation result');
  }
  await assertSensorPageStructure(driver);
}
