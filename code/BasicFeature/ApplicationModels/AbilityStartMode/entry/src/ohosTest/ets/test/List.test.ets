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

// Start mode suites: launch modes, food list and food detail behaviour.
import startModeUITest from './StartMode/StartModeUI.test';
import startModeStressTest from './StartMode/StartModeStress.test';
import startOperationsTest from './StartMode/StartOperations.test';
import foodItemModelTest from './StartMode/FoodItemModel.test';
import foodModelDeepTest from './StartMode/FoodModelDeep.test';
import startOperationFlowTest from './StartMode/StartOperationFlow.test';
import startModeLifecycleTest from './StartMode/StartModeLifecycle.test';
import startModeConsistencyTest from './StartMode/StartModeConsistency.test';
import startModeConcurrencyTest from './StartMode/StartModeConcurrency.test';
import startModeErrorRecoveryTest from './StartMode/StartModeErrorRecovery.test';
import startModeEndToEndTest from './StartMode/StartModeEndToEnd.test';
import startOperationCatalogTest from './StartMode/StartOperationCatalog.test';
import startOperationWorkflowTest from './StartMode/StartOperationWorkflow.test';
import startModeInputInteractionTest from './StartMode/StartModeInputInteraction.test';
import startModeMenuConfigurationTest from './StartMode/StartModeMenuConfiguration.test';
import startModeStateManagementTest from './StartMode/StartModeStateManagement.test';

// Validation suites for helpers, logging, key codes and resources.
import inputValidationTest from './Validation/InputValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import eventUtilValidationTest from './Validation/EventUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import pageStateManagerValidationTest from './Validation/PageStateManagerValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';

// Interaction suites for the home page and the food detail page.
import eventHandlingTest from './Interaction/EventHandling.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import dataBindingTest from './Interaction/DataBinding.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import pageLayoutPositioningTest from './Interaction/PageLayoutPositioning.test';
import uiComponentRenderingTest from './Interaction/UIComponentRendering.test';
import BarrierFreeNavigationTest from './Interaction/BarrierFreeNavigation.test';

// Lifecycle suites of abilities, pages and sessions.
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import pageLifecycleTest from './LifecycleState/PageLifecycle.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import abilityStageLifecycleTest from './LifecycleState/AbilityStageLifecycle.test';
import pageStateManagementTest from './LifecycleState/PageStateManagement.test';

// Performance and stability suites of the sample.
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import runtimePerformanceTest from './PerformanceStability/RuntimePerformance.test';
import resourceConsumptionTest from './PerformanceStability/ResourceConsumption.test';

// Integration suites that combine several modules of the sample.
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import userScenariosTest from './Integration/UserScenarios.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import modeCompatibilityTest from './Integration/ModeCompatibility.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';

// Start mode validation suites derived from the power validation suites.
import appVersionValidationTest from './StartModeValidation/AppVersionValidation.test';
import authSessionValidationTest from './StartModeValidation/AuthSessionValidation.test';
import dataSourceValidationTest from './StartModeValidation/DataSourceValidation.test';
import eventToolValidationTest from './StartModeValidation/EventToolValidation.test';
import sessionValidationTest from './StartModeValidation/SessionValidation.test';
import notificationValidationTest from './StartModeValidation/NotificationValidation.test';
import interruptionRecoveryTest from './StartModeValidation/InterruptionRecovery.test';
import offlineNetworkValidationTest from './StartModeValidation/OfflineNetworkValidation.test';

// Security suites of the start mode sample.
import appSecurityTest from './Security/AppSecurity.test';
import securityValidationTest from './Security/SecurityValidation.test';
import securityBarrierFreeTest from './Security/SecurityBarrierFree.test';

export default function testsuite(): void {
  // Start mode suites first so that the home page is already rendered.
  startModeUITest();
  startOperationsTest();
  startModeLifecycleTest();
  startModeStateManagementTest();
  startModeConsistencyTest();
  startModeConcurrencyTest();
  startModeErrorRecoveryTest();
  startModeEndToEndTest();
  startOperationCatalogTest();
  startOperationFlowTest();
  startOperationWorkflowTest();
  startModeInputInteractionTest();
  startModeMenuConfigurationTest();
  startModeStressTest();
  foodItemModelTest();
  foodModelDeepTest();

  // Validation suites.
  inputValidationTest();
  loggerValidationTest();
  keyCodeValidationTest();
  boundaryErrorTestingTest();
  focusManagerValidationTest();
  pointerUtilValidationTest();
  eventUtilValidationTest();
  resourceLoaderValidationTest();
  configurationManagerValidationTest();
  pageStateManagerValidationTest();
  animationControllerValidationTest();

  // Interaction suites.
  eventHandlingTest();
  touchInteractionTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  buttonInteractionTest();
  dataBindingTest();
  visualEffectsTest();
  contentScalingTest();
  themeVariationTest();
  eventPropagationTest();
  gestureRecognitionTest();
  pageLayoutPositioningTest();
  uiComponentRenderingTest();
  BarrierFreeNavigationTest();

  // Lifecycle suites.
  errorRecoveryTest();
  pageLifecycleTest();
  stateRecoveryTest();
  statePersistenceTest();
  sessionManagementTest();
  exceptionHandlingTest();
  resourceManagementTest();
  configurationChangesTest();
  abilityStageLifecycleTest();
  pageStateManagementTest();

  // Performance and stability suites.
  performanceStressTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  animationPerformanceTest();
  runtimePerformanceTest();
  resourceConsumptionTest();

  // Integration suites.
  advancedScenariosTest();
  userScenariosTest();
  systemIntegrationTest();
  integrationTestingTest();
  modeCompatibilityTest();
  networkConnectivityTest();
  deviceCompatibilityTest();
  localizationTestingTest();
  comprehensiveRegressionTest();

  // Start mode validation suites.
  appVersionValidationTest();
  authSessionValidationTest();
  dataSourceValidationTest();
  eventToolValidationTest();
  sessionValidationTest();
  notificationValidationTest();
  interruptionRecoveryTest();
  offlineNetworkValidationTest();

  // Security suites.
  appSecurityTest();
  securityValidationTest();
  securityBarrierFreeTest();
}
