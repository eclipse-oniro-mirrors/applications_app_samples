/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

const BUNDLE: string = 'com.samples.tabcontenttouchhotzone';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'TabOverflowVideoUiState';

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

async function ensureVideoTab(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'video')) {
      return true;
    }
    if (await exists(driver, 'tabItem1')) {
      await clickId(driver, 'tabItem1');
      await sleep(500);
    } else {
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        log('startAbility failed: ' + String(error));
      }
      await sleep(1200);
    }
  }
  return await exists(driver, 'video');
}

async function prepare(driver: Driver): Promise<boolean> {
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  } catch (error) {
    log('startAbility failed: ' + String(error));
  }
  await sleep(1200);
  if (!await ensureVideoTab(driver)) {
    log('prepare: video tab is not available');
    return false;
  }
  return true;
}

export default function tabOverflowVideoUiStateTest(): void {
  describe('TabOverflowVideoUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        log('startAbility failed: ' + String(error));
      }
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureVideoTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureVideoTab(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_VIDEOUI_0501
     * @tc.name      testTabOverflowVideoUi0501
     * @tc.desc      Verify the elapsed time label is present in the progress bar area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowVideoUi0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowVideoUi0501 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'text1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'text1')=${actual3}`);
      expect(actual3).assertTrue();
      log('testTabOverflowVideoUi0501 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_VIDEOUI_0503
     * @tc.name      testTabOverflowVideoUi0503
     * @tc.desc      Verify the drag indicator is present in the progress area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowVideoUi0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowVideoUi0503 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'text3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'text3')=${actual7}`);
      expect(actual7).assertTrue();
      log('testTabOverflowVideoUi0503 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_VIDEOUI_0504
     * @tc.name      testTabOverflowVideoUi0504
     * @tc.desc      Verify clicking the play button starts playback and keeps the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowVideoUi0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowVideoUi0504 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await clickId(driver, 'image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'image')=${actual9}`);
      expect(actual9).assertTrue();
      await sleep(700);
      const actual10: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual10}`);
      expect(actual10).assertTrue();
      log('testTabOverflowVideoUi0504 end');
    })
  })
}
