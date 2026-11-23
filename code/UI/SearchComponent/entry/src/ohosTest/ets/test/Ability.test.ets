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
import { beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'EntryAbilitySmokeTest';

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

export default function abilityTest(): void {
  describe('EntryAbilitySmokeTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: bundleName, abilityName: ABILITY });
      await sleep(1500);
      log('beforeAll end');
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_ABILITY_0801
     * @tc.name      testEntryAbilitySmoke0801
     * @tc.desc      Verify the entry ability launches and renders the home search box.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntryAbilitySmoke0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntryAbilitySmoke0801 begin');
      const driver: Driver = Driver.create();
      const actual1: boolean = await exists(driver, 'searchCaseTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'searchCaseTitle')=${actual1}`);
      expect(actual1).assertTrue();
      const searchBox: Component = await driver.findComponent(ON.id('searchCaseTitle'));
      const bounds: Rect = await searchBox.getBounds();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds.right > bounds.left=${bounds.right > bounds.left}`);
      expect(bounds.right > bounds.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds.bottom > bounds.top=${bounds.bottom > bounds.top}`);
      expect(bounds.bottom > bounds.top).assertTrue();
      log('testEntryAbilitySmoke0801 end');
    })
  })
}
