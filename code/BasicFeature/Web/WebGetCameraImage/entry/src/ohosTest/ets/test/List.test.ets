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

import webCameraUITest from './WebCamera/WebCameraUI.test';
import cameraOperationsTest from './WebCamera/CameraOperations.test';
import extensionLifecycleTest from './LifecycleState/ExtensionLifecycle.test';
import eventHandlingTest from './Interaction/EventHandling.test';
import performanceStressTest from './PerformanceStability/PerformanceStress.test';
import integrationTestingTest from './Integration/IntegrationTesting.test';
import boundaryErrorTestingTest from './Validation/BoundaryErrorTesting.test';
import securityAccessibilityTest from './Security/SecurityAccessibility.test';
import comprehensiveRegressionTest from './Integration/ComprehensiveRegression.test';
import advancedScenariosTest from './Integration/AdvancedScenarios.test';
import cameraModelDeepTest from './WebCamera/CameraModelDeep.test';
import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import loggerValidationTest from './Validation/LoggerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import commonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import configurationManagerValidationTest from './Validation/ConfigurationManagerValidation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import webviewStateManagerValidationTest from './Validation/WebViewStateManagerValidation.test';
import resourceLoaderValidationTest from './Validation/ResourceLoaderValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import touchInteractionTest from './Interaction/TouchInteraction.test';
import webviewStateManagementTest from './LifecycleState/WebViewStateManagement.test';
import cameraOperationFlowTest from './WebCamera/CameraOperationFlow.test';
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
import cameraConsumptionTest from './PerformanceStability/CameraConsumption.test';
import securityValidationTest from './Security/SecurityValidation.test';
import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';
import statePersistenceTest from './LifecycleState/StatePersistence.test';
import inputValidationTest from './Validation/InputValidation.test';
import exceptionHandlingTest from './LifecycleState/ExceptionHandling.test';
import localizationTestingTest from './Integration/LocalizationTesting.test';
import themeVariationTest from './Interaction/ThemeVariation.test';
import gestureRecognitionTest from './Interaction/GestureRecognition.test';
import webviewPositioningTest from './Interaction/WebViewPositioning.test';
import contentScalingTest from './Interaction/ContentScaling.test';
import focusRingBehaviorTest from './Interaction/FocusRingBehavior.test';
import buttonInteractionTest from './Interaction/ButtonInteraction.test';
import webviewLifecycleTest from './LifecycleState/WebViewLifecycle.test';
import eventPropagationTest from './Interaction/EventPropagation.test';
import stateRecoveryTest from './LifecycleState/StateRecovery.test';
import cameraItemInfoModelTest from './WebCamera/CameraItemInfoModel.test';
import cameraOperationCatalogTest from './WebCamera/CameraOperationCatalog.test';
import cameraMenuConfigurationTest from './WebCamera/CameraMenuConfiguration.test';
import webCameraStateManagementTest from './WebCamera/WebCameraStateManagement.test';
import cameraOperationWorkflowTest from './WebCamera/CameraOperationWorkflow.test';
import webCameraConcurrencyTest from './WebCamera/WebCameraConcurrency.test';
import webCameraStressTest from './WebCamera/WebCameraStress.test';
import webCameraConsistencyTest from './WebCamera/WebCameraConsistency.test';
import webCameraLifecycleTest from './WebCamera/WebCameraLifecycle.test';
import webCameraErrorRecoveryTest from './WebCamera/WebCameraErrorRecovery.test';
import webCameraEndToEndTest from './WebCamera/WebCameraEndToEnd.test';
import cameraEventToolValidationTest from './CameraValidation/CameraEventToolValidation.test';
import cameraDataSourceValidationTest from './CameraValidation/CameraDataSourceValidation.test';
import cameraSessionValidationTest from './CameraValidation/CameraSessionValidation.test';
import cameraAppVersionTest from './CameraValidation/CameraAppVersion.test';
import cameraAuthSessionTest from './CameraValidation/CameraAuthSession.test';
import cameraNotificationTest from './CameraValidation/CameraNotification.test';
import cameraInterruptionRecoveryTest from './CameraValidation/CameraInterruptionRecovery.test';
import cameraOfflineNetworkTest from './CameraValidation/CameraOfflineNetwork.test';
import cameraSecurityTest from './Security/CameraSecurity.test';
import cameraPerformanceTest from './PerformanceStability/CameraPerformance.test';
import cameraCompatibilityTest from './Integration/CameraCompatibility.test';
import cameraInputInteractionTest from './WebCamera/CameraInputInteraction.test';
import webCameraCoreFeatureTest from './WebCamera/WebCameraCoreFeature.test';

export default function testsuite(): void {
  webCameraUITest();
  cameraOperationsTest();
  extensionLifecycleTest();
  eventHandlingTest();
  performanceStressTest();
  integrationTestingTest();
  boundaryErrorTestingTest();
  securityAccessibilityTest();
  comprehensiveRegressionTest();
  advancedScenariosTest();
  cameraModelDeepTest();
  keyCodeValidationTest();
  loggerValidationTest();
  pointerUtilValidationTest();
  commonEventUtilValidationTest();
  configurationManagerValidationTest();
  focusManagerValidationTest();
  webviewStateManagerValidationTest();
  resourceLoaderValidationTest();
  animationControllerValidationTest();
  focusNavigationTest();
  touchInteractionTest();
  webviewStateManagementTest();
  cameraOperationFlowTest();
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
  cameraConsumptionTest();
  securityValidationTest();
  animationPerformanceTest();
  statePersistenceTest();
  inputValidationTest();
  exceptionHandlingTest();
  localizationTestingTest();
  themeVariationTest();
  gestureRecognitionTest();
  webviewPositioningTest();
  contentScalingTest();
  focusRingBehaviorTest();
  buttonInteractionTest();
  webviewLifecycleTest();
  eventPropagationTest();
  stateRecoveryTest();
  cameraItemInfoModelTest();
  cameraOperationCatalogTest();
  cameraMenuConfigurationTest();
  webCameraStateManagementTest();
  cameraOperationWorkflowTest();
  webCameraConcurrencyTest();
  webCameraStressTest();
  webCameraConsistencyTest();
  webCameraLifecycleTest();
  webCameraErrorRecoveryTest();
  webCameraEndToEndTest();
  cameraEventToolValidationTest();
  cameraDataSourceValidationTest();
  cameraSessionValidationTest();
  cameraAppVersionTest();
  cameraAuthSessionTest();
  cameraNotificationTest();
  cameraInterruptionRecoveryTest();
  cameraOfflineNetworkTest();
  cameraSecurityTest();
  cameraPerformanceTest();
  cameraCompatibilityTest();
  cameraInputInteractionTest();
  webCameraCoreFeatureTest();
}
