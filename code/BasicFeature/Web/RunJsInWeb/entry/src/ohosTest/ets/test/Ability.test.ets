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

import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, it, expect, beforeAll } from '@ohos/hypium';

const TAG: string = 'RunJsInWebTest';
const LOG_DOMAIN: number = 0xF811;
const BUNDLE: string = 'RunJsInWeb_';

/**
 * Entry ability smoke suite.
 *
 * Only ability level facts are asserted here. Page rendering, controls and
 * script injection are owned by PageInteraction_Test, so this suite never
 * duplicates those assertions.
 */
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      hilog.info(LOG_DOMAIN, TAG, '%{public}s', `${BUNDLE}ability suite start`);
    });

    it(BUNDLE + 'StartAbility_001', 0, async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const args = abilityDelegatorRegistry.getArguments();
      const bundleName: string = args.bundleName ?? 'com.samples.runjsinweb';
      await delegator.startAbility({
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      });
      const topAbility = await delegator.getCurrentTopAbility();
      const abilityName: string = topAbility.context.abilityInfo.name;
      expect(abilityName === 'TestAbility' || abilityName === 'EntryAbility').assertTrue();
      hilog.info(LOG_DOMAIN, TAG, '%{public}s', `${BUNDLE}StartAbility_001 passed`);
    });

    it(BUNDLE + 'CheckModuleName_001', 0, async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const topAbility = await delegator.getCurrentTopAbility();
      const moduleName: string = topAbility.context.abilityInfo.moduleName;
      expect(moduleName === 'entry_test' || moduleName === 'entry').assertTrue();
      expect(topAbility.context.abilityInfo.name.length).assertLarger(0);
      hilog.info(LOG_DOMAIN, TAG, '%{public}s', `${BUNDLE}CheckModuleName_001 passed`);
    });
  });
}
