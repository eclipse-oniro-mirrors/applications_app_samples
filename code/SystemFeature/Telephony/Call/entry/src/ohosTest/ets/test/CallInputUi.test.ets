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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'ohos.samples.call';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'CallInputUiTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function inputById(driver: Driver, id: string, text: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.inputText(text);
    await sleep(350);
    return true;
  } catch (error) {
    log('inputById failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function getTextById(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return await component.getText();
  } catch (error) {
    log('getTextById failed: ' + id + ' -> ' + String(error));
    return '';
  }
}

async function ensureCallPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'telInput')) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, 'telInput');
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureCallPage(driver)) {
    return false;
  }
  await inputById(driver, 'telInput', '');
  await sleep(200);
  return true;
}

export default function callInputUiTest(): void {
  describe('CallInputUiTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      if (await exists(driver, 'telInput')) {
        await inputById(driver, 'telInput', '');
        await sleep(200);
      }
      expect(await ensureCallPage(driver)).assertTrue();
    });

    /**
     * @tc.number    SUB_CALL_INPUTUI_0501
     * @tc.name      testCallInputUi0501
     * @tc.desc      Verify typing a standard 11-digit mobile number fills the input.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0501 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '13800138000')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('13800138000');
      expect(value.length).assertEqual(11);
      log('testCallInputUi0501 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0502
     * @tc.name      testCallInputUi0502
     * @tc.desc      Verify typing a short service number fills the input.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0502 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '10086')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('10086');
      expect(value.length).assertEqual(5);
      log('testCallInputUi0502 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0503
     * @tc.name      testCallInputUi0503
     * @tc.desc      Verify the input keeps at most 11 characters for an overlong number.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0503 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '1234567890123456')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value.length <= 11).assertTrue();
      expect(typeof value).assertEqual('string');
      expect(value.indexOf('1')).assertEqual(0);
      log('testCallInputUi0503 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0504
     * @tc.name      testCallInputUi0504
     * @tc.desc      Verify an exactly 11-digit input is fully accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0504 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '15912345678')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('15912345678');
      expect(value.length).assertEqual(11);
      log('testCallInputUi0504 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0505
     * @tc.name      testCallInputUi0505
     * @tc.desc      Verify clearing the input resets it to an empty value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0505 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '13800138000')).assertTrue();
      expect(await getTextById(driver, 'telInput')).assertEqual('13800138000');
      expect(await inputById(driver, 'telInput', '')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('');
      expect(value.length).assertEqual(0);
      log('testCallInputUi0505 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0506
     * @tc.name      testCallInputUi0506
     * @tc.desc      Verify typing a new number replaces the previous one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0506 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '13800138000')).assertTrue();
      expect(await inputById(driver, 'telInput', '18612345678')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('18612345678');
      expect(value === '13800138000').assertFalse();
      log('testCallInputUi0506 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0507
     * @tc.name      testCallInputUi0507
     * @tc.desc      Verify two sequential typing rounds compose the final number.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0507 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '138')).assertTrue();
      expect(await inputById(driver, 'telInput', '1380013')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('1380013');
      expect(value.length).assertEqual(7);
      log('testCallInputUi0507 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0508
     * @tc.name      testCallInputUi0508
     * @tc.desc      Verify typing leaves the initial output text untouched.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0508 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      const before: string = await getTextById(driver, 'callOutput');
      expect(await inputById(driver, 'telInput', '13800138000')).assertTrue();
      await sleep(300);
      const output: string = await getTextById(driver, 'callOutput');
      expect(output).assertEqual(before);
      expect(await exists(driver, 'callOutput')).assertTrue();
      log('testCallInputUi0508 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0509
     * @tc.name      testCallInputUi0509
     * @tc.desc      Verify an emergency number can be typed into the input.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0509 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '110')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('110');
      expect(value.length).assertEqual(3);
      log('testCallInputUi0509 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0510
     * @tc.name      testCallInputUi0510
     * @tc.desc      Verify the input keeps a stable value across repeated reads.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0510 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '14712345678')).assertTrue();
      const first: string = await getTextById(driver, 'telInput');
      await sleep(300);
      const second: string = await getTextById(driver, 'telInput');
      expect(first).assertEqual(second);
      expect(first).assertEqual('14712345678');
      expect(first.length).assertEqual(11);
      log('testCallInputUi0510 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0511
     * @tc.name      testCallInputUi0511
     * @tc.desc      Verify typing does not break the dial image availability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0511 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '17512345678')).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      log('testCallInputUi0511 end');
    })

    /**
     * @tc.number    SUB_CALL_INPUTUI_0512
     * @tc.name      testCallInputUi0512
     * @tc.desc      Verify clearing an already empty input keeps an empty value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallInputUi0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallInputUi0512 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await getTextById(driver, 'telInput')).assertEqual('');
      expect(await inputById(driver, 'telInput', '')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('');
      expect(await exists(driver, 'telInput')).assertTrue();
      log('testCallInputUi0512 end');
    })
  })
}
