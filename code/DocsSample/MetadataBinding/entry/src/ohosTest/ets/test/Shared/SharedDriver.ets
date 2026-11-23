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
import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import screenLock from '@ohos.screenLock';
import { BusinessError } from '@kit.BasicServicesKit';
import { MetadataBindingPort } from '../../../../main/ets/model/MetadataBindingController';

export class MetadataCall {
  operation: string;
  eventType: string;
  bundleName: string;
  callback: Callback<number> | undefined;
  metadata: string;

  constructor(operation: string, eventType: string, bundleName: string,
    callback: Callback<number> | undefined, metadata: string) {
    this.operation = operation;
    this.eventType = eventType;
    this.bundleName = bundleName;
    this.callback = callback;
    this.metadata = metadata;
  }
}

export class InjectedMetadataError extends Error implements BusinessError {
  code: number;

  constructor(code: number) {
    super('Injected metadata service failure');
    this.name = 'BusinessError';
    this.code = code;
  }
}

export class RecordingMetadataPort implements MetadataBindingPort {
  private calls: MetadataCall[] = [];
  private primaryCallback: Callback<number> | undefined = undefined;
  private secondaryCallback: Callback<number> | undefined = undefined;
  private failureOperation: string = '';
  private failureCode: number = 0;

  bindCallbacks(primary: Callback<number>, secondary: Callback<number>): void {
    this.primaryCallback = primary;
    this.secondaryCallback = secondary;
  }

  failNext(operation: string, code: number): void {
    this.failureOperation = operation;
    this.failureCode = code;
  }

  private throwIfRequested(operation: string): void {
    if (this.failureOperation === operation) {
      const code = this.failureCode;
      this.failureOperation = '';
      this.failureCode = 0;
      throw new InjectedMetadataError(code);
    }
  }

  on(type: 'operationSubmitMetadata', bundleName: string, callback: Callback<number>): void {
    const call = new MetadataCall('on', type, bundleName, callback, '');
    this.calls.push(call);
    this.throwIfRequested('on');
  }

  off(type: 'operationSubmitMetadata', bundleName: string, callback?: Callback<number>): void {
    const call = new MetadataCall('off', type, bundleName, callback, '');
    this.calls.push(call);
    this.throwIfRequested('off');
  }

  submitMetadata(metadata: string): void {
    const call = new MetadataCall('submit', '', '', undefined, metadata);
    this.calls.push(call);
    this.throwIfRequested('submit');
  }

  describeCalls(): string[] {
    const result: string[] = [];
    this.calls.forEach((call: MetadataCall): void => {
      if (call.operation === 'submit') {
        result.push('submit|' + call.metadata);
      } else {
        let owner: string = 'unknown';
        if (call.callback === undefined) {
          owner = 'none';
        } else if (call.callback === this.primaryCallback) {
          owner = 'primary';
        } else if (call.callback === this.secondaryCallback) {
          owner = 'secondary';
        }
        result.push(call.operation + '|' + call.eventType + '|' + call.bundleName + '|' + owner);
      }
    });
    return result;
  }

  getCallCount(): number {
    return this.calls.length;
  }

  getSubmissionCount(): number {
    return this.calls.filter((call: MetadataCall): boolean => call.operation === 'submit').length;
  }

  clear(): void {
    this.calls = [];
    this.primaryCallback = undefined;
    this.secondaryCallback = undefined;
    this.failureOperation = '';
    this.failureCode = 0;
  }
}

let driverInstance: Driver | undefined = undefined;
let uiOperationQueue: Promise<void> = Promise.resolve();
export const TIMEOUT_PAGE_RENDER: number = 5000;
export const DELAY_KEY_NAVIGATION: number = 50;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

export function getDriver(): Driver {
  if (driverInstance === undefined) {
    driverInstance = Driver.create();
  }
  return driverInstance;
}

export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const result = uiOperationQueue.then(action);
  uiOperationQueue = result.then((): void => {}, (): void => {});
  return result;
}

export async function resetDriver(): Promise<void> {
  await uiOperationQueue;
  driverInstance = undefined;
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

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    return driver.findComponents(ON.type(type));
  });
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const components = await driver.findComponents(ON.text(expectedText));
    return components !== null && components.length > 0;
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function simulateTouch(driver: Driver, horizontal: number, vertical: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.click(horizontal, vertical);
  });
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  for (let index = 0; index < times; index++) {
    await triggerSerializedKey(driver, key);
    await serializedDelay(driver, delayMs);
  }
}

