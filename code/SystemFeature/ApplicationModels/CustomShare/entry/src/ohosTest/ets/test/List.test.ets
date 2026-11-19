/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import shareCompatibilityTest from './Integration/ShareCompatibility.test';
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
import sharePowerConsumptionTest from './PerformanceStability/SharePowerConsumption.test';
import sharePerformanceTest from './PerformanceStability/SharePerformance.test';
import shareDialogConcurrencyTest from './ShareComponent/ShareDialogConcurrency.test';
import shareDialogConsistencyTest from './ShareComponent/ShareDialogConsistency.test';
import shareDialogEndToEndTest from './ShareComponent/ShareDialogEndToEnd.test';
import shareDialogErrorRecoveryTest from './ShareComponent/ShareDialogErrorRecovery.test';
import shareDialogLifecycleTest from './ShareComponent/ShareDialogLifecycle.test';
import shareDialogStateManagementTest from './ShareComponent/ShareDialogStateManagement.test';
import shareDialogStressTest from './ShareComponent/ShareDialogStress.test';
import shareDialogUITest from './ShareComponent/ShareDialogUI.test';
import shareInputInteractionTest from './ShareComponent/ShareInputInteraction.test';
import shareTemplateModelTest from './ShareComponent/ShareTemplateModel.test';
import shareMenuConfigurationTest from './ShareComponent/ShareMenuConfiguration.test';
import shareModelDeepTest from './ShareComponent/ShareModelDeep.test';
import shareOperationCatalogTest from './ShareComponent/ShareOperationCatalog.test';
import shareOperationFlowTest from './ShareComponent/ShareOperationFlow.test';
import shareOperationsTest from './ShareComponent/ShareOperations.test';
import shareOperationWorkflowTest from './ShareComponent/ShareOperationWorkflow.test';
import shareAppVersionTest from './ShareValidation/ShareAppVersion.test';
import shareAuthSessionTest from './ShareValidation/ShareAuthSession.test';
import shareDataSourceValidationTest from './ShareValidation/ShareDataSourceValidation.test';
import shareEventUtilValidationTest from './ShareValidation/ShareEventUtilValidation.test';
import shareInterruptionRecoveryTest from './ShareValidation/ShareInterruptionRecovery.test';
import shareNotificationTest from './ShareValidation/ShareNotification.test';
import shareOfflineNetworkTest from './ShareValidation/ShareOfflineNetwork.test';
import shareSessionValidationTest from './ShareValidation/ShareSessionValidation.test';
import shareSecurityTest from './Security/ShareSecurity.test';
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
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  shareCompatibilityTest();
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
  sharePowerConsumptionTest();
  sharePerformanceTest();
  shareDialogConcurrencyTest();
  shareDialogConsistencyTest();
  shareDialogEndToEndTest();
  shareDialogErrorRecoveryTest();
  shareDialogLifecycleTest();
  shareDialogStateManagementTest();
  shareDialogStressTest();
  shareDialogUITest();
  shareInputInteractionTest();
  shareTemplateModelTest();
  shareMenuConfigurationTest();
  shareModelDeepTest();
  shareOperationCatalogTest();
  shareOperationFlowTest();
  shareOperationsTest();
  shareOperationWorkflowTest();
  shareAppVersionTest();
  shareAuthSessionTest();
  shareDataSourceValidationTest();
  shareEventUtilValidationTest();
  shareInterruptionRecoveryTest();
  shareNotificationTest();
  shareOfflineNetworkTest();
  shareSessionValidationTest();
  shareSecurityTest();
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
