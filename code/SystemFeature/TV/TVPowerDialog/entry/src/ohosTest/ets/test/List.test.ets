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

import powerDialogUITest from './PowerDialog/PowerDialogUI.test';
import powerOperationsTest from './PowerDialog/PowerOperations.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import powerModelDeepTest from './PowerDialog/PowerModelDeep.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import commonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import dialogStateManagerValidationTest from './Validation/DialogStateManagerValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import dialogStateManagementTest from './LifecycleState/DialogStateManagement.test';
import powerOperationFlowTest from './PowerDialog/PowerOperationFlow.test';
import uiComponentRenderingTest from './Interaction/UIComponentRendering.test';
import sessionManagementTest from './LifecycleState/SessionManagement.test';
import errorRecoveryTest from './LifecycleState/ErrorRecovery.test';
import accessibilityNavigationTest from './Interaction/AccessibilityNavigation.test';
import visualEffectsTest from './Interaction/VisualEffects.test';
import dataBindingTest from './Interaction/DataBinding.test';
import concurrencyControlTest from './PerformanceStability/ConcurrencyControl.test';
import resourceManagementTest from './LifecycleState/ResourceManagement.test';
import configurationChangesTest from './LifecycleState/ConfigurationChanges.test';
import userScenariosTest from './Integration/UserScenarios.test';
import memoryLeakDetectionTest from './PerformanceStability/MemoryLeakDetection.test';
import longTermStabilityTest from './PerformanceStability/LongTermStability.test';
import systemIntegrationTest from './Integration/SystemIntegration.test';
import networkConnectivityTest from './Integration/NetworkConnectivity.test';
import deviceCompatibilityTest from './Integration/DeviceCompatibility.test';
import powerConsumptionTest from './PerformanceStability/PowerConsumption.test';
import securityValidationTest from './Security/SecurityValidation.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import inputValidationTest from './Validation/InputValidation.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import dialogPositioningTest from './Interaction/DialogPositioning.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import dialogLifecycleTest from './LifecycleState/DialogLifecycle.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import powerItemInfoModelTest from './PowerDialog/PowerItemInfoModel.test';
import powerOperationCatalogTest from './PowerDialog/PowerOperationCatalog.test';
import powerMenuConfigurationTest from './PowerDialog/PowerMenuConfiguration.test';
import powerDialogStateManagementTest from './PowerDialog/PowerDialogStateManagement.test';
import powerOperationWorkflowTest from './PowerDialog/PowerOperationWorkflow.test';
import powerDialogConcurrencyTest from './PowerDialog/PowerDialogConcurrency.test';
import powerDialogStressTest from './PowerDialog/PowerDialogStress.test';
import powerDialogConsistencyTest from './PowerDialog/PowerDialogConsistency.test';
import powerDialogLifecycleTest from './PowerDialog/PowerDialogLifecycle.test';
import powerDialogErrorRecoveryTest from './PowerDialog/PowerDialogErrorRecovery.test';
import powerDialogEndToEndTest from './PowerDialog/PowerDialogEndToEnd.test';
import powerEventToolValidationTest from './PowerValidation/PowerEventToolValidation.test';
import powerDataSourceValidationTest from './PowerValidation/PowerDataSourceValidation.test';
import powerSessionValidationTest from './PowerValidation/PowerSessionValidation.test';
import powerAppVersionTest from './PowerValidation/PowerAppVersion.test';
import powerAuthSessionTest from './PowerValidation/PowerAuthSession.test';
import powerNotificationTest from './PowerValidation/PowerNotification.test';
import powerInterruptionRecoveryTest from './PowerValidation/PowerInterruptionRecovery.test';
import powerOfflineNetworkTest from './PowerValidation/PowerOfflineNetwork.test';
import powerSecurityTest from './Security/PowerSecurity.test';
import powerPerformanceTest from './PerformanceStability/PowerPerformance.test';
import powerCompatibilityTest from './Integration/PowerCompatibility.test';
import powerInputInteractionTest from './PowerDialog/PowerInputInteraction.test';

export default function testsuite(): void {
  powerDialogUITest();
  powerOperationsTest();
  extensionLifecycleTest();
  eventHandlingTest();
  performanceStressTest();
  integrationTestingTest();
  boundaryErrorTestingTest();
  securityAccessibilityTest();
  comprehensiveRegressionTest();
  advancedScenariosTest();
  powerModelDeepTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  commonEventUtilValidationTest();
  configurationManagerValidationTest();
  focusManagerValidationTest();
  dialogStateManagerValidationTest();
  resourceLoaderValidationTest();
  animationControllerValidationTest();
  focusNavigationTest();
  touchInteractionTest();
  dialogStateManagementTest();
  powerOperationFlowTest();
  uiComponentRenderingTest();
  sessionManagementTest();
  errorRecoveryTest();
  accessibilityNavigationTest();
  visualEffectsTest();
  dataBindingTest();
  concurrencyControlTest();
  resourceManagementTest();
  configurationChangesTest();
  userScenariosTest();
  memoryLeakDetectionTest();
  longTermStabilityTest();
  systemIntegrationTest();
  networkConnectivityTest();
  deviceCompatibilityTest();
  powerConsumptionTest();
  securityValidationTest();
  animationPerformanceTest();
  statePersistenceTest();
  inputValidationTest();
  exceptionHandlingTest();
  localizationTestingTest();
  themeVariationTest();
  gestureRecognitionTest();
  dialogPositioningTest();
  contentScalingTest();
  focusRingBehaviorTest();
  buttonInteractionTest();
  dialogLifecycleTest();
  eventPropagationTest();
  stateRecoveryTest();
  powerItemInfoModelTest();
  powerOperationCatalogTest();
  powerMenuConfigurationTest();
  powerDialogStateManagementTest();
  powerOperationWorkflowTest();
  powerDialogConcurrencyTest();
  powerDialogStressTest();
  powerDialogConsistencyTest();
  powerDialogLifecycleTest();
  powerDialogErrorRecoveryTest();
  powerDialogEndToEndTest();
  powerEventToolValidationTest();
  powerDataSourceValidationTest();
  powerSessionValidationTest();
  powerAppVersionTest();
  powerAuthSessionTest();
  powerNotificationTest();
  powerInterruptionRecoveryTest();
  powerOfflineNetworkTest();
  powerSecurityTest();
  powerPerformanceTest();
  powerCompatibilityTest();
  powerInputInteractionTest();
}
