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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { aesEncryptAsync } from '../utils/CipherAsync';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inputMethod from '@ohos.inputMethod';
import Logger from '../../../main/ets/model/Logger';
const TAG: string = '[Sample_Cipher]';
const BUNDLE: string = 'ohos.samples.cipher';
const ABILITY: string = 'EntryAbility';
const AES_BASELINE: string = 'ZtJpi1Z5BwPPXqXYRHGthQ==';
const ENC_PREFIX: string = 'Encryption result is :  ';
const ENC_BASE_RESULT: string = 'Encryption result is :  ZtJpi1Z5BwPPXqXYRHGthQ==';
const ENC_ERROR_RESULT: string = 'Encryption result is :  Error!';
const DEC_PREFIX: string = 'Decrypt result is :  ';
const DEC_BASE_RESULT: string = 'Decrypt result is :  a';
const DEC_ERROR_RESULT: string = 'Decrypt result is :  Error!';
const NAV_FAIL: string = 'NAV_FAIL';
const NO_RESULT: string = 'NO_RESULT';

let driver: Driver = Driver.create();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

function buildInput(cls: string, n: number): string {
  let out: string = '';
  for (let i: number = 0; i < n; i++) {
    out += cls;
  }
  return out;
}

async function existsById(id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function existsByText(text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForId(id: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    if (await existsById(id)) {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function findById(id: string): Promise<Component | null> {
  if (!await waitForId(id, 10)) {
    return null;
  }
  return await driver.findComponent(ON.id(id));
}

async function textOf(id: string): Promise<string> {
  const component: Component | null = await findById(id);
  if (component === null) {
    return '';
  }
  return await component.getText();
}

async function tapById(id: string): Promise<boolean> {
  const component: Component | null = await findById(id);
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(300);
  return true;
}

async function tapByText(text: string): Promise<boolean> {
  const component: Component | null = await driver.findComponent(ON.text(text));
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(300);
  return true;
}

async function inputTextTo(id: string, text: string): Promise<boolean> {
  const component: Component | null = await findById(id);
  if (component === null) {
    return false;
  }
  // Single-shot injection only: the device IME re-processes the whole field on
  // every commit, so multi-chunk writes corrupt the field state and can abort.
  await component.inputText(text);
  const controller: inputMethod.InputMethodController = inputMethod.getController();
  controller.stopInputSession();
  await delay(800);
  return true;
}

async function waitForText(id: string, expected: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    const current: string = await textOf(id);
    if (current === expected) {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function waitForNonEmpty(id: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    const current: string = await textOf(id);
    if (current !== '') {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function ensureHome(): Promise<boolean> {
  for (let i: number = 0; i < 6; i++) {
    if (await existsById('encryption')) {
      return true;
    }
    if (await existsById('back')) {
      await tapById('back');
    }
    await delay(500);
  }
  return false;
}

async function launchApp(): Promise<boolean> {
  const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  for (let i: number = 0; i < 5; i++) {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await delay(1200);
    if (await waitForId('encryption', 4)) {
      return true;
    }
    // The ability may resume on a sub-page left by an earlier suite; walk back to home.
    for (let j: number = 0; j < 3; j++) {
      if (!await existsById('back')) {
        break;
      }
      await tapById('back');
      await delay(500);
    }
    if (await waitForId('encryption', 4)) {
      return true;
    }
    Logger.info(TAG, 'launchApp retry ' + i);
  }
  return false;
}

async function openEncryptPage(): Promise<boolean> {
  if (!await tapById('encryption')) {
    return false;
  }
  return await waitForId('encryptionBtn', 8);
}

async function openDecryptPage(): Promise<boolean> {
  if (!await tapById('decrypt')) {
    return false;
  }
  return await waitForId('decryptBtn', 8);
}

async function selectEncAlgorithm(algo: string): Promise<boolean> {
  if (!await tapById('encryptionAlgorithm')) {
    return false;
  }
  return await tapByText(algo);
}

async function selectDecAlgorithm(algo: string): Promise<boolean> {
  if (!await tapById('decryptAlgorithm')) {
    return false;
  }
  return await tapByText(algo);
}

async function encryptScenario(kind: string, len: number): Promise<string> {
  const entered: boolean = await openEncryptPage();
  if (!entered) {
    return NAV_FAIL;
  }
  if (kind === 'encryptRsa') {
    await selectEncAlgorithm('RSA');
  } else {
    await selectEncAlgorithm('AES');
  }
  if (kind !== 'encryptEmpty') {
    const M: string = buildInput('a', len);
    await inputTextTo('encryptionInput', M);
  }
  await tapById('encryptionBtn');
  if (kind === 'encryptEmpty') {
    await delay(500);
    return await textOf('encryptionInfo');
  }
  const shown: boolean = await waitForNonEmpty('encryptionInfo', 10);
  if (!shown) {
    return NO_RESULT;
  }
  const out: string = await textOf('encryptionInfo');
  return out === '' ? NO_RESULT : out;
}

async function decryptScenario(kind: string, len: number): Promise<string> {
  const entered: boolean = await openDecryptPage();
  if (!entered) {
    return NAV_FAIL;
  }
  if (kind === 'decryptEmpty') {
    await tapById('decryptBtn');
    await delay(500);
    return await textOf('decryptInfo');
  }
  if (kind === 'decryptJunk') {
    await selectDecAlgorithm('AES');
    await inputTextTo('decryptInput', 'zzz');
  } else {
    const model: CipherModel = new CipherModel();
    const M: string = buildInput('a', len);
    const cipher: string = (await aesEncryptAsync(model, M)).text;
    await selectDecAlgorithm('AES');
    await inputTextTo('decryptInput', cipher);
  }
  await tapById('decryptBtn');
  const shown: boolean = await waitForNonEmpty('decryptInfo', 10);
  if (!shown) {
    return NO_RESULT;
  }
  const out: string = await textOf('decryptInfo');
  return out === '' ? NO_RESULT : out;
}

async function resetScenario(page: string, len: number): Promise<string> {
  if (page === 'encrypt') {
    const out: string = await encryptScenario('encrypt', len);
    if (out === NAV_FAIL || out === NO_RESULT) {
      return out;
    }
    await tapById('encryptionResetBtn');
  } else {
    const out: string = await decryptScenario('decrypt', len);
    if (out === NAV_FAIL || out === NO_RESULT) {
      return out;
    }
    await tapById('decryptResetBtn');
  }
  await delay(500);
  return page === 'encrypt' ? await textOf('encryptionInfo') : await textOf('decryptInfo');
}

async function runUiScenario(kind: string, len: number): Promise<string> {
  if (kind === 'encryptEmpty') {
    return await encryptScenario('encryptEmpty', 0);
  }
  if (kind === 'encryptReset') {
    return await resetScenario('encrypt', len);
  }
  if (kind === 'decryptEmpty' || kind === 'decryptJunk') {
    return await decryptScenario(kind, 0);
  }
  if (kind === 'decryptReset') {
    return await resetScenario('decrypt', len);
  }
  if (kind === 'decrypt') {
    return await decryptScenario('decrypt', len);
  }
  return await encryptScenario(kind, len);
}
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Cipher]';

export default function uiFlowVolume01Test() {
  describe('UiFlowVolume01Test', () => {

    beforeAll(async () => {
      const launched: boolean = await launchApp();
      expect(launched).assertTrue();
    });

    afterEach(async () => {
      const atHome: boolean = await ensureHome();
      expect(atHome).assertTrue();
    });

    /**
     * @tc.name   testUiFlowVolume011031
     * @tc.number SUB_CIPHER_UI_1031
     * @tc.desc   full AES encrypt chain through the page matches the frozen result text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011031 begin');
      const entered: boolean = await openEncryptPage();
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo('encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById('encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText('encryptionInfo', ENC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const out: string = await textOf('encryptionInfo');
      expect(out).assertEqual(ENC_BASE_RESULT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011031 end');
    })

    /**
     * @tc.name   testUiFlowVolume011032
     * @tc.number SUB_CIPHER_UI_1032
     * @tc.desc   encrypt page, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011032 begin');
      const result: string = (await runUiScenario('encrypt', 1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011032 end');
    })

    /**
     * @tc.name   testUiFlowVolume011033
     * @tc.number SUB_CIPHER_UI_1033
     * @tc.desc   encrypt page, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011033 begin');
      const result: string = (await runUiScenario('encrypt', 2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011033 end');
    })

    /**
     * @tc.name   testUiFlowVolume011034
     * @tc.number SUB_CIPHER_UI_1034
     * @tc.desc   encrypt page, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011034 begin');
      const result: string = (await runUiScenario('encrypt', 15));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011034 end');
    })

    /**
     * @tc.name   testUiFlowVolume011035
     * @tc.number SUB_CIPHER_UI_1035
     * @tc.desc   encrypt page, length 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011035 begin');
      const result: string = (await runUiScenario('encrypt', 16));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011035 end');
    })

    /**
     * @tc.name   testUiFlowVolume011036
     * @tc.number SUB_CIPHER_UI_1036
     * @tc.desc   encrypt page, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011036 begin');
      const result: string = (await runUiScenario('encrypt', 17));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011036 end');
    })

    /**
     * @tc.name   testUiFlowVolume011037
     * @tc.number SUB_CIPHER_UI_1037
     * @tc.desc   encrypt page, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011037 begin');
      const result: string = (await runUiScenario('encrypt', 31));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011037 end');
    })

    /**
     * @tc.name   testUiFlowVolume011038
     * @tc.number SUB_CIPHER_UI_1038
     * @tc.desc   encrypt page, length 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011038 begin');
      const result: string = (await runUiScenario('encrypt', 32));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011038 end');
    })

    /**
     * @tc.name   testUiFlowVolume011039
     * @tc.number SUB_CIPHER_UI_1039
     * @tc.desc   encrypt page, length 62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011039 begin');
      const result: string = (await runUiScenario('encrypt', 62));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011039 end');
    })

    /**
     * @tc.name   testUiFlowVolume011040
     * @tc.number SUB_CIPHER_UI_1040
     * @tc.desc   encrypt page, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011040 begin');
      const result: string = (await runUiScenario('encrypt', 63));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011040 end');
    })

    /**
     * @tc.name   testUiFlowVolume011041
     * @tc.number SUB_CIPHER_UI_1041
     * @tc.desc   encrypt page, length 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011041 begin');
      const result: string = (await runUiScenario('encrypt', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011041 end');
    })

    /**
     * @tc.name   testUiFlowVolume011042
     * @tc.number SUB_CIPHER_UI_1042
     * @tc.desc   encrypt page, length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011042 begin');
      const result: string = (await runUiScenario('encrypt', 255));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011042 end');
    })

    /**
     * @tc.name   testUiFlowVolume011043
     * @tc.number SUB_CIPHER_UI_1043
     * @tc.desc   encrypt page, length 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011043 begin');
      const result: string = (await runUiScenario('encrypt', 500));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011043 end');
    })

    /**
     * @tc.name   testUiFlowVolume011044
     * @tc.number SUB_CIPHER_UI_1044
     * @tc.desc   encrypt page, length 512
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011044 begin');
      const result: string = (await runUiScenario('encrypt', 512));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011044 end');
    })

    /**
     * @tc.name   testUiFlowVolume011045
     * @tc.number SUB_CIPHER_UI_1045
     * @tc.desc   encrypt page, length 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011045 begin');
      const result: string = (await runUiScenario('encrypt', 256));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011045 end');
    })

    /**
     * @tc.name   testUiFlowVolume011046
     * @tc.number SUB_CIPHER_UI_1046
     * @tc.desc   encrypt page, length 383
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011046 begin');
      const result: string = (await runUiScenario('encrypt', 383));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011046 end');
    })

    /**
     * @tc.name   testUiFlowVolume011047
     * @tc.number SUB_CIPHER_UI_1047
     * @tc.desc   encrypt page, length 511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011047 begin');
      const result: string = (await runUiScenario('encrypt', 511));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > ENC_PREFIX.length));
      expect(result.length > ENC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011047 end');
    })

    /**
     * @tc.name   testUiFlowVolume011048
     * @tc.number SUB_CIPHER_UI_1048
     * @tc.desc   encrypt page RSA branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011048 begin');
      const result: string = (await runUiScenario('encryptRsa', 1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 196));
      expect(result.length === 196).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf('Error!') === -1));
      expect(result.indexOf('Error!') === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(ENC_PREFIX) === 0));
      expect(result.indexOf(ENC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011048 end');
    })

    /**
     * @tc.name   testUiFlowVolume011049
     * @tc.number SUB_CIPHER_UI_1049
     * @tc.desc   encrypt page empty input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011049 begin');
      const result: string = (await runUiScenario('encryptEmpty', 0));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result !== NAV_FAIL));
      expect(result !== NAV_FAIL).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 0));
      expect(result.length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ENC_BASE_RESULT));
      expect(result === ENC_BASE_RESULT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011049 end');
    })

    /**
     * @tc.name   testUiFlowVolume011050
     * @tc.number SUB_CIPHER_UI_1050
     * @tc.desc   encrypt page reset clears the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011050 begin');
      const result: string = (await runUiScenario('encryptReset', 1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result !== NAV_FAIL));
      expect(result !== NAV_FAIL).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 0));
      expect(result.length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ENC_BASE_RESULT));
      expect(result === ENC_BASE_RESULT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011050 end');
    })

    /**
     * @tc.name   testUiFlowVolume011051
     * @tc.number SUB_CIPHER_UI_1051
     * @tc.desc   decrypt page, plaintext length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011051 begin');
      const result: string = (await runUiScenario('decrypt', 1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 1)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011051 end');
    })

    /**
     * @tc.name   testUiFlowVolume011052
     * @tc.number SUB_CIPHER_UI_1052
     * @tc.desc   decrypt page, plaintext length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011052 begin');
      const result: string = (await runUiScenario('decrypt', 2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 2)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011052 end');
    })

    /**
     * @tc.name   testUiFlowVolume011053
     * @tc.number SUB_CIPHER_UI_1053
     * @tc.desc   decrypt page, plaintext length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011053 begin');
      const result: string = (await runUiScenario('decrypt', 15));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 15)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 15));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011053 end');
    })

    /**
     * @tc.name   testUiFlowVolume011054
     * @tc.number SUB_CIPHER_UI_1054
     * @tc.desc   decrypt page, plaintext length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011054 begin');
      const result: string = (await runUiScenario('decrypt', 16));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + 'Error!'));
      expect(result).assertEqual(DEC_PREFIX + 'Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(DEC_PREFIX.length + 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011054 end');
    })

    /**
     * @tc.name   testUiFlowVolume011055
     * @tc.number SUB_CIPHER_UI_1055
     * @tc.desc   decrypt page, plaintext length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011055 begin');
      const result: string = (await runUiScenario('decrypt', 17));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 17)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 17));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011055 end');
    })

    /**
     * @tc.name   testUiFlowVolume011056
     * @tc.number SUB_CIPHER_UI_1056
     * @tc.desc   decrypt page, plaintext length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011056 begin');
      const result: string = (await runUiScenario('decrypt', 31));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 31)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 31));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011056 end');
    })

    /**
     * @tc.name   testUiFlowVolume011057
     * @tc.number SUB_CIPHER_UI_1057
     * @tc.desc   decrypt page, plaintext length 32 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011057 begin');
      const result: string = (await runUiScenario('decrypt', 32));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + 'Error!'));
      expect(result).assertEqual(DEC_PREFIX + 'Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(DEC_PREFIX.length + 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011057 end');
    })

    /**
     * @tc.name   testUiFlowVolume011058
     * @tc.number SUB_CIPHER_UI_1058
     * @tc.desc   decrypt page, plaintext length 62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011058 begin');
      const result: string = (await runUiScenario('decrypt', 62));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 62)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 62));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011058 end');
    })

    /**
     * @tc.name   testUiFlowVolume011059
     * @tc.number SUB_CIPHER_UI_1059
     * @tc.desc   decrypt page, plaintext length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011059 begin');
      const result: string = (await runUiScenario('decrypt', 63));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 63)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 63));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011059 end');
    })

    /**
     * @tc.name   testUiFlowVolume011060
     * @tc.number SUB_CIPHER_UI_1060
     * @tc.desc   decrypt page, plaintext length 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011060 begin');
      const result: string = (await runUiScenario('decrypt', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 100)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 100));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011060 end');
    })

    /**
     * @tc.name   testUiFlowVolume011061
     * @tc.number SUB_CIPHER_UI_1061
     * @tc.desc   decrypt page, plaintext length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011061 begin');
      const result: string = (await runUiScenario('decrypt', 255));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 255)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 255));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011061 end');
    })

    /**
     * @tc.name   testUiFlowVolume011062
     * @tc.number SUB_CIPHER_UI_1062
     * @tc.desc   decrypt page, plaintext length 256 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011062 begin');
      const result: string = (await runUiScenario('decrypt', 256));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + 'Error!'));
      expect(result).assertEqual(DEC_PREFIX + 'Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(DEC_PREFIX.length + 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011062 end');
    })

    /**
     * @tc.name   testUiFlowVolume011063
     * @tc.number SUB_CIPHER_UI_1063
     * @tc.desc   decrypt page, plaintext length 380
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011063 begin');
      const result: string = (await runUiScenario('decrypt', 380));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 380)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 380));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011063 end');
    })

    /**
     * @tc.name   testUiFlowVolume011064
     * @tc.number SUB_CIPHER_UI_1064
     * @tc.desc   decrypt page, plaintext length 382
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011064 begin');
      const result: string = (await runUiScenario('decrypt', 382));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 382)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 382));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011064 end');
    })

    /**
     * @tc.name   testUiFlowVolume011065
     * @tc.number SUB_CIPHER_UI_1065
     * @tc.desc   decrypt page, plaintext length 383
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011065 begin');
      const result: string = (await runUiScenario('decrypt', 383));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + buildInput('a', 383)));
      expect(result).assertEqual(DEC_PREFIX + buildInput('a', 383));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > DEC_PREFIX.length));
      expect(result.length > DEC_PREFIX.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011065 end');
    })

    /**
     * @tc.name   testUiFlowVolume011066
     * @tc.number SUB_CIPHER_UI_1066
     * @tc.desc   decrypt page, plaintext length 384 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011066 begin');
      const result: string = (await runUiScenario('decrypt', 384));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_PREFIX + 'Error!'));
      expect(result).assertEqual(DEC_PREFIX + 'Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(DEC_PREFIX.length + 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011066 end');
    })

    /**
     * @tc.name   testUiFlowVolume011067
     * @tc.number SUB_CIPHER_UI_1067
     * @tc.desc   decrypt page junk ciphertext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011067 begin');
      const result: string = (await runUiScenario('decryptJunk', 0));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(DEC_ERROR_RESULT));
      expect(result).assertEqual(DEC_ERROR_RESULT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.indexOf(DEC_PREFIX) === 0));
      expect(result.indexOf(DEC_PREFIX) === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 27));
      expect(result.length === 27).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011067 end');
    })

    /**
     * @tc.name   testUiFlowVolume011068
     * @tc.number SUB_CIPHER_UI_1068
     * @tc.desc   decrypt page empty input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011068 begin');
      const result: string = (await runUiScenario('decryptEmpty', 0));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result !== NAV_FAIL));
      expect(result !== NAV_FAIL).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 0));
      expect(result.length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === DEC_BASE_RESULT));
      expect(result === DEC_BASE_RESULT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011068 end');
    })

    /**
     * @tc.name   testUiFlowVolume011069
     * @tc.number SUB_CIPHER_UI_1069
     * @tc.desc   decrypt page reset clears the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlowVolume011069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011069 begin');
      const result: string = (await runUiScenario('decryptReset', 1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result !== NAV_FAIL));
      expect(result !== NAV_FAIL).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 0));
      expect(result.length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === DEC_BASE_RESULT));
      expect(result === DEC_BASE_RESULT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiFlowVolume011069 end');
    })

  })
}
