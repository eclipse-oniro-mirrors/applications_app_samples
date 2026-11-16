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

import worker, { MessageEvents, ErrorEvent } from '@ohos.worker';
import hilog from '@ohos.hilog';
import { Driver, ON, Component } from '@ohos.UiTest';
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { expect } from '@ohos/hypium';

export const ID_TASK_POOL: string = 'id_btn_task_pool_calculate';
export const ID_WORKER: string = 'id_btn_worker_calculate';
export const ID_MESSAGE: string = 'id_text_message';
export const ID_IMAGE: string = 'id_top_image';
export const ID_TITLE: string = 'id_top_text';
export const CALCULATING: string = 'Calculating...';
export const INITIAL_MESSAGE: string = 'Click button to calculate.';
export const RESULT_PREFIX: string = 'Total time costed = ';
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const TIMEOUT_RENDER: number = 10000;
export const TIMEOUT_COMPUTE: number = 120000;
export const POLL_INTERVAL: number = 50;

export interface TrajectoryResult {
  steps: number;
  dt: number;
  initialEnergy: number;
  middleEnergy: number;
  finalEnergy: number;
  repeatedEnergy: number;
  requests: number;
}

interface ProbeRequest {
  steps: number;
  dt: number;
  mode: string;
}

interface ComputeReply {
  result: number;
}

interface ComputeRequest {
  timeSteps: number;
}

let activeWorkers: number = 0;
let driverInstance: Driver | undefined = undefined;
let uiQueue: Promise<void> = Promise.resolve();

export function logSuite(name: string, phase: string): void {
  hilog.info(0xf811, 'NBodyTest', '%{public}s %{public}s', name, phase);
}

export function assertNoActiveWorkers(): void {
  const actual: number = activeWorkers;
  expect(actual).assertEqual(0);
}

export function activeWorkerCount(): number {
  return activeWorkers;
}

export function sleep(milliseconds: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, milliseconds);
  });
}

export async function runIsolatedTrajectory(steps: number, dt: number, mode: string): Promise<TrajectoryResult> {
  const probe = new worker.ThreadWorker('entry_test/ets/workers/NBodyProbe.ts');
  activeWorkers++;
  try {
    return await new Promise<TrajectoryResult>((resolve, reject) => {
      let settled: boolean = false;
      const timer: number = setTimeout(() => {
        settled = true;
        reject(new Error('NBody numerical Worker timed out'));
      }, TIMEOUT_RENDER);
      probe.onmessage = (event: MessageEvents): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          const result: TrajectoryResult = event.data;
          resolve(result);
        }
      };
      probe.onerror = (event: ErrorEvent): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          reject(new Error('NBody probe error: ' + event.message));
        }
      };
      probe.onmessageerror = (): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          reject(new Error('NBody probe message decode failed'));
        }
      };
      const request: ProbeRequest = { steps, dt, mode };
      probe.postMessage(request);
    });
  } finally {
    probe.terminate();
    activeWorkers--;
  }
}

export async function runProductionWorker(steps: number): Promise<number> {
  const instance = new worker.ThreadWorker('entry_test/ets/workers/ProductionWorker.ts');
  activeWorkers++;
  try {
    return await new Promise<number>((resolve, reject) => {
      let settled: boolean = false;
      const timer: number = setTimeout(() => {
        settled = true;
        reject(new Error('Production Worker timed out'));
      }, TIMEOUT_COMPUTE);
      instance.onmessage = (event: MessageEvents): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          const reply: ComputeReply = event.data;
          if (typeof reply.result !== 'number' || !isFinite(reply.result) || reply.result < 0) {
            reject(new Error('Invalid production Worker duration'));
          } else {
            resolve(reply.result);
          }
        }
      };
      instance.onerror = (event: ErrorEvent): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          reject(new Error('Production Worker error: ' + event.message));
        }
      };
      instance.onmessageerror = (): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          reject(new Error('Production Worker message decode failed'));
        }
      };
      const request: ComputeRequest = { timeSteps: steps };
      instance.postMessage(request);
    });
  } finally {
    instance.terminate();
    activeWorkers--;
  }
}

// A failed action rejects its caller but does not poison subsequent UI actions.
// Callers must not enqueue another action from inside an action.
export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const result: Promise<T> = uiQueue.then(action);
  uiQueue = result.then(
    (): void => {},
    (): void => {},
  );
  return result;
}

