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
const TAG: string = 'IndexPageUiStateTest';

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

export default function indexPageUiStateTest(): void {
  describe('IndexPageUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1500);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      // 尝试关闭可能弹出的系统选择器页面，再恢复主页守卫
      try {
        await driver.pressBack();
        await sleep(300);
      } catch (error) {
        log('afterEach pressBack failed: ' + String(error));
      }
      const actual1: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0701
     * @tc.name      testIndexUiState0701
     * @tc.desc      Verify the home page exposes all five core components.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0701 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, ID_TITLE_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_TITLE_TEXT)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, ID_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_ADD_BUTTON)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_FILTER_BUTTON)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, ID_FILE_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_FILE_LIST)=${actual7}`);
      expect(actual7).assertTrue();
      log('testIndexUiState0701 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0702
     * @tc.name      testIndexUiState0702
     * @tc.desc      Verify the filter button can be located and clicked by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0702 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual9}`);
      expect(actual9).assertTrue();
      log('testIndexUiState0702 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0703
     * @tc.name      testIndexUiState0703
     * @tc.desc      Verify the page root survives a filter button click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0703 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual11}`);
      expect(actual11).assertTrue();
      await sleep(500);
      const actual12: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual12}`);
      expect(actual12).assertTrue();
      log('testIndexUiState0703 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0704
     * @tc.name      testIndexUiState0704
     * @tc.desc      Verify three consecutive filter clicks keep the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0704 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(500);
      const actual17: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual17}`);
      expect(actual17).assertTrue();
      log('testIndexUiState0704 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0705
     * @tc.name      testIndexUiState0705
     * @tc.desc      Verify title and add button remain visible after a filter click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0705 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual19}`);
      expect(actual19).assertTrue();
      await sleep(500);
      const actual20: boolean = await exists(driver, ID_TITLE_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_TITLE_TEXT)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, ID_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_ADD_BUTTON)=${actual21}`);
      expect(actual21).assertTrue();
      log('testIndexUiState0705 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0706
     * @tc.name      testIndexUiState0706
     * @tc.desc      Verify the add button can be located and clicked by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0706 begin');
      const driver: Driver = Driver.create();
      const actual22: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await clickId(driver, ID_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_ADD_BUTTON)=${actual23}`);
      expect(actual23).assertTrue();
      await sleep(700);
      log('testIndexUiState0706 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0707
     * @tc.name      testIndexUiState0707
     * @tc.desc      Verify pressing back after an add click returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0707 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await clickId(driver, ID_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_ADD_BUTTON)=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(700);
      await driver.pressBack();
      await sleep(600);
      const actual26: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual26}`);
      expect(actual26).assertTrue();
      log('testIndexUiState0707 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0708
     * @tc.name      testIndexUiState0708
     * @tc.desc      Verify the prepare guard succeeds twice in a row.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0708 begin');
      const driver: Driver = Driver.create();
      const actual27: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      log('testIndexUiState0708 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0709
     * @tc.name      testIndexUiState0709
     * @tc.desc      Verify the home guard restores the page after a filter click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0709 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual30}`);
      expect(actual30).assertTrue();
      await sleep(300);
      const actual31: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual31}`);
      expect(actual31).assertTrue();
      log('testIndexUiState0709 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0710
     * @tc.name      testIndexUiState0710
     * @tc.desc      Verify the empty file list can be clicked without breaking the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0710 begin');
      const driver: Driver = Driver.create();
      const actual32: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await clickId(driver, ID_FILE_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILE_LIST)=${actual33}`);
      expect(actual33).assertTrue();
      await sleep(400);
      const actual34: boolean = await exists(driver, ID_PAGE_ROOT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ID_PAGE_ROOT)=${actual34}`);
      expect(actual34).assertTrue();
      log('testIndexUiState0710 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0711
     * @tc.name      testIndexUiState0711
     * @tc.desc      Verify two filter and prepare rounds stay stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0711', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0711 begin');
      const driver: Driver = Driver.create();
      const actual35: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual35}`);
      expect(actual35).assertTrue();
      const actual36: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual36}`);
      expect(actual36).assertTrue();
      await sleep(300);
      const actual37: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await clickId(driver, ID_FILTER_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, ID_FILTER_BUTTON)=${actual38}`);
      expect(actual38).assertTrue();
      await sleep(300);
      const actual39: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual39}`);
      expect(actual39).assertTrue();
      log('testIndexUiState0711 end');
    })

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_IDXP_0712
     * @tc.name      testIndexUiState0712
     * @tc.desc      Verify the home guard alone recovers the page when needed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0712 begin');
      const driver: Driver = Driver.create();
      const actual40: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual40}`);
      expect(actual40).assertTrue();
      log('testIndexUiState0712 end');
    })
  })
}
