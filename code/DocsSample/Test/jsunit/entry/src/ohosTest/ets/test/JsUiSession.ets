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
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { common, UIAbility, Want } from '@kit.AbilityKit';
import { paceTurn } from './TestPace';

export const delegator: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();
export const driver: Driver = Driver.create();
export const EXPECTED_BUNDLE: string = 'com.samples.test.jsunit';
let testContext: common.UIAbilityContext | undefined;
let mainAbility: UIAbility | undefined;

export function setTestContext(context: common.UIAbilityContext): void {
  testContext = context;
}

export function getTestContext(): common.UIAbilityContext {
  if (testContext === undefined) {
    throw new Error('Stage test context has not been initialized');
  }
  return testContext;
}

export function getMainAbility(): UIAbility {
  if (mainAbility === undefined) {
    throw new Error('Main ability has not reached the foreground');
  }
  return mainAbility;
}

export async function openMain(): Promise<void> {
  const want: Want = { bundleName: EXPECTED_BUNDLE, moduleName: 'entry', abilityName: 'EntryAbility' };
  let finish: (value: void) => void = (): void => {};
  const monitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: 'EntryAbility',
    moduleName: 'entry',
    onAbilityCreate: (ability: UIAbility): void => {
      if (ability.context.abilityInfo.name === 'EntryAbility' &&
        ability.context.abilityInfo.bundleName === EXPECTED_BUNDLE &&
        ability.context.currentHapModuleInfo.name === 'entry') {
        mainAbility = ability;
      }
    },
    onAbilityForeground: (ability: UIAbility): void => {
      if (ability.context.abilityInfo.name === 'EntryAbility' &&
        ability.context.abilityInfo.bundleName === EXPECTED_BUNDLE &&
        ability.context.currentHapModuleInfo.name === 'entry') {
        mainAbility = ability;
        finish();
      }
    }
  };
  await delegator.addAbilityMonitor(monitor);
  let timer: number = -1;
  try {
    const foreground: Promise<void> = new Promise<void>((resolve: (value: void) => void,
      reject: (reason: Error) => void): void => {
      finish = resolve;
      timer = setTimeout((): void => {
        reject(new Error('EntryAbility did not reach the foreground within 3000ms'));
      }, 3000);
    });
    await Promise.all([delegator.startAbility(want), foreground]);
    const home: Component = await driver.waitForComponent(ON.text('Hello World').type('Text'), 3000);
    if (home === undefined) {
      throw new Error('Main page Hello World text not found within 3000ms');
    }
  } finally {
    clearTimeout(timer);
    await delegator.removeAbilityMonitor(monitor);
  }
}

export async function terminateMain(): Promise<void> {
  const top: UIAbility | undefined = mainAbility;
  if (top === undefined) {
    return;
  }
  let finish: (value: void) => void = (): void => {};
  const monitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: 'EntryAbility',
    moduleName: 'entry',
    onAbilityDestroy: (ability: UIAbility): void => {
      if (ability.context.abilityInfo.name === 'EntryAbility' &&
        ability.context.abilityInfo.bundleName === EXPECTED_BUNDLE &&
        ability.context.currentHapModuleInfo.name === 'entry') {
        mainAbility = undefined;
        finish();
      }
    }
  };
  await delegator.addAbilityMonitor(monitor);
  let timer: number = -1;
  try {
    const destroyed: Promise<void> = new Promise<void>((resolve: (value: void) => void,
      reject: (reason: Error) => void): void => {
      finish = resolve;
      timer = setTimeout((): void => {
        reject(new Error('EntryAbility was not destroyed within 3000ms'));
      }, 3000);
    });
    await Promise.all([top.context.terminateSelf(), destroyed]);
  } finally {
    clearTimeout(timer);
    await delegator.removeAbilityMonitor(monitor);
  }
}

export async function recoverMain(): Promise<void> {
  await paceTurn();
  await openMain();
  const top: UIAbility = getMainAbility();
  if (top.context.abilityInfo.name !== 'EntryAbility' || top.context.abilityInfo.bundleName !== EXPECTED_BUNDLE ||
    top.context.currentHapModuleInfo.name !== 'entry') {
    throw new Error('EntryAbility did not reach the foreground in the expected bundle and module');
  }
}