export function getDriver(): Driver {
  if (driverInstance === undefined) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

export async function serializedDelay(driver: Driver, milliseconds: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.delayMs(milliseconds);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.triggerKey(key);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  milliseconds: number = POLL_INTERVAL,
): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(milliseconds);
    }
  });
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.click(x, y);
    await driver.delayMs(POLL_INTERVAL);
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    const components: Component[] = await driver.findComponents(ON.type(type));
    return components ?? [];
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function checkTextContent(driver: Driver, expected: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const components: Component[] = await driver.findComponents(ON.text(expected));
    return components !== undefined && components !== null && components.length > 0;
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async (): Promise<number> => {
    const components: Component[] = await driver.findComponents(ON.type('Button'));
    if (components === undefined || components === null) {
      return -1;
    }
    for (let index: number = 0; index < components.length; index++) {
      if (await components[index].isFocused()) {
        return index;
      }
    }
    return -1;
  });
}

export async function checkFocusState(driver: Driver, expectedIndex: number): Promise<boolean> {
  const actual: number = await getCurrentFocusIndex(driver);
  return expectedIndex === -1 ? actual >= 0 : actual === expectedIndex;
}

export async function nbodyComponentCount(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async (): Promise<number> => {
    const ids: string[] = [ID_TASK_POOL, ID_WORKER, ID_MESSAGE, ID_IMAGE, ID_TITLE];
    let count: number = 0;
    for (const id of ids) {
      const component: Component = await driver.findComponent(ON.id(id));
      if (component !== undefined && component !== null) {
        count++;
      } else {
        hilog.warn(0xf811, 'NBodyTest', 'Missing page component: %{public}s', id);
      }
    }
    return count;
  });
}

export async function launchNBodyApp(): Promise<void> {
  const driver: Driver = getDriver();
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.wakeUpDisplay();
  });
  const delegator = registry.getAbilityDelegator();
  const args = registry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility',
    moduleName: 'entry',
  };
  await delegator.startAbility(want);
}

export async function waitForPageStable(driver: Driver, timeout: number = TIMEOUT_RENDER): Promise<void> {
  const deadline: number = Date.now() + timeout;
  let unlocked: boolean = false;
  while (Date.now() < deadline) {
    const count: number = await nbodyComponentCount(driver);
    if (count === 5) {
      return;
    }
    if (count === 0 && !unlocked) {
      unlocked = true;
      await runSerializedUiOperation(async (): Promise<void> => {
        const size = await driver.getDisplaySize();
        await driver.swipe(size.x / 2, size.y * 0.85, size.x / 2, size.y * 0.2, 600);
      });
      await launchNBodyApp();
    }
    await serializedDelay(driver, POLL_INTERVAL);
  }
  throw new Error(
    'NBody page did not expose all five component IDs; verify the device is unlocked and EntryAbility is visible',
  );
}

export async function readMessage(driver: Driver): Promise<string> {
  return runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(ID_MESSAGE));
    if (component === undefined || component === null) {
      throw new Error('NBody message component is missing');
    }
    return component.getText();
  });
}

export async function clickById(driver: Driver, id: string): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      throw new Error('Missing component: ' + id);
    }
    await component.click();
  });
}

export async function waitForMessage(
  driver: Driver,
  expected: string,
  timeout: number = TIMEOUT_RENDER,
): Promise<void> {
  const deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    const actual: string = await readMessage(driver);
    if (actual === expected) {
      return;
    }
    await serializedDelay(driver, POLL_INTERVAL);
  }
  throw new Error('Timed out waiting for NBody message: ' + expected);
}

export async function waitForCalculationResult(driver: Driver): Promise<string> {
  const deadline: number = Date.now() + TIMEOUT_COMPUTE;
  while (Date.now() < deadline) {
    const text: string = await readMessage(driver);
    if (text.startsWith(RESULT_PREFIX)) {
      assertDurationText(text);
      return text;
    }
    await serializedDelay(driver, POLL_INTERVAL);
  }
  throw new Error('NBody UI calculation timed out');
}

export function assertDurationText(text: string): void {
  const startsCorrectly: boolean = text.startsWith(RESULT_PREFIX);
  const endsCorrectly: boolean = text.endsWith(' ms.');
  expect(startsCorrectly).assertTrue();
  expect(endsCorrectly).assertTrue();
  const numericText: string = text.substring(RESULT_PREFIX.length, text.length - 4);
  const duration: number = Number(numericText);
  const numeric: boolean = numericText.length > 0 && isFinite(duration);
  const nonnegative: boolean = duration >= 0;
  const integer: boolean = Math.floor(duration) === duration;
  expect(numeric).assertTrue();
  expect(nonnegative).assertTrue();
  expect(integer).assertTrue();
}

export function resourceString(resource: Resource): string {
  const manager = registry.getAbilityDelegator().getAppContext().resourceManager;
  return manager.getStringSync(resource);
}

