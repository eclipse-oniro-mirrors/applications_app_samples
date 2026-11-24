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

import appTest from './App.test';
import dietEndToEndSuite from './Core/DietEndToEnd.test';
import dietModelDeepSuite from './Core/DietModelDeep.test';
import dietInputValidationSuite from './Validation/DietInputValidation.test';
import dietNotificationSuite from './Validation/DietNotification.test';
import dietPositioningSuite from './Interaction/DietPositioning.test';
import dietVisualEffectsSuite from './Interaction/DietVisualEffects.test';
import dietLocalizationTestingSuite from './Integration/DietLocalizationTesting.test';
import dietStatePersistenceSuite from './LifecycleState/DietStatePersistence.test';
import dietAccessControlSuite from './Security/DietAccessControl.test';

export default function testsuite() {
  appTest();
  dietEndToEndSuite();
  dietModelDeepSuite();
  dietInputValidationSuite();
  dietNotificationSuite();
  dietPositioningSuite();
  dietVisualEffectsSuite();
  dietLocalizationTestingSuite();
  dietStatePersistenceSuite();
  dietAccessControlSuite();
}
