/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import worker, { MessageEvents, ErrorEvent } from '@ohos.worker';
import taskpool from '@ohos.taskpool';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import { TestA, TestB } from '../../../../main/ets/component/test';
import { SendableClass } from '../../../../main/ets/component/SendableTest';
import MyFile from '../../../../main/ets/fileFs/MyWorker';
import {
  stringToBuffer,
  bufferToString,
  strToArrayBuffer,
  strToUtf8Bytes,
  randomString,
  sleep,
} from '../../../../main/ets/common/Common';

export { TestA, TestB, SendableClass, MyFile };
export { stringToBuffer, bufferToString, strToArrayBuffer, strToUtf8Bytes, randomString, sleep };
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const TIMEOUT_RESULT: number = 10000;
export const POLL_INTERVAL: number = 50;
let driverInstance: Driver | undefined = undefined;
let operationQueue: Promise<void> = Promise.resolve();

// Keep the reference Promise queue: failed actions must not poison later UI work.
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const previous: Promise<void> = operationQueue;
  const result: Promise<T> = previous.then(action);
  operationQueue = result.then(
    () => {},
    (error: Error) => {
      hilog.error(0xf811, 'ConcurrentTest', 'UI operation failed: %{public}s', error.message);
    },
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
  await runSerializedUiOperation(async () => {
    await driver.delayMs(milliseconds);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  milliseconds: number = POLL_INTERVAL,
): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(milliseconds);
    }
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async () => {
    return (await driver.findComponents(ON.type(type))) ?? [];
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function checkTextContent(driver: Driver, expected: string): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    const components: Component[] = (await driver.findComponents(ON.type('Text'))) ?? [];
    for (const component of components) {
      const text: string = await component.getText();
      if (text === expected) {
        return true;
      }
    }
    return false;
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async () => {
    const components: Component[] = (await driver.findComponents(ON.focused(true))) ?? [];
    return components.length === 0 ? -1 : 0;
  });
}

export async function checkFocusState(driver: Driver, expectedIndex: number): Promise<boolean> {
  const actualIndex: number = await getCurrentFocusIndex(driver);
  return actualIndex === expectedIndex;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
  });
}

export async function launchConcurrentApp(): Promise<void> {
  hilog.info(0xf811, 'ConcurrentTest', 'Launching entry ability');
  const delegator = registry.getAbilityDelegator();
  const args = registry.getArguments();
  await delegator.startAbility({ bundleName: args.bundleName, moduleName: 'entry', abilityName: 'EntryAbility' });
  hilog.info(0xf811, 'ConcurrentTest', 'Entry ability launched');
}

export async function waitForComponent(id: string, milliseconds: number = TIMEOUT_RESULT): Promise<void> {
  const deadline: number = Date.now() + milliseconds;
  while (Date.now() < deadline) {
    const exists: boolean = await runSerializedUiOperation(async () => {
      const components: Component[] = (await getDriver().findComponents(ON.id(id))) ?? [];
      return components.length > 0;
    });
    if (exists) {
      return;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL);
  }
  throw new Error('Timed out waiting for component: ' + id);
}

export async function clickId(id: string): Promise<void> {
  hilog.info(0xf811, 'ConcurrentTest', 'Click requested: %{public}s', id);
  await runSerializedUiOperation(async () => {
    const component: Component = await getDriver().waitForComponent(ON.id(id), TIMEOUT_RESULT);
    if (component === null) {
      throw new Error('Timed out waiting for component to click: ' + id);
    }
    await component.click();
  });
}

export async function readId(id: string): Promise<string> {
  return runSerializedUiOperation(async () => {
    let component: Component = await getDriver().findComponent(ON.id(id));
    if (component === null) {
      const scroll: Component = await getDriver().findComponent(ON.type('Scroll'));
      if (scroll !== null) {
        component = await scroll.scrollSearch(ON.id(id));
      }
    }
    if (component === null) {
      throw new Error('Component is not visible: ' + id);
    }
    return component.getText();
  });
}

export async function inputId(id: string, text: string): Promise<void> {
  await runSerializedUiOperation(async () => {
    const component: Component = await getDriver().waitForComponent(ON.id(id), TIMEOUT_RESULT);
    if (component === null) {
      throw new Error('Timed out waiting for input component: ' + id);
    }
    await component.inputText(text);
    // Empty input may not focus the editor; Back would then leave the page.
    const focused: Component[] = (await getDriver().findComponents(ON.id(id).focused(true))) ?? [];
    if (focused.length > 0) {
      await getDriver().triggerKey(KEY_BACK);
    }
  });
}

