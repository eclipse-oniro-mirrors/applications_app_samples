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
import { emitter } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.verifycode';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'VerifyCodeUiStateTest';
const BACK_EVENT_ID: number = 5;

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

async function readTextOf(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    const text = await component.getText();
    if (text === undefined || text === null) {
      return '';
    }
    return text;
  } catch (error) {
    log('readTextOf failed: ' + id + ' -> ' + String(error));
    return '';
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

async function emitBackEvent(): Promise<boolean> {
  try {
    let innerEvent: emitter.InnerEvent = {
      eventId: BACK_EVENT_ID
    };
    emitter.emit(innerEvent);
    await sleep(400);
    return true;
  } catch (error) {
    log('emitBackEvent failed -> ' + String(error));
    return false;
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
  if (!await ensureEntryPage(driver)) {
    log('prepare: entry page is not available');
    return false;
  }
  return await exists(driver, COMPONENT_ID);
}

export default function verifyCodeUiStateTest(): void {
  describe('VerifyCodeUiStateTest', () => {
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
     * @tc.number    SUB_VERIFYCODE_UIST_0401
     * @tc.name      testVcUi0401
     * @tc.desc      Verify all six code units show no characters on a fresh page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0401 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = await readTextOf(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[0])=${actual3}, expected=''`);
      expect(actual3).assertEqual('');
      const actual4: string = await readTextOf(driver, UNIT_IDS[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[1])=${actual4}, expected=''`);
      expect(actual4).assertEqual('');
      const actual5: string = await readTextOf(driver, UNIT_IDS[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[2])=${actual5}, expected=''`);
      expect(actual5).assertEqual('');
      const actual6: string = await readTextOf(driver, UNIT_IDS[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[3])=${actual6}, expected=''`);
      expect(actual6).assertEqual('');
      const actual7: string = await readTextOf(driver, UNIT_IDS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[4])=${actual7}, expected=''`);
      expect(actual7).assertEqual('');
      const actual8: string = await readTextOf(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[5])=${actual8}, expected=''`);
      expect(actual8).assertEqual('');
      log('testVcUi0401 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0402
     * @tc.name      testVcUi0402
     * @tc.desc      Verify the code component has a non zero area on a fresh page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0402 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const bounds: number[] = await getBoundsOf(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bounds.length=${bounds.length}, expected=4`);
      expect(bounds.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[2] > bounds[0]=${bounds[2] > bounds[0]}`);
      expect(bounds[2] > bounds[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[3] > bounds[1]=${bounds[3] > bounds[1]}`);
      expect(bounds[3] > bounds[1]).assertTrue();
      log('testVcUi0402 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0403
     * @tc.name      testVcUi0403
     * @tc.desc      Verify clicking the component runs the attach path and the page survives.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0403 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[0])=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[5])=${actual14}`);
      expect(actual14).assertTrue();
      log('testVcUi0403 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0404
     * @tc.name      testVcUi0404
     * @tc.desc      Verify no characters appear in the units without an input method insert.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0404 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(500);
      const actual17: string = await readTextOf(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[0])=${actual17}, expected=''`);
      expect(actual17).assertEqual('');
      const actual18: string = await readTextOf(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual readTextOf(driver, UNIT_IDS[5])=${actual18}, expected=''`);
      expect(actual18).assertEqual('');
      const actual19: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual19}`);
      expect(actual19).assertTrue();
      log('testVcUi0404 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0405
     * @tc.name      testVcUi0405
     * @tc.desc      Verify the back event after attach takes the hide branch and keeps the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0405 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await emitBackEvent();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue emitBackEvent()=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual24}`);
      expect(actual24).assertTrue();
      log('testVcUi0405 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0406
     * @tc.name      testVcUi0406
     * @tc.desc      Verify the back event while detached takes the route back branch safely.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0406 begin');
      const driver: Driver = Driver.create();
      const actual25: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await emitBackEvent();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue emitBackEvent()=${actual26}`);
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
      log('testVcUi0406 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0407
     * @tc.name      testVcUi0407
     * @tc.desc      Verify an attach hide and attach round trip keeps the component alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0407 begin');
      const driver: Driver = Driver.create();
      const actual30: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await emitBackEvent();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue emitBackEvent()=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual33}`);
      expect(actual33).assertTrue();
      const actual34: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual34}`);
      expect(actual34).assertTrue();
      const actual35: boolean = await exists(driver, UNIT_IDS[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[3])=${actual35}`);
      expect(actual35).assertTrue();
      log('testVcUi0407 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0408
     * @tc.name      testVcUi0408
     * @tc.desc      Verify five rapid attach attempts stay stable and keep all units.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0408 begin');
      const driver: Driver = Driver.create();
      const actual36: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual38}`);
      expect(actual38).assertTrue();
      const actual39: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual40}`);
      expect(actual40).assertTrue();
      const actual41: boolean = await clickId(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, COMPONENT_ID)=${actual41}`);
      expect(actual41).assertTrue();
      const actual42: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual42}`);
      expect(actual42).assertTrue();
      const actual43: boolean = await exists(driver, UNIT_IDS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[0])=${actual43}`);
      expect(actual43).assertTrue();
      const actual44: boolean = await exists(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[5])=${actual44}`);
      expect(actual44).assertTrue();
      log('testVcUi0408 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0409
     * @tc.name      testVcUi0409
     * @tc.desc      Verify the six code units are ordered left to right on screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0409 begin');
      const driver: Driver = Driver.create();
      const actual45: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual45}`);
      expect(actual45).assertTrue();
      const first: number[] = await getBoundsOf(driver, UNIT_IDS[0]);
      const second: number[] = await getBoundsOf(driver, UNIT_IDS[1]);
      const third: number[] = await getBoundsOf(driver, UNIT_IDS[2]);
      const last: number[] = await getBoundsOf(driver, UNIT_IDS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=4`);
      expect(first.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.length=${last.length}, expected=4`);
      expect(last.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first[0] < second[0]=${first[0] < second[0]}`);
      expect(first[0] < second[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second[0] < third[0]=${second[0] < third[0]}`);
      expect(second[0] < third[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue third[0] < last[0]=${third[0] < last[0]}`);
      expect(third[0] < last[0]).assertTrue();
      log('testVcUi0409 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_UIST_0410
     * @tc.name      testVcUi0410
     * @tc.desc      Verify repeated preparation keeps the entry page and core components.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVcUi0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVcUi0410 begin');
      const driver: Driver = Driver.create();
      const actual46: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual46}`);
      expect(actual46).assertTrue();
      const actual47: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual47}`);
      expect(actual47).assertTrue();
      const actual48: boolean = await exists(driver, ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ROOT_ID)=${actual48}`);
      expect(actual48).assertTrue();
      const actual49: boolean = await exists(driver, COMPONENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, COMPONENT_ID)=${actual49}`);
      expect(actual49).assertTrue();
      const actual50: boolean = await exists(driver, UNIT_IDS[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, UNIT_IDS[2])=${actual50}`);
      expect(actual50).assertTrue();
      log('testVcUi0410 end');
    })
  })
}
