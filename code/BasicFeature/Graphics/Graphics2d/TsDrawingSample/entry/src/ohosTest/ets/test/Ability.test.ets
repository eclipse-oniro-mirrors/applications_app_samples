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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.tsdrawingsample';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'DrawingEntryUiSmokeTest';
const CONTAINER_ID: string = 'drawingNodeContainer';

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

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, CONTAINER_ID)) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, CONTAINER_ID);
}

export default function abilityTest(): void {
  describe('DrawingEntryUiSmokeTest', () => {
    /**
     * @tc.number    SUB_TSDRAWING_ENTRYSMOKE_0701
     * @tc.name      testDrawingEntryUiSmoke0701
     * @tc.desc      Verify the application launches and shows the drawing node container.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingEntryUiSmoke0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingEntryUiSmoke0701 begin');
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual1: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual1}`);
      expect(actual1).assertTrue();
      log('testDrawingEntryUiSmoke0701 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_ENTRYSMOKE_0702
     * @tc.name      testDrawingEntryUiSmoke0702
     * @tc.desc      Verify clicking Path renders the path page without leaving the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingEntryUiSmoke0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingEntryUiSmoke0702 begin');
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual2: boolean = await clickId(driver, 'pathBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'pathBtn')=${actual2}`);
      expect(actual2).assertTrue();
      await sleep(1000);
      const actual3: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual3}`);
      expect(actual3).assertTrue();
      log('testDrawingEntryUiSmoke0702 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_ENTRYSMOKE_0703
     * @tc.name      testDrawingEntryUiSmoke0703
     * @tc.desc      Verify clicking Canvas renders the canvas page without leaving the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingEntryUiSmoke0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingEntryUiSmoke0703 begin');
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual4: boolean = await clickId(driver, 'canvasBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'canvasBtn')=${actual4}`);
      expect(actual4).assertTrue();
      await sleep(1000);
      const actual5: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual5}`);
      expect(actual5).assertTrue();
      log('testDrawingEntryUiSmoke0703 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_ENTRYSMOKE_0704
     * @tc.name      testDrawingEntryUiSmoke0704
     * @tc.desc      Verify clicking Image and Font renders the image page without leaving the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingEntryUiSmoke0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      log('testDrawingEntryUiSmoke0704 begin');
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual6: boolean = await clickId(driver, 'imageFontBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'imageFontBtn')=${actual6}`);
      expect(actual6).assertTrue();
      await sleep(1000);
      const actual7: boolean = await exists(driver, CONTAINER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, CONTAINER_ID)=${actual7}`);
      expect(actual7).assertTrue();
      log('testDrawingEntryUiSmoke0704 end');
    })
  })
}
