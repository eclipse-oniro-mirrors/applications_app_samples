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
const TAG: string = 'CallPageUiTest';

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

async function clearInput(driver: Driver): Promise<void> {
  try {
    const component: Component = await driver.findComponent(ON.id('telInput'));
    if (component !== undefined && component !== null) {
      await component.clearText();
      await sleep(200);
    }
  } catch (error) {
    log('clearInput failed -> ' + String(error));
  }
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureCallPage(driver)) {
    return false;
  }
  await clearInput(driver);
  return true;
}

export default function callPageUiTest(): void {
  describe('CallPageUiTest', () => {
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
     * @tc.number    SUB_CALL_PAGEUI_0401
     * @tc.name      testCallPageUi0401
     * @tc.desc      Verify the page exposes the phone number input.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0401 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      log('testCallPageUi0401 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0402
     * @tc.name      testCallPageUi0402
     * @tc.desc      Verify the page exposes the dial action image.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0402 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      log('testCallPageUi0402 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0403
     * @tc.name      testCallPageUi0403
     * @tc.desc      Verify the page exposes the call information output area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0403 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      log('testCallPageUi0403 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0404
     * @tc.name      testCallPageUi0404
     * @tc.desc      Verify the page exposes the title bar text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0404 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'callTitle')).assertTrue();
      expect(await exists(driver, 'callOutput')).assertTrue();
      log('testCallPageUi0404 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0405
     * @tc.name      testCallPageUi0405
     * @tc.desc      Verify the output area renders a non-empty text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0405 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await sleep(300);
      const output: string = await getTextById(driver, 'callOutput');
      expect(typeof output).assertEqual('string');
      expect(output.length > 0).assertTrue();
      expect(await exists(driver, 'callOutput')).assertTrue();
      log('testCallPageUi0405 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0406
     * @tc.name      testCallPageUi0406
     * @tc.desc      Verify the phone input is readable as text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0406 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      const value: string = await getTextById(driver, 'telInput');
      expect(typeof value).assertEqual('string');
      expect(await exists(driver, 'telInput')).assertTrue();
      log('testCallPageUi0406 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0407
     * @tc.name      testCallPageUi0407
     * @tc.desc      Verify all core components exist together on the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0407 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'callTitle')).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      expect(await exists(driver, 'callOutput')).assertTrue();
      log('testCallPageUi0407 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0408
     * @tc.name      testCallPageUi0408
     * @tc.desc      Verify clicking the dial image keeps the page components alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0408 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(700);
      expect(await exists(driver, 'callOutput')).assertTrue();
      expect(await exists(driver, 'telInput')).assertTrue();
      await driver.pressBack();
      await sleep(500);
      log('testCallPageUi0408 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0409
     * @tc.name      testCallPageUi0409
     * @tc.desc      Verify two consecutive dial image clicks keep the page usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0409 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(700);
      expect(await clickId(driver, 'callImg')).assertTrue();
      await sleep(700);
      expect(await exists(driver, 'callOutput')).assertTrue();
      await driver.pressBack();
      await sleep(500);
      log('testCallPageUi0409 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0410
     * @tc.name      testCallPageUi0410
     * @tc.desc      Verify the title bar shows the Call caption.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0410 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      const title: string = await getTextById(driver, 'callTitle');
      expect(title).assertEqual('Call');
      expect(title.length > 0).assertTrue();
      expect(await exists(driver, 'callTitle')).assertTrue();
      log('testCallPageUi0410 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0411
     * @tc.name      testCallPageUi0411
     * @tc.desc      Verify the page stays stable across repeated re-entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0411 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await ensureCallPage(driver)).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      expect(await ensureCallPage(driver)).assertTrue();
      expect(await exists(driver, 'callImg')).assertTrue();
      log('testCallPageUi0411 end');
    })

    /**
     * @tc.number    SUB_CALL_PAGEUI_0412
     * @tc.name      testCallPageUi0412
     * @tc.desc      Verify the initial output text is stable across consecutive reads.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCallPageUi0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCallPageUi0412 begin');
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      const first: string = await getTextById(driver, 'callOutput');
      await sleep(300);
      const second: string = await getTextById(driver, 'callOutput');
      expect(first).assertEqual(second);
      expect(first.length > 0).assertTrue();
      log('testCallPageUi0412 end');
    })
  })
}
