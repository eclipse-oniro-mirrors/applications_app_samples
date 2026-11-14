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

import assessmentAbilityTest from './Ability.test';
import assessmentUITest from './Assessment/AssessmentUI.test';
import assessmentOperationsTest from './Assessment/AssessmentOperations.test';
import assessmentConfigModelTest from './Assessment/AssessmentConfigModel.test';
import assessmentApiCatalogTest from './Assessment/AssessmentApiCatalog.test';
import assessmentConfigMatrixTest from './Assessment/AssessmentConfigMatrix.test';
import assessmentStateManagementTest from './Assessment/AssessmentStateManagement.test';
import assessmentWorkflowTest from './Assessment/AssessmentWorkflow.test';
import assessmentConcurrencyTest from './Assessment/AssessmentConcurrency.test';
import assessmentConsistencyTest from './Assessment/AssessmentConsistency.test';
import assessmentSessionLifecycleTest from './Assessment/AssessmentSessionLifecycle.test';
import assessmentErrorRecoveryTest from './Assessment/AssessmentErrorRecovery.test';
import assessmentEndToEndTest from './Assessment/AssessmentEndToEnd.test';
import whitelistInputInteractionTest from './Assessment/WhitelistInputInteraction.test';
import assessmentModelDeepTest from './Assessment/AssessmentModelDeep.test';
import assessmentOperationFlowTest from './Assessment/AssessmentOperationFlow.test';
import apiVersionValidationTest from './AssessmentValidation/ApiVersionValidation.test';
import permissionSessionValidationTest from './AssessmentValidation/PermissionSessionValidation.test';
import configDataSourceValidationTest from './AssessmentValidation/ConfigDataSourceValidation.test';
import callbackEventValidationTest from './AssessmentValidation/CallbackEventValidation.test';
import interruptionRecoveryTest from './AssessmentValidation/InterruptionRecovery.test';
import toastNotificationTest from './AssessmentValidation/ToastNotification.test';
import offlineServiceValidationTest from './AssessmentValidation/OfflineServiceValidation.test';
import sessionStateValidationTest from './AssessmentValidation/SessionStateValidation.test';
import countdownControllerValidationTest from './Validation/CountdownControllerValidation.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import appStorageEventValidationTest from './Validation/AppStorageEventValidation.test';
import assessmentConfigManagerValidationTest from './Validation/AssessmentConfigManagerValidation.test';
import sessionStateManagerValidationTest from './Validation/SessionStateManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import bundleNameInputValidationTest from './Validation/BundleNameInputValidation.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
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
import uiComponentRenderingTest from './Interaction/UIComponentRendering.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import assessmentPageLifecycleTest from './LifecycleState/AssessmentPageLifecycle.test';
import sessionStateManagementTest from './LifecycleState/SessionStateManagement.test';
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
import powerConsumptionTest from './PerformanceStability/PowerConsumption.test';
import powerPerformanceTest from './PerformanceStability/PowerPerformance.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import userScenariosTest from './Integration/UserScenarios.test';
import assessmentCompatibilityTest from './Integration/AssessmentCompatibility.test';
import assessmentSecurityTest from './Security/AssessmentSecurity.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import securityValidationTest from './Security/SecurityValidation.test';

export default function testsuite(): void {
  assessmentAbilityTest();
  assessmentUITest();
  assessmentOperationsTest();
  assessmentConfigModelTest();
  assessmentApiCatalogTest();
  assessmentConfigMatrixTest();
  assessmentStateManagementTest();
  assessmentWorkflowTest();
  assessmentConcurrencyTest();
  assessmentConsistencyTest();
  assessmentSessionLifecycleTest();
  assessmentErrorRecoveryTest();
  assessmentEndToEndTest();
  whitelistInputInteractionTest();
  assessmentModelDeepTest();
  assessmentOperationFlowTest();
  apiVersionValidationTest();
  permissionSessionValidationTest();
  configDataSourceValidationTest();
  callbackEventValidationTest();
  interruptionRecoveryTest();
  toastNotificationTest();
  offlineServiceValidationTest();
  sessionStateValidationTest();
  countdownControllerValidationTest();
  boundaryErrorTestingTest();
  appStorageEventValidationTest();
  assessmentConfigManagerValidationTest();
  sessionStateManagerValidationTest();
  focusManagerValidationTest();
  bundleNameInputValidationTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  resourceLoaderValidationTest();
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
  uiComponentRenderingTest();
  visualEffectsTest();
  configurationChangesTest();
  assessmentPageLifecycleTest();
  sessionStateManagementTest();
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
  powerConsumptionTest();
  powerPerformanceTest();
  advancedScenariosTest();
  comprehensiveRegressionTest();
  deviceCompatibilityTest();
  integrationTestingTest();
  localizationTestingTest();
  networkConnectivityTest();
  systemIntegrationTest();
  userScenariosTest();
  assessmentCompatibilityTest();
  assessmentSecurityTest();
  securityAccessibilityTest();
  securityValidationTest();
}