export async function waitForText(
  id: string,
  expected: string,
  milliseconds: number = TIMEOUT_RESULT,
): Promise<string> {
  const deadline: number = Date.now() + milliseconds;
  let actual: string = '';
  while (Date.now() < deadline) {
    actual = await readId(id);
    if (actual === expected) {
      return actual;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL);
  }
  throw new Error('Unexpected text for ' + id + ': ' + actual + '; expected: ' + expected);
}

// Navigate back through observable pages instead of relying on suite ordering.
export async function openHome(): Promise<void> {
  await launchConcurrentApp();
  await serializedDelay(getDriver(), 500);
  for (let attempt: number = 0; attempt < 4; attempt++) {
    const atHome: boolean = await runSerializedUiOperation(async () => {
      const components: Component[] = (await getDriver().findComponents(ON.id('strSort'))) ?? [];
      return components.length > 0;
    });
    if (atHome) {
      return;
    }
    await triggerSerializedKey(getDriver(), KEY_BACK);
    await serializedDelay(getDriver(), 100);
  }
  await waitForComponent('strSort');
}

export async function openSortPage(taskPool: boolean): Promise<void> {
  await openHome();
  await clickId('strSort');
  await clickId(taskPool ? 'tabTaskPool' : 'tabJsWorker');
  await waitForComponent(taskPool ? 'taskPoolInPutTextArea' : 'jsWorkerInPutTextArea');
  await clickId(taskPool ? 'taskPoolClearButton' : 'workerClearButton');
}

export async function sortThroughUi(
  input: string,
  taskPool: boolean,
  action: string = 'exeImmButton',
): Promise<string> {
  await openSortPage(taskPool);
  await inputId(taskPool ? 'taskPoolInPutTextArea' : 'jsWorkerInPutTextArea', input);
  await clickId(taskPool ? action : 'workerStrSort');
  const expected: string =
    input.length === 0
      ? 'No input for the string to be sorted.\n'
      : (taskPool ? 'Task executed successfully: ' : '') +
        input.trim().split(',').sort().join(',') +
        (taskPool ? '\n' : '');
  return waitForText(taskPool ? 'taskPoolOutPutText' : 'jsWorkerOutPutText', expected);
}

// Register callbacks before posting and always terminate the shipped Worker.ts.
export async function executeWorkerFunc(input: string[]): Promise<string[]> {
  const instance: worker.ThreadWorker = new worker.ThreadWorker('entry_test@entry/ets/workers/Worker.ts');
  try {
    return await new Promise<string[]>((resolve, reject) => {
      const timer: number = setTimeout(() => {
        reject(new Error('Worker sorting timed out'));
      }, TIMEOUT_RESULT);
      instance.onmessage = (event: MessageEvents): void => {
        clearTimeout(timer);
        resolve(event.data as string[]);
      };
      instance.onerror = (event: ErrorEvent): void => {
        clearTimeout(timer);
        reject(new Error('Worker sorting failed: ' + event.message));
      };
      instance.onmessageerror = (): void => {
        clearTimeout(timer);
        reject(new Error('Worker sorting message could not be deserialized'));
      };
      instance.postMessage(input);
    });
  } finally {
    instance.terminate();
  }
}

// This fixture exercises SDK execution only; production TaskPoolTab is tested via UI.
@Concurrent
export function sortTask(input: string[]): string[] {
  return input.sort();
}

export async function executeTask(input: string[], functionTask: boolean): Promise<string[]> {
  if (functionTask) {
    return (await taskpool.execute(sortTask, input)) as string[];
  }
  const task: taskpool.Task = new taskpool.Task(sortTask, input);
  return (await taskpool.execute(task)) as string[];
}

export async function executeGroup(inputs: string[][]): Promise<string[][]> {
  const group: taskpool.TaskGroup = new taskpool.TaskGroup();
  for (const input of inputs) {
    group.addTask(new taskpool.Task(sortTask, input));
  }
  return (await taskpool.execute(group)) as string[][];
}

@Concurrent
export async function updateSendable(data: SendableClass, count: number): Promise<void> {
  await data.data1.setCount(count);
  data.data1.v1 = count;
  data.data1.v2 = 'worker';
  data.data1.v3 = true;
  data.data2.v1.push(count);
  data.data2.v2.set(count, 'shared');
  data.data2.v3.add('shared');
}

export async function transferSendable(data: SendableClass, count: number): Promise<void> {
  const task: taskpool.Task = new taskpool.Task(updateSendable, data, count);
  await taskpool.execute(task);
}

export interface CopyRequest {
  srcDir: string;
  destDir: string;
  fileNames: string[];
}

export interface CopyReply {
  count: number;
  strFlag: boolean;
  listFileNames: string[];
}

