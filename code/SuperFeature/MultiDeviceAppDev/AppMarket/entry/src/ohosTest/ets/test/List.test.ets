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
import marketConsistencySuite from './Core/MarketConsistency.test';
import marketMenuConfigurationSuite from './Core/MarketMenuConfiguration.test';
import marketFocusManagerValidationSuite from './Validation/MarketFocusManagerValidation.test';
import marketInterruptionRecoverySuite from './Validation/MarketInterruptionRecovery.test';
import marketDataBindingSuite from './Interaction/MarketDataBinding.test';
import marketUIComponentRenderingSuite from './Interaction/MarketUIComponentRendering.test';
import marketIntegrationTestingSuite from './Integration/MarketIntegrationTesting.test';
import marketSessionManagementSuite from './LifecycleState/MarketSessionManagement.test';
import marketPerformanceSuite from './PerformanceStability/MarketPerformance.test';

export default function testsuite() {
  abilityTest();
  marketConsistencySuite();
  marketMenuConfigurationSuite();
  marketFocusManagerValidationSuite();
  marketInterruptionRecoverySuite();
  marketDataBindingSuite();
  marketUIComponentRenderingSuite();
  marketIntegrationTestingSuite();
  marketSessionManagementSuite();
  marketPerformanceSuite();
}
