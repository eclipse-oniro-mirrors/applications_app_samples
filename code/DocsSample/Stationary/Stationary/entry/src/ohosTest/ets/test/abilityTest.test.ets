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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { getDriver, startApp, clickAndExpect } from './StationaryUiSupport';

const TAG = 'Sample_Stationary';
const DOMAIN = 0xF812;
const BUNDLE = 'Stationary_';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest() {
  describe('AppTest', () => {
    /**
     * @tc.number    SUB_ABILITY_TEST_0001
     * @tc.name      StartAbility_001
     * @tc.desc      Verify StartAbility_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      expect(await startApp()).assertTrue();
      await getDriver().delayMs(300);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, 'top ability name: %{public}s', ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    });

    /**
     * @tc.number    SUB_ABILITY_TEST_0002
     * @tc.name      Subscribe_002
     * @tc.desc      Verify Subscribe_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Subscribe_002', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Subscribe_002 begin');
      expect(await clickAndExpect(getDriver(), 0)).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'Subscribe_002 end');
    });

    /**
     * @tc.number    SUB_ABILITY_TEST_0003
     * @tc.name      Unsubscribe_003
     * @tc.desc      Verify Unsubscribe_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Unsubscribe_003', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Unsubscribe_003 begin');
      expect(await clickAndExpect(getDriver(), 1)).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'Unsubscribe_003 end');
    });

    /**
     * @tc.number    SUB_ABILITY_TEST_0004
     * @tc.name      GetStatus_004
     * @tc.desc      Verify GetStatus_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('GetStatus_004', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetStatus_004 begin');
      expect(await clickAndExpect(getDriver(), 2)).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'GetStatus_004 end');
    });
  });
}
