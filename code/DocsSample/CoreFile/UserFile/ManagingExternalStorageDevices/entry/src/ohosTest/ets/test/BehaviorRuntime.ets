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

import { expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_ManagingExternalStorageDevices]';
export const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
export const BUNDLE_NAME: string = abilityDelegatorRegistry.getArguments().bundleName;
export const driver: Driver = Driver.create();

export async function launchEntry(): Promise<void> {
  const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
  for (let attempt: number = 0; attempt < 3; attempt++) {
    try {
      await DELEGATOR.startAbility(want);
      await driver.delayMs(500);
      return;
    } catch (err) {
      hilog.warn(DOMAIN, TAG, 'startAbility retry %{public}d', attempt);
      await driver.delayMs(300);
    }
  }
  expect().assertFail();
}

async function waitForStatus(expected: string, timeout: number): Promise<void> {
  const deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    if (await readStatus() === expected) {
      return;
    }
    await driver.delayMs(100);
  }
}

export async function click(id: string): Promise<void> {
  const component: Component = await driver.waitForComponent(ON.id(id), 3000);
  if (!component) {
    expect().assertFail();
    return;
  }
  await component.click();
  if (id === 'subscribeButton') {
    await waitForStatus('Subscription succeeded', 3000);
  } else {
    await waitForStatus('Listening for volume events', 1000);
  }
}

export async function readStatus(): Promise<string> {
  const status: Component = await driver.waitForComponent(ON.id('statusText'), 3000);
  if (!status) {
    return '';
  }
  return await status.getText();
}

export async function clickSequence(sequence: string): Promise<void> {
  for (let i: number = 0; i < sequence.length; i++) {
    await click(sequence.charAt(i) === 'S' ? 'subscribeButton' : 'receiveButton');
  }
}
