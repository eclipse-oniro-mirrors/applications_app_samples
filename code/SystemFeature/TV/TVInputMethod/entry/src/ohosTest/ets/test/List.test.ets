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
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import imeCompatibilityTest from './Integration/ImeCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import dialogPositioningTest from './Interaction/DialogPositioning.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uIComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import dialogLifecycleTest from './LifecycleState/DialogLifecycle.test';
import dialogStateManagementTest from './LifecycleState/DialogStateManagement.test';
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
import imeConsumptionTest from './PerformanceStability/ImeConsumption.test';
import imePerformanceTest from './PerformanceStability/ImePerformance.test';
import keyboardConcurrencyTest from './Keyboard/KeyboardConcurrency.test';
import keyboardConsistencyTest from './Keyboard/KeyboardConsistency.test';
import keyboardEndToEndTest from './Keyboard/KeyboardEndToEnd.test';
import keyboardErrorRecoveryTest from './Keyboard/KeyboardErrorRecovery.test';
import keyboardLifecycleTest from './Keyboard/KeyboardLifecycle.test';
import keyboardStateManagementTest from './Keyboard/KeyboardStateManagement.test';
import keyboardStressTest from './Keyboard/KeyboardStress.test';
import keyboardUITest from './Keyboard/KeyboardUI.test';
import keyboardInputInteractionTest from './Keyboard/KeyboardInputInteraction.test';
import keyInfoModelTest from './Keyboard/KeyInfoModel.test';
import keyboardMenuConfigurationTest from './Keyboard/KeyboardMenuConfiguration.test';
import keyboardModelDeepTest from './Keyboard/KeyboardModelDeep.test';
import keyOperationCatalogTest from './Keyboard/KeyOperationCatalog.test';
import keyOperationFlowTest from './Keyboard/KeyOperationFlow.test';
import keyOperationWorkflowTest from './Keyboard/KeyOperationWorkflow.test';
import keyOperationsTest from './Keyboard/KeyOperations.test';
import imeAppVersionTest from './KeyboardValidation/ImeAppVersion.test';
import imeAuthSessionTest from './KeyboardValidation/ImeAuthSession.test';
import imeDataSourceValidationTest from './KeyboardValidation/ImeDataSourceValidation.test';
import keyEventToolValidationTest from './KeyboardValidation/KeyEventToolValidation.test';
import imeInterruptionRecoveryTest from './KeyboardValidation/ImeInterruptionRecovery.test';
import imeNotificationTest from './KeyboardValidation/ImeNotification.test';
import imeOfflineNetworkTest from './KeyboardValidation/ImeOfflineNetwork.test';
import inputSessionValidationTest from './KeyboardValidation/InputSessionValidation.test';
import imeSecurityTest from './Security/ImeSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import commonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import dialogStateManagerValidationTest from './Validation/DialogStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
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
  imeCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  dialogPositioningTest();
  eventHandlingTest();
  eventPropagationTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  gestureRecognitionTest();
  themeVariationTest();
  touchInteractionTest();
  uIComponentRenderingTest();
  visualEffectsTest();
  configurationChangesTest();
  dialogLifecycleTest();
  dialogStateManagementTest();
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
  imeConsumptionTest();
  imePerformanceTest();
  keyboardConcurrencyTest();
  keyboardConsistencyTest();
  keyboardEndToEndTest();
  keyboardErrorRecoveryTest();
  keyboardLifecycleTest();
  keyboardStateManagementTest();
  keyboardStressTest();
  keyboardUITest();
  keyboardInputInteractionTest();
  keyInfoModelTest();
  keyboardMenuConfigurationTest();
  keyboardModelDeepTest();
  keyOperationCatalogTest();
  keyOperationFlowTest();
  keyOperationWorkflowTest();
  keyOperationsTest();
  imeAppVersionTest();
  imeAuthSessionTest();
  imeDataSourceValidationTest();
  keyEventToolValidationTest();
  imeInterruptionRecoveryTest();
  imeNotificationTest();
  imeOfflineNetworkTest();
  inputSessionValidationTest();
  imeSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  animationControllerValidationTest();
  boundaryErrorTestingTest();
  commonEventUtilValidationTest();
  configurationManagerValidationTest();
  dialogStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
}