export async function launchMetadataBindingApp(): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const driver = getDriver();
    await driver.wakeUpDisplay();
    if (await screenLock.isScreenLocked()) {
      if (await screenLock.isSecureMode()) {
        throw new Error('Metadata UI tests require an unlocked device. Unlock the secure screen manually and rerun.');
      }
      const displaySize = await driver.getDisplaySize();
      const horizontal: number = Math.floor(displaySize.x / 2);
      const startVertical: number = Math.floor(displaySize.y * 0.8);
      const endVertical: number = Math.floor(displaySize.y * 0.2);
      await driver.swipe(horizontal, startVertical, horizontal, endVertical);
      for (let attempt = 0; attempt < 10; attempt++) {
        if (!(await screenLock.isScreenLocked())) {
          break;
        }
        await driver.delayMs(100);
      }
      if (await screenLock.isScreenLocked()) {
        throw new Error('Metadata UI tests cannot dismiss the lock screen. Unlock the device manually and rerun.');
      }
    }
  });
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    moduleName: 'entry',
    abilityName: 'EntryAbility',
  };
  await delegator.startAbility(want);
}

async function dismissUsbConnectionDialog(driver: Driver): Promise<void> {
  const titleSelector = ON.text('USB 连接方式').inWindow('com.ohos.systemui');
  const dialogTitle = await driver.findComponent(titleSelector);
  if (dialogTitle === null || dialogTitle === undefined) {
    return;
  }
  const confirmButton = await driver.findComponent(ON.id('advanced_dialog_button_0').inWindow('com.ohos.systemui'));
  if (confirmButton === null || confirmButton === undefined) {
    throw new Error('An unrecognized USB dialog blocks the metadata page. Dismiss it manually and rerun.');
  }
  await confirmButton.click();
  for (let attempt = 0; attempt < 10; attempt++) {
    const remainingTitle = await driver.findComponent(titleSelector);
    if (remainingTitle === null || remainingTitle === undefined) {
      return;
    }
    await driver.delayMs(100);
  }
  throw new Error('The USB connection dialog still blocks the metadata page. Dismiss it manually and rerun.');
}

export async function waitForMetadataPage(driver: Driver): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await dismissUsbConnectionDialog(driver);
    await driver.waitForComponent(ON.id('id1'), TIMEOUT_PAGE_RENDER);
    await driver.assertComponentExist(ON.id('id1'));
  });
}

export async function readMetadataTitle(driver: Driver): Promise<string> {
  return runSerializedUiOperation(async (): Promise<string> => {
    const title = await driver.findComponent(ON.id('id1'));
    return title.getText();
  });
}

export default function sharedDriverTest(): void {
  describe('sharedDriverTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      const yieldDelayMs: number = 30;
      await new Promise<void>((resolve): void => {
        setTimeout((): void => {
          resolve();
        }, yieldDelayMs);
      });
    });
    afterEach(async (): Promise<void> => { await resetDriver(); });
    afterAll((): void => {});
    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0100
     * @tc.name serializedQueue001
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['success1', 'success2', 'success3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        return 'success1';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        return 'success2';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        return 'success3';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['success1', 'success2', 'success3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0200
     * @tc.name serializedQueue002
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['success1', 'success2', 'failure3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        return 'success1';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        return 'success2';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        throw new Error('failure3');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['success1', 'success2', 'failure3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0300
     * @tc.name serializedQueue003
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['success1', 'failure2', 'success3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        return 'success1';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        throw new Error('failure2');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        return 'success3';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['success1', 'failure2', 'success3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0400
     * @tc.name serializedQueue004
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['success1', 'failure2', 'failure3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        return 'success1';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        throw new Error('failure2');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        throw new Error('failure3');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['success1', 'failure2', 'failure3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0500
     * @tc.name serializedQueue005
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['failure1', 'success2', 'success3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        throw new Error('failure1');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        return 'success2';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        return 'success3';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['failure1', 'success2', 'success3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0600
     * @tc.name serializedQueue006
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['failure1', 'success2', 'failure3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        throw new Error('failure1');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        return 'success2';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        throw new Error('failure3');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['failure1', 'success2', 'failure3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0700
     * @tc.name serializedQueue007
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['failure1', 'failure2', 'success3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        throw new Error('failure1');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        throw new Error('failure2');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        return 'success3';
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['failure1', 'failure2', 'success3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_SHARED_0800
     * @tc.name serializedQueue008
     * @tc.desc Verify runSerializedUiOperation keeps FIFO and preserves outcomes ['failure1', 'failure2', 'failure3']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('serializedQueue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const order: string[] = [];
      const operation1 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start1');
        await Promise.resolve();
        order.push('end1');
        throw new Error('failure1');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation2 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start2');
        await Promise.resolve();
        order.push('end2');
        throw new Error('failure2');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const operation3 = runSerializedUiOperation(async (): Promise<string> => {
        order.push('start3');
        await Promise.resolve();
        order.push('end3');
        throw new Error('failure3');
      }).then((value: string): string => value, (error: Error): string => error.message);
      const results = await Promise.all([operation1, operation2, operation3]);
      const expectedOrder: string[] = ['start1', 'end1', 'start2', 'end2', 'start3', 'end3'];
      const expectedResults: string[] = ['failure1', 'failure2', 'failure3'];
      expect(order).assertDeepEquals(expectedOrder);
      expect(results).assertDeepEquals(expectedResults);
    });

  });
}
