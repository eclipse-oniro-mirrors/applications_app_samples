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

import abilityTest from './Ability.test';
import navAppOperationWorkflowSuite from './Core/NavAppOperationWorkflow.test';
import navAppStateManagementSuite from './Core/NavAppStateManagement.test';
import navAppAnimationControllerValidationSuite from './Validation/NavAppAnimationControllerValidation.test';
import navAppPointerUtilValidationSuite from './Validation/NavAppPointerUtilValidation.test';
import navAppResourceLoaderValidationSuite from './Validation/NavAppResourceLoaderValidation.test';
import navAppStyleResolutionSuite from './Validation/NavAppStyleResolution.test';
import navAppFocusNavigationSuite from './Interaction/NavAppFocusNavigation.test';
import navAppSystemIntegrationSuite from './Integration/NavAppSystemIntegration.test';
import navAppStateStoreSuite from './LifecycleState/NavAppStateStore.test';
import navAppConcurrencyControlSuite from './PerformanceStability/NavAppConcurrencyControl.test';
import navBarExtensionSuite from './NavBarExtension.test';

export default function testsuite() {
  abilityTest();
  navAppOperationWorkflowSuite();
  navAppStateManagementSuite();
  navAppAnimationControllerValidationSuite();
  navAppPointerUtilValidationSuite();
  navAppResourceLoaderValidationSuite();
  navAppStyleResolutionSuite();
  navAppFocusNavigationSuite();
  navAppSystemIntegrationSuite();
  navAppStateStoreSuite();
  navAppConcurrencyControlSuite();
  navBarExtensionSuite();
}
