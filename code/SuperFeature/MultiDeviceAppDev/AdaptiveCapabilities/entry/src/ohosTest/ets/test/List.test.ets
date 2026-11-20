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

import abilityTest from './Ability.test';
import breakpointConcurrencySuite from './Core/BreakpointConcurrency.test';
import breakpointItemInfoModelSuite from './Core/BreakpointItemInfoModel.test';
import breakpointDialogStateManagerValidationSuite from './Validation/BreakpointDialogStateManagerValidation.test';
import breakpointEventToolValidationSuite from './Validation/BreakpointEventToolValidation.test';
import breakpointContentScalingSuite from './Interaction/BreakpointContentScaling.test';
import breakpointTouchInteractionSuite from './Interaction/BreakpointTouchInteraction.test';
import breakpointDeviceCompatibilitySuite from './Integration/BreakpointDeviceCompatibility.test';
import breakpointResourceManagementSuite from './LifecycleState/BreakpointResourceManagement.test';
import breakpointPowerConsumptionSuite from './PerformanceStability/BreakpointPowerConsumption.test';

export default function testsuite() {
  abilityTest();
  breakpointConcurrencySuite();
  breakpointItemInfoModelSuite();
  breakpointDialogStateManagerValidationSuite();
  breakpointEventToolValidationSuite();
  breakpointContentScalingSuite();
  breakpointTouchInteractionSuite();
  breakpointDeviceCompatibilitySuite();
  breakpointResourceManagementSuite();
  breakpointPowerConsumptionSuite();
}
