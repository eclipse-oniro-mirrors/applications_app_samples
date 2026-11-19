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
const TAG: string = 'CallDialFlowUiTest';

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

async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
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

async function recover(driver: Driver): Promise<void> {
  await driver.pressBack();
  await sleep(500);
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1000);
  expect(await ensureCallPage(driver)).assertTrue();
}

export default function callDialFlowUiTest(): void {
  describe('CallDialFlowUiTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      expect(await ensureCallPage(driver)).assertTrue();
    });

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0601
     * @tc.name      testCallDialFlow0601
     * @tc.desc      Verify dialing a typed number replaces the initial output text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0601 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '13800138000')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      const output: string = await getTextById(driver, 'callOutput');
      expect(output.indexOf('call information')).assertEqual(-1);
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await getTextById(driver, 'telInput')).assertEqual('13800138000');
      await recover(driver);
      log('testCallDialFlow0601 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0602
     * @tc.name      testCallDialFlow0602
     * @tc.desc      Verify dialing with an empty number still updates the output area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0602 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await getTextById(driver, 'telInput')).assertEqual('');
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      const output: string = await getTextById(driver, 'callOutput');
      expect(output.indexOf('call information')).assertEqual(-1);
      expect(await exists(driver, 'telInput')).assertTrue();
      await recover(driver);
      log('testCallDialFlow0602 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0603
     * @tc.name      testCallDialFlow0603
     * @tc.desc      Verify two consecutive dial actions keep the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0603 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '15912345678')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(700);
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      await recover(driver);
      log('testCallDialFlow0603 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0604
     * @tc.name      testCallDialFlow0604
     * @tc.desc      Verify the typed number is preserved after triggering the dial action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0604 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '18612345678')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('18612345678');
      expect(value.length).assertEqual(11);
      await recover(driver);
      log('testCallDialFlow0604 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0605
     * @tc.name      testCallDialFlow0605
     * @tc.desc      Verify typing a new number works after a dial action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0605 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '13012345678')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      expect(await inputById(driver, 'telInput', '19912345678')).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(value).assertEqual('19912345678');
      expect(await exists(driver, 'callOutput')).assertTrue();
      await recover(driver);
      log('testCallDialFlow0605 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0606
     * @tc.name      testCallDialFlow0606
     * @tc.desc      Verify dialing an emergency number updates the output area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0606 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '110')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      const output: string = await getTextById(driver, 'callOutput');
      expect(output.indexOf('call information')).assertEqual(-1);
      expect(await exists(driver, 'callImg')).assertTrue();
      await recover(driver);
      log('testCallDialFlow0606 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0607
     * @tc.name      testCallDialFlow0607
     * @tc.desc      Verify a full dial then retype then redial cycle keeps the page usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0607 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '14712345678')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      expect(await inputById(driver, 'telInput', '17512345678')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await getTextById(driver, 'telInput')).assertEqual('17512345678');
      await recover(driver);
      log('testCallDialFlow0607 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0608
     * @tc.name      testCallDialFlow0608
     * @tc.desc      Verify a fresh page entry shows the initial output text again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0608 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '13800138000')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      await recover(driver);
      const output: string = await getTextById(driver, 'callOutput');
      expect(output.indexOf('call information')).assertEqual(-1);
      expect(await exists(driver, 'callOutput')).assertTrue();
      log('testCallDialFlow0608 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0609
     * @tc.name      testCallDialFlow0609
     * @tc.desc      Verify the page recovers with core components after leave and re-entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0609 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(700);
      await driver.pressBack();
      await sleep(800);
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      expect(await ensureCallPage(driver)).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      expect(await exists(driver, 'callOutput')).assertTrue();
      log('testCallDialFlow0609 end');
    })

    /**
     * @tc.number    SUB_CALL_DIALFLOW_0610
     * @tc.name      testCallDialFlow0610
     * @tc.desc      Verify dialing twice clears the stale initial output each time.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallDialFlow0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallDialFlow0610 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await inputById(driver, 'telInput', '17512345678')).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      const first: string = await getTextById(driver, 'callOutput');
      expect(first.indexOf('call information')).assertEqual(-1);
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(900);
      const second: string = await getTextById(driver, 'callOutput');
      expect(second.indexOf('call information')).assertEqual(-1);
      expect(await exists(driver, 'telInput')).assertTrue();
      await recover(driver);
      log('testCallDialFlow0610 end');
    })
  })
}
