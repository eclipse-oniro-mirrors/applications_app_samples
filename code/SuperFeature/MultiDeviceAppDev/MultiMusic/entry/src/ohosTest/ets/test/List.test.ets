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
import musicDialogLifecycleSuite from './Core/MusicDialogLifecycle.test';
import musicOperationFlowSuite from './Core/MusicOperationFlow.test';
import musicLoggerValidationSuite from './Validation/MusicLoggerValidation.test';
import musicSessionValidationSuite from './Validation/MusicSessionValidation.test';
import musicEventPropagationSuite from './Interaction/MusicEventPropagation.test';
import musicCompatibilitySuite from './Integration/MusicCompatibility.test';
import musicCatalogAggregationSuite from './Integration/MusicCatalogAggregation.test';
import musicLifecycleSuite from './LifecycleState/MusicLifecycle.test';
import musicAnimationPerformanceSuite from './PerformanceStability/MusicAnimationPerformance.test';
import musicSecurityValidationSuite from './Security/MusicSecurityValidation.test';
import musicExtensionSuite from './MusicExtension.test';

export default function testsuite() {
  abilityTest();
  musicDialogLifecycleSuite();
  musicOperationFlowSuite();
  musicLoggerValidationSuite();
  musicSessionValidationSuite();
  musicEventPropagationSuite();
  musicCompatibilitySuite();
  musicCatalogAggregationSuite();
  musicLifecycleSuite();
  musicAnimationPerformanceSuite();
  musicSecurityValidationSuite();
  musicExtensionSuite();
}
