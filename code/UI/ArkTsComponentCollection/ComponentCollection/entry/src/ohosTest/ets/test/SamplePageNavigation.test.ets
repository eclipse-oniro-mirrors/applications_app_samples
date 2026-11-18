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

const BUNDLE: string = 'ohos.samples.componentcollection';
const ABILITY: string = 'MainAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'SamplePageNavTest';

// 第四级菜单行的组件 id 使用其路由 url（FourthLevelNavigation 以 url 作为 id）
const DIVIDER_ENTRY_ID: string = 'pages/components/blankAndDivider/dividerSample/DividerSample';
// 通用 tab 事件分组第一行（点击事件）直接路由
const TOUCH_EVENT_ROW_ID: string = 'secondLevelMenu01';

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
    await sleep(500);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'tabBar0')) {
      return true;
    }
    if (await exists(driver, 'backBtn')) {
      await clickId(driver, 'backBtn');
      await sleep(500);
    }
  }
  return await exists(driver, 'tabBar0');
}

async function ensureComponentsTab(driver: Driver): Promise<boolean> {
  if (await exists(driver, 'secondLevelMenu00')) {
    return true;
  }
  await clickId(driver, 'tabBar0');
  return await exists(driver, 'secondLevelMenu00');
}

async function ensureDividerGroupExpanded(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, DIVIDER_ENTRY_ID)) {
      return true;
    }
    await clickId(driver, 'secondLevelMenu00');
    await sleep(500);
  }
  return await exists(driver, DIVIDER_ENTRY_ID);
}

async function ensureUniversalTab(driver: Driver): Promise<boolean> {
  if (await exists(driver, TOUCH_EVENT_ROW_ID)) {
    return true;
  }
  await clickId(driver, 'tabBar1');
  return await exists(driver, TOUCH_EVENT_ROW_ID);
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureMainPage(driver)) {
    log('prepare: main page is not available');
    return false;
  }
  return true;
}

