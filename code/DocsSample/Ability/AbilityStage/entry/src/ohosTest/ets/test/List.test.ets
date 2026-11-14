/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import abilityLaunchCompatibilityTest from './Integration/AbilityLaunchCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import pageLayoutPositioningTest from './Interaction/PageLayoutPositioning.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uiComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import pageLifecycleTest from './LifecycleState/PageLifecycle.test';
import abilityStageStateManagementTest from './LifecycleState/AbilityStageStateManagement.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import launchPerformanceTest from './PerformanceStability/LaunchPerformance.test';
import abilityPerformanceTest from './PerformanceStability/AbilityPerformance.test';
import abilityLifecycleTest from './AbilityCore/AbilityLifecycle.test';
import abilityStateManagementTest from './AbilityCore/AbilityStateManagement.test';
import abilityConcurrencyTest from './AbilityCore/AbilityConcurrency.test';
import abilityConsistencyTest from './AbilityCore/AbilityConsistency.test';
import abilityEndToEndTest from './AbilityCore/AbilityEndToEnd.test';
import abilityErrorRecoveryTest from './AbilityCore/AbilityErrorRecovery.test';
import abilityStressTest from './AbilityCore/AbilityStress.test';
import abilityUITest from './AbilityCore/AbilityUI.test';
import inputInteractionTest from './AbilityCore/InputInteraction.test';
import abilityStageModelTest from './AbilityCore/AbilityStageModel.test';
import environmentCallbackModelTest from './AbilityCore/EnvironmentCallbackModel.test';
import abilityStageModelDeepTest from './AbilityCore/AbilityStageModelDeep.test';
import lifecycleCallbackCatalogTest from './AbilityCore/LifecycleCallbackCatalog.test';
import lifecycleFlowTest from './AbilityCore/LifecycleFlow.test';
import lifecycleWorkflowTest from './AbilityCore/LifecycleWorkflow.test';
import lifecycleOperationsTest from './AbilityCore/LifecycleOperations.test';
import appVersionTest from './AbilityValidation/AppVersion.test';
import wantParameterValidationTest from './AbilityValidation/WantParameterValidation.test';
import moduleConfigValidationTest from './AbilityValidation/ModuleConfigValidation.test';
import environmentEventValidationTest from './AbilityValidation/EnvironmentEventValidation.test';
import abilityInterruptionRecoveryTest from './AbilityValidation/AbilityInterruptionRecovery.test';
import abilityCallbackNotificationTest from './AbilityValidation/AbilityCallbackNotification.test';
import offlineResilienceTest from './AbilityValidation/OfflineResilience.test';
import launchSessionValidationTest from './AbilityValidation/LaunchSessionValidation.test';
import abilityStageSecurityTest from './Security/AbilityStageSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import renderPipelineValidationTest from './Validation/RenderPipelineValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import environmentEventUtilValidationTest from './Validation/EnvironmentEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import abilityStageStateManagerValidationTest from './Validation/AbilityStageStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeUtilValidationTest from './Validation/KeyCodeUtilValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

export default function testsuite(): void {
  abilityTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  abilityLaunchCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  pageLayoutPositioningTest();
  themeVariationTest();
  touchInteractionTest();
  uiComponentRenderingTest();
  visualEffectsTest();
  eventHandlingTest();
  eventPropagationTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  gestureRecognitionTest();
  configurationChangesTest();
  pageLifecycleTest();
  abilityStageStateManagementTest();
  errorRecoveryTest();
  exceptionHandlingTest();
  extensionLifecycleTest();
  resourceManagementTest();
  sessionManagementTest();
  statePersistenceTest();
  stateRecoveryTest();
  animationPerformanceTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  performanceStressTest();
  launchPerformanceTest();
  abilityPerformanceTest();
  abilityLifecycleTest();
  abilityStateManagementTest();
  abilityConcurrencyTest();
  abilityConsistencyTest();
  abilityEndToEndTest();
  abilityErrorRecoveryTest();
  abilityStressTest();
  abilityUITest();
  inputInteractionTest();
  abilityStageModelTest();
  environmentCallbackModelTest();
  abilityStageModelDeepTest();
  lifecycleCallbackCatalogTest();
  lifecycleFlowTest();
  lifecycleWorkflowTest();
  lifecycleOperationsTest();
  appVersionTest();
  wantParameterValidationTest();
  moduleConfigValidationTest();
  environmentEventValidationTest();
  abilityInterruptionRecoveryTest();
  abilityCallbackNotificationTest();
  offlineResilienceTest();
  launchSessionValidationTest();
  abilityStageSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  renderPipelineValidationTest();
  boundaryErrorTestingTest();
  environmentEventUtilValidationTest();
  configurationManagerValidationTest();
  abilityStageStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeUtilValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
}
