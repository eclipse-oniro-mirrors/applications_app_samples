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

import { common, application, contextConstant, bundleManager } from '@kit.AbilityKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { fileIo } from '@kit.CoreFileKit';
import { buffer } from '@kit.ArkTS';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { getDriver, runSerializedUiOperation, waitForTextVisible } from './SharedDriver';
import { waitForEntryForeground } from './EntryReadiness';

export interface FileProbe {
  text: string;
  bytes: number;
  size: number;
  existsBefore: boolean;
  existsAfter: boolean;
  removed: boolean;
  mode: string;
  directory: string;
}

export interface EventProbe {
  received: string[];
  unrelated: number;
  afterOff: number;
}

export interface IndexProbe {
  initial: string;
  final: string;
  count: number;
  bundleName: string;
}

export function requireContext(): common.ApplicationContext {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  if (context === null || context === undefined) {
    throw new Error('Application context unavailable');
  }
  return context.getApplicationContext();
}

export function byteLength(content: string): number {
  return buffer.from(content).length;
}

export function requireBundleInfo(): bundleManager.BundleInfo {
  return bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
}

export function payload(seed: string, length: number): string {
  let result: string = '';
  for (let index: number = 0; index < length; index++) {
    result += seed;
  }
  return result;
}

export function directoryPath(kind: string): string {
  const context: common.ApplicationContext = requireContext();
  return kind === 'cache' ? context.cacheDir : context.filesDir;
}

async function exists(path: string): Promise<boolean> {
  try {
    return await fileIo.access(path);
  } catch (error) {
    const code: number = (error as BusinessError).code;
    if (code === 13900002) {
      return false;
    }
    throw new Error('File access failed with code ' + code.toString());
  }
}

