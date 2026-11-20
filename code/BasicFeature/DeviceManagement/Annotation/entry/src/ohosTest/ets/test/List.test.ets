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
import annotationApiTest from './AnnotationApi.test';
import constantValidationTest from './ConstantValidation.test';
import apiVersionBoundaryTest from './ApiVersionBoundary.test';
import annotationStateTest from './AnnotationState.test';
import mockEnvironmentTest from './MockEnvironment.test';
import robustnessTest from './Robustness.test';
import annotationEdgeCasesTest from './AnnotationServiceEdgeCases.test';
import annotationExceptionTest from './AnnotationException.test';
import annotationDeepTest from './AnnotationDeep.test';
import annotationConsistencyTest from './AnnotationConsistency.test';
import annotationLifecycleTest from './AnnotationLifecycle.test';
import annotationIntegrationTest from './AnnotationIntegration.test';
import annotationErrorTest from './AnnotationError.test';
import annotationConfigTest from './AnnotationConfig.test';
import annotationSecurityTest from './AnnotationSecurity.test';
import annotationStateMachineTest from './AnnotationStateMachine.test';
import annotationBoundaryTest from './AnnotationBoundary.test';
import annotationExceptionInputTest from './AnnotationExceptionInput.test';
import annotationLifecycleExtTest from './AnnotationLifecycleExt.test';
import annotationIntegrationExtTest from './AnnotationIntegrationExt.test';
import annotationConstantDeepTest from './AnnotationConstantDeep.test';
import annotationSecurityDeepTest from './AnnotationSecurityDeep.test';
import annotationUIDeepTest from './AnnotationUIDeep.test';
import annotationMonitorTest from './AnnotationMonitor.test';
import annotationConcurrencyTest from './AnnotationConcurrency.test';
import annotationMemoryTest from './AnnotationMemory.test';
import annotationErrorBoundaryTest from './AnnotationErrorBoundary.test';
import annotationRuleEngineTest from './AnnotationRuleEngine.test';
import annotationRegressionTest from './AnnotationRegression.test';

export default function testsuite() {
  annotationApiTest();
  abilityTest();
  constantValidationTest();
  apiVersionBoundaryTest();
  annotationStateTest();
  mockEnvironmentTest();
  robustnessTest();
  annotationEdgeCasesTest();
  annotationExceptionTest();
  annotationDeepTest();
  annotationConsistencyTest();
  annotationLifecycleTest();
  annotationIntegrationTest();
  annotationErrorTest();
  annotationConfigTest();
  annotationSecurityTest();
  annotationStateMachineTest();
  annotationBoundaryTest();
  annotationExceptionInputTest();
  annotationLifecycleExtTest();
  annotationIntegrationExtTest();
  annotationConstantDeepTest();
  annotationSecurityDeepTest();
  annotationUIDeepTest();
  annotationMonitorTest();
  annotationConcurrencyTest();
  annotationMemoryTest();
  annotationErrorBoundaryTest();
  annotationRuleEngineTest();
  annotationRegressionTest();
}
