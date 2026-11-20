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

const BUNDLE: string = 'com.ohos.hag.famanager';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexPageUiStateTest';
const ARKTS_BUTTON: string = 'addArkTsCard';
const JS_BUTTON: string = 'addJsCard';

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

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, ARKTS_BUTTON) && await exists(driver, JS_BUTTON)) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(600);
  }
  return await exists(driver, ARKTS_BUTTON) && await exists(driver, JS_BUTTON);
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureIndexPage(driver)) {
    log('prepare: index page is not available');
    return false;
  }
  return true;
}

export default function indexPageUiStateTest(): void {
  describe('IndexPageUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1001
     * @tc.name      testPageUiState1001
     * @tc.desc      Verify the index page exposes both publish buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1001 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual4}`);
      expect(actual4).assertTrue();
      log('testPageUiState1001 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1002
     * @tc.name      testPageUiState1002
     * @tc.desc      Verify the ArkTs publish button is clickable and stays stable after click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1002 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await clickId(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ARKTS_BUTTON)=${actual6}`);
      expect(actual6).assertTrue();
      await sleep(500);
      const actual7: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual8}`);
      expect(actual8).assertTrue();
      log('testPageUiState1002 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1003
     * @tc.name      testPageUiState1003
     * @tc.desc      Verify the Js publish button is clickable and stays stable after click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1003 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await clickId(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, JS_BUTTON)=${actual9}`);
      expect(actual9).assertTrue();
      await sleep(500);
      const actual10: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual11}`);
      expect(actual11).assertTrue();
      log('testPageUiState1003 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1004
     * @tc.name      testPageUiState1004
     * @tc.desc      Verify clicking both publish buttons in sequence keeps the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1004 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ARKTS_BUTTON)=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const actual13: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await clickId(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, JS_BUTTON)=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(500);
      const actual15: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual17}`);
      expect(actual17).assertTrue();
      log('testPageUiState1004 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1005
     * @tc.name      testPageUiState1005
     * @tc.desc      Verify two consecutive ArkTs publish button clicks keep the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1005 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await clickId(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ARKTS_BUTTON)=${actual17}`);
      expect(actual17).assertTrue();
      await sleep(500);
      const actual18: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await clickId(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ARKTS_BUTTON)=${actual19}`);
      expect(actual19).assertTrue();
      await sleep(500);
      const actual20: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual22}`);
      expect(actual22).assertTrue();
      log('testPageUiState1005 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1006
     * @tc.name      testPageUiState1006
     * @tc.desc      Verify two consecutive Js publish button clicks keep the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1006 begin');
      const driver: Driver = Driver.create();
      const actual21: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual23: boolean = await clickId(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, JS_BUTTON)=${actual23}`);
      expect(actual23).assertTrue();
      await sleep(500);
      const actual24: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await clickId(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, JS_BUTTON)=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(500);
      const actual26: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual28}`);
      expect(actual28).assertTrue();
      log('testPageUiState1006 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1007
     * @tc.name      testPageUiState1007
     * @tc.desc      Verify the ArkTs publish button has a non zero layout area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1007 begin');
      const driver: Driver = Driver.create();
      const actual26: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const component: Component = await driver.findComponent(ON.id(ARKTS_BUTTON));
      const rect = await component.getBounds();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rect.right - rect.left > 0 && rect.bottom - rect.top > 0`);
      expect(rect.right - rect.left > 0 && rect.bottom - rect.top > 0).assertTrue();
      log('testPageUiState1007 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1008
     * @tc.name      testPageUiState1008
     * @tc.desc      Verify the ArkTs publish button reports itself as clickable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1008 begin');
      const driver: Driver = Driver.create();
      const actual27: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const component: Component = await driver.findComponent(ON.id(ARKTS_BUTTON));
      const actual28: boolean = await component.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue component.isClickable()=${actual28}`);
      expect(actual28).assertTrue();
      log('testPageUiState1008 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1009
     * @tc.name      testPageUiState1009
     * @tc.desc      Verify the Js publish button reports itself as clickable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1009 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const component: Component = await driver.findComponent(ON.id(JS_BUTTON));
      const actual30: boolean = await component.isClickable();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue component.isClickable()=${actual30}`);
      expect(actual30).assertTrue();
      log('testPageUiState1009 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1010
     * @tc.name      testPageUiState1010
     * @tc.desc      Verify both buttons reappear after backing out and relaunching the ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1010 begin');
      const driver: Driver = Driver.create();
      const actual31: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual31}`);
      expect(actual31).assertTrue();
      await driver.pressBack();
      await sleep(700);
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual32: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual33}`);
      expect(actual33).assertTrue();
      log('testPageUiState1010 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1011
     * @tc.name      testPageUiState1011
     * @tc.desc      Verify repeated page preparation is idempotent and always succeeds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1011 begin');
      const driver: Driver = Driver.create();
      const actual34: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual34}`);
      expect(actual34).assertTrue();
      const actual35: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual35}`);
      expect(actual35).assertTrue();
      const actual36: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual36}`);
      expect(actual36).assertTrue();
      log('testPageUiState1011 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_PAGEUI_1012
     * @tc.name      testPageUiState1012
     * @tc.desc      Verify alternating publish button clicks keep both buttons available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUiState1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUiState1012 begin');
      const driver: Driver = Driver.create();
      const actual37: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await clickId(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ARKTS_BUTTON)=${actual38}`);
      expect(actual38).assertTrue();
      await sleep(500);
      const actual39: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await clickId(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, JS_BUTTON)=${actual40}`);
      expect(actual40).assertTrue();
      await sleep(500);
      const actual41: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual41}`);
      expect(actual41).assertTrue();
      const actual42: boolean = await clickId(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ARKTS_BUTTON)=${actual42}`);
      expect(actual42).assertTrue();
      await sleep(500);
      const actual43: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual43}`);
      expect(actual43).assertTrue();
      const actual44: boolean = await exists(driver, ARKTS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ARKTS_BUTTON)=${actual44}`);
      expect(actual44).assertTrue();
      const actual45: boolean = await exists(driver, JS_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, JS_BUTTON)=${actual45}`);
      expect(actual45).assertTrue();
      log('testPageUiState1012 end');
    })
  })
}