export async function copyThroughWorker(request: CopyRequest): Promise<CopyReply> {
  const instance: worker.ThreadWorker = new worker.ThreadWorker('entry_test@entry/ets/workers/WorkerCopy.ts');
  try {
    return await new Promise<CopyReply>((resolve, reject) => {
      const timer: number = setTimeout(() => {
        reject(new Error('Worker file copy timed out'));
      }, TIMEOUT_RESULT);
      instance.onmessage = (event: MessageEvents): void => {
        clearTimeout(timer);
        resolve(event.data as CopyReply);
      };
      instance.onerror = (event: ErrorEvent): void => {
        clearTimeout(timer);
        reject(new Error('Worker file copy failed: ' + event.message));
      };
      instance.onmessageerror = (): void => {
        clearTimeout(timer);
        reject(new Error('Worker file copy reply could not be deserialized'));
      };
      instance.postMessage(request);
    });
  } finally {
    instance.terminate();
  }
}

export interface FileFixture {
  root: string;
  source: string;
  destination: string;
}

export function createFileFixture(name: string): FileFixture {
  const context = registry.getAbilityDelegator().getAppContext();
  const root: string = context.cacheDir + '/concurrent_' + name;
  if (fs.accessSync(root)) {
    fs.rmdirSync(root);
  }
  fs.mkdirSync(root);
  const source: string = root + '/workerDir';
  const destination: string = root + '/copy';
  fs.mkdirSync(source);
  fs.mkdirSync(destination);
  return { root: root, source: source, destination: destination };
}

export function writeFixture(path: string, content: string): void {
  const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  try {
    fs.writeSync(file.fd, content);
  } finally {
    fs.closeSync(file);
  }
}

export function readFixture(path: string): string {
  return fs.readTextSync(path);
}

export function removeFileFixture(fixture: FileFixture): void {
  if (fs.accessSync(fixture.root)) {
    fs.rmdirSync(fixture.root);
  }
}

export function createMyFile(fixture: FileFixture): MyFile {
  const file: MyFile = new MyFile();
  file.baseDir = fixture.root;
  return file;
}

export class OperationSample {
  name: string;
  elapsed: number;
  constructor(name: string, elapsed: number) {
    this.name = name;
    this.elapsed = elapsed;
  }
}

// Adapt the reusable reference history/statistics logic to real measured operations.
export class OperationRecorder {
  private samples: OperationSample[] = [];
  record(name: string, elapsed: number): void {
    this.samples.push(new OperationSample(name, elapsed));
  }
  clear(): void {
    this.samples = [];
  }
  count(): number {
    return this.samples.length;
  }
  total(): number {
    let total: number = 0;
    for (const sample of this.samples) {
      total += sample.elapsed;
    }
    return total;
  }
  maximum(): number {
    let maximum: number = 0;
    for (const sample of this.samples) {
      maximum = Math.max(maximum, sample.elapsed);
    }
    return maximum;
  }
  average(): number {
    return this.samples.length === 0 ? 0 : this.total() / this.samples.length;
  }
  history(): OperationSample[] {
    return this.samples.slice();
  }
}

export function bytesOf(buffer: ArrayBuffer): number[] {
  const view: DataView = new DataView(buffer);
  const bytes: number[] = [];
  for (let index: number = 0; index < buffer.byteLength; index++) {
    bytes.push(view.getUint8(index));
  }
  return bytes;
}

export function equalBytes(left: number[], right: number[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index: number = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

export function isNondecreasing(values: string[]): boolean {
  for (let index: number = 1; index < values.length; index++) {
    if (values[index - 1] > values[index]) {
      return false;
    }
  }
  return true;
}

export function occurrences(values: string[], token: string): number {
  let count: number = 0;
  for (const value of values) {
    if (value === token) {
      count++;
    }
  }
  return count;
}

// Preserve reusable component counting without a wildcard or a tolerance assertion.
export async function concurrentComponentCount(driver: Driver, type: string): Promise<number> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length;
}

export async function waitForPageStable(id: string): Promise<boolean> {
  await waitForComponent(id);
  return true;
}

export async function triggerConcurrentPage(taskPool: boolean): Promise<void> {
  await openSortPage(taskPool);
}

export async function isConcurrentPageVisible(taskPool: boolean): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    const id: string = taskPool ? 'taskPoolInPutTextArea' : 'jsWorkerInPutTextArea';
    const components: Component[] = (await getDriver().findComponents(ON.id(id))) ?? [];
    return components.length > 0;
  });
}

export async function drainUiOperations(): Promise<void> {
  await operationQueue;
}

export async function resetDriver(): Promise<void> {
  await drainUiOperations();
  driverInstance = undefined;
}
