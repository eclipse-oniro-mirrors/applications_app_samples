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
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'ohos.samples.windowcomponent';
const ABILITY: string = 'MainAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'TouchableUiStateTest';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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
  } catch (err) {
    log('exists failed: ' + id + ' -> ' + String(err));
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
  } catch (err) {
    log('clickId failed: ' + id + ' -> ' + String(err));
    return false;
  }
}

async function pressBack(driver: Driver): Promise<void> {
  try {
    await driver.pressBack();
  } catch (err) {
    log('pressBack failed: ' + String(err));
  }
  await sleep(500);
}

async function ensureHomePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'videoPageButton')) {
      return true;
    }
    await pressBack(driver);
  }
  if (!await exists(driver, 'videoPageButton')) {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, 'videoPageButton');
}

async function ensureTouchablePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'area1')) {
      return true;
    }
    if (!await ensureHomePage(driver)) {
      return false;
    }
    await clickId(driver, 'touchablePageButton');
    await sleep(900);
  }
  return await exists(driver, 'area1');
}

async function prepareTouchablePage(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await ensureTouchablePage(driver);
}

export default function touchableUiStateTest(): void {
  describe('TouchableUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0801
     * @tc.name      testTouchableUiState0801
     * @tc.desc      Verify the touchable area page exposes all four area labels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0801 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'area2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area2')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'area3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area3')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area4')=${actual6}`);
      expect(actual6).assertTrue();
      log('testTouchableUiState0801 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0802
     * @tc.name      testTouchableUiState0802
     * @tc.desc      Verify tapping the touchable area1 keeps the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0802 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await clickId(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'area1')=${actual8}`);
      expect(actual8).assertTrue();
      await sleep(600);
      const actual9: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual9}`);
      expect(actual9).assertTrue();
      log('testTouchableUiState0802 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0803
     * @tc.name      testTouchableUiState0803
     * @tc.desc      Verify tapping the touchable area4 keeps the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0803 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await clickId(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'area4')=${actual11}`);
      expect(actual11).assertTrue();
      await sleep(600);
      const actual12: boolean = await exists(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area4')=${actual12}`);
      expect(actual12).assertTrue();
      log('testTouchableUiState0803 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0806
     * @tc.name      testTouchableUiState0806
     * @tc.desc      Verify tapping both touchable areas keeps every label present.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0806 begin');
      const driver: Driver = Driver.create();
      const actual21: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await clickId(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'area1')=${actual22}`);
      expect(actual22).assertTrue();
      await sleep(500);
      const actual25: boolean = await clickId(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'area4')=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(500);
      const actual26: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'area2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area2')=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, 'area3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area3')=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await exists(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area4')=${actual29}`);
      expect(actual29).assertTrue();
      log('testTouchableUiState0806 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0807
     * @tc.name      testTouchableUiState0807
     * @tc.desc      Verify re-entering the touchable page keeps the area labels present.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0807 begin');
      const driver: Driver = Driver.create();
      const actual30: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual30}`);
      expect(actual30).assertTrue();
      await pressBack(driver);
      const actual31: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await ensureTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureTouchablePage(driver)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual33}`);
      expect(actual33).assertTrue();
      const actual34: boolean = await exists(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area4')=${actual34}`);
      expect(actual34).assertTrue();
      log('testTouchableUiState0807 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0808
     * @tc.name      testTouchableUiState0808
     * @tc.desc      Verify pressing back on the touchable page returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0808 begin');
      const driver: Driver = Driver.create();
      const actual35: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual35}`);
      expect(actual35).assertTrue();
      await pressBack(driver);
      const actual36: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await exists(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'systemBarPageButton')=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual38}`);
      expect(actual38).assertTrue();
      log('testTouchableUiState0808 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_TOUCHABLEUI_0809
     * @tc.name      testTouchableUiState0809
     * @tc.desc      Verify repeated touchable page round trips stay stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTouchableUiState0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTouchableUiState0809 begin');
      const driver: Driver = Driver.create();
      const actual39: boolean = await prepareTouchablePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareTouchablePage(driver)=${actual39}`);
      expect(actual39).assertTrue();
      for (let i: number = 0; i < 2; i++) {
        await pressBack(driver);
        const actual40: boolean = await ensureHomePage(driver);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual40}`);
        expect(actual40).assertTrue();
        const actual41: boolean = await clickId(driver, 'touchablePageButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'touchablePageButton')=${actual41}`);
        expect(actual41).assertTrue();
        await sleep(900);
        const actual42: boolean = await exists(driver, 'area1');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual42}`);
        expect(actual42).assertTrue();
        const actual43: boolean = await exists(driver, 'area4');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area4')=${actual43}`);
        expect(actual43).assertTrue();
      }
      log('testTouchableUiState0809 end');
    })
  })
}
