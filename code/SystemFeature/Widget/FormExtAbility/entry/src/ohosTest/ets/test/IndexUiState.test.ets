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
import { beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'ohos.samples.formextability';
const ABILITY: string = 'ohos.samples.formextability.MainAbility';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';

const INDEX_MESSAGE_ID: string = 'indexMessageText';
const INDEX_NEXT_BUTTON_ID: string = 'indexNextButton';
const INDEX_NEXT_TEXT_ID: string = 'index_text_3';
const SECOND_MESSAGE_ID: string = 'secondMessageText';
const SECOND_BACK_BUTTON_ID: string = 'secondBackButton';
const SECOND_BACK_TEXT_ID: string = 'second_text_3';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

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

async function getTextById(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return await component.getText();
  } catch (error) {
    log('getTextById failed: ' + id + ' -> ' + String(error));
    return '';
  }
}

async function isClickableById(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return await component.isClickable();
  } catch (error) {
    log('isClickableById failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, INDEX_MESSAGE_ID)) {
      return true;
    }
    await startMainAbility();
    if (await exists(driver, INDEX_MESSAGE_ID)) {
      return true;
    }
    await driver.pressBack();
    await sleep(500);
  }
  return await exists(driver, INDEX_MESSAGE_ID);
}

async function prepare(driver: Driver): Promise<boolean> {
  await startMainAbility();
  if (!await ensureIndexPage(driver)) {
    log('prepare: index page is not available');
    return false;
  }
  return true;
}

async function gotoSecondPage(driver: Driver): Promise<boolean> {
  if (!await clickId(driver, INDEX_NEXT_BUTTON_ID)) {
    return false;
  }
  await sleep(500);
  return await exists(driver, SECOND_MESSAGE_ID);
}

async function backToIndexPage(driver: Driver): Promise<boolean> {
  if (!await clickId(driver, SECOND_BACK_BUTTON_ID)) {
    return false;
  }
  await sleep(500);
  return await exists(driver, INDEX_MESSAGE_ID);
}

export default function indexUiStateTest(): void {
  describe('IndexUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await ensureIndexPage(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureIndexPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0501
     * @tc.name      testIndexUi0501
     * @tc.desc      Verify the index page exposes the message text and next page button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0501 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, INDEX_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_MESSAGE_ID)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, INDEX_NEXT_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_NEXT_BUTTON_ID)=${actual4}`);
      expect(actual4).assertTrue();
      log('testIndexUi0501 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0502
     * @tc.name      testIndexUi0502
     * @tc.desc      Verify the index page message shows Hello World.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0502 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const text: string = await getTextById(driver, INDEX_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='Hello World'`);
      expect(text).assertEqual('Hello World');
      log('testIndexUi0502 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0503
     * @tc.name      testIndexUi0503
     * @tc.desc      Verify the index next button label is next page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0503 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const text: string = await getTextById(driver, INDEX_NEXT_TEXT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='next page'`);
      expect(text).assertEqual('next page');
      log('testIndexUi0503 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0504
     * @tc.name      testIndexUi0504
     * @tc.desc      Verify clicking next page opens the second page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0504 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, SECOND_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, SECOND_MESSAGE_ID)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, SECOND_BACK_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, SECOND_BACK_BUTTON_ID)=${actual10}`);
      expect(actual10).assertTrue();
      log('testIndexUi0504 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0505
     * @tc.name      testIndexUi0505
     * @tc.desc      Verify the second page message shows Second Page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0505 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const text: string = await getTextById(driver, SECOND_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='Second Page'`);
      expect(text).assertEqual('Second Page');
      log('testIndexUi0505 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0506
     * @tc.name      testIndexUi0506
     * @tc.desc      Verify the second page back button label is back to index.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0506 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const text: string = await getTextById(driver, SECOND_BACK_TEXT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='back to index'`);
      expect(text).assertEqual('back to index');
      log('testIndexUi0506 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0507
     * @tc.name      testIndexUi0507
     * @tc.desc      Verify clicking back to index returns to the index page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0507 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await backToIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToIndexPage(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, INDEX_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_MESSAGE_ID)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, INDEX_NEXT_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_NEXT_BUTTON_ID)=${actual19}`);
      expect(actual19).assertTrue();
      log('testIndexUi0507 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0508
     * @tc.name      testIndexUi0508
     * @tc.desc      Verify repeated navigation between index and second stays stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0508 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await backToIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToIndexPage(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await backToIndexPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToIndexPage(driver)=${actual24}`);
      expect(actual24).assertTrue();
      log('testIndexUi0508 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0509
     * @tc.name      testIndexUi0509
     * @tc.desc      Verify navigation buttons are reported clickable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0509 begin');
      const driver: Driver = Driver.create();
      const actual25: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await isClickableById(driver, INDEX_NEXT_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isClickableById(driver, INDEX_NEXT_BUTTON_ID)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await isClickableById(driver, SECOND_BACK_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isClickableById(driver, SECOND_BACK_BUTTON_ID)=${actual28}`);
      expect(actual28).assertTrue();
      log('testIndexUi0509 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_UISTATE_0510
     * @tc.name      testIndexUi0510
     * @tc.desc      Verify a system back press on the second page returns to index.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUi0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUi0510 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await gotoSecondPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gotoSecondPage(driver)=${actual30}`);
      expect(actual30).assertTrue();
      await driver.pressBack();
      await sleep(500);
      const actual31: boolean = await exists(driver, INDEX_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_MESSAGE_ID)=${actual31}`);
      expect(actual31).assertTrue();
      log('testIndexUi0510 end');
    })
  })
}
