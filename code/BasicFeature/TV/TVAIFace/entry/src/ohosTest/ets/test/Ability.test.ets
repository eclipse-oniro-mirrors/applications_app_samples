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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const TAG: string = 'AIFaceAbilityTest';
const TARGET_BUNDLE: string = 'com.ohos.aiface';
const TARGET_ABILITY: string = 'MainAbility';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let delegator: abilityDelegatorRegistry.AbilityDelegator;

    beforeAll(() => {
      hilog.info(0x0000, TAG, '%{public}s', 'ActsAbilityTest beforeAll');
      delegator = abilityDelegatorRegistry.getAbilityDelegator();
    });

    beforeEach(() => {
      hilog.info(0x0000, TAG, '%{public}s', 'ActsAbilityTest beforeEach');
    });

    afterEach(() => {
      hilog.info(0x0000, TAG, '%{public}s', 'ActsAbilityTest afterEach');
    });

    afterAll(() => {
      hilog.info(0x0000, TAG, '%{public}s', 'ActsAbilityTest afterAll');
    });

    it('assertContain', 0, () => {
      hilog.info(0x0000, TAG, '%{public}s', 'assertContain begin');
      let a: string = 'abc';
      let b: string = 'b';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    });

    it('ability_delegator_should_be_available', 0, () => {
      expect(delegator !== undefined).assertTrue();
    });

    it('test_arguments_should_expose_bundle_name', 0, () => {
      const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
      expect(args !== undefined).assertTrue();
      expect(typeof args.bundleName).assertEqual('string');
      expect(args.bundleName.length).assertLarger(0);
      hilog.info(0x0000, TAG, '%{public}s', 'bundle name resolved');
    });

    it('bundle_name_should_target_aiface', 0, () => {
      const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
      expect(args.bundleName.indexOf('aiface') >= 0 || args.bundleName === TARGET_BUNDLE).assertTrue();
    });

    it('app_context_should_be_accessible', 0, () => {
      const context = delegator.getAppContext();
      expect(context !== undefined).assertTrue();
    });

    it('app_context_should_expose_resource_manager', 0, () => {
      const context = delegator.getAppContext();
      const manager = context.resourceManager;
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    it('app_context_should_expose_files_dir', 0, () => {
      const context = delegator.getAppContext();
      expect(typeof context.filesDir).assertEqual('string');
      expect(context.filesDir.length).assertLarger(0);
    });


    it('target_constants_should_be_non_empty', 0, () => {
      expect(TARGET_BUNDLE.length).assertLarger(0);
      expect(TARGET_ABILITY.length).assertLarger(0);
      expect(TARGET_BUNDLE).assertContain('aiface');
    });
  });
}
