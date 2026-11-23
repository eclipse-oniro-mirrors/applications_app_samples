/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.verifycode';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'VerifyCodeEntrySmokeTest';

const ROOT_ID: string = 'verifyCodeEntryRoot';
const COMPONENT_ID: string = 'verifyCodeComponent';
const UNIT_IDS: string[] = ['verifyCodeUnit0', 'verifyCodeUnit1', 'verifyCodeUnit2',
  'verifyCodeUnit3', 'verifyCodeUnit4', 'verifyCodeUnit5'];

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
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

async function getBoundsOf(driver: Driver, id: string): Promise<number[]> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    const bounds = await component.getBounds();
    return [bounds.left, bounds.top, bounds.right, bounds.bottom];
  } catch (error) {
    log('getBoundsOf failed: ' + id + ' -> ' + String(error));
    return [];
  }
}

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function ensureEntryPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, ROOT_ID)) {
      return true;
    }
    await startMainAbility();
  }
  return await exists(driver, ROOT_ID);
}

async function prepare(driver: Driver): Promise<boolean> {
  await startMainAbility();
  return await ensureEntryPage(driver);
}

export default function abilityTest() {
  describe('VerifyCodeEntrySmokeTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await ensureEntryPage(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureEntryPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureEntryPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0301
     * @tc.name      testVcEntry0301
     * @tc.desc      Verify the entry page exposes the root container after launch.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0301 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual4}`);
      expect(actual4).assertTrue();
      log('testVcEntry0301 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0302
     * @tc.name      testVcEntry0302
     * @tc.desc      Verify the verify code component from the HAR renders on the entry page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0302 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual7}`);
      expect(actual7).assertTrue();
      log('testVcEntry0302 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0303
     * @tc.name      testVcEntry0303
     * @tc.desc      Verify all six code unit components render inside the component.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0303 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[0])=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, UNIT_IDS[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[1])=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, UNIT_IDS[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[2])=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, UNIT_IDS[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[3])=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, UNIT_IDS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[4])=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[5])=${actual14}`);
      expect(actual14).assertTrue();
      log('testVcEntry0303 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0304
     * @tc.name      testVcEntry0304
     * @tc.desc      Verify the verify code component has a non empty on screen area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0304 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const bounds: number[] = await getBoundsOf(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bounds.length=${bounds.length}, expected=4`);
      expect(bounds.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[2] > bounds[0]=${bounds[2] > bounds[0]}`);
      expect(bounds[2] > bounds[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[3] > bounds[1]=${bounds[3] > bounds[1]}`);
      expect(bounds[3] > bounds[1]).assertTrue();
      log('testVcEntry0304 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0305
     * @tc.name      testVcEntry0305
     * @tc.desc      Verify root container component and units coexist on the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0305 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[0])=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[5])=${actual20}`);
      expect(actual20).assertTrue();
      log('testVcEntry0305 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0306
     * @tc.name      testVcEntry0306
     * @tc.desc      Verify clicking the component runs the attach path and keeps the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0306 begin');
      const driver: Driver = Driver.create();
      const actual21: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual24}`);
      expect(actual24).assertTrue();
      log('testVcEntry0306 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0307
     * @tc.name      testVcEntry0307
     * @tc.desc      Verify repeated preparation of the entry page is idempotent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0307 begin');
      const driver: Driver = Driver.create();
      const actual25: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await exists(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[0])=${actual29}`);
      expect(actual29).assertTrue();
      log('testVcEntry0307 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_ENTSMK_0308
     * @tc.name      testVcEntry0308
     * @tc.desc      Verify the first code unit is laid out inside the component bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcEntry0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcEntry0308 begin');
      const driver: Driver = Driver.create();
      const actual30: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual30}`);
      expect(actual30).assertTrue();
      const compBounds: number[] = await getBoundsOf(driver, COMPONENT_ID);
      const unitBounds: number[] = await getBoundsOf(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual compBounds.length=${compBounds.length}, expected=4`);
      expect(compBounds.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unitBounds.length=${unitBounds.length}, expected=4`);
      expect(unitBounds.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${unitBounds[0] >= compBounds[0]}`);
      expect(unitBounds[0] >= compBounds[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${unitBounds[2] <= compBounds[2]}`);
      expect(unitBounds[2] <= compBounds[2]).assertTrue();
      log('testVcEntry0308 end');
    })
  })
}
