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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { abilityAccessCtrl } from '@kit.AbilityKit';

const TAG = 'BetaClubAbilityTest';

const LOG_DOMAIN: number = 0x0102;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let bundleName: string = '';

    beforeAll(() => {
      const args = abilityDelegatorRegistry.getArguments();
      bundleName = args.bundleName;
      hilog.info(LOG_DOMAIN, TAG, 'beforeAll bundleName: %{public}s', bundleName);
    });

    beforeEach(() => {
      hilog.info(LOG_DOMAIN, TAG, 'beforeEach test case start');
    });

    afterEach(() => {
      hilog.info(LOG_DOMAIN, TAG, 'afterEach test case end');
    });

    afterAll(() => {
      hilog.info(LOG_DOMAIN, TAG, 'afterAll test suite end');
    });

    it('assertContain', 0, () => {
      hilog.info(LOG_DOMAIN, TAG, 'it begin');
      let a = 'abc';
      let b = 'b';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    });

    it('bundle_name_should_not_be_empty', 0, () => {
      expect(bundleName.length).assertLarger(0);
      expect(bundleName).assertContain('beta');
    });

    it('ability_delegator_should_be_available', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      expect(delegator !== undefined && delegator !== null).assertTrue();
    });

    it('test_ability_context_should_be_available', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const abilityList = delegator.getCurrentTopAbility();
      expect(abilityList !== undefined).assertTrue();
    });

    it('permission_manager_should_be_created', 0, () => {
      const atManager = abilityAccessCtrl.createAtManager();
      expect(atManager !== undefined).assertTrue();
    });

    it('hilog_domain_should_be_positive', 0, () => {
      expect(LOG_DOMAIN).assertLarger(0);
      expect(hilog.isLoggable(LOG_DOMAIN, TAG, hilog.LogLevel.INFO)).assertTrue();
    });
  });
}
