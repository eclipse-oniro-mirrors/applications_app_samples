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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { getDriver, startApp, clickAndExpect } from './StationaryUiSupport';

const TAG = 'Sample_Stationary';
const DOMAIN = 0xF812;
const BUNDLE = 'Stationary_';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

export default function abilityTest() {
  describe('StationaryAppTest', () => {
    /**
     * @tc.number    SUB_ABILITY_TEST_0100
     * @tc.name      testStartAbility0001
     * @tc.desc      Verify testStartAbility0001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStartAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'testStartAbility0001 begin');
      expect(await startApp()).assertTrue();
      await getDriver().delayMs(300);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, 'top ability name: %{public}s', ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'testStartAbility0001 end');
    });

    /**
     * @tc.number    SUB_ABILITY_TEST_0200
     * @tc.name      testSubscribe0002
     * @tc.desc      Verify testSubscribe0002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubscribe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'testSubscribe0002 begin');
      expect(await clickAndExpect(getDriver(), 0)).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'testSubscribe0002 end');
    });

    /**
     * @tc.number    SUB_ABILITY_TEST_0300
     * @tc.name      testUnsubscribe0003
     * @tc.desc      Verify testUnsubscribe0003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testUnsubscribe0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'testUnsubscribe0003 begin');
      expect(await clickAndExpect(getDriver(), 1)).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'testUnsubscribe0003 end');
    });

    /**
     * @tc.number    SUB_ABILITY_TEST_0400
     * @tc.name      testGetStatus0004
     * @tc.desc      Verify testGetStatus0004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGetStatus0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'testGetStatus0004 begin');
      expect(await clickAndExpect(getDriver(), 2)).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'testGetStatus0004 end');
    });
  });
}
