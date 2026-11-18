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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';
import { AbilityDelegatorRegistry } from '@kit.TestKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CompConfigCenter]';
const BUNDLE: string = 'CompConfigCenter_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * Start the main ability of the sample.
     */
    it(BUNDLE + 'StartAbility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');
      const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = {
        bundleName: 'com.samples.compconfigcenter',
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StartAbility_001, startAbility done');
      expect(delegator !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, end');
    })

    /**
     * Verify the main title resource used by the Navigation bar.
     */
    it(BUNDLE + 'Resource_002', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Resource_002, begin');
      const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const context = delegator.appContext;
      const title: string = await context.resourceManager.getStringByName('main_title');
      hilog.info(DOMAIN, TAG, 'main_title=%{public}s', title);
      expect(title).assertEqual('CompConfigCenter');
      hilog.info(DOMAIN, TAG, BUNDLE + 'Resource_002, end');
    })

    /**
     * Verify the button resources used by the index page.
     */
    it(BUNDLE + 'Resource_003', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Resource_003, begin');
      const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const context = delegator.appContext;
      const pushPage1: string = await context.resourceManager.getStringByName('push_page1');
      const back: string = await context.resourceManager.getStringByName('back');
      hilog.info(DOMAIN, TAG, 'push_page1=%{public}s, back=%{public}s', pushPage1, back);
      expect(pushPage1).assertEqual('Push DetailPage1');
      expect(back).assertEqual('Back');
      hilog.info(DOMAIN, TAG, BUNDLE + 'Resource_003, end');
    })
  })
}
