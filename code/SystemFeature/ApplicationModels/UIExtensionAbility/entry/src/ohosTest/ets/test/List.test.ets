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


// Aggregates every adapted UIExtensionAbility test suite.
// Each suite lives in its own module and is imported here for Hypium discovery.

import abilityTest from './Ability.test';
import uIExtensionConcurrencyTest from './UIExtension/UIExtensionConcurrency.test';
import uIExtensionConsistencyTest from './UIExtension/UIExtensionConsistency.test';
import uIExtensionEndToEndTest from './UIExtension/UIExtensionEndToEnd.test';
import uIExtensionErrorRecoveryTest from './UIExtension/UIExtensionErrorRecovery.test';
import uIExtensionLifecycleTest from './UIExtension/UIExtensionLifecycle.test';
import uIExtensionStateManagementTest from './UIExtension/UIExtensionStateManagement.test';
import uIExtensionStressTest from './UIExtension/UIExtensionStress.test';
import uIExtensionUITest from './UIExtension/UIExtensionUI.test';
import sessionInputInteractionTest from './UIExtension/SessionInputInteraction.test';
import extensionItemInfoModelTest from './UIExtension/ExtensionItemInfoModel.test';
import extensionMenuConfigurationTest from './UIExtension/ExtensionMenuConfiguration.test';
import extensionModelDeepTest from './UIExtension/ExtensionModelDeep.test';
import extensionOperationCatalogTest from './UIExtension/ExtensionOperationCatalog.test';
import extensionOperationFlowTest from './UIExtension/ExtensionOperationFlow.test';
import extensionOperationsTest from './UIExtension/ExtensionOperations.test';
import extensionOperationWorkflowTest from './UIExtension/ExtensionOperationWorkflow.test';
import extensionAppVersionTest from './ExtensionValidation/ExtensionAppVersion.test';
import extensionAuthSessionTest from './ExtensionValidation/ExtensionAuthSession.test';
import extensionDataSourceValidationTest from './ExtensionValidation/ExtensionDataSourceValidation.test';
import extensionEventToolValidationTest from './ExtensionValidation/ExtensionEventToolValidation.test';
import extensionInterruptionRecoveryTest from './ExtensionValidation/ExtensionInterruptionRecovery.test';
import extensionNotificationTest from './ExtensionValidation/ExtensionNotification.test';
import extensionOfflineNetworkTest from './ExtensionValidation/ExtensionOfflineNetwork.test';
import extensionSessionValidationTest from './ExtensionValidation/ExtensionSessionValidation.test';
import extensionSecurityTest from './Security/ExtensionSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';
import extensionConsumptionTest from './PerformanceStability/ExtensionConsumption.test';
import extensionPerformanceTest from './PerformanceStability/ExtensionPerformance.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import compatibilityTest from './Integration/Compatibility.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
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
import configurationChangesTest from './Lifecycle/ConfigurationChanges.test';
import sessionLifecycleTest from './Lifecycle/SessionLifecycle.test';
import sessionStateManagementTest from './Lifecycle/SessionStateManagement.test';
import errorRecoveryTest from './Lifecycle/ErrorRecovery.test';
import exceptionHandlingTest from './Lifecycle/ExceptionHandling.test';
import extensionLifecycleTest from './Lifecycle/ExtensionLifecycle.test';
import resourceManagementTest from './Lifecycle/ResourceManagement.test';
import sessionManagementTest from './Lifecycle/SessionManagement.test';
import statePersistenceTest from './Lifecycle/StatePersistence.test';
import stateRecoveryTest from './Lifecycle/StateRecovery.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import commonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import sessionStateManagerValidationTest from './Validation/SessionStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import inputValidationTest from './Validation/InputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';

export default function testsuite(): void {
  abilityTest();
  uIExtensionConcurrencyTest();
  uIExtensionConsistencyTest();
  uIExtensionEndToEndTest();
  uIExtensionErrorRecoveryTest();
  uIExtensionLifecycleTest();
  uIExtensionStateManagementTest();
  uIExtensionStressTest();
  uIExtensionUITest();
  sessionInputInteractionTest();
  extensionItemInfoModelTest();
  extensionMenuConfigurationTest();
  extensionModelDeepTest();
  extensionOperationCatalogTest();
  extensionOperationFlowTest();
  extensionOperationsTest();
  extensionOperationWorkflowTest();
  extensionAppVersionTest();
  extensionAuthSessionTest();
  extensionDataSourceValidationTest();
  extensionEventToolValidationTest();
  extensionInterruptionRecoveryTest();
  extensionNotificationTest();
  extensionOfflineNetworkTest();
  extensionSessionValidationTest();
  extensionSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
  extensionConsumptionTest();
  extensionPerformanceTest();
  animationPerformanceTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  performanceStressTest();
  compatibilityTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
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
  sessionLifecycleTest();
  sessionStateManagementTest();
  errorRecoveryTest();
  exceptionHandlingTest();
  extensionLifecycleTest();
  resourceManagementTest();
  sessionManagementTest();
  statePersistenceTest();
  stateRecoveryTest();
  animationControllerValidationTest();
  boundaryErrorTestingTest();
  commonEventUtilValidationTest();
  configurationManagerValidationTest();
  sessionStateManagerValidationTest();
  focusManagerValidationTest();
  inputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
}
