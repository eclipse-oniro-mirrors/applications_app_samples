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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { resourceManager } from '@kit.LocalizationKit';

let manager: resourceManager.ResourceManager;


export default function resourceLoaderValidationTest(): void {
  describe('resourceLoaderValidation_test', () => {
    beforeAll(() => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('resource_manager_should_be_available', 0, () => {
      expect(manager !== undefined).assertTrue();
    });


    it('test_resource_string_should_be_readable', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(typeof text).assertEqual('string');
      expect(text.length).assertLarger(0);
    });


    /* Business case 3473-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3473', 0, async () => {
      for (let i = 0; i < 3; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3471-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3471', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3470-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3470', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3463-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3463', 0, async () => {
      for (let i = 0; i < 2; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3461-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3461', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3460-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3460', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3454-4 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3454', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3453-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3453', 0, async () => {
      for (let i = 0; i < 1; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3452-2 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3452', 0, () => {
      expect(typeof manager.getMediaContent).assertEqual('function');
      expect(typeof manager.getMediaContentSync).assertEqual('function');
    });

    /* Business case 3451-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3451', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3450-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3450', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3449-9 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3449', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3448-8 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3448', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3447-7 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3447', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3446-6 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3446', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3445-5 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3445', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3444-4 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3444', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3443-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3443', 0, async () => {
      for (let i = 0; i < 3; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3442-2 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3442', 0, () => {
      expect(typeof manager.getMediaContent).assertEqual('function');
      expect(typeof manager.getMediaContentSync).assertEqual('function');
    });

    /* Business case 3441-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3441', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3440-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3440', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3439-9 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3439', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3438-8 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3438', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3437-7 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3437', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3436-6 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3436', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3435-5 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3435', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3434-4 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3434', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3433-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3433', 0, async () => {
      for (let i = 0; i < 2; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3432-2 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3432', 0, () => {
      expect(typeof manager.getMediaContent).assertEqual('function');
      expect(typeof manager.getMediaContentSync).assertEqual('function');
    });

    /* Business case 3431-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3431', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3430-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3430', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3429-9 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3429', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3428-8 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3428', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3427-7 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3427', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3426-6 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3426', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3425-5 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3425', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3424-4 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3424', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3423-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3423', 0, async () => {
      for (let i = 0; i < 1; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3422-2 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3422', 0, () => {
      expect(typeof manager.getMediaContent).assertEqual('function');
      expect(typeof manager.getMediaContentSync).assertEqual('function');
    });

    /* Business case 3421-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3421', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3420-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3420', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3419-9 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3419', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3418-8 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3418', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3417-7 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3417', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3416-6 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3416', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3415-5 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3415', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3414-4 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3414', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3413-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3413', 0, async () => {
      for (let i = 0; i < 3; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3412-2 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3412', 0, () => {
      expect(typeof manager.getMediaContent).assertEqual('function');
      expect(typeof manager.getMediaContentSync).assertEqual('function');
    });

    /* Business case 3411-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3411', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3410-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3410', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

    /* Business case 3409-9 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3409', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3408-8 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3408', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3407-7 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3407', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3406-6 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3406', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3405-5 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3405', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3404-4 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3404', 0, () => {
      expect(typeof manager.getStringSync).assertEqual('function');
      expect(typeof manager.getConfigurationSync).assertEqual('function');
    });

    /* Business case 3403-3 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3403', 0, async () => {
      for (let i = 0; i < 2; i++) {
        const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
        expect(text.length).assertLarger(0);
      }
    });

    /* Business case 3402-2 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3402', 0, () => {
      expect(typeof manager.getMediaContent).assertEqual('function');
      expect(typeof manager.getMediaContentSync).assertEqual('function');
    });

    /* Business case 3401-1 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3401', 0, async () => {
      const text: string = await manager.getStringValue($r('app.string.TestAbility_label'));
      expect(text.length).assertLarger(0);
    });

    /* Business case 3400-0 for ResourceLoaderValidation */
    it('ResourceLoaderValidation_case_3400', 0, () => {
      expect(manager !== undefined).assertTrue();
      expect(typeof manager.getStringValue).assertEqual('function');
    });

  });
}