export default function samplePageNavigationTest(): void {
  describe('SamplePageNavigationTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0701
     * @tc.name      testSamplePageNav0701
     * @tc.desc      Verify expanding the first components group reveals the divider entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0701 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await ensureComponentsTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureComponentsTab(driver)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await ensureDividerGroupExpanded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureDividerGroupExpanded(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, DIVIDER_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DIVIDER_ENTRY_ID)=${actual5}`);
      expect(actual5).assertTrue();
      log('testSamplePageNav0701 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0702
     * @tc.name      testSamplePageNav0702
     * @tc.desc      Verify clicking the divider entry opens the divider sample page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0702 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await ensureComponentsTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureComponentsTab(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await ensureDividerGroupExpanded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureDividerGroupExpanded(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await clickId(driver, DIVIDER_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, DIVIDER_ENTRY_ID)=${actual9}`);
      expect(actual9).assertTrue();
      await sleep(700);
      const actual10: boolean = await exists(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'backBtn')=${actual10}`);
      expect(actual10).assertTrue();
      log('testSamplePageNav0702 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0703
     * @tc.name      testSamplePageNav0703
     * @tc.desc      Verify the back button returns from divider sample to the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0703 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await ensureComponentsTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureComponentsTab(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await ensureDividerGroupExpanded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureDividerGroupExpanded(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await clickId(driver, DIVIDER_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, DIVIDER_ENTRY_ID)=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(700);
      const actual15: boolean = await clickId(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'backBtn')=${actual15}`);
      expect(actual15).assertTrue();
      await sleep(700);
      const actual16: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual17}`);
      expect(actual17).assertTrue();
      log('testSamplePageNav0703 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0704
     * @tc.name      testSamplePageNav0704
     * @tc.desc      Verify repeated divider navigation stays stable on a second attempt.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0704 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await ensureComponentsTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureComponentsTab(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await ensureDividerGroupExpanded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureDividerGroupExpanded(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await clickId(driver, DIVIDER_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, DIVIDER_ENTRY_ID)=${actual21}`);
      expect(actual21).assertTrue();
      await sleep(700);
      const actual22: boolean = await clickId(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'backBtn')=${actual22}`);
      expect(actual22).assertTrue();
      await sleep(700);
      const actual23: boolean = await ensureDividerGroupExpanded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureDividerGroupExpanded(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await clickId(driver, DIVIDER_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, DIVIDER_ENTRY_ID)=${actual24}`);
      expect(actual24).assertTrue();
      await sleep(700);
      const actual25: boolean = await exists(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'backBtn')=${actual25}`);
      expect(actual25).assertTrue();
      log('testSamplePageNav0704 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0705
     * @tc.name      testSamplePageNav0705
     * @tc.desc      Verify the universal tab event row opens the touch event sample.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0705 begin');
      const driver: Driver = Driver.create();
      const actual26: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await ensureUniversalTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureUniversalTab(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await clickId(driver, TOUCH_EVENT_ROW_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, TOUCH_EVENT_ROW_ID)=${actual28}`);
      expect(actual28).assertTrue();
      await sleep(700);
      const actual29: boolean = await exists(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'backBtn')=${actual29}`);
      expect(actual29).assertTrue();
      log('testSamplePageNav0705 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0706
     * @tc.name      testSamplePageNav0706
     * @tc.desc      Verify the back button returns from touch event sample to main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0706 begin');
      const driver: Driver = Driver.create();
      const actual30: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await ensureUniversalTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureUniversalTab(driver)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await clickId(driver, TOUCH_EVENT_ROW_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, TOUCH_EVENT_ROW_ID)=${actual32}`);
      expect(actual32).assertTrue();
      await sleep(700);
      const actual33: boolean = await clickId(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'backBtn')=${actual33}`);
      expect(actual33).assertTrue();
      await sleep(700);
      const actual34: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual34}`);
      expect(actual34).assertTrue();
      const actual35: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual35}`);
      expect(actual35).assertTrue();
      log('testSamplePageNav0706 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0707
     * @tc.name      testSamplePageNav0707
     * @tc.desc      Verify repeated universal tab navigation stays stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0707 begin');
      const driver: Driver = Driver.create();
      const actual36: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await ensureUniversalTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureUniversalTab(driver)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await clickId(driver, TOUCH_EVENT_ROW_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, TOUCH_EVENT_ROW_ID)=${actual38}`);
      expect(actual38).assertTrue();
      await sleep(700);
      const actual39: boolean = await clickId(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'backBtn')=${actual39}`);
      expect(actual39).assertTrue();
      await sleep(700);
      const actual40: boolean = await ensureUniversalTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureUniversalTab(driver)=${actual40}`);
      expect(actual40).assertTrue();
      const actual41: boolean = await clickId(driver, TOUCH_EVENT_ROW_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, TOUCH_EVENT_ROW_ID)=${actual41}`);
      expect(actual41).assertTrue();
      await sleep(700);
      const actual42: boolean = await exists(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'backBtn')=${actual42}`);
      expect(actual42).assertTrue();
      log('testSamplePageNav0707 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SAMPLENAV_0708
     * @tc.name      testSamplePageNav0708
     * @tc.desc      Verify the components list keeps its first row after page navigation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSamplePageNav0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSamplePageNav0708 begin');
      const driver: Driver = Driver.create();
      const actual43: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual43}`);
      expect(actual43).assertTrue();
      const actual44: boolean = await ensureUniversalTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureUniversalTab(driver)=${actual44}`);
      expect(actual44).assertTrue();
      const actual45: boolean = await clickId(driver, TOUCH_EVENT_ROW_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, TOUCH_EVENT_ROW_ID)=${actual45}`);
      expect(actual45).assertTrue();
      await sleep(700);
      const actual46: boolean = await clickId(driver, 'backBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'backBtn')=${actual46}`);
      expect(actual46).assertTrue();
      await sleep(700);
      const actual47: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual47}`);
      expect(actual47).assertTrue();
      const actual48: boolean = await clickId(driver, 'tabBar0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar0')=${actual48}`);
      expect(actual48).assertTrue();
      const actual49: boolean = await exists(driver, 'secondLevelMenu00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'secondLevelMenu00')=${actual49}`);
      expect(actual49).assertTrue();
      log('testSamplePageNav0708 end');
    })
  })
}
