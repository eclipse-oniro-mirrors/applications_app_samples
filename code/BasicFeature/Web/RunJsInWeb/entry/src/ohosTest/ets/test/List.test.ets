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

// Central registration of every RunJsInWeb test suite.
// Hypium executes the function below once TestAbility starts, so every suite
// listed here is part of a single `aa test` run. Each behaviour group is owned
// by exactly one suite to avoid duplicate assertions.

// Ability smoke suite
// Registers every RunJsInWeb suite. Each suite mirrors one reference file.

import webGameUITest from './WebGame/WebGameUI.test';
import gameOperationsTest from './WebGame/GameOperations.test';
import webGameItemInfoModelTest from './WebGame/WebGameItemInfoModel.test';
import gameModelDeepTest from './WebGame/GameModelDeep.test';
import gameScriptCatalogTest from './WebGame/GameScriptCatalog.test';
import webGameConfigurationTest from './WebGame/WebGameConfiguration.test';
import gameControlFlowTest from './WebGame/GameControlFlow.test';
import gameOperationWorkflowTest from './WebGame/GameOperationWorkflow.test';
import webGameStateManagementTest from './WebGame/WebGameStateManagement.test';
import webGameConcurrencyTest from './WebGame/WebGameConcurrency.test';
import webGameStressTest from './WebGame/WebGameStress.test';
import webGameConsistencyTest from './WebGame/WebGameConsistency.test';
import webGameLifecycleTest from './WebGame/WebGameLifecycle.test';
import webGameErrorRecoveryTest from './WebGame/WebGameErrorRecovery.test';
import webGameEndToEndTest from './WebGame/WebGameEndToEnd.test';
import gameInputInteractionTest from './WebGame/WebGameInputInteraction.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import webViewPositioningTest from './Interaction/WebViewPositioning.test';
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
import webViewLifecycleTest from './LifecycleState/WebViewLifecycle.test';
import webViewStateManagementTest from './LifecycleState/WebViewStateManagement.test';
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
import renderingPowerConsumptionTest from './PerformanceStability/RenderingPowerConsumption.test';
import webPerformanceTest from './PerformanceStability/WebPerformance.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import platformCompatibilityTest from './Integration/PlatformCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import webSecurityTest from './Security/WebSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import webEventUtilValidationTest from './Validation/WebEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import webStateManagerValidationTest from './Validation/WebStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
import webAppVersionTest from './WebValidation/WebAppVersion.test';
import webAuthSessionTest from './WebValidation/WebAuthSession.test';
import webDataSourceValidationTest from './WebValidation/WebDataSourceValidation.test';
import webEventToolValidationTest from './WebValidation/WebEventToolValidation.test';
import webInterruptionRecoveryTest from './WebValidation/WebInterruptionRecovery.test';
import webNotificationTest from './WebValidation/WebNotification.test';
import webOfflineNetworkTest from './WebValidation/WebOfflineNetwork.test';
import webSessionValidationTest from './WebValidation/WebSessionValidation.test';

export default function testsuite(): void {
  webGameUITest();
  gameOperationsTest();
  webGameItemInfoModelTest();
  gameModelDeepTest();
  gameScriptCatalogTest();
  webGameConfigurationTest();
  gameControlFlowTest();
  gameOperationWorkflowTest();
  webGameStateManagementTest();
  webGameConcurrencyTest();
  webGameStressTest();
  webGameConsistencyTest();
  webGameLifecycleTest();
  webGameErrorRecoveryTest();
  webGameEndToEndTest();
  gameInputInteractionTest();
  accessibilityNavigationTest();
  buttonInteractionTest();
  contentScalingTest();
  dataBindingTest();
  webViewPositioningTest();
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
  webViewLifecycleTest();
  webViewStateManagementTest();
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
  renderingPowerConsumptionTest();
  webPerformanceTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  platformCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
  webSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  animationControllerValidationTest();
  boundaryErrorTestingTest();
  webEventUtilValidationTest();
  configurationManagerValidationTest();
  webStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
  webAppVersionTest();
  webAuthSessionTest();
  webDataSourceValidationTest();
  webEventToolValidationTest();
  webInterruptionRecoveryTest();
  webNotificationTest();
  webOfflineNetworkTest();
  webSessionValidationTest();
}
