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

const BUNDLE: string = 'com.samples.filepreviewdlp';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF812;
const TAG: string = 'AbilitySmokeTest';

const ID_PAGE_ROOT: string = 'pageRoot';
const ID_TITLE_TEXT: string = 'titleText';
const ID_ADD_BUTTON: string = 'addButton';
const ID_FILTER_BUTTON: string = 'filterButton';
const ID_FILE_LIST: string = 'fileList';

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

async function ensureHomePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, ID_PAGE_ROOT)) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, ID_PAGE_ROOT);
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureHomePage(driver)) {
    log('prepare: home page is not available');
    return false;
  }
  return true;
}

export default function abilityTest(): void {
  describe('FilePreviewDLPAbilityTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1500);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0601
     * @tc.name      testEntrySmoke0601
     * @tc.desc      Verify the entry ability starts without throwing.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      log('testEntrySmoke0601 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0602
     * @tc.name      testEntrySmoke0602
     * @tc.desc      Verify the page root container is exposed by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0602 begin');
      const driver: Driver = Driver.create();
      const actual3: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual4}`);
      expect(actual4).assertTrue();
      log('testEntrySmoke0602 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0603
     * @tc.name      testEntrySmoke0603
     * @tc.desc      Verify the title text is exposed by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0603 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, ID_TITLE_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_TITLE_TEXT)=${actual6}`);
      expect(actual6).assertTrue();
      log('testEntrySmoke0603 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0604
     * @tc.name      testEntrySmoke0604
     * @tc.desc      Verify the add button is exposed by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0604 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, ID_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_ADD_BUTTON)=${actual8}`);
      expect(actual8).assertTrue();
      log('testEntrySmoke0604 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0605
     * @tc.name      testEntrySmoke0605
     * @tc.desc      Verify the filter button is exposed by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0605 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_FILTER_BUTTON)=${actual10}`);
      expect(actual10).assertTrue();
      log('testEntrySmoke0605 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0606
     * @tc.name      testEntrySmoke0606
     * @tc.desc      Verify the file list container is exposed by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0606 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, ID_FILE_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_FILE_LIST)=${actual12}`);
      expect(actual12).assertTrue();
      log('testEntrySmoke0606 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0607
     * @tc.name      testEntrySmoke0607
     * @tc.desc      Verify the test target bundle name matches the app configuration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0607 begin');
      const appContext = delegator.getAppContext();
      const name: string = appContext.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual name=${name}, expected=BUNDLE`);
      expect(name).assertEqual(BUNDLE);
      log('testEntrySmoke0607 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0608
     * @tc.name      testEntrySmoke0608
     * @tc.desc      Verify a second startAbility keeps the home page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0608 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual14: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual14}`);
      expect(actual14).assertTrue();
      log('testEntrySmoke0608 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ENTR_0609
     * @tc.name      testEntrySmoke0609
     * @tc.desc      Verify all five core home components are co-visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0609 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, ID_TITLE_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_TITLE_TEXT)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, ID_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_ADD_BUTTON)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_FILTER_BUTTON)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, ID_FILE_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_FILE_LIST)=${actual20}`);
      expect(actual20).assertTrue();
      log('testEntrySmoke0609 end');
    })
  })
}
