/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import abilityRequestModelTest from './AbilityContext/AbilityRequestModel.test';
import abilityRequestConfigurationTest from './AbilityContext/AbilityRequestConfiguration.test';
import abilityContextModelDeepTest from './AbilityContext/AbilityContextModelDeep.test';
import abilityOperationCatalogTest from './AbilityContext/AbilityOperationCatalog.test';
import abilityOperationFlowTest from './AbilityContext/AbilityOperationFlow.test';
import abilityOperationsTest from './AbilityContext/AbilityOperations.test';
import abilityOperationWorkflowTest from './AbilityContext/AbilityOperationWorkflow.test';
import abilityContextUITest from './AbilityContext/AbilityContextUI.test';
import abilityContextInteractionTest from './AbilityContext/AbilityContextInteraction.test';
import abilityContextConcurrencyTest from './AbilityContext/AbilityContextConcurrency.test';
import abilityContextConsistencyTest from './AbilityContext/AbilityContextConsistency.test';
import abilityContextEndToEndTest from './AbilityContext/AbilityContextEndToEnd.test';
import abilityContextErrorRecoveryTest from './AbilityContext/AbilityContextErrorRecovery.test';
import abilityContextLifecycleTest from './AbilityContext/AbilityContextLifecycle.test';
import abilityContextStateManagementTest from './AbilityContext/AbilityContextStateManagement.test';
import abilityContextStressTest from './AbilityContext/AbilityContextStress.test';
import serviceExtContextOperationsTest from './ServiceExtContext/ServiceExtContextOperations.test';
import serviceExtContextLifecycleTest from './ServiceExtContext/ServiceExtContextLifecycle.test';

import bookModelVersionTest from './DataShare/BookModelVersion.test';
import dataShareSessionAuthTest from './DataShare/DataShareSessionAuth.test';
import dataSourceValidationTest from './DataShare/DataSourceValidation.test';
import dataShareEventValidationTest from './DataShare/DataShareEventValidation.test';
import dataShareInterruptionRecoveryTest from './DataShare/DataShareInterruptionRecovery.test';
import dataChangeNotificationTest from './DataShare/DataChangeNotification.test';
import dataShareOfflineNetworkTest from './DataShare/DataShareOfflineNetwork.test';
import dataShareSessionValidationTest from './DataShare/DataShareSessionValidation.test';

import bundleBoundaryErrorTestingTest from './Bundle/BundleBoundaryErrorTesting.test';
import bundleConfigurationValidationTest from './Bundle/BundleConfigurationValidation.test';
import bundleInputValidationTest from './Bundle/BundleInputValidation.test';
import bundleResourceLoaderValidationTest from './Bundle/BundleResourceLoaderValidation.test';
import accessCtrlStateManagerTest from './AbilityAccessCtrl/AccessCtrlStateManager.test';
import abilityAccessCtrlVerificationTest from './AbilityAccessCtrl/AbilityAccessCtrlVerification.test';

import windowAnimationValidationTest from './Validation/WindowAnimationValidation.test';
import commonEventValidationTest from './Validation/CommonEventValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import dataSharePointerUtilValidationTest from './Validation/DataSharePointerUtilValidation.test';

import windowInteractionTest from './Interaction/WindowInteraction.test';
import windowButtonInteractionTest from './Interaction/WindowButtonInteraction.test';
import windowContentScalingTest from './Interaction/WindowContentScaling.test';
import windowDataBindingTest from './Interaction/WindowDataBinding.test';
import windowEventHandlingTest from './Interaction/WindowEventHandling.test';
import windowEventPropagationTest from './Interaction/WindowEventPropagation.test';
import windowFocusNavigationTest from './Interaction/WindowFocusNavigation.test';
import windowVisualEffectsTest from './Interaction/WindowVisualEffects.test';
import windowThemeVariationTest from './Interaction/WindowThemeVariation.test';
import windowFocusRingBehaviorTest from './Interaction/WindowFocusRingBehavior.test';
import windowGestureRecognitionTest from './Interaction/WindowGestureRecognition.test';
import windowTouchInteractionTest from './Interaction/WindowTouchInteraction.test';
import windowUIComponentRenderingTest from './Interaction/WindowUIComponentRendering.test';

import formExtContextInteractionTest from './FormExtContext/FormExtContextInteraction.test';
import formExtContextLifecycleTest from './FormExtContext/FormExtContextLifecycle.test';

import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import abilityContextLifecycleDeepTest from './LifecycleState/AbilityContextLifecycleDeep.test';
import stateManagementDeepTest from './LifecycleState/StateManagementDeep.test';
import errorRecoveryDeepTest from './LifecycleState/ErrorRecoveryDeep.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';

import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import resourceConsumptionTest from './PerformanceStability/ResourceConsumption.test';
import abilityPerformanceTest from './PerformanceStability/AbilityPerformance.test';

import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import dataShareCompatibilityTest from './Integration/DataShareCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';

import dataShareSecurityTest from './Security/DataShareSecurity.test';
import securityAssistiveTest from './Security/SecurityAssistive.test';
import securityValidationTest from './Security/SecurityValidation.test';

export default function testsuite(): void {
  abilityRequestModelTest();
  abilityRequestConfigurationTest();
  abilityContextModelDeepTest();
  abilityOperationCatalogTest();
  abilityOperationFlowTest();
  abilityOperationsTest();
  abilityOperationWorkflowTest();
  abilityContextUITest();
  abilityContextInteractionTest();
  abilityContextConcurrencyTest();
  abilityContextConsistencyTest();
  abilityContextEndToEndTest();
  abilityContextErrorRecoveryTest();
  abilityContextLifecycleTest();
  abilityContextStateManagementTest();
  abilityContextStressTest();
  serviceExtContextOperationsTest();
  serviceExtContextLifecycleTest();

  bookModelVersionTest();
  dataShareSessionAuthTest();
  dataSourceValidationTest();
  dataShareEventValidationTest();
  dataShareInterruptionRecoveryTest();
  dataChangeNotificationTest();
  dataShareOfflineNetworkTest();
  dataShareSessionValidationTest();

  bundleBoundaryErrorTestingTest();
  bundleConfigurationValidationTest();
  bundleInputValidationTest();
  bundleResourceLoaderValidationTest();
  accessCtrlStateManagerTest();
  abilityAccessCtrlVerificationTest();

  windowAnimationValidationTest();
  commonEventValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  dataSharePointerUtilValidationTest();

  windowInteractionTest();
  windowButtonInteractionTest();
  windowContentScalingTest();
  windowDataBindingTest();
  windowEventHandlingTest();
  windowEventPropagationTest();
  windowFocusNavigationTest();
  windowVisualEffectsTest();
  windowThemeVariationTest();
  windowFocusRingBehaviorTest();
  windowGestureRecognitionTest();
  windowTouchInteractionTest();
  windowUIComponentRenderingTest();

  formExtContextInteractionTest();
  formExtContextLifecycleTest();

  configurationChangesTest();
  extensionLifecycleTest();
  abilityContextLifecycleDeepTest();
  stateManagementDeepTest();
  errorRecoveryDeepTest();
  exceptionHandlingTest();
  resourceManagementTest();
  sessionManagementTest();
  statePersistenceTest();
  stateRecoveryTest();

  animationPerformanceTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  performanceStressTest();
  resourceConsumptionTest();
  abilityPerformanceTest();

  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  dataShareCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();

  dataShareSecurityTest();
  securityAssistiveTest();
  securityValidationTest();
}
