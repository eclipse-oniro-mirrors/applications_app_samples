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
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import sessionStateManagementTest from './LifecycleState/SessionStateManagement.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import extensionPageLifecycleTest from './LifecycleState/ExtensionPageLifecycle.test';
import inclusiveNavigationTest from './Interaction/InclusiveNavigation.test';
import embeddedComponentInteractionTest from './Interaction/EmbeddedComponentInteraction.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import dataBindingTest from './Interaction/DataBinding.test';
import extensionPositioningTest from './Interaction/ExtensionPositioning.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import uiComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import extensionCompatibilityTest from './Integration/ExtensionCompatibility.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import resourceConsumptionTest from './PerformanceStability/ResourceConsumption.test';
import sessionPerformanceTest from './PerformanceStability/SessionPerformance.test';
import embeddedUIDialogConcurrencyTest from './EmbeddedUI/EmbeddedUIDialogConcurrency.test';
import embeddedUIDialogConsistencyTest from './EmbeddedUI/EmbeddedUIDialogConsistency.test';
import embeddedUIDialogEndToEndTest from './EmbeddedUI/EmbeddedUIDialogEndToEnd.test';
import embeddedUIDialogErrorRecoveryTest from './EmbeddedUI/EmbeddedUIDialogErrorRecovery.test';
import embeddedUIDialogLifecycleTest from './EmbeddedUI/EmbeddedUIDialogLifecycle.test';
import embeddedUIDialogStateManagementTest from './EmbeddedUI/EmbeddedUIDialogStateManagement.test';
import embeddedUIDialogStressTest from './EmbeddedUI/EmbeddedUIDialogStress.test';
import embeddedUIDialogUITest from './EmbeddedUI/EmbeddedUIDialogUI.test';
import sessionInputInteractionTest from './EmbeddedUI/SessionInputInteraction.test';
import extensionInfoModelTest from './EmbeddedUI/ExtensionInfoModel.test';
import extensionMenuConfigurationTest from './EmbeddedUI/ExtensionMenuConfiguration.test';
import extensionModelDeepTest from './EmbeddedUI/ExtensionModelDeep.test';
import extensionCatalogTest from './EmbeddedUI/ExtensionCatalog.test';
import extensionOperationFlowTest from './EmbeddedUI/ExtensionOperationFlow.test';
import extensionOperationsTest from './EmbeddedUI/ExtensionOperations.test';
import extensionOperationWorkflowTest from './EmbeddedUI/ExtensionOperationWorkflow.test';
import extensionAppVersionTest from './SessionValidation/ExtensionAppVersion.test';
import sessionAuthTest from './SessionValidation/SessionAuth.test';
import sessionDataSourceValidationTest from './SessionValidation/SessionDataSourceValidation.test';
import commonEventToolValidationTest from './SessionValidation/CommonEventToolValidation.test';
import sessionInterruptionRecoveryTest from './SessionValidation/SessionInterruptionRecovery.test';
import sessionNotificationTest from './SessionValidation/SessionNotification.test';
import sessionOfflineNetworkTest from './SessionValidation/SessionOfflineNetwork.test';
import sessionValidationTest from './SessionValidation/SessionValidation.test';
import extensionSecurityTest from './Security/ExtensionSecurity.test';
import securityInclusiveTest from './Security/SecurityInclusive.test';
import securityValidationTest from './Security/SecurityValidation.test';
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
  configurationChangesTest();
  extensionLifecycleTest();
  sessionManagementTest();
  sessionStateManagementTest();
  errorRecoveryTest();
  exceptionHandlingTest();
  resourceManagementTest();
  statePersistenceTest();
  stateRecoveryTest();
  extensionPageLifecycleTest();
  inclusiveNavigationTest();
  embeddedComponentInteractionTest();
  contentScalingTest();
  dataBindingTest();
  extensionPositioningTest();
  eventHandlingTest();
  eventPropagationTest();
  focusNavigationTest();
  focusRingBehaviorTest();
  gestureRecognitionTest();
  themeVariationTest();
  touchInteractionTest();
  uiComponentRenderingTest();
  visualEffectsTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  extensionCompatibilityTest();
  systemIntegrationTest();
  userScenariosTest();
  animationPerformanceTest();
  concurrencyControlTest();
  longTermStabilityTest();
  memoryLeakDetectionTest();
  performanceStressTest();
  resourceConsumptionTest();
  sessionPerformanceTest();
  embeddedUIDialogConcurrencyTest();
  embeddedUIDialogConsistencyTest();
  embeddedUIDialogEndToEndTest();
  embeddedUIDialogErrorRecoveryTest();
  embeddedUIDialogLifecycleTest();
  embeddedUIDialogStateManagementTest();
  embeddedUIDialogStressTest();
  embeddedUIDialogUITest();
  sessionInputInteractionTest();
  extensionInfoModelTest();
  extensionMenuConfigurationTest();
  extensionModelDeepTest();
  extensionCatalogTest();
  extensionOperationFlowTest();
  extensionOperationsTest();
  extensionOperationWorkflowTest();
  extensionAppVersionTest();
  sessionAuthTest();
  sessionDataSourceValidationTest();
  commonEventToolValidationTest();
  sessionInterruptionRecoveryTest();
  sessionNotificationTest();
  sessionOfflineNetworkTest();
  sessionValidationTest();
  extensionSecurityTest();
  securityInclusiveTest();
  securityValidationTest();
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
