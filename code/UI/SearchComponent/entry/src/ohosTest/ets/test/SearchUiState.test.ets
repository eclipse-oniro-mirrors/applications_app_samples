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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'SearchUiStateTest';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

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

async function restoreHome(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 4; i++) {
    const home: boolean = await exists(driver, 'searchCaseTitle');
    const searchOpen: boolean = await exists(driver, 'search_input');
    if (home && !searchOpen) {
      return true;
    }
    await driver.pressBack();
    await sleep(800);
  }
  await delegator.startAbility({ bundleName: bundleName, abilityName: ABILITY });
  await sleep(1200);
  return await exists(driver, 'searchCaseTitle');
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: bundleName, abilityName: ABILITY });
  await sleep(1200);
  if (!await restoreHome(driver)) {
    log('prepare: home page is not available');
    return false;
  }
  return true;
}

export default function searchUiStateTest(): void {
  describe('SearchUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: bundleName, abilityName: ABILITY });
      await sleep(1500);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await restoreHome(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restoreHome(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_UISTATE_0301
     * @tc.name      testSearchUiState0301
     * @tc.desc      Verify the home page exposes a clickable search box.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSearchUiState0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSearchUiState0301 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'searchCaseTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'searchCaseTitle')=${actual3}`);
      expect(actual3).assertTrue();
      const searchBox: Component = await driver.findComponent(ON.id('searchCaseTitle'));
      const bounds: Rect = await searchBox.getBounds();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds.right > bounds.left=${bounds.right > bounds.left}`);
      expect(bounds.right > bounds.left).assertTrue();
      log('testSearchUiState0301 end');
    })
  })
}
