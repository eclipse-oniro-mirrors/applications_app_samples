/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { CryptoOperation } from '../../../main/ets/cryptoframework/CryptoOperation';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { Driver, ON, Component, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const BUNDLE_NAME: string = 'com.samples.cryptoframework';
const ABILITY_NAME: string = 'EntryAbility';
const UI_WAIT_TIMEOUT: number = 5000;
const UI_POLL_INTERVAL: number = 200;

// 套件级共享缓存：RSA3072 密钥生成较慢，同一套件复用一对密钥（密钥无状态，复用不影响断言语义）
let cachedRsaJson: string = '';
let cachedKeyPair: cryptoFramework.KeyPair | null = null;
// UI 套件复用同一 Driver，避免每个用例重复创建 uitest 连接
let cachedDriver: Driver | null = null;

export function getDriver(): Driver {
  if (cachedDriver === null) {
    cachedDriver = Driver.create();
  }
  return cachedDriver;
}

export async function getCachedRsaJson(op: CryptoOperation): Promise<string> {
  if (cachedRsaJson === '') {
    cachedRsaJson = await op.generateRsaKey();
  }
  return cachedRsaJson;
}

export async function getCachedRsaPair(op: CryptoOperation): Promise<cryptoFramework.KeyPair> {
  if (cachedKeyPair === null) {
    const json: string = await getCachedRsaJson(op);
    cachedKeyPair = await op.convertRsaKey(json);
  }
  return cachedKeyPair;
}

export async function launchEntryAbility(): Promise<boolean> {
  const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  try {
    await abilityDelegator.startAbility({
      bundleName: BUNDLE_NAME,
      abilityName: ABILITY_NAME
    });
    return true;
  } catch (e) {
    return false;
  }
}

export async function findUiOrNull(driver: Driver, by: On): Promise<Component | null> {
  try {
    return await driver.findComponent(by);
  } catch (e) {
    return null;
  }
}

export async function waitForUiComponent(driver: Driver, id: string): Promise<Component | null> {
  const deadline: number = Date.now() + UI_WAIT_TIMEOUT;
  while (Date.now() < deadline) {
    const comp: Component | null = await findUiOrNull(driver, ON.id(id));
    if (comp !== null) {
      return comp;
    }
    await driver.delayMs(UI_POLL_INTERVAL);
  }
  return null;
}

export async function clickUiIfFound(driver: Driver, id: string): Promise<boolean> {
  const comp: Component | null = await waitForUiComponent(driver, id);
  if (comp === null) {
    return false;
  }
  await comp.click();
  await driver.delayMs(300);
  return true;
}
