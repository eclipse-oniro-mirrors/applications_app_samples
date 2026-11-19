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
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { downloadFilesData } from './DataType';

// The reference singleton and Promise queue are retained. A failed operation
// rejects its caller while allowing subsequent independent cleanup to proceed.
let driverInstance: Driver | undefined = undefined;
let operationQueue: Promise<void> = Promise.resolve();
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const TIMEOUT_RENDER: number = 8000;
export const POLL_INTERVAL: number = 80;

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const previous: Promise<void> = operationQueue;
  const result: Promise<T> = previous.then(action);
  operationQueue = result.then(
    (): void => {},
    (error: Error): void => {
      hilog.error(0x2301, 'SampleTest', 'UI action failed: %{public}s', error.message);
    },
  );
  return result;
}

export function getDriver(): Driver {
  if (driverInstance === undefined || driverInstance === null) {
    driverInstance = Driver.create();
  }
  return driverInstance as Driver;
}

export async function drainUiQueue(): Promise<void> {
  await operationQueue;
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

export async function pressAndWait(driver: Driver, key: number, times: number = 1): Promise<void> {
  for (let index: number = 0; index < times; index++) {
    await triggerSerializedKey(driver, key);
    await serializedDelay(driver, POLL_INTERVAL);
  }
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.click(x, y);
  });
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    return (await driver.findComponents(ON.type(type))) ?? [];
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function checkTextContent(driver: Driver, text: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const components: Component[] = (await driver.findComponents(ON.text(text))) ?? [];
    return components.length > 0;
  });
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  return runSerializedUiOperation(async (): Promise<number> => {
    const components: Component[] = (await driver.findComponents(ON.type('*'))) ?? [];
    for (let index: number = 0; index < components.length; index++) {
      if (await components[index].isFocused()) {
        return index;
      }
    }
    return -1;
  });
}

export async function checkFocusState(driver: Driver, index: number): Promise<boolean> {
  return (await getCurrentFocusIndex(driver)) === index;
}

export async function launchSampleApp(): Promise<void> {
  const args = registry.getArguments();
  const want: Want = { bundleName: args.bundleName, abilityName: 'EntryAbility' };
  await registry.getAbilityDelegator().startAbility(want);
}

export async function hasId(id: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const components: Component[] = (await getDriver().findComponents(ON.id(id))) ?? [];
    for (const component of components) {
      try {
        const box = await component.getBounds();
        if (box.right > box.left && box.bottom > box.top) {
          return true;
        }
      } catch (error) {
        continue;
      }
    }
    return false;
  });
}

export async function waitForId(id: string): Promise<void> {
  const deadline: number = Date.now() + TIMEOUT_RENDER;
  while (Date.now() < deadline) {
    if (await hasId(id)) {
      return;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL);
  }
  throw new Error('Timed out waiting for component: ' + id);
}

export async function clickId(id: string): Promise<void> {
  await waitForId(id);
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component | null = await getDriver().findComponent(ON.id(id));
    if (component === null) {
      throw new Error('Missing click target: ' + id);
    }
    await component.click();
  });
}

export async function clickText(text: string): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const component: Component | null = await getDriver().findComponent(ON.text(text));
    if (component === null) {
      throw new Error('Missing text target');
    }
    await component.click();
  });
}

export async function readId(id: string): Promise<string> {
  await waitForId(id);
  return runSerializedUiOperation(async (): Promise<string> => {
    const component: Component | null = await getDriver().findComponent(ON.id(id));
    if (component === null) {
      throw new Error('Missing text component: ' + id);
    }
    return component.getText();
  });
}

export class ComponentBox {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
  width(): number {
    return this.right - this.left;
  }
  height(): number {
    return this.bottom - this.top;
  }
}