export async function waitForDialog(driver: Driver): Promise<void> {
  const message: string = resourceString($r('app.string.AlertDialog_message'));
  const deadline: number = Date.now() + TIMEOUT_RENDER;
  while (Date.now() < deadline) {
    if (await checkTextContent(driver, message)) {
      return;
    }
    await serializedDelay(driver, POLL_INTERVAL);
  }
  throw new Error('Repeated calculation dialog did not appear');
}

export async function dismissDialog(driver: Driver): Promise<void> {
  const label: string = resourceString($r('app.string.AlertDialog_ok'));
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component = await driver.findComponent(ON.text(label));
    if (component === undefined || component === null) {
      throw new Error('Dialog confirmation is missing');
    }
    await component.click();
  });
}

export async function waitForStorageResult(timeout: number = TIMEOUT_RENDER): Promise<string> {
  const deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    const value: string | undefined = AppStorage.get<string>('timeCost');
    if (value !== undefined && value.startsWith(RESULT_PREFIX)) {
      assertDurationText(value);
      return value;
    }
    await sleep(POLL_INTERVAL);
  }
  throw new Error('Calculation did not publish a result to AppStorage');
}

export function initializeStorage(): void {
  AppStorage.setOrCreate<string>('timeCost', 'pending');
}

export async function withTimeout<T>(operation: Promise<T>, timeout: number): Promise<T> {
  return new Promise<T>((resolve, reject) => {
    let settled: boolean = false;
    const timer: number = setTimeout(() => {
      if (!settled) {
        settled = true;
        reject(new Error('NBody asynchronous operation timed out'));
      }
    }, timeout);
    operation.then(
      (value: T): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          resolve(value);
        }
      },
      (error: Error): void => {
        if (!settled) {
          settled = true;
          clearTimeout(timer);
          reject(error);
        }
      },
    );
  });
}

export async function assertButtonsEnabled(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const taskButton: Component = await driver.findComponent(ON.id(ID_TASK_POOL));
    const workerButton: Component = await driver.findComponent(ON.id(ID_WORKER));
    const taskEnabled: boolean = await taskButton.isEnabled();
    const workerEnabled: boolean = await workerButton.isEnabled();
    expect(taskEnabled).assertTrue();
    expect(workerEnabled).assertTrue();
  });
}

export async function waitForDialogDismissed(driver: Driver): Promise<void> {
  const text: string = resourceString($r('app.string.AlertDialog_message'));
  const deadline: number = Date.now() + TIMEOUT_RENDER;
  while (Date.now() < deadline) {
    const visible: boolean = await checkTextContent(driver, text);
    if (!visible) {
      return;
    }
    await serializedDelay(driver, POLL_INTERVAL);
  }
  throw new Error('Repeated calculation dialog remained visible');
}

export async function assertResultMatchesStorage(driver: Driver): Promise<void> {
  const displayed: string = await readMessage(driver);
  const stored: string | undefined = AppStorage.get<string>('timeCost');
  assertDurationText(displayed);
  expect(stored).assertEqual(displayed);
}

export async function assertCoreComponents(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.assertComponentExist(ON.id(ID_IMAGE));
    await driver.assertComponentExist(ON.id(ID_TITLE));
    await driver.assertComponentExist(ON.id(ID_MESSAGE));
    await driver.assertComponentExist(ON.id(ID_TASK_POOL));
    await driver.assertComponentExist(ON.id(ID_WORKER));
  });
}

export async function assertMessageUnchanged(driver: Driver, expected: string): Promise<void> {
  const firstRead: string = await readMessage(driver);
  await serializedDelay(driver, POLL_INTERVAL);
  const secondRead: string = await readMessage(driver);
  expect(firstRead).assertEqual(expected);
  expect(secondRead).assertEqual(expected);
}

export async function assertNoDialog(driver: Driver): Promise<void> {
  const text: string = resourceString($r('app.string.AlertDialog_message'));
  const visible: boolean = await checkTextContent(driver, text);
  expect(visible).assertFalse();
}

export function clearStorage(): void {
  AppStorage.setOrCreate<string>('timeCost', '');
}

export async function assertPageResources(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const title: Component = await driver.findComponent(ON.id(ID_TITLE));
    const task: Component = await driver.findComponent(ON.id(ID_TASK_POOL));
    const workerButton: Component = await driver.findComponent(ON.id(ID_WORKER));
    const actualTitle: string = await title.getText();
    const actualTask: string = await task.getText();
    const actualWorker: string = await workerButton.getText();
    const expectedTitle: string = resourceString($r('app.string.page_title'));
    const expectedTask: string = resourceString($r('app.string.button_task_pool_text'));
    const expectedWorker: string = resourceString($r('app.string.button_worker_text'));
    expect(actualTitle).assertEqual(expectedTitle);
    expect(actualTask).assertEqual(expectedTask);
    expect(actualWorker).assertEqual(expectedWorker);
  });
}
