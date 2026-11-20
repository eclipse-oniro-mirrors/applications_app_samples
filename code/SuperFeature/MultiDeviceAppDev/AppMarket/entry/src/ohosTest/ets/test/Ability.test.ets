/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { logger } from '../util/Logger';

const TAG: string = '[Sample_AppMarket]';
const BUNDLE = 'AppMarket_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_LEGACY_0100
     * @tc.name    AppMarketStartAbility001
     * @tc.desc    Launch the AppMarket ability
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(BUNDLE + 'StartAbility_001', 0, async () => {
      logger.info(TAG, `${BUNDLE}StartAbility_001 begin`);
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegator.startAbility({
          bundleName: 'ohos.samples.appmarket',
          abilityName: 'MainAbility'
        });
      } catch (expection) {
        logger.info(TAG, `StartAbility end ${JSON.stringify(expection)}`);
        expect(0).assertEqual(expection.code);
      }
      logger.info(TAG, `${BUNDLE}StartAbility_001 end`);
    })
  })
}