export async function boundsId(id: string): Promise<ComponentBox> {
  await waitForId(id);
  return runSerializedUiOperation(async (): Promise<ComponentBox> => {
    const component: Component | null = await getDriver().findComponent(ON.id(id));
    if (component === null) {
      throw new Error('Missing layout component: ' + id);
    }
    const bounds = await component.getBounds();
    const box: ComponentBox = new ComponentBox();
    box.left = bounds.left;
    box.top = bounds.top;
    box.right = bounds.right;
    box.bottom = bounds.bottom;
    return box;
  });
}

export async function enabledId(id: string): Promise<boolean> {
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const component: Component | null = await getDriver().findComponent(ON.id(id));
    if (component === null) {
      return false;
    }
    return component.isEnabled();
  });
}

// Geometric intersection distinguishes a visible page from cached offscreen
// siblings. Matching a title alone would incorrectly accept a failed switch.
export async function contentTextVisible(text: string, container: string): Promise<boolean> {
  const viewport: ComponentBox = await boundsId(container);
  return runSerializedUiOperation(async (): Promise<boolean> => {
    const components: Component[] = (await getDriver().findComponents(ON.text(text))) ?? [];
    for (const component of components) {
      const bounds = await component.getBounds();
      const centerX: number = (bounds.left + bounds.right) / 2;
      const centerY: number = (bounds.top + bounds.bottom) / 2;
      if (
        centerX >= viewport.left &&
        centerX < viewport.right &&
        centerY >= viewport.top &&
        centerY < viewport.bottom &&
        bounds.right > bounds.left
      ) {
        return true;
      }
    }
    return false;
  });
}

export async function waitForContent(text: string, container: string): Promise<void> {
  const deadline: number = Date.now() + TIMEOUT_RENDER;
  while (Date.now() < deadline) {
    if (await contentTextVisible(text, container)) {
      return;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL);
  }
  throw new Error('Content did not reach expected page');
}

export async function swipeContent(id: string, forward: boolean): Promise<void> {
  const box: ComponentBox = await boundsId(id);
  const low: number = Math.floor(box.left + box.width() * 0.15);
  const high: number = Math.floor(box.left + box.width() * 0.85);
  const y: number = Math.floor(box.top + box.height() * 0.4);
  await runSerializedUiOperation(async (): Promise<void> => {
    await getDriver().swipe(forward ? high : low, y, forward ? low : high, y, 600);
  });
}

export function logSuite(name: string, event: string): void {
  hilog.info(0x2301, 'SampleTest', '%{public}s: %{public}s', name, event);
}

export { downloadFilesData };
export const DOWNLOAD_TAB: string = '下载列表';
export const HISTORY_TAB: string = '下载历史';

export async function prepareCase(): Promise<void> {
  await launchSampleApp();
  await waitForText(DOWNLOAD_TAB);
  await clickText(DOWNLOAD_TAB);
  await waitForId('download');
}

export async function waitForText(text: string): Promise<void> {
  const deadline: number = Date.now() + TIMEOUT_RENDER;
  while (Date.now() < deadline) {
    if (await checkTextContent(getDriver(), text)) {
      return;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL);
  }
  throw new Error('Timed out waiting for text: ' + text);
}

export async function finishCase(): Promise<void> {
  await drainUiQueue();
  try {
    await registry.getAbilityDelegator().executeShellCommand('echo test-yield');
  } catch (error) {
    await new Promise<void>((resolve: () => void): void => {
      setTimeout(resolve, 0);
    });
  }
}

export async function selectDownloadPage(history: boolean): Promise<void> {
  const downloadShown: boolean = await hasId('download');
  if (downloadShown === !history) {
    return;
  }
  await clickText(history ? HISTORY_TAB : DOWNLOAD_TAB);
  const deadline: number = Date.now() + TIMEOUT_RENDER;
  while (Date.now() < deadline) {
    const shown: boolean = await hasId('download');
    if (shown !== history) {
      return;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL);
  }
  throw new Error('Download/history tab visibility did not update');
}