export async function probeFile(id: string, kind: string, content: string, mode: string): Promise<FileProbe> {
  const directory: string = directoryPath(kind);
  const fullPath: string = directory + '/ctx_' + id + '.txt';
  let file: fileIo.File | null = null;
  let existsBefore: boolean = false;
  try {
    try {
      existsBefore = await fileIo.access(fullPath);
    } catch (error) {
      const code: number = (error as BusinessError).code;
      if (code !== 13900002) {
        throw new Error('File access failed with code ' + code.toString());
      }
    }
    file = await fileIo.open(fullPath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
    if (mode === 'append') {
      await fileIo.write(file.fd, 'prefix:');
      await fileIo.close(file);
      file = null;
      file = await fileIo.open(fullPath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.APPEND);
    } else if (mode === 'truncate') {
      await fileIo.write(file.fd, 'stale-content-that-must-be-removed');
      await fileIo.close(file);
      file = null;
      file = await fileIo.open(fullPath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
    }
    let bytes: number = 0;
    if (content.length > 0) {
      bytes = await fileIo.write(file.fd, content);
    }
    await fileIo.close(file);
    file = null;
    const stat: fileIo.Stat = await fileIo.stat(fullPath);
    file = await fileIo.open(fullPath, fileIo.OpenMode.READ_ONLY);
    let text: string = '';
    if (stat.size > 0) {
      const data: ArrayBuffer = new ArrayBuffer(stat.size);
      const readBytes: number = await fileIo.read(file.fd, data);
      text = buffer.from(data, 0, readBytes).toString();
    }
    await fileIo.close(file);
    file = null;
    await fileIo.unlink(fullPath);
    let existsAfter: boolean = false;
    try {
      existsAfter = await fileIo.access(fullPath);
    } catch (error) {
      const code: number = (error as BusinessError).code;
      if (code !== 13900002) {
        throw new Error('File access failed with code ' + code.toString());
      }
    }
    return { text: text, bytes: bytes, size: stat.size, existsBefore: existsBefore,
      existsAfter: existsAfter, removed: true, mode: mode, directory: directory };
  } finally {
    if (file !== null) {
      await fileIo.close(file);
    }
    if (await exists(fullPath)) {
      await fileIo.unlink(fullPath);
    }
  }
}

export async function requireModule(): Promise<common.Context> {
  return await application.createModuleContext(requireContext(), 'entry');
}

export async function probeEvents(id: string, values: string[], removedAfter: number): Promise<EventProbe> {
  const context: common.ApplicationContext = requireContext();
  const eventName: string = 'context_test_' + id;
  const unrelatedName: string = eventName + '_other';
  const received: string[] = [];
  let unrelated: number = 0;
  let afterOff: number = 0;
  const callback: (value: string) => void = (value: string): void => {
    received.push(value);
  };
  const other: (value: string) => void = (value: string): void => {
    unrelated++;
  };
  context.eventHub.on(eventName, callback);
  context.eventHub.on(unrelatedName, other);
  try {
    for (let index: number = 0; index < values.length; index++) {
      context.eventHub.emit(eventName, values[index]);
    }
    context.eventHub.off(eventName, callback);
    const before: number = received.length;
    for (let index: number = 0; index < removedAfter; index++) {
      context.eventHub.emit(eventName, 'ignored');
    }
    afterOff = received.length - before;
    return { received: received, unrelated: unrelated, afterOff: afterOff };
  } finally {
    context.eventHub.off(eventName, callback);
    context.eventHub.off(unrelatedName, other);
  }
}

export async function probeIndex(clicks: number, keys: number[], background: boolean): Promise<IndexProbe> {
  await waitForEntryForeground();
  const driver: Driver = getDriver();
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  if (!(await waitForTextVisible(driver, 'Hello World', 3000)) &&
      !(await waitForTextVisible(driver, 'Welcome', 3000))) {
    throw new Error('EntryAbility content unavailable');
  }
  const initial: string = await runSerializedUiOperation(async (): Promise<string> => {
    const component = await driver.findComponent(ON.id('HelloWorld'));
    if (component === null) {
      throw new Error('HelloWorld component missing');
    }
    const text: string = await component.getText();
    for (let index: number = 0; index < clicks; index++) {
      await component.click();
    }
    for (let index: number = 0; index < keys.length; index++) {
      await driver.triggerKey(keys[index]);
    }
    return text;
  });
  if (background) {
    const ability = await delegator.getCurrentTopAbility();

    try {
      // Home performs a real transition; doAbilityBackground only invokes a callback.
      await runSerializedUiOperation(async (): Promise<void> => {
        await driver.pressHome();
      });
      const deadline: number = Date.now() + 3000;
      while (delegator.getAbilityState(ability) !==
          abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND) {
        if (Date.now() >= deadline) {
          throw new Error('EntryAbility did not enter the background');
        }
        await new Promise<void>((resolve) => { setTimeout(resolve, 50); });
      }
    } finally {
      await delegator.startAbility({ bundleName: 'com.samples.applicationcontext',
        moduleName: 'entry', abilityName: 'EntryAbility' });
      await waitForEntryForeground();
    }
  }
  // Lifecycle readiness precedes rendering; poll the real page before finding components.
  const expected: string = clicks > 0 ? 'Welcome' : initial;
  if (!(await waitForTextVisible(driver, expected, 3000))) {
    throw new Error('Index content did not render after the operation: ' + expected);
  }
  return await runSerializedUiOperation(async (): Promise<IndexProbe> => {
    const target = await driver.findComponent(ON.id('HelloWorld'));
    if (target === null) {
      throw new Error('HelloWorld missing after operation');
    }
    const components = await driver.findComponents(ON.id('HelloWorld'));
    return { initial: initial, final: await target.getText(), count: components.length,
      bundleName: (await delegator.getCurrentTopAbility()).context.applicationInfo.name };
  });
}

export function switchArea(area: contextConstant.AreaMode): string {
  const context: common.ApplicationContext = requireContext();
  const original: contextConstant.AreaMode = context.area;
  try {
    context.area = area;
    if (context.area !== area) {
      throw new Error('Context area transition rejected');
    }
    return context.filesDir;
  } finally {
    context.area = original;
  }
}
